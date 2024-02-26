'''
This is a sample Python script that can be used in Apache NiFi to transform data for the 
ExecuteScript Processor. It helps in data transformation. 

Don't forget to set the processor properties to use the Python interpreter and the path to 
the Python script file. In addition, the NiFi template should be inserted into the right 
NiFi directory or container. 

Likewise, should you use containers, adjust your Dockerfile and/or Docker Compose file properly 
to include the necessary directories and Python dependencies.
'''

import json
from org.apache.nifi.processor.io import StreamCallback
from java.io import BufferedReader, InputStreamReader, OutputStreamWriter

class PyStreamCallback(StreamCallback):
    def __init__(self):
        pass

    def process(self, inputStream, outputStream):
        reader = BufferedReader(InputStreamReader(inputStream))
        writer = OutputStreamWriter(outputStream)
        try:
            # Read the input FlowFile content
            inputText = reader.readLine()
            while inputText:
                # Assume the input is a JSON string and we want to transform it
                data = json.loads(inputText)
                
                # Example transformation: add a new field or modify an existing field
                data['new_field'] = 'transformed value'
                
                # Convert back to JSON string
                outputText = json.dumps(data)
                
                # Write the transformed data to the output FlowFile
                writer.write(outputText)
                writer.flush()
                
                # Read the next line if your data spans multiple lines
                inputText = reader.readLine()
        finally:
            reader.close()
            writer.close()

# Define a session variable from the NiFi context
session = session

# Create a FlowFile in the session to process
flowFile = session.get()
if flowFile != None:
    # Perform the transformation by passing the custom StreamCallback
    flowFile = session.write(flowFile, PyStreamCallback())
    
    # Transfer the transformed FlowFile to the next stage
    session.transfer(flowFile, REL_SUCCESS)
