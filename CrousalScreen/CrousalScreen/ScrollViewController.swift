
import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skipButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollViewWidth = self.view.frame.width
        
        let scrollViewHeight = scrollView.frame.size.height

        let imageOne = UIImageView(frame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        let imageTwo = UIImageView(frame:CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        let imageThree = UIImageView(frame:CGRectMake(scrollViewWidth * 2, 0, scrollViewWidth, scrollViewHeight))
        
        imageOne.image = UIImage(named:"mars")
        imageOne.contentMode = UIViewContentMode.ScaleAspectFit
        
        imageTwo.image = UIImage(named:"moon")
        imageTwo.contentMode = UIViewContentMode.ScaleAspectFit
        
        imageThree.image = UIImage(named:"mars")
        imageThree.contentMode = UIViewContentMode.ScaleAspectFit
        
        scrollView.addSubview(imageOne)
        scrollView.addSubview(imageTwo)
        scrollView.addSubview(imageThree)
        
        scrollView.contentSize = CGSizeMake(scrollViewWidth*3, scrollViewHeight)

        
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        self.pageControl.currentPageIndicatorTintColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
        if(pageControl.currentPage == 2){
            skipButton.setTitle("Got it", forState: .Normal)
        }else{
            skipButton.setTitle("Skip", forState: .Normal)
        }
    }
    
    @IBAction func skipButtonTapped(sender: AnyObject) {
        print("skipButtonTapped")
    }
    
    @IBAction func faqButtonTapped(sender: AnyObject) {
        print("faqButtonTapped")
    }

}
