public class ProgressBean {
    private int id;
    private String name;
    private String qualification;
    private String progress;
    private String notes;

    // Getters and setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String doctorNotes) {
        this.notes = doctorNotes;
    }
}
