#rendering function

render_vector = function(vector, file_name, no.atlasROIS){
  render_to_Schaefer_200 <- function(path_to_200_ROI_vector_txt_file, output_folder, out_file){
    Schaefer_dlabel="N:/Schaefer2018_200Parcels_17Networks_order.dlabel.nii"
    Schaefer_dscalar="N:/Schaefer2018_200Parcels_17Networks_order.dscalar.nii"
    Schaefer_pscalar="N:/Schaefer2018_200Parcels_17Networks_order.pscalar.nii"
    wb_command = "N:/wb_command.exe"
    command = paste0(wb_command, " -cifti-convert -from-text ", path_to_200_ROI_vector_txt_file, " ", Schaefer_pscalar, " ", out_file)
    system(command)
    
  }
  
  render_to_Schaefer_400 <- function(path_to_400_ROI_vector_txt_file, output_folder, out_file){
    Schaefer_dlabel="N:/Schaefer2018_400Parcels_17Networks_order.dlabel.nii"
    Schaefer_dscalar="N:/Schaefer2018_400Parcels_17Networks_order.dscalar.nii"
    Schaefer_pscalar="N:/Schaefer2018_400Parcels_17Networks_order.pscalar.nii"
    wb_command = "N:/wb_command.exe"
    command = paste0(wb_command, " -cifti-convert -from-text ", path_to_400_ROI_vector_txt_file, " ", Schaefer_pscalar, " ", out_file)
    system(command)
  }
  
  output_folder <- "N:/"
  
  outfile =  file_name 
  outfile_txt=paste0(output_folder, outfile,".txt") 
  write.table(vector, file = outfile_txt, row.names = F, col.names = F) 
  
  outfile_cifti=paste0(output_folder, outfile,".pscalar.nii") 
  
  if(no.atlasROIS == 200){
    
    # fill function
    render_to_Schaefer_200(outfile_txt, output_folder, outfile_cifti) 
  }
  if(no.atlasROIS == 400){
    # fill function
    render_to_Schaefer_400(outfile_txt, output_folder, outfile_cifti) 
  }
  
}