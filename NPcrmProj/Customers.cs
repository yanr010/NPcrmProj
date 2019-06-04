//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NPcrmProj
{
    using System;
    using System.Collections.Generic;
    
    public partial class Customers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customers()
        {
            this.Tasks = new HashSet<Tasks>();
            this.Categories = new HashSet<Categories>();
            this.Departments = new HashSet<Departments>();
            this.Projects = new HashSet<Projects>();
            this.Reports = new HashSet<Reports>();
        }
    
        public string Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public System.DateTime BirthDate { get; set; }
        public string immigrationCountry { get; set; }
        public Nullable<System.DateTime> immigrationDate { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Status { get; set; }
        public Nullable<int> Children { get; set; }
        public byte[] License { get; set; }
        public byte[] Car { get; set; }
        public string LicenseType { get; set; }
        public byte[] PartnerWork { get; set; }
        public string HealthStatus { get; set; }
        public string Allowance { get; set; }
        public int YearsofEducation { get; set; }
        public string Education { get; set; }
        public byte[] Student { get; set; }
        public string Studyfield { get; set; }
        public Nullable<int> Year { get; set; }
        public string University { get; set; }
        public string AcademicDegree { get; set; }
        public string Qualification { get; set; }
        public string Hebrew { get; set; }
        public string English { get; set; }
        public string Arabic { get; set; }
        public string Russian { get; set; }
        public string language1 { get; set; }
        public string language2 { get; set; }
        public string MilitaryService { get; set; }
        public string role { get; set; }
        public Nullable<System.DateTime> recruitmentDate { get; set; }
        public string ServiceType { get; set; }
        public Nullable<System.DateTime> ReleaseDate { get; set; }
        public string ReleaseReason { get; set; }
        public byte[] WorkStatus { get; set; }
        public string LastWork { get; set; }
        public byte[] Work3Month { get; set; }
        public int Month2Years { get; set; }
        public string Services { get; set; }
        public string Directions_ { get; set; }
        public string Summary { get; set; }
        public string Jobs { get; set; }
        public string distribution { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tasks> Tasks { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Categories> Categories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Departments> Departments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Projects> Projects { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reports> Reports { get; set; }
    }
}
