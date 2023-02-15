//
//  ThemeAction.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 15.02.2023.
//

import Foundation
import UIKit

enum ThemeAction: String, CaseIterable {
    case motherland = "Motherland"
    case family = "Family"
    case wealth = "Wealth"
    case work = "Work"
    case health = "Health"


    var image: UIImage? {
        UIImage(named: rawValue)
    }

    var maqal: [Maqal] {
        switch self {
        case .motherland:
            return [
                Maqal(name: "Әркімнің өз жері — жұмақ", translate: "Родимый край для каждого — рай", isFavourite: false),
                Maqal(name: "Ерінен айырылған көмгенше жылайды, елінен айырылған өлгенше жылайды", translate: "Потерю супруга оплакивают, пока не похоронят его, потерю родины оплакивают, пока не похоронят самого", isFavourite: false),
                Maqal(name: "Туған жердің күні де ыстық, түні де ыстық", translate: "На родине и дни, и ночи прекрасны", isFavourite: false),
                Maqal(name: "Отанды сүю — отбасынан басталады", translate: "Любовь к родине у семейного очага рождается", isFavourite: false),
                Maqal(name: "Ауыл итінің құйрығы қайқы", translate: "И собака хвост трубой поднимает, если в своем ауле гуляет", isFavourite: false),
                Maqal(name: "Өз елінің иті де қадірлі", translate: "И собака в своей конуре что-то значит", isFavourite: false),
                Maqal(name: "Бірлігі жоқ ел тозар, бірлігі күшті ел озар", translate: "Разрушится страна разобщенная, устоит страна объединенная", isFavourite: false),
                Maqal(name: "Туған жердей жер болмас, туған елдей ел болмас", translate: "Нет земли лучше родины своей, лучше, чем на родине нет людей", isFavourite: false)
            ]
        case .family:
            return [
                Maqal(name: "Жаман ағайыннан жақсы жекжат артық", translate: "Хороший знакомый, хоть и неродной, лучше намного родни плохой", isFavourite: false),
                Maqal(name: "Ағайынның азары болса да, безері болмас", translate: "У родни бывают раздоры, но друг от друга не отказываются", isFavourite: false),
                Maqal(name: "Мал қонысын іздейді, ер туысын іздейді", translate: "Скот ищет хлев свой, джигит — своих родных", isFavourite: false),
                Maqal(name: "Ағайынмен алыстан сыйласқан жақсы", translate: "Родственная любовь лучше всего проявляется издалека", isFavourite: false),
                Maqal(name: "Сыйласуға жат жақсы, жыласуға өз жақсы", translate: "Радостью можно делиться с чужими, горем — лучше всего со своими", isFavourite: false),
                Maqal(name: "Қажет болса, қасапшымен туыстас", translate: "Пусть и мясник будет родичем тебе", isFavourite: false),
                Maqal(name: "Үйдің суық-жылысын қыс түскенде білерсің, кімнің жакын-алысын басыңа іс түскенде білерсің", translate: "Холодный или теплый дом — узнаешь во время зимы, кто близок тебе, кто далек — узнаешь во время беды", isFavourite: false),
                Maqal(name: "Төрт аяқтыда бота тату, екі аяқтыда бажа тату", translate: "Среди четвероногих верблюжата дружат, среди двуногих свояки дружат", isFavourite: false)
            ]
        case .wealth:
            return [
                Maqal(name: "Жоққа жүйрік жетпейді", translate: "И самому быстроногому не догнать того, чего нет", isFavourite: false),
                Maqal(name: "Ай бетінде де дақ бар", translate: "И на луне есть пятна", isFavourite: false),
                Maqal(name: "Алпыс қарсақ ат болмас", translate: "И шестьдесят корсаков коя не заменят", isFavourite: false),
                Maqal(name: "Адасқанға – жұлдыз айдай, Карны ашқанға – көже майдай", translate: "Когда заблудишься, звезды луной кажутся; когда проголодаешься, лапша маслом кажется", isFavourite: false),
                Maqal(name: "Төреге ерген ер – токымын арқалар", translate: "За вельможей последуешь на коне, а вернешься с седлом на себе", isFavourite: false),
                Maqal(name: "Қарны ашқанға Қара талқан майдай көрінеді", translate: "Голодному и только масло кажется", isFavourite: false),
                Maqal(name: "Қасық тары ботқа болмас, Ботқа болса да жұртқа жетпес", translate: "Из ложки пшена кашу не сваришь, если и сваришь, всех не накормишь", isFavourite: false),
                Maqal(name: "Қысқа жіп күрмеуге келмес", translate: "Из короткой веревки петлю не завяжешь", isFavourite: false)
            ]
        case .work:
            return [
                Maqal(name: "Еңбек етсең емерсің", translate: "Если трудишься — пожнешь", isFavourite: false),
                Maqal(name: "Бір ағаш кессең, орнына он ағаш отырғыз", translate: "Если дерево срубил одно, десять посади вместо него", isFavourite: false),
                Maqal(name: "Малды тапқанға бақтыр, отынды алғанга жақтыр", translate: "Дрова доверяй разжигать тому, кто их рубил; скот доверяй пасти тому, кто его растил", isFavourite: false),
                Maqal(name: "Жігіттің ерінгені — кұрымның көрінгені", translate: "Джигита лень до нищеты доводит", isFavourite: false),
                Maqal(name: "Істеу қиын, сынау оңай", translate: "Делать тяжело, а критиковать легко", isFavourite: false),
                Maqal(name: "Екі қолга бір жұмыс", translate: "Две руки одну работу одолеют", isFavourite: false),
                Maqal(name: "Аузымен орақ орып, кетпен шауып", translate: "Все может на словах, и ничего — на деле", isFavourite: false),
                Maqal(name: "Ерте тұрған әйелдің бір ісі артық, Ерте тұрған еркектің ырысы артық", translate: "Если женщина рано встает, на одно дело болше успеет, джигит, если рано встает, на одно счастье больше найдет", isFavourite: false),
                Maqal(name: "Арсыз күлкіге тоймас, жалқау ұйқыға тоймас", translate: "Дурень без конца смеется, а лодырь спит и не проснется", isFavourite: false),
                Maqal(name: "Жалқаудың соры — байлығы", translate: "Достаток бездельнику лени прибавит", isFavourite: false),
                Maqal(name: "Жаман болатын жігіт шегіншек келер, кедей болатын жігіт еріншек келер", translate: "Джигит плохой отступает, джигит ленивый обнищает", isFavourite: false),
                Maqal(name: "Көз қорқақ, кол батыр", translate: "Глаза боятся, а руки не знают страха", isFavourite: false)
            ]
        case .health:
            return [
                Maqal(name: "Ажал айтпай келеді, қонақ күтпей келеді", translate: "И смерть является внезапно, и гость является незвано", isFavourite: false),
                Maqal(name: "Тәні саудың жаны сау", translate: "Здоровый телом здоров и душой", isFavourite: false),
                Maqal(name: "Өтпейтін өмір жоқ, сынбайтын темір жоқ", translate: "Железа не ломающегося не бывает, не бывает существа, которое не умирает", isFavourite: false),
                Maqal(name: "Өліспеген көріседі", translate: "Если не умереть, то можно встретиться", isFavourite: false),
                Maqal(name: "Бас аман болса, бөрік табылады", translate: "Если голова твоя цела, то добро само придет", isFavourite: false),
                Maqal(name: "Екі дертің бір келсе, ажалыңнын жеткені", translate: "Две болезни придут — смерть с собою приведут", isFavourite: false)
            ]
        }
    }




    //    struct Names {
    //        let name: String
    //        let tr: String
    //    }

    //    var themeName: String {
    //        switch self {
    //        case .family:
    //            return "Otbasy"
    //        }
    //    }
    //
    //    var themeTranslate: String {
    //        switch self {
    //        case .family:
    //            return "7YA"
    //        }
    //    }
    //
    //    var themeNameAndTranslate: [Names] {
    //        switch self {
    //        case .family:
    //            return [Names(name: "Otb", tr: "7")]
    //        }
    //    }

}


