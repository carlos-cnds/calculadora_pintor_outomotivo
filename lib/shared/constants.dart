import 'package:flutter/material.dart';

Map<int, Color> colorPrimary =
{
50: const Color.fromRGBO(17,28,128, .1),
100:const Color.fromRGBO(17,28,128, .2),
200:const Color.fromRGBO(17,28,128, .3),
300:const Color.fromRGBO(17,28,128, .4),
400:const Color.fromRGBO(17,28,128, .5),
500:const Color.fromRGBO(17,28,128, .6),
600:const Color.fromRGBO(17,28,128, .7),
700:const Color.fromRGBO(17,28,128, .8),
800:const Color.fromRGBO(17,28,128, .9),
900:const Color.fromRGBO(17,28,128, 1),
};

int baseCalculo = 100;

List<Map<String, dynamic>> products = [
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Dynamic Clearcoat CC200',
      'formula': '4:1 + 15%',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Dynamic Clearcoat CC200',
          'sequencia': 1,
          'percentual_base_ml_dmed': 69.5652173913043,
          'percentual_base_gm_dmed': 68.6953793752521
        },
        {
          'descricao': 'Endurecedor UH80',
          'sequencia': 2,
          'percentual_base_ml_dmed': 17.3913043478261,
          'percentual_base_gm_dmed': 19.540178371353
        },
        {
          'descricao': 'Thinner 454/455',
          'sequencia': 3,
          'percentual_base_ml_dmed': 13.0434782608696,
          'percentual_base_gm_dmed': 68.6953793752521
        }
      ]
    },
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Performance Clearcoat CC900',
      'formula': '2:1 + 10 – 20%',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Performance Clearcoat CC900',
          'sequencia': 1,
          'percentual_base_ml_dmed': 57.9710144927536,
          'percentual_base_gm_dmed': 58.7821136993484,
          'percentual_base_ml_dmin': 60.6060606060606,
          'percentual_base_gm_dmin': 61.1882114455013,
          'percentual_base_ml_dmax': 55.5555555555556,
          'percentual_base_gm_dmax': 56.5580859037187
        },
        {
          'descricao': 'Endurecedor UH40/UH60/UH20',
          'sequencia': 2,
          'percentual_base_ml_dmed': 28.9855072463768,
          'percentual_base_gm_dmed': 29.4210171522732,
          'percentual_base_ml_dmin': 30.3030303030303,
          'percentual_base_gm_dmin': 30.6252923748636,
          'percentual_base_ml_dmax': 27.7777777777778,
          'percentual_base_gm_dmax': 28.3078697030845
        },
        {
          'descricao': 'Thinner 454/455/470/490',
          'sequencia': 3,
          'percentual_base_ml_dmed': 13.0434782608696,
          'percentual_base_gm_dmed': 58.7821136993484,
          'percentual_base_ml_dmin': 9.09090909090909,
          'percentual_base_gm_dmin': 30.6252923748636,
          'percentual_base_ml_dmax': 16.6666666666667,
          'percentual_base_gm_dmax': 15.1340443931969
        }
      ]
    },
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Performance Clearcoat CC910',
      'formula': '3:1',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Performance Clearcoat CC910',
          'sequencia': 1,
          'percentual_base_ml_dmed': 75,
          'percentual_base_gm_dmed': 74.612202688728
        },
        {
          'descricao': 'Endurecedor UH40/UH60/UH20',
          'sequencia': 2,
          'percentual_base_ml_dmed': 25,
          'percentual_base_gm_dmed': 25.387797311272
        }
      ]
    },
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Performance Clearcoat HPC15',
      'formula': '5:1:1',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Performance Clearcoat HPC15',
          'sequencia': 1,
          'percentual_base_ml_dmed': 71.4285714285714,
          'percentual_base_gm_dmed': 70.5838323353293
        },
        {
          'descricao': 'Endurecedor UH80',
          'sequencia': 2,
          'percentual_base_ml_dmed': 14.2857142857143,
          'percentual_base_gm_dmed': 16.3173652694611
        },
        {
          'descricao': 'Thinner 454/455',
          'sequencia': 3,
          'percentual_base_ml_dmed': 14.2857142857143,
          'percentual_base_gm_dmed': 70.5838323353293
        }
      ]
    },
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Premium Clearcoat CC940',
      'formula': '3:1',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Premium Clearcoat CC940',
          'sequencia': 1,
          'percentual_base_ml_dmed': 75,
          'percentual_base_gm_dmed': 73.7151623625671
        },
        {
          'descricao': 'Endurecedor UH55/UH22',
          'sequencia': 2,
          'percentual_base_ml_dmed': 25,
          'percentual_base_gm_dmed': 26.2848376374329
        }
      ]
    },
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Premium Clearcoat CC941',
      'formula': '2:1',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Premium Clearcoat CC941',
          'sequencia': 1,
          'percentual_base_ml_dmed': 66.6666666666667,
          'percentual_base_gm_dmed': 65.9993096306524
        },
        {
          'descricao': 'Endurecedor UH41',
          'sequencia': 2,
          'percentual_base_ml_dmed': 33.3333333333333,
          'percentual_base_gm_dmed': 34.0006903693476
        }
      ]
    },
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Verniz Alto Solidos 8937',
      'formula': '2:1 + 10 – 20%',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Verniz Alto Solidos 8937',
          'sequencia': 1,
          'percentual_base_ml_dmed': 57.9710144927536,
          'percentual_base_gm_dmed': 58.7821136993484,
          'percentual_base_ml_dmin': 60.6060606060606,
          'percentual_base_gm_dmin': 61.1882114455013,
          'percentual_base_ml_dmax': 55.5555555555556,
          'percentual_base_gm_dmax': 56.5580859037187
        },
        {
          'descricao': 'Endurecedor 066/065/067/89120',
          'sequencia': 2,
          'percentual_base_ml_dmed': 28.9855072463768,
          'percentual_base_gm_dmed': 29.4210171522732,
          'percentual_base_ml_dmin': 30.3030303030303,
          'percentual_base_gm_dmin': 30.6252923748636,
          'percentual_base_ml_dmax': 27.7777777777778,
          'percentual_base_gm_dmax': 28.3078697030845
        },
        {
          'descricao': 'Thinner 454/455/470/490',
          'sequencia': 3,
          'percentual_base_ml_dmed': 13.0434782608696,
          'percentual_base_gm_dmed': 58.7821136993484,
          'percentual_base_ml_dmin': 9.09090909090909,
          'percentual_base_gm_dmin': 30.6252923748636,
          'percentual_base_ml_dmax': 16.6666666666667,
          'percentual_base_gm_dmax': 15.1340443931969
        }
      ]
    },
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Verniz Poliuretano 8050',
      'formula': '5:1',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Verniz Poliuretano 8050',
          'sequencia': 1,
          'percentual_base_ml_dmed': 83.3333333333333,
          'percentual_base_gm_dmed': 82.5920111634397
        },
        {
          'descricao': 'Endurecedor 058',
          'sequencia': 2,
          'percentual_base_ml_dmed': 16.6666666666667,
          'percentual_base_gm_dmed': 17.4079888365603
        }
      ]
    },
    {
      'marca': 'Sherwin Williams',
      'descricao': 'Verniz Poliuretano Fosco VF001',
      'formula': '5:1',
      'src_imagem': 'assets/images/sherwin_williams.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Verniz Poliuretano Fosco VF001',
          'sequencia': 1,
          'percentual_base_ml_dmed': 83.3333333333333,
          'percentual_base_gm_dmed': 82.7882960413081
        },
        {
          'descricao': 'Endurecedor VF010',
          'sequencia': 2,
          'percentual_base_ml_dmed': 16.6666666666667,
          'percentual_base_gm_dmed': 17.2117039586919
        }
      ]
    },
    {
      'marca': 'Sikkens',
      'descricao': 'Autoclear Classic',
      'formula': '2:1 + 20 – 30%',
      'src_imagem': 'assets/images/sikkens.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Autoclear Classic',
          'sequencia': 1,
          'percentual_base_ml_dmed': 53.3333333333333,
          'percentual_base_gm_dmed': 54.3213277322498,
          'percentual_base_ml_dmin': 55.5555555555556,
          'percentual_base_gm_dmin': 56.4266910838961,
          'percentual_base_ml_dmax': 51.2820512820513,
          'percentual_base_gm_dmax': 52.3674217277
        },
        {
          'descricao': 'Hardener Classic',
          'sequencia': 2,
          'percentual_base_ml_dmed': 26.6666666666667,
          'percentual_base_gm_dmed': 27.0229323049377,
          'percentual_base_ml_dmin': 27.7777777777778,
          'percentual_base_gm_dmin': 28.0702758383885,
          'percentual_base_ml_dmax': 25.6410256410256,
          'percentual_base_gm_dmax': 26.0509334253924
        },
        {
          'descricao': 'Plus Reducer',
          'sequencia': 3,
          'percentual_base_ml_dmed': 20,
          'percentual_base_gm_dmed': 54.3213277322498,
          'percentual_base_ml_dmin': 16.6666666666667,
          'percentual_base_gm_dmin': 28.0702758383885,
          'percentual_base_ml_dmax': 23.0769230769231,
          'percentual_base_gm_dmax': 21.5816448469076
        }
      ]
    },
    {
      'marca': 'Sikkens',
      'descricao': 'Autoclear Plus HS',
      'formula': '2:1 + 6,67 - 13,33%',
      'src_imagem': 'assets/images/sikkens.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Autoclear Plus HS',
          'sequencia': 1,
          'percentual_base_ml_dmed': 60.6060606060606,
          'percentual_base_gm_dmed': 61.0473256790815,
          'percentual_base_ml_dmin': 62.5,
          'percentual_base_gm_dmin': 62.8121398386477,
          'percentual_base_ml_dmax': 58.8235294117647,
          'percentual_base_gm_dmax': 59.3789722171781
        },
        {
          'descricao': 'Endurecedor P25/P35',
          'sequencia': 2,
          'percentual_base_ml_dmed': 30.3030303030303,
          'percentual_base_gm_dmed': 30.5236628395407,
          'percentual_base_ml_dmin': 31.25,
          'percentual_base_gm_dmin': 31.4060699193239,
          'percentual_base_ml_dmax': 29.4117647058824,
          'percentual_base_gm_dmax': 29.6894861085891
        },
        {
          'descricao': 'Plus Reducer',
          'sequencia': 3,
          'percentual_base_ml_dmed': 9.09090909090909,
          'percentual_base_gm_dmed': 61.0473256790815,
          'percentual_base_ml_dmin': 6.25,
          'percentual_base_gm_dmin': 31.4060699193239,
          'percentual_base_ml_dmax': 11.7647058823529,
          'percentual_base_gm_dmax': 10.9315416742328
        }
      ]
    },
    {
      'marca': 'Sikkens',
      'descricao': 'Primer Classic',
      'formula': '5:1 + 20 – 30%',
      'src_imagem': 'assets/images/sikkens.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Primer Classic',
          'sequencia': 1,
          'percentual_base_ml_dmed': 66.6666666666667,
          'percentual_base_gm_dmed': 75.8492322010238,
          'percentual_base_ml_dmin': 69.4444444444444,
          'percentual_base_gm_dmin': 78.035235541938,
          'percentual_base_ml_dmax': 64.1025641025641,
          'percentual_base_gm_dmax': 73.7823646568894
        },
        {
          'descricao': 'Hardener Classic',
          'sequencia': 2,
          'percentual_base_ml_dmed': 13.3333333333333,
          'percentual_base_gm_dmed': 10.1442531409958,
          'percentual_base_ml_dmin': 13.8888888888889,
          'percentual_base_gm_dmin': 10.4366143240138,
          'percentual_base_ml_dmax': 12.8205128205128,
          'percentual_base_gm_dmax': 9.86782545717907
        },
        {
          'descricao': 'Plus Reducer',
          'sequencia': 3,
          'percentual_base_ml_dmed': 20,
          'percentual_base_gm_dmed': 75.8492322010238,
          'percentual_base_ml_dmin': 16.6666666666667,
          'percentual_base_gm_dmin': 10.4366143240138,
          'percentual_base_ml_dmax': 23.0769230769231,
          'percentual_base_gm_dmax': 16.3498098859316
        }
      ]
    },
    {
      'marca': 'Sikkens',
      'descricao': 'Primer Classic FAST',
      'formula': '4:1 + 10 - 20%',
      'src_imagem': 'assets/images/sikkens.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Primer Classic FAST',
          'sequencia': 1,
          'percentual_base_ml_dmed': 69.5652173913043,
          'percentual_base_gm_dmed': 78.4883911320693,
          'percentual_base_ml_dmin': 72.7272727272727,
          'percentual_base_gm_dmin': 80.880070189647,
          'percentual_base_ml_dmax': 66.6666666666667,
          'percentual_base_gm_dmax': 76.2340966921119
        },
        {
          'descricao': 'Hardener Classic FAST',
          'sequencia': 2,
          'percentual_base_ml_dmed': 17.3913043478261,
          'percentual_base_gm_dmed': 12.6404034450011,
          'percentual_base_ml_dmin': 18.1818181818182,
          'percentual_base_gm_dmin': 13.0255787271377,
          'percentual_base_ml_dmax': 16.6666666666667,
          'percentual_base_gm_dmax': 12.2773536895674
        },
        {
          'descricao': 'Plus Reducer',
          'sequencia': 3,
          'percentual_base_ml_dmed': 13.0434782608696,
          'percentual_base_gm_dmed': 78.4883911320693,
          'percentual_base_ml_dmin': 9.09090909090909,
          'percentual_base_gm_dmin': 13.0255787271377,
          'percentual_base_ml_dmax': 16.6666666666667,
          'percentual_base_gm_dmax': 11.4885496183206
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Preto Fosco Vinilico',
      'formula': '2:1',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Preto Fosco Vinilico',
          'sequencia': 1,
          'percentual_base_ml_dmed': 66.6666666666667,
          'percentual_base_gm_dmed': 69.4713328369322
        },
        {
          'descricao': 'Catalis. p/ Preto F. Vinilico',
          'sequencia': 2,
          'percentual_base_ml_dmed': 33.3333333333333,
          'percentual_base_gm_dmed': 30.5286671630678
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Primer PU 1100',
      'formula': '5:1 + 10 – 30%',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Primer PU 1100',
          'sequencia': 1,
          'percentual_base_ml_dmed': 69.4444444444444,
          'percentual_base_gm_dmed': 79.1620433156618,
          'percentual_base_ml_dmin': 75.7575757575758,
          'percentual_base_gm_dmin': 83.7354373152495,
          'percentual_base_ml_dmax': 64.1025641025641,
          'percentual_base_gm_dmax': 75.0623489985192
        },
        {
          'descricao': 'Endurecedor 1091',
          'sequencia': 2,
          'percentual_base_ml_dmed': 13.8888888888889,
          'percentual_base_gm_dmed': 9.91451937697777,
          'percentual_base_ml_dmin': 15.1515151515152,
          'percentual_base_gm_dmin': 10.4873065553817,
          'percentual_base_ml_dmax': 12.8205128205128,
          'percentual_base_gm_dmax': 9.40105993297483
        },
        {
          'descricao': 'Thinner 4030/4028',
          'sequencia': 3,
          'percentual_base_ml_dmed': 16.6666666666667,
          'percentual_base_gm_dmed': 79.1620433156618,
          'percentual_base_ml_dmin': 9.09090909090909,
          'percentual_base_gm_dmin': 10.4873065553817,
          'percentual_base_ml_dmax': 23.0769230769231,
          'percentual_base_gm_dmax': 15.536591068506
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Primer PU 3100',
      'formula': '8:1 + 20 – 40%',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Primer PU 3100',
          'sequencia': 1,
          'percentual_base_ml_dmed': 68.3760683760684,
          'percentual_base_gm_dmed': 77.5879236866213,
          'percentual_base_ml_dmin': 74.0740740740741,
          'percentual_base_gm_dmin': 81.9244679956262,
          'percentual_base_ml_dmax': 63.4920634920635,
          'percentual_base_gm_dmax': 73.6873959751854
        },
        {
          'descricao': 'Endurecedor 3093',
          'sequencia': 2,
          'percentual_base_ml_dmed': 8.54700854700855,
          'percentual_base_gm_dmed': 6.53204285657386,
          'percentual_base_ml_dmin': 9.25925925925926,
          'percentual_base_gm_dmin': 6.89713180250652,
          'percentual_base_ml_dmax': 7.93650793650794,
          'percentual_base_gm_dmax': 6.20366167347556
        },
        {
          'descricao': 'Thinner 4030/4028',
          'sequencia': 3,
          'percentual_base_ml_dmed': 23.0769230769231,
          'percentual_base_gm_dmed': 77.5879236866213,
          'percentual_base_ml_dmin': 16.6666666666667,
          'percentual_base_gm_dmin': 6.89713180250652,
          'percentual_base_ml_dmax': 28.5714285714286,
          'percentual_base_gm_dmax': 20.1089423513391
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Primer PU 4100',
      'formula': '8:1 + 20 – 30%',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Primer PU 4100',
          'sequencia': 1,
          'percentual_base_ml_dmed': 71.1111111111111,
          'percentual_base_gm_dmed': 79.597080892178,
          'percentual_base_ml_dmin': 74.0740740740741,
          'percentual_base_gm_dmin': 81.8327838363344,
          'percentual_base_ml_dmax': 68.3760683760684,
          'percentual_base_gm_dmax': 77.4802897506704
        },
        {
          'descricao': 'Endurecedor 3093',
          'sequencia': 2,
          'percentual_base_ml_dmed': 8.88888888888889,
          'percentual_base_gm_dmed': 6.74272792681673,
          'percentual_base_ml_dmin': 9.25925925925926,
          'percentual_base_gm_dmin': 6.93211598613577,
          'percentual_base_ml_dmax': 8.54700854700855,
          'percentual_base_gm_dmax': 6.56341297474687
        },
        {
          'descricao': 'Thinner 4030/4028',
          'sequencia': 3,
          'percentual_base_ml_dmed': 20,
          'percentual_base_gm_dmed': 79.597080892178,
          'percentual_base_ml_dmin': 16.6666666666667,
          'percentual_base_gm_dmin': 6.93211598613577,
          'percentual_base_ml_dmax': 23.0769230769231,
          'percentual_base_gm_dmax': 15.9562972745828
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Primer PU 5100',
      'formula': '5:1 + 20 – 40%',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Primer PU 5100',
          'sequencia': 1,
          'percentual_base_ml_dmed': 64.1025641025641,
          'percentual_base_gm_dmed': 73.6286660939993,
          'percentual_base_ml_dmin': 69.4444444444444,
          'percentual_base_gm_dmin': 77.861406696081,
          'percentual_base_ml_dmax': 59.5238095238095,
          'percentual_base_gm_dmax': 69.8324022346369
        },
        {
          'descricao': 'Endurecedor 3093/3090',
          'sequencia': 2,
          'percentual_base_ml_dmed': 12.8205128205128,
          'percentual_base_gm_dmed': 10.0625843661799,
          'percentual_base_ml_dmin': 13.8888888888889,
          'percentual_base_gm_dmin': 10.6410589151311,
          'percentual_base_ml_dmax': 11.9047619047619,
          'percentual_base_gm_dmax': 9.54376163873371
        },
        {
          'descricao': 'Thinner 4030/4028',
          'sequencia': 3,
          'percentual_base_ml_dmed': 23.0769230769231,
          'percentual_base_gm_dmed': 73.6286660939993,
          'percentual_base_ml_dmin': 16.6666666666667,
          'percentual_base_gm_dmin': 10.6410589151311,
          'percentual_base_ml_dmax': 28.5714285714286,
          'percentual_base_gm_dmax': 20.6238361266294
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'PU Cor Pronta',
      'formula': '4:1+20-30%',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'PU Cor Pronta',
          'sequencia': 1,
          'percentual_base_ml_dmed': 64,
          'percentual_base_gm_dmed': 66.3820188512044,
          'percentual_base_ml_dmin': 66.6666666666667,
          'percentual_base_gm_dmin': 68.8387635756057,
          'percentual_base_ml_dmax': 61.5384615384615,
          'percentual_base_gm_dmax': 64.0945861854387
        },
        {
          'descricao': 'Endurecedor p/ PU',
          'sequencia': 2,
          'percentual_base_ml_dmed': 16,
          'percentual_base_gm_dmed': 15.77378554741,
          'percentual_base_ml_dmin': 16.6666666666667,
          'percentual_base_gm_dmin': 16.3575605680869,
          'percentual_base_ml_dmax': 15.3846153846154,
          'percentual_base_gm_dmax': 15.230242688239
        },
        {
          'descricao': 'Thinner 4030/4028',
          'sequencia': 3,
          'percentual_base_ml_dmed': 20,
          'percentual_base_gm_dmed': 66.3820188512044,
          'percentual_base_ml_dmin': 16.6666666666667,
          'percentual_base_gm_dmin': 16.3575605680869,
          'percentual_base_ml_dmax': 23.0769230769231,
          'percentual_base_gm_dmax': 20.6751711263223
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Sealer',
      'formula': '5:1 + 10-30%',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Sealer',
          'sequencia': 1,
          'percentual_base_ml_dmed': 69.4444444444444,
          'percentual_base_gm_dmed': 74.9951143247997,
          'percentual_base_ml_dmin': 75.7575757575758,
          'percentual_base_gm_dmin': 80.2027274152255,
          'percentual_base_ml_dmax': 64.1025641025641,
          'percentual_base_gm_dmax': 70.4225352112676
        },
        {
          'descricao': 'Endurecedor 3093',
          'sequencia': 2,
          'percentual_base_ml_dmed': 13.8888888888889,
          'percentual_base_gm_dmed': 12.0187609927692,
          'percentual_base_ml_dmin': 15.1515151515152,
          'percentual_base_gm_dmin': 12.8533361199645,
          'percentual_base_ml_dmax': 12.8205128205128,
          'percentual_base_gm_dmax': 11.2859567830435
        },
        {
          'descricao': 'Thinner 4030/4028',
          'sequencia': 3,
          'percentual_base_ml_dmed': 16.6666666666667,
          'percentual_base_gm_dmed': 74.9951143247997,
          'percentual_base_ml_dmin': 9.09090909090909,
          'percentual_base_gm_dmin': 12.8533361199645,
          'percentual_base_ml_dmax': 23.0769230769231,
          'percentual_base_gm_dmax': 18.2915080056889
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Verniz PU 1100',
      'formula': '5:1',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Verniz PU 1100',
          'sequencia': 1,
          'percentual_base_ml_dmed': 83.3333333333333,
          'percentual_base_gm_dmed': 82.8748890860692
        },
        {
          'descricao': 'Endurecedor 1091',
          'sequencia': 2,
          'percentual_base_ml_dmed': 16.6666666666667,
          'percentual_base_gm_dmed': 17.1251109139308
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Verniz PU 4100',
      'formula': '5:1',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Verniz PU 4100',
          'sequencia': 1,
          'percentual_base_ml_dmed': 83.3333333333333,
          'percentual_base_gm_dmed': 82.764056752496
        },
        {
          'descricao': 'Endurecedor 3093/3090',
          'sequencia': 2,
          'percentual_base_ml_dmed': 16.6666666666667,
          'percentual_base_gm_dmed': 17.2359432475039
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Verniz PU 5100 HS',
      'formula': '5:1',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Verniz PU 5100 HS',
          'sequencia': 1,
          'percentual_base_ml_dmed': 83.3333333333333,
          'percentual_base_gm_dmed': 82.9285218598196
        },
        {
          'descricao': 'Endurecedor 3093/3090',
          'sequencia': 2,
          'percentual_base_ml_dmed': 16.6666666666667,
          'percentual_base_gm_dmed': 17.0714781401804
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Verniz PU 5500',
      'formula': '5:1',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': false,
      'items': [
        {
          'descricao': 'Verniz PU 5500',
          'sequencia': 1,
          'percentual_base_ml_dmed': 83.3333333333333,
          'percentual_base_gm_dmed': 82.8839798225778
        },
        {
          'descricao': 'Endurecedor 3093/3090',
          'sequencia': 2,
          'percentual_base_ml_dmed': 16.6666666666667,
          'percentual_base_gm_dmed': 17.1160201774222
        }
      ]
    },
    {
      'marca': 'Wanda',
      'descricao': 'Verniz PU 9100',
      'formula': '2:1 + 20 – 30%',
      'src_imagem': 'assets/images/wanda.png',
      'possui_diluicao': true,
      'items': [
        {
          'descricao': 'Verniz PU 9100',
          'sequencia': 1,
          'percentual_base_ml_dmed': 53.3333333333333,
          'percentual_base_gm_dmed': 54.3920320929589,
          'percentual_base_ml_dmin': 55.5555555555556,
          'percentual_base_gm_dmin': 56.4682904411765,
          'percentual_base_ml_dmax': 51.2820512820513,
          'percentual_base_gm_dmax': 52.463041041789
        },
        {
          'descricao': 'Endurecedor 3093/3090/3088',
          'sequencia': 2,
          'percentual_base_ml_dmed': 26.6666666666667,
          'percentual_base_gm_dmed': 27.2236823903721,
          'percentual_base_ml_dmin': 27.7777777777778,
          'percentual_base_gm_dmin': 28.2628676470588,
          'percentual_base_ml_dmax': 25.6410256410256,
          'percentual_base_gm_dmax': 26.2582056892779
        },
        {
          'descricao': 'Thinner 4030/4028',
          'sequencia': 3,
          'percentual_base_ml_dmed': 20,
          'percentual_base_gm_dmed': 54.3920320929589,
          'percentual_base_ml_dmin': 16.6666666666667,
          'percentual_base_gm_dmin': 28.2628676470588,
          'percentual_base_ml_dmax': 23.0769230769231,
          'percentual_base_gm_dmax': 21.2787532689331
        }
      ]
    },
  ];