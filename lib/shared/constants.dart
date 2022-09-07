import 'package:flutter/material.dart';

Map<int, Color> colorPrimary = {
  50: const Color.fromRGBO(17, 28, 128, .1),
  100: const Color.fromRGBO(17, 28, 128, .2),
  200: const Color.fromRGBO(17, 28, 128, .3),
  300: const Color.fromRGBO(17, 28, 128, .4),
  400: const Color.fromRGBO(17, 28, 128, .5),
  500: const Color.fromRGBO(17, 28, 128, .6),
  600: const Color.fromRGBO(17, 28, 128, .7),
  700: const Color.fromRGBO(17, 28, 128, .8),
  800: const Color.fromRGBO(17, 28, 128, .9),
  900: const Color.fromRGBO(17, 28, 128, 1),
};

int baseCalculo = 100;
const Color FILL_COLOR = Color(0xffF1F1F1);
const Color ICON_COLOR = Color(0xffB7B7B7);

// routes names
const String ROUTE_LOGIN = '/login';
const String ROUTE_HOME = '/home';
const String ROUTE_FORMULA = '/formula';
const String ROUTE_SPLASH = '/splah';
const String ROUTE_REGISTER = '/register';
const String ROUTE_RGISTER_CODE = '/register_code';

List<Map<String, dynamic>> products = [
  {
    'marca': 'Anjo',
    'descricao': 'Primer PU Fast Carbon',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer PU Fast Carbon',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.375
      },
      {
        'descricao': 'Catalisador p/ Primer Fast Carbon',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1
      },
      {
        'descricao': 'Thinner TH5003',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.865
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Primer PU FIT 5.1',
    'formula': '5:1',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer PU FIT 5.1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 1.491
      },
      {
        'descricao': 'Catalisador p/ Primer PU Fit',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.974
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Primer PU FLEX 5.1.1',
    'formula': '5:1:1',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer PU FLEX 5.1.1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.4285714285714,
        'densidade': 1.579
      },
      {
        'descricao': 'Catalisador p/ Primer PU Flex',
        'sequencia': '2',
        'percentual_base_gm_dmed': 14.2857142857143,
        'densidade': 0.975
      },
      {
        'descricao': 'Thinner PU 5000',
        'sequencia': '3',
        'percentual_base_gm_dmed': 14.2857142857143,
        'densidade': 0.848
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Primer PU FULL 4.1.1',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer PU FULL 4.1.1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.6
      },
      {
        'descricao': 'Catalisador p/ Primer PU Full',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.974
      },
      {
        'descricao': 'Thinner PU 5000',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.852
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Primer PU Revolution HS 4000',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer PU Revolution HS 4000',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.53
      },
      {
        'descricao': 'Catalisador p/ Primer HS 4000',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.998
      },
      {
        'descricao': 'Thinner TH5003/5002/5004',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Primer PU Revolution HS 5000',
    'formula': '5:1 + 10 – 30%',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer PU Revolution HS 5000',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.4285714285714,
        'percentual_base_gm_dmin': 76.9230769230769,
        'percentual_base_gm_dmax': 66.6666666666667,
        'densidade': 1.5
      },
      {
        'descricao': 'Catalisador p/ Primer HS 5000',
        'sequencia': '2',
        'percentual_base_gm_dmed': 14.2857142857143,
        'percentual_base_gm_dmin': 15.3846153846154,
        'percentual_base_gm_dmax': 13.3333333333333,
        'densidade': 1.044
      },
      {
        'descricao': 'Thinner TH5003/5002/5004',
        'sequencia': '3',
        'percentual_base_gm_dmed': 14.2857142857143,
        'percentual_base_gm_dmin': 7.69230769230769,
        'percentual_base_gm_dmax': 20,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Primer PU SLIM 8.1',
    'formula': '8:1 + 10 – 20%',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer PU SLIM 8.1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 77.2946859903382,
        'percentual_base_gm_dmin': 80.8080808080808,
        'percentual_base_gm_dmax': 74.0740740740741,
        'densidade': 1.571
      },
      {
        'descricao': 'Catalisador p/ Primer PU Slim',
        'sequencia': '2',
        'percentual_base_gm_dmed': 9.66183574879227,
        'percentual_base_gm_dmin': 10.1010101010101,
        'percentual_base_gm_dmax': 9.25925925925926,
        'densidade': 0.98
      },
      {
        'descricao': 'Thinner PU 5000',
        'sequencia': '3',
        'percentual_base_gm_dmed': 13.0434782608696,
        'percentual_base_gm_dmin': 9.09090909090909,
        'percentual_base_gm_dmax': 16.6666666666667,
        'densidade': 0.85
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Verniz PU Carbon HS',
    'formula': '2:1 + 10 – 20%',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Verniz PU Carbon HS',
        'sequencia': '1',
        'percentual_base_gm_dmed': 60.6060606060606,
        'percentual_base_gm_dmin': 62.5,
        'percentual_base_gm_dmax': 58.8235294117647,
        'densidade': 0.97
      },
      {
        'descricao': 'Catalisador CT0117/0118/0116',
        'sequencia': '2',
        'percentual_base_gm_dmed': 30.3030303030303,
        'percentual_base_gm_dmin': 31.25,
        'percentual_base_gm_dmax': 29.4117647058824,
        'densidade': 0.97
      },
      {
        'descricao': 'Thinner TH5003/5002/5004',
        'sequencia': '3',
        'percentual_base_gm_dmed': 9.09090909090909,
        'percentual_base_gm_dmin': 6.25,
        'percentual_base_gm_dmax': 11.7647058823529,
        'densidade': 0.865
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Verniz PU CarbonMS',
    'formula': '5:1',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz PU CarbonMS',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.93
      },
      {
        'descricao': 'Catalisador MS CT0120/0121/0119',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.95
      }
    ]
  },
  {
    'marca': 'Anjo',
    'descricao': 'Verniz PU Fast Carbon',
    'formula': '5:1:1',
    'src_imagem': 'assets/images/anjo.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz PU Fast Carbon',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.4285714285714,
        'densidade': 0.98
      },
      {
        'descricao': 'Catalisador p/ Verniz Fast Carbon',
        'sequencia': '2',
        'percentual_base_gm_dmed': 14.2857142857143,
        'densidade': 0.979
      },
      {
        'descricao': 'Thinner TH5003',
        'sequencia': '3',
        'percentual_base_gm_dmed': 14.2857142857143,
        'densidade': 0.865
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Dynamic Clearcoat CC200',
    'formula': '4:1 + 15%',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Dynamic Clearcoat CC200',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.4285714285714,
        'densidade': 0.958
      },
      {
        'descricao': 'Endurecedor UH80',
        'sequencia': '2',
        'percentual_base_gm_dmed': 17.8571428571429,
        'densidade': 1.09
      },
      {
        'descricao': 'Thinner 454/455',
        'sequencia': '3',
        'percentual_base_gm_dmed': 10.7142857142857,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Performance Clearcoat CC900',
    'formula': '2:1 + 10 – 20%',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Performance Clearcoat CC900',
        'sequencia': '1',
        'percentual_base_gm_dmed': 60.6060606060606,
        'percentual_base_gm_dmin': 62.5,
        'percentual_base_gm_dmax': 58.8235294117647,
        'densidade': 0.981
      },
      {
        'descricao': 'Endurecedor UH40/UH60/UH20',
        'sequencia': '2',
        'percentual_base_gm_dmed': 30.3030303030303,
        'percentual_base_gm_dmin': 31.25,
        'percentual_base_gm_dmax': 29.4117647058824,
        'densidade': 0.982
      },
      {
        'descricao': 'Thinner 454/455/470/490',
        'sequencia': '3',
        'percentual_base_gm_dmed': 9.09090909090909,
        'percentual_base_gm_dmin': 6.25,
        'percentual_base_gm_dmax': 11.7647058823529,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Performance Clearcoat CC910',
    'formula': '3:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Performance Clearcoat CC910',
        'sequencia': '1',
        'percentual_base_gm_dmed': 75,
        'densidade': 0.962
      },
      {
        'descricao': 'Endurecedor UH40/UH60/UH20',
        'sequencia': '2',
        'percentual_base_gm_dmed': 25,
        'densidade': 0.982
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Performance Clearcoat HPC15',
    'formula': '5:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Performance Clearcoat HPC15',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.4285714285714,
        'densidade': 0.943
      },
      {
        'descricao': 'Endurecedor UH80',
        'sequencia': '2',
        'percentual_base_gm_dmed': 14.2857142857143,
        'densidade': 1.09
      },
      {
        'descricao': 'Thinner 454/455',
        'sequencia': '3',
        'percentual_base_gm_dmed': 14.2857142857143,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Premium Clearcoat CC940',
    'formula': '3:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Premium Clearcoat CC940',
        'sequencia': '1',
        'percentual_base_gm_dmed': 75,
        'densidade': 0.961
      },
      {
        'descricao': 'Endurecedor UH55/UH22',
        'sequencia': '2',
        'percentual_base_gm_dmed': 25,
        'densidade': 1.028
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Premium Clearcoat CC941',
    'formula': '2:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Premium Clearcoat CC941',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 0.956
      },
      {
        'descricao': 'Endurecedor UH41',
        'sequencia': '2',
        'percentual_base_gm_dmed': 33.3333333333333,
        'densidade': 0.985
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer 2K P411',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer 2K P411',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.454
      },
      {
        'descricao': 'Endurecedor 411',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.953
      },
      {
        'descricao': 'Thinner 454',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer Epóxi 3:1',
    'formula': '3:1 + 5 – 10%',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer Epóxi 3:1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.0059171597633,
        'percentual_base_gm_dmin': 72.289156626506,
        'percentual_base_gm_dmax': 69.7674418604651,
        'densidade': 1.192
      },
      {
        'descricao': 'Endurecedor 98.66.99181',
        'sequencia': '2',
        'percentual_base_gm_dmed': 23.6686390532544,
        'percentual_base_gm_dmin': 24.0963855421687,
        'percentual_base_gm_dmax': 23.2558139534884,
        'densidade': 0.839
      },
      {
        'descricao': 'Thinner 454',
        'sequencia': '3',
        'percentual_base_gm_dmed': 5.32544378698225,
        'percentual_base_gm_dmin': 3.6144578313253,
        'percentual_base_gm_dmax': 6.97674418604651,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer Fosfatizante 8980',
    'formula': '2:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer Fosfatizante 8980',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 0.985
      },
      {
        'descricao': 'Catalisador 051',
        'sequencia': '2',
        'percentual_base_gm_dmed': 33.3333333333333,
        'densidade': 0.863
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer HS Ultra Performance P840',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer HS Ultra Performance P840',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.453
      },
      {
        'descricao': 'Endurecedor H84',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.953
      },
      {
        'descricao': 'Thinner 454/455/470/490',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer Multifiller HS P41',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer Multifiller HS P41',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.459
      },
      {
        'descricao': 'Endurecedor H41',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.973
      },
      {
        'descricao': 'Thinner 454/455',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer Poliuretano Cinza 8200',
    'formula': '8:1 + 20 – 30%',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer Poliuretano Cinza 8200',
        'sequencia': '1',
        'percentual_base_gm_dmed': 72.7272727272727,
        'percentual_base_gm_dmin': 75.4716981132076,
        'percentual_base_gm_dmax': 70.1754385964912,
        'densidade': 1.551
      },
      {
        'descricao': 'Endurecedor 8110',
        'sequencia': '2',
        'percentual_base_gm_dmed': 9.09090909090909,
        'percentual_base_gm_dmin': 9.43396226415094,
        'percentual_base_gm_dmax': 8.7719298245614,
        'densidade': 0.997
      },
      {
        'descricao': 'Thinner 454',
        'sequencia': '3',
        'percentual_base_gm_dmed': 18.1818181818182,
        'percentual_base_gm_dmin': 15.0943396226415,
        'percentual_base_gm_dmax': 21.0526315789474,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer Poliuretano P710',
    'formula': '7:1 + 10 – 20%',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer Poliuretano P710',
        'sequencia': '1',
        'percentual_base_gm_dmed': 77.3480662983425,
        'percentual_base_gm_dmin': 80.4597701149425,
        'percentual_base_gm_dmax': 74.468085106383,
        'densidade': 1.551
      },
      {
        'descricao': 'Endurecedor H71',
        'sequencia': '2',
        'percentual_base_gm_dmed': 11.0497237569061,
        'percentual_base_gm_dmin': 11.4942528735632,
        'percentual_base_gm_dmax': 10.6382978723404,
        'densidade': 0.997
      },
      {
        'descricao': 'Thinner 454',
        'sequencia': '3',
        'percentual_base_gm_dmed': 11.6022099447514,
        'percentual_base_gm_dmin': 8.04597701149425,
        'percentual_base_gm_dmax': 14.8936170212766,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer Poliuretano P81',
    'formula': '8:1 + 5 – 20%',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer Poliuretano P81',
        'sequencia': '1',
        'percentual_base_gm_dmed': 80,
        'percentual_base_gm_dmin': 85.1063829787234,
        'percentual_base_gm_dmax': 75.4716981132076,
        'densidade': 1.447
      },
      {
        'descricao': 'Endurecedor H81',
        'sequencia': '2',
        'percentual_base_gm_dmed': 10,
        'percentual_base_gm_dmin': 10.6382978723404,
        'percentual_base_gm_dmax': 9.43396226415094,
        'densidade': 0.954
      },
      {
        'descricao': 'Thinner 454',
        'sequencia': '3',
        'percentual_base_gm_dmed': 10,
        'percentual_base_gm_dmin': 4.25531914893617,
        'percentual_base_gm_dmax': 15.0943396226415,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer PU Alto Sólidos P51',
    'formula': '5:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer PU Alto Sólidos P51',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.4285714285714,
        'densidade': 1.444
      },
      {
        'descricao': 'Endurecedor H51',
        'sequencia': '2',
        'percentual_base_gm_dmed': 14.2857142857143,
        'densidade': 0.973
      },
      {
        'descricao': 'Thinner 454/455',
        'sequencia': '3',
        'percentual_base_gm_dmed': 14.2857142857143,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer PU KP 350 5:1',
    'formula': '5:1 + 5 – 20%',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer PU KP 350 5:1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 75.4716981132076,
        'percentual_base_gm_dmin': 80,
        'percentual_base_gm_dmax': 71.4285714285714,
        'densidade': 1.592
      },
      {
        'descricao': 'Endurecedor H0035',
        'sequencia': '2',
        'percentual_base_gm_dmed': 15.0943396226415,
        'percentual_base_gm_dmin': 16,
        'percentual_base_gm_dmax': 14.2857142857143,
        'densidade': 0.948
      },
      {
        'descricao': 'Thinner 454',
        'sequencia': '3',
        'percentual_base_gm_dmed': 9.43396226415094,
        'percentual_base_gm_dmin': 4,
        'percentual_base_gm_dmax': 14.2857142857143,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer SpectraPrime P30 BRANCO',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer SpectraPrime P30 BRANCO',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.621
      },
      {
        'descricao': 'Endurecedor H38',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.051
      },
      {
        'descricao': 'Thinner 454/470/490',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer SpectraPrime P30 CINZA',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer SpectraPrime P30 CINZA',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.618
      },
      {
        'descricao': 'Endurecedor H38',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.051
      },
      {
        'descricao': 'Thinner 454/470/490',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer SpectraPrime P30 PRETO',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer SpectraPrime P30 PRETO',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.385
      },
      {
        'descricao': 'Endurecedor H38',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.051
      },
      {
        'descricao': 'Thinner 454/470/490',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer SpectraPrime P30 VERMELHO',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer SpectraPrime P30 VERMELHO',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.477
      },
      {
        'descricao': 'Endurecedor H38',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.051
      },
      {
        'descricao': 'Thinner 454/470/490',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Primer SpectraPrime P31A Cinza',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Primer SpectraPrime P31A Cinza',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.618
      },
      {
        'descricao': 'Endurecedor H39',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.036
      },
      {
        'descricao': 'Thinner 454',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Verniz Alto Sólidos 8937',
    'formula': '2:1 + 10 – 20%',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Verniz Alto Sólidos 8937',
        'sequencia': '1',
        'percentual_base_gm_dmed': 60.6060606060606,
        'percentual_base_gm_dmin': 62.5,
        'percentual_base_gm_dmax': 58.8235294117647,
        'densidade': 0.981
      },
      {
        'descricao': 'Endurecedor 066/065/067/89120',
        'sequencia': '2',
        'percentual_base_gm_dmed': 30.3030303030303,
        'percentual_base_gm_dmin': 31.25,
        'percentual_base_gm_dmax': 29.4117647058824,
        'densidade': 0.982
      },
      {
        'descricao': 'Thinner 454/455/470/490',
        'sequencia': '3',
        'percentual_base_gm_dmed': 9.09090909090909,
        'percentual_base_gm_dmin': 6.25,
        'percentual_base_gm_dmax': 11.7647058823529,
        'densidade': 0.875
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Verniz Poliuretano 8050',
    'formula': '5:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Poliuretano 8050',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.947
      },
      {
        'descricao': 'Endurecedor 058',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.998
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Verniz Poliuretano Fosco VF001',
    'formula': '5:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Poliuretano Fosco VF001',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.962
      },
      {
        'descricao': 'Endurecedor VF010',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.98
      }
    ]
  },
  {
    'marca': 'Sherwin Williams',
    'descricao': 'Wash Primer 045',
    'formula': '2:1',
    'src_imagem': 'assets/images/sherwin_williams.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Wash Primer 045',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 0.9
      },
      {
        'descricao': 'Catalisador 051',
        'sequencia': '2',
        'percentual_base_gm_dmed': 33.3333333333333,
        'densidade': 0.863
      }
    ]
  },
  {
    'marca': 'Sikkens',
    'descricao': 'Autoclear Classic',
    'formula': '2:1 + 20 – 30%',
    'src_imagem': 'assets/images/sikkens.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Autoclear Classic',
        'sequencia': '1',
        'percentual_base_gm_dmed': 57.1428571428571,
        'percentual_base_gm_dmin': 58.8235294117647,
        'percentual_base_gm_dmax': 55.5555555555556,
        'densidade': 0.986
      },
      {
        'descricao': 'Hardener Classic',
        'sequencia': '2',
        'percentual_base_gm_dmed': 28.5714285714286,
        'percentual_base_gm_dmin': 29.4117647058824,
        'percentual_base_gm_dmax': 27.7777777777778,
        'densidade': 0.981
      },
      {
        'descricao': 'Plus Reducer',
        'sequencia': '3',
        'percentual_base_gm_dmed': 14.2857142857143,
        'percentual_base_gm_dmin': 11.7647058823529,
        'percentual_base_gm_dmax': 16.6666666666667,
        'densidade': 0.903
      }
    ]
  },
  {
    'marca': 'Sikkens',
    'descricao': 'Autoclear Plus HS',
    'formula': '2:1 + 10 – 20%',
    'src_imagem': 'assets/images/sikkens.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Autoclear Plus HS',
        'sequencia': '1',
        'percentual_base_gm_dmed': 60.6060606060606,
        'percentual_base_gm_dmin': 62.5,
        'percentual_base_gm_dmax': 58.8235294117647,
        'densidade': 0.981
      },
      {
        'descricao': 'Endurecedor P25/P35',
        'sequencia': '2',
        'percentual_base_gm_dmed': 30.3030303030303,
        'percentual_base_gm_dmin': 31.25,
        'percentual_base_gm_dmax': 29.4117647058824,
        'densidade': 0.99
      },
      {
        'descricao': 'Plus Reducer',
        'sequencia': '3',
        'percentual_base_gm_dmed': 9.09090909090909,
        'percentual_base_gm_dmin': 6.25,
        'percentual_base_gm_dmax': 11.7647058823529,
        'densidade': 0.903
      }
    ]
  },
  {
    'marca': 'Sikkens',
    'descricao': 'Primer Classic',
    'formula': '5:1 + 20 – 30%',
    'src_imagem': 'assets/images/sikkens.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer Classic',
        'sequencia': '1',
        'percentual_base_gm_dmed': 68.9655172413793,
        'percentual_base_gm_dmin': 71.4285714285714,
        'percentual_base_gm_dmax': 66.6666666666667,
        'densidade': 1.467
      },
      {
        'descricao': 'Hardener Classic',
        'sequencia': '2',
        'percentual_base_gm_dmed': 13.7931034482759,
        'percentual_base_gm_dmin': 14.2857142857143,
        'percentual_base_gm_dmax': 13.3333333333333,
        'densidade': 0.981
      },
      {
        'descricao': 'Plus Reducer',
        'sequencia': '3',
        'percentual_base_gm_dmed': 17.2413793103448,
        'percentual_base_gm_dmin': 14.2857142857143,
        'percentual_base_gm_dmax': 20,
        'densidade': 0.903
      }
    ]
  },
  {
    'marca': 'Sikkens',
    'descricao': 'Primer Classic FAST',
    'formula': '4:1 + 10 - 20%',
    'src_imagem': 'assets/images/sikkens.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer Classic FAST',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.4285714285714,
        'percentual_base_gm_dmin': 74.0740740740741,
        'percentual_base_gm_dmax': 68.9655172413793,
        'densidade': 1.498
      },
      {
        'descricao': 'Hardener Classic FAST',
        'sequencia': '2',
        'percentual_base_gm_dmed': 17.8571428571429,
        'percentual_base_gm_dmin': 18.5185185185185,
        'percentual_base_gm_dmax': 17.2413793103448,
        'densidade': 0.965
      },
      {
        'descricao': 'Plus Reducer',
        'sequencia': '3',
        'percentual_base_gm_dmed': 10.7142857142857,
        'percentual_base_gm_dmin': 7.40740740740741,
        'percentual_base_gm_dmax': 13.7931034482759,
        'densidade': 0.903
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'PRIMER PU HS 9.500 6:1 CINZA',
    'formula': '6:1 + 20%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'PRIMER PU HS 9.500 6:1 CINZA',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.4285714285714,
        'densidade': 1.567
      },
      {
        'descricao': 'Endurecedor 095 / 195',
        'sequencia': '2',
        'percentual_base_gm_dmed': 11.9047619047619,
        'densidade': 1.062
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'SKY41 - SKYPRIMER PU 4:1',
    'formula': '4:1 + 20%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'SKY41 - SKYPRIMER PU 4:1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.57
      },
      {
        'descricao': 'Endurecedor END41',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.989
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'SKY51 - SKYPRIMER PU 5:1',
    'formula': '5:1 + 20%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'SKY51 - SKYPRIMER PU 5:1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 69.4444444444444,
        'densidade': 1.568
      },
      {
        'descricao': 'Endurecedor END51',
        'sequencia': '2',
        'percentual_base_gm_dmed': 13.8888888888889,
        'densidade': 0.99
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'SKY71 - SKYPRIMER PU 7:1',
    'formula': '7:1 + 10 – 30%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'SKY71 - SKYPRIMER PU 7:1',
        'sequencia': '1',
        'percentual_base_gm_dmed': 72.9166666666667,
        'percentual_base_gm_dmin': 79.5454545454545,
        'percentual_base_gm_dmax': 67.3076923076923,
        'densidade': 1.629
      },
      {
        'descricao': 'Endurecedor END71',
        'sequencia': '2',
        'percentual_base_gm_dmed': 10.4166666666667,
        'percentual_base_gm_dmin': 11.3636363636364,
        'percentual_base_gm_dmax': 9.61538461538461,
        'densidade': 1
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'percentual_base_gm_dmin': 9.09090909090909,
        'percentual_base_gm_dmax': 23.0769230769231,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'SKY81 - SKYPRIMER PU 8:1 Cinza',
    'formula': '8:1 + 25%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'SKY81 - SKYPRIMER PU 8:1 Cinza',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.1111111111111,
        'densidade': 1.442
      },
      {
        'descricao': 'Endurecedor END81',
        'sequencia': '2',
        'percentual_base_gm_dmed': 8.88888888888889,
        'densidade': 1.026
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 20,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'SKY82 - SKYPRIMER PU 8:1 - Branco',
    'formula': '8:1 + 25%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'SKY82 - SKYPRIMER PU 8:1 - Branco',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.1111111111111,
        'densidade': 1.609
      },
      {
        'descricao': 'Endurecedor END81',
        'sequencia': '2',
        'percentual_base_gm_dmed': 8.88888888888889,
        'densidade': 1.026
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 20,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'SKY83 - SKYPRIMER PU 8:1 - Preto',
    'formula': '8:1 + 25%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'SKY83 - SKYPRIMER PU 8:1 - Preto',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.1111111111111,
        'densidade': 1.574
      },
      {
        'descricao': 'Endurecedor END81',
        'sequencia': '2',
        'percentual_base_gm_dmed': 8.88888888888889,
        'densidade': 1.026
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 20,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz Alto Sólidos 12.000',
    'formula': '3:1',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Alto Sólidos 12.000',
        'sequencia': '1',
        'percentual_base_gm_dmed': 75,
        'densidade': 0.959
      },
      {
        'descricao': 'Endurecedor 120 / 121',
        'sequencia': '2',
        'percentual_base_gm_dmed': 25,
        'densidade': 0.992
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz Alto Sólidos 12.500',
    'formula': '5:1',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Alto Sólidos 12.500',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.948
      },
      {
        'descricao': 'Endurecedor 125 / 126',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.025
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz Alto Sólidos 13.000',
    'formula': '2:1 + 15%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Alto Sólidos 13.000',
        'sequencia': '1',
        'percentual_base_gm_dmed': 57.9710144927536,
        'densidade': 0.974
      },
      {
        'descricao': 'Endurecedor 130 / 131',
        'sequencia': '2',
        'percentual_base_gm_dmed': 28.9855072463768,
        'densidade': 0.973
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 13.0434782608696,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz Alto Sólidos 15000',
    'formula': '4:1 + 20%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Alto Sólidos 15000',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 0.992
      },
      {
        'descricao': 'Endurecedor 150 / 151',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.062
      },
      {
        'descricao': 'Thinner TH700/732/735',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz Fosco PU',
    'formula': '5:1',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Fosco PU',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.939
      },
      {
        'descricao': 'Endurecedor SK028',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.022
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz PU Bicomponente 10000',
    'formula': '5:1',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz PU Bicomponente 10000',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.945
      },
      {
        'descricao': 'Endurecedor 100 / 110',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.032
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz PU Bicomponente 5000',
    'formula': '5:1',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz PU Bicomponente 5000',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.927
      },
      {
        'descricao': 'Endurecedor 050',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.954
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz Skyfast HS 4:1 RR100',
    'formula': '4:1:1',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Skyfast HS 4:1 RR100',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 1.617
      },
      {
        'descricao': 'Endurecedor RR010',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 1.08
      },
      {
        'descricao': 'Thinner TH700',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Skylack',
    'descricao': 'Verniz Skyfast HS 5:1 RR200',
    'formula': '5:1 + 20%',
    'src_imagem': 'assets/images/skylack.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz Skyfast HS 5:1 RR200',
        'sequencia': '1',
        'percentual_base_gm_dmed': 69.4444444444444,
        'densidade': 0.918
      },
      {
        'descricao': 'Endurecedor RR020',
        'sequencia': '2',
        'percentual_base_gm_dmed': 13.8888888888889,
        'densidade': 1.106
      },
      {
        'descricao': 'Thinner TH700',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.87
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Preto Fosco Vinílico',
    'formula': '2:1',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Preto Fosco Vinílico',
        'sequencia': '1',
        'percentual_base_gm_dmed': 66.6666666666667,
        'densidade': 0.933
      },
      {
        'descricao': 'Catalis. p/ Preto F. Vinílico',
        'sequencia': '2',
        'percentual_base_gm_dmed': 33.3333333333333,
        'densidade': 0.82
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Primer PU 1100',
    'formula': '5:1 + 10 – 30%',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer PU 1100',
        'sequencia': '1',
        'percentual_base_gm_dmed': 69.4444444444444,
        'percentual_base_gm_dmin': 75.7575757575758,
        'percentual_base_gm_dmax': 64.1025641025641,
        'densidade': 1.541
      },
      {
        'descricao': 'Endurecedor 1091',
        'sequencia': '2',
        'percentual_base_gm_dmed': 13.8888888888889,
        'percentual_base_gm_dmin': 15.1515151515152,
        'percentual_base_gm_dmax': 12.8205128205128,
        'densidade': 0.965
      },
      {
        'descricao': 'Thinner 4030/4028',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'percentual_base_gm_dmin': 9.09090909090909,
        'percentual_base_gm_dmax': 23.0769230769231,
        'densidade': 0.886
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Primer PU 3100',
    'formula': '8:1 + 20 – 40%',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer PU 3100',
        'sequencia': '1',
        'percentual_base_gm_dmed': 68.3760683760684,
        'percentual_base_gm_dmin': 74.0740740740741,
        'percentual_base_gm_dmax': 63.4920634920635,
        'densidade': 1.461
      },
      {
        'descricao': 'Endurecedor 3093',
        'sequencia': '2',
        'percentual_base_gm_dmed': 8.54700854700855,
        'percentual_base_gm_dmin': 9.25925925925926,
        'percentual_base_gm_dmax': 7.93650793650794,
        'densidade': 0.984
      },
      {
        'descricao': 'Thinner 4030/4028',
        'sequencia': '3',
        'percentual_base_gm_dmed': 23.0769230769231,
        'percentual_base_gm_dmin': 16.6666666666667,
        'percentual_base_gm_dmax': 28.5714285714286,
        'densidade': 0.886
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Primer PU 4100',
    'formula': '8:1 + 20 – 30%',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer PU 4100',
        'sequencia': '1',
        'percentual_base_gm_dmed': 71.1111111111111,
        'percentual_base_gm_dmin': 74.0740740740741,
        'percentual_base_gm_dmax': 68.3760683760684,
        'densidade': 1.452
      },
      {
        'descricao': 'Endurecedor 3093',
        'sequencia': '2',
        'percentual_base_gm_dmed': 8.88888888888889,
        'percentual_base_gm_dmin': 9.25925925925926,
        'percentual_base_gm_dmax': 8.54700854700855,
        'densidade': 0.984
      },
      {
        'descricao': 'Thinner 4030/4028',
        'sequencia': '3',
        'percentual_base_gm_dmed': 20,
        'percentual_base_gm_dmin': 16.6666666666667,
        'percentual_base_gm_dmax': 23.0769230769231,
        'densidade': 0.886
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Primer PU 5100',
    'formula': '5:1 + 20 – 40%',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Primer PU 5100',
        'sequencia': '1',
        'percentual_base_gm_dmed': 64.1025641025641,
        'percentual_base_gm_dmin': 69.4444444444444,
        'percentual_base_gm_dmax': 59.5238095238095,
        'densidade': 1.44
      },
      {
        'descricao': 'Endurecedor 3093/3090',
        'sequencia': '2',
        'percentual_base_gm_dmed': 12.8205128205128,
        'percentual_base_gm_dmin': 13.8888888888889,
        'percentual_base_gm_dmax': 11.9047619047619,
        'densidade': 0.984
      },
      {
        'descricao': 'Thinner 4030/4028',
        'sequencia': '3',
        'percentual_base_gm_dmed': 23.0769230769231,
        'percentual_base_gm_dmin': 16.6666666666667,
        'percentual_base_gm_dmax': 28.5714285714286,
        'densidade': 0.886
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'PU Cor Pronta',
    'formula': '4:1+20-30%',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'PU Cor Pronta',
        'sequencia': '1',
        'percentual_base_gm_dmed': 64,
        'percentual_base_gm_dmin': 66.6666666666667,
        'percentual_base_gm_dmax': 61.5384615384615,
        'densidade': 1.03
      },
      {
        'descricao': 'Endurecedor p/ PU',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16,
        'percentual_base_gm_dmin': 16.6666666666667,
        'percentual_base_gm_dmax': 15.3846153846154,
        'densidade': 0.979
      },
      {
        'descricao': 'Thinner 4030/4028',
        'sequencia': '3',
        'percentual_base_gm_dmed': 20,
        'percentual_base_gm_dmin': 16.6666666666667,
        'percentual_base_gm_dmax': 23.0769230769231,
        'densidade': 0.886
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Sealer',
    'formula': '5:1 + 10-30%',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Sealer',
        'sequencia': '1',
        'percentual_base_gm_dmed': 69.4444444444444,
        'percentual_base_gm_dmin': 75.7575757575758,
        'percentual_base_gm_dmax': 64.1025641025641,
        'densidade': 1.228
      },
      {
        'descricao': 'Endurecedor 3093',
        'sequencia': '2',
        'percentual_base_gm_dmed': 13.8888888888889,
        'percentual_base_gm_dmin': 15.1515151515152,
        'percentual_base_gm_dmax': 12.8205128205128,
        'densidade': 0.984
      },
      {
        'descricao': 'Thinner 4030/4028',
        'sequencia': '3',
        'percentual_base_gm_dmed': 16.6666666666667,
        'percentual_base_gm_dmin': 9.09090909090909,
        'percentual_base_gm_dmax': 23.0769230769231,
        'densidade': 0.886
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Verniz PU 1100',
    'formula': '5:1',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz PU 1100',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.934
      },
      {
        'descricao': 'Endurecedor 1091',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.965
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Verniz PU 4100',
    'formula': '5:1',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz PU 4100',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.945
      },
      {
        'descricao': 'Endurecedor 3093/3090',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.984
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Verniz PU 5100 HS',
    'formula': '5:1',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz PU 5100 HS',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.956
      },
      {
        'descricao': 'Endurecedor 3093/3090',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.984
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Verniz PU 5500',
    'formula': '5:1',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED'],
    'items': [
      {
        'descricao': 'Verniz PU 5500',
        'sequencia': '1',
        'percentual_base_gm_dmed': 83.3333333333333,
        'densidade': 0.953
      },
      {
        'descricao': 'Endurecedor 3093/3090',
        'sequencia': '2',
        'percentual_base_gm_dmed': 16.6666666666667,
        'densidade': 0.984
      }
    ]
  },
  {
    'marca': 'Wanda',
    'descricao': 'Verniz PU 9100',
    'formula': '2:1 + 20 – 30%',
    'src_imagem': 'assets/images/wanda.png',
    'diluicao': ['MED', 'MIN', 'MAX'],
    'items': [
      {
        'descricao': 'Verniz PU 9100',
        'sequencia': '1',
        'percentual_base_gm_dmed': 53.3333333333333,
        'percentual_base_gm_dmin': 55.5555555555556,
        'percentual_base_gm_dmax': 51.2820512820513,
        'densidade': 0.983
      },
      {
        'descricao': 'Endurecedor 3093/3090/3088',
        'sequencia': '2',
        'percentual_base_gm_dmed': 26.6666666666667,
        'percentual_base_gm_dmin': 27.7777777777778,
        'percentual_base_gm_dmax': 25.6410256410256,
        'densidade': 0.984
      },
      {
        'descricao': 'Thinner 4030/4028',
        'sequencia': '3',
        'percentual_base_gm_dmed': 20,
        'percentual_base_gm_dmin': 16.6666666666667,
        'percentual_base_gm_dmax': 23.0769230769231,
        'densidade': 0.886
      }
    ]
  },
];
