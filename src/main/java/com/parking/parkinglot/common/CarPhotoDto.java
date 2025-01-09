package com.parking.parkinglot.common;

public class CarPhotoDto {
    private Long id;
    private String fileName;
    private String filePath;
    private byte[] fileContent;

    public CarPhotoDto(Long id, String fileName, String filePath, byte[] fileContent) {
        this.id = id;
        this.fileName = fileName;
        this.filePath = filePath;
        this.fileContent = fileContent;
    }

    public Long getId() {
        return id;
    }

    public String getFileName() {
        return fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public byte[] getFileContent() {
        return fileContent;
    }

    public String getFileType() {
        return "image/png";
    }
}
