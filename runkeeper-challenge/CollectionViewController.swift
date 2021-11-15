//
//  CollectionViewController.swift
//  runkeeper-challenge
//
//  Created by Leandro Falbo Barros on 2021-11-13.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var medalList:Array = [Dictionary<String, [Medal]>()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medalList = loadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return medalList.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = medalList[section].first?.value.count else { return 0 }
        return count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let medalCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        let values = medalList[indexPath.section].values.first
        let item = values![indexPath.row]
        medalCell.cellInit(image: item.image!, title: item.title, description: item.description, medalEnable: item.enable)
        
        return medalCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
        
        let nameSection = medalList[indexPath.section].keys.first!
        let medals = medalList[indexPath.section].values.first!
        
        let textCountMedal = createTextCount(medals: medals)
        sectionHeaderView.cellInit(titleSection: nameSection, medalQty: textCountMedal)
        
        return sectionHeaderView
    }
    
    func loadData() -> [Dictionary<String, [Medal]>] {
        
        let item1 = Medal(image: #imageLiteral(resourceName: "longest_run"),title: "Longest Run", description: "00:00", enable: true)
        let item2 = Medal(image: #imageLiteral(resourceName: "highest_elevation"),title: "Highest Elevation", description: "2095 ft", enable: true)
        let item3 = Medal(image: #imageLiteral(resourceName: "fastest_5k"),title: "Fastest 5k", description: "00:00", enable: true)
        let item4 = Medal(image: #imageLiteral(resourceName: "fastest_10k"),title: "10K", description: "00:00:00", enable: true)
        let item5 = Medal(image: #imageLiteral(resourceName: "fastest_half_marathon"),title: "Half Marathon", description: "00:00", enable: true)
        let item6 = Medal(image: #imageLiteral(resourceName: "fastest_marathon"),title: "Marathon", description: "Not Yet", enable: false)
        
        let listItensPersonalRecord = [item1, item2, item3, item4, item5, item6]
        
        let categoryPersonalRecords: Dictionary<String, [Medal]> = ["Personal Records" : listItensPersonalRecord]
        
        let item7 = Medal(image: #imageLiteral(resourceName: "virtual_half_marathon_race"),title: "Virtual Half Marathon Race", description: "00:00", enable: true)
        let item8 = Medal(image: #imageLiteral(resourceName: "tokyo-hakone-ekiden-2020"),title: "Tokyo-Hakone Ekiden 2020", description: "00:00:00", enable: true)
        let item9 = Medal(image: #imageLiteral(resourceName: "virtual_10k_race"),title: "Virtual 10k Race", description: "00:00:00", enable: true)
        let item10 = Medal(image: #imageLiteral(resourceName: "hakone_ekiden"),title: "Hakone Ekiden", description: "00:00:00", enable: true)
        let item11 = Medal(image: #imageLiteral(resourceName: "mizuno_singapore_ekiden"),title: "Mizuno Singapore Ekiden 2015", description: "00:00:00", enable: true)
        let item12 = Medal(image: #imageLiteral(resourceName: "virtual_5k_race"),title: "Virtual 5K Race", description: "23:07", enable: true)
        
        let listItensVirtualRaces = [item7, item8, item9, item10, item11, item12]
        
        let categoryVirtualRaces: Dictionary<String, [Medal]> = ["Virtual Races" : listItensVirtualRaces]
        
        return  [categoryPersonalRecords, categoryVirtualRaces]
    }
    
    func createTextCount( medals : [Medal]) -> String {
        
        let qtyMedalTotal = medals.count
        let medalsEnable = (medals.filter { $0.enable }).count
        
        var textCountMedal = ""
        if(qtyMedalTotal != medalsEnable){
            textCountMedal = "\(medalsEnable) of \(qtyMedalTotal)"
        }
        
        return textCountMedal
    }
    
}
