//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ChatApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Message
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Message()
        {
            this.Replies = new HashSet<Message>();
            this.UsersDown = new HashSet<ChatUser>();
            this.UsersUp = new HashSet<ChatUser>();
        }
    
        public long Id { get; set; }
        public int IdRoom { get; set; }
        public int IdSender { get; set; }
        public Nullable<int> IdReceiver { get; set; }
        public Nullable<long> IdRepliedMessage { get; set; }
        public string Content { get; set; }
        public System.DateTime DateTimeSent { get; set; }
        public int CountUp { get; set; }
        public int CountDown { get; set; }
    
        public virtual ChatUser Receiver { get; set; }
        public virtual ChatUser Sender { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Message> Replies { get; set; }
        public virtual Message RepliedMessage { get; set; }
        public virtual Room Room { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChatUser> UsersDown { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChatUser> UsersUp { get; set; }
    }
}
