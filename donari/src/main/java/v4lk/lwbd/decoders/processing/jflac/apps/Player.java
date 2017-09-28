package v4lk.lwbd.decoders.processing.jflac.apps;

/* libFLAC - Free Lossless Audio Codec library
 * Copyright (C) 2000,2001,2002,2003  Josh Coalson
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA  02111-1307, USA.
 */


import v4lk.lwbd.decoders.processing.jflac.FLACDecoder;
import v4lk.lwbd.decoders.processing.jflac.PCMProcessor;
import v4lk.lwbd.decoders.processing.jflac.metadata.StreamInfo;
import v4lk.lwbd.decoders.processing.jflac.util.ByteData;

import javax.sound.sampled.*;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Vector;


/**
 * Play a FLAC file application.
 * @author kc7bfi
 */
public class Player implements PCMProcessor {
    private AudioFormat fmt;
    private DataLine.Info info;
    private SourceDataLine line;
	private Vector listeners = new Vector();
    

	public void addListener (LineListener listener)
	{
		listeners.add(listener);
	}
    /**
     * Decode and play an input FLAC file.
     * @param inFileName    The input FLAC file name
     * @throws java.io.IOException  Thrown if error reading file
     * @throws javax.sound.sampled.LineUnavailableException Thrown if error playing file
     */
    public void decode(String inFileName) throws IOException, LineUnavailableException {
//        System.out.println("Play [" + inFileName + "]");
        FileInputStream is = new FileInputStream(inFileName);
        
        FLACDecoder decoder = new FLACDecoder(is);
        decoder.addPCMProcessor(this);
        try {
            decoder.decode();
        } catch (EOFException e) {
            // skip
        }
        
        line.drain();
        line.close();

	    //  We're going to clear out the list of listeners as well, so that everytime through
	    //  things are basically at the same starting point.
	    listeners.clear();
    }
    
    /**
     * Process the StreamInfo block.
     * @param streamInfo the StreamInfo block
     * @see v4lk.lwbd.decoders.processing.jflac.PCMProcessor#processStreamInfo(v4lk.lwbd.decoders.processing.jflac.metadata.StreamInfo)
     */
    public void processStreamInfo(StreamInfo streamInfo) {
        try {
            fmt = streamInfo.getAudioFormat();
            info = new DataLine.Info(SourceDataLine.class, fmt, AudioSystem.NOT_SPECIFIED);
            line = (SourceDataLine) AudioSystem.getLine(info);

	        //  Add the listeners to the line at this point, it's the only
	        //  way to get the events triggered.
	        int size = listeners.size();
	        for (int index = 0; index < size; index++)
	            line.addLineListener((LineListener) listeners.get(index));

            line.open(fmt, AudioSystem.NOT_SPECIFIED);
            line.start();
        } catch (LineUnavailableException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Process the decoded PCM bytes.
     * @param pcm The decoded PCM data
     * @see v4lk.lwbd.decoders.processing.jflac.PCMProcessor#processPCM(org.kc7bfi.jflac.util.ByteSpace)
     */
    public void processPCM(ByteData pcm) {
        line.write(pcm.getData(), 0, pcm.getLen());
    }
    

	public void removeListener (LineListener listener)
	{
		listeners.removeElement(listener);
	}


    /**
     * The main routine.
     * <p>args[0] is the input file name
     * @param args  Command line arguments
     */
    public static void main(String[] args) {
        try {
            Player decoder = new Player();
            
            for (int i = 0; i < args.length; i++)
                decoder.decode(args[i]);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (LineUnavailableException e) {
            e.printStackTrace();
        }
        
        System.exit(0);
    }
}
