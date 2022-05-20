package javacode;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

public class analysisQRcode {
	
	public static final int QRCODE_SIZE = 300;
	
	public static void readQRcode(String filepath) {
		 
		MultiFormatReader multiFormatReader = new MultiFormatReader();
		File file = new File(filepath); 
		BufferedImage image = null;
		BinaryBitmap binaryBitmap = null; 
		Result result = null;
		try {
			image = ImageIO.read(file);
			binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image)));
			result = multiFormatReader.decode(binaryBitmap);
		} catch (IOException | NotFoundException e1) {
			e1.printStackTrace();
		}	
		System.out.println(result.getText());
	}

	public static void main(String[] args) {
		String filepath =  "G:\\JZW\\STUDY\\2022_Spring\\Project\\DPworkspace\\java\\QRcode" + File.separator + "123.jpg";
		readQRcode(filepath);	
	}

}
