namespace :db do
  desc 'fill the database with goodies to work with'
  task :populate => :environment do
    Admin.delete_all
    Post.delete_all
    Admin.create(email: 'dl@example.com', password: 'password')

    3.times do |i|
      Post.create(
        title: "Post #{i}",
        published: 'true',
        body: "apibus ut auctor lundium proin, magnis eros sociis tincidunt, arcu arcu dis penatibus a enim cras in, dolor, parturient in urna enim ut etiam porta turpis velit etiam in porta nec dolor cum, integer platea proin purus proin augue, vut, urna aliquam cum et ac, et turpis. Nunc facilisis a parturient penatibus ultricies in? Nec vel, nec ac placerat rhoncus, augue facilisis elit, augue, nec, est. Turpis ac integer mauris diam nascetur? Dapibus turpis dignissim nec, porta, magnis, nisi est elit. Eu, auctor lacus. Mattis mid diam? Mattis, est turpis, duis turpis adipiscing scelerisque cum aliquet, ultrices aliquam, diam odio? Risus lectus cursus magna mattis augue cursus? Sagittis dis quis urna augue penatibus integer? Amet v"
      )
    end


  end
end
