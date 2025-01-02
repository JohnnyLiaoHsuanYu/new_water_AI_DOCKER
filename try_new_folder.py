import os 
import json as js


predic_path = '/app/prediction_result/'

try:
    os.makedirs(predic_path, exist_ok=True)
    print('I am here!!!!!!!!!!!!!!!!!!!!!')
except:
    print("Fuck U The World!!!!!!!!!!!!!!!")



jsonfile = open('waterAI_result___.json', mode='w')
output = {'date': 0,
            'lon': 1,
            'lat': 2,
            'level': 3,
            'precip': 4,
            'resevior': 5,
            'resevior_name': 6,
    }
    
js.dump(output, jsonfile, ensure_ascii=False)
jsonfile.close()


jsonfile = open('/app/prediction_result/' + 'waterAI_result___.json', mode='w')