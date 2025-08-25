
import 'package:desafio/pokemons.dart';
import 'package:flutter/services.dart';







class ChartModel extends Pokemons{
  final String nome;
  final List<String> elementos;
  final List<Color> elementoCor;
  final String iconPath;
  final String descricao;
  final String species;
  
  ChartModel({
    required this.nome,
    required this.elementos,
    required this.elementoCor,
    required this.iconPath,
    required this.descricao,
    required this.species,
  });
  
  static List<ChartModel> getModel() {
    
    List<ChartModel> models = [];
    
    
    // Minimize ambas as listas
    late Map<String, Color> corPorelementoCor = {
      'grass'   :Color.fromRGBO( 119, 204,  85, 1),
      'poison'  :Color.fromRGBO( 170,  85, 153, 1),
      'fire'    :Color.fromRGBO( 255,  68,  34, 1),
      'flying'  :Color.fromRGBO( 136, 153, 255, 1),
      'water'   :Color.fromRGBO(  51, 153, 255, 1),
      'bug'     :Color.fromRGBO( 170, 187,  34, 1),
      'normal'  :Color.fromRGBO( 170, 170, 153, 1),
      'electric':Color.fromRGBO( 255, 204,  51, 1),
      'ground'  :Color.fromRGBO( 221, 187,  85, 1),
      'fighting':Color.fromRGBO( 185,  84,  67, 1),
      'psychic' :Color.fromRGBO( 255,  85, 153, 1),
      'rock'    :Color.fromRGBO( 187, 170, 102, 1),
      'ice'     :Color.fromRGBO( 102, 204, 255, 1),
      'ghost'   :Color.fromRGBO( 102, 102, 187, 1),
      'dragon'  :Color.fromRGBO( 119, 102, 238, 1),
      'fairy'   :Color.fromRGBO( 238, 153, 238, 1),
      'steel'   :Color.fromRGBO( 170, 170, 187, 1),
      'dark'    :Color.fromRGBO( 119,  85,  68, 1),
     }; 
    // essa só esta aqui pois não consegui ler o aquivo csv
    List<List<dynamic>> pokemonIDS=[
  ["id","name","ntype","type2" ,"type3", "description","species"],
  ["1", "Bulbasaur", "2", "grass", "poison", "Uma semente estranha foi plantada em suas costas ao nascer. A planta brota e cresce com este Pokémon.", "Seed Pokémon"],
  ["2", "Ivysaur", "2", "grass", "poison", "Quando o bulbo em suas costas cresce muito, ele parece perder a capacidade de ficar de pé nas patas traseiras.", "Seed Pokémon"],
  ["3", "Venusaur", "2", "grass", "poison", "A planta floresce quando está saudável e enfraquece quando não está. Seu perfume atrai outros Pokémon.", "Seed Pokémon"],
  ["4", "Charmander", "1", "fire", "None", "Prefere claramente lugares quentes. Quando chove, diz-se que sai vapor da ponta de sua cauda.", "Lizard Pokémon"],
  ["5", "Charmeleon", "1", "fire", "None", "Quando está saudável, a chama em sua cauda queima mais forte. Ela enfraquece quando a chama diminui.", "Flame Pokémon"],
  ["6", "Charizard", "2", "fire", "flying", "Cospe fogo quente o suficiente para derreter rochas. É conhecido por causar incêndios florestais sem querer.", "Flame Pokémon"],
  ["7", "Squirtle", "1", "water", "None", "Após o nascimento, suas costas incham e endurecem formando uma concha. Jorra espuma com força pela boca.", "Tiny Turtle Pokémon"],
  ["8", "Wartortle", "1", "water", "None", "Muitas vezes se esconde na água para perseguir presas desavisadas. Para nadar rápido, move as orelhas para manter o equilíbrio.", "Turtle Pokémon"],
  ["9", "Blastoise", "1", "water", "None", "Um Pokémon brutal com jatos de água pressurizada em sua concha. Eles são usados para investidas em alta velocidade.", "Shellfish Pokémon"],
  ["10", "Caterpie", "1", "bug", "None", "Seus pés curtos têm ventosas que permitem escalar encostas e paredes incansavelmente.", "Worm Pokémon"],
  ["11", "Metapod", "1", "bug", "None", "Este Pokémon é vulnerável a ataques enquanto sua concha está mole, expondo seu corpo fraco e sensível.", "Cocoon Pokémon"],
  ["12", "Butterfree", "2", "bug", "flying", "Em batalha, bate suas asas em alta velocidade para liberar um pó altamente tóxico no ar.", "Butterfly Pokémon"],
  ["13", "Weedle", "2", "bug", "poison", "Frequentemente encontrado em florestas, comendo folhas. Tem um ferrão venenoso e afiado na cabeça.", "Hairy Bug Pokémon"],
  ["14", "Kakuna", "2", "bug", "poison", "Quase incapaz de se mover, este Pokémon só pode endurecer sua concha para se proteger de predadores.", "Cocoon Pokémon"],
  ["15", "Beedrill", "2", "bug", "poison", "Voa em alta velocidade e ataca usando seus grandes ferrões venenosos nas patas dianteiras e na cauda.", "Poison Bee Pokémon"],
  ["16", "Pidgey", "2", "normal", "flying", "Comum em florestas e bosques. Bate as asas no nível do chão para levantar areia ofuscante.", "Tiny Bird Pokémon"],
  ["17", "Pidgeotto", "2", "normal", "flying", "Muito protetor de sua vasta área territorial, este Pokémon bicará ferozmente qualquer intruso.", "Bird Pokémon"],
  ["18", "Pidgeot", "2", "normal", "flying", "Quando caça, desliza pela superfície da água em alta velocidade para capturar presas desavisadas como Magikarp.", "Bird Pokémon"],
  ["19", "Rattata", "1", "normal", "None", "Morde qualquer coisa quando ataca. Pequeno e muito rápido, é uma visão comum em muitos lugares.", "Mouse Pokémon"],
  ["20", "Raticate", "1", "normal", "None", "Usa seus bigodes para manter o equilíbrio. Aparentemente, fica mais lento se eles forem cortados.", "Mouse Pokémon"],
  ["21", "Spearow", "2", "normal", "flying", "Come insetos em áreas de grama. Precisa bater suas asas curtas em alta velocidade para se manter no ar.", "Tiny Bird Pokémon"],
  ["22", "Fearow", "2", "normal", "flying", "Com suas asas enormes e magníficas, pode permanecer no ar sem nunca precisar pousar para descansar.", "Beak Pokémon"],
  ["23", "Ekans", "1", "poison", "None", "Move-se silenciosa e furtivamente. Come os ovos de pássaros, como Pidgey e Spearow, inteiros.", "Snake Pokémon"],
  ["24", "Arbok", "1", "poison", "None", "Dizem que as marcas de alerta ferozes em sua barriga variam de região para região.", "Cobra Pokémon"],
  ["25", "Pikachu", "1", "electric", "None", "Quando vários desses Pokémon se reúnem, sua eletricidade pode acumular e causar tempestades de raios.", "Mouse Pokémon"],
  ["26", "Raichu", "1", "electric", "None", "Sua longa cauda serve como aterramento para protegê-lo de sua própria energia de alta voltagem.", "Mouse Pokémon"],
  ["27", "Sandshrew", "1", "ground", "None", "Cava profundamente no subsolo em locais áridos, longe da água. Só emerge para caçar comida.", "Mouse Pokémon"],
  ["28", "Sandslash", "1", "ground", "None", "Enrola-se em uma bola espinhosa quando ameaçado. Pode rolar enquanto enrolado para atacar ou fugir.", "Mouse Pokémon"],
  ["29", "Nidoran", "1", "poison", "None", "Embora pequeno, seus espinhos venenosos tornam este Pokémon perigoso. A fêmea tem chifres menores.", "Poison Pin Pokémon"],
  ["30", "Nidorina", "1", "poison", "None", "O chifre da fêmea se desenvolve lentamente. Prefere ataques físicos, como arranhar e morder.", "Poison Pin Pokémon"],
  ["31", "Nidoqueen", "2", "poison", "ground", "Suas escamas duras oferecem forte proteção. Usa seu corpo robusto para executar movimentos poderosos.", "Drill Pokémon"],
  ["32", "Nidoran", "1", "poison", "None", "Endurece suas orelhas para sentir perigo. Quanto maiores seus chifres, mais poderoso é seu veneno.", "Poison Pin Pokémon"],
  ["33", "Nidorino", "1", "poison", "None", "Um Pokémon agressivo que ataca rapidamente. O chifre em sua cabeça secreta um veneno poderoso.", "Poison Pin Pokémon"],
  ["34", "Nidoking", "2", "poison", "ground", "Usa sua cauda poderosa em batalha para esmagar, contrair e quebrar os ossos da presa.", "Drill Pokémon"],
  ["35", "Clefairy", "1", "normal", "None", "Seu charme mágico e fofo tem muitos admiradores. É raro e encontrado apenas em certas áreas.", "Fairy Pokémon"],
  ["36", "Clefable", "1", "normal", "None", "Um Pokémon fada tímido que é raramente visto. Foge e se esconde ao perceber pessoas.", "Fairy Pokémon"],
  ["37", "Vulpix", "1", "fire", "None", "Ao nascer, tem apenas uma cauda. A cauda se divide a partir da ponta conforme envelhece.", "Fox Pokémon"],
  ["38", "Ninetales", "1", "fire", "None", "Muito inteligente e vingativo. Pegar uma de suas muitas caudas pode resultar em uma maldição de mil anos.", "Fox Pokémon"],
  ["39", "Jigglypuff", "1", "normal", "None", "Quando seus olhos enormes se iluminam, canta uma melodia misteriosamente calmante que adormece seus inimigos.", "Balloon Pokémon"],
  ["40", "Wigglytuff", "1", "normal", "None", "Seu corpo é macio e elástico. Quando irritado, inala ar e infla até um tamanho enorme.", "Balloon Pokémon"],
  ["41", "Zubat", "2", "poison", "flying", "Forma colônias em lugares perpetuamente escuros. Usa ondas ultrassônicas para identificar e se aproximar de alvos.", "Bat Pokémon"],
  ["42", "Golbat", "2", "poison", "flying", "Uma vez que ataca, não para de drenar a energia da vítima, mesmo que fique pesado demais para voar.", "Bat Pokémon"],
  ["43", "Oddish", "2", "grass", "poison", "Durante o dia, mantém o rosto enterrado no solo, mas à noite, vagueia espalhando suas sementes.", "Weed Pokémon"],
  ["44", "Gloom", "2", "grass", "poison", "O fluido que escorre de sua boca não é saliva. É um néctar usado para atrair presas.", "Weed Pokémon"],
  ["45", "Vileplume", "2", "grass", "poison", "Quanto maiores suas pétalas, mais pólen tóxico contém. Sua cabeça grande é pesada e difícil de sustentar.", "Flower Pokémon"],
  ["46", "Paras", "2", "bug", "grass", "Cava para chupar raízes de árvores. Os cogumelos em suas costas crescem extraindo nutrientes do hospedeiro.", "Mushroom Pokémon"],
  ["47", "Parasect", "2", "bug", "grass", "Um par hospedeiro-parasita em que o cogumelo assumiu o controle do inseto. Prefere lugares úmidos.", "Mushroom Pokémon"],
  ["48", "Venonat", "2", "bug", "poison", "É coberto por um pelo especial que funciona como radar. Pode ver no escuro e detectar objetos distantes.", "Insect Pokémon"],
  ["49", "Venomoth", "2", "bug", "poison", "As escamas em forma de pó em suas asas são codificadas por cores para indicar os tipos de veneno que possui.", "Poison Moth Pokémon"],
  ["50", "Diglett", "1", "ground", "None", "Vive a cerca de um metro no subsolo, onde se alimenta de raízes de plantas. Às vezes aparece acima do solo.", "Mole Pokémon"],
  ["51", "Dugtrio", "1", "ground", "None", "Um trio que pode cavar a mais de 100 km/h. Por isso, alguns pensam que é um terremoto.", "Mole Pokémon"],
  ["52", "Meowth", "1", "normal", "None", "Adora objetos circulares. Vagueia pelas ruas à noite em busca de moedas perdidas.", "Scratch Cat Pokémon"],
  ["53", "Persian", "1", "normal", "None", "Embora seu pelo tenha muitos admiradores, é difícil criá-lo como animal de estimação devido à sua natureza instável.", "Classy Cat Pokémon"],
  ["54", "Psyduck", "1", "water", "None", "Enquanto distrai seus inimigos com um olhar vago, este Pokémon astuto usa poderes psicocinéticos.", "Duck Pokémon"],
  ["55", "Golduck", "1", "water", "None", "Frequentemente visto nadando elegantemente em margens de lagos. É confundido com o monstro japonês Kappa.", "Duck Pokémon"],
  ["56", "Mankey", "1", "fighting", "None", "Extremamente rápido para se irritar. Pode estar calmo em um momento e enfurecido no próximo.", "Pig Monkey Pokémon"],
  ["57", "Primeape", "1", "fighting", "None", "Sempre furioso e tenaz. Não desiste de perseguir sua presa até capturá-la.", "Pig Monkey Pokémon"],
  ["58", "Growlithe", "1", "fire", "None", "Muito protetor de seu território. Late e morde para repelir intrusos de seu espaço.", "Puppy Pokémon"],
  ["59", "Arcanine", "1", "fire", "None", "Um Pokémon admirado desde o passado por sua beleza. Corre agilmente como se tivesse asas.", "Legendary Pokémon"],
  ["60", "Poliwag", "1", "water", "None", "Suas pernas recém-crescidas o impedem de correr. Parece preferir nadar a tentar ficar de pé.", "Tadpole Pokémon"],
  ["61", "Poliwhirl", "1", "water", "None", "Capaz de viver dentro ou fora da água. Fora da água, sua para manter o corpo viscoso.", "Tadpole Pokémon"],
  ["62", "Poliwrath", "2", "water", "fighting", "Um nadador habilidoso no crawl e no nado de peito. Supera facilmente os melhores nadadores humanos.", "Tadpole Pokémon"],
  ["63", "Abra", "1", "psychic", "None", "Usando sua habilidade de ler mentes, identifica perigos iminentes e se teletransporta para segurança.", "Psi Pokémon"],
  ["64", "Kadabra", "1", "psychic", "None", "Emite ondas alfa especiais de seu corpo que causam dores de cabeça apenas por estar por perto.", "Psi Pokémon"],
  ["65", "Alakazam", "1", "psychic", "None", "Seu cérebro pode superar um supercomputador. Seu quociente de inteligência é dito ser 5.000.", "Psi Pokémon"],
  ["66", "Machop", "1", "fighting", "None", "Adora fortalecer seus músculos treinando em qualquer clima. Treina até na neve ou chuva.", "Superpower Pokémon"],
  ["67", "Machoke", "1", "fighting", "None", "Seu corpo musculoso é tão poderoso que precisa usar um cinto para regular seus movimentos.", "Superpower Pokémon"],
  ["68", "Machamp", "1", "fighting", "None", "Usando seus músculos pesados, lança socos poderosos que podem mandar a vítima para além do horizonte.", "Superpower Pokémon"],
  ["69", "Bellsprout", "2", "grass", "poison", "Um Pokémon carnívoro que captura e come insetos. Usa seus pés de raiz para absorver umidade.", "Flower Pokémon"],
  ["70", "Weepinbell", "2", "grass", "poison", "Cospe pó venenoso para imobilizar o inimigo e depois o finaliza com um jato de ácido.", "Flycatcher Pokémon"],
  ["71", "Victreebel", "2", "grass", "poison", "Dizem que vive em colônias enormes nas selvas, embora ninguém tenha retornado de lá.", "Flycatcher Pokémon"],
  ["72", "Tentacool", "2", "water", "poison", "Flutua em mares rasos. Pescadores que o fisgam por acidente são punidos por seu ácido ardente.", "Jellyfish Pokémon"],
  ["73", "Tentacruel", "2", "water", "poison", "Seus tentáculos são normalmente mantidos curtos. Em caçadas, são estendidos para enredar e imobilizar presas.", "Jellyfish Pokémon"],
  ["74", "Geodude", "2", "rock", "ground", "Encontrado em campos e montanhas. Confundidos com pedras, as pessoas frequentemente tropeçam neles.", "Rock Pokémon"],
  ["75", "Graveler", "2", "rock", "ground", "Rola por encostas para se mover. Passa por qualquer obstáculo sem desacelerar ou mudar de curso.", "Rock Pokémon"],
  ["76", "Golem", "2", "rock", "ground", "Seu corpo de pedra é extremamente duro. Pode resistir facilmente a explosões de dinamite sem danos.", "Megaton Pokémon"],
  ["77", "Ponyta", "1", "fire", "None", "Seus cascos são 10 vezes mais duros que diamantes. Pode esmagar qualquer coisa completamente em instantes.", "Fire Horse Pokémon"],
  ["78", "Rapidash", "1", "fire", "None", "Muito competitivo, este Pokémon perseguirá qualquer coisa que se mova mais rápido, na esperança de correr contra ela.", "Fire Horse Pokémon"],
  ["79", "Slowpoke", "2", "water", "psychic", "Incrivelmente lento e atrapalhado. Leva 5 segundos para sentir dor quando está sob ataque.", "Dopey Pokémon"],
  ["80", "Slowbro", "2", "water", "psychic", "O Shellder preso à cauda de Slowpoke se alimenta dos restos do hospedeiro, segundo dizem.", "Hermit Crab Pokémon"],
  ["81", "Magnemite", "1", "electric", "None", "Usa antigravidade para ficar suspenso. Aparece sem aviso e usa movimentos como Thunder Wave.", "Magnet Pokémon"],
  ["82", "Magneton", "1", "electric", "None", "Formado por vários Magnemite ligados. Aparece frequentemente quando há explosões solares.", "Magnet Pokémon"],
  ["83", "Farfetchd", "2", "normal", "flying", "O ramo de cebolinha que segura é sua arma. É usado como uma espada de metal.", "Wild Duck Pokémon"],
  ["84", "Doduo", "2", "normal", "flying", "Um pássaro que compensa sua má habilidade de voo com sua rápida velocidade a pé. Deixa pegadas gigantes.", "Twin Bird Pokémon"],
  ["85", "Dodrio", "2", "normal", "flying", "Usa seus três cérebros para executar planos complexos. Enquanto duas cabeças dormem, uma permanece acordada.", "Triple Bird Pokémon"],
  ["86", "Seel", "1", "water", "None", "Quanto mais fria a temperatura, mais energético ele fica. Adora nadar em mares gelados.", "Sea Lion Pokémon"],
  ["87", "Dewgong", "2", "water", "ice", "Armazena energia térmica em seu corpo. Nada a 8 nós mesmo em águas extremamente frias.", "Sea Lion Pokémon"],
  ["88", "Grimer", "1", "poison", "None", "Aparece em áreas sujas. Prospera ao sugar lodo poluído despejado por fábricas.", "Sludge Pokémon"],
  ["89", "Muk", "1", "poison", "None", "Coberto por um lodo fétido e tóxico. É tão venenoso que até suas pegadas contêm veneno.", "Sludge Pokémon"],
  ["90", "Shellder", "1", "water", "None", "Sua concha dura repele qualquer tipo de ataque. É vulnerável apenas quando a concha está aberta.", "Bivalve Pokémon"],
  ["91", "Cloyster", "2", "water", "ice", "Quando atacado, lança seus chifres em rápidas salvas. Suas entranhas nunca foram vistas.", "Bivalve Pokémon"],
  ["92", "Gastly", "2", "ghost", "poison", "Quase invisível, este Pokémon gasoso pode atravessar obstáculos para drenar a força do inimigo.", "Gas Pokémon"],
  ["93", "Haunter", "2", "ghost", "poison", "Por sua capacidade de atravessar paredes sólidas, diz-se que vem de outra dimensão.", "Gas Pokémon"],
  ["94", "Gengar", "2", "ghost", "poison", "Sob a lua cheia, este Pokémon gosta de imitar sombras de pessoas e rir de seu medo.", "Ghost Pokémon"],
  ["95", "Onix", "2", "rock", "ground", "Conforme cresce, as partes de pedra de seu corpo endurecem, tornando-se semelhantes a diamantes, mas pretas.", "Rock Snake Pokémon"],
  ["96", "Drowzee", "1", "psychic", "None", "Coloca inimigos para dormir e come seus sonhos. Às vezes fica doente por comer sonhos ruins.", "Hypnosis Pokémon"],
  ["97", "Hypno", "1", "psychic", "None", "Quando fixa os olhos em um inimigo, usa uma mistura de movimentos psíquicos como Hypnosis e Confusion.", "Hypnosis Pokémon"],
  ["98", "Krabby", "1", "water", "None", "Suas pinças são armas poderosas e também usadas para equilíbrio ao caminhar lateralmente.", "River Crab Pokémon"],
  ["99", "Kingler", "1", "water", "None", "A pinça grande tem 10.000 cavalos de força de esmagamento. No entanto, seu tamanho enorme é difícil de manobrar.", "Pincer Pokémon"],
  ["100", "Voltorb", "1", "electric", "None", "Geralmente encontrado em usinas. Facilmente confundido com uma Poké Ball, já eletrocutou muitas pessoas.", "Ball Pokémon"],
  ["101", "Electrode", "1", "electric", "None", "Armazena energia elétrica sob alta pressão. Frequentemente explode com pouca ou nenhuma provocação.", "Ball Pokémon"],
  ["102", "Exeggcute", "2", "grass", "psychic", "Muitas vezes confundido com ovos. Quando perturbado, reúne-se rapidamente e ataca em enxames.", "Egg Pokémon"],
  ["103", "Exeggutor", "2", "grass", "psychic", "Dizem que, em raras ocasiões, uma de suas cabeças cai e continua como um Exeggcute.", "Coconut Pokémon"],
  ["104", "Cubone", "1", "ground", "None", "Por nunca remover seu capacete de caveira, ninguém jamais viu o verdadeiro rosto deste Pokémon.", "Lonely Pokémon"],
  ["105", "Marowak", "1", "ground", "None", "O osso que segura é sua arma principal. Lança o osso habilmente como um bumerangue para nocautear alvos.", "Bone Keeper Pokémon"],
  ["106", "Hitmonlee", "1", "fighting", "None", "Quando apressado, suas pernas se alongam progressivamente. Corre suavemente com passadas longas e ágeis.", "Kicking Pokémon"],
  ["107", "Hitmonchan", "1", "fighting", "None", "Enquanto parece não fazer nada, dispara socos em rajadas relâmpago impossíveis de ver.", "Punching Pokémon"],
  ["108", "Lickitung", "1", "normal", "None", "Sua língua pode se estender como a de um camaleão. Deixa uma sensação de formigamento ao lamber inimigos.", "Licking Pokémon"],
  ["109", "Koffing", "1", "poison", "None", "Por armazenar vários tipos de gases tóxicos em seu corpo, está propenso a explodir sem aviso.", "Poison Gas Pokémon"],
  ["110", "Weezing", "1", "poison", "None", "Onde dois tipos de gases venenosos se encontram, a toxicidade é dobrada. Seu fedor é insuportável.", "Poison Gas Pokémon"],
  ["111", "Rhyhorn", "2", "ground", "rock", "Seus ossos maciços são mil vezes mais duros que os humanos. Pode facilmente derrubar um trailer.", "Spikes Pokémon"],
  ["112", "Rhydon", "2", "ground", "rock", "Protegido por um couro semelhante a armadura, é capaz de viver em lava derretida a 3.600 graus.", "Drill Pokémon"],
  ["113", "Chansey", "1", "normal", "None", "Um Pokémon raro e esquivo que dizem trazer felicidade àqueles que conseguem capturá-lo.", "Egg Pokémon"],
  ["114", "Tangela", "1", "grass", "None", "Todo o corpo é coberto por vinhas semelhantes a algas. Suas vinhas se quebram facilmente sem dor.", "Vine Pokémon"],
  ["115", "Kangaskhan", "1", "normal", "None", "O filhote raramente sai da bolsa protetora da mãe até completar 3 anos.", "Parent Pokémon"],
  ["116", "Horsea", "1", "water", "None", "Conhecido por abater insetos voadores com jatos precisos de tinta da superfície da água.", "Dragon Pokémon"],
  ["117", "Seadra", "1", "water", "None", "Capaz de nadar para trás ao bater rapidamente suas nadadeiras peitorais semelhantes a asas.", "Dragon Pokémon"],
  ["118", "Goldeen", "1", "water", "None", "Sua nadadeira caudal ondula como um vestido de baile, dando-lhe o apelido de Rainha da Água.", "Goldfish Pokémon"],
  ["119", "Seaking", "1", "water", "None", "Na temporada de desova no outono, pode ser visto nadando poderosamente por rios e riachos.", "Goldfish Pokémon"],
  ["120", "Staryu", "1", "water", "None", "Um Pokémon enigmático que regenera facilmente qualquer apêndice perdido em batalha.", "Star Shape Pokémon"],
  ["121", "Starmie", "2", "water", "psychic", "Seu núcleo central brilha com as sete cores do arco-íris. Alguns o consideram uma joia misteriosa.", "Mysterious Pokémon"],
  ["122", "MrMime", "1", "psychic", "None", "Se interrompido enquanto faz mímicas, dá tapas no ofensor com suas mãos largas.", "Barrier Pokémon"],
  ["123", "Scyther", "2", "bug", "flying", "Com agilidade e velocidade de ninja, pode criar a ilusão de que há mais de um.", "Mantis Pokémon"],
  ["124", "Jynx", "2", "ice", "psychic", "Balança os quadris sedutoramente ao caminhar. Pode fazer as pessoas dançarem em uníssono com ela.", "Human Shape Pokémon"],
  ["125", "Electabuzz", "1", "electric", "None", "Normalmente encontrado perto de usinas, pode causar apagões ao descarregar eletricidade armazenada.", "Electric Pokémon"],
  ["126", "Magmar", "1", "fire", "None", "Seu corpo sempre queima com um brilho laranja que o permite se esconder perfeitamente entre chamas.", "Spitfire Pokémon"],
  ["127", "Pinsir", "1", "bug", "None", "Se não conseguir esmagar a vítima em suas pinças, a balança e joga com força.", "Stag Beetle Pokémon"],
  ["128", "Tauros", "1", "normal", "None", "Quando mira um inimigo, investe furiosamente enquanto chicoteia seu corpo com suas longas caudas.", "Wild Bull Pokémon"],
  ["129", "Magikarp", "1", "water", "None", "No passado distante, era um pouco mais forte que os descendentes extremamente fracos de hoje.", "Fish Pokémon"],
  ["130", "Gyarados", "2", "water", "flying", "Raramente visto na natureza. Enorme e cruel, é capaz de destruir cidades inteiras em sua fúria.", "Atrocious Pokémon"],
  ["131", "Lapras", "2", "water", "ice", "Um Pokémon quase extinto por caça excessiva. Pode transportar pessoas através de corpos d'água.", "Transport Pokémon"],
  ["132", "Ditto", "1", "normal", "None", "Capaz de copiar o código genético de um inimigo para se transformar instantaneamente em um duplicata.", "Transform Pokémon"],
  ["133", "Eevee", "1", "normal", "None", "Seu código genético é irregular. Pode mutar se exposto à radiação de pedras elementais.", "Evolution Pokémon"],
  ["134", "Vaporeon", "1", "water", "None", "Vive perto da água. Sua cauda longa é ondulada com uma nadadeira, frequentemente confundida com a de uma sereia.", "Mermaid Pokémon"],
  ["135", "Jolteon", "1", "electric", "None", "Acumula íons negativos na atmosfera para disparar raios de 10.000 volts.", "Lightning Pokémon"],
  ["136", "Flareon", "1", "fire", "None", "Ao armazenar energia térmica em seu corpo, sua temperatura pode subir acima de 900 graus.", "Flame Pokémon"],
  ["137", "Porygon", "1", "normal", "None", "Um Pokémon feito inteiramente de código de programação. Move-se livremente no ciberespaço.", "Virtual Pokémon"],
  ["138", "Omanyte", "2", "rock", "water", "Embora extinto há muito, em raros casos, pode ser ressuscitado geneticamente a partir de fósseis.", "Spiral Pokémon"],
  ["139", "Omastar", "2", "rock", "water", "Um Pokémon pré-histórico que morreu porque sua concha pesada o tornou lento demais para caçar.", "Spiral Pokémon"],
  ["140", "Kabuto", "2", "rock", "water", "Um Pokémon ressuscitado de um fóssil encontrado no que já foi o fundo do mar há eras.", "Shellfish Pokémon"],
  ["141", "Kabutops", "2", "rock", "water", "Sua forma elegante é perfeita para nadar. Corta presas com suas garras e drena seus fluidos corporais.", "Shellfish Pokémon"],
  ["142", "Aerodactyl", "2", "rock", "flying", "Um Pokémon pré-histórico feroz que ataca a garganta do inimigo com suas presas serrilhadas.", "Fossil Pokémon"],
  ["143", "Snorlax", "1", "normal", "None", "Muito preguiçoso. Apenas come e dorme. Conforme seu corpo robusto cresce, torna-se cada vez mais lento.", "Sleeping Pokémon"],
  ["144", "Articuno", "2", "ice", "flying", "Um pássaro lendário que aparece para pessoas condenadas perdidas em montanhas geladas.", "Freeze Pokémon"],
  ["145", "Zapdos", "2", "electric", "flying", "Um pássaro lendário que aparece em nuvens lançando enormes raios elétricos.", "Electric Pokémon"],
  ["146", "Moltres", "2", "fire", "flying", "Conhecido como o pássaro lendário do fogo. Cada batida de suas asas cria um brilho deslumbrante de chamas.", "Flame Pokémon"],
  ["147", "Dratini", "1", "dragon", "None", "Considerado mítico até recentemente, quando uma pequena colônia foi encontrada vivendo debaixo d'água.", "Dragon Pokémon"],
  ["148", "Dragonair", "1", "dragon", "None", "Um Pokémon místico que exsuda uma aura gentil. Tem a capacidade de mudar as condições climáticas.", "Dragon Pokémon"],
  ["149", "Dragonite", "2", "dragon", "flying", "Um Pokémon marinho extremamente raro. Sua inteligência é dita equiparável à dos humanos.", "Dragon Pokémon"],
  ["150", "Mewtwo", "1", "psychic", "None", "Foi criado por um cientista após anos de experimentos horríveis de engenharia genética e DNA.", "Genetic Pokémon"],
  ["151", "Mew", "1", "psychic", "None", "Tão raro que muitos especialistas ainda dizem que é uma miragem. Poucos o viram no mundo todo.", "New Species Pokémon"],
];
    
    

    for(int index=1; index<pokemonIDS.length; index++){
      models.add(
        ChartModel(
          nome: pokemonIDS[index][1].toString(),
          elementos: ['assets/img/icons/${pokemonIDS[index][3]}.png',
            pokemonIDS[index][4].toString() != 'None'?'assets/img/icons/${pokemonIDS[index][4]}.png':''
            
          ],
          // cor primaria e cor secundaria, porem se não tiver elementoCor secundario repete o elementoCor primario
          elementoCor: [
            corPorelementoCor[pokemonIDS[index][3].toString()] as Color,

            pokemonIDS[index][4].toString() != 'None'
                ? corPorelementoCor[pokemonIDS[index][4].toString()] as Color
                : corPorelementoCor[pokemonIDS[index][3].toString()] as Color
          ],
          iconPath: 'assets/pokedex/gen1/${index<10?'00$index':index<100?'0$index':index}.png',
          descricao: pokemonIDS[index][5].toString(),
          species: pokemonIDS[index][6].toString(),
        )
      );
    }

    return models;
  }

}