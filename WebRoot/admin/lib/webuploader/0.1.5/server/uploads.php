class UploaderController extends XXXX_Controller {
       public function index() {
           $files = array();
           $success = 0;    //�û�ͳ���ж�����ͼƬ�ϴ��ɹ���
           
           foreach ($_FILES as $item) {
               $index = count($files);
   
               $files[$index]['srcName'] = $item['name'];    //�ϴ�ͼƬ��ԭ����
              $files[$index]['error'] = $item['error'];    //�͸��ļ��ϴ���صĴ������
              $files[$index]['size'] = $item['size'];        //���ϴ��ļ��Ĵ�С����λΪ�ֽ�
              $files[$index]['type'] = $item['type'];        //�ļ��� MIME ���ͣ���Ҫ������ṩ����Ϣ��֧�֣�����"image/gif"
              $files[$index]['success'] = false;            //������ڱ�־��ͼƬ�Ƿ��ϴ��ɹ�
              $files[$index]['path'] = '';                //��ͼƬ·��
  
              // ���չ�����û�д���
              if($item['error'] != 0) continue;
              //�ж�ͼƬ�ܲ����ϴ�
              if(!is_uploaded_file($item['tmp_name'])) {
                  $files[$index]['error'] = 8000;
                  continue;
              }
              //��չ��
              $extension = '';
              if(strcmp($item['type'], 'image/jpeg') == 0) {
                  $extension = '.jpg';
              }
              else if(strcmp($item['type'], 'image/png') == 0) {
                  $extension = '.png';
              }
              else if(strcmp($item['type'], 'image/gif') == 0) {
                  $extension = '.gif';
              }
              else {
                  //���type�����������ߣ����Ǿʹ�ͼƬԭ��������ȥ��ȡ�ж�ȥȡ��(�����Ͻ���)    
                  $substr = strrchr($item['name'], '.');
                  if(FALSE == $substr) {
                      $files[$index]['error'] = 8002;
                      continue;
                  }
  
                  //ȡ��Ԫ���ֵ���չ������ͨ����չ��ȥ��type���϶�Ӧ��ֵ
                  if(strcasecmp($substr, '.jpg') == 0 || strcasecmp($substr, '.jpeg') == 0 || strcasecmp($substr, '.jfif') == 0 || strcasecmp($substr, '.jpe') == 0 ) {
                      $files[$index]['type'] = 'image/jpeg';
                  }
                  else if(strcasecmp($substr, '.png') == 0) {
                      $files[$index]['type'] = 'image/png';
                  }
                  else if(strcasecmp($substr, '.gif') == 0) {
                      $files[$index]['type'] = 'image/gif';
                  }
                  else {
                      $files[$index]['error'] = 8003;
                      continue;
                  }
                  $extension = $substr;
              }
  
              //����ʱ�ļ������ܣ����ں������ɸ��ӵ����ļ���
              $md5 = md5_file($item['tmp_name']);
              //ȡ��ͼƬ�Ĵ�С
              $imageInfo = getimagesize($item['tmp_name']);
              $rawImageWidth = $imageInfo[0];
              $rawImageHeight = $imageInfo[1];
  
              //����ͼƬ�ϴ�·��������upload�ļ��У��������������ļ��з���洢��
              //rtrim(base_url(), '/')��ʵ������վ�ĸ�Ŀ¼������Լ�����
              $path = rtrim(base_url(), '/') . '/upload/' . date('Ymd') . '/';
              //ȷ��Ŀ¼��д
              ensure_writable_dir($path);
              //�ļ���
              $name = "$md5.0x{$rawImageWidth}x{$rawImageHeight}{$extension}";
              //����ͼƬ�ļ�û�仯����Ҳ���Ǵ��ڣ��Ͳ����ظ��ϴ��ˣ����������ϴ�
              $ret = file_exists($path . $name) ? true : move_uploaded_file($item['tmp_name'], $serverPath . $name);
              if($ret === false) {
                  $files[$index]['error'] = 8004;
                  continue;
              }
              else {
                  $files[$index]['path'] = $path . $name;        //��ͼƬ·��
                  $files[$index]['success'] = true;            //ͼƬ�ϴ��ɹ���־
                  $files[$index]['width'] = $rawImageWidth;    //ͼƬ���
                  $files[$index]['height'] = $rawImageHeight;    //ͼƬ�߶�
                  $success ++;    //�ɹ�+1
              }
          }
  
          //��ͼƬ��json��ʽ���ظ�js����ҳ��  �������ҿ��Ըĳ��Լ���json���ش������
          echo json_encode(array(
              'total' => count($files),
              'success' => $success,
              'files' => $files,
          ));
      }
  }
  /*********************************�ָ�*************************************************/
  //�����Ҹ���ensure_writable_dir()�����Ĵ���
  /**
  * ȷ���ļ��д��ڲ���д
 *
 * @param string $dir
 */
 function ensure_writable_dir($dir) {
     if(!file_exists($dir)) {
         mkdir($dir, 0766, true);
         chmod($dir, 0766);
         chmod($dir, 0777);
     }
     else if(!is_writable($dir)) {
         chmod($dir, 0766);
         chmod($dir, 0777);
         if(!is_writable($dir)) {
             throw new FileSystemException("Ŀ¼ $dir ����д");
         }
     }
 }