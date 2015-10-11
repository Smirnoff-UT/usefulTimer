import UIKit

// URLで画像を取得

let image = UIImage(named: "nap.jpg")!


// そのまま表示
let view1: UIImageView = UIImageView(frame: CGRectMake(0,0,300,300))
view1.image = image

// リサイズ
let size = CGSize(width: 150, height: 150)
UIGraphicsBeginImageContext(size)
image.drawInRect(CGRectMake(0, 0, size.width, size.height))
var resizeImage = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
let view2: UIImageView = UIImageView(frame: CGRectMake(0,0,150,150))
view2.image = resizeImage

// クリッピング
let cropCGImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(150, 150, 300, 300))
var cropImage = UIImage(CGImage: cropCGImageRef!)
let view3: UIImageView = UIImageView(frame: CGRectMake(0,0,150,150))
view3.image = cropImage

// 回転
var rotateImage = UIImage(CGImage: image.CGImage!, scale: 1.0, orientation: UIImageOrientation.Right)
let view4: UIImageView = UIImageView(frame: CGRectMake(0, 0, 300, 300))
view4.image = rotateImage

// 色塗りつぶし
UIGraphicsBeginImageContext(size)
let cgContextRef = UIGraphicsGetCurrentContext()
CGContextSetFillColorWithColor(cgContextRef, UIColor.grayColor().CGColor)
CGContextSetAlpha(cgContextRef, 0.8)
CGContextFillRect(cgContextRef, CGRectMake(0, 0, 300, 300))
let colorImage = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
let view5: UIImageView = UIImageView(frame: CGRectMake(0,0,300,300))
view5.image = colorImage
