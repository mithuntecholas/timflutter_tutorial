class Post{
   String post_title;
   String author="";
   int likes=0;
   bool user_liked=false;

   Post(this.post_title,this.author);

   int updateLikes(){
      this.user_liked= !this.user_liked;
      if (this.user_liked)
         {
            this.likes+=1;
         }
      else{
         this.likes-=1;
      }
      return this.likes;
   }




}