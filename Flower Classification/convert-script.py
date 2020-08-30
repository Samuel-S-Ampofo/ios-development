import coremltools

caffe_modle = ('oxford102.caffemodel', 'deploy.prototxt')

labels = 'flower-labels.txt'
coreml_model = coremltools.converters.caffe.convert(
    caffe_modle,
    class_labels = labels,
    image_input_names = 'data'
)

coreml_model.save('FlowerClassifier.mlmodel')
