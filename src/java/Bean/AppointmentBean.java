public class AppointmentBean {
    private String candidateId;
    private String candidateName;
    private String appointmentDate;
    private String qualification; // Added missing qualification field

    // Getters and Setters
    public String getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getQualification() { // Getter for qualification
        return qualification;
    }

    public void setQualification(String qualification) { // Setter for qualification
        this.qualification = qualification;
    }
}
