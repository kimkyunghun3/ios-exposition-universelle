import UIKit

class InformationStackView: UIStackView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp(data: ExpoInformation) {
        self.spacing = 10
        
        titleLabel.textAlignment = .center
        visitorsLabel.textAlignment = .center
        locationLabel.textAlignment = .center
        durationLabel.textAlignment = .center
        
        titleLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 0
        
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        
        titleLabel.text = data.title
        posterImageView.image = UIImage(named: "poster")
        visitorsLabel.text = "방문객 : " + DecimalNumberFormatter.string(for: data.visitors) + " 명"
        locationLabel.text = "개최지 : " + data.location
        durationLabel.text = "개최 기간 : " + data.duration
        descriptionLabel.text = data.description
    }
}
