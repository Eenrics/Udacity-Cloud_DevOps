Hi This is Abenezer explaining the project 



                            Sorry for not understanding you at the first and second time. Here it is the loadbalancer URL.
	    --------------------------------------------------------------------------------------------------------------------------------------
	    ______________________________________________________________________________________________________________________________________
	   |                                                                                                                                      |
	   |                          http://testS-WebAp-Q25NQNFEBXA9-867836533.us-east-1.elb.amazonaws.com                                       |
	   |______________________________________________________________________________________________________________________________________|



-- > Please follow the steps :
	
	* There is a jpeg file called "Proj-IAC_Diagram.png" in this directory. You can check the diagram first

	
	* Now we need to create the network infrastructures .. You can do it so by running one of the following commands

			./prepare_networks.sh

		--> If you want to explicitly mention the arguments, you can do so by running ...

			./create.sh <stackName> network-udagram.yml network-udagram_param.json


	***************************************************************************************************************************************************************************************
	*    !!!   PLEASE WAIT UNTIL THIS STACK CREATED! THE NEXT STACK USES OUTPUT FROM THIS STACK AND IF YOU PRECEED WITHOUT LETTING THIS STACK FINISH FIRST, YOU WILL GET AN ERROR !!!    **
	***************************************************************************************************************************************************************************************


	* Now we need to create the server infrastructures .. You can do it so by running one of the following commands

                        ./prepare_servers.sh

                --> If you want to explicitly mention the arguments, you can do so by running ...

                        ./create.sh <stackName> server-udagram.yml server-udagram_param.json

	* The URL for the load balancer will be exported in cloudFormation output. Go and check it out. You shoud see a page with Udagram text.

		--> or you can use this command to extract the url ... run 

			aws cloudformation describe-stacks | grep http://





	TO DELETE THE STACKS AND RESOURCES


        * delete the server infrastructure first.. run

                        ./remove_servers.sh

                --> If you want to explicitly mention the arguments, you can do so by running ...

                        ./delete.sh <stackName> 

        * After making sure the server infrastructure are deleted, delete the network infrasture , run ...

                        ./remove_networks.sh

                --> If you want to explicitly mention the arguments, you can do so by running ...

                        ./delete.sh <stackName> 



Name:		ABENEZER ESHETIE 
Email:		ebenezeresh525@gmail.com
