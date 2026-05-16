import '../models/pokemon_models.dart';

const Map<String, PokemonMeta> pokemonMetaData = {

  'bulbasaur': PokemonMeta(
    hint: 'Hạt giống trên lưng, lớn lên cùng Bulbasaur.',
    lore: 'Khi sinh ra, một hạt giống kỳ lạ đã được gieo trên lưng nó. Cây đó phát triển cùng với Pokémon này, cung cấp năng lượng và sức mạnh. Bulbasaur chăm sóc hạt giống, và đổi lại, nó nhận được sự bảo vệ và dinh dưỡng từ cây.',
    rarity: 'rare',
  ),

  'ivysaur': PokemonMeta(
    hint: 'Lá trên lưng phình to, cây không đứng thẳng được.',
    lore: 'Khi nụ hoa trên lưng Ivysaur lớn dần và nặng trĩu, sức nặng khiến nó khó khăn trong việc đứng thẳng bằng hai chân sau. Nụ này chứa đựng những chất dinh dưỡng cần thiết cho sự phát triển, đôi khi còn lan tỏa hương thơm ngọt ngào thu hút bướm.',
    rarity: 'rare',
  ),

  'venusaur': PokemonMeta(
    hint: 'Cây nở hoa hút năng lượng và luôn tìm ánh sáng.',
    lore: 'Hoa trên lưng nó nở rộ khi hấp thụ năng lượng mặt trời. Nó di chuyển liên tục để tìm kiếm những tia nắng ấm áp, mang lại sự sống cho mọi sinh vật xung quanh.',
    rarity: 'rare',
  ),

  'charmander': PokemonMeta(
    hint: 'Bạn nhỏ có ngọn lửa trên đuôi.',
    lore: 'Chú thằn lằn nhỏ rất thích những nơi ấm áp. Nơi nào có lửa, nơi đó có chú. Khi trời mưa, hơi nước sẽ bốc lên từ chiếc đuôi bé xinh của chú, trông như một đám mây nhỏ xíu. Chú rất thích được sưởi ấm bên bếp lửa hoặc phơi nắng trên những tảng đá.',
    rarity: 'rare',
  ),

  'charmeleon': PokemonMeta(
    hint: 'Rắn nhỏ với cái đuôi rực lửa.',
    lore: 'Trong mỗi trận chiến, nó quất chiếc đuôi đang bốc cháy của mình. Nhiệt độ xung quanh tăng lên đến mức khó chịu, khiến đối thủ phải lùi bước trước sức nóng khủng khiếp. Nó rất dũng cảm và không ngại đối đầu với bất kỳ kẻ thù nào, ngay cả khi chúng mạnh hơn nhiều. Nó luyện tập kỹ năng của mình bằng cách phun lửa từ đuôi. Khi gặp nguy hiểm, nó có thể phun ra những tia lửa mạnh mẽ để tự vệ.',
    rarity: 'rare',
  ),

  'charizard': PokemonMeta(
    hint: 'Rồng nhỏ phun lửa, đôi cánh to lớn.',
    lore: 'Sinh vật dũng mãnh này có khả năng phun ra ngọn lửa nóng bỏng, đủ sức làm tan chảy đá. Đôi khi vì quá hào hứng, nó vô tình gây ra những đám cháy lớn trong rừng. Chẳng ai muốn làm nó giận đâu nhé!',
    rarity: 'rare',
  ),

  'squirtle': PokemonMeta(
    hint: 'Rùa con phun bọt, mai đã cứng cáp.',
    lore: 'Khi vừa chào đời, mai của nó đã bắt đầu sưng lên và cứng lại. Từ miệng, nó có thể phun ra những luồng bọt mạnh mẽ. Sinh vật nhỏ bé này cực kỳ thân thiện và thích chơi đùa, đặc biệt là với nước.',
    rarity: 'rare',
  ),

  'wartortle': PokemonMeta(
    hint: 'Rùa có tai dài, thích ẩn mình dưới nước.',
    lore: 'Sinh vật này khéo léo ẩn mình dưới làn nước trong xanh, rình rập con mồi thiếu cảnh giác. Khi muốn bơi nhanh, nó vẫy vẫy đôi tai dài của mình để giữ thăng bằng, trông thật uyển chuyển và nhanh nhẹn. Đôi tai đặc biệt này giúp nó di chuyển dễ dàng trong môi trường dưới nước, khiến nó trở thành một thợ săn tài ba và một vận động viên bơi lội cừ khôi. Nó thường dành nhiều thời gian dưới nước hơn là trên cạn.',
    rarity: 'rare',
  ),

  'blastoise': PokemonMeta(
    hint: 'Rùa khổng lồ có hai khẩu pháo nước to lớn trên lưng',
    lore: 'Sinh vật to lớn này sở hữu sức mạnh phi thường, với hai ống phun nước mạnh mẽ gắn trên mai. Khi tấn công, nó có thể phun ra những luồng nước áp lực cao với tốc độ kinh hoàng, đủ sức hất tung mọi đối thủ. Chiếc mai đồ sộ không chỉ là vũ khí mà còn là lớp giáp vững chắc, bảo vệ nó khỏi mọi đòn tấn công. Dù vẻ ngoài có phần đáng sợ, nó lại là một người bạn đồng hành tận tụy và dũng cảm.',
    rarity: 'rare',
  ),

  'caterpie': PokemonMeta(
    hint: 'Chú sâu nhỏ với chân bám dính tuyệt vời.',
    lore: 'Một chú sâu nhỏ có thể leo trèo khắp nơi nhờ đôi chân có giác hút. Chúng ăn lá cây không ngừng nghỉ để lớn lên. Khi sẵn sàng, chúng sẽ nhả tơ, tạo ra một chiếc kén để biến đổi thành một dạng sống khác. Cả thế giới đang chờ đợi sự thay đổi kỳ diệu của chúng.',
    rarity: 'common',
  ),

  'metapod': PokemonMeta(
    hint: 'Nó bao bọc cơ thể bằng một chiếc kén cứng.',
    lore: 'Nó đang trong giai đoạn tiến hóa, không thể di chuyển hay tự vệ. Chiếc vỏ cứng bảo vệ nó khỏi kẻ thù. Bên trong, cơ thể đang dần thay đổi để chuẩn bị cho hình dạng mới mạnh mẽ hơn. Nó chỉ có thể chờ đợi cho đến khi lớp vỏ bên ngoài cứng lại và nó sẵn sàng bước ra thế giới.',
    rarity: 'rare',
  ),

  'butterfree': PokemonMeta(
    hint: 'Cánh nó tạo ra một đám mây phấn độc.',
    lore: 'Loài bướm này có đôi cánh tuyệt đẹp, được bao phủ bởi những vảy lấp lánh. Khi cảm thấy bị đe dọa, nó vỗ mạnh đôi cánh, giải phóng một làn bụi mịn mang theo chất độc khiến kẻ thù ngứa ngáy và buồn ngủ. Chúng thường sống ở những khu rừng có nhiều hoa, nơi chúng có thể hút mật ngọt và tìm kiếm bạn đời. Mặc dù có khả năng phòng vệ mạnh mẽ, chúng rất hiền lành và chỉ tấn công khi cần thiết.',
    rarity: 'rare',
  ),

  'weedle': PokemonMeta(
    hint: 'Con sâu nhỏ có gai độc trên đầu.',
    lore: 'Sinh vật bé nhỏ này thường lang thang trong rừng, say sưa ăn lá cây. Chiếc gai nhọn trên đỉnh đầu không chỉ để trang trí mà còn chứa nọc độc. Nó là một loài côn trùng thường được tìm thấy ở những nơi có nhiều cây cối và lá xanh, là thức ăn yêu thích của nó.',
    rarity: 'common',
  ),

  'kakuna': PokemonMeta(
    hint: 'Bọc mình trong lớp vỏ cứng để giữ an toàn.',
    lore: 'Cậu bé này dành phần lớn thời gian của mình trong một chiếc kén cứng. Nó không thể di chuyển nhiều, nhưng lớp vỏ của nó rất chắc chắn. Nó chờ đợi ngày mình trở thành một sinh vật tuyệt vời hơn. Đây là một giai đoạn phát triển rất quan trọng, nơi nó thu thập năng lượng và chuẩn bị cho sự biến đổi lớn.',
    rarity: 'rare',
  ),

  'beedrill': PokemonMeta(
    hint: 'Ong vàng có ba cái kim độc để chích liên tục.',
    lore: 'Sinh vật này có ba chiếc kim sắc nhọn, một ở chiếc chân trước và hai ở đuôi. Chúng sử dụng những chiếc kim này để tấn công kẻ thù một cách tàn nhẫn. Màu vàng và đen đặc trưng giúp nó nổi bật giữa đám đông. Với tốc độ nhanh như chớp, nó có thể tiếp cận và tấn công đối thủ trước khi chúng kịp phản ứng. Đòn tấn công kết hợp từ ba chiếc kim độc này gây ra sát thương lớn và khiến kẻ địch tê liệt.',
    rarity: 'rare',
  ),

  'pidgey': PokemonMeta(
    hint: 'Chim nhỏ màu nâu quen thuộc, hay bay lượn gần mặt đất.',
    lore: 'Loài chim nhỏ nhắn này thường thấy ở những khu rừng và bụi cây. Khi cảm thấy bị đe dọa, chúng sẽ vỗ cánh mạnh mẽ, tạo ra một đám bụi cát mù mịt để đánh lạc hướng kẻ thù. Bộ lông màu nâu giúp chúng dễ dàng ẩn mình giữa tán lá cây. Chúng rất nhanh nhẹn và thường tìm kiếm thức ăn trên mặt đất.',
    rarity: 'common',
  ),

  'pidgeotto': PokemonMeta(
    hint: 'Chim lông nâu, hay cãi nhau, rất hay mổ',
    lore: 'Sinh vật bé nhỏ này rất yêu quý lãnh thổ rộng lớn của mình. Nó luôn sẵn sàng dùng cái mỏ nhọn hoắt để tấn công bất cứ ai dám xâm phạm. Mỗi khi cảm thấy lãnh thổ bị đe dọa, nó sẽ bay lượn trên không trung và tạo ra những tiếng kêu cảnh báo đầy giận dữ. Nó cực kỳ trung thành với tổ ấm và sẵn sàng chiến đấu hết mình để bảo vệ.',
    rarity: 'rare',
  ),

  'pidgeot': PokemonMeta(
    hint: 'Chim lớn với bộ lông xù và đôi cánh mạnh mẽ.',
    lore: 'Loài chim này vút đi trên mặt nước với tốc độ kinh hoàng để săn những con mồi bất cẩn. Với đôi cánh lớn và bộ lông dày mượt, nó lướt đi như một cơn gió, đôi mắt tinh anh luôn tìm kiếm những sinh vật nhỏ bé ở dưới làn nước trong xanh.',
    rarity: 'rare',
  ),

  'rattata': PokemonMeta(
    hint: 'Chú chuột nhỏ nhanh nhẹn, có răng cửa dài.',
    lore: 'Chú ta thích gặm nhấm mọi thứ xung quanh. Với thân hình bé nhỏ và tốc độ đáng kinh ngạc, bạn có thể dễ dàng bắt gặp chú ta ở nhiều nơi khác nhau, từ những cánh đồng xanh mướt đến những con đường nhộn nhịp. Chú ta rất hay đi kiếm ăn vào ban đêm và có thể sinh sản cực kỳ nhanh chóng.',
    rarity: 'common',
  ),

  'raticate': PokemonMeta(
    hint: 'Chuột nhỏ hay gặm nhấm, giữ thăng bằng bằng ria.',
    lore: 'Loài gặm nhấm này sống ở nhiều nơi, từ công viên đến đường phố. Chúng hay đi ăn đêm và nhấm nháp mọi thứ tìm được. Bộ ria mép giúp chúng đi lại khéo léo, ngay cả trên địa hình khó. Nếu ria bị cắt, chúng sẽ đi chậm chạp hơn và dễ bị vấp ngã. Chúng có chiếc đuôi dài và cái mũi luôn ngọ nguậy để đánh hơi thức ăn.',
    rarity: 'rare',
  ),

  'spearow': PokemonMeta(
    hint: 'Chim nhỏ hay rúc đầu vào cỏ tìm thức ăn.',
    lore: 'Loài chim nhỏ này thường bay lượn quanh các cánh đồng và rừng cây. Chúng vỗ đôi cánh nhỏ bé không ngừng để duy trì độ cao. Khi thấy động tĩnh dưới lớp cỏ dày, chúng sẽ nhanh nhẹn dùng chiếc mỏ nhọn của mình để moi tìm những con côn trùng hay sinh vật nhỏ bé làm bữa ăn. Tiếng kêu của chúng nghe khá chói tai và chúng rất thích la cà ở những nơi có nguồn thức ăn dồi dào.',
    rarity: 'common',
  ),

  'fearow': PokemonMeta(
    hint: 'Chim lớn với đôi cánh hùng vĩ, luôn bay lượn trên trời.',
    lore: 'Loài chim này sở hữu đôi cánh khổng lồ, cho phép nó bay lượn liên tục hàng giờ mà không cần nghỉ ngơi. Chúng thường bay rất cao, quan sát thế giới bên dưới với đôi mắt tinh tường. Chim lớn này rất dũng cảm và sẵn sàng bảo vệ lãnh thổ của mình khỏi bất kỳ kẻ xâm nhập nào.',
    rarity: 'rare',
  ),

  'ekans': PokemonMeta(
    hint: 'Rắn con ngoan ngoãn, trườn êm ái săn mồi.',
    lore: 'Sinh vật nhỏ bé này trườn đi thật im lặng, ẩn mình trong cỏ cây. Nó rất thích ăn trứng chim, nuốt trọn cả quả trứng bé nhỏ như PIDGEY hay SPEAROW. Khi trưởng thành, nó sẽ biến thành một loài rắn lớn hơn, mạnh mẽ hơn để bảo vệ bản thân.',
    rarity: 'common',
  ),

  'arbok': PokemonMeta(
    hint: 'Rắn độc với hình vẽ trên bụng có thể thay đổi.',
    lore: 'Loài rắn này rất hung dữ, nổi tiếng với chiếc bụng có họa tiết đặc biệt. Truyền thuyết kể rằng những họa tiết này không giống nhau ở mọi vùng. Chúng dùng chúng để cảnh báo kẻ thù, khiến chúng sợ hãi bỏ chạy. Màu sắc sặc sỡ và cái đầu to như mặt nạ giúp nó trông đáng sợ hơn.',
    rarity: 'rare',
  ),

  'pichu': PokemonMeta(
    hint: 'Tai vểnh, má hồng, dễ giật điện bất ngờ.',
    lore: 'Sinh vật nhỏ bé này thường tinh nghịch, thích vui đùa. Khi quá vui hoặc giật mình, nguồn điện trong má sẽ vô tình phóng ra, tạo thành những tia lửa nhỏ. Tuy chưa giỏi tích trữ năng lượng, sự hồn nhiên và đôi khi hậu đậu của nó lại mang đến những khoảnh khắc đáng yêu, khiến mọi người xung quanh bật cười vì sự bất ngờ và đáng yêu.',
    rarity: 'common',
  ),

  'pikachu': PokemonMeta(
    hint: 'Chú chuột nhỏ màu vàng với đôi má đỏ.',
    lore: 'Khi nhiều sinh vật này tụ tập, lượng điện tích của chúng có thể tích tụ và gây ra bão sấm sét.',
    rarity: 'common',
  ),

  'raichu': PokemonMeta(
    hint: 'Cái đuôi dài giúp nó tránh bị giật điện giật',
    lore: 'Sinh vật nhỏ bé này tích trữ điện trong đôi má mũm mĩm, sẵn sàng giải phóng những luồng điện mạnh mẽ khi cần thiết. Chiếc đuôi dài của nó không chỉ giúp giữ thăng bằng mà còn đóng vai trò như một dây dẫn an toàn, giúp nó giải tỏa năng lượng điện dư thừa về mặt đất, bảo vệ bản thân khỏi sức mạnh điện áp cao của chính mình.',
    rarity: 'rare',
  ),

  'sandshrew': PokemonMeta(
    hint: 'Món ăn yêu thích của nó là côn trùng, nó thích đào hang.',
    lore: 'Sinh vật nhỏ bé có cái mai cứng cáp này thích sống ở những nơi khô cằn, xa xôi, nơi không có nước. Nó đào những cái hang sâu dưới lòng đất để tránh nắng nóng và ẩn nấp. Chỉ khi bụng đói, nó mới lon ton bò ra ngoài để tìm kiếm những món ăn khoái khẩu như côn trùng. Cái mai cứng giúp nó bảo vệ khỏi kẻ thù và giữ cho cơ thể luôn mát mẻ trong cái nóng oi ả.',
    rarity: 'common',
  ),

  'sandslash': PokemonMeta(
    hint: 'Luôn cuộn tròn như quả bóng gai nhọn.',
    lore: 'Khi cảm thấy nguy hiểm, sinh vật này sẽ cuộn tròn lại, giấu đi mọi thứ trừ những chiếc gai sắc nhọn. Sự phòng thủ này không chỉ giúp nó tránh bị tấn công mà còn là vũ khí. Nó có thể lăn tròn với tốc độ đáng kinh ngạc khi đang ở trạng thái cuộn tròn, vừa để tấn công kẻ thù, vừa để nhanh chóng rút lui khỏi tình huống khó khăn. Dù vẻ ngoài có vẻ hơi đáng sợ với những chiếc gai, nhưng nó thường là một sinh vật hiền lành, chỉ sử dụng khả năng phòng thủ của mình khi thực sự cần thiết.',
    rarity: 'rare',
  ),

  'nidoran-f': PokemonMeta(
    hint: 'Nhỏ bé với gai độc, sừng nhỏ hơn.',
    lore: 'Dù nhỏ nhắn, loài Pokémon này rất nguy hiểm vì có những chiếc gai chứa nọc độc. Những chiếc sừng của chúng nhỏ hơn loài đực. Chúng thường sống trong hang động hoặc những nơi tối tăm, ít người qua lại.',
    rarity: 'common',
  ),

  'nidorina': PokemonMeta(
    hint: 'Có sừng nhỏ, thích cào cấu và cắn.',
    lore: 'Loài này có một chiếc sừng nhỏ trên trán, nhưng nó phát triển chậm. Chúng là những chiến binh dũng cảm, luôn sẵn sàng lao vào tấn công bằng móng vuốt sắc bén và hàm răng chắc khỏe. Nơi chúng sinh sống thường yên tĩnh, nhưng đừng để vẻ ngoài đó đánh lừa bạn; chúng rất đề phòng và sẽ bảo vệ lãnh thổ của mình bằng mọi giá.',
    rarity: 'rare',
  ),

  'nidoqueen': PokemonMeta(
    hint: 'Có vảy cứng, thân hình đồ sộ.',
    lore: 'Sinh vật mạnh mẽ tự hào với lớp vảy cứng cáp, bảo vệ nó khỏi mọi đòn tấn công. Sức nặng cơ thể giúp nó thực hiện những cú ra đòn cực kỳ uy lực để bảo vệ tổ ấm và bạn bè. Những chiếc gai trên lưng không chỉ để phòng thủ mà còn có thể phun ra độc tố gây tê liệt kẻ thù.',
    rarity: 'rare',
  ),

  'nidoran-m': PokemonMeta(
    hint: 'Tai dựng đứng, sừng càng lớn càng độc.',
    lore: 'Loài Pokémon nhỏ này có đôi tai rất nhạy bén, luôn dựng đứng để phát hiện mọi nguy hiểm xung quanh. Chúng có chiếc sừng nhỏ trên đầu, và sức mạnh của nọc độc mà chúng tiết ra tỉ lệ thuận với kích thước của chiếc sừng ấy. Một khi bị tấn công, chúng sẽ dùng chiếc sừng đó để chích đối thủ và tiêm nọc độc.',
    rarity: 'common',
  ),

  'nidorino': PokemonMeta(
    hint: 'Cái sừng trên đầu phun nọc độc.',
    lore: 'Đây là một Pokémon rất hung hăng, nó sẵn sàng tấn công bất cứ thứ gì mà nó cảm thấy bị đe dọa. Cái sừng to lớn trên đầu nó không chỉ để tấn công mà còn tiết ra một loại nọc độc cực mạnh. Loài Pokémon này thường sống ở những khu vực hoang dã và có tính lãnh thổ cao.',
    rarity: 'rare',
  ),

  'nidoking': PokemonMeta(
    hint: 'Voi có sừng và móng vuốt sắc nhọn.',
    lore: 'Sinh vật to lớn này sở hữu bộ gai sắc nhọn trên lưng và lớp vảy cứng như đá. Chiếc sừng trên đầu có thể nghiền nát mọi thứ. Nó dùng chiếc đuôi mạnh mẽ để quật, siết chặt rồi làm gãy xương con mồi. Sức mạnh phi thường của nó khiến ngay cả những đối thủ to lớn nhất cũng phải dè chừng.',
    rarity: 'rare',
  ),

  'cleffa': PokemonMeta(
    hint: 'Hình dáng lạ, giống ngôi sao, có thể đến từ vũ trụ.',
    lore: 'Sinh vật nhỏ bé này có ngoại hình giống một ngôi sao lấp lánh, khiến mọi người tin rằng nó đã du hành đến Trái Đất từ những vì sao xa xôi trên một tảng thiên thạch. Khi nhìn thấy nó từ xa, bạn sẽ nghĩ ngay đến một ngôi sao đang vẫy gọi trên bầu trời đêm. Chúng thường sống ở những nơi yên tĩnh, nơi chúng có thể ngắm nhìn bầu trời và suy tư về nguồn gốc bí ẩn của mình. Các nhà khoa học vẫn đang cố gắng tìm hiểu về phương thức di chuyển kỳ lạ của chúng, nhưng hầu hết mọi người đều yêu thích vẻ ngoài đáng yêu và câu chuyện thần bí xung quanh chúng.',
    rarity: 'common',
  ),

  'clefairy': PokemonMeta(
    hint: 'Tụi nhỏ thích nhảy múa dưới ánh trăng.',
    lore: 'Sinh vật nhỏ bé, đáng yêu này thường được nhìn thấy đang nhảy múa dưới ánh trăng tròn. Chúng có đôi tai to và má hồng hào, tạo nên vẻ ngoài cực kỳ dễ thương. Vì sự hiếm có và sức hút mê hoặc, có rất nhiều người hâm mộ yêu mến chúng. Chỉ tìm thấy ở vài nơi đặc biệt, chúng mang theo chút phép thuật làm cho thế giới thêm lung linh.',
    rarity: 'common',
  ),

  'clefable': PokemonMeta(
    hint: 'Đôi cánh nhỏ, ẩn mình trong mây.',
    lore: 'Sinh vật nhỏ bé này thích ẩn mình và rất nhút nhát. Chúng ta hiếm khi gặp chúng vì chúng sẽ bỏ chạy ngay khi cảm nhận được sự hiện diện của ai đó. Chúng có đôi cánh nhỏ xinh và thường được tìm thấy ở những nơi yên tĩnh, bí ẩn. Chúng thích âm nhạc và đôi khi có thể nghe thấy tiếng hát du dương của chúng vang vọng từ xa.',
    rarity: 'epic',
  ),

  'vulpix': PokemonMeta(
    hint: 'Lông đuôi mọc ra từ đầu, chia nhánh dần.',
    lore: 'Khi mới sinh, bé có một chiếc đuôi duy nhất. Theo thời gian, chiếc đuôi này sẽ tách ra từ chóp, mọc thêm nhiều chiếc nữa, càng lớn càng thêm phần xinh đẹp và quyền quý. Vẻ ngoài đáng yêu này khiến ai cũng muốn ôm ấp.',
    rarity: 'common',
  ),

  'ninetales': PokemonMeta(
    hint: 'Cáo chín đuôi, có bộ lông màu kem óng ả.',
    lore: 'Theo truyền thuyết, sinh vật này sở hữu trí tuệ phi thường và thù dai. Ai dám túm lấy một trong chín chiếc đuôi của nó sẽ phải chịu lời nguyền kéo dài hàng thế kỷ. Chúng sống ở những vùng núi cao, nơi không khí trong lành và thiên nhiên hoang sơ.',
    rarity: 'rare',
  ),

  'igglybuff': PokemonMeta(
    hint: 'Tròn xoe, mềm mại, hay lăn tròn.',
    lore: 'Âm thanh du dương phát ra từ nó có thể ru ngủ bất cứ ai. Cơ thể mềm mại của nó có thể bật nảy liên tục khi lăn đi, tạo nên một cảnh tượng vui nhộn nhưng khó lòng kiểm soát.',
    rarity: 'common',
  ),

  'jigglypuff': PokemonMeta(
    hint: 'Môi hồng, hát ru, dễ thương',
    lore: 'Sinh vật nhỏ bé với đôi mắt to tròn, chúng thường hát một giai điệu êm ái đến mức khiến bất kỳ ai nghe thấy cũng từ từ chìm vào giấc ngủ say nồng. Tiếng hát này vừa ngọt ngào vừa bí ẩn, có khả năng xoa dịu mọi căng thẳng và mang lại cảm giác bình yên. Đôi khi, nếu bị đánh thức khi đang ngủ, chúng sẽ tức giận và hát một bài hát khó chịu hơn để trêu chọc người đã làm phiền.',
    rarity: 'common',
  ),

  'wigglytuff': PokemonMeta(
    hint: 'Ồn ào, tai dài và đôi mắt xanh.',
    lore: 'Sinh vật tròn xoe, có đôi tai dài mềm mại và cặp mắt to tròn long lanh. Khi chọc giận nó, nó sẽ hít thật sâu, phồng to cơ thể lên như một quả bóng khổng lồ để trông thật đáng sợ. Dù vẻ ngoài to lớn khi tức giận, nó lại có tiếng hát du dương làm ai nấy đều say giấc.',
    rarity: 'rare',
  ),

  'zubat': PokemonMeta(
    hint: 'Sinh vật nhỏ, màu tím, bay lượn trong bóng tối.',
    lore: 'Thường sống theo đàn ở những nơi tối tăm vĩnh viễn. Chúng sử dụng sóng siêu âm để xác định và tiếp cận con mồi. Âm thanh của chúng có thể khiến người ta bối rối. Khi bay, chúng lượn lờ không ngừng, đôi mắt nhỏ bé dường như luôn tìm kiếm điều gì đó trong màn đêm.',
    rarity: 'common',
  ),

  'golbat': PokemonMeta(
    hint: 'Đôi cánh to, răng sắc, hút máu bằng mọi giá.',
    lore: 'Sinh vật này có đôi cánh lớn, màu tím và răng nhỏ nhưng sắc nhọn. Nó luôn khát khao năng lượng và sẽ bám chặt vào con mồi để hút cho đến khi no nê, dù có nặng đến đâu cũng không buông tha. Chuyến bay của nó trở nên khó khăn hơn vì sự tham lam này, nhưng nó không hề bận tâm.  Nó thường sống trong các hang động tối và săn mồi vào ban đêm.',
    rarity: 'rare',
  ),

  'crobat': PokemonMeta(
    hint: 'Bốn đôi cánh giúp nó bay im lặng trong đêm.',
    lore: 'Sinh vật này có thể bay lượn trong đêm tối mà không gây ra tiếng động nào do sở hữu bốn đôi cánh độc đáo. Tốc độ bay nhanh và sự im lặng giúp nó trở thành một thợ săn tài ba, ít khi bị phát hiện ngay cả khi ở rất gần.',
    rarity: 'rare',
  ),

  'oddish': PokemonMeta(
    hint: 'Lá xanh mọc trên đầu, mặt vùi dưới đất.',
    lore: 'Sinh vật bé bỏng này thích ẩn mình dưới lòng đất khi mặt trời còn trên cao, lấy chất dinh dưỡng nuôi cây. Nhưng khi đêm xuống, nó sẽ tỉnh giấc và lang thang khắp nơi để gieo những hạt giống nhỏ bé của mình. Cứ mỗi khi nó di chuyển, một vài hạt giống sẽ rơi ra, mang theo khả năng nảy mầm và tạo nên những người bạn mới cho thế giới xung quanh.',
    rarity: 'common',
  ),

  'gloom': PokemonMeta(
    hint: 'Một loài hoa có thể tiết ra chất lỏng ngọt ngào để thu hút con mồi.',
    lore: 'Loài hoa này có khả năng tiết ra một loại dịch lỏng ngọt ngào từ miệng của nó. Chất lỏng này không phải là nước dãi thông thường, mà là một loại mật hoa đặc biệt. Mục đích của mật hoa này là để thu hút những loài côn trùng nhỏ hoặc các sinh vật khác đến gần, biến chúng thành bữa ăn của nó. Nó thường ẩn mình trong những bụi cây rậm rạp hoặc những nơi có bóng râm, chờ đợi con mồi vô tình đi qua.',
    rarity: 'rare',
  ),

  'vileplume': PokemonMeta(
    hint: 'Hoa khổng lồ với bụi phấn độc',
    lore: 'Loài hoa này có những cánh hoa to lớn nhất thế giới. Mỗi bước đi, những cánh hoa rung lên, phủ đầy một đám mây phấn độc hại. Nó sống trong những khu rừng tươi tốt và thường được tìm thấy nở rộ vào mùa hè.',
    rarity: 'rare',
  ),

  'bellossom': PokemonMeta(
    hint: 'Cánh hoa xòe rộng, nhảy múa nhẹ nhàng.',
    lore: 'Sinh vật này sống phổ biến ở xứ nhiệt đới. Khi nó vui vẻ nhảy múa, những cánh hoa mềm mại của nó sẽ cọ vào nhau, tạo ra âm thanh lanh lảnh vui tai, như tiếng chuông nhỏ gọi mời.  N điệu nhảy của nó mang đến cảm giác thư thái và dễ chịu cho mọi người xung quanh.',
    rarity: 'rare',
  ),

  'paras': PokemonMeta(
    hint: 'Bọ nhỏ trên cây, nấm bé trên lưng.',
    lore: 'Sinh vật bé nhỏ này thích ẩn mình dưới lòng đất, hút nhựa cây từ rễ. Những chiếc nấm xinh xắn mọc trên lưng nó lớn dần nhờ nguồn dinh dưỡng từ vật chủ là loài bọ này. Cả hai cùng tồn tại, tạo nên một sự kết hợp độc đáo trong thế giới tự nhiên.',
    rarity: 'common',
  ),

  'parasect': PokemonMeta(
    hint: 'Một con bọ màu tím bị nấm trắng bao phủ.',
    lore: 'Sinh vật này là một đôi kỳ lạ, nơi một loại nấm mọc lên từ lưng và kiểm soát hoàn toàn chủ nhân của nó. Nấm tỏa ra những bào tử nhỏ có thể khiến bất kỳ ai hít phải chúng buồn ngủ. Nó thích những nơi ẩm ướt và tối tăm để nấm có thể phát triển tốt.',
    rarity: 'rare',
  ),

  'venonat': PokemonMeta(
    hint: 'Đôi mắt to tròn, thích ẩn mình trong bóng tối.',
    lore: 'Sinh vật nhỏ bé này thích sống ở những nơi tối tăm, ẩn mình dưới những tán cây cao. Ban đêm, chúng bị thu hút bởi ánh sáng. Chúng rất thích ăn côn trùng và thường dùng đôi mắt to tròn của mình để tìm kiếm thức ăn trong bóng đêm. Khi bị đe dọa, chúng có thể lẩn trốn nhanh chóng vào các kẽ lá hoặc gốc cây.',
    rarity: 'common',
  ),

  'venomoth': PokemonMeta(
    hint: 'Vảy cánh của nó có màu sắc cho biết loại độc.',
    lore: 'Sinh vật xinh đẹp này có đôi cánh phủ đầy vảy màu kỳ lạ. Mỗi màu sắc trên vảy cánh đều tiết lộ một loại độc khác nhau mà nó sở hữu. Cẩn thận đừng để chạm vào những chiếc vảy này, chúng có thể gây hại cho bạn. Màu sắc sặc sỡ của cánh không chỉ để làm đẹp mà còn là lời cảnh báo bí ẩn từ thiên nhiên.',
    rarity: 'rare',
  ),

  'diglett': PokemonMeta(
    hint: 'Thường đào hang sâu, đôi khi ló đầu lên',
    lore: 'Sinh vật nhỏ bé này thích sống dưới lòng đất, cách mặt đất khoảng một sải tay. Thức ăn yêu thích của nó là rễ cây. Đôi khi, nó có thể ló đầu lên khỏi mặt đất để quan sát xung quanh hoặc tìm kiếm thức ăn mới. Sự xuất hiện bất ngờ của nó trên mặt đất luôn khiến mọi người tò mò.',
    rarity: 'common',
  ),

  'dugtrio': PokemonMeta(
    hint: 'Ba anh em cùng màu đất ló đầu lên.',
    lore: 'Khi ba người bạn này chui sâu xuống lòng đất, họ có thể tạo ra những cơn rung chuyển mạnh mẽ. Họ đào hang rất giỏi và thường ẩn mình dưới lớp đất, chỉ để lộ phần thân trên.',
    rarity: 'rare',
  ),

  'meowth': PokemonMeta(
    hint: 'Luôn giữ đồng xu trên trán sạch sẽ.',
    lore: 'Sinh vật này rất chú trọng đến ngoại hình, đặc biệt là chiếc đồng xu may mắn trên trán. Nó dành nhiều thời gian để lau chùi để giữ cho vật trang trí này luôn sáng bóng. Tuy nhiên, có vẻ như nó không thích những người họ hàng đến từ một vùng đất khác, có lẽ vì sự khác biệt về phong cách hoặc lối sống.',
    rarity: 'common',
  ),

  'persian': PokemonMeta(
    hint: 'Một chú mèo kiêu kỳ với bộ lông mượt mà và chiếc vòng trên trán.',
    lore: 'Vốn là loài vật nuôi cưng của giới quý tộc, vẻ ngoài sang trọng cùng bộ lông mềm mượt của chúng khiến bao người say mê. Tuy nhiên, đừng để vẻ ngoài đó đánh lừa bạn. Bản tính đỏng đảnh, hay giận dỗi thất thường khiến chúng trở thành một người bạn đồng hành không hề dễ chiều. Dù vậy, khi đã yêu mến chủ nhân, chúng lại vô cùng trung thành và bảo vệ.',
    rarity: 'rare',
  ),

  'perrserker': PokemonMeta(
    hint: 'Cái mũ sắt cứng là tóc đó nha!',
    lore: 'Một chú Pokémon dũng cảm sống vì những trận đấu gay cấn. Chiếc mũ trên đầu không phải kim loại, mà là mái tóc cứng như sắt được tạo nên qua bao cuộc chiến. Chú ta rất thích làm quen với những người bạn cùng yêu thích thử thách và sẵn sàng xông pha vào mọi cuộc phiêu lưu.',
    rarity: 'rare',
  ),

  'psyduck': PokemonMeta(
    hint: 'Chàng vàng mắt lơ đãng, đầy mưu mẹo.',
    lore: 'Sinh vật bé nhỏ này có vẻ rất ngây thơ với đôi mắt nhìn xa xăm. Nhưng đừng để vẻ ngoài đánh lừa bạn! Khi cần, nó có thể dùng sức mạnh tinh thần đáng kinh ngạc để đánh lừa, làm choáng váng hoặc đẩy lùi kẻ thù. Khả năng này giúp nó sống sót và giành chiến thắng trong những tình huống khó khăn, dù trông có vẻ vụng về.',
    rarity: 'common',
  ),

  'golduck': PokemonMeta(
    hint: 'Vịt con màu xanh bơi lội duyên dáng bên hồ nước.',
    lore: 'Sinh vật huyền bí này có bộ lông màu xanh dương óng mượt và thường được nhìn thấy uyển chuyển bơi lội gần bờ hồ. Chúng có đôi mắt to tròn và chiếc mỏ xinh xắn. Vì vẻ ngoài và thói quen sinh hoạt gần mặt nước, nhiều người lầm tưởng nó là quái vật Kappa trong truyền thuyết Nhật Bản. Nó rất thích nhảy múa dưới ánh trăng bên cạnh những làn nước trong veo.',
    rarity: 'rare',
  ),

  'mankey': PokemonMeta(
    hint: 'Đôi khi hiền lành, đôi khi bùng nổ.',
    lore: 'Loài sinh vật nhỏ nhắn này nổi tiếng với tính khí thất thường. Một khoảnh khắc, chúng có thể đang chơi đùa vui vẻ, rồi ngay lập tức chuyển sang trạng thái tức giận và hung hăng. Cần phải hết sức cẩn thận khi tiếp xúc, vì tâm trạng của chúng có thể thay đổi chỉ trong chớp mắt.',
    rarity: 'common',
  ),

  'primeape': PokemonMeta(
    hint: 'Chú khỉ màu đỏ với nắm đấm sức mạnh.',
    lore: 'Loài linh trưởng này luôn tràn đầy năng lượng và không bao giờ bỏ cuộc. Khi đã nhắm mục tiêu, nó sẽ kiên trì truy đuổi đến cùng, dù gặp khó khăn đến đâu. Sự tức giận là động lực, giúp nó trở nên mạnh mẽ và dai dẳng hơn. Nó thích thi đấu sức mạnh với đối thủ, và luôn cố gắng trở thành người chiến thắng.',
    rarity: 'rare',
  ),

  'annihilape': PokemonMeta(
    hint: 'Vẻ ngoài giận dữ, cơ bắp cuồn cuộn.',
    lore: 'Khi cơn giận lên đến đỉnh điểm, sinh vật này giải phóng sức mạnh vượt xa giới hạn thể xác. Nó lao vào mọi thử thách với sự hung hãn không thể ngăn cản, dù đối mặt với nguy hiểm lớn đến đâu. Sức mạnh của nó đến từ ý chí kiên cường và sự tức giận tích tụ, biến nó thành một chiến binh đáng gờm trên chiến trường.',
    rarity: 'rare',
  ),

  'growlithe': PokemonMeta(
    hint: 'Chú chó con lông xù, luôn sủa bảo vệ nhà mình.',
    lore: 'Chú chó nhỏ này rất trung thành và dũng cảm. Với bộ lông dày ấm áp và chiếc mõm nhọn, nó luôn cảnh giác, sẵn sàng gầm gừ và thậm chí cắn để đảm bảo không ai xâm phạm vào lãnh thổ thân yêu của mình. Nó yêu quý chủ nhân và bạn bè, luôn muốn bảo vệ họ khỏi mọi nguy hiểm.',
    rarity: 'common',
  ),

  'arcanine': PokemonMeta(
    hint: 'Lông vàng rực, chạy nhanh tựa bay.',
    lore: 'Một sinh vật tuyệt đẹp với bộ lông màu lửa, luôn được ngưỡng mộ từ lâu đời. Tốc độ của nó thật kinh ngạc, cứ như đôi chân này không chạm đất vậy. Nó di chuyển uyển chuyển, tung tăng như đang nhảy múa trên đôi chân thoăn thoắt. Với vẻ ngoài kiêu sa và sự nhanh nhẹn phi thường, nó luôn mang lại cảm giác về sức sống và sự dũng mãnh. Nó có thể chạy hàng ngàn dặm mà không mệt mỏi dưới ánh nắng mặt trời.',
    rarity: 'rare',
  ),

  'poliwag': PokemonMeta(
    hint: 'Chú nòng nọc nhỏ có chân mới mọc.',
    lore: 'Chú bé này có đôi chân mới mọc đang tập làm quen với việc di chuyển. Vì chưa quen chạy, chú thích được vùng vẫy trong làn nước mát hơn là cố gắng đứng vững trên cạn. Chú thích nghi tốt với môi trường nước, luôn vui vẻ bơi lội và khám phá thế giới dưới làn nước trong xanh.',
    rarity: 'common',
  ),

  'poliwhirl': PokemonMeta(
    hint: 'Chú nòng nọc màu xanh có chiếc xoáy trên đầu.',
    lore: 'Sinh vật nhỏ bé này có thể sống cả trên cạn lẫn dưới nước. Trên cạn, nó tiết ra chất nhờn để giữ ẩm cho cơ thể, giúp nó không bị khô. Chiếc xoáy trên đầu không chỉ để trang trí mà còn giúp nó bơi lội nhanh hơn trong nước. Nó rất thích những nơi có nhiều nước mát mẻ.',
    rarity: 'rare',
  ),

  'poliwrath': PokemonMeta(
    hint: 'Thân hình tròn, tay chân khỏe, bơi lội giỏi.',
    lore: 'Loài sinh vật này có làn da màu xanh dương đặc trưng, thân hình tròn trịa và các chi khỏe mạnh. Chúng là những vận động viên bơi lội xuất sắc trong thế giới Pokémon, có thể vượt qua mọi kỷ lục của con người trong các kiểu bơi khác nhau. Khả năng bơi lội của chúng thật đáng kinh ngạc, giúp chúng dễ dàng chinh phục mọi dòng nước và trở thành những nhà vô địch dưới đại dương.',
    rarity: 'rare',
  ),

  'politoed': PokemonMeta(
    hint: 'Chú ếch xanh có vương miện, thích mưa rơi.',
    lore: 'Thường được tìm thấy ở những vùng nước trong lành và yên tĩnh, sinh vật này ban ngày thường thích ở dưới nước, nhưng khi đêm xuống, nó sẽ ngồi trên những tảng đá hoặc bờ sông. Tiếng kêu vang vọng của nó có thể triệu tập bạn bè từ rất xa. Nó đặc biệt thích những cơn mưa rào, và sẽ nhảy múa vui vẻ trong những giọt nước.',
    rarity: 'rare',
  ),

  'abra': PokemonMeta(
    hint: 'Bé nhỏ màu tím, mắt xanh, nhanh nhẹn.',
    lore: 'Bé tí này có khả năng đặc biệt là đọc suy nghĩ của người khác. Nhờ vậy, bé luôn biết trước nguy hiểm sắp xảy đến và sẽ biến mất ngay lập tức, luôn giữ cho mình an toàn. Chúng rất giỏi ẩn mình và khó bị bắt gặp. Với đôi mắt phát sáng kỳ lạ, chúng như đang nhìn thấu mọi thứ xung quanh.',
    rarity: 'common',
  ),

  'kadabra': PokemonMeta(
    hint: 'Tia chớp vàng trên trán phát ra sóng kỳ lạ.',
    lore: 'Sinh vật có chiếc thìa cong trên tay luôn mang đến cảm giác khó chịu cho những ai ở gần. Sóng alpha đặc biệt từ cơ thể nó có thể làm mọi người đau đầu. Thậm chí, chỉ cần nhìn vào chiếc thìa cong trên trán nó cũng đủ khiến bạn cảm thấy mệt mỏi.',
    rarity: 'rare',
  ),

  'alakazam': PokemonMeta(
    hint: 'Mái tóc xoăn dài, đôi mắt đỏ rực và chiếc thìa trên đầu.',
    lore: 'Vua của trí tuệ, với bộ não siêu việt có thể sánh ngang hoặc vượt xa những chiếc máy tính mạnh mẽ nhất. Khả năng tư duy logic và tốc độ xử lý thông tin của nó khiến mọi đối thủ phải kinh ngạc.  Trong chiến đấu, nó sử dụng năng lực tâm linh để điều khiển mọi thứ xung quanh, từ suy nghĩ của đối thủ đến sức mạnh vật lý.  Nó thường dành thời gian suy ngẫm về những bí ẩn của vũ trụ, với chỉ số IQ lên đến 5000.',
    rarity: 'rare',
  ),

  'machop': PokemonMeta(
    hint: 'Chú bé lực lưỡng thích tập luyện luôn vươn lên.',
    lore: 'Nhân vật này cực kỳ yêu thích việc xây dựng cơ bắp của mình. Để trở nên mạnh mẽ hơn nữa, chú bé tập luyện mọi phong cách võ thuật khác nhau, từ những cú đấm nhanh nhẹn đến những đòn quét chân uy lực. Mỗi buổi tập đều là một bước tiến mới trong hành trình chinh phục sức mạnh tuyệt đối, sẵn sàng đối mặt với mọi thử thách trên con đường trở thành nhà vô địch.',
    rarity: 'common',
  ),

  'machoke': PokemonMeta(
    hint: 'Chú sinh vật cơ bắp, luôn mang đai giữ sức mạnh.',
    lore: 'Chú sinh vật này sở hữu sức mạnh phi thường với cơ bắp cuồn cuộn. Để kiểm soát những chuyển động mạnh mẽ của mình, chú luôn đeo một chiếc đai đặc biệt. Chiếc đai này giúp chú điều hòa năng lượng, tránh gây nguy hiểm cho mọi thứ xung quanh. Dù có vẻ ngoài đáng gờm, chú lại là một người bạn tốt bụng, luôn sẵn sàng giúp đỡ khi cần thiết.',
    rarity: 'rare',
  ),

  'machamp': PokemonMeta(
    hint: 'Đấm cực mạnh, nhìn như bốn tay.',
    lore: 'Sinh vật có sức mạnh phi thường. Khi nổi giận, nó sẽ tung ra những cú đấm đi xa đến mức có thể đưa đối thủ bay xa tít tắp, vượt qua cả chân trời. Những cơ bắp cuồn cuộn trên người nó là minh chứng cho sức mạnh khủng khiếp, có thể san phẳng cả tòa nhà chỉ bằng một cú vung tay.',
    rarity: 'rare',
  ),

  'bellsprout': PokemonMeta(
    hint: 'Cây xanh có lá giống chuông, thích ăn côn trùng.',
    lore: 'Loài cây ăn thịt nhỏ bé này thường ẩn mình trong bụi rậm hoặc gần nguồn nước. Đôi chân rễ của nó giúp hút nước cần thiết, nuôi dưỡng cơ thể. Khi một con côn trùng bé nhỏ lọt vào tầm ngắm, chiếc lá hình chuông sẽ nhanh chóng đóng lại để bắt gọn con mồi.  Cơ thể màu xanh lá cây giúp nó ngụy trang tốt giữa thiên nhiên, và nó thường tìm kiếm chỗ ẩm ướt để sinh sống.',
    rarity: 'common',
  ),

  'weepinbell': PokemonMeta(
    hint: 'Cây có lá bay, phun độc và axit.',
    lore: 'Một loài cây biết đi với chiếc lá to trên đầu. Nó có thể phun một đám bột độc để làm kẻ địch bất động. Sau đó, nó sẽ phun một dòng axit mạnh để đánh bại đối thủ. Cây này sống trong rừng rậm, thường trốn trong bóng tối chờ đợi con mồi.',
    rarity: 'rare',
  ),

  'victreebel': PokemonMeta(
    hint: 'Cây ăn thịt có lá to và miệng há lớn.',
    lore: 'Loài cây này được cho là sống trong những đàn khổng lồ sâu trong rừng rậm. Tuy nhiên, chưa ai từng trở lại từ khu vực đó. Người ta đồn rằng chúng có thể thu hút con mồi bằng một mùi hương ngọt ngào, sau đó nuốt chửng không thương tiếc.  Những nhà thám hiểm dũng cảm nhất cũng phải e dè khi nhắc đến nơi cư ngụ bí ẩn của chúng.',
    rarity: 'rare',
  ),

  'tentacool': PokemonMeta(
    hint: 'Sinh vật mềm trôi dạt, có xúc tu dài.',
    lore: 'Nó lơ lửng trong vùng biển nông, đôi khi bị những người câu cá vô tình vướng vào. Khi bị khuấy động, nó có thể phun ra chất lỏng khó chịu để tự vệ. Chúng thường sống thành đàn lớn, tạo nên những cảnh tượng kỳ lạ dưới nước.',
    rarity: 'common',
  ),

  'tentacruel': PokemonMeta(
    hint: 'Râu dài nhọn, thon thả và trong suốt.',
    lore: 'Sinh vật biển này sở hữu những chiếc xúc tu dài, chúng thường thu ngắn lại khi không săn mồi. Khi tìm kiếm thức ăn, những chiếc xúc tu này sẽ vươn dài ra để tóm chặt và làm tê liệt con mồi. Chúng sống ở biển sâu và thỉnh thoảng xuất hiện gần bờ.',
    rarity: 'rare',
  ),

  'geodude': PokemonMeta(
    hint: 'Người ta hay nhầm nó với hòn đá.',
    lore: 'Sinh vật nhỏ bé này sống ở những nơi đầy đá, thích lăn lộn trên núi và đồng cỏ. Vì hình dáng giống hòn đá, nên nhiều người vô tình bước lên hoặc vấp phải chúng. Đừng lo, chúng không biết đau đâu, chỉ hơi khó chịu một chút thôi!',
    rarity: 'common',
  ),

  'graveler': PokemonMeta(
    hint: 'Tròn, lăn nhanh xuống dốc.',
    lore: 'Sinh vật hình đá này có một cách di chuyển độc đáo: nó lăn nhanh xuống các sườn núi. Không gì có thể cản được nó, dù là tảng đá hay khúc gỗ. Nó sẽ lăn thẳng qua mọi thứ. Chúng thường sống ở vùng núi đá gồ ghề, nơi có nhiều dốc để chúng thỏa sức lăn lộn.  Đôi khi, chúng có thể vô tình lăn vào làng, gây ra một chút náo động!',
    rarity: 'rare',
  ),

  'golem': PokemonMeta(
    hint: 'Cơ thể cứng như đá, có thể chịu được vụ nổ.',
    lore: 'Sinh vật khổng lồ với lớp vỏ ngoài cứng như tảng đá, có thể dễ dàng chống chịu những vụ nổ mạnh mà không hề hấn gì. Nó sống ở những vùng núi và hang động hiểm trở, nơi nó có thể yên tĩnh nghỉ ngơi hoặc di chuyển chậm chạp qua các địa hình gồ ghề. Lớp vỏ của nó được hình thành từ các loại đá cứng nhất, khiến nó trở thành một sinh vật vô cùng bền bỉ và khó bị tổn thương.',
    rarity: 'rare',
  ),

  'ponyta': PokemonMeta(
    hint: 'Bờm tóc rực lửa, sừng nhọn, chạy nhanh như gió.',
    lore: 'Chú ngựa con này có bộ bờm tóc bốc cháy như lửa, trông thật rực rỡ. Sừng của chú nhọn hoắt và đôi chân mạnh mẽ có thể chạy vun vút trên mọi địa hình. Chú thích tung tăng trên những cánh đồng xanh mướt, để lại những dấu chân nhỏ xinh trên con đường mình đi qua. Mỗi bước chạy của chú đều đầy năng lượng và sự vui tươi.',
    rarity: 'common',
  ),

  'rapidash': PokemonMeta(
    hint: 'Nhanh nhẹn với bờm rực lửa.',
    lore: 'Chú ngựa này rất thích đua tài. Bất cứ thứ gì nó thấy chạy nhanh, nó đều muốn đuổi theo để xem ai nhanh hơn. Nó có bờm và đuôi tựa như những ngọn lửa đang cháy, tỏa sáng rực rỡ khi nó phi nước đại. Khi bạn bắt gặp nó, hãy cẩn thận, nó có thể sẽ thách thức bạn một cuộc đua đấy!',
    rarity: 'rare',
  ),

  'slowpoke': PokemonMeta(
    hint: 'Chú ốc sên màu hồng lười biếng',
    lore: 'Chú ta chậm chạp và ngơ ngác, mất tới 5 giây để cảm nhận cơn đau khi bị tấn công. Sự lười biếng này giúp chú tránh được nhiều mối nguy hiểm không đáng có.  Thường ngày, chú thích đi bộ thật chậm bên bờ hồ và suy nghĩ về những điều thật xa vời, đôi khi còn quên mất mình đang làm gì.  Dù chậm chạp, chú lại sở hữu khả năng đặc biệt khi tiến hóa.',
    rarity: 'common',
  ),

  'slowbro': PokemonMeta(
    hint: 'Rùa mai cứng đội trên đầu.',
    lore: 'Một loài vật sống ở biển, thường thấy ở những vùng nước nông. Vỏ ốc gắn chặt vào đuôi của nó, dường như không làm nó bận tâm. Nó có vẻ chậm chạp nhưng có những khả năng bất ngờ khi ở trong nước hoặc khi bị tấn công.',
    rarity: 'rare',
  ),

  'slowking': PokemonMeta(
    hint: 'Chú vịt đội vương miện, luôn điềm tĩnh.',
    lore: 'Sinh vật này sở hữu trí tuệ siêu phàm và khả năng thấu hiểu mọi thứ. Dù đối mặt với bất kỳ tình huống khó khăn nào, nó vẫn giữ vững sự bình tĩnh và tự tin, không bao giờ để cảm xúc chi phối.  Thính giác nhạy bén giúp nó nắm bắt mọi âm thanh, và trí óc minh mẫn cho phép nó đưa ra những quyết định sáng suốt nhất.',
    rarity: 'rare',
  ),

  'magnemite': PokemonMeta(
    hint: 'Kim loại bay lơ lửng, bất ngờ tấn công.',
    lore: 'Sinh vật này luôn lơ lửng trên không nhờ một lực bí ẩn. Nó thường xuất hiện bất ngờ từ đâu đó, khiến mọi người giật mình. Khi gặp nguy hiểm, nó sẽ sử dụng những đòn tấn công mạnh mẽ, lan tỏa ra xung quanh, làm tê liệt mọi thứ. Đôi mắt đỏ của nó lóe lên trong bóng tối trước khi nó ra đòn.',
    rarity: 'common',
  ),

  'magneton': PokemonMeta(
    hint: 'Nhiều khối kim loại bay lơ lửng, phát sáng.',
    lore: 'Khi những đốm đen trên mặt trời to lên, chúng xuất hiện. Chúng là sự đoàn kết của nhiều khối kim loại nhỏ hơn. Khi tụ lại, chúng tạo ra một sức mạnh lớn lao, bay lượn và tỏa sáng. Mỗi khối đều có từ trường riêng, khi hợp nhất, chúng tạo ra một nam châm khổng lồ trên bầu trời.',
    rarity: 'rare',
  ),

  'magnezone': PokemonMeta(
    hint: 'Khối kim loại bay lơ lửng, hút nam châm và phát ra điện.',
    lore: 'Sinh vật này xuất hiện sau khi tiếp xúc với từ trường đặc biệt. Ba bộ phận của nó hoạt động cùng nhau để tạo ra lực từ mạnh mẽ. Nó có thể bay lơ lửng nhờ từ trường này và thường được tìm thấy ở những nơi có nhiều kim loại. Khi tập hợp lại, chúng sẽ tỏa ra một trường điện từ mạnh mẽ, điều này giúp chúng di chuyển và giao tiếp với nhau.',
    rarity: 'epic',
  ),

  'farfetchd': PokemonMeta(
    hint: 'Cầm cành hành xanh làm kiếm, đấu sĩ dũng cảm.',
    lore: 'Chú chim bé nhỏ này luôn mang theo một cành hành lá xanh. Nó dùng cành hành như một thanh kiếm, vung vẩy để tấn công và bảo vệ bản thân.  Cành hành không chỉ là vũ khí mà còn là người bạn đồng hành không thể tách rời của nó.',
    rarity: 'rare',
  ),

  'sirfetchd': PokemonMeta(
    hint: 'Vung leek, chú chim dũng cảm',
    lore: 'Chỉ những chiến binh dày dạn kinh nghiệm mới có thể đạt tới sức mạnh này. Vũ khí làm từ cây hành của chú là biểu tượng cho lòng quả cảm. Khi cây hành ấy héo úa, chú sẽ rời xa chiến trường để nghỉ ngơi. Vẻ ngoài oai vệ và tư thế sẵn sàng chiến đấu luôn khiến đối thủ dè chừng. Chú là hiện thân của sự kiên cường và bền bỉ.',
    rarity: 'rare',
  ),

  'doduo': PokemonMeta(
    hint: 'Đôi chân chạy như bay, dấu chân to.',
    lore: 'Loài chim này có hai cái đầu biết suy nghĩ riêng, nhưng chúng thường đồng ý với nhau. Chúng chạy rất nhanh trên mặt đất để bù lại việc không biết bay. Những bước chạy thần tốc của chúng để lại những dấu chân khổng lồ có thể nhìn thấy từ xa.',
    rarity: 'common',
  ),

  'dodrio': PokemonMeta(
    hint: 'Ba đầu, ba bộ não, luôn cảnh giác.',
    lore: 'Sinh vật ba đầu này có trí tuệ phi thường. Khi hai cái đầu chìm vào giấc ngủ, cái đầu còn lại vẫn tỉnh táo để canh chừng. Ba bộ não phối hợp nhịp nhàng, giúp nó lên kế hoạch và phản ứng nhanh chóng với mọi tình huống. Nó rất khó bị lừa bởi bất kỳ ai muốn làm hại mình.',
    rarity: 'rare',
  ),

  'seel': PokemonMeta(
    hint: 'Chú hải cẩu có sừng cứng để đập băng.',
    lore: 'Sinh vật biển này có một chiếc sừng rất chắc chắn nhô ra từ đỉnh đầu. Thay vì dùng để tấn công, nó lại là công cụ đắc lực giúp nó phá tan lớp băng dày đặc, mở đường để bơi lội và săn mồi trong môi trường khắc nghiệt.  Chiếc sừng cũng giúp nó di chuyển dễ dàng hơn qua những vùng nước lạnh giá.',
    rarity: 'common',
  ),

  'dewgong': PokemonMeta(
    hint: 'Vảy trắng lấp lánh, bơi lội uyển chuyển.',
    lore: 'Sinh vật biển với lớp mỡ dày giữ ấm, có thể bơi lội thoăn thoắt ngay cả trong đại dương băng giá.  Nó tích trữ năng lượng nhiệt bên trong cơ thể, giúp duy trì sự sống và di chuyển dễ dàng dưới làn nước lạnh lẽo.  Là một người bạn đáng tin cậy trong những chuyến phiêu lưu dưới biển khơi.',
    rarity: 'rare',
  ),

  'grimer': PokemonMeta(
    hint: 'Bùn nhớp nháp, sống ở nơi bẩn thỉu.',
    lore: 'Sinh vật này thích sống ở những nơi dơ bẩn và hút dinh dưỡng từ chất thải công nghiệp. Nó giống như một cục bùn biết đi, luôn tìm kiếm nguồn thức ăn từ những dòng chảy ô nhiễm. Dù trông không mấy sạch sẽ, nó lại là một phần giúp làm sạch môi trường bằng cách tiêu thụ những thứ độc hại.',
    rarity: 'common',
  ),

  'muk': PokemonMeta(
    hint: 'Thứ bùn nhầy chảy lênh láng, có mùi khó chịu.',
    lore: 'Sinh vật này thích sống trong môi trường bẩn thỉu, nơi nó có thể hấp thụ mọi thứ xung quanh để lớn lên. Lớp bùn bao phủ cơ thể nó vô cùng độc hại, thậm chí chất thải nó để lại cũng mang theo độc tố nguy hiểm. Dù trông có vẻ ghê tởm, nó lại có khả năng làm sạch các khu vực ô nhiễm, dù quá trình đó không mấy dễ chịu.',
    rarity: 'rare',
  ),

  'shellder': PokemonMeta(
    hint: 'Vỏ cứng như ngọc, bên trong ẩn giấu viên ngọc quý.',
    lore: ' sinh vật biển vỏ cứng, nổi tiếng với khả năng phòng thủ tuyệt vời. Vỏ của nó cứng đến mức có thể chống lại hầu hết các đòn tấn công. Tuy nhiên, khi nó mở vỏ ra để ăn hoặc thở, nó trở nên yếu đuối. Chúng thường sống ở đáy biển và là con mồi yêu thích của một số Pokémon khác.',
    rarity: 'common',
  ),

  'cloyster': PokemonMeta(
    hint: 'Vỏ cứng, phóng gai khi bị tấn công.',
    lore: 'Sinh vật biển này có một lớp vỏ vô cùng cứng cáp, bảo vệ cơ thể mềm mại bên trong. Khi gặp nguy hiểm, nó sẽ phóng ra những chiếc gai sắc nhọn một cách nhanh chóng. Không ai từng thấy được thứ gì bên trong lớp vỏ kia, nó luôn được giữ kín như một bí ẩn.',
    rarity: 'rare',
  ),

  'gastly': PokemonMeta(
    hint: 'Bóng ma hơi, ẩn mình trong sương mù.',
    lore: 'Sinh vật bí ẩn này trôi dạt trong không khí, gần như vô hình. Nó thích ẩn mình trong bóng tối, đặc biệt là ở những nơi ẩm ướt như hang động hoặc khu rừng rậm rạp. Khi phát hiện con mồi, nó sẽ từ từ bao phủ lấy, tỏa ra một mùi hương thoang thoảng như hoa ngủ say. Nạn nhân sẽ dần dần chìm vào giấc ngủ sâu mà không hề hay biết, để lại cho sinh vật này cơ hội tận hưởng bóng tối.',
    rarity: 'common',
  ),

  'haunter': PokemonMeta(
    hint: 'Bóng ma màu tím lơ lửng, có nụ cười quỷ quyệt.',
    lore: 'Sinh vật bí ẩn này có khả năng đi xuyên qua tường, khiến nhiều người tin rằng nó đến từ một thế giới khác. Nó thích trêu chọc con người bằng cách làm tắt đèn và tạo ra những tiếng động kỳ lạ trong bóng tối.  Dù trông có vẻ đáng sợ, nhưng thực ra nó chỉ thích vui đùa và đôi khi có thể nghịch ngợm một chút thôi!',
    rarity: 'rare',
  ),

  'gengar': PokemonMeta(
    hint: 'Cái bóng biết cười thích trêu chọc người.',
    lore: 'Khi trăng tròn sáng, sinh vật này thường ẩn mình trong bóng tối. Nó có khả năng thay đổi hình dạng để bắt chước bóng của con người, rồi cười khúc khích khi họ giật mình vì sợ hãi. Sinh vật này rất thích chơi đùa và thích làm người khác hoảng sợ một chút.',
    rarity: 'rare',
  ),

  'onix': PokemonMeta(
    hint: 'Thân đá đen của nó cứng như kim cương khi lớn lên.',
    lore: 'Sinh vật này sống sâu dưới lòng đất, đào hang bằng cơ thể to lớn và mạnh mẽ. Khi nó lớn dần lên, những tảng đá trên người nó ngày càng cứng lại, giống như kim cương nhưng mang màu đen huyền bí. Nó có thể phá vỡ bất cứ thứ gì trên đường đi và tạo ra những đường hầm mới chỉ bằng sự di chuyển của mình.',
    rarity: 'rare',
  ),

  'steelix': PokemonMeta(
    hint: 'Thân hình khổng lồ, bằng kim loại, đào hầm suốt ngày.',
    lore: 'Sinh vật này sống sâu dưới lòng đất, nơi nó không ngừng đào bới. Theo thời gian, trong bụng nó tích tụ rất nhiều sắt từ đất đá mà nó nuốt vào. Sự tích tụ này đã khiến cơ thể nó biến đổi và trở nên cứng rắn như kim loại. Nó dùng sức mạnh kinh người của mình để tạo ra những đường hầm dài ngoằn ngoèo dưới lòng đất.',
    rarity: 'epic',
  ),

  'drowzee': PokemonMeta(
    hint: 'Trông giống lợnTapir, mũi dài, có đôi mắt nhắm nghiền',
    lore: 'Sinh vật màu vàng này hay rình rập trong giấc mơ. Nó dùng sức mạnh tâm linh để ru ngủ mọi người, rồi ăn đi những giấc mơ của họ. Đôi khi, nó ăn phải những giấc mơ tệ hại, khiến nó bị ốm và nôn ra. Sinh vật này sống ở những nơi yên tĩnh, nơi nó có thể được ngủ ngon và ăn những giấc mơ ngọt ngào.',
    rarity: 'common',
  ),

  'hypno': PokemonMeta(
    hint: 'Kẻ thôi miên có con lắc xoay tròn',
    lore: 'Sinh vật này có khả năng thôi miên kẻ thù bằng cách sử dụng con lắc kỳ lạ. Chỉ cần nhìn vào con lắc đang đung đưa, nạn nhân sẽ chìm vào giấc ngủ sâu. Nó cũng có thể sử dụng sức mạnh tinh thần để làm choáng váng đối thủ, chuẩn bị cho một cuộc tấn công tiếp theo. Hãy cẩn thận đừng để bị thôi miên!',
    rarity: 'rare',
  ),

  'krabby': PokemonMeta(
    hint: 'Con cua có đôi càng to khỏe dùng để giữ thăng bằng.',
    lore: 'Sinh vật bé nhỏ này có đôi càng to lớn và cực kỳ mạnh mẽ. Chúng không chỉ dùng để tấn công mà còn là công cụ hỗ trợ đắc lực khi nó di chuyển ngang. Đôi càng giúp nó giữ thăng bằng hoàn hảo, thậm chí có thể vượt qua những địa hình gồ ghề một cách dễ dàng. Dù trông có vẻ đơn giản, nhưng khả năng giữ thăng bằng này là yếu tố quan trọng giúp nó sinh tồn.',
    rarity: 'common',
  ),

  'kingler': PokemonMeta(
    hint: 'Cua khổng lồ với chiếc càng to lớn.',
    lore: 'Một loài cua với chiếc càng sức mạnh đáng kinh ngạc, đủ sức nghiền nát mọi thứ. Tuy nhiên, kích thước khổng lồ của chiếc càng khiến nó trở nên khó điều khiển.  Nó thường dùng chiếc càng này để bắt mồi hoặc tự vệ, đôi khi nó còn dùng chiếc càng để gây ấn tượng với bạn tình.  Mặc dù cồng kềnh, nó là một sinh vật mạnh mẽ và kiên cường.',
    rarity: 'rare',
  ),

  'voltorb': PokemonMeta(
    hint: 'Bóng tròn trắng đỏ, hay nổ tung.',
    lore: 'Cậu bé này thường sống ở các nhà máy điện và trông giống như một Quả Banh hơn là một sinh vật. Vì vậy, rất nhiều người đã nhầm lẫn và bị giật điện bất ngờ bởi sự bối rối của nó. Hãy cẩn thận nhé!',
    rarity: 'common',
  ),

  'electrode': PokemonMeta(
    hint: 'Quả bóng màu đỏ với đôi mắt',
    lore: 'Sinh vật nhỏ này tích trữ năng lượng điện trong cơ thể và có thể phát nổ bất ngờ. Đôi khi, chỉ một tiếng động nhỏ cũng đủ khiến nó choáng váng và phát nổ. Nó thích được để yên và tôn trọng không gian cá nhân của mình. Tuy nhiên, nếu cảm thấy bị đe dọa hoặc quá phấn khích, nó có thể tự phát nổ để tự vệ hoặc ăn mừng. Vì vậy, hãy cẩn thận khi ở gần nó nhé!',
    rarity: 'rare',
  ),

  'exeggcute': PokemonMeta(
    hint: 'Những quả trứng nhỏ biết nhảy múa, rủ nhau tấn công khi bị đe dọa.',
    lore: 'Những sinh vật bé nhỏ này trông giống như những quả trứng, nhưng thực ra chúng có mắt và đang nhìn ngó xung quanh. Chúng rất thích đi cùng nhau, tạo thành một nhóm vui nhộn. Nếu có ai đó làm chúng sợ hãi hoặc làm phiền, tất cả chúng sẽ nhanh chóng tụ tập lại và lao tới tấn công người đó. Chúng rất nhút nhát nhưng cũng rất dũng cảm khi ở bên nhau.',
    rarity: 'rare',
  ),

  'exeggutor': PokemonMeta(
    hint: 'Nó có ba đầu giống quả dừa',
    lore: 'Đồn rằng, đôi khi, một cái đầu sẽ rụng xuống và tiếp tục sống như một sinh vật nhỏ hơn. Ba cái đầu này cùng nghĩ và cùng hành động, đôi khi tranh cãi nhau về những điều ngớ ngẩn. Chúng rất thích sưởi nắng và tận hưởng những tia nắng ấm áp.',
    rarity: 'rare',
  ),

  'cubone': PokemonMeta(
    hint: 'Đeo sọ thú cũ, khóc tạo ra tiếng động buồn.',
    lore: 'Sinh vật nhỏ bé này luôn đội chiếc sọ của mẹ mình. Đã lâu lắm rồi, không ai từng thấy gương mặt thật của nó. Khi nó buồn, nước mắt sẽ rơi và biến thành những viên đá nhỏ. Chiếc sọ không chỉ là vật kỷ niệm mà còn là thứ bảo vệ nó khỏi những kẻ muốn bắt nạt.',
    rarity: 'common',
  ),

  'marowak': PokemonMeta(
    hint: 'Cầm xương, vung lên, đánh trả.',
    lore: 'Sinh vật dũng cảm này rất mạnh mẽ, thích lang thang và săn mồi. Nó luôn giữ chặt cây xương mà nó tìm thấy, coi đó như một báu vật. Khi giận dữ, nó sẽ vung cây xương đi thật xa và nó sẽ quay trở lại, đánh trúng đối thủ một cách nhanh chóng và hiệu quả, khiến kẻ địch phải khuất phục.',
    rarity: 'rare',
  ),

  'tyrogue': PokemonMeta(
    hint: 'Chú bé hiếu chiến luôn tràn đầy năng lượng.',
    lore: 'Nhóc tì này luôn tràn đầy sức sống, sẵn sàng chiến đấu không ngừng nghỉ để trở nên mạnh mẽ hơn. Dù có thua cuộc, nó vẫn quyết tâm rèn luyện và không bao giờ bỏ cuộc. Sôi nổi và kiên trì là những gì mô tả rõ nhất về chú nhóc này.',
    rarity: 'rare',
  ),

  'hitmonlee': PokemonMeta(
    hint: 'Đôi chân dài giúp nó chạy thật nhanh.',
    lore: 'Khi cần đi gấp, đôi chân của sinh vật này có thể dài ra. Nó chạy êm ru với những bước sải dài và uyển chuyển, làm cho việc di chuyển trở nên cực kỳ hiệu quả.',
    rarity: 'rare',
  ),

  'hitmonchan': PokemonMeta(
    hint: 'Đấm nhanh như chớp, trông như không làm gì.',
    lore: 'Vũ khí lợi hại nhất của chú là những cú đấm thoăn thoắt như tia chớp. Tuy nhìn bề ngoài có vẻ chẳng làm gì cả, nhưng thực ra chú đang tung ra hàng loạt đòn đánh mà mắt thường không thể nhìn thấy. Với đôi găng tay đặc biệt, mỗi cú ra đòn đều vô cùng uy lực, khiến đối thủ không kịp trở tay. Chú luôn tập luyện để nâng cao tốc độ và sức mạnh của những cú đấm bí ẩn này.',
    rarity: 'rare',
  ),

  'hitmontop': PokemonMeta(
    hint: 'Ba chân uyển chuyển, đòn đá nhanh như tên.',
    lore: 'Võ sĩ này có ba chân, mỗi chân lại có một sức mạnh riêng. Khi nhảy múa, trông nó thật duyên dáng và mềm mại, nhưng đừng để vẻ ngoài đó đánh lừa bạn. Mỗi cú xoay tròn và đá đều chứa đựng lực công phá khủng khiếp, có thể khiến đối thủ bất ngờ bay xa. Hãy cẩn thận nếu bạn bị cuốn hút bởi điệu nhảy của nó, bởi vì bạn có thể sẽ nhận một cú đấm sấm sét.',
    rarity: 'rare',
  ),

  'lickitung': PokemonMeta(
    hint: 'Lưỡi dài màu hồng, hay liếm.',
    lore: 'Sinh vật nhỏ bé đáng yêu với chiếc lưỡi cực dài, có thể thu lại hoặc duỗi ra tùy ý. Khi nó liếm thứ gì, mọi người thường cảm thấy một cảm giác tê tê ngứa ngứa rất lạ và thú vị. Nó thích liếm mọi thứ xung quanh để khám phá thế giới, bạn bè và cả đồ ăn nữa!',
    rarity: 'rare',
  ),

  'lickilicky': PokemonMeta(
    hint: 'Miệng rộng, thân hình tròn trịa, lưỡi dài ngoe nguẩy.',
    lore: 'Sinh vật này có một chiếc lưỡi cực kỳ dài và linh hoạt, có thể vươn ra để ôm lấy mọi thứ. Ai lỡ đến gần quá sẽ dễ dàng bị ướt sũng bởi nước dãi của nó. Chiếc lưỡi này còn giúp nó ăn những thức ăn khó lấy nhất.',
    rarity: 'epic',
  ),

  'koffing': PokemonMeta(
    hint: 'Quả bóng màu tím với sọ người màu trắng.',
    lore: 'Sinh vật này chứa nhiều loại khí độc bên trong cơ thể, khiến nó có thể phát nổ bất ngờ. Nó thường thích sống ở những nơi ô nhiễm, nơi có nhiều rác thải. Đừng lại gần khi thấy nó bốc hơi nhiều nhé!',
    rarity: 'common',
  ),

  'weezing': PokemonMeta(
    hint: 'Khi hai đám mây khí độc hợp lại, chúng sẽ biến hóa.',
    lore: 'Nơi hai loại khí độc gặp gỡ, hai bạn nhỏ có thể hợp nhất thành một sinh vật to lớn sau nhiều năm. Chúng thải ra những làn khói độc hại, có màu sắc và mùi hương khác nhau, tạo nên một màn khói đặc trưng. Sinh vật này thường được tìm thấy ở những nơi ô nhiễm, nơi chúng sinh trưởng và phát triển mạnh mẽ.',
    rarity: 'rare',
  ),

  'rhyhorn': PokemonMeta(
    hint: 'Chỉ biết chạy tới, không dừng lại.',
    lore: 'Loài vật này có một mục tiêu duy nhất và không bao giờ thay đổi. Một khi đã bắt đầu lao tới, nó sẽ không dừng lại cho đến khi kiệt sức và ngủ thiếp đi.  Sức mạnh của nó đến từ cái sừng to trên mũi, dùng để húc tung mọi thứ cản đường.  Nó rất thích những nơi có nhiều địa hình gồ ghề, nơi nó có thể thỏa sức chạy nhảy và thể hiện sức mạnh.',
    rarity: 'rare',
  ),

  'rhydon': PokemonMeta(
    hint: 'Thân hình to lớn, da cứng như đá, thích sống trong nơi nóng rực.',
    lore: 'Sinh vật khổng lồ này ẩn mình trong những vùng đất khắc nghiệt nhất. Lớp da dày và cứng như đá bao bọc cơ thể đồ sộ, giúp nó chống chọi với sức nóng khủng khiếp. Nó có thể tung hoành trong dòng dung nham sôi sùng sục, nơi mà hầu hết các sinh vật khác không thể tồn tại. Sức mạnh của nó thật đáng kinh ngạc, với chiếc sừng nhọn hoắt trên đầu có thể đập tan mọi thứ.',
    rarity: 'rare',
  ),

  'rhyperior': PokemonMeta(
    hint: 'Đôi tay to lớn bắn đá, trông rất dũng mãnh.',
    lore: 'Loài Pokémon này có đôi tay khổng lồ, thường nhét đá vào lòng bàn tay. Sức mạnh cơ bắp của nó giúp nó phóng những viên đá đó đi với tốc độ kinh hoàng. Đôi khi, những viên đá này phát nổ khi va chạm, tạo ra một cảnh tượng ngoạn mục. Thật kỳ lạ, đôi khi nó còn bắn cả những viên đá nhỏ hơn, có hình dáng giống như những quả bóng nhỏ màu nâu.',
    rarity: 'epic',
  ),

  'happiny': PokemonMeta(
    hint: 'Em bé thích cục đá tròn trắng như trứng.',
    lore: 'Chú Pokémon nhỏ này rất thích những vật tròn và màu trắng.  Trong túi của mình, bé luôn mang theo một hòn đá có hình dáng giống quả trứng, như là đang bắt chước một người bạn lớn hơn. Bé rất thích được mọi người ôm ấp và chăm sóc.',
    rarity: 'rare',
  ),

  'chansey': PokemonMeta(
    hint: 'Sinh vật màu hồng mang quả trứng may mắn.',
    lore: 'Loài Pokémon hiếm này ẩn mình, mang đến niềm vui cho những ai tìm thấy nó.  Nó được biết đến với sự dịu dàng và khả năng chăm sóc tuyệt vời.  Trứng mà nó luôn mang theo chứa đựng năng lượng tích cực, có thể làm tan biến nỗi buồn và mang lại nụ cười.',
    rarity: 'epic',
  ),

  'blissey': PokemonMeta(
    hint: 'Lòng đỏ màu hồng mềm mại, quả trứng dịu dàng.',
    lore: 'Sinh vật này mang trong mình sức mạnh chữa lành, chỉ cần nếm một miếng trứng của nó cũng đủ để biến bất kỳ ai trở nên ân cần và dễ chịu với mọi người. Quả trứng chứa sự ấm áp và tình yêu thương vô bờ bến, lan tỏa niềm vui và sự quan tâm đến tất cả.',
    rarity: 'epic',
  ),

  'tangela': PokemonMeta(
    hint: 'Thân mình quấn đầy dây leo xanh mướt, rung rinh khi di chuyển.',
    lore: 'Loài sinh vật nhỏ bé này được bao phủ bởi những sợi dây leo dày đặc, trông giống như rong biển. Khi nó bước đi, toàn bộ cơ thể sẽ lắc lư nhè nhẹ. Chúng thường sống ở những khu vực có nhiều cây cối và rất thích được chăm sóc bởi những người bạn tốt bụng. Dây leo của nó đôi khi còn có thể vươn ra để ôm chầm lấy những người nó yêu quý, tạo cảm giác ấm áp và dễ chịu.',
    rarity: 'rare',
  ),

  'tangrowth': PokemonMeta(
    hint: 'Tua tủa tua tủa, ôm ghì lấy mồi.',
    lore: 'Những cành cây dài ngoằng dùng để bắt giữ con mồi. Dù có mất đi vài cành tay, nó cũng chẳng bận tâm đâu. Nó chỉ cần nhanh chóng mọc ra những cành mới để tiếp tục cuộc sống của mình. Thật là một sinh vật kiên cường và có khả năng phục hồi đáng kinh ngạc trong khu rừng rậm.',
    rarity: 'epic',
  ),

  'kangaskhan': PokemonMeta(
    hint: 'Đứa con bé bỏng nép mình trong túi mẹ',
    lore: 'Sinh vật mẹ luôn mang theo đứa con nhỏ bé trong chiếc túi đặc biệt trên bụng. Em bé vô cùng yếu đuối và chỉ bắt đầu khám phá thế giới bên ngoài khi đã đủ lớn, thường là sau sinh nhật lần thứ ba. Sự bảo vệ của mẹ là tất cả đối với chúng trong những năm tháng đầu đời.',
    rarity: 'rare',
  ),

  'horsea': PokemonMeta(
    hint: 'sinh vật biển nhỏ bé, phun mực tài tình.',
    lore: 'Loài sinh vật biển bé nhỏ này nổi tiếng với khả năng bắn những tia mực chính xác xuống các loài côn trùng bay trên mặt nước. Chúng có thể sử dụng những tia mực này để bắt mồi hoặc bảo vệ bản thân khỏi kẻ thù. Vảy của chúng lấp lánh dưới ánh nắng, khiến chúng trông thật xinh đẹp khi tung tăng dưới làn nước trong xanh.',
    rarity: 'common',
  ),

  'seadra': PokemonMeta(
    hint: 'Cánh vây như cánh bơi giật lùi tài tình.',
    lore: 'Sinh vật bé nhỏ này có thể bơi ngược dòng nước một cách thật khéo léo. Đôi vây ngực của nó, trông như đôi cánh nhỏ, cùng chiếc đuôi chắc khỏe giúp nó di chuyển nhanh nhẹn, thậm chí là lùi lại khi cần thiết. Nó là một nhà vô địch trong việc điều hướng và giữ thăng bằng dưới nước.',
    rarity: 'rare',
  ),

  'kingdra': PokemonMeta(
    hint: 'Sinh vật biển với cặp sừng, có thể tạo xoáy nước khi ngáp.',
    lore: 'Loài sinh vật này thường ẩn mình trong các hang động dưới đáy biển sâu thẳm. Khi chúng ngáp, một luồng nước xoáy mạnh mẽ sẽ được tạo ra, khiến mọi thứ xung quanh chao đảo. Truyền thuyết kể rằng những xoáy nước này có thể cuốn trôi cả những con tàu lớn, cảnh báo những kẻ xâm nhập không được làm phiền giấc ngủ yên bình của chúng.',
    rarity: 'rare',
  ),

  'goldeen': PokemonMeta(
    hint: 'Vảy lấp lánh, đuôi như váy xòe lộng lẫy.',
    lore: 'Nó bơi lội uyển chuyển dưới nước, chiếc đuôi của nó tung bay như một chiếc váy dạ hội tuyệt đẹp. Vì vẻ ngoài thanh lịch này, người ta gọi nó là Nữ hoàng Nước. Thường được nhìn thấy ở những vùng nước trong lành, nó mang đến một vẻ đẹp tinh tế cho môi trường xung quanh.',
    rarity: 'common',
  ),

  'seaking': PokemonMeta(
    hint: 'Cá vàng cam bơi ngược dòng mạnh mẽ.',
    lore: 'Vào mùa sinh sản, loài cá này có thể được nhìn thấy bơi lội mạnh mẽ ngược dòng sông và suối. Vảy của chúng lấp lánh dưới ánh nắng khiến chúng trở nên vô cùng rực rỡ khi lao đi. Chúng có một chiếc sừng trên trán dùng để bảo vệ và tranh giành bạn tình.',
    rarity: 'rare',
  ),

  'staryu': PokemonMeta(
    hint: 'Ngôi sao biển đỏ sáng lấp lánh',
    lore: 'Sinh vật biển này có thể tái tạo lại cơ thể mình nếu một viên ngọc đỏ đặc biệt vẫn còn nguyên vẹn. Khi màn đêm buông xuống và đồng hồ điểm mười hai giờ, viên ngọc này sẽ phát sáng rực rỡ. Nó trôi dạt trong làn nước, để lại dấu vết của ánh sáng huyền bí.',
    rarity: 'common',
  ),

  'starmie': PokemonMeta(
    hint: 'Bông hoa biển với viên ngọc bảy sắc lung linh.',
    lore: 'Sinh vật biển này mang trên mình một viên ngọc quý giá ở trung tâm, tỏa sáng với bảy sắc cầu vồng rực rỡ. Ánh sáng từ viên ngọc này có thể làm dịu lòng người và dẫn đường cho những ai bị lạc trong biển đêm. Nhiều người tin rằng viên ngọc này mang lại may mắn và sức khỏe, nên họ rất trân trọng nó.',
    rarity: 'rare',
  ),

  'mime-jr': PokemonMeta(
    hint: 'Chú bé tóc xoăn hay nhại lại kẻ thù.',
    lore: 'Khi gặp kẻ thù, nó bắt chước từng cử chỉ. Ai bị nó nhại lại sẽ bị cuốn hút và không thể rời mắt. Nó thích biểu diễn và luôn cố gắng làm mọi thứ trở nên vui nhộn hơn, đôi khi còn làm người khác cười khúc khích.',
    rarity: 'rare',
  ),

  'mr-mime': PokemonMeta(
    hint: 'Chú hề biểu diễn với đôi tay to lớn.',
    lore: 'Chú hề này có khả năng tạo ra những thứ vô hình chỉ bằng những cái vẫy tay. Khi say sưa biểu diễn, nếu có ai làm gián đoạn, chú sẽ dùng đôi bàn tay rộng lớn của mình để dạy cho kẻ đó một bài học.  Chú rất thích làm mọi người cười bằng những màn diễn thú vị và những tiếng kêu vui nhộn.',
    rarity: 'rare',
  ),

  'mr-rime': PokemonMeta(
    hint: 'Chú chim đội mũ có chân dài, thích nhảy múa và dùng gậy băng.',
    lore: 'Sinh vật này có khả năng nhảy điệu nhàng như một nghệ sĩ múa ba lê. Nó sử dụng cây gậy làm từ băng để gõ nhịp theo những chuyển động uyển chuyển. Những bước nhảy của nó có thể tạo ra âm thanh vui tai, thu hút mọi người đến xem. Mỗi lần biểu diễn, nó đều mang đến niềm vui và sự ngưỡng mộ.',
    rarity: 'rare',
  ),

  'scyther': PokemonMeta(
    hint: 'Cánh xanh, lưỡi sắc bén.',
    lore: 'Sinh vật bay nhanh thoăn thoắt này có đôi cánh xanh mướt và cặp lưỡi hái sắc như dao. Khi di chuyển với tốc độ chóng mặt, nó có thể khiến bạn lầm tưởng như có nhiều hơn một cá thể đang lao tới. Khả năng né tránh và tấn công chớp nhoáng giúp nó trở thành một đối thủ đáng gờm trong rừng.',
    rarity: 'rare',
  ),

  'scizor': PokemonMeta(
    hint: 'Đôi càng to lớn tựa mắt sẽ uy hiếp kẻ địch. Thân hình cứng như thép.',
    lore: 'Chú bọ cánh cứng này có một lớp vỏ ngoài cứng cáp, giống như được làm từ kim loại quý. Nó thường vung vẩy đôi càng to lớn, trên đó có những hoa văn giống như đôi mắt để làm cho đối thủ sợ hãi. Màu đỏ rực của nó thật ấn tượng, và nó luôn sẵn sàng chiến đấu để bảo vệ bản thân.',
    rarity: 'epic',
  ),

  'kleavor': PokemonMeta(
    hint: 'Thân hình to lớn, dùng rìu và khiên bằng đá.',
    lore: 'Sinh vật hoang dã hung dữ, dùng rìu làm từ gỗ cứng để chặt đổ cả cây to và dùng khiên đá để tự vệ. Nếu vô tình gặp phải trong rừng, cách tốt nhất là chạy thật nhanh để bảo toàn tính mạng.',
    rarity: 'rare',
  ),

  'smoochum': PokemonMeta(
    hint: 'Môi chúm chím, nhạy cảm, hay dùng để khám phá.',
    lore: 'Sinh vật bé nhỏ này có đôi môi cực kỳ nhạy cảm. Chúng luôn dùng đôi môi mềm mại của mình để chạm vào mọi thứ xung quanh. Dù là đồ vật hay con người, chúng đều muốn tìm hiểu trước khi làm bất cứ điều gì. Cách khám phá thế giới của chúng thật đáng yêu và tò mò.',
    rarity: 'rare',
  ),

  'jynx': PokemonMeta(
    hint: 'Ngoại hình giống người với mái tóc vàng dài, luôn lắc lư duyên dáng.',
    lore: 'Sinh vật này có tiếng hát mê hoặc, khiến mọi người xung quanh không ngừng nhún nhảy theo điệu nhạc. Nó thường xuất hiện cùng nhau thành nhóm, và những điệu nhảy của chúng rất đồng đều và vui vẻ. Với đôi mắt to tròn và đôi môi chúm chím, nó toát lên vẻ tinh nghịch đáng yêu.',
    rarity: 'rare',
  ),

  'elekid': PokemonMeta(
    hint: 'Cánh tay xoay tròn tạo điện, nhưng pin nhanh hết.',
    lore: 'Sinh vật nhỏ bé này có đôi tay đặc biệt, có thể quay tít để tạo ra dòng điện yếu ớt. Tuy nhiên, năng lượng của nó không kéo dài được lâu. Vì vậy, nó chỉ tích trữ một chút điện năng mỗi lần. Hình dáng nhỏ nhắn và bộ phận phát điện trên tay là đặc điểm nhận dạng dễ thương của nó, luôn tràn đầy năng lượng cho những khoảnh khắc ngắn ngủi.',
    rarity: 'rare',
  ),

  'electabuzz': PokemonMeta(
    hint: 'Chú ong bắp cày với sọc đen này thích gần nguồn điện.',
    lore: 'Sinh vật này có sở thích sống gần các nhà máy điện. Thỉnh thoảng, chúng có thể lang thang rời xa và gây ra sự cố mất điện lớn cho cả thành phố. Khi bị kích động, chúng có thể phóng ra những cú sốc điện mạnh mẽ từ đôi cánh và cơ thể của mình, làm cho mọi thứ xung quanh rung chuyển và sáng rực.',
    rarity: 'rare',
  ),

  'electivire': PokemonMeta(
    hint: 'Sừng xanh lóe sáng khi điện giật mạnh',
    lore: 'Mỗi khi cảm thấy mạnh mẽ hơn, những tia lửa xanh bắt đầu nhấp nháy quanh đôi sừng của nó. Nó thường được tìm thấy ở những nơi có nhiều sấm sét, hấp thụ năng lượng để trở nên to lớn và mạnh mẽ hơn. Đôi khi, nó có thể phóng ra luồng điện cực mạnh để tự vệ hoặc khi nó quá phấn khích. Khi bộ lông của nó dựng đứng, có nghĩa là nó đang tích trữ rất nhiều năng lượng.',
    rarity: 'epic',
  ),

  'magby': PokemonMeta(
    hint: 'Miệng và mũi phun ra than hồng khi thở.',
    lore: 'Chú bé này có một cơ thể nhỏ bé nhưng chứa đựng sức nóng mãnh liệt. Mỗi lần hít vào và thở ra, những tia lửa ấm nóng lại tí tách rơi ra từ miệng và mũi của nó. Dù nhỏ nhắn, sự hiện diện của chú mang đến cảm giác ấm áp và tràn đầy năng lượng, như một ngọn lửa sắp bùng cháy.',
    rarity: 'rare',
  ),

  'magmar': PokemonMeta(
    hint: 'Lửa cam bao phủ, ẩn mình trong ánh lửa.',
    lore: 'Sinh vật này tỏa ra ánh sáng cam rực rỡ, giúp nó hòa mình hoàn hảo vào môi trường xung quanh đầy lửa.  Khi nó tức giận, ngọn lửa trên cơ thể sẽ bùng lên dữ dội hơn. Nó thích sống ở những nơi nóng bỏng và dùng hơi nóng từ cơ thể để nướng chín thức ăn trước khi ăn. Đôi khi, nó có thể phun ra những quả cầu lửa nhỏ để tự vệ hoặc tấn công.',
    rarity: 'rare',
  ),

  'magmortar': PokemonMeta(
    hint: 'Tay phun lửa nóng bỏng, sống trong núi lửa.',
    lore: 'Sinh vật này có khả năng bắn ra cầu lửa với nhiệt độ cực cao từ đầu cánh tay của mình. Nó thích nghi với môi trường khắc nghiệt và thường được tìm thấy cư trú trong những miệng núi lửa nóng bỏng.',
    rarity: 'epic',
  ),

  'pinsir': PokemonMeta(
    hint: 'Cái kẹp to lớn, sẵn sàng nghiền nát.',
    lore: 'Sinh vật này có đôi càng kẹp vô cùng khỏe, có thể dùng để tấn công đối thủ hoặc nâng đỡ những vật nặng. Nếu không thể nghiền nát con mồi ngay lập tức, nó sẽ xoay tròn và ném đối phương đi xa. Càng của nó rất sắc bén và cứng cáp.',
    rarity: 'rare',
  ),

  'tauros': PokemonMeta(
    hint: 'Chú bò rừng với ba chiếc đuôi đáng yêu.',
    lore: 'Khi đã nhắm mục tiêu, sinh vật này sẽ lao tới với sức mạnh đáng kinh ngạc. Nó có ba chiếc đuôi dài khỏe mạnh, liên tục quất vẫy khi nó phi nước đại. Với thân hình to lớn và cặp sừng uy lực, nó là một đối thủ đáng gờm.  Nó thích sống theo đàn và bảo vệ lãnh thổ của mình một cách hung hăng.',
    rarity: 'rare',
  ),

  'magikarp': PokemonMeta(
    hint: 'Chú cá màu cam yếu ớt, chỉ biết quẫy.',
    lore: 'Trong quá khứ xa xưa, chú cá này từng mạnh mẽ hơn nhiều so với các hậu duệ yếu đuối của nó ngày nay. Dù yếu ớt, nó luôn cố gắng nhảy lên khỏi mặt nước mỗi khi có cơ hội, có lẽ là để tìm kiếm điều gì đó tốt đẹp hơn.',
    rarity: 'common',
  ),

  'gyarados': PokemonMeta(
    hint: 'Rắn nước khổng lồ vảy xanh lam, hung hãn và mạnh mẽ.',
    lore: 'Sinh vật này có sức mạnh khủng khiếp, một khi nổi giận sẽ không gì ngăn cản được. Ngay cả trong cơn bão dữ dội nhất, nó vẫn có thể tàn phá mọi thứ trên đường đi. Dù có vẻ ngoài đáng sợ, nó lại là biểu tượng của sự kiên cường và sức mạnh tiềm ẩn.',
    rarity: 'rare',
  ),

  'lapras': PokemonMeta(
    hint: 'Rùa biển thân thiện chở người qua biển.',
    lore: 'Sinh vật hiếm hoi, từng bị săn bắt gần tuyệt chủng, giờ đây là người bạn đồng hành an toàn. Chúng có khả năng chở mọi người vượt qua những vùng nước rộng lớn, mang đến sự bình yên cho hành trình của bạn. Bộ mai êm ái và giọng hát du dương khiến chúng trở thành một hình ảnh đẹp đẽ và quý giá trên đại dương.',
    rarity: 'rare',
  ),

  'ditto': PokemonMeta(
    hint: 'Tớ có thể biến hình thành bất cứ ai bạn muốn!',
    lore: 'Tớ là một sinh vật kỳ diệu, có khả năng sao chép mã gen của mọi đối thủ. Chỉ cần chạm vào một ai đó, tớ sẽ lập tức biến thành một bản sao hoàn hảo của họ. Tớ thích chơi trò chơi bắt chước và luôn sẵn sàng thử sức với những hình dạng mới. Hãy xem tớ có thể biến thành ai tiếp theo nhé!',
    rarity: 'epic',
  ),

  'eevee': PokemonMeta(
    hint: 'Bộ lông mềm mại, mắt to tròn thông minh.',
    lore: 'Loài sinh vật này có cấu trúc gen độc đáo, không ổn định. Nó sở hữu khả năng thích ứng phi thường với môi trường xung quanh. Nếu tiếp xúc với các loại đá đặc biệt phát ra năng lượng kỳ lạ, nó có thể biến đổi thành những hình dạng hoàn toàn mới, mỗi hình dạng mang trong mình sức mạnh và đặc điểm riêng biệt.  Đó là một món quà tự nhiên khiến nó trở nên vô cùng đặc biệt.',
    rarity: 'rare',
  ),

  'vaporeon': PokemonMeta(
    hint: 'Đuôi dài như nàng tiên cá, thích sống gần nước.',
    lore: 'Sinh vật này yêu thích môi trường nước, thường ẩn mình gần những dòng sông hay hồ nước trong xanh. Chiếc đuôi dài của nó có những đường gân giống vây, khiến nhiều người lầm tưởng đó là chiếc đuôi của một nàng tiên cá xinh đẹp dưới biển. Nó bơi lội uyển chuyển và trông rất duyên dáng khi ở dưới nước.',
    rarity: 'rare',
  ),

  'jolteon': PokemonMeta(
    hint: 'Lông của nó dựng đứng như gai nhọn.',
    lore: 'Sinh vật bé nhỏ này có bộ lông màu vàng rực, dựng đứng như những mũi kim sắc bén. Nó có khả năng tích trữ những hạt điện tích âm trong không khí. Khi cần, nó sẽ phóng ra những tia sét mạnh mẽ với điện áp cực cao để bảo vệ bản thân và tấn công kẻ thù.',
    rarity: 'rare',
  ),

  'flareon': PokemonMeta(
    hint: 'Một sinh vật có bộ lông màu cam rực lửa sẽ làm bạn ấm lên.',
    lore: 'Trong cơ thể nó, có một kho chứa năng lượng nhiệt khổng lồ. Khi nó tích trữ năng lượng này, nhiệt độ của nó có thể tăng lên hơn 1600 độ. Bộ lông dày và mềm mại của nó có khả năng chịu nhiệt cực tốt, giúp nó không bị tan chảy dù ở nhiệt độ cao như vậy. Sinh vật này thường thích cuộn tròn lại khi ngủ để giữ ấm. Nó có thể lan tỏa hơi ấm cho những ai ở gần.',
    rarity: 'rare',
  ),

  'espeon': PokemonMeta(
    hint: 'Thần giao cách cảm, nhạy bén với luồng gió.',
    lore: 'Sinh vật này có đôi tai lớn và chiếc bờm xinh xắn. Lông trên cơ thể giúp nó cảm nhận những thay đổi nhỏ nhất của không khí, nhờ đó đoán trước được ý đồ của đối phương. Đôi mắt tím chứa đựng trí tuệ, giúp nó nhìn thấu mọi thứ xung quanh. Nó thường sống ở nơi yên tĩnh, tĩnh lặng để tập trung cảm nhận và suy đoán.',
    rarity: 'rare',
  ),

  'umbreon': PokemonMeta(
    hint: 'Có vòng vàng phát sáng trên người.',
    lore: 'Khi cảm thấy khó chịu, loài này sẽ bảo vệ bản thân bằng cách phun mồ hôi độc từ các lỗ chân lông. Ánh sáng từ những vòng trên cơ thể càng rực rỡ khi nó càng tức giận.',
    rarity: 'rare',
  ),

  'leafeon': PokemonMeta(
    hint: 'Em nó có đôi tai và chiếc đuôi giống lá cây, luôn tỏa không khí trong lành.',
    lore: 'Sinh vật này có khả năng đặc biệt, giống như cây cỏ, nó quang hợp để lấy năng lượng. Nhờ vậy, mọi nơi nó đi qua đều trở nên trong lành và mát mẻ. Nó rất thích ở dưới ánh nắng mặt trời, nơi nó có thể hấp thụ năng lượng và tái tạo sức sống. Đôi khi, bạn có thể thấy những chiếc lá nhỏ xinh rơi ra từ người nó, như một lời chào thân thiện.',
    rarity: 'rare',
  ),

  'glaceon': PokemonMeta(
    hint: 'Bộ lông cứng như kim băng, trông rất nguy hiểm.',
    lore: 'Khi cảm thấy bị đe dọa, nó có thể khiến bộ lông của mình đóng băng hoàn toàn. Những sợi lông cứng cáp và sắc nhọn sẽ dựng đứng lên giống như những chiếc kim, tạo thành một lớp bảo vệ vững chắc. Bất kỳ kẻ nào muốn tiếp cận đều phải cẩn thận với lớp áo giáp băng giá này.',
    rarity: 'rare',
  ),

  'sylveon': PokemonMeta(
    hint: 'Dáng hình xinh xắn, ruy băng bay lượn, tỏa hào quang dịu êm.',
    lore: 'Sinh vật đáng yêu này sở hữu những sợi ruy băng mềm mại bao quanh cơ thể. Khi gặp nguy hiểm hoặc cảm nhận được xung đột, chúng sẽ thả ra một luồng năng lượng ấm áp và dễ chịu. Luồng năng lượng này giúp xoa dịu những trái tim đang nóng giận, khiến mọi tranh cãi dần lắng xuống. Nhiều người cho rằng, chỉ cần ở gần chúng thôi cũng cảm thấy tâm hồn thanh thản và yêu đời hơn.',
    rarity: 'rare',
  ),

  'porygon': PokemonMeta(
    hint: 'Sinh vật kỹ thuật số màu hồng, có thể đi xuyên màn hình.',
    lore: 'Đây là một loài Pokémon đặc biệt, được tạo ra hoàn toàn từ mã máy tính. Nó có khả năng di chuyển một cách tự do trong không gian mạng, nơi thông tin số tồn tại. Hình dáng của nó có thể thay đổi tùy thuộc vào dữ liệu mà nó truy cập. Sinh vật này thường được tìm thấy trong các hệ thống máy tính.',
    rarity: 'rare',
  ),

  'porygon2': PokemonMeta(
    hint: 'Hình dáng tròn, màu hồng, luôn bay lơ lửng.',
    lore: 'Loài Pokemon này là phiên bản nâng cấp của một dạng trước đó, được chế tạo đặc biệt cho việc du hành vũ trụ. Nó sở hữu một lớp vỏ đặc biệt và khả năng xử lý dữ liệu tiên tiến, giúp nó thích nghi tốt với môi trường không gian. Tuy nhiên, dù có thiết kế hướng đến vũ trụ, nó lại không có khả năng bay lượn.',
    rarity: 'rare',
  ),

  'porygon-z': PokemonMeta(
    hint: 'Nó trông như một con vịt kỹ thuật số hay bị lỗi.',
    lore: 'Một Pokémon được nâng cấp bằng phần mềm đặc biệt, nhưng sự thay đổi này khiến nó hành xử kỳ lạ. Những phản ứng khó đoán và chuyển động giật cục của nó khiến nhiều người bối rối. Nó có thể xuất hiện ở đâu đó trong thế giới kỹ thuật số, đôi khi nhấp nháy vào thế giới thực một cách bất ngờ.',
    rarity: 'epic',
  ),

  'omanyte': PokemonMeta(
    hint: 'Sinh vật xoắn ốc cổ đại, có vỏ cứng.',
    lore: 'Là một trong những loài cổ xưa nhất, nó đã tuyệt chủng từ lâu.  Tuy nhiên, đôi khi người ta có thể nhìn thấy nó một lần nữa bằng cách sử dụng khoa học tiên tiến để hồi sinh từ hóa thạch.  Nó thường ẩn mình trong vỏ của mình để trốn tránh kẻ thù.',
    rarity: 'rare',
  ),

  'omastar': PokemonMeta(
    hint: 'Sinh vật cổ đại với vỏ ốc lớn và gai nhọn.',
    lore: 'Một Pokémon cổ đại đã tuyệt chủng. Vỏ ốc to lớn và nặng nề của nó khiến việc săn bắt thức ăn trở nên vô cùng khó khăn. Cuối cùng, nó không thể tìm đủ đồ ăn để sống sót, dẫn đến sự biến mất của loài này khỏi thế giới. Nó thường sống ở biển cả, dùng kiếm xoay thân để tấn công kẻ thù.',
    rarity: 'rare',
  ),

  'kabuto': PokemonMeta(
    hint: 'Sinh vật tròn xanh này có đôi mắt to.',
    lore: 'Một sinh vật cổ xưa được hồi sinh từ hóa thạch dưới đáy biển sâu. Nó từng sống cách đây hàng triệu năm, khi thế giới còn rất khác. Loài này đã tuyệt chủng từ rất lâu và chỉ được biết đến qua những dấu tích hóa thạch.',
    rarity: 'rare',
  ),

  'kabutops': PokemonMeta(
    hint: 'Có thân hình trơn mượt, bơi giỏi.',
    lore: 'Sinh vật cổ xưa này lao đi trong nước với tốc độ đáng kinh ngạc. Nó dùng những chiếc móng sắc nhọn để tấn công con mồi và hút hết chất dinh dưỡng bên trong.  Nó săn mồi trong vùng biển ấm áp, để lại dấu vết của những cuộc đi săn chóng vánh trên nền cát.',
    rarity: 'rare',
  ),

  'aerodactyl': PokemonMeta(
    hint: 'Bay lượn trên trời với hàm răng sắc bén như cưa.',
    lore: 'Sinh vật cổ đại đã từng thống trị bầu trời từ thuở hồng hoang. Răng của nó nhọn hoắt, sắc như lưỡi cưa, giúp nó săn mồi hiệu quả. Nó có đôi cánh lớn để bay lượn khắp nơi, khám phá thế giới rộng lớn.',
    rarity: 'rare',
  ),

  'munchlax': PokemonMeta(
    hint: 'Cún con ham ăn, ăn cả tảng lớn.',
    lore: 'Thích ăn uống lắm, nó có thể ăn hết đồ ăn nặng bằng cả người mình mỗi ngày. Thường thì nó sẽ chén sạch mà chẳng cần nhai kỹ gì cả. Mỗi khi thấy đồ ăn ngon là đôi mắt nó sáng rực lên và bụng thì reo vang. Vì thế, chúng ta cần phải chuẩn bị thật nhiều đồ ăn cho nó nhé!',
    rarity: 'rare',
  ),

  'snorlax': PokemonMeta(
    hint: 'Chú gấu xám to béo, chỉ thích ăn và ngủ.',
    lore: 'Sinh vật khổng lồ này dành gần như toàn bộ thời gian của mình để ăn thức ăn ngon và ngủ ngon lành. Nó đã phát triển một chiếc bụng tròn xoe vì lối sống lười biếng. Khi nó ngày càng to lớn, nó càng trở nên chậm chạp hơn nữa. Để nó thức dậy là một nhiệm vụ khó khăn, đôi khi cần phải làm điều gì đó thực sự đặc biệt.',
    rarity: 'epic',
  ),

  'articuno': PokemonMeta(
    hint: 'Chim huyền thoại phủ băng, thường bay lượn nơi tuyết phủ.',
    lore: 'Loài chim thần thoại này được cho là xuất hiện trước mắt những người gặp nạn, lạc bước giữa núi tuyết lạnh giá. Tiếng kêu của nó vang vọng như gió mùa đông gào thét, mang theo hơi lạnh thấu xương. Dù mang vẻ ngoài uy nghiêm và bí ẩn, sự xuất hiện của nó lại là niềm hy vọng cuối cùng cho những linh hồn lạc lối, như một lời dẫn đường đến nơi an toàn trong màn đêm băng giá.',
    rarity: 'legendary',
  ),

  'zapdos': PokemonMeta(
    hint: 'Chim thần mây, phóng tia sét khổng lồ',
    lore: 'Chắc chắn bạn đã nghe nói về loài chim huyền thoại này, một sinh vật uy dũng được cho là ẩn mình trên những đám mây bão. Khi nó xuất hiện, bầu trời sẽ rung chuyển bởi những tia sét ngoạn mục. Người ta tin rằng những tia sét này đến từ sức mạnh bẩm sinh của nó.  Nó là hiện thân của cơn thịnh nộ của tự nhiên, mang đến sức mạnh sấm sét và ánh sáng chói lóa.',
    rarity: 'legendary',
  ),

  'moltres': PokemonMeta(
    hint: 'Cánh của nó bùng cháy rực rỡ.',
    lore: 'Sinh vật huyền thoại này mang theo sức mạnh của lửa. Mỗi lần vỗ cánh, nó tạo ra những đốm lửa lấp lánh, soi sáng bầu trời. Nó được cho là tái sinh từ ngọn lửa của mình, mang đến hy vọng và sức sống.',
    rarity: 'legendary',
  ),

  'dratini': PokemonMeta(
    hint: 'Rắn nước màu xanh thẳm, vảy lấp lánh.',
    lore: 'Sinh vật huyền thoại này giờ đây đã được phát hiện sống dưới đáy đại dương. Chúng di chuyển uyển chuyển trong làn nước sâu, ẩn mình trong những rặng san hô rực rỡ. Tương truyền, vẻ đẹp của chúng có thể làm mê hoặc bất kỳ ai nhìn thấy. Tuy có vẻ ngoài hiền lành, chúng lại sở hữu sức mạnh tiềm ẩn phi thường, chờ đợi ngày được khám phá.',
    rarity: 'rare',
  ),

  'dragonair': PokemonMeta(
    hint: 'Rồng thần uyển chuyển, mang theo sức mạnh thay đổi thời tiết.',
    lore: 'Sinh vật huyền bí với vầng hào quang êm dịu, nó có khả năng điều khiển thời tiết xung quanh.  Những cơn mưa nhẹ hay những cơn gió mát lành đều có thể đến từ sự hiện diện của nó.  Người xưa tin rằng nó mang đến sự thịnh vượng và bình yên cho vùng đất.',
    rarity: 'rare',
  ),

  'dragonite': PokemonMeta(
    hint: 'Cánh tay rắn chắc, có thể bay xa.',
    lore: 'Một sinh vật biển cực hiếm, trí tuệ ngang con người. Nó thường lang thang trên bầu trời và biển cả, đôi khi được nhìn thấy bay qua những đám mây. Đôi cánh mạnh mẽ của nó có thể đưa nó đi khắp thế giới. Nó thân thiện và giúp đỡ mọi người gặp khó khăn trên biển.',
    rarity: 'rare',
  ),

  'mewtwo': PokemonMeta(
    hint: 'Sinh vật màu tím, có sức mạnh tâm linh bí ẩn.',
    lore: 'Chú ta ra đời từ những thí nghiệm di truyền tàn khốc kéo dài nhiều năm của một nhà khoa học. Sự tồn tại của chú là minh chứng cho những nỗ lực biến đổi gen và kỹ thuật DNA không ngừng nghỉ. Chú mang trong mình sức mạnh phi thường, một kẻ săn mồi đơn độc với trí tuệ siêu việt, luôn tìm kiếm mục đích sống của mình trong thế giới.',
    rarity: 'legendary',
  ),

  'mew': PokemonMeta(
    hint: 'Một sinh vật màu hồng nhỏ nhắn, uyển chuyển với đôi mắt to tròn.',
    lore: 'Truyền thuyết kể rằng một sinh vật nhỏ bé, có khả năng sao chép mọi đòn tấn công của đối phương, tồn tại đâu đó trên thế giới. Nó được cho là ẩn mình, tránh xa tầm mắt con người, và chỉ xuất hiện trước những người có trái tim thuần khiết. Nhiều người tin rằng nó là khởi nguồn của mọi loài Pokémon, nhưng đến nay vẫn chưa có bằng chứng xác thực nào được tìm thấy.',
    rarity: 'mythical',
  ),

  'chikorita': PokemonMeta(
    hint: 'Lá trên đầu tỏa hương ngọt ngào, thích tắm nắng.',
    lore: 'Cậu bé tốt bụng với chiếc lá trên đầu mang theo hương thơm dịu dàng. Nó thích nằm dài dưới ánh nắng ấm áp, tận hưởng sự dịu dàng của thiên nhiên. Đôi khi, nó sẽ lắc lư chiếc lá để mùi hương lan tỏa xa hơn, như một lời chào thân thiện với mọi sinh vật xung quanh. Sự vui vẻ và hiền lành của nó luôn mang lại cảm giác bình yên.',
    rarity: 'rare',
  ),

  'bayleef': PokemonMeta(
    hint: 'Cổ áo hương cay, thích giao đấu.',
    lore: 'Loài cây cỏ này có một chiếc vòng giống như lá cây quấn quanh cổ, tỏa ra mùi hương thơm nồng nàn như các loại gia vị. Mùi hương này không chỉ dễ chịu mà còn có một sức hút kỳ lạ, khơi gợi tinh thần chiến đấu mạnh mẽ ở bất kỳ ai ngửi thấy. Khi cảm thấy bị đe dọa hoặc muốn thử thách bản thân, nó sẽ dựng đứng chiếc vòng cổ của mình lên và sẵn sàng đối đầu.',
    rarity: 'rare',
  ),

  'meganium': PokemonMeta(
    hint: 'Hoa tỏa hương dịu dàng, tâm trạng vui vẻ.',
    lore: 'Một loài thực vật đặc biệt, tỏa ra mùi hương ngọt ngào từ những cánh hoa rực rỡ trên cổ. Mùi hương này có khả năng xoa dịu mọi cơn giận dữ, khiến những sinh vật xung quanh trở nên hiền hòa và dễ chịu hơn. Nó thường thích sống ở những nơi có nhiều ánh nắng và nước trong lành, nơi hương thơm của nó có thể lan tỏa xa nhất.',
    rarity: 'rare',
  ),

  'cyndaquil': PokemonMeta(
    hint: 'Đốm lửa nhỏ bé, rụt rè nhưng dũng cảm.',
    lore: 'Sinh vật nhỏ bé với chiếc đuôi rực lửa. Khi cảm thấy sợ hãi, ngọn lửa trên lưng em sẽ bùng cháy mạnh mẽ hơn, như muốn nói rằng em không dễ bị bắt nạt đâu. Dù có chút nhút nhát, em luôn sẵn sàng bảo vệ bản thân và những người bạn yêu quý. Hãy nhẹ nhàng tiếp cận nhé!',
    rarity: 'rare',
  ),

  'quilava': PokemonMeta(
    hint: 'Lưng nó bùng cháy, sẵn sàng tấn công.',
    lore: 'Khi chiến đấu, nếu nó quay lưng lại, hãy cẩn thận nhé. Đó là dấu hiệu cho thấy nó sắp tung ra một đòn tấn công dữ dội từ ngọn lửa trên lưng mình. Đừng để vẻ ngoài của nó đánh lừa, bởi sức nóng tỏa ra có thể khiến đối thủ phải dè chừng đấy!',
    rarity: 'rare',
  ),

  'typhlosion': PokemonMeta(
    hint: 'Lưng nó bùng cháy khi tức giận, cực kỳ nóng bỏng.',
    lore: 'Loài Pokémon này có một ngọn lửa rực cháy trên lưng. Khi cảm thấy cực kỳ tức giận hoặc bị đe dọa, ngọn lửa ấy sẽ bùng lên dữ dội hơn bao giờ hết, tỏa ra sức nóng khủng khiếp. Bất cứ thứ gì đến quá gần ngọn lửa giận dữ này đều có thể bốc cháy ngay lập tức. Có những lúc nó rít lên những tiếng lồng lộn khi ngọn lửa trên lưng bốc cháy. Nó luôn giữ một thái độ bình tĩnh và nhẹ nhàng, nhưng một khi tức giận thì rất khó để kiểm soát.',
    rarity: 'rare',
  ),

  'totodile': PokemonMeta(
    hint: 'Miệng to, răng sắc nhọn luôn sẵn sàng.',
    lore: 'Chú bé có bộ hàm khỏe mạnh, có thể nghiền nát mọi thứ. Ngay cả chủ nhân của nó cũng cần cẩn thận khi chơi đùa. Môi lúc cứ ngỡ nó muốn cắn ngón tay bạn, nhưng thật ra là nó chỉ đang hào hứng muốn chơi thôi. Nó thích ngâm mình trong nước và đôi khi dùng sức mạnh của mình để phá những thứ nó không thích.',
    rarity: 'rare',
  ),

  'croconaw': PokemonMeta(
    hint: 'Miệng đầy răng sắc nhọn, luôn thay thế cái mới.',
    lore: 'Khi nó vừa nở, nó đã có bộ hàm mạnh mẽ để cắn mọi thứ. Nó rụng một chiếc răng nanh, nhưng một chiếc khác sẽ mọc lại ngay lập tức. Miệng nó luôn có đủ 48 chiếc răng nanh để nghiền nát mọi thứ mà nó muốn ăn, khiến kẻ thù phải khiếp sợ mỗi khi nó cười.',
    rarity: 'rare',
  ),

  'feraligatr': PokemonMeta(
    hint: 'Cá sấu khổng lồ hàm răng sắc nhọn.',
    lore: 'Sinh vật với bộ hàm mạnh mẽ, nó lắc mạnh cái đầu khi tấn công, xé toạc con mồi một cách tàn bạo.  Nó có thể bơi lội nhanh nhẹn dưới nước và thường săn mồi ở các con sông.',
    rarity: 'rare',
  ),

  'sentret': PokemonMeta(
    hint: 'Dùng đuôi đứng dậy để quan sát.',
    lore: 'Chú bé luôn cảnh giác, nhờ chiếc đuôi vững chãi, cu tí có thể đứng thẳng để nhìn xa hơn. Từ vị trí cao, chú có thể phát hiện nguy hiểm hoặc bạn bè đang đến từ sớm. Chú rất thích sống với gia đình và luôn quan tâm đến mọi người xung quanh.',
    rarity: 'common',
  ),

  'furret': PokemonMeta(
    hint: 'Lưng dài, thân hình mảnh mai, thích ngủ trong tổ riêng.',
    lore: 'Sinh vật có thân hình thuôn dài này rất khéo léo trong việc xây tổ. Chúng dùng sự khéo léo của mình để tạo ra một không gian ấm áp, vừa vặn với vóc dáng đặc biệt của mình. Nơi trú ẩn này được thiết kế tỉ mỉ đến mức khó có sinh vật nào khác có thể bước vào, mang lại cảm giác an toàn và riêng tư tuyệt đối cho chủ nhân của nó. Đây là nơi chúng nghỉ ngơi, sinh hoạt và bảo vệ bản thân khỏi những điều không mong muốn từ thế giới bên ngoài.',
    rarity: 'rare',
  ),

  'hoothoot': PokemonMeta(
    hint: 'Chim cú đêm ngủ một chân, đổi chân thoăn thoắt.',
    lore: 'Loài chim này rất thích ngủ trên một chân, và chúng đổi chân nhanh đến mức khó có thể nhìn thấy. Khi ngủ, chúng gập mình lại và dụi chiếc mỏ vào bộ lông dày. Chúng có thể nhìn thấy trong đêm tối nhờ đôi mắt to tròn và có khả năng bay lượn cực kỳ yên tĩnh.',
    rarity: 'common',
  ),

  'noctowl': PokemonMeta(
    hint: 'Chú chim đêm có đôi mắt sáng rực.',
    lore: 'Loài chim này hoạt động chủ yếu vào ban đêm, với khả năng nhìn xuyên bóng tối đáng kinh ngạc. Đôi mắt của nó rất nhạy bén, có thể thu nhận được những tia sáng yếu ớt nhất, giúp nó tìm kiếm thức ăn và di chuyển an toàn trong đêm. Chúng thường bay lượn nhẹ nhàng, không gây ra tiếng động, và có thể xoay đầu gần như 180 độ để quan sát xung quanh.',
    rarity: 'rare',
  ),

  'ledyba': PokemonMeta(
    hint: 'Cánh đỏ chấm bi, thích đi cùng bạn bè.',
    lore: 'Loài bọ cánh nhỏ này rất nhút nhát, không dám tự mình đi đâu. Nhưng khi ở cùng với những người bạn thân thiết, chúng lại trở nên cực kỳ năng động và vui vẻ, cùng nhau bay lượn khắp nơi. Những chấm bi trên cánh của chúng như những ngôi sao nhỏ lấp lánh.',
    rarity: 'common',
  ),

  'ledian': PokemonMeta(
    hint: 'Cánh mỏng với đốm sáng lung linh.',
    lore: 'Khi màn đêm buông xuống và những vì sao bắt đầu lấp lánh, sinh vật nhỏ này sẽ bay lượn khắp nơi. Nó rắc lên những hạt bụi phát sáng kỳ diệu, tạo nên một khung cảnh lung linh huyền ảo. Những hạt bụi này được cho là có khả năng mang lại giấc mơ đẹp cho những ai nhìn thấy chúng.',
    rarity: 'rare',
  ),

  'spinarak': PokemonMeta(
    hint: 'Nó chờ đợi im lặng trong mạng nhện của mình.',
    lore: 'Loài côn trùng nhỏ bé này dành cả ngày lẫn đêm để giăng tơ, tạo ra những tấm lưới phức tạp để bẫy mồi. Nó kiên nhẫn nằm im, bất động, chờ đợi những kẻ phiêu lưu mạo hiểm hay những sinh vật bay qua. Khi con mồi mắc kẹt, nó sẽ nhanh chóng tấn công bằng nọc độc của mình. Nó thích sống ở những nơi tối tăm và ẩm ướt, nơi mạng nhện của nó có thể phát huy tác dụng tốt nhất.',
    rarity: 'common',
  ),

  'ariados': PokemonMeta(
    hint: 'Vẽ hoa văn trên bụng bằng tơ nhả ra từ miệng và đuôi.',
    lore: 'Loài Pokemon này có khả năng tạo ra những sợi tơ cực kỳ chắc chắn. Chúng dùng những sợi tơ này để làm tổ, phục kích con mồi và thậm chí để thu hút bạn tình. Thật khó để biết nó đang nhả tơ từ đâu, bởi cả miệng và đuôi đều có thể tạo ra chúng, khiến con mồi bối rối.',
    rarity: 'rare',
  ),

  'chinchou': PokemonMeta(
    hint: 'Vệt sáng đôi mắt và "râu" lấp lánh.',
    lore: 'Sinh vật nhỏ bé này có "râu" phát sáng, đôi khi chúng nhấp nháy như tín hiệu để thông báo cho nhau về lãnh thổ của mình. Chúng thích sống ở những vùng nước trong lành và thường bơi lội theo đàn nhỏ. Khi cảm thấy vui vẻ, toàn thân chúng sẽ phát ra ánh sáng dịu nhẹ, tạo nên một khung cảnh lung linh huyền ảo.',
    rarity: 'common',
  ),

  'lanturn': PokemonMeta(
    hint: 'Sinh vật biển tỏa sáng rực rỡ, dẫn đường trong bóng tối.',
    lore: 'Sinh vật này sống sâu dưới đáy biển, nơi ánh sáng mặt trời không thể chạm tới. Tuy nhiên, nó phát ra một thứ ánh sáng  vô cùng mạnh mẽ, có thể soi sáng cả một vùng biển rộng lớn từ độ sâu kinh ngạc.  Ánh sáng đó không chỉ giúp nó nhìn rõ xung quanh mà còn thu hút những sinh vật nhỏ bé khác, trở thành một ngọn hải đăng di động trong vực thẳm.  Nó di chuyển chậm rãi, mang theo nguồn sáng ấm áp của mình qua những dặm dài của đại dương.',
    rarity: 'rare',
  ),

  'togepi': PokemonMeta(
    hint: 'Vỏ trứng tròn đáng yêu mang lại niềm vui.',
    lore: 'Sinh vật nhỏ bé này có vẻ ngoài như một quả trứng, với lớp vỏ tròn xinh xắn. Nó được cho là chứa đầy niềm vui và sẽ chia sẻ may mắn cho những ai đối xử tốt với nó. Khi cảm thấy hạnh phúc, nó thường rung lắc nhẹ, tạo ra âm thanh lảnh lót dễ thương. Nó thích được vuốt ve và chơi đùa cùng mọi người.',
    rarity: 'common',
  ),

  'togetic': PokemonMeta(
    hint: 'Cánh bướm xinh lung linh, mang nụ cười.',
    lore: 'Loài sinh vật nhỏ bé, có đôi cánh lấp lánh như cầu vồng, được cho là sẽ xuất hiện trước những trái tim nhân hậu và tràn đầy tình yêu thương. Khi nó đến, không khí xung quanh sẽ tràn ngập niềm vui và may mắn. Truyền thuyết kể rằng, sự xuất hiện của nó là một điềm lành, mang đến những điều tốt đẹp và hạnh phúc cho mọi người.',
    rarity: 'rare',
  ),

  'togekiss': PokemonMeta(
    hint: 'Đôi cánh to lớn và vẻ ngoài hiền lành.',
    lore: 'Sinh vật này chỉ xuất hiện ở nơi yên bình, mang lại may mắn và niềm vui. Chúng rất nhạy cảm với xung đột, nên ngày càng khó bắt gặp. Ánh sáng dịu dàng từ lớp lông vũ của nó xua tan mọi buồn phiền, và những chuyến bay của nó mang theo hy vọng. Bạn có thể cảm nhận được sự bình yên khi nó ở gần.',
    rarity: 'epic',
  ),

  'natu': PokemonMeta(
    hint: 'Chú chim nhỏ mọc cánh, thích nhìn ngắm mọi thứ xung quanh.',
    lore: 'Vì đôi cánh còn non nớt chưa phát triển hoàn chỉnh, chú phải nhảy nhót để di chuyển. Ánh mắt của chú luôn tập trung vào một điểm nào đó, như đang khám phá thế giới bằng sự tò mò vô tận. Đôi khi, chú có vẻ đăm chiêu, suy ngẫm về những điều kỳ diệu mà mình quan sát được.',
    rarity: 'common',
  ),

  'xatu': PokemonMeta(
    hint: 'Chú chim đứng im lặng, đôi mắt nhìn xa xăm.',
    lore: 'Người ta đồn rằng nó thường đứng yên và im lặng vì nó có thể nhìn thấy cả quá khứ và tương lai cùng một lúc. Với đôi mắt đặc biệt, nó dường như chẳng bao giờ bối rối trước bất kỳ điều gì xảy ra. Nó sống khép mình, đôi khi có thể thấy những hình ảnh kỳ lạ trong không trung, như đang trò chuyện với những ai không có ở đó.',
    rarity: 'rare',
  ),

  'mareep': PokemonMeta(
    hint: 'Bộ lông xù bông, ấm áp.',
    lore: 'Khi có nhiều điện tích tĩnh tụ trong cơ thể, bộ lông của nó sẽ phồng lên gấp đôi. Nếu chạm vào, bạn sẽ bị giật điện.',
    rarity: 'common',
  ),

  'flaaffy': PokemonMeta(
    hint: 'Cừu non có những mảng da trơ trụi do quá tải điện.',
    lore: 'Khi tích trữ quá nhiều điện bên trong cơ thể, những mảng lông mềm mại trên người chú cừu non này đã không thể mọc lại được. Thay vào đó, da trần trụi xuất hiện ở những vị trí đó. Chú cừu non có vẻ không thoải mái lắm với những chỗ bị trụi lông này.',
    rarity: 'rare',
  ),

  'ampharos': PokemonMeta(
    hint: 'Đ đ đ đ đ đ đ đ đ đ đ đ đ đ đ đ đ đ đ đ đ đ',
    lore: 'Đuôi của nó phát sáng rực rỡ, có thể nhìn thấy từ rất xa. Nó đóng vai trò như một ngọn hải đăng cho những người bị lạc. Khi gặp nguy hiểm, nó sẽ xù lông lên và phát ra ánh sáng chói lòa để xua đuổi kẻ thù.',
    rarity: 'rare',
  ),

  'bonsly': PokemonMeta(
    hint: 'Luôn trông như đang khóc, điều chỉnh nước trong cơ thể.',
    lore: 'Chú bé này có vẻ ngoài buồn bã, nhưng thật ra đó là cách cơ thể rũ bỏ phần chất lỏng dư thừa. Khi điều tiết lượng nước, đôi mắt chú ươn ướt như đang tuôn lệ. Dù trông có vẻ yếu đuối, đó là một phần quan trọng trong quá trình phát triển của chú, giúp chú khỏe mạnh hơn.',
    rarity: 'common',
  ),

  'sudowoodo': PokemonMeta(
    hint: 'Luôn giả vờ là cây nhưng lại giống đá hơn.',
    lore: 'Loài này có biệt tài giả dạng cây cổ thụ để ẩn mình. Dù trông giống cây cối, nhưng thực chất cơ thể nó lại cấu tạo từ đá. Nó thích sống ở những vùng đất khô cằn, nơi nó có thể dễ dàng hòa mình vào cảnh vật xung quanh. Khi gặp nguy hiểm, nó sẽ đứng yên như cây, khiến kẻ săn mồi khó phát hiện ra. Đôi khi, nước mưa còn có thể làm lớp đá của nó trở nên xanh tươi hơn, trông càng giống cây.',
    rarity: 'rare',
  ),

  'hoppip': PokemonMeta(
    hint: 'Bông gòn nhỏ bé bay lơ lửng, tụm năm tụm ba.',
    lore: 'Sinh vật nhỏ nhắn này có lớp vỏ bông mềm mại, giúp chúng nhẹ nhàng bay lên trong gió. Chúng thích cảm giác những làn gió nhẹ lướt qua, nhưng khi có gió mạnh, chúng sẽ tụ tập lại với nhau để không bị thổi bay. Chúng giống như những đám mây nhỏ di động, mang lại sự dễ chịu và vui vẻ cho những ai nhìn thấy chúng vui đùa cùng thiên nhiên.',
    rarity: 'common',
  ),

  'skiploom': PokemonMeta(
    hint: 'Cánh hoa trên đầu nở ra, khép lại theo hơi ấm.',
    lore: 'Khi bầu trời ấm áp, bông hoa trên đầu nó sẽ nở rộ, tỏa hương thơm dịu dàng. Nhưng khi trở lạnh, bông hoa sẽ khép mình lại, trông thật đáng yêu. Nó thích bay lượn trên những cánh đồng hoa rực rỡ, nơi có nhiều ánh nắng mặt trời và những người bạn nhỏ. Đôi khi, nó còn dùng những cánh hoa nhỏ bé của mình để tạo ra những đám mây hình trái tim trên bầu trời.',
    rarity: 'rare',
  ),

  'jumpluff': PokemonMeta(
    hint: 'Bông gòn biết bay, tung tán nhỏ.',
    lore: 'Suốt ngày lơ lửng trên không, nó khéo léo điều khiển những cụm bông trắng xốp để bay lượn. Có khi nó còn rong ruổi khắp nơi trên thế giới, mang theo những hạt mầm nhỏ bé. Những bông hoa mềm mại, bé xíu này là niềm vui của nhiều em nhỏ.',
    rarity: 'rare',
  ),

  'aipom': PokemonMeta(
    hint: 'Chú khỉ với chiếc đuôi dài và linh hoạt.',
    lore: 'Chú linh trưởng nhỏ bé này dùng chiếc đuôi khéo léo của mình để đu trên cây. Chiếc đuôi đó chắc khỏe lắm, đủ sức để giữ chú lơ lửng trên không trung khi chú bám vào cành cây. Đôi mắt to tròn và bộ lông màu tím nhạt khiến chú trông rất đáng yêu và thích khám phá môi trường xung quanh.',
    rarity: 'rare',
  ),

  'ambipom': PokemonMeta(
    hint: 'Có hai chiếc đuôi khéo léo dùng để ăn.',
    lore: 'Chú sinh vật này rất thích ăn các loại hạt. Hai chiếc đuôi linh hoạt của nó giúp nó tách vỏ hạt một cách dễ dàng. Bây giờ nó không còn dùng tay nhiều nữa vì đã có đuôi lo việc đó. Nó thường nhảy nhót trên cây và sử dụng đuôi để đung đưa, di chuyển nhanh nhẹn qua các cành lá.',
    rarity: 'rare',
  ),

  'sunkern': PokemonMeta(
    hint: 'Quả hạt có lá mọc trên đầu, đôi khi rơi xuống.',
    lore: 'Sinh vật nhỏ bé này mang một hạt giống trên đầu, được bao phủ bởi những chiếc lá xanh mướt. Đôi khi, nó có thể bất ngờ rơi từ trên cao xuống. Nếu cảm thấy bị đe dọa, nó sẽ lắc mạnh những chiếc lá của mình, như một cách để tự vệ.',
    rarity: 'common',
  ),

  'sunflora': PokemonMeta(
    hint: 'Một bông hoa mặt trời nở rộ, luôn tìm ánh sáng.',
    lore: 'Khi mặt trời chiếu sáng, nó sẽ tỏa ra năng lượng và nở rộ thật đẹp. Cánh hoa của nó luôn hướng về phía mặt trời, hấp thụ tất cả ánh sáng ấm áp. Khi hoàng hôn buông xuống và bóng tối bao trùm, nó sẽ nhẹ nhàng khép cánh lại, yên giấc cho đến bình minh. Nó giống như một đóa hoa vui vẻ luôn mang theo niềm vui và sự ấm áp của ngày.',
    rarity: 'rare',
  ),

  'yanma': PokemonMeta(
    hint: 'Cánh rộng, đôi mắt to, bay vù vù.',
    lore: 'Côn trùng này có đôi cánh bé xíu nhưng vỗ thật nhanh tạo ra những cơn sóng âm mạnh mẽ. Những cơn sóng này đủ sức làm rung chuyển mọi thứ xung quanh, thậm chí có thể làm vỡ cả cửa sổ ở gần. Nó thường bay lượn ở những nơi có nhiều cây cối, thích tìm kiếm những nơi yên tĩnh để nghỉ ngơi sau khi biểu diễn sức mạnh đôi cánh của mình.',
    rarity: 'rare',
  ),

  'yanmega': PokemonMeta(
    hint: 'Một con côn trùng khổng lồ với đôi cánh lớn vẫy mạnh.',
    lore: 'Sinh vật bay này sở hữu đôi cánh to lớn, rung động với tốc độ kinh hoàng, tạo ra những luồng gió mạnh mẽ. Khi bay, nó phát ra tiếng vo ve ù ù như sấm. Nó rất nhanh nhẹn và có thể thay đổi hướng đột ngột. Sức mạnh của đôi cánh không chỉ giúp nó di chuyển mà còn là vũ khí, tạo ra những cơn chấn động khí quyển đủ mạnh để gây tổn thương nghiêm trọng từ bên trong cho đối thủ.',
    rarity: 'epic',
  ),

  'wooper': PokemonMeta(
    hint: 'Sinh vật màu xanh dương nhỏ nhắn rất thích nước mát.',
    lore: 'Cậu bé này thích sống trong những vùng nước lạnh lẽo. Khi trời trở lạnh, cậu sẽ lên bờ để tìm kiếm những món ăn ngon.  Cơ thể mềm mại và đôi mắt nhỏ tròn là đặc điểm dễ nhận biết của cậu.',
    rarity: 'common',
  ),

  'quagsire': PokemonMeta(
    hint: 'Chú ếch xanh lười biếng, thích nghịch nước.',
    lore: 'Sinh vật hiền lành và vui vẻ này sống ở các vùng sông nước. Với tính cách thoải mái, nó thường không để ý xung quanh, đặc biệt là khi đang bơi lội. Thật ngộ nghĩnh, nó hay va đầu vào thân thuyền bè qua lại.',
    rarity: 'rare',
  ),

  'clodsire': PokemonMeta(
    hint: 'Chú sâu ngộ nghĩnh phun độc bảo vệ mình.',
    lore: 'Một chú sâu tròn tròn, hiền lành nhưng có vũ khí bí mật. Khi bị đe dọa, chú sẽ xù gai độc ra ngoài. Hành động này rất rủi ro, chú dồn hết sức mạnh của mình để bảo vệ bản thân. Chú thích sống ở những nơi ẩm ướt và yên tĩnh, thường ẩn mình dưới lá cây hoặc trong lòng đất.',
    rarity: 'rare',
  ),

  'murkrow': PokemonMeta(
    hint: 'Cánh đen, mắt đỏ, thích lượm đồ vật.',
    lore: 'Loài chim nhỏ này thường bay lượn trong đêm, thu hút sự chú ý bằng đôi mắt đỏ rực và chiếc lông đen tuyền. Người ta đồn rằng việc nhìn thấy nó vào ban đêm sẽ mang lại điềm gở. Chúng có tập tính thích gom góp những vật lấp lánh, chúng có thể mang những vật đó về tổ của mình.',
    rarity: 'epic',
  ),

  'honchkrow': PokemonMeta(
    hint: 'Chim đêm lớn, có vẻ ngoài oai vệ.',
    lore: 'Sinh vật này trở nên hoạt bát khi màn đêm buông xuống. Nó thường được nhìn thấy bay lượn với một đám đông đông đảo những chú chim nhỏ hơn đi theo sau. Nhờ vào tiếng kêu vang vọng và khả năng săn mồi tài tình dưới ánh trăng, nó được mọi người kính nể và đôi khi hơi sợ hãi. Nó thống trị bầu trời đêm.',
    rarity: 'epic',
  ),

  'misdreavus': PokemonMeta(
    hint: 'Sinh vật bóng đêm thích dọa người bằng tiếng khóc',
    lore: 'Nó thích đùa nghịch những trò tinh quái, như la hét và rên rỉ để làm mọi người giật mình lúc ban đêm. Bóng đêm là bạn đồng hành của nó, và nó thích ẩn mình trong bóng tối để quan sát thế giới. Đôi khi, nó chỉ muốn chơi với những người mà nó gặp, mặc dù cách chơi của nó đôi khi hơi đáng sợ.',
    rarity: 'rare',
  ),

  'mismagius': PokemonMeta(
    hint: 'Sinh vật ma thuật với chiếc mũ nhọn và cười khúc khích.',
    lore: 'Bóng ma bí ẩn này phát ra những âm thanh kỳ lạ giống như câu thần chú. Ai nghe thấy nó sẽ bị hành hạ bởi những cơn đau đầu và nhìn thấy những ảo giác đáng sợ. Nó thường lơ lửng trong bóng tối, tạo ra một bầu không khí u ám.',
    rarity: 'rare',
  ),

  'wynaut': PokemonMeta(
    hint: 'Luôn mỉm cười, đuôi vẫy nếu tức giận.',
    lore: 'Chú bé này luôn nở nụ cười tươi rói, bạn có thể thấy nó vui vẻ khắp nơi. Đừng để bị lừa, đôi khi nó có thể tức giận đấy! Hãy xem cái đuôi của nó nhé, nếu nó đang quất mạnh xuống đất thì biết là nó đang rất bực mình. Nhưng đừng lo, cơn giận của nó thường qua nhanh thôi.',
    rarity: 'rare',
  ),

  'wobbuffet': PokemonMeta(
    hint: 'Cái gì thích ẩn mình trong bóng tối và thích giật mình?',
    lore: 'Chú ta không thích bị ánh sáng chiếu vào hoặc bị làm giật mình. Khi bị tấn công, chú ta sẽ phồng to cơ thể để chuẩn bị cho một cú phản đòn thật mạnh mẽ. Chú ta yêu bóng tối nên thường ẩn mình ở những nơi tối tăm. Đừng làm chú ta sợ nhé, vì chú ta có thể làm bạn giật mình đó!',
    rarity: 'rare',
  ),

  'girafarig': PokemonMeta(
    hint: 'Có hai đầu, một đầu nhìn trước, một đầu nhìn sau.',
    lore: 'Sinh vật này có hai bộ não, một ở đầu chính và một ở chiếc đuôi trông như cái đầu kia. Chiếc đuôi nhỏ bé ấy có thể tự nó suy nghĩ và hành động. Nó phản ứng với mùi hương và có thể cắn nếu bạn đến quá gần. Thật khó để đoán xem nó sẽ nhìn bạn bằng cái đầu nào!',
    rarity: 'rare',
  ),

  'farigiraf': PokemonMeta(
    hint: 'Con vật hai đầu với tâm trí kết nối, sức mạnh gấp mười.',
    lore: 'Khi hai bộ não của đầu và đuôi hòa làm một, sức mạnh tâm linh của sinh vật này tăng lên gấp mười lần so với trước đây. Nó có khả năng điều khiển các vật thể xung quanh bằng ý nghĩ và bảo vệ bản thân khỏi nguy hiểm với những đòn tấn công tâm linh mạnh mẽ.',
    rarity: 'rare',
  ),

  'pineco': PokemonMeta(
    hint: 'Cái vỏ cây nặng trĩu không làm khó nó.',
    lore: 'Sinh vật nhỏ bé này thích khoác lên mình những lớp vỏ cây mới. Nó kỳ công tích lũy từng mảnh, làm cho chiếc vỏ ngày càng dày hơn. Cứ mỗi lần thêm một lớp, nó lại cảm thấy mình vững chãi hơn. Trọng lượng tăng thêm chẳng hề khiến nó bận tâm, vì nó biết rằng sự bảo vệ này là vô cùng quan trọng.',
    rarity: 'common',
  ),

  'forretress': PokemonMeta(
    hint: 'Khi bị đe dọa, nó sẽ cuộn tròn thành khối cầu cứng nhắc.',
    lore: 'Sinh vật này dường như hoàn toàn được bao phủ bởi một lớp vỏ bọc cứng cáp như thép. Có vẻ như bên trong lớp giáp kiên cố này là cả một bí ẩn. Nó sử dụng lớp vỏ này để tự bảo vệ mình và đôi khi còn để di chuyển nhanh chóng. Không ai biết chính xác những gì ẩn giấu bên trong đó, nhưng nó dường như rất kiên cường.',
    rarity: 'rare',
  ),

  'dunsparce': PokemonMeta(
    hint: 'Bò xuống đất bằng chiếc đuôi của nó.',
    lore: 'Sinh vật nhỏ nhắn này rất thích đào hang. Khi cảm thấy nguy hiểm, nó sẽ dùng chiếc đuôi mạnh mẽ của mình để nhanh chóng chui xuống lòng đất. Nó sống trong các hang động yên tĩnh và thường chỉ hoạt động vào ban đêm để tìm kiếm thức ăn là quả mọng.',
    rarity: 'common',
  ),

  'dudunsparce': PokemonMeta(
    hint: 'Thân dài, có sáu gai nhỏ trên lưng.',
    lore: 'Sinh vật này dùng chiếc đuôi cứng của mình để đào hang trong đá cứng sâu dưới lòng đất, tạo ra những tổ dài tới vài km. Chúng thích sống trong bóng tối và rất bảo vệ tổ ấm của mình.',
    rarity: 'rare',
  ),

  'gligar': PokemonMeta(
    hint: 'Một sinh vật có cánh lao thẳng vào mặt đối thủ.',
    lore: 'Loài vật này có đôi cánh dơi giống như màng, thích bay lên cao và chờ đợi. Khi nhìn thấy con mồi sơ hở, nó sẽ lao xuống một cách nhanh chóng và bất ngờ. Nó sử dụng chiếc đuôi sắc nhọn để bám chặt vào kẻ địch, sau đó tiêm nọc độc khiến nạn nhân cảm thấy chóng mặt và mất phương hướng. Chúng thường sống ở những vách đá cao, nơi chúng có thể dễ dàng quan sát xung quanh và thực hiện những cuộc tấn công bất ngờ của mình.',
    rarity: 'rare',
  ),

  'gliscor': PokemonMeta(
    hint: 'Nó treo ngược trên cây, chờ đợi thời cơ.',
    lore: 'Sinh vật này có đôi cánh rộng và chiếc đuôi sắc nhọn. Nó thích ẩn mình trên cao, treo ngược trên cành cây và kiên nhẫn rình rập con mồi. Khi thời điểm thích hợp đến, nó sẽ lao xuống một cách nhanh chóng và bất ngờ, sử dụng sự nhanh nhẹn và móng vuốt của mình để bắt lấy con mồi.',
    rarity: 'epic',
  ),

  'snubbull': PokemonMeta(
    hint: 'Chú chó nhỏ màu hồng, trông dữ tợn nhưng rất đáng yêu.',
    lore: 'Dù có vẻ ngoài hơi đáng sợ, nhưng thực chất nó lại vô cùng dịu dàng và tình cảm. Nụ cười toe toét cùng chiếc mũi tròn xoe luôn khiến mọi người cảm thấy vui vẻ. Nó rất thích được âu yếm và vuốt ve, đặc biệt là bởi những người phụ nữ xinh đẹp. Đôi tai lớn và cái đuôi ngắn là điểm nhấn đáng yêu của nó, khiến ai nhìn cũng muốn ôm về.',
    rarity: 'common',
  ),

  'granbull': PokemonMeta(
    hint: 'Chú gấu hồng tròn tròn, rụt rè hay sợ hãi.',
    lore: 'Dù trông có vẻ to lớn và dũng mãnh, chú gấu hồng này thực chất lại vô cùng nhút nhát và dễ giật mình. Khi cảm thấy bị đe dọa, chú sẽ luống cuống vung vẩy chân tay để tự vệ. Đôi khi, chú còn có thể khóc toáng lên vì sợ hãi. Tuy nhiên, nếu được đối xử dịu dàng và yêu thương, chú sẽ trở thành người bạn đồng hành đáng tin cậy và vô cùng trung thành, luôn muốn bảo vệ những người mình yêu quý.',
    rarity: 'rare',
  ),

  'qwilfish': PokemonMeta(
    hint: 'Thân gai nhọn, phun độc khi phình to.',
    lore: 'Sinh vật biển này mang trên mình những chiếc gai nguy hiểm. Để phóng chúng đi, nó cần uống một lượng nước khổng lồ, làm cơ thể căng phồng lên. Khi bị đe dọa, nó sẽ bắn những chiếc gai tẩm độc của mình để tự vệ, gây bỏng rát khủng khiếp cho kẻ tấn công. Chúng thường sống ở các vùng biển và cửa sông.',
    rarity: 'rare',
  ),

  'overqwil': PokemonMeta(
    hint: 'Cái gai nhọn sắc, nó hay măm măm chất độc.',
    lore: 'Sinh vật biển đáng sợ này mang trên mình những chiếc gai nhọn như lưỡi giáo. Với bản tính hung dữ, nó thường được gọi là "ác quỷ biển cả". Thay vì ăn cá thông thường, nó lại "hút" các chất độc hại để nuôi sống bản thân, trở thành một kẻ săn mồi nguy hiểm dưới đáy đại dương.',
    rarity: 'rare',
  ),

  'shuckle': PokemonMeta(
    hint: 'Cái vỏ giống bình cứng, chứa đầy mứt.',
    lore: 'Sinh vật nhỏ bé này có một chiếc mai cứng giống như bình hoa để chứa những quả mọng ngon lành. Theo thời gian, những quả mọng đó sẽ lên men và trở thành một thứ chất lỏng sền sệt, có vị ngọt ngào và đôi khi hơi chua. Nó rất thích sưu tầm và bảo quản những loại trái cây quý hiếm nhất trong khu rừng.',
    rarity: 'common',
  ),

  'heracross': PokemonMeta(
    hint: 'Tích cực, mạnh mẽ, có sừng to.',
    lore: 'Loài bọ cánh cứng này thường hiền lành, thích uống mật hoa. Tuy nhiên, nếu bị làm phiền khi đang ăn, nó sẽ dùng chiếc sừng chắc khỏe để xua đuổi kẻ quấy rối. Chúng nổi tiếng với sức mạnh đáng kinh ngạc, có thể nhấc bổng vật nặng gấp nhiều lần cơ thể mình.',
    rarity: 'rare',
  ),

  'sneasel': PokemonMeta(
    hint: 'Móng vuốt sắc nhọn ẩn trong bàn chân nhỏ.',
    lore: 'Sinh vật nhỏ nhắn, nhanh nhẹn này có đôi chân rất ấn tượng. Thường ngày, chúng ẩn giấu những móng vuốt sắc bén bên trong. Khi cảm thấy bị đe dọa hoặc bất ngờ bị tấn công, nó sẽ đột ngột xòe móng ra, khiến kẻ địch giật mình và chùn bước. Nhờ sự tinh ranh và phản xạ nhanh nhạy này, nó thường thoát khỏi nguy hiểm một cách ngoạn mục.',
    rarity: 'rare',
  ),

  'weavile': PokemonMeta(
    hint: 'Có bộ vuốt sắc nhọn, thích săn mồi theo nhóm.',
    lore: 'Sinh vật sống ở vùng lạnh giá, chúng thích tụ tập theo nhóm nhỏ để cùng nhau săn bắt con mồi. Khả năng phối hợp của chúng thật đáng kinh ngạc, giúp chúng bắt được những con mồi nhanh nhẹn. Bộ vuốt sắc như dao của chúng là vũ khí chính, cắt xuyên qua lớp băng dày để bắt gọn con mồi.',
    rarity: 'rare',
  ),

  'sneasler': PokemonMeta(
    hint: 'Nanh vuốt sắc bén, lướt đi trong tuyết lạnh.',
    lore: 'Chúa tể băng giá, với nọc độc chết người và sức mạnh phi thường, không loài nào địch lại trên vùng cao nguyên phủ tuyết.  Thích sống một mình, nó không bao giờ lập bầy đàn.  Hình dáng uyển chuyển, ẩn mình trong cơn bão tuyết,  đôi mắt đỏ rực như than hồng theo dõi mọi thứ.',
    rarity: 'rare',
  ),

  'teddiursa': PokemonMeta(
    hint: 'Chú gấu nhỏ với vầng trăng trên trán',
    lore: 'Bạn gấu nhỏ này rất thích mật ong. Mỗi khi tìm thấy mật ngọt, cái vầng trăng trên trán sẽ phát sáng thật lung linh. Chú gấu luôn liếm liếm đôi chân mình vì chúng lúc nào cũng dính đầy mật ong ngọt ngào.',
    rarity: 'rare',
  ),

  'ursaring': PokemonMeta(
    hint: 'Chú gấu to lớn với bộ lông nâu ấm áp, thích đập cây lấy quả mọng.',
    lore: 'Sinh vật to lớn và mạnh mẽ này có bộ lông màu nâu dày ấm áp, giúp nó sinh tồn trong rừng sâu. Mặc dù có khả năng leo trèo tốt, nó thích dùng chân trước khỏe khoắn để bẻ gãy cành cây hoặc thậm chí cả những cây nhỏ. Hành động này giúp nó tiếp cận những chùm quả mọng ngon lành rơi xuống mặt đất. Nó thường sống trong rừng và có tính cách khá điềm tĩnh, nhưng sẽ trở nên hung dữ nếu cảm thấy bị đe dọa hoặc xâm phạm lãnh thổ.',
    rarity: 'rare',
  ),

  'ursaluna': PokemonMeta(
    hint: 'Gấu to lớn, sức mạnh đất đá, tay phun bùn.',
    lore: 'Sinh vật khổng lồ này có bộ lông màu nâu ấm áp và đôi ngà to lớn, khỏe mạnh. Chẳng ai biết làm sao, nó có thể điều khiển cả đầm lầy một cách tài tình, biến bùn đất thành vũ khí hay công cụ. Sức mạnh của nó đến từ chính vùng đất ngập nước, nơi nó ấp ủ bản năng hoang dã.',
    rarity: 'rare',
  ),

  'slugma': PokemonMeta(
    hint: 'Cơ thể nóng chảy, luôn di chuyển để không nguội đi.',
    lore: 'Sinh vật này không bao giờ chìm vào giấc ngủ. Nó bắt buộc phải không ngừng lại, bởi vì nếu ngừng chuyển động, khối magma trong cơ thể sẽ nguội dần và đông cứng lại. Vì vậy, nó luôn lăn tròn hoặc bò đi khắp nơi, mang theo hơi nóng bỏng. Môi trường sống của nó thường là những nơi cực kỳ nóng bức, nơi không sinh vật nào khác có thể tồn tại.',
    rarity: 'common',
  ),

  'magcargo': PokemonMeta(
    hint: 'Lớp vỏ lưng nó lạnh và cứng, rất dễ vỡ.',
    lore: 'Từ đầu đến chân, sinh vật này nóng bỏng như đá núi lửa. Lớp vỏ trên lưng nó là da đã nguội và cứng lại. Nó có thể làm tan chảy mọi thứ chỉ bằng cách chạm vào. Đôi khi, nó mang theo một quả trứng màu hồng ấm áp.',
    rarity: 'rare',
  ),

  'swinub': PokemonMeta(
    hint: 'Quái vật nhỏ có mõm đào đất',
    lore: 'Sinh vật nhỏ bé này dành phần lớn thời gian để ủi ủi mõm xuống đất, tìm kiếm thức ăn ẩn giấu và đào bới chúng lên. Đôi khi, khi đang chăm chỉ đào bới, nó vô tình tìm thấy những suối nước nóng ấm áp dưới lòng đất. Thật là một khám phá bất ngờ cho một chú bé thích đào bới!',
    rarity: 'common',
  ),

  'piloswine': PokemonMeta(
    hint: 'Chú lợn rừng lông xù, đôi mắt bị che phủ cứ thế lao thẳng về phía trước.',
    lore: 'Sinh vật này có bộ lông dày đặc che khuất tầm nhìn, khiến nó gặp khó khăn trong việc định hướng. Thay vì tìm đường, nó chọn cách lao tới mục tiêu bằng tất cả sức mạnh. Bộ lông dài không chỉ cản trở thị giác mà còn giúp nó chống chịu được thời tiết khắc nghiệt ở những vùng đất lạnh giá. Dù vẻ ngoài có vẻ vụng về, nhưng sức mạnh của nó trong những cú húc là không thể xem thường.',
    rarity: 'rare',
  ),

  'mamoswine': PokemonMeta(
    hint: 'Răng ngà sắc nhọn to lớn, thân hình mập mạp.',
    lore: 'Trước đây, chú voi lớn có hàm răng ngà băng giá này sống ở khắp nơi. Nhưng khi thời tiết ấm lên sau Kỷ Băng hà, chúng dần trở nên hiếm hoi. Bộ lông dày giúp giữ ấm, và cái mũi to giúp tìm kiếm thức ăn dưới tuyết.',
    rarity: 'rare',
  ),

  'corsola': PokemonMeta(
    hint: 'Rạn san hô màu hồng, liên tục thay da.',
    lore: 'Sinh vật biển này có vẻ ngoài giống rạn san hô với màu hồng rực rỡ. Nó không ngừng phát triển và thay lớp vỏ ngoài của mình. Phần đỉnh đầu của nó được xem như một báu vật vô giá vì vẻ đẹp lấp lánh và độc đáo, mang lại may mắn cho bất kỳ ai sở hữu. Nó sống ở vùng biển ấm áp.',
    rarity: 'rare',
  ),

  'cursola': PokemonMeta(
    hint: 'Vỏ trắng sữa, tỏa sáng ánh sáng ma mị.',
    lore: 'Khi một Pokémon bị nhiễm bệnh và chết đi, chất nhờn thần bí bao phủ nó, và nó biến thành sinh vật này. Vỏ của nó chứa đầy năng lượng siêu nhiên, còn chất nhờn bên ngoài bảo vệ linh hồn cốt lõi của nó khỏi những tổn thương.',
    rarity: 'epic',
  ),

  'remoraid': PokemonMeta(
    hint: 'Chú cá nhỏ phun nước có tài bắn trúng mục tiêu.',
    lore: 'Loài sinh vật nhỏ bé này sống ở biển, nổi tiếng với khả năng bắn những tia nước cực kỳ chính xác. Dù mục tiêu có di chuyển nhanh và ở xa hàng trăm bước chân, chú vẫn có thể bắn trúng. Điều này giúp nó săn mồi rất hiệu quả trong môi trường dưới nước đầy thử thách.',
    rarity: 'common',
  ),

  'octillery': PokemonMeta(
    hint: 'Vòi săn mồi, đầu cứng như đá.',
    lore: 'Sinh vật biển này có những chiếc vòi linh hoạt, được trang bị các giác hút để tóm lấy con mồi. Khi đã giữ chặt, nó sẽ dùng cái đầu chắc khỏe của mình để kết liễu kẻ địch. Nó sống ở biển sâu và là một thợ săn tài ba.',
    rarity: 'rare',
  ),

  'mantyke': PokemonMeta(
    hint: 'Sinh vật bé nhỏ với đôi râu cảm nhận dòng nước.',
    lore: 'Loài vật thân thiện này thích chơi đùa trong những dòng hải lưu êm đềm. Đôi râu đặc biệt của nó giúp cảm nhận được những chuyển động nhỏ nhất của nước biển, như thể chúng đang lắng nghe nhịp đập của đại dương. Chúng thường bơi lội theo đàn, tạo nên một cảnh tượng đẹp mắt dưới làn nước trong xanh.',
    rarity: 'epic',
  ),

  'mantine': PokemonMeta(
    hint: 'Sinh vật biển khổng lồ có cánh, bơi lội duyên dáng.',
    lore: 'Loài cá voi này lướt đi trên biển cả với vẻ đẹp uy nghi. Nó không bận tâm lắm khi những kẻ bạn đồng hành nhỏ bé bám vào để thưởng thức những mẩu thức ăn thừa. Sự bình tĩnh và duyên dáng của nó khi di chuyển khiến nó trở thành một cảnh tượng tuyệt đẹp dưới đại dương xanh thẳm.',
    rarity: 'epic',
  ),

  'houndour': PokemonMeta(
    hint: 'Mắt đỏ rực, đôi chân nhanh nhẹn, có cái đuôi gai nhọn.',
    lore: 'Sinh vật nhỏ nhắn này sống thành bầy đàn trong hang động tối tăm. Chúng có khả năng giao tiếp phức tạp, dùng những âm thanh khác nhau để thông báo cho đồng loại hoặc thu hút con mồi. Khi săn mồi, chúng thường chạy rất nhanh và sử dụng cái đuôi sắc nhọn của mình để tấn công. Những con non thường núp sau những con lớn hơn để được bảo vệ.',
    rarity: 'rare',
  ),

  'houndoom': PokemonMeta(
    hint: 'Cận vệ bóng đêm với hàm răng rực lửa.',
    lore: 'Sinh vật này sở hữu cặp sừng xoắn ốc và bộ lông đen óng. Hơi thở của nó là một ngọn lửa hung tợn, đốt cháy mọi thứ trên đường đi. Nếu bị bỏng bởi những tia lửa này, vết thương sẽ mãi mãi không lành, mang đến nỗi đau dai dẳng. Nó thường xuất hiện trong bóng tối, ẩn mình và quan sát.',
    rarity: 'rare',
  ),

  'phanpy': PokemonMeta(
    hint: 'Vòi dài lắc lư, trông rất vui vẻ nhưng cực khỏe.',
    lore: 'Đây là một Pokémon nhỏ bé, thân hình tròn trịa với đôi tai to và chiếc vòi dài đáng yêu. Nó thường dùng chiếc vòi của mình để chơi đùa, nhấc bổng mọi thứ để khám phá thế giới xung quanh. Mặc dù trông hiền lành, sức mạnh của nó lại rất đáng gờm, có thể làm rung chuyển cả mặt đất. Nó rất thích nô đùa và khám phá những điều mới lạ.',
    rarity: 'rare',
  ),

  'donphan': PokemonMeta(
    hint: 'Voi trưởng thành với hàm răng sắc nhọn và thân hình chắc nịch.',
    lore: 'Sinh vật to lớn này sở hữu bộ hàm có khả năng húc đổ cả căn nhà. Lớp da dày và cứng cỏi giúp nó chống chọi tốt với mọi thử thách.  Nó là một người bạn đồng hành đáng tin cậy, luôn sẵn sàng bảo vệ mọi người bằng sức mạnh phi thường của mình.',
    rarity: 'rare',
  ),

  'stantler': PokemonMeta(
    hint: 'Sừng cong tạo ra không gian kỳ lạ.',
    lore: 'Sinh vật này sở hữu đôi sừng lớn uốn cong, không chỉ để phòng vệ mà còn có khả năng đặc biệt. Khi di chuyển, những chiếc sừng này tạo ra những luồng không khí xoáy, gây ra ảo ảnh khiến thực tại xung quanh dường như bị bóp méo.  Những kẻ xâm phạm có thể bị lạc lối trong không gian kỳ lạ mà nó tạo ra, không thể tìm thấy đường thoát ra.',
    rarity: 'rare',
  ),

  'wyrdeer': PokemonMeta(
    hint: 'Bộ lông xù trắng và đôi mắt sáng bí ẩn.',
    lore: 'Sinh vật hiền lành với bộ râu trắng muốt tỏa sáng kỳ lạ. Khi cần, nó có thể tạo ra những rào chắn vô hình để bảo vệ bản thân và bạn bè. Lông râu của nó giữ ấm cực tốt, là món quà quý giá cho những ngày đông giá rét.',
    rarity: 'rare',
  ),

  'smeargle': PokemonMeta(
    hint: 'Cái đuôi vẽ vời khắp nơi.',
    lore: 'Loài sinh vật này có một thứ chất lỏng đặc biệt chảy ra từ chóp đuôi. Chúng dùng chất lỏng đó để vẽ lên mọi thứ xung quanh, đánh dấu lãnh thổ của mình. Những nét vẽ này có thể đa dạng tùy theo tâm trạng của chúng. Bạn có thể thấy chúng ở bất cứ đâu chúng muốn để lại dấu ấn của mình.',
    rarity: 'rare',
  ),

  'miltank': PokemonMeta(
    hint: 'Thân hình tròn trịa, luôn tỏa ra sự ấm áp.',
    lore: 'Loài vật dễ thương này nổi tiếng với thứ đồ uống bổ dưỡng, giống sữa vậy! Nó rất tốt cho những ai mệt mỏi và cần hồi phục sức khỏe. Với đôi mắt to tròn và tiếng kêu "moo" đáng yêu, nó mang đến cảm giác bình yên và sung túc. Chúng hay tụ tập thành đàn và rất hiền lành, thích được vuốt ve.',
    rarity: 'rare',
  ),

  'raikou': PokemonMeta(
    hint: 'Cơn bão và tia sét là bạn đồng hành của nó.',
    lore: 'Khi cơn giông kéo đến, nó xuất hiện, mang theo sấm sét xé toang bầu trời. Tương truyền, nó đã giáng xuống mặt đất cùng một tia chớp khổng lồ, để lại dấu ấn của sức mạnh thiên nhiên. Lông bờm màu vàng rực như ánh mặt trời, và cái đuôi luôn vẫy giữa cơn mưa dữ dội. Nó tượng trưng cho sức mạnh và sự hủy diệt của cơn bão.',
    rarity: 'legendary',
  ),

  'entei': PokemonMeta(
    hint: 'Chú chó khổng lồ với bờm lửa.',
    lore: 'Khi nó sủa, núi lửa sẽ phun trào. Sức mạnh quá lớn khiến nó không thể kiểm soát, cứ thế chạy khắp nơi trên mặt đất. Hơi nóng toát ra từ khắp cơ thể nó.',
    rarity: 'legendary',
  ),

  'suicune': PokemonMeta(
    hint: 'Vẻ ngoài giống chó, có bờm xanh lơ, dáng vẻ uyển chuyển.',
    lore: 'Sinh vật huyền thoại này dành cả đời để đi khắp thế gian, mang theo sức mạnh thanh tẩy mọi nguồn nước bị ô nhiễm. Nó lao đi nhanh như gió, đôi khi còn được cho là có thể điều khiển cả gió bắc. Một số người tin rằng hơi thở của nó có thể làm băng tan và mang lại sự sống cho mặt đất cằn cỗi.',
    rarity: 'legendary',
  ),

  'larvitar': PokemonMeta(
    hint: 'Cái gì có cái đầu nhỏ và thích ăn đất?',
    lore: 'Sinh vật nhỏ bé này rất thích ăn đất. Sau khi ăn hết cả một ngọn núi, nó sẽ ngủ say để lớn lên. Lớp vỏ cứng bên ngoài giúp nó bảo vệ mình khi còn nhỏ. Nó mơ về một ngày mình sẽ trở nên thật to lớn và mạnh mẽ.',
    rarity: 'rare',
  ),

  'pupitar': PokemonMeta(
    hint: 'Lớp vỏ cứng, nó dùng sức mạnh để tấn công.',
    lore: 'Loài khủng long này có lớp vỏ cực kỳ bền chắc, cứng như đá. Nó có thể dùng sức mạnh phi thường của mình để quật phá, đủ sức làm rung chuyển cả núi non. Sức mạnh này đến từ cơ bắp cuồn cuộn ẩn bên trong lớp vỏ bảo vệ.',
    rarity: 'rare',
  ),

  'tyranitar': PokemonMeta(
    hint: 'Khủng long cồng kềnh, dũng cảm, luôn tìm kiếm thử thách.',
    lore: 'Sinh vật khổng lồ với lớp vảy cứng như đá, không gì có thể làm tổn thương nó. Vì thế, nó luôn đầy tự tin và thích đối đầu với kẻ mạnh. Mỗi khi nó di chuyển, mặt đất rung chuyển như động đất. Sức mạnh hủy diệt của nó khiến mọi đối thủ phải khiếp sợ. Nó coi những trận chiến là cơ hội để chứng minh bản thân vượt trội.  Không có gì có thể ngăn cản bước chân tiến lên của nó.',
    rarity: 'rare',
  ),

  'lugia': PokemonMeta(
    hint: 'Sinh vật biển bạc khổng lồ với đôi cánh lớn.',
    lore: 'Thần biển bí ẩn, thường lặn sâu dưới đáy đại dương vì sức mạnh vô song của mình. Người ta đồn rằng nó tồn tại từ buổi bình minh của thế giới, mang trong mình sự tĩnh lặng và quyền uy của biển cả.  Vẻ ngoài uy nghiêm của nó khiến mọi sinh vật biển phải kính nể.',
    rarity: 'legendary',
  ),

  'ho-oh': PokemonMeta(
    hint: 'Chim huyền thoại với đôi cánh bảy sắc cầu vồng.',
    lore: 'Loài POKéMON này được cho là bay lượn khắp bầu trời thế giới, đôi cánh rực rỡ của nó mang theo bảy sắc màu như cầu vồng. Nó được xem là biểu tượng của sự may mắn và hy vọng.',
    rarity: 'legendary',
  ),

  'celebi': PokemonMeta(
    hint: ' sinh vật nhỏ màu xanh lá cây biết du hành xuyên thời gian.',
    lore: 'Chú Pokémon này lang thang khắp thời gian. Cỏ cây và cây cối tươi tốt phát triển mạnh mẽ trong những khu rừng mà nó đã xuất hiện. Nó mang đến sự sống và sức sống cho mọi nơi nó đi qua, khiến thiên nhiên trở nên rực rỡ hơn.',
    rarity: 'mythical',
  ),

  'treecko': PokemonMeta(
    hint: 'Chạy trên tường, vẫy đuôi',
    lore: 'Sinh vật nhỏ bé với đôi chân có móc bám, giúp nó leo trèo trên mọi bề mặt thẳng đứng. Khi chiến đấu, nó dùng chiếc đuôi dày và khỏe của mình để hất văng đối thủ. Luôn tràn đầy năng lượng, nó thích chơi đùa và khám phá thế giới xung quanh bằng sự nhanh nhẹn của mình.',
    rarity: 'rare',
  ),

  'grovyle': PokemonMeta(
    hint: 'Lá mọc trên người, trèo cây giỏi.',
    lore: 'Loài này có những chiếc lá mọc ra từ thân mình, giúp ngụy trang trong rừng. Chúng là bậc thầy leo trèo trong rừng rậm, rất khó bị kẻ thù phát hiện.',
    rarity: 'rare',
  ),

  'sceptile': PokemonMeta(
    hint: 'Nhanh nhẹn, lá sắc bén, nhảy thoăn thoắt.',
    lore: 'Chú khủng long lá này có bộ lá sắc như dao cạo mọc trên cơ thể. Nó cực kỳ nhanh nhẹn, thoăn thoắt chuyền cành cây và bất ngờ tấn công kẻ địch từ trên cao hoặc phía sau. Chiếc đuôi lá của nó cũng có sức mạnh đáng gờm!',
    rarity: 'rare',
  ),

  'torchic': PokemonMeta(
    hint: 'Chú chim nhỏ màu vàng, bám theo chủ',
    lore: 'Chú chim bé bỏng này luôn trung thành đi theo người huấn luyện, bước chân còn hơi chập chững. Nó có thể phun lửa nóng đến hơn 980 độ C, kể cả những quả cầu lửa khiến đối thủ cháy đen sì vì bỏng rát.',
    rarity: 'rare',
  ),

  'combusken': PokemonMeta(
    hint: 'Chú chim với đôi chân mạnh mẽ rất nhanh.',
    lore: 'Loài này rèn luyện đôi chân và đùi bằng cách chạy qua những cánh đồng và núi non. Đôi chân của nó có cả tốc độ và sức mạnh, cho phép nó tung ra mười cú đá trong một giây.  Cú đá của nó đủ mạnh để hạ gục đối thủ.',
    rarity: 'rare',
  ),

  'blaziken': PokemonMeta(
    hint: 'Vũ khí rực lửa trên tay, chiến đấu dũng mãnh.',
    lore: 'Khi chiến đấu, nó phun ra những luồng lửa dữ dội từ cổ tay và tấn công kẻ thù một cách dũng cảm. Sức mạnh của kẻ địch càng lớn, thì cổ tay của Pokémon này càng nóng bỏng. Đôi chân mạnh mẽ cũng giúp nó tung ra những cú đá uy lực, làm bùng cháy cả đấu trường.',
    rarity: 'rare',
  ),

  'mudkip': PokemonMeta(
    hint: 'Chiếc vây trên đầu dùng như radar nhạy bén.',
    lore: 'Chú cá nhỏ này có một chiếc vây đặc biệt trên đầu, hoạt động như một chiếc radar cực kỳ nhạy. Nhờ chiếc vây này, nó có thể cảm nhận được mọi chuyển động dù là nhỏ nhất trong nước và không khí xung quanh. Điều này giúp nó nắm bắt tình hình mà không cần mở mắt, giống như một người thám hiểm bí ẩn trong thế giới dưới nước.',
    rarity: 'rare',
  ),

  'marshtomp': PokemonMeta(
    hint: 'Thích nghịch bùn trên bãi biển.',
    lore: 'Nó có một lớp màng mỏng, dính bao phủ cơ thể, giúp nó sinh sống được trên cạn. Sinh vật này thường nô đùa trong bùn khi thủy triều xuống thấp, tận hưởng không khí vui vẻ trên bờ biển.',
    rarity: 'rare',
  ),

  'swampert': PokemonMeta(
    hint: 'Cơ bắp khỏe mạnh, mắt nhìn xuyên bùn.',
    lore: 'Loài này sở hữu sức mạnh phi thường, đủ sức kéo tảng đá nặng hơn tấn. Đôi mắt tinh tường giúp nó nhìn rõ ngay cả trong làn nước đục ngầu. Chúng thường sống ở những vùng nước đục và sử dụng sức mạnh của mình để di chuyển và săn mồi.',
    rarity: 'rare',
  ),

  'poochyena': PokemonMeta(
    hint: 'Chú chó nhỏ với nụ cười nhếch mép háu ăn.',
    lore: 'Đôi khi, sinh vật bé nhỏ này sẽ cắn bất cứ thứ gì đang di chuyển. Nó sẵn sàng đuổi theo con mồi kiên trì cho đến khi nạn nhân kiệt sức. Tuy nhiên, nó có thể bỏ chạy nếu con mồi phản kháng lại.',
    rarity: 'common',
  ),

  'mightyena': PokemonMeta(
    hint: 'Nó gầm gừ sâu và làm phẳng người trước khi tấn công.',
    lore: 'Sinh vật này có bộ lông màu tối, với đôi mắt sáng rực trong bóng tối. Khi cảm thấy bị đe dọa, nó sẽ phát ra tiếng gầm gừ trầm thấp và thu mình lại. Mặc dù trông có vẻ hung dữ, nó thường sống theo bầy và bảo vệ lãnh thổ của mình một cách trung thành.',
    rarity: 'rare',
  ),

  'zigzagoon': PokemonMeta(
    hint: 'Chú bé thích lang thang, trông như chú gấu nhỏ có sọc.',
    lore: 'Sinh vật nhỏ bé này luôn di chuyển, khám phá mọi ngóc ngách vì tò mò vô tận. Bất cứ thứ gì thu hút sự chú ý của nó, dù nhỏ bé hay lớn lao, cũng đều khiến nó chú tâm tìm hiểu. Vừa chạy vừa đánh hơi, nó tìm kiếm những điều mới lạ, đôi khi còn lăn tròn và tạo ra những đường zig-zag vui nhộn trên đường đi.',
    rarity: 'common',
  ),

  'linoone': PokemonMeta(
    hint: 'Chạy thẳng, rẽ vuông góc, ghét đường cong.',
    lore: 'Sinh vật này luôn lao vun vút trên đường thẳng. Khi gặp chướng ngại vật, nó sẽ đổi hướng ngay một góc phải. Những con đường uốn lượn nhẹ nhàng lại khiến nó lúng túng, không biết phải đi thế nào cho hợp.',
    rarity: 'rare',
  ),

  'obstagoon': PokemonMeta(
    hint: 'Chú gấu đen trắng, kẻ thích gầm lên.',
    lore: 'Sinh vật này sở hữu giọng nói vang dội, có thể làm rung chuyển mọi thứ. Khi đối mặt với nguy hiểm, nó thường đứng tấn công và cất cao giọng gầm. Âm thanh này không chỉ là lời cảnh báo mà còn là một vũ khí mạnh mẽ, khiến kẻ địch phải lùi bước. Nó là người bảo vệ dũng cảm, luôn sẵn sàng đối đầu với bất kỳ thử thách nào để bảo vệ lãnh thổ của mình.',
    rarity: 'rare',
  ),

  'wurmple': PokemonMeta(
    hint: 'Có gai sau đuôi, thích chọc cây lấy nhựa.',
    lore: 'Cậu bé nhỏ này có một chiếc đuôi đầy gai dùng để lột vỏ cây và hút nhựa ngọt ngào. Chân của cậu bé có những miếng hút, giúp cậu bám chắc vào mọi bề mặt, kể cả kính, mà không lo bị rơi. Dù trông có vẻ đơn giản, nhưng cậu bé luôn tìm cách khám phá thế giới xung quanh bằng sự tò mò đáng yêu của mình.',
    rarity: 'common',
  ),

  'silcoon': PokemonMeta(
    hint: 'Cái kén nhỏ bám trên cành cây.',
    lore: 'Loài này dùng tơ tự buộc mình vào cành cây để không bị rơi. Nó treo mình im lặng trong chiếc kén, chờ đợi để hóa thành hình dạng đẹp hơn. Có một lỗ nhỏ trên chiếc kén để nó có thể nhìn ra ngoài.',
    rarity: 'rare',
  ),

  'beautifly': PokemonMeta(
    hint: 'Cánh bướm tuyệt đẹp, thích hút mật hoa ngọt thơm.',
    lore: 'Sinh vật xinh đẹp này có đôi cánh lấp lánh như cầu vồng, chúng yêu thích vị ngọt ngào của phấn hoa. Bạn có thể dễ dàng thu hút chúng bằng cách đặt một chậu hoa đầy hương sắc gần cửa sổ. Loài này sẽ nhanh chóng tìm đến và thưởng thức món ăn khoái khẩu của mình, mang lại vẻ đẹp rực rỡ cho khu vườn của bạn.',
    rarity: 'rare',
  ),

  'cascoon': PokemonMeta(
    hint: 'Nhà cái kén tằm mềm mại, chờ hóa thành bướm.',
    lore: 'Loài này tự dệt một chiếc kén chắc chắn bằng tơ mỏng từ miệng mình. Sợi tơ bao bọc toàn bộ cơ thể và nhanh chóng cứng lại. Bên trong chiếc kén êm ái này, nó chuẩn bị cho sự biến đổi kỳ diệu để trở thành một sinh vật bay lượn xinh đẹp. Đây là giai đoạn nghỉ ngơi và phát triển quan trọng nhất của chúng.',
    rarity: 'rare',
  ),

  'dustox': PokemonMeta(
    hint: 'Bướm đêm có đôi cánh xanh lục và ăng-ten dài.',
    lore: 'Sinh vật này rất thích ánh sáng. Khi thấy đèn sáng, chúng sẽ bay đến theo đàn. Chúng thích ăn lá cây nên thường làm hại cây cối ven đường. Đôi khi chúng còn phá hoại cây cối trong vườn nữa đấy!',
    rarity: 'rare',
  ),

  'lotad': PokemonMeta(
    hint: 'Cậu bé lá vịt này tìm nước.',
    lore: 'Sinh vật nhỏ bé này thích ở những nơi có nước sạch. Nếu không uống đủ nước, chiếc lá trên đầu cậu sẽ héo đi trông thật buồn. Nhưng đừng lo, chỉ cần cho cậu ấy uống nước, chiếc lá sẽ tươi trở lại ngay!',
    rarity: 'common',
  ),

  'lombre': PokemonMeta(
    hint: 'Chú ếch xanh nở rộ dưới nắng, vẫy đuôi trong nước.',
    lore: 'Sinh vật bé nhỏ này thích sống nơi nước trong và có nắng. Ban ngày, nó say giấc nồng trên thảm cỏ mềm mại ngay mép nước. Khi màn đêm buông xuống, với đôi mắt sáng lấp lánh, nó bắt đầu cuộc phiêu lưu của mình, nô đùa dưới ánh trăng và tìm kiếm những điều thú vị.',
    rarity: 'rare',
  ),

  'ludicolo': PokemonMeta(
    hint: 'Vui tươi nhảy múa theo tiếng nhạc và tiếng cười.',
    lore: 'Khi nghe âm nhạc vui nhộn, sinh vật này sẽ bắt đầu nhảy múa.  Người ta nói rằng nó sẽ xuất hiện khi nghe thấy tiếng hát trẻ thơ trong những chuyến đi bộ đường dài đầy lễ hội.  Sinh vật này mang lại niềm vui và sự phấn khích cho mọi người xung quanh.',
    rarity: 'rare',
  ),

  'seedot': PokemonMeta(
    hint: 'Chồi cây nhỏ bé bám trên cành, hút nước để bóng bẩy.',
    lore: 'Sinh vật nhỏ bé này có một chiếc đầu cứng như hạt sồi, dùng để bám chặt vào cành cây. Nó thong thả hút chất lỏng từ thân cây, cứ uống càng nhiều nước thì cơ thể nó lại càng thêm phần láng bóng, trông thật khỏe mạnh. Màu sắc và độ bóng của cơ thể nó cho biết nó đã được uống bao nhiêu nước từ cây.',
    rarity: 'common',
  ),

  'nuzleaf': PokemonMeta(
    hint: 'Thích trốn trong rừng và dọa người.',
    lore: 'Sinh sống trong những khu rừng rậm rạp, sinh vật này đôi khi sẽ lẻn ra ngoài để khiến mọi người giật mình. Nó không thích ai đó véo cái mũi dài của mình. Mũi của nó rất nhạy cảm và đó là một trong những đặc điểm nổi bật nhất của nó.',
    rarity: 'rare',
  ),

  'shiftry': PokemonMeta(
    hint: 'Cái quạt thần gió lạnh của nó làm mùa đông đến.',
    lore: 'Sinh vật bí ẩn này sống sâu trong rừng già, nơi ít ai đặt chân tới. Người ta đồn rằng, mỗi khi nó vẫy hai chiếc quạt lớn trên tay, những cơn gió mùa đông se sắt sẽ thổi đến. Nó là người bảo vệ thầm lặng của khu rừng, mang đến sự mát lành và đôi khi là cái lạnh đặc trưng của mùa đông.',
    rarity: 'rare',
  ),

  'taillow': PokemonMeta(
    hint: 'Chú chim nhỏ màu xanh với chiếc mỏ vàng dũng cảm.',
    lore: 'Loài chim nhỏ bé này có ý chí kiên cường, không bao giờ lùi bước trước kẻ địch dù mạnh đến đâu. Ngay cả sau khi thua trận, chúng vẫn giữ thái độ thách thức. Nhưng khi đói bụng, chúng lại cất tiếng kêu thật to để báo hiệu. Chúng thích xây tổ trên cao, nơi an toàn khỏi nguy hiểm.',
    rarity: 'common',
  ),

  'swellow': PokemonMeta(
    hint: 'Cánh rộng, bay lượn, lao vun vút như tên.',
    lore: 'Chim trời nhỏ bé này tung cánh bay vút trên bầu trời xanh, vẽ nên những đường cong uyển chuyển giữa không trung. Khi phát hiện con mồi, nó lao xuống từ trên cao với tốc độ kinh hoàng. Móng vuốt sắc nhọn của nó sẽ tóm chặt con mồi, không cho bất kỳ đường thoát nào. Một thợ săn tài ba trên bầu trời.',
    rarity: 'rare',
  ),

  'wingull': PokemonMeta(
    hint: 'Chim biển thích lượm lặt và trượt trên gió.',
    lore: 'Sinh vật này yêu thích bầu trời và thường bay lượn như đang trượt ván trên không. Nó có thói quen nhặt nhạnh những món đồ có giá trị hoặc thức ăn và cất giấu ở nhiều nơi bí mật khác nhau. Đôi khi, người ta có thể thấy nó mang theo những vật lặt vặt trong mỏ của mình khi vi vu trên cao.',
    rarity: 'common',
  ),

  'pelipper': PokemonMeta(
    hint: 'Chim xanh to lớn có cái mỏ bự',
    lore: 'Loài chim này là sứ giả của bầu trời. Chúng dùng chiếc mỏ to của mình để chở những Pokémon nhỏ bé và trứng của chúng đến nơi an toàn. Bạn có thể thấy chúng bay lượn trên cao, mang theo những sinh vật bé bỏng, giúp chúng tránh khỏi nguy hiểm dưới mặt đất. Chúng cực kỳ tốt bụng và luôn sẵn sàng giúp đỡ.',
    rarity: 'rare',
  ),

  'ralts': PokemonMeta(
    hint: 'Tua vào tai bạn khi vui.',
    lore: 'Sinh vật nhỏ bé này dùng cặp sừng trên đầu để cảm nhận tâm trạng mọi người. Nó rất nhút nhát và hiếm khi xuất hiện. Nếu nhìn thấy ai đó có tâm trạng tốt, nó sẽ lại gần để chơi đùa. Nó giống như một người bạn tí hon luôn mang đến niềm vui.',
    rarity: 'common',
  ),

  'kirlia': PokemonMeta(
    hint: 'Vẻ ngoài xinh đẹp, có khả năng điều khiển suy nghĩ.',
    lore: 'Loài này lớn lên thật xinh đẹp khi được bao quanh bởi tình cảm tích cực từ người huấn luyện. Nó có bộ não phát triển cao, giúp điều khiển sức mạnh tâm linh.',
    rarity: 'rare',
  ),

  'gardevoir': PokemonMeta(
    hint: 'Vẻ ngoài thanh lịch, có khả năng nhìn thấu tương lai.',
    lore: 'Khi thấy người bạn đồng hành gặp nguy hiểm, nó sẽ giải phóng toàn bộ sức mạnh tâm linh của mình. Sinh vật này được cho là có khả năng tiên tri, giúp nó dự đoán trước mọi tình huống có thể xảy ra.',
    rarity: 'rare',
  ),

  'gallade': PokemonMeta(
    hint: 'Vị hiệp sĩ với lưỡi kiếm sắc trên khuỷu tay.',
    lore: 'Một chiến binh lịch lãm, luôn tuân thủ quy tắc danh dự. Khi chiến đấu, nó sử dụng những lưỡi kiếm đặc biệt mọc ra từ khuỷu tay để tấn công đối thủ một cách nhanh nhẹn và chính xác. Với đôi chân mạnh mẽ, nó có thể di chuyển với tốc độ đáng kinh ngạc, tạo ra những đòn tấn công chớp nhoáng khiến đối phương không kịp phòng bị. Nó luôn bảo vệ những người yếu đuối và dũng cảm đối mặt với hiểm nguy.',
    rarity: 'rare',
  ),

  'surskit': PokemonMeta(
    hint: 'Vừa trượt nước, vừa ăn sinh vật bé xíu.',
    lore: 'Loài sinh vật nhỏ này có khả năng kỳ diệu là lướt đi trên mặt nước như đang trượt băng. Nó làm được điều này nhờ tiết ra một loại dầu đặc biệt từ đầu chân. Môi trường sống ưa thích của nó là những ao hồ yên ả, nơi nó có thể dễ dàng tìm thấy thức ăn là những sinh vật phù lơ lửng li ti trôi dạt trong làn nước trong xanh.',
    rarity: 'common',
  ),

  'masquerain': PokemonMeta(
    hint: 'Cánh có đốm mắt, bay xoay tròn như trực thăng.',
    lore: 'Loài Pokémon này có đôi cánh lớn với những hoa văn kỳ lạ giống mắt, giúp nó hù dọa kẻ thù. Nó có thể bay lượn thoăn thoắt theo mọi hướng, thậm chí bay ngang và lùi lại, khiến nhiều người lầm tưởng nó như một chiếc trực thăng nhỏ đang lơ lửng giữa không trung. Chúng thường được tìm thấy ở những nơi có nhiều nước và cây cối xum xuê.',
    rarity: 'rare',
  ),

  'shroomish': PokemonMeta(
    hint: 'Chúng sống dưới lá rơi, trông như nấm nhỏ.',
    lore: 'Sinh vật nhỏ bé này thích ẩn mình trong đất ẩm, dưới lớp lá mục rừng sâu. Chúng ăn lá cây phân hủy, giúp khu rừng thêm xanh tươi. Khi không di chuyển, chúng trông giống như những chiếc nấm tí hon, yên lặng chờ đợi.',
    rarity: 'common',
  ),

  'breloom': PokemonMeta(
    hint: 'Nấm có cánh tay như lò xo, tung đấm điêu luyện.',
    lore: 'Loài nấm này di chuyển nhẹ nhàng, thoăn thoắt như một vũ công. Đôi tay co giãn của nó có thể tung ra những cú đấm nhanh như chớp. Kỹ thuật chiến đấu của nó khiến cả những võ sĩ chuyên nghiệp cũng phải trầm trồ thán phục. Nó có thể thực hiện những đòn đánh hiểm hóc từ mọi góc độ, khiến đối thủ trở tay không kịp.',
    rarity: 'rare',
  ),

  'slakoth': PokemonMeta(
    hint: 'Chú lười biếng này thường ngủ hơn 20 tiếng mỗi ngày.',
    lore: 'Chú lười này dành hầu hết thời gian để lười biếng, chỉ di chuyển rất ít mỗi ngày. Vì thế, chú không cần ăn nhiều. Bữa ăn duy nhất trong ngày của chú chỉ là ba chiếc lá. Bất chấp sự lười biếng của mình, chú vẫn tràn đầy sức sống và khỏe mạnh một cách đáng kinh ngạc.',
    rarity: 'common',
  ),

  'vigoroth': PokemonMeta(
    hint: 'Luôn bồn chồn, không thể ngồi yên, sẵn sàng lao tới.',
    lore: 'Sinh vật này luôn trong trạng thái bồn chồn, chỉ muốn chạy nhảy không ngừng. Dù chỉ một chút yên vị cũng khiến nó khó chịu. Căng thẳng của nó sẽ tăng cao nếu không được vận động liên tục. Nó luôn sẵn sàng lao vào một cuộc chạy đua hoang dã hơn là nghỉ ngơi.',
    rarity: 'rare',
  ),

  'slaking': PokemonMeta(
    hint: 'Con thú khổng lồ lười biếng chỉ thích nằm dài.',
    lore: 'Sinh vật to lớn này dành cả ngày để nằm dài và lười biếng. Nó chỉ ăn những ngọn cỏ mọc xung quanh tầm với. Nếu hết cỏ gần đó, nó sẽ miễn cưỡng di chuyển đến một chỗ khác.  Nó có sức mạnh phi thường nhưng rất ít khi sử dụng vì quá mệt mỏi. Đôi khi, nó cử động nhanh một chút để bắt những con côn trùng bay ngang qua nhưng cũng nhanh chóng nằm xuống lại.',
    rarity: 'rare',
  ),

  'nincada': PokemonMeta(
    hint: 'Sinh vật có cánh ẩn mình dưới lòng đất, kiên nhẫn chờ đợi.',
    lore: 'Sinh vật nhỏ bé này dành phần lớn thời gian sống trong bóng tối dưới lòng đất, hấp thụ dinh dưỡng từ rễ cây. Nó thường đứng yên một chỗ, chờ đợi thời khắc để biến đổi. Sự kiên nhẫn và khả năng ẩn mình là những đặc điểm nổi bật của nó.',
    rarity: 'common',
  ),

  'ninjask': PokemonMeta(
    hint: 'Cánh mỏng manh, bay lướt nhanh như gió thoảng.',
    lore: 'Sinh vật tí hon này bay lượn nhanh đến mức mắt thường không tài nào bắt kịp. Dù không nhìn thấy nó, bạn vẫn có thể nghe tiếng kêu ríu rít vang vọng. Vì lẽ đó, người ta từng tin rằng nó là một loài Pokémon vô hình, ẩn mình trong màn đêm hoặc những tán lá xào xạc. Tốc độ phi thường của nó là một bí ẩn thú vị, khiến bao người tò mò và ngỡ ngàng.',
    rarity: 'rare',
  ),

  'shedinja': PokemonMeta(
    hint: 'Vỏ rỗng không cử động, ai nhìn sẽ bị lấy mất hồn.',
    lore: 'Sinh vật này chỉ là một chiếc vỏ rỗng, nó không hề cử động. Người ta tin rằng nó sẽ lấy đi linh hồn của bất kỳ ai nhìn vào cái vỏ rỗng phía sau lưng nó. Nó thường đứng im một chỗ, chờ đợi con mồi.',
    rarity: 'rare',
  ),

  'whismur': PokemonMeta(
    hint: 'Cậu bé tai dài, hay khóc thét khi sợ.',
    lore: 'Sinh vật nhỏ nhắn này thường phát ra những âm thanh rất khe khẽ, chỉ có ai thật sự chú tâm mới nghe thấy. Khi cảm thấy nguy hiểm cận kề, nó sẽ cất lên tiếng khóc vang trời, đủ sức làm mọi người giật mình. Dù có vẻ nhút nhát, khi cần thiết, nó có thể tạo ra âm thanh cực lớn để bảo vệ bản thân và bạn bè.',
    rarity: 'common',
  ),

  'loudred': PokemonMeta(
    hint: 'Tai lớn rung rinh, giọng ca vang dội.',
    lore: 'Tiếng gầm của sinh vật tai to này mạnh đến nỗi có thể phá hủy cả ngôi nhà gỗ. Nó dùng giọng nói để trừng phạt kẻ thù. Đôi tai tròn của nó hoạt động như những chiếc loa phát thanh khổng lồ, khuếch đại âm thanh của nó để gây ra sự tàn phá.',
    rarity: 'rare',
  ),

  'exploud': PokemonMeta(
    hint: 'Khổng lồ có loa, thích gầm thét làm rung chuyển đất.',
    lore: 'Sinh vật khổng lồ này có khả năng tạo ra những cơn địa chấn chỉ bằng một tiếng gầm rung động. Những lỗ trên cơ thể nó như những chiếc loa phóng thanh, sẵn sàng khuếch đại âm thanh vang dội. Khi nó hít một hơi thật sâu, đó là dấu hiệu báo trước một tiếng hét cực kỳ mạnh mẽ sắp sửa vang lên, khiến cả mặt đất cũng phải run rẩy.',
    rarity: 'rare',
  ),

  'makuhita': PokemonMeta(
    hint: 'Vận động viên sumo bé nhỏ, đầy kiên cường.',
    lore: 'Sinh vật nhỏ bé này rất bền bỉ, không bao giờ bỏ cuộc. Dù bị đánh ngã bao nhiêu lần, nó vẫn đứng dậy và tiếp tục chiến đấu. Mỗi lần đứng lên, nó tích trữ thêm năng lượng, chuẩn bị cho sự tiến hóa mạnh mẽ hơn. Hãy nhớ, sự kiên trì chính là chìa khóa!',
    rarity: 'common',
  ),

  'hariyama': PokemonMeta(
    hint: 'Vòng eo to, tay khoẻ, thích khoe sức.',
    lore: 'Loài Pokémon này rất thích so tài sức mạnh với bất kỳ ai gặp phải. Đôi khi, nó còn đứng chắn trên đường ray xe lửa, lấy đôi cánh tay cuồn cuộn của mình để chặn đứng những đoàn tàu đang lao tới. Sức mạnh của nó thật đáng kinh ngạc và không ai có thể xem thường. Khi đã quyết tâm, nó sẽ dồn hết sức để chứng tỏ bản thân.',
    rarity: 'common',
  ),

  'azurill': PokemonMeta(
    hint: 'Một quả bóng màu hồng nhảy múa trên chiếc đuôi lớn.',
    lore: 'Sinh vật nhỏ nhắn này yêu thích cuộc sống bên bờ nước. Dù nhỏ bé, nó có thể di chuyển trên cạn cực kỳ nhanh nhẹn bằng cách nhảy tưng tưng trên chiếc đuôi to tròn của mình. Chúng thường sống thành đàn và rất vui tươi, thích nô đùa dưới ánh nắng mặt trời bên dòng nước mát lành.',
    rarity: 'common',
  ),

  'marill': PokemonMeta(
    hint: 'Vẫy chiếc đuôi chứa dầu nhẹ hơn nước để bơi lội.',
    lore: 'Chú bé tròn trịa có chiếc đuôi đặc biệt, giúp chú lơ lửng và bơi lội dễ dàng dưới nước mà không bị chìm. Chiếc đuôi này chứa một loại dầu đặc biệt, nhẹ hơn cả nước, cho phép chú có thể thư giãn và vui đùa dưới biển mà không cần lo lắng. Chú rất thích chơi đùa và thường được nhìn thấy đang bơi lội tung tăng.',
    rarity: 'common',
  ),

  'azumarill': PokemonMeta(
    hint: 'Cái bụng trắng hồng, thân hình tròn trịa, sống thoả thích dưới nước.',
    lore: 'Sinh vật nhỏ nhắn này dành phần lớn thời gian vui đùa trong làn nước mát lạnh. Màu sắc và những chấm nhỏ trên cơ thể giúp nó ẩn mình tài tình, trở thành bậc thầy ngụy trang dưới vực sâu. Kẻ thù khó lòng phát hiện ra nó, dù lơ đãng nhìn cũng chẳng thấy. Nó rất thân thiện và yêu thích các trò chơi dưới nước.',
    rarity: 'rare',
  ),

  'nosepass': PokemonMeta(
    hint: 'Mũi nó luôn chỉ về phương Bắc.',
    lore: 'Sinh vật này có một chiếc mũi đặc biệt luôn hướng về phía bắc. Nếu hai con lại gần nhau, chúng sẽ không thể nhìn đối phương vì hai chiếc mũi từ tính sẽ đẩy nhau. Chúng thường sống ở những nơi có từ trường mạnh để định hướng dễ dàng hơn.',
    rarity: 'common',
  ),

  'probopass': PokemonMeta(
    hint: 'Đá có mũi, có bạn nhỏ xung quanh.',
    lore: 'Sinh vật đá này có một chiếc mũi lớn trên thân và có khả năng điều khiển ba cục đá nhỏ hơn, gọi là Mũi nhỏ. Chúng di chuyển bằng lực từ trường và thường đi cùng nhau. Chiếc mũi lớn giúp nó định hướng và cảm nhận từ trường xung quanh. Những bạn nhỏ này luôn tuân theo lệnh của nó.',
    rarity: 'rare',
  ),

  'skitty': PokemonMeta(
    hint: 'Chú mèo nhỏ thích đuổi theo mọi thứ chuyển động.',
    lore: 'Sinh vật đáng yêu này có một đám lông mềm mại và đôi tai to tròn. Nó rất thích nhìn những vật gì đó đang nhảy nhót hoặc lăn tròn và sẽ lao theo chúng một cách say mê. Đôi khi, nó còn đuổi theo cái đuôi xinh xắn của mình cho đến khi cảm thấy chóng mặt và ngã lăn quay. Sự tinh nghịch này khiến nó trở nên vô cùng thú vị và đáng yêu trong mắt mọi người.',
    rarity: 'common',
  ),

  'delcatty': PokemonMeta(
    hint: 'Trông giống mèo lười, thích làm mọi thứ theo ý mình.',
    lore: 'Loài này sống cuộc đời tự do, không bị ràng buộc. Chúng ăn và ngủ bất cứ khi nào mình muốn, nên lịch trình hàng ngày hoàn toàn ngẫu nhiên. Dù có vẻ hơi tùy hứng, nhưng chúng lại rất được yêu mến vì sự đáng yêu và phong thái ung dung của mình.',
    rarity: 'rare',
  ),

  'aron': PokemonMeta(
    hint: 'Sinh vật có thân hình bằng thép, ăn quặng sắt.',
    lore: 'Sinh vật này có một cơ thể bằng thép cứng rắn. Để có được thân hình đó, nó ăn quặng sắt mà nó đào từ núi. Đôi khi, nó gây ra rắc rối lớn bằng cách ăn luôn cả cầu và đường ray. Dù có vẻ hung hăng, nó chỉ đơn giản là thỏa mãn cơn đói của mình.',
    rarity: 'common',
  ),

  'lairon': PokemonMeta(
    hint: 'Thân thép mập mạp, thích uống nước khoáng.',
    lore: 'Loài POKéMON này cường hóa cơ thể bằng thép của mình bằng cách uống nguồn nước khoáng giàu dinh dưỡng cho đến khi căng phồng. Chúng làm tổ gần những con suối có nguồn nước ngon tuyệt, vì chúng rất thích thú với thứ nước này.',
    rarity: 'rare',
  ),

  'aggron': PokemonMeta(
    hint: 'Bộ giáp cứng, trốn trong núi, bảo vệ lãnh thổ.',
    lore: 'Sinh vật khổng lồ với lớp vỏ thép như núi non. Nó coi cả ngọn núi là nhà và sẽ tấn công bất cứ ai dám xâm phạm. Nó canh gác lãnh thổ của mình không ngừng nghỉ, sẵn sàng đánh đuổi kẻ lạ mặt.',
    rarity: 'rare',
  ),

  'meditite': PokemonMeta(
    hint: 'Tím nhỏ bé, luôn tìm kiếm sự tĩnh lặng.',
    lore: 'Sinh vật bé nhỏ màu tím này hít thở sâu trong những ngọn núi cao. Chúng dành cả ngày để tập trung tinh thần, cố gắng đạt được sự bình yên tuyệt đối. Tuy nhiên, mỗi khi chúng nhắm mắt lại để suy ngẫm, một thứ gì đó luôn khiến tâm trí chúng lang thang. Vì vậy, bài tập kéo dài mãi, và sự rèn luyện của chúng không bao giờ kết thúc.',
    rarity: 'common',
  ),

  'medicham': PokemonMeta(
    hint: 'Luôn luyện tập, làm bạn với núi rừng.',
    lore: 'Rất mạnh mẽ và bí ẩn, sinh vật này luôn tập thiền để tăng cường sức mạnh nội tại và nhạy bén giác quan thứ sáu. Chúng có khả năng ẩn mình tài tình, hòa mình vào thiên nhiên như hòa vào đồng cỏ và cây núi. Khiến cho việc nhìn thấy chúng trở nên khó khăn, như thể chúng chỉ là một phần của cảnh vật xung quanh.',
    rarity: 'rare',
  ),

  'electrike': PokemonMeta(
    hint: 'Đuôi dài như dây điện, chạy cực nhanh.',
    lore: 'Sinh vật này chứa đầy điện trong bộ lông dài của mình. Nó sử dụng những cú sốc điện để kích thích cơ chân, mang lại khả năng tăng tốc bùng nổ. Điều này giúp nó di chuyển với tốc độ đáng kinh ngạc, như một tia chớp nhỏ lướt qua đồng cỏ. Đôi chân của nó có thể tạo ra những bước nhảy vọt đầy uy lực, khiến mọi đối thủ phải dè chừng.',
    rarity: 'rare',
  ),

  'manectric': PokemonMeta(
    hint: 'Bộ lông rực lửa, phóng điện liên tục.',
    lore: 'Sinh vật này phóng ra tia lửa điện từ bờm của mình. Đôi khi, những tia lửa này có thể gây cháy rừng. Khi tham gia chiến đấu, nó còn gọi sấm sét và tạo ra những đám mây giông bão, sẵn sàng giáng xuống đối thủ những cú đánh sấm sét mạnh mẽ.',
    rarity: 'rare',
  ),

  'roselia': PokemonMeta(
    hint: 'Bông hoa trên tay có gai nhọn.',
    lore: 'Loài hoa này phun gai sắc nhọn vào bất kỳ kẻ nào dám lấy trộm những đóa hoa trên tay. Hương thơm dịu dàng của nó mang lại sự bình yên cho muôn loài sinh vật xung quanh, khiến mọi thứ trở nên thư thái và tĩnh lặng. Cây hoa này thường nở rộ vào những ngày nắng đẹp, tỏa ra một mùi hương quyến rũ, thu hút côn trùng và các loài vật nhỏ đến thưởng ngoạn.',
    rarity: 'common',
  ),

  'roserade': PokemonMeta(
    hint: 'Một bông hoa đầy gai có hương thơm ngọt ngào.',
    lore: 'Loài hoa này tỏa ra một mùi hương ngọt lịm, quyến rũ côn trùng và các sinh vật nhỏ bé đến gần. Khi con mồi đã đủ gần, những chiếc roi gai ẩn giấu trong cánh hoa sẽ bất ngờ tấn công và bắt gọn chúng. Nó là một thợ săn tài ba, sử dụng vẻ đẹp của mình để đánh lừa kẻ địch.',
    rarity: 'rare',
  ),

  'gulpin': PokemonMeta(
    hint: 'Chú ếch màu hồng tròn vo, bụng to quá khổ.',
    lore: 'Cơ thể của sinh vật này gần như toàn bộ là dạ dày. Điều đó cho phép nó nuốt chửng mọi thứ, kể cả vật lớn bằng chính nó. Dạ dày đặc biệt của nó chứa một loại dịch tiêu hóa mọi thứ, biến mọi thứ trở nên vô hại và biến thành năng lượng. Nó thường không có răng, mà sử dụng cơ thể để nghiền nát thức ăn.',
    rarity: 'common',
  ),

  'swalot': PokemonMeta(
    hint: 'Miệng nó rất to và phun ra chất độc để bắt mồi.',
    lore: 'Loài này có cái miệng khổng lồ, có thể nuốt chửng con mồi một cách dễ dàng. Khi phát hiện thức ăn, nó sẽ phun ra một thứ chất lỏng có độc tính cao từ các lỗ nhỏ trên cơ thể. Chất độc này làm cho con mồi bị yếu đi, tạo cơ hội cho nó nuốt chửng chúng mà không gặp khó khăn. Nó thích sống ở những nơi có nhiều nguồn thức ăn.',
    rarity: 'rare',
  ),

  'carvanha': PokemonMeta(
    hint: 'Cá sấu hung dữ với hàm răng sắc nhọn.',
    lore: 'Sinh vật này có hàm răng cực khỏe và sắc để xé toạc vỏ tàu. Rất nhiều tàu thuyền đã bị tấn công và đánh chìm bởi nó. Nó bơi lội nhanh nhẹn và thường đi săn theo đàn, tấn công bất ngờ khiến con mồi không kịp trở tay.',
    rarity: 'common',
  ),

  'sharpedo': PokemonMeta(
    hint: 'Voi hàm răng sắc nhọn và tốc độ đáng kinh',
    lore: 'Biệt danh "kẻ bắt nạt của đại dương", nó gieo rắc nỗi sợ hãi. Răng của nó mọc lại ngay lập tức nếu bị gãy. Chỉ một con thôi cũng có thể xé toạc một chiếc tàu chở dầu khổng lồ. Nó là nỗi khiếp sợ của mọi sinh vật biển.',
    rarity: 'rare',
  ),

  'wailmer': PokemonMeta(
    hint: 'Tai to, mũi trên mắt, thích phun nước.',
    lore: 'Sinh vật biển vui nhộn này có đôi tai to phình ra và những chiếc mũi nằm phía trên đôi mắt. Nó thích trữ nước biển trong cơ thể và bất ngờ làm mọi người giật mình bằng cách phun nước mạnh ra từ những chiếc mũi đó. Chắc hẳn đó là một trò đùa rất ướt át!',
    rarity: 'rare',
  ),

  'wailord': PokemonMeta(
    hint: 'Cá khổng lồ, bơi lội chậm rãi',
    lore: 'sinh vật biển to lớn nhất từng được biết đến, nó nhàn nhã bơi lội trong đại dương bao la. Với chiếc miệng khổng lồ, nó có thể nuốt trọn một lượng thức ăn khổng lồ trong một lần.',
    rarity: 'rare',
  ),

  'numel': PokemonMeta(
    hint: 'Chú lù đù với đầu óc chậm chạp, cơ thể nóng bỏng.',
    lore: 'Sinh vật này có đầu óc rất chậm hiểu, thậm chí không nhận ra mình vừa bị va chạm. Tuy vậy, nó không thể chịu đựng cơn đói dù chỉ một giây. Toàn bộ cơ thể của nó là một cái vạc sôi sùng sục chứa đầy dung nham nóng chảy. Lớp da dày giúp nó bảo vệ bản thân khỏi chính sức nóng bên trong, nhưng nếu bị kích động, dung nham bên trong có thể phun trào ra ngoài.',
    rarity: 'common',
  ),

  'camerupt': PokemonMeta(
    hint: 'Sinh vật có núi lửa trên lưng, phun trào dung nham nóng chảy.',
    lore: 'Trong cơ thể nó là một ngọn núi lửa đang hoạt động với magma 18.000 độ F chảy xiết. Đôi khi, hai ụ trên lưng nó sẽ phụt ra, phun những dòng dung nham siêu nóng. Sinh vật này sống gần núi lửa và có thể chịu được nhiệt độ cực cao.',
    rarity: 'common',
  ),

  'spoink': PokemonMeta(
    hint: 'Nhảy nhót liên hồi trên chiếc đuôi hình lò xo.',
    lore: 'Sinh vật nhỏ bé này luôn luôn phải nhảy múa để giữ cho trái tim đập. Nếu dừng lại dù chỉ một giây, nhịp tim của nó sẽ ngừng đập theo. Đuôi của nó giúp nó duy trì sự cân bằng và cũng là nơi chứa sức mạnh để nó bật nhảy không ngừng. Thế giới của nó là những bước nhảy vui vẻ và nhịp đập liên hồi.',
    rarity: 'common',
  ),

  'grumpig': PokemonMeta(
    hint: 'Chú heo màu hồng với chiếc mũi lớn.',
    lore: 'Sinh vật này sở hữu những viên ngọc đen trên cơ thể, giúp khuếch đại sóng năng lượng tâm linh. Khi phát huy sức mạnh đặc biệt, hơi thở của nó trở nên nặng nhọc và khò khè. Khả năng kiểm soát đối thủ của nó thật đáng kinh ngạc nhờ vào sức mạnh này.',
    rarity: 'rare',
  ),

  'trapinch': PokemonMeta(
    hint: 'Chờ mồi trong hố cát, hàm răng mạnh mẽ.',
    lore: 'Sinh vật này đào một cái hố hình bát giác dốc đứng, giống như cái bẫy trên đất cát. Nó nằm im, kiên nhẫn chờ đợi con mồi vô tình rơi xuống. Với bộ hàm khổng lồ và cực kỳ khỏe, nó có thể nghiền nát cả những tảng đá lớn. Khi bữa ăn kết thúc, nó sẽ lấp đầy lại cái hố đó như chưa từng có gì xảy ra, sẵn sàng cho những nạn nhân tiếp theo.',
    rarity: 'common',
  ),

  'vibrava': PokemonMeta(
    hint: 'Ong vù vù rung cánh tạo âm thanh.',
    lore: 'Sinh vật nhỏ bé này tạo ra những con sóng siêu âm mạnh mẽ bằng cách vỗ cánh thật nhanh. Âm thanh này đủ lớn để khiến kẻ săn mồi bất tỉnh và thậm chí có thể gây đau đầu cho con người. Chúng thường được tìm thấy ở những nơi yên tĩnh.',
    rarity: 'rare',
  ),

  'flygon': PokemonMeta(
    hint: 'Cánh vẫy tạo bão cát, là linh hồn sa mạc.',
    lore: 'Sinh vật huyền bí được gọi là "linh hồn nguyên tố của sa mạc". Khi bay, nó vẫy đôi cánh tạo ra một cơn lốc cát mạnh mẽ, bao bọc lấy chính nó trong một cơn bão cát nhỏ nhắn. Đôi cánh rung động tạo ra một giai điệu đặc trưng, vang vọng khắp vùng đất khô cằn.',
    rarity: 'rare',
  ),

  'cacnea': PokemonMeta(
    hint: 'Cây xương rồng có hoa tỏa hương thu hút con mồi.',
    lore: 'Sinh sống ở những vùng đất khô cằn như sa mạc, sinh vật này tiết ra một mùi hương nồng nàn từ bông hoa của mình để dụ dỗ con mồi. Khi con mồi đến gần, nó sẽ bắn những chiếc gai sắc nhọn từ cơ thể để hạ gục nạn nhân. Điều này giúp nó tồn tại trong môi trường khắc nghiệt.',
    rarity: 'common',
  ),

  'cacturne': PokemonMeta(
    hint: 'Cây xương rồng biết đi, hoạt động về đêm.',
    lore: 'Vào ban ngày, nó đứng im để giữ nước. Khi đêm xuống, không khí mát mẻ hơn, nó mới bắt đầu di chuyển. Cây xương rồng này trông rất ngộ nghĩnh với chiếc mũ kỳ lạ và dáng vẻ hơi gầy gò. Nó thích sống ở những nơi khô cằn, đầy nắng và cát.',
    rarity: 'rare',
  ),

  'swablu': PokemonMeta(
    hint: 'Mây bông tròn tròn, thích đậu trên đầu.',
    lore: 'Sinh vật nhỏ bé có đôi cánh mềm mại như mây bông. Nó rất thân thiện và không hề sợ con người. Thay vào đó, nó thích đậu lên những mái đầu, trông như một chiếc mũ ngộ nghĩnh làm từ bông gòn.  Khi có ai đó đến gần, nó thường vui vẻ dang rộng vòng tay nhỏ của mình ra chào đón.',
    rarity: 'common',
  ),

  'altaria': PokemonMeta(
    hint: 'Chú chim với mây trắng bồng bềnh trên cánh.',
    lore: 'Sinh vật này tung bay lượn vòng trên bầu trời, hòa mình vào những đám mây trắng như bông. Giọng hát trong trẻo của nó ngân vang những giai điệu du dương, khiến mọi người xung quanh chìm đắm trong cảm giác huyền ảo, mộng mơ. Mỗi lần nó cất tiếng hát, không khí như trở nên lung linh và huyền bí hơn.',
    rarity: 'rare',
  ),

  'barboach': PokemonMeta(
    hint: 'Cái râu nhạy cảm giúp nó dò tìm đồ ăn dưới bùn.',
    lore: 'Sinh vật nhỏ bé này thích ẩn mình trong lớp bùn dày, chỉ để lộ đôi râu dài nhạy bén. Chúng hoạt động như một hệ thống radar siêu đỉnh, giúp nó cảm nhận được mọi rung động xung quanh. Khi có con mồi vô tình đi ngang qua, nó sẽ nhanh chóng lao ra tóm gọn. Đôi râu cũng giúp nó di chuyển và khám phá môi trường sống dưới nước đầy bùn đất.',
    rarity: 'common',
  ),

  'whiscash': PokemonMeta(
    hint: 'Cá có ria mép khổng lồ, rất hay gây động đất.',
    lore: 'Sinh vật này rất thích bảo vệ lãnh thổ của mình. Một con duy nhất có thể coi cả một cái ao là của riêng nó. Nếu có kẻ lạ bén mảng đến gần, nó sẽ quẫy đạp mạnh mẽ, tạo ra những cơn địa chấn rung chuyển cả mặt đất. Nó sống ở những vùng nước ngọt và khá hung dữ.',
    rarity: 'rare',
  ),

  'corphish': PokemonMeta(
    hint: 'Chú cua nhỏ cứng cáp với cái kẹp không buông.',
    lore: 'Loài vật nhỏ bé này có sức sống mãnh liệt, giúp nó sinh tồn ở mọi nơi. Dù ở đâu, bộ kẹp của nó cũng sẽ giữ chặt con mồi. Nó rất thích cuộc sống dưới nước, nhưng cũng có thể sống trên cạn một thời gian. Vỏ của nó rất cứng, bảo vệ nó khỏi những kẻ săn mồi.',
    rarity: 'common',
  ),

  'crawdaunt': PokemonMeta(
    hint: 'Tôm hùm đỏ với móng vuốt sắc nhọn, rất hung dữ.',
    lore: 'Sinh vật này có tính cách cực kỳ bạo lực, luôn tìm kiếm thử thách chiến đấu với mọi thứ xung quanh. Nơi nào có nó sinh sống, nơi đó trở nên hoang tàn vì không sinh vật nào dám ở lại. Nó thống trị vùng nước của mình bằng sức mạnh và sự hung hăng của mình, một vị vua đáng sợ của ao hồ.',
    rarity: 'common',
  ),

  'baltoy': PokemonMeta(
    hint: 'Đứa bé màu đất nhỏ bé hay xoay tròn.',
    lore: 'Sinh vật nhỏ bé này di chuyển bằng cách xoay tròn trên một chân. Các bức tranh tường cổ xưa đã được tìm thấy, mô tả nó sống hòa hợp với con người. Nó có vẻ là một phần của những bí ẩn đã mất từ ​​lâu.',
    rarity: 'common',
  ),

  'claydol': PokemonMeta(
    hint: 'Búp bê đất sét biết bay với đôi mắt tròn và vòng tròn trên đầu.',
    lore: 'Những bức tượng đất sét cổ xưa, được ban sự sống bởi tia sáng bí ẩn, giờ đây lơ lửng và di chuyển trên không trung. Người ta nói rằng chúng được tạo ra bởi những người nguyên thủy. Chúng mang trong mình một sức mạnh bí ẩn, giữ cho mình luôn bay bổng mà không cần chạm đất.',
    rarity: 'rare',
  ),

  'lileep': PokemonMeta(
    hint: 'Mang hình dáng hoa, sống dưới đáy biển.',
    lore: 'Sinh vật cổ đại này sống ở biển cả, giống như một đóa hoa xinh đẹp bám vào đá. Nó dùng những xúc tu mềm mại để vồ lấy con mồi bé nhỏ bơi ngang qua. Đã tuyệt chủng từ rất lâu rồi, nhưng hình dáng kỳ lạ của nó vẫn còn sót lại trong hóa thạch.',
    rarity: 'rare',
  ),

  'cradily': PokemonMeta(
    hint: 'Rắn cổ dài với xúc tu bắt mồi dưới biển.',
    lore: 'Sinh vật biển cổ đại này di chuyển chậm rãi trên đáy đại dương. Nó vươn chiếc cổ dài như thân cây để tóm lấy những con mồi bất cẩn bằng tám chiếc xúc tu linh hoạt. Nó tìm kiếm thức ăn ở nơi sâu thẳm của biển cả, ẩn mình chờ đợi.',
    rarity: 'rare',
  ),

  'anorith': PokemonMeta(
    hint: 'Có hai móng vuốt lớn, sống dưới nước.',
    lore: 'Loài Pokémon cổ xưa này được hồi sinh từ hóa thạch thời tiền sử. Nó từng sinh sống ở những vùng biển ấm áp. Với hai móng vuốt lớn, nó có thể tóm chặt con mồi một cách chắc chắn. Hình dạng độc đáo gợi nhớ đến một loài sinh vật biển đã tuyệt chủng từ lâu.',
    rarity: 'rare',
  ),

  'armaldo': PokemonMeta(
    hint: 'Cái mai cứng cáp, móng vuốt sắc bén.',
    lore: 'Nhờ lớp giáp chắc chắn, mọi đòn tấn công dường như bật ngược lại. Hai chiếc móng khổng lồ của sinh vật này có thể thu vào hoặc duỗi ra tùy ý. Chúng đủ mạnh để đục thủng một tấm thép dày.',
    rarity: 'rare',
  ),

  'feebas': PokemonMeta(
    hint: 'Trông có vẻ xấu xí, hay bị bỏ quên.',
    lore: 'Loài Pokemon này có vây trông rách rưới ngay từ khi mới sinh. Vì ngoại hình không mấy ưa nhìn, nó thường bị mọi người phớt lờ. Tuy nhiên, nó lại rất khỏe mạnh và có thể sống cả ở biển lẫn sông ngòi. Đừng vội đánh giá nó qua vẻ ngoài nhé!',
    rarity: 'common',
  ),

  'milotic': PokemonMeta(
    hint: 'Vảy bảy sắc cầu vồng đẹp lung linh.',
    lore: 'Sinh vật huyền thoại này có vảy óng ánh, thay đổi màu sắc theo từng góc nhìn, giống như dải cầu vồng thu nhỏ. Vẻ đẹp của nó khiến mọi ai từng chiêm ngưỡng đều say đắm. Nó sống ở nơi sâu thẳm và yên tĩnh của nước, mang đến sự bình yên cho vùng nước đó.',
    rarity: 'rare',
  ),

  'shuppet': PokemonMeta(
    hint: 'Bóng ma màu tím thích cảm xúc tiêu cực, tụ tập đông đúc.',
    lore: 'Sinh vật nhỏ bé này bị cuốn hút bởi những cảm xúc ghen tị và muốn trả thù. Khi ai đó nuôi dưỡng ý định báo thù mạnh mẽ, chúng sẽ xuất hiện thành từng đàn. Chúng thường xếp hàng dưới mái hiên nhà của người đó, dường như đang chờ đợi. Sự hiện diện của chúng đôi khi được xem là dấu hiệu cho thấy những cảm xúc tiêu cực đang lan tỏa.',
    rarity: 'common',
  ),

  'banette': PokemonMeta(
    hint: 'Búp bê đồ chơi bị bỏ rơi, thích cắm kim để niệm nguyền.',
    lore: 'Vốn là một món đồ chơi nhồi bông đáng thương, bị vứt bỏ và trở nên oán giận. Giờ đây, nó tìm kiếm sự báo thù bằng cách dùng những chiếc kim để tạo ra năng lượng cho những lời nguyền mạnh mẽ và đầy ác ý. Mỗi mũi kim cắm vào thân mình là một tia oán hận được gửi đi, khiến mọi thứ xung quanh trở nên xui xẻo.',
    rarity: 'rare',
  ),

  'duskull': PokemonMeta(
    hint: 'Bóng ma nhỏ với chiếc đèn lồng trên đầu.',
    lore: 'Sinh vật này có thể xuyên qua mọi bức tường, dù dày cách mấy. Một khi đã nhắm vào ai đó, nó sẽ kiên trì theo đuổi cho đến khi mặt trời mọc. Con mồi của nó thường không thoát khỏi tầm mắt của nó đâu nhé.',
    rarity: 'common',
  ),

  'dusclops': PokemonMeta(
    hint: 'Trông giống búp bê ma, nuốt mọi thứ vào bụng.',
    lore: 'Sinh vật kỳ lạ này có cái bụng rỗng tuếch, giống như một lỗ đen vũ trụ. Nó có khả năng hút mọi thứ vào trong cơ thể mình, nhưng những thứ đã đi vào sẽ không bao giờ quay trở lại. Hãy cẩn thận đừng để bị nó hút mất đồ nhé!',
    rarity: 'rare',
  ),

  'dusknoir': PokemonMeta(
    hint: 'Vầng sáng trên đầu dẫn đường người đi',
    lore: 'Sinh vật bí ẩn này có một chiếc ăng-ten trên đầu, giống như một chiếc đài thu sóng đặc biệt. Nó luôn lắng nghe những tín hiệu từ thế giới bên kia, những lời thôi thúc nó đưa những linh hồn lạc lối đến nơi an nghỉ. Đôi khi, nó lại xuất hiện như một người dẫn đường, lặng lẽ chỉ lối cho những ai đang tìm kiếm một con đường mới.',
    rarity: 'rare',
  ),

  'snorunt': PokemonMeta(
    hint: 'Món quà nhỏ của băng tuyết, thích ẩn mình khi nắng ấm.',
    lore: 'Sinh vật nhỏ bé này yêu thích những vùng đất phủ đầy tuyết trắng. Khi mùa xuân và mùa hè đến, nó tìm đến những hang động sâu thẳm, nơi có những nhũ đá và măng đá tuyệt đẹp. Tại đó, nó sống một cuộc đời yên tĩnh, chờ đợi những cơn gió lạnh quay trở lại. Nụ cười chúm chím và đôi mắt tròn xoe là đặc điểm dễ thương của nó. Chúng có thể tụ tập lại với nhau để giữ ấm trong những đêm đông giá rét.',
    rarity: 'common',
  ),

  'glalie': PokemonMeta(
    hint: 'Nó có bộ áo băng cứng như đá, tạo hình tùy thích.',
    lore: 'Sinh vật này được tạo nên từ đá, rồi khoác lên mình lớp áo băng vững chắc. Nó có thể làm đóng băng hơi ẩm trong không khí, tạo ra bất kỳ hình dạng nào nó mong muốn. Lớp băng dày giúp nó chống chọi với những môi trường khắc nghiệt nhất.',
    rarity: 'rare',
  ),

  'froslass': PokemonMeta(
    hint: 'Nụ cười băng giá, thân hình trống rỗng.',
    lore: 'Khi gặp cái lạnh thấu xương gần -60 độ F, mọi thứ đều có thể hóa thành băng tuyết. Sinh vật bí ẩn này tỏa ra hơi lạnh kinh người, biến kẻ địch thành tượng đá giá. Nhưng đừng để vẻ ngoài mong manh đánh lừa, ẩn sâu bên trong nó là một sự trống rỗng kỳ lạ, như một chiếc chuông gió đóng băng, chỉ chờ đợi kẻ tò mò đến gần để cảm nhận hơi thở lạnh lẽo của mình.',
    rarity: 'rare',
  ),

  'spheal': PokemonMeta(
    hint: 'Quả bóng tròn màu xanh lướt đi nhanh nhẹn.',
    lore: 'Loài sinh vật tròn trĩnh này thích lăn hơn là đi bộ để di chuyển. Khi ăn uống cùng nhau, chúng vỗ tay đồng loạt để bày tỏ sự thích thú. Vì thế, bữa ăn của chúng thường rất ồn ào và vui vẻ.',
    rarity: 'common',
  ),

  'sealeo': PokemonMeta(
    hint: 'Hải cẩu tròn có vây, thích tung hứng mọi thứ trên mũi.',
    lore: 'Sinh vật biển đáng yêu này có thói quen độc đáo là tung hứng bất cứ thứ gì mới lạ nó nhìn thấy trên chóp mũi. Đôi khi, nó còn tự giải trí bằng cách giữ thăng bằng và lăn một chú Spheal trên mũi mình, tạo nên cảnh tượng vô cùng vui nhộn. Bộ lông mịn màng và ánh mắt tinh nghịch khiến nó trở thành một người bạn đồng hành thú vị, luôn tìm cách mang lại tiếng cười.',
    rarity: 'rare',
  ),

  'walrein': PokemonMeta(
    hint: 'Voi biển với cặp ngà to, phá băng.',
    lore: 'Sinh vật to lớn này bơi lội trong làn nước giá lạnh, dùng chiếc ngà khổng lồ để phá tan những tảng băng trôi. Lớp mỡ dày giúp nó giữ ấm khi khám phá những vùng biển băng giá sâu thẳm. Nó là một nhà vô địch bơi lội và không ngại đối mặt với cái lạnh khắc nghiệt.',
    rarity: 'rare',
  ),

  'clamperl': PokemonMeta(
    hint: 'Vỏ cứng, dùng để bắt mồi.',
    lore: 'Loài vật này có một chiếc mai chắc chắn, không chỉ để bảo vệ mà còn để kẹp và bắt lấy con mồi. Chiếc mai của những cá thể trưởng thành sẽ có đầy những vết xước và dấu vết, minh chứng cho những trận chiến trong cuộc sống.',
    rarity: 'common',
  ),

  'huntail': PokemonMeta(
    hint: 'Răng sắc nhọn, cơ thể dài, bơi sâu thẳm.',
    lore: 'Sinh vật bí ẩn sống dưới đáy biển sâu thẳm, nơi ánh sáng hiếm khi chiếu tới. Đôi mắt của nó đã tiến hóa để nhìn rõ trong bóng tối mờ mịt, giúp nó săn mồi và tránh né kẻ thù. Sự tồn tại của nó đã từng là một bí ẩn đối với con người do môi trường sống khắc nghiệt và khó tiếp cận.',
    rarity: 'rare',
  ),

  'gorebyss': PokemonMeta(
    hint: 'Vây hồng dài, trông như dải ruy băng bơi lội.',
    lore: 'Sinh vật sống ở đáy biển sâu thẳm, nơi áp lực nước cực lớn. Cơ thể nó được cấu tạo đặc biệt để chịu đựng môi trường khắc nghiệt này. Nhờ vậy, những đòn tấn công thông thường dường như không thể làm hại nó. Nó thường sử dụng chiếc mũi dài và nhọn của mình để moi thức ăn dưới đáy biển.',
    rarity: 'rare',
  ),

  'bagon': PokemonMeta(
    hint: 'Chú rồng nhỏ với đôi cánh chưa phát triển thích nhảy từ trên cao.',
    lore: 'Sinh vật nhỏ bé này luôn nuôi dưỡng một giấc mơ bay lượn giữa bầu trời. Mỗi ngày, nó dũng cảm nhảy khỏi các vách đá cao, hy vọng rằng một ngày nào đó đôi cánh non nớt sẽ giúp nó vút lên. Dù vấp ngã nhiều lần, nó không bao giờ bỏ cuộc, kiên trì rèn luyện để biến ước mơ thành hiện thực. Niềm tin mãnh liệt và sự chăm chỉ của nó thật đáng ngưỡng mộ.',
    rarity: 'rare',
  ),

  'shelgon': PokemonMeta(
    hint: 'Bọc giáp nặng, luôn ngủ say, chờ ngày lột xác.',
    lore: 'Bên trong lớp giáp cứng rắn, các tế bào đang âm thầm thay đổi để kiến tạo một cơ thể hoàn toàn mới. Chiếc mai của Pokémon này nặng trịch, khiến mỗi bước đi đều chậm chạp. Nó dành phần lớn thời gian nghỉ ngơi trong lớp vỏ cứng bé, bảo vệ bản thân trong giai đoạn phát triển quan trọng. Giấc ngủ sâu giúp quá trình biến đổi diễn ra thuận lợi, chuẩn bị cho sự xuất hiện của một hình hài mạnh mẽ và lộng lẫy hơn.',
    rarity: 'rare',
  ),

  'salamence': PokemonMeta(
    hint: 'Rồng đỏ có đôi cánh lớn, hay bay lượn trên bầu trời.',
    lore: 'Sinh vật hùng mạnh này xuất hiện từ ước mơ cháy bỏng được bay lượn. Khát vọng mãnh liệt đó đã thúc đẩy một sự biến đổi kỳ diệu trong tế bào của nó, giúp nó mọc lên đôi cánh tuyệt đẹp. Sự tiến hóa này ban cho nó sức mạnh phi thường và khả năng bay lượn tự do trên bầu trời cao rộng. Nó là biểu tượng của sự kiên trì và sức mạnh nội tại.',
    rarity: 'rare',
  ),

  'beldum': PokemonMeta(
    hint: 'Khối kim loại bay, có nam châm mạnh.',
    lore: 'Thay vì máu, một lực từ trường mạnh mẽ chảy khắp cơ thể sinh vật này. Nó giao tiếp với đồng loại bằng cách phát ra những xung từ tính có kiểm soát. Đôi khi, nó có thể bị thu hút bởi những vật kim loại khác hoặc bị đẩy ra xa bởi từ trường mạnh.',
    rarity: 'legendary',
  ),

  'metang': PokemonMeta(
    hint: 'Trái Đất bị hút bởi hai cái đầu gắn kết',
    lore: 'Một sinh vật kỳ lạ ra đời khi hai kẻ ngốc nghếch hợp nhất. Những não bộ của chúng sẽ liên kết với nhau bằng một mạng lưới thần kinh từ tính. Nhờ sự kết nối này, chúng có thể tạo ra sức mạnh tâm linh cực lớn. Dù trông có vẻ vụng về, nó rất thông minh và có thể di chuyển nhanh chóng bằng cách dùng sức mạnh này.',
    rarity: 'legendary',
  ),

  'metagross': PokemonMeta(
    hint: 'Robot có bốn chân, đầu to và cánh tay kim loại.',
    lore: 'Sinh vật này có tới bốn bộ não, giúp nó xử lý mọi phép tính phức tạp một cách nhanh chóng, thậm chí còn nhanh hơn cả siêu máy tính. Nó có thể bay lơ lửng trên không trung chỉ bằng cách thu gọn bốn chân của mình lại.',
    rarity: 'legendary',
  ),

  'turtwig': PokemonMeta(
    hint: 'Cái mai trên lưng cứng lại khi uống nước.',
    lore: 'Sinh vật nhỏ bé này được tạo ra từ đất. Khi ở gần hồ nước, chiếc mai trên lưng của nó sẽ cứng lại mỗi khi nó uống nước. Nó yêu thích cuộc sống bên những vùng nước trong xanh, nơi nó có thể vừa tìm kiếm thức ăn, vừa vui đùa thỏa thích. Chiếc mai cứng cáp giúp nó bảo vệ bản thân khỏi kẻ thù và còn chống chịu được những cơn mưa bất chợt nữa.',
    rarity: 'rare',
  ),

  'grotle': PokemonMeta(
    hint: 'Chú ếch xanh to lớn và hiền lành bảo vệ khu rừng.',
    lore: 'Sinh vật này có thể cảm nhận được những mạch nước tinh khiết nhất dưới lòng đất. Khi bạn bè gặp nguy hiểm hoặc khát nước, nó sẽ vui vẻ cõng họ đến những nơi an toàn và yên tĩnh này.  Nó là người bạn đồng hành đáng tin cậy, luôn sẵn sàng giúp đỡ mọi người với sự dịu dàng của mình.',
    rarity: 'rare',
  ),

  'torterra': PokemonMeta(
    hint: 'Sinh vật to lớn với một cái cây trên lưng.',
    lore: 'Loài này vô cùng mạnh mẽ và có thể di chuyển chậm rãi. Trên lưng nó mọc lên một khu rừng nhỏ, nơi các Pokémon bé nhỏ thường lui tới để xây tổ và khám phá thế giới. Cây trên lưng nó ngày càng lớn khi nó già đi, mang lại sự sống và bóng râm cho khu vực xung quanh. Nó là người bảo vệ trung thành của khu rừng.',
    rarity: 'rare',
  ),

  'chimchar': PokemonMeta(
    hint: 'Chú linh dương nhỏ bé có chiếc đuôi rực lửa.',
    lore: 'Sinh vật nhỏ bé này sống ở những ngọn núi cao, nơi có những vách đá dựng đứng. Nó leo trèo rất giỏi, đôi khi bị ướt đuôi khi ngủ quên dưới mưa. Khi gặp nguy hiểm, nó có thể phun ra ngọn lửa nhỏ từ mũi để tự vệ.',
    rarity: 'rare',
  ),

  'monferno': PokemonMeta(
    hint: 'Vờn đuôi lửa để trông to lớn hơn.',
    lore: 'Chú khỉ tinh nghịch này có ngọn lửa bùng cháy trên đuôi. Khi cảm thấy bị đe dọa, nó sẽ vẫy mạnh ngọn lửa đó, tạo ảo giác mình lớn hơn rất nhiều để làm kẻ xấu sợ hãi bỏ chạy. Đôi khi, ngọn lửa còn phụt ra những tia lửa nhỏ khi nó hào hứng hoặc tức giận.',
    rarity: 'rare',
  ),

  'infernape': PokemonMeta(
    hint: 'Chú khỉ với chiếc đuôi rực lửa.',
    lore: 'Nó luyện tập võ thuật đặc biệt, sử dụng cả tay và chân. Ngọn lửa trên đuôi nó cháy mãi không tắt, biểu thị cho ý chí kiên cường và sức mạnh không ngừng nghỉ. Mỗi cú ra đòn đều mạnh mẽ và dứt khoát, mang theo hơi nóng lan tỏa khắp nơi.',
    rarity: 'rare',
  ),

  'piplup': PokemonMeta(
    hint: 'Chú chim cánh cụt nhỏ màu xanh với chiếc mỏ vàng',
    lore: 'Chú chim bé nhỏ này rất tự hào, ghét nhận thức ăn từ người lạ. Lông dày giúp chú giữ ấm trong thời tiết lạnh giá. Mỗi khi gặp nguy hiểm, chú sẽ xù lông lên để trông to hơn.',
    rarity: 'rare',
  ),

  'prinplup': PokemonMeta(
    hint: 'Chú chim màu xanh này thường bơi một mình, rất tự tin.',
    lore: 'Chú chim này thích sống một mình và tin rằng mình là người quan trọng nhất. Nó rất tự hào về bản thân và luôn cố gắng trông thật oai vệ. Mỗi chú chim đều nghĩ mình là tài năng nhất, vì vậy chúng thường tránh xa nhau để không phải tranh giành sự chú ý. Tuy vậy, đôi khi chúng vẫn sẽ tụ tập lại để khoe khoang tài năng bơi lội của mình.',
    rarity: 'rare',
  ),

  'empoleon': PokemonMeta(
    hint: 'Vua chim cánh cụt với ba chiếc sừng uy dũng.',
    lore: 'Sinh vật quý tộc này tỏa ra vẻ uy nghiêm và quyền lực. Ba chiếc sừng trên mỏ của nó là biểu tượng cho sức mạnh phi thường. Thủ lĩnh của đàn luôn sở hữu bộ sừng to lớn nhất, thể hiện vai trò lãnh đạo. Nó dùng sừng để bảo vệ lãnh thổ và chiến đấu với kẻ thù.',
    rarity: 'rare',
  ),

  'starly': PokemonMeta(
    hint: 'Chim nhỏ hay bay thành đàn, vỗ cánh đầy sức mạnh.',
    lore: 'Loài chim nhỏ bé này thường tụ tập thành những đàn lớn, bay lượn trên bầu trời. Dù kích thước khiêm tốn, đôi cánh của chúng lại sở hữu sức mạnh đáng ngạc nhiên, giúp chúng di chuyển nhanh nhẹn và bền bỉ trong những chuyến bay dài. Chúng thích sinh sống ở những cánh đồng và khu vực ven rừng, nơi chúng dễ dàng tìm kiếm thức ăn và làm tổ.',
    rarity: 'common',
  ),

  'staravia': PokemonMeta(
    hint: 'Chim nhỏ có sọc, thích bay lượn tìm mồi.',
    lore: 'Loài chim này sống thành đàn lớn, luôn bay lượn khắp rừng cây và cánh đồng. Chúng có đôi mắt tinh anh, luôn để ý tìm kiếm những chú côn trùng nhỏ bé làm thức ăn. Khi bay, chúng tạo nên một khung cảnh vô cùng nhộn nhịp và tràn đầy sức sống, như một tấm thảm bay trên bầu trời xanh.',
    rarity: 'rare',
  ),

  'staraptor': PokemonMeta(
    hint: 'Chim lớn với mào rực rỡ, lao xuống bất chấp kích thước địch.',
    lore: 'Loài chim dũng mãnh này không hề nao núng trước bất kỳ đối thủ nào, dù cho chúng có to lớn hơn nó rất nhiều. Với bản tính hoang dã và lòng can đảm phi thường, nó sẵn sàng lao vào trận chiến, vỗ cánh mạnh mẽ và cất tiếng gáy vang trời báo hiệu cho một cuộc đối đầu quyết liệt. Bộ lông dày và đôi mắt tinh anh giúp nó nhận diện con mồi từ xa, và với tốc độ đáng kinh ngạc, nó trở thành một kẻ săn mồi đáng gờm nơi bầu trời.',
    rarity: 'rare',
  ),

  'bidoof': PokemonMeta(
    hint: 'Chú lật đật bé nhỏ với răng cửa lớn.',
    lore: 'Chú bé này có bộ lông nâu mượt mà và đôi mắt tròn xoe tinh nghịch. Dù nhìn có vẻ chậm chạp, nhưng khi cần, chú có thể di chuyển cực kỳ nhanh nhẹn và khéo léo. Chú rất dũng cảm, không sợ hãi trước bất cứ điều gì và luôn giữ cái đầu lạnh khi đối mặt với thử thách. Món khoái khẩu của chú là những mẩu gỗ nhỏ để gặm.',
    rarity: 'common',
  ),

  'bibarel': PokemonMeta(
    hint: 'Chú hải ly bận rộn, xây đập bằng cành cây và bùn.',
    lore: 'Sinh vật nhỏ bé này nổi tiếng với sự chăm chỉ. Nó thích thú với việc xây dựng những con đập nước chặn dòng chảy của các con suối. Bằng cách sử dụng vỏ cây và bùn đất, nó tạo ra những ngôi nhà chắc chắn và an toàn cho gia đình mình, một công việc đòi hỏi sự kiên nhẫn và khéo léo phi thường.',
    rarity: 'rare',
  ),

  'kricketot': PokemonMeta(
    hint: 'Đôi râu va vào nhau như một chiếc đàn xylophone.',
    lore: 'Sinh vật bé nhỏ này có một thói quen độc đáo: lắc lư đầu của mình tới lui. Khi làm vậy, đôi râu mảnh mai của nó sẽ chạm vào nhau, tạo ra những âm thanh lanh lảnh, vui tai, giống như tiếng nhạc từ một chiếc đàn xylophone.  Âm thanh này không chỉ để giải trí mà còn có thể dùng để giao tiếp với đồng loại hoặc cảnh báo nguy hiểm.  Mặc dù trông có vẻ mong manh, nó rất nhanh nhẹn và có thể di chuyển thoăn thoắt.',
    rarity: 'common',
  ),

  'kricketune': PokemonMeta(
    hint: 'Vũ điệu của đôi cánh, tiếng hót du dương.',
    lore: 'Những con bọ tài năng này có đôi cánh giống con dao, chúng sẽ khoanh lại trước ngực khi cất lên những giai điệu tuyệt đẹp. Chúng có khả năng sáng tác nhạc ngẫu hứng, tạo ra những bản giao hưởng vui tai làm say đắm lòng người. Chúng thường tụ tập cùng nhau, cùng nhau biểu diễn những khúc nhạc du dương, mang đến niềm vui và sự thanh bình cho khu rừng.',
    rarity: 'rare',
  ),

  'shinx': PokemonMeta(
    hint: 'Những sợi lông lấp lánh khi nguy hiểm đến gần.',
    lore: 'Khi cảm nhận thấy điều gì đó nguy hiểm, bộ lông của chú phát sáng rực rỡ. Trong khoảnh khắc đối phương bị lóa mắt bởi ánh sáng ấy, chú nhanh chóng chạy trốn thật xa. Ánh sáng này là một cách để chú bảo vệ bản thân và kịp thời thoát khỏi tình huống nguy hiểm.',
    rarity: 'common',
  ),

  'luxio': PokemonMeta(
    hint: 'Bộ móng vuốt phóng điện, sống theo đàn nhỏ.',
    lore: 'Sinh vật nhỏ bé này có bộ lông màu xanh lam và sọc đen nổi bật. Chúng thường sống cùng nhau trong các nhóm nhỏ, cùng nhau khám phá rừng. Khi cảm thấy bị đe dọa, chúng sẽ huy động sức mạnh điện từ móng vuốt sắc nhọn của mình để tự vệ. Ánh sáng từ móng vuốt của chúng có thể làm tê liệt đối phương trong giây lát, đủ để chúng có thời gian bỏ chạy hoặc trốn thoát.',
    rarity: 'rare',
  ),

  'luxray': PokemonMeta(
    hint: 'Mắt sáng nhìn xuyên màn đêm, bắt mọi thứ ẩn mình.',
    lore: 'Sinh vật này sở hữu đôi mắt phi thường, có khả năng nhìn xuyên qua mọi vật cản, kể cả những nơi tối tăm nhất. Nhờ vậy, nó có thể dễ dàng phát hiện và tóm gọn con mồi đang lẩn trốn phía sau chướng ngại vật, ngay cả khi con mồi nghĩ rằng mình đã an toàn. Sức mạnh này giúp nó trở thành một thợ săn đáng gờm trong vùng.',
    rarity: 'rare',
  ),

  'budew': PokemonMeta(
    hint: 'Trong mùa đông, nó cuộn mình lại như nụ hoa và chờ xuân sang.',
    lore: 'Khi đông lạnh giá ập đến, sinh vật nhỏ bé này khép chặt nụ của mình, ẩn mình bên trong để chống chọi với cái rét buốt. Nó kiên nhẫn chờ đợi từng ngày. Nhưng khi những tia nắng ấm áp của mùa xuân bắt đầu lan tỏa, nụ hoa bé xinh ấy sẽ từ từ hé mở. Cùng với đó là một làn phấn hoa ngọt ngào, mang theo hương sắc của mùa mới, lan tỏa trong không khí, báo hiệu sự sống lại và một khởi đầu tươi đẹp.',
    rarity: 'common',
  ),

  'cranidos': PokemonMeta(
    hint: 'Đầu cứng như sắt, sống trong rừng già 100 triệu năm.',
    lore: 'Một sinh vật cổ xưa từng lang thang trong những khu rừng nhiệt đới cách đây hàng triệu năm. Cái đầu cứng như sắt của nó là vũ khí lợi hại để đập tan mọi thứ trên đường đi. Nó rất mạnh mẽ, dũng cảm và luôn sẵn sàng đối mặt với thử thách.',
    rarity: 'rare',
  ),

  'rampardos': PokemonMeta(
    hint: 'Đầu nó cứng như đá, dùng để đập nát mọi thứ.',
    lore: 'Sinh vật này sở hữu bộ đầu cực kỳ rắn chắc, được dùng như một vũ khí tấn công đầy sức mạnh. Mỗi cú húc mạnh mẽ của nó có thể làm vỡ tan bất cứ vật gì, kể cả những vật liệu kiên cố nhất. Chúng thường sống ở những vùng núi hiểm trở và sử dụng khả năng đặc biệt này để khai thác khoáng sản hoặc bảo vệ lãnh thổ của mình. Mặc dù trông hung dữ, chúng chỉ tấn công khi cảm thấy bị đe dọa.',
    rarity: 'rare',
  ),

  'shieldon': PokemonMeta(
    hint: 'Giáp mặt cứng như đá, sống ở rừng rậm xa xưa.',
    lore: 'Trong những khu rừng rậm rạp cách đây cả trăm triệu năm, có một loài sinh vật với chiếc bộ giáp cực kỳ cứng rắn trên mặt. Chiếc giáp ấy không chỉ giúp nó bảo vệ bản thân khỏi nguy hiểm mà còn là vũ khí lợi hại. Nó thường di chuyển chậm rãi, tập trung vào việc ăn uống và giữ an toàn cho mình. Sống trong môi trường khắc nghiệt thời tiền sử, nó đã tiến hóa để trở thành một chiến binh kiên cường.',
    rarity: 'rare',
  ),

  'bastiodon': PokemonMeta(
    hint: 'Khiên cứng trên mặt, hiền lành ăn cỏ.',
    lore: 'Sinh vật to lớn này có phần đầu tựa như một bức tường đá khổng lồ, sẵn sàng đối mặt với mọi hiểm nguy. Dù sở hữu vẻ ngoài mạnh mẽ, chúng lại vô cùng ôn hòa, dành phần lớn thời gian để gặm những ngọn cỏ non và thưởng thức trái cây mọng nước trong khu rừng yên tĩnh. Chúng di chuyển chậm rãi, bình thản, và thường không gây sự chú ý, trừ khi có kẻ cố gắng tấn công vào mặt chúng.',
    rarity: 'rare',
  ),

  'burmy': PokemonMeta(
    hint: 'Ẩn mình trong chiếc áo khoác cây cỏ để tránh gió.',
    lore: 'Sinh vật nhỏ bé này luôn mang theo một chiếc áo khoác đặc biệt, được làm từ những cành cây và lá cây xung quanh. Nó coi chiếc áo này như ngôi nhà nhỏ của mình, giúp che chắn khỏi cái lạnh buốt của những cơn gió mùa đông. Khi lớn lên, hình dáng chiếc áo khoác này có thể thay đổi, mang đến một diện mạo mới mẻ nhưng vẫn giữ nguyên bản chất bảo vệ ấm áp.',
    rarity: 'rare',
  ),

  'wormadam': PokemonMeta(
    hint: 'Mặc áo khoác bằng lá cây, giữ ấm quanh năm.',
    lore: 'Khi lớn lên, chiếc lá Burmy dùng để che chắn đã hòa quyện vào cơ thể, trở thành một phần không thể tách rời. Chiếc áo khoác này luôn được giữ gìn cẩn thận, thay đổi màu sắc và hình dáng theo môi trường sống. Nó không chỉ là trang phục mà còn là nơi trú ẩn an toàn, giúp Pokémon này thích nghi với mọi điều kiện thời tiết.',
    rarity: 'rare',
  ),

  'mothim': PokemonMeta(
    hint: 'Cánh bướm lớn, ưa ngọt, thích trộm mật.',
    lore: 'Sinh vật bé nhỏ này rất thích những giọt mật ngọt ngào từ các loài hoa. Đôi khi, nó còn nghịch ngợm đi ăn trộm mật ong mà những chú kiến ba-vàng đã chăm chỉ gom góp. Với đôi cánh mạnh mẽ, nó có thể bay đi khắp nơi để tìm kiếm những bông hoa thơm nhất và hút mật thơm ngon.',
    rarity: 'rare',
  ),

  'combee': PokemonMeta(
    hint: 'Ba chú nhỏ cùng nhau bay lượn.',
    lore: 'Sinh vật nhỏ bé này là một tổ hợp của ba cá thể độc đáo. Chúng bận rộn thu thập mật hoa ngọt ngào, mang về cho Nữ Hoàng Ong. Cả đàn làm việc không ngừng nghỉ, đảm bảo nguồn thức ăn dồi dào cho Nữ Hoàng và những chú ong non. Phong thái chăm chỉ và đoàn kết là điều luôn khiến người ta nhớ đến chúng.',
    rarity: 'rare',
  ),

  'vespiquen': PokemonMeta(
    hint: 'Ong chúa với bệ hạ ong nhỏ xung quanh.',
    lore: 'Nữ hoàng ong có một chiếc bụng đặc biệt, giống như một tổ ong thu nhỏ. Cô ấy chăm sóc những con ấu trùng của mình tại đây. Mật ngọt mà cô ấy dùng để nuôi chúng được những người hầu cận, đàn ong Combee, cần mẫn thu thập từ khắp nơi. Cô ấy sẽ không bao giờ bỏ rơi những đứa con bé bỏng của mình.',
    rarity: 'rare',
  ),

  'buizel': PokemonMeta(
    hint: 'Sinh vật có túi khí nổi như vòng cổ nở ra.',
    lore: 'Khi bơi lội, nó sử dụng một chiếc túi đặc biệt nằm ở cổ để nổi trên mặt nước. Chiếc túi này có thể phồng lên như một chiếc phao cứu sinh giúp nó giữ thăng bằng và nhô đầu lên khỏi mặt nước dễ dàng. Nhờ vậy, nó có thể quan sát xung quanh khi đang bơi hoặc nghỉ ngơi trên mặt nước, trông rất tinh nghịch và đáng yêu.',
    rarity: 'common',
  ),

  'floatzel': PokemonMeta(
    hint: 'Cái phao màu vàng, bơi nhanh như gió.',
    lore: 'Sinh vật biển này có một chiếc túi đặc biệt giúp nó nổi trên mặt nước một cách dễ dàng. Chúng là những người bạn tốt bụng, sẵn sàng lao xuống làn nước để giúp đỡ những người gặp nạn. Với tốc độ bơi đáng kinh ngạc, chúng có thể tiếp cận và đưa mọi người vào bờ một cách an toàn.',
    rarity: 'rare',
  ),

  'cherubi': PokemonMeta(
    hint: 'Quả nhỏ trên đầu tròn và hay cười.',
    lore: 'Bóng tròn nhỏ bé trên đầu chứa đầy dinh dưỡng để giúp nó phát triển. Vị ngọt ngào của nó rất hấp dẫn, mang lại niềm vui cho bất cứ ai nếm thử. Nó thích tắm nắng và đôi khi rơi xuống đất từ cành cây nhỏ.',
    rarity: 'common',
  ),

  'cherrim': PokemonMeta(
    hint: 'Hoa mặt trời nở rộ khi nắng ấm.',
    lore: 'Nó là linh hồn của những ngày nắng đẹp. Khi ánh mặt trời rạng rỡ, nó trút bỏ vẻ ngoài uể oải của nụ hoa để khoe sắc, như muốn bù đắp cho mọi thời gian khó khăn khi còn bé bỏng. Nó tận hưởng từng tia nắng, nhảy múa và lan tỏa niềm vui.',
    rarity: 'rare',
  ),

  'shellos': PokemonMeta(
    hint: 'Sinh vật màu sắc khác nhau, hình dáng tùy vùng.',
    lore: 'Loài sinh vật này sở hữu vẻ ngoài vô cùng đa dạng, màu sắc và hình dáng của chúng thay đổi tùy thuộc vào khu vực mà chúng sinh sống. Tại vùng Sinnoh, người ta đã ghi nhận được hai dạng khác nhau của chúng.  Chúng thường sống ở những nơi gần biển hoặc ở những vũng nước đọng. Khi gặp nguy hiểm, chúng có thể phun ra một loại chất lỏng có vị mặn từ cơ thể.',
    rarity: 'common',
  ),

  'gastrodon': PokemonMeta(
    hint: 'Cơ thể mềm dẻo, có thể mọc lại khi bị đứt',
    lore: 'Sinh vật biển với thân hình mềm mại, không có xương. Nếu bất kỳ bộ phận nào của chúng bị tách ra, chúng có khả năng tái tạo lại hoàn toàn. Chúng thích sống ở những vùng nước nông, đầm lầy hoặc bờ biển.',
    rarity: 'rare',
  ),

  'drifloon': PokemonMeta(
    hint: 'Bóng bay tím, nhẹ nhàng trôi dạt trong gió.',
    lore: 'Nó được tạo nên từ những linh hồn nhỏ bé, vui đùa trong không khí ẩm ướt. Với vẻ ngoài như một quả bóng bay màu tím, nó thích lơ lửng trên cao, thường xuất hiện nhiều vào những mùa mưa. Đôi khi, nó dụ dỗ trẻ em đi theo bằng cách trao cho chúng một chiếc kẹo nhỏ, nhưng hãy cẩn thận, bạn có thể bị cuốn đi cùng nó tới một nơi xa lạ đấy!',
    rarity: 'rare',
  ),

  'drifblim': PokemonMeta(
    hint: 'Một quả bóng bay màu tím trôi bồng bềnh trên trời.',
    lore: 'Khi hoàng hôn buông xuống, hàng đàn sinh vật giống quả bóng bay này sẽ cùng nhau bay lên cao theo gió. Chúng có vẻ ngoài nhẹ nhàng, trôi dạt khắp nơi. Điểm đặc biệt là khi ai đó nhìn thấy chúng, chúng sẽ đột ngột biến mất không một dấu vết, khiến người ta chỉ còn thấy sự trống rỗng nơi chúng từng ở.',
    rarity: 'rare',
  ),

  'buneary': PokemonMeta(
    hint: 'Tai em cuộn tròn, vung lên mạnh mẽ.',
    lore: 'Chú thỏ nhỏ đáng yêu này có đôi tai dài, luôn được cuộn chặt. Mỗi khi chiến đấu, em sẽ xoay người mạnh mẽ, bung ra đôi tai của mình như những chiếc roi. Đòn đánh tuy bất ngờ nhưng lại rất đau, khiến đối thủ phải ôm đầu kêu trời. Em thích chạy nhảy trên đồng cỏ, tìm kiếm những thứ ngon lành để thưởng thức.',
    rarity: 'common',
  ),

  'lopunny': PokemonMeta(
    hint: 'Bộ lông mềm mại như mây, luôn cảnh giác',
    lore: 'Khi cảm thấy có nguy hiểm, sinh vật bé nhỏ này sẽ dùng đôi tai bông xù của mình để che chắn cơ thể. Chúng rất hiếu động và có thể chạy với tốc độ đáng kinh ngạc. Đôi chân khỏe mạnh cho phép chúng nhảy cao và xa, đôi khi còn đá mạnh để bảo vệ bản thân. Chúng thích sống ở những nơi có nhiều cây xanh và cỏ tươi tốt.',
    rarity: 'rare',
  ),

  'glameow': PokemonMeta(
    hint: 'Mèo ta có vuốt sắc nhọn và tiếng gừ dịu êm.',
    lore: 'Chú mèo này có tính cách thất thường, lúc thì vồ vập đòi âu yếm, lúc thì gầm gừ khó chịu. Tuy vậy, sự đỏng đảnh đáng yêu của nó lại chinh phục được rất nhiều người yêu động vật. Chúng rất thích được vuốt ve và thưởng cho chủ nhân những tiếng gừ khe khẽ khi cảm thấy vui vẻ.',
    rarity: 'common',
  ),

  'purugly': PokemonMeta(
    hint: 'Mèo mập, hung hăng chiếm tổ của kẻ khác.',
    lore: 'Một kẻ mạnh mẽ không ngại xông vào lãnh thổ của Pokémon khác để chiếm lấy tổ ấm. Chúng tự cho mình là kẻ thống trị và không ngần ngại dùng sức mạnh để đạt được điều mình muốn. Với vẻ ngoài bệ vệ, chúng ắt hẳn là những kẻ trông giữ lãnh địa oai phong, không ai dám bén mảng.',
    rarity: 'rare',
  ),

  'chingling': PokemonMeta(
    hint: 'Chú chim nhỏ tung tăng hót vang.',
    lore: 'Chú chim nhỏ đáng yêu này tạo ra tiếng kêu bằng cách rung rinh một viên ngọc nhỏ trong cổ họng. Khi di chuyển, nó thường nhảy nhót vui vẻ. Âm thanh của nó thật vui tai và dường như mang lại niềm vui cho mọi người xung quanh. Chú thường được tìm thấy ở những nơi có nhiều hoa và cây xanh, thể hiện sự hồn nhiên và trong sáng của mình.',
    rarity: 'rare',
  ),

  'chimecho': PokemonMeta(
    hint: 'Chuông nhỏ có cánh, phát ra âm thanh du dương.',
    lore: 'Khi vui vẻ, nó ngân nga những giai điệu êm dịu làm mọi người xung quanh cảm thấy thư thái. Nhưng khi tức giận, tiếng kêu của nó trở nên dữ dội, tạo ra những sóng âm mạnh mẽ có thể khiến đối thủ bay lơ lửng. Cơ thể rỗng của nó cộng hưởng làm âm thanh vang xa, lan tỏa khắp nơi.',
    rarity: 'rare',
  ),

  'stunky': PokemonMeta(
    hint: 'Chú bé béo ú có đuôi bốc mùi khó chịu.',
    lore: 'Khi cảm thấy nguy hiểm, sinh vật nhỏ bé này sẽ tung ra một chất lỏng cực kỳ hôi hám từ phần sau của mình. Mùi hương này có thể bám lại trong không khí và trên mọi thứ trong suốt một ngày dài, khiến kẻ thù bỏ chạy xa lắc. Mặc dù có vẻ ngoài hơi mũm mĩm, sinh vật này khá nhanh nhẹn khi cần thiết để tự vệ.',
    rarity: 'common',
  ),

  'skuntank': PokemonMeta(
    hint: 'Będzie trzymać swoją pachnącą broń z daleka.',
    lore: 'Smrodek jest znany z tego, że używa swojej toksycznej broni by trzymać z daleka niechcianych gości, nawet z dużej odległości. Zapach jest tak nieprzyjemny, że nawet odporne na zapachy stworzenia trzymają się z daleka. Ze względu na jego nieprzyjemny zapach i obronne instynkty, ludzie lubią go nazywać "brudnym smrodem".',
    rarity: 'rare',
  ),

  'bronzor': PokemonMeta(
    hint: 'Mặt tròn, kim loại, thường thấy trong các di tích cổ.',
    lore: 'Vật thể tròn, bóng loáng này được tìm thấy trong các hầm mộ cổ xưa. Chúng có một vẻ ngoài bí ẩn, giống như những món đồ tạo tác bị lãng quên. Có người cho rằng chúng có khả năng làm cho mọi thứ xung quanh trở nên yên tĩnh.  Không ai biết liệu những vật thể này có liên quan gì đến nhau không.',
    rarity: 'common',
  ),

  'bronzong': PokemonMeta(
    hint: 'Tấm khiên cổ xưa, phát ra âm thanh kỳ lạ.',
    lore: 'Một hiện vật bí ẩn, bị chôn vùi dưới lòng đất suốt hai nghìn năm, đã gây chấn động khi được phát hiện tại công trường xây dựng.  Người ta đồn rằng nó mang theo sức mạnh của quá khứ xa xưa và có thể ảnh hưởng đến mọi thứ xung quanh.',
    rarity: 'rare',
  ),

  'gible': PokemonMeta(
    hint: 'Chú rồng nhỏ thích đào hang săn mồi.',
    lore: 'Sinh vật nhỏ bé này thích làm tổ trong những cái hang nhỏ ngang trên vách hang động. Khi thấy con mồi lảng vảng lại gần, nó sẽ lao tới vồ lấy. Vẻ ngoài nhỏ nhắn nhưng lại rất nhanh nhẹn và dũng cảm.',
    rarity: 'rare',
  ),

  'gabite': PokemonMeta(
    hint: 'Rồng nhỏ màu xanh, có vây đỏ dưới cánh.',
    lore: 'Người ta tin rằng các bài thuốc làm từ vảy của loài sinh vật này có thể chữa lành mọi bệnh tật, kể cả những căn bệnh nan y nhất. Chúng có tính cách hung dữ, hay tấn công mọi thứ trên đường đi, nhưng lại rất trung thành với huấn luyện viên của mình. Chúng có thể bay với tốc độ cực nhanh, vượt qua cả máy bay phản lực.',
    rarity: 'rare',
  ),

  'garchomp': PokemonMeta(
    hint: 'Giống máy bay phản lực lao vút',
    lore: 'Khi thu mình và dang cánh, nó trông như một chiếc máy bay phản lực. Nó bay với tốc độ âm thanh, lao qua bầu trời như một mũi tên bạc. Những chiếc vây sắc nhọn giúp nó cắt xuyên không khí một cách dễ dàng. Nó là một sinh vật mạnh mẽ và tự tin, sẵn sàng lao vào bất kỳ thử thách nào trên không.',
    rarity: 'rare',
  ),

  'riolu': PokemonMeta(
    hint: 'Chú chó nhỏ màu xanh có cái mào như đấm.',
    lore: 'Chú chó nhỏ này có bản năng nhạy bén, cảm nhận được nguy hiểm và buồn bã. Khi cảm thấy sợ hãi, vầng hào quang quanh nó sẽ mạnh mẽ hơn để cảnh báo mọi người xung quanh. Nó rất thích chơi đùa và ủ ấm khi ngủ, cuộn tròn lại như một cục bông.',
    rarity: 'rare',
  ),

  'lucario': PokemonMeta(
    hint: 'Chú chó mạnh mẽ với đôi tai vểnh và tinh thần chiến đấu.',
    lore: 'Sinh vật này có khả năng nhìn thấy hào quang, là những luồng năng lượng phát ra từ mọi sinh vật sống. Nó có thể hiểu được lời nói của con người và đôi khi còn giao tiếp lại bằng cách sử dụng hào quang của mình. Nó luôn sẵn sàng chiến đấu để bảo vệ những người nó quan tâm, sử dụng những cú đấm được bao bọc bởi năng lượng mạnh mẽ.',
    rarity: 'rare',
  ),

  'hippopotas': PokemonMeta(
    hint: 'Sinh vật bé nhỏ thích sa mạc, thở ra cát.',
    lore: 'Loài sinh vật nhỏ bé này thích nghi với cuộc sống ở những vùng đất khô cằn. Thay vì đổ mồ hôi, nó thải ra những hạt cát mịn màng từ khắp cơ thể, giúp nó giữ mát và hòa mình vào môi trường xung quanh. Chúng thường ẩn mình dưới lớp cát để tránh cái nóng gay gắt của mặt trời, chỉ lộ ra đôi mắt tròn xoe tò mò.',
    rarity: 'rare',
  ),

  'hippowdon': PokemonMeta(
    hint: 'Cát phun từ người tạo ra lốc xoáy.',
    lore: 'Sinh vật khổng lồ này có khả năng tích trữ một lượng lớn cát bên trong cơ thể. Khi tức giận hoặc cảm thấy bị đe dọa, nó sẽ phun luồng cát mạnh mẽ qua các lỗ nhỏ trên thân, tạo thành những cơn lốc xoáy dữ dội để tấn công kẻ thù. Những cơn bão cát này có thể che khuất cả bầu trời.',
    rarity: 'rare',
  ),

  'skorupi': PokemonMeta(
    hint: 'Kẹp chặt con mồi bằng đuôi độc, không bao giờ nhả.',
    lore: 'Loài sinh vật nhỏ bé này ẩn mình trong bụi rậm, chờ đợi con mồi. Khi có cơ hội, nó sẽ dùng những chiếc móng vuốt sắc nhọn ở đuôi để tóm chặt con mồi, rồi tiêm nọc độc mạnh mẽ. Nó sẽ bám chặt không buông, kiên trì chờ đợi cho đến khi nọc độc phát huy hết tác dụng, làm tê liệt hoàn toàn con mồi bé bỏng.',
    rarity: 'rare',
  ),

  'drapion': PokemonMeta(
    hint: 'Cánh tay khỏe, vuốt sắc nhọn phóng độc.',
    lore: 'Sinh vật mạnh mẽ với đôi cánh tay cơ bắp, có thể nghiền nát ô tô. Đầu vuốt của nó tiết ra chất độc chết người, cảnh báo kẻ thù đừng lại gần. Nó lang thang trong những vùng đất cằn cỗi, một kẻ săn mồi đáng gờm mà ai cũng phải dè chừng.',
    rarity: 'rare',
  ),

  'croagunk': PokemonMeta(
    hint: 'Chú ếch nhỏ với cặp má sưng phồng.',
    lore: 'Chú ếch nhỏ này có hai túi độc ở hai má. Nó thích làm đối thủ bất ngờ bằng cách dùng những ngón tay chứa đầy chất độc đâm vào họ. Cặp má của nó trông như đang phồng lên, sẵn sàng nhả ra những làn khói độc khó chịu. Đừng để vẻ ngoài bé nhỏ đánh lừa, sức mạnh của nó tiềm ẩn rất lớn.',
    rarity: 'rare',
  ),

  'toxicroak': PokemonMeta(
    hint: 'Nắm đấm có gai chứa chất độc mạnh',
    lore: 'Sinh vật này có chiếc bờm màu hồng trên đầu và chiếc cổ to. Khi tức giận, nó gầm lên và đấm vào không khí hai lần để cảnh báo đối thủ. Chất độc trong móng vuốt của nó rất nguy hiểm, chỉ cần một vết xước nhỏ cũng có thể gây tử vong. Nó thích sống ở những vùng nước đầm lầy.',
    rarity: 'rare',
  ),

  'finneon': PokemonMeta(
    hint: 'Cánh đuôi có hoa văn lấp lánh khi trời tối.',
    lore: 'Sinh vật nhỏ bé này thích tắm nắng vào ban ngày. Khi mặt trời lặn, những hoa văn trên vây đuôi của nó sẽ tỏa sáng rực rỡ trong bóng tối, như thể chúng đang tích trữ ánh sáng mặt trời. Chúng thường bơi theo đàn, tạo nên một cảnh tượng lung linh huyền ảo dưới đáy biển.',
    rarity: 'common',
  ),

  'lumineon': PokemonMeta(
    hint: 'Đôi vây rực sáng thu hút con mồi dưới đáy biển.',
    lore: 'Sinh vật huyền bí này cư ngụ ở vực sâu thăm thẳm, nơi ánh sáng mặt trời không bao giờ chạm tới. Cơ thể nó được tô điểm bởi những hoa văn kỳ lạ trên bốn chiếc đuôi, chúng có khả năng phát sáng lung linh như những vì sao chìm dưới nước.  Chính nhờ những màn trình diễn ánh sáng huyền ảo này mà nó có thể dụ dỗ những sinh vật nhỏ bé đang bơi lội xung quanh, mang đến cho nó bữa ăn ngon lành trong bóng tối vĩnh cửu.',
    rarity: 'rare',
  ),

  'snover': PokemonMeta(
    hint: 'Cái cây nhỏ phủ đầy tuyết, thích khám phá.',
    lore: 'Sinh vật đáng yêu này sống trên những đỉnh núi phủ đầy tuyết trắng xóa. Vì ít khi gặp người, nó rất tò mò và dũng cảm khám phá mọi thứ xung quanh. Đôi khi, nó còn lén lút đến gần để xem con người đang làm gì nữa đấy! Nếu bạn thấy một cây nhỏ có dáng vẻ dễ thương, hãy thử bắt chuyện xem sao.',
    rarity: 'rare',
  ),

  'abomasnow': PokemonMeta(
    hint: 'Người tuyết khổng lồ với cây trên lưng',
    lore: 'Một sinh vật to lớn sống trên đỉnh núi tuyết vĩnh cửu. Nó có thể tạo ra những cơn bão tuyết dữ dội chỉ bằng một cái vẫy tay. Truyền thuyết kể rằng nó là hiện thân của mùa đông lạnh giá, mang đến sự giá rét cho những vùng đất nó đi qua. Những người leo núi thường nghe thấy tiếng gầm rú của nó vọng lại từ những đỉnh núi xa xôi.',
    rarity: 'rare',
  ),

  'snivy': PokemonMeta(
    hint: 'Rắn xanh lá, đôi mắt to tròn, uyển chuyển.',
    lore: 'Khi ánh nắng mặt trời tràn đầy, chú rắn xanh lá này trở nên nhanh nhẹn và uyển chuyển lạ thường. Làn da xanh mướt của chú hấp thụ năng lượng từ ánh sáng, giúp chú di chuyển thoăn thoắt và né tránh kẻ thù. Tính cách điềm tĩnh và thông minh giúp chú luôn quan sát xung quanh, tìm kiếm cơ hội hoặc tránh xa nguy hiểm. Có lẽ, đó là cách chú giữ gìn sự cân bằng trong thế giới hoang dã.',
    rarity: 'rare',
  ),

  'servine': PokemonMeta(
    hint: 'Thân hình mềm mại lướt đi thoăn thoắt, ẩn mình trong cỏ.',
    lore: 'Sinh vật này sở hữu thân hình uyển chuyển, nhanh nhẹn lao vun vút trên mặt đất tựa như đang trượt đi.  Mỗi bước di chuyển thoăn thoắt như làn gió của nó khiến đối thủ khó lòng định đoán.  Khi kẻ địch còn đang bối rối, nó bất ngờ vung những chiếc roi mềm mại, tấn công chớp nhoáng đầy hiệu quả.  Nó thường ẩn mình trong những bụi cây rậm rạp, chờ đợi thời cơ thích hợp để ra đòn.',
    rarity: 'rare',
  ),

  'serperior': PokemonMeta(
    hint: 'Rắn xanh lá cây có sọc và vương miện.',
    lore: 'Sinh vật này có sức mạnh đáng kinh ngạc, chỉ cần nhìn chằm chằm là có thể khiến đối thủ bất động. Mỗi khi mặt trời chiếu sáng, nó sẽ hấp thụ năng lượng, tích trữ và tăng cường sức mạnh bên trong. Từ đó, nó có thể tung ra những đòn tấn công mạnh mẽ hơn, khiến mọi kẻ thù phải dè chừng. Nó thường xuất hiện ở những nơi có nhiều ánh nắng để đón nhận nguồn năng lượng dồi dào.',
    rarity: 'rare',
  ),

  'tepig': PokemonMeta(
    hint: 'Chú heo nhỏ phun lửa, né đòn nhanh nhẹn. Chú thích đồ nướng.',
    lore: 'Chú heo ấm áp rất thích tự tay chế biến thức ăn của mình. Chú có thể tung ra những quả cầu lửa nhỏ xíu từ mũi, vừa để tự vệ, vừa để nướng những loại trái cây ngon lành trước khi thưởng thức. Chú rất khéo léo trong việc né tránh các đòn tấn công của đối thủ, giữ cho mình an toàn trong khi đối phó với những kẻ muốn làm phiền chú. Với bộ lông mềm mại, chú luôn cảm thấy dễ chịu ngay cả trong mùa đông lạnh giá nhờ hơi ấm tỏa ra từ cơ thể.',
    rarity: 'rare',
  ),

  'pignite': PokemonMeta(
    hint: 'Lửa rực cháy, bước chân linh hoạt, phun khói lúc nguy nan.',
    lore: 'Chú heo lửa này có một bếp lò bên trong cơ thể, khi nó bùng cháy, mọi hành động trở nên nhanh nhẹn và sắc bén hơn. Nếu cảm thấy khó khăn hoặc bị đe dọa, chú sẽ phun ra những làn khói dày đặc để che mắt đối phương và tìm đường thoát thân. Đôi khi, khói này còn mang theo mùi hương đặc trưng, báo hiệu sự hiện diện của nó cho những ai tinh ý nhận ra.',
    rarity: 'rare',
  ),

  'emboar': PokemonMeta(
    hint: 'Chú heo có mào lửa và nắm đấm rực cháy.',
    lore: 'Loài heo lửa này có thể tung ra những cú đấm nóng bỏng bằng cách đốt cháy nắm đấm của mình bằng chiếc cằm rực lửa. Nó là một người bạn rất trung thành và luôn bảo vệ những người mình yêu thương. Với sức mạnh phi thường, nó chiến đấu hết mình vì bạn bè.',
    rarity: 'rare',
  ),

  'oshawott': PokemonMeta(
    hint: 'Chú hải cẩu nhỏ với chiếc vỏ sò trên bụng sẵn sàng tấn công.',
    lore: 'Sinh vật bé nhỏ này có một chiếc "vảy" độc đáo nằm ở bụng, là vũ khí chính của nó để chiến đấu. Khi bị tấn công, nó sẽ không ngần ngại phản ứng lại ngay lập tức bằng một cú chém sắc bén. Chiếc vảy này không chỉ dùng để tấn công mà còn có thể bảo vệ nó khỏi những đòn hiểm độc của đối thủ. Mỗi khi chiến đấu, nó luôn thể hiện sự nhanh nhẹn và dũng cảm đáng kinh ngạc.',
    rarity: 'rare',
  ),

  'dewott': PokemonMeta(
    hint: 'Bộ chiến binh có hai vỏ sò sắc bén.',
    lore: 'Chú huấn luyện nghiêm khắc để làm chủ kỹ thuật sử dụng song kiếm vỏ sò điêu luyện. Khi chiến đấu, nó sử dụng hai vỏ sò nhô ra từ hai bên mang để tấn công và phòng thủ. Những chuyển động của nó uyển chuyển như dòng nước, khiến đối thủ khó lòng chống đỡ. Mỗi nhát chém đều dứt khoát và mạnh mẽ, thể hiện sự tập trung cao độ.',
    rarity: 'rare',
  ),

  'samurott': PokemonMeta(
    hint: 'Vua hải quân với thanh kiếm sắc bén.',
    lore: 'Sinh vật mạnh mẽ này trị vì biển cả với vẻ uy nghi đáng sợ. Thanh kiếm gắn trên giáp của nó có thể kết liễu đối thủ chỉ bằng một nhát chém. Ánh mắt sắc lạnh của nó đủ sức khiến mọi kẻ xung quanh im bặt, thể hiện uy quyền tuyệt đối.',
    rarity: 'rare',
  ),

  'patrat': PokemonMeta(
    hint: 'Chú sóc nhỏ với túi má phồng',
    lore: 'Sinh vật này có thể canh gác suốt nhiều ngày nhờ thức ăn dự trữ trong túi má. Chúng giao tiếp với đồng loại bằng cách vẫy đuôi, tạo ra những tín hiệu bí ẩn trong rừng sâu. Khi cảm thấy nguy hiểm, chúng sẽ nhanh chóng ẩn mình trong bụi cây hoặc đào hang trú ẩn. Chúng rất thân thiện và thích chơi đùa cùng nhau.',
    rarity: 'common',
  ),

  'watchog': PokemonMeta(
    hint: 'Tai dựng đứng, bắn hạt từ má.',
    lore: 'Khi phát hiện kẻ thù, chiếc đuôi của nó sẽ dựng thẳng lên cao. Sau đó, nó sẽ nhả những hạt quả mọng đã tích trữ trong túi má của mình về phía kẻ địch. Loài Pokémon này có khả năng nhìn xa và rất cảnh giác, giúp chúng tránh được nguy hiểm.',
    rarity: 'common',
  ),

  'lillipup': PokemonMeta(
    hint: 'Bộ lông mềm mại, đôi tai vểnh đáng yêu.',
    lore: 'Chú chó nhỏ này nổi tiếng với lòng dũng cảm khi đối đầu với kẻ thù mạnh mẽ. Tuy nhiên, khi tình thế bất lợi và không có cơ hội chiến thắng, trí thông minh của nó sẽ mách bảo nên nhanh chóng rút lui để bảo toàn bản thân. Nó luôn sẵn sàng chiến đấu hết mình.',
    rarity: 'common',
  ),

  'herdier': PokemonMeta(
    hint: 'Lông đen dày như áo choàng, chiến đấu dũng cảm.',
    lore: 'Sinh vật này có bộ lông đen đặc biệt, trông như một chiếc áo choàng quanh mình. Nó không chỉ đẹp mà còn rất cứng cáp, giúp giảm bớt sát thương khi chiến đấu với kẻ thù. Chúng rất trung thành và sẵn sàng bảo vệ bạn bè bằng mọi giá. Bộ lông này cũng giúp chúng giữ ấm trong những ngày lạnh giá.',
    rarity: 'rare',
  ),

  'stoutland': PokemonMeta(
    hint: 'Cục bông ấm áp, giúp người trong tuyết.',
    lore: 'Chú chó lớn có bộ lông dày và mềm mại, luôn sẵn sàng giúp đỡ những người bị lạc trong những vùng núi phủ đầy tuyết. Bộ lông đặc biệt này không chỉ giúp giữ ấm cho chú mà còn che chắn hiệu quả khỏi những cơn gió lạnh buốt, biến chú thành một người bạn đồng hành đáng tin cậy trong điều kiện khắc nghiệt.',
    rarity: 'rare',
  ),

  'purrloin': PokemonMeta(
    hint: 'Mèo nhỏ này thích trêu chọc và lấy đồ của bạn.',
    lore: 'Bạn không thể nào giận được bạn nhỏ này đâu! Với vẻ ngoài đáng yêu như thiên thần, chúng rất giỏi giả vờ ngây thơ. Dù đôi khi tinh nghịch và lấy đi thứ gì đó của bạn, nhưng chỉ cần nhìn vào đôi mắt to tròn ấy là bạn lại mềm lòng. Chúng thích đùa giỡn và khiến mọi người bật cười, đôi khi là vì những trò nghịch ngợm đáng yêu của mình.',
    rarity: 'common',
  ),

  'liepard': PokemonMeta(
    hint: 'Nhanh nhẹn, ẩn mình, bộ lông mượt óng ánh.',
    lore: 'Loài Pokémon này có khả năng biến mất và xuất hiện một cách bất ngờ, khiến nhiều người không kịp trở tay. Sự uyển chuyển trong từng cử động cùng với bộ lông óng ả, lấp lánh dưới ánh sáng là điều khiến biết bao huấn luyện viên say mê và muốn sở hữu. Chúng thường ẩn mình trong bóng tối, chỉ lộ diện khi cảm thấy an toàn hoặc muốn thể hiện sự bí ẩn của mình.',
    rarity: 'rare',
  ),

  'pansage': PokemonMeta(
    hint: 'Tóc lá, thích ẩn mình trong rừng sâu.  Cắn nhẹ lá trên đầu xua tan mệt mỏi.',
    lore: 'Sinh sống trong những tán rừng rậm rạp, nơi ánh mặt trời khó lòng lọt qua. Loài cây nhỏ bé này có một khả năng kỳ diệu: chiếc lá trên đầu nó, khi được nếm thử, có thể xóa tan mọi cảm giác mệt mỏi, mang lại sự sảng khoái như một phép màu. Chúng thường ẩn mình và chỉ lộ diện khi cảm thấy an toàn, mang theo sự tĩnh lặng của khu rừng.',
    rarity: 'common',
  ),

  'simisage': PokemonMeta(
    hint: 'Uông lưỡi cây với đuôi gai nhọn, hay nổi nóng.',
    lore: 'Sinh vật này rất dễ nổi giận, nó tấn công bằng cách vung chiếc đuôi có gai của mình một cách điên cuồng. Chiếc lá trên đầu nó có vị rất đắng. Nó là một loài Pokémon sống trong rừng rậm, nơi nó dùng chiếc đuôi của mình để đánh đuổi kẻ thù và lấy thức ăn. Màu xanh trên người nó giúp nó hòa mình với thiên nhiên.',
    rarity: 'rare',
  ),

  'pansear': PokemonMeta(
    hint: 'Tóc trên đầu bé có thể nóng bỏng.',
    lore: 'Khi chú bé này nổi giận, lọn tóc trên đầu sẽ nóng như lửa, tới 600 độ F! Chú dùng mớ tóc nóng bỏng đó để nướng những trái cây mọng nước, biến chúng thành món ăn tuyệt ngon. Hình dáng nhỏ bé nhưng ẩn chứa sức nóng bất ngờ đấy nhé!',
    rarity: 'common',
  ),

  'simisear': PokemonMeta(
    hint: 'Vẻ ngoài giống khỉ, thích ăn đồ ngọt, tạo lửa bên trong.',
    lore: 'Chú linh vật này yêu đồ ngọt lắm vì chúng cung cấp năng lượng cho ngọn lửa luôn cháy trong cơ thể. Khi vui vẻ, ngọn lửa này càng bùng cháy mạnh mẽ hơn, tỏa ra hơi ấm. Chú linh vật này thường nhảy múa xung quanh khi tìm thấy những món tráng miệng ngon tuyệt.',
    rarity: 'rare',
  ),

  'panpour': PokemonMeta(
    hint: 'Chú khỉ bé nhỏ với túm tóc xanh, thích chơi đùa cùng nước.',
    lore: 'Chú Pokémon này có một túm trên đầu chứa đầy nước bổ dưỡng. Khi tưới cho cây cối bằng chất lỏng quý giá, chúng sẽ phát triển vô cùng xanh tốt và khỏe mạnh. Sinh vật nhỏ nhắn này rất thích giúp đỡ thế giới xung quanh mình.',
    rarity: 'common',
  ),

  'simipour': PokemonMeta(
    hint: 'Bộ tóc trên đầu chứa đầy nước',
    lore: 'Sinh vật này có một chỏm lông trên đầu, nơi nó chứa nước. Khi lượng nước trong chỏm cạn dần, nó sẽ dùng chiếc đuôi của mình để hút thêm nước từ môi trường xung quanh, duy trì sự tươi mát cho bộ tóc.  Đây là một thói quen sinh hoạt đặc trưng giúp nó luôn dễ chịu, đặc biệt là trong những ngày nắng nóng.  Chiếc đuôi của nó rất linh hoạt, có khả năng thực hiện cả việc giữ thăng bằng và bơm nước một cách khéo léo.',
    rarity: 'rare',
  ),

  'munna': PokemonMeta(
    hint: 'Sinh vật màu hồng nhỏ bé, biết bay, ngủ say.',
    lore: 'Loài Pokémon này luôn lơ lửng trên không trung. Chúng có khả năng ăn những giấc mơ của con người. Những người bị chúng ăn mất giấc mơ sẽ quên đi toàn bộ nội dung của giấc mơ đó. Khi nó ăn giấc mơ, nó dường như đang ngủ một giấc thật ngon.',
    rarity: 'common',
  ),

  'musharna': PokemonMeta(
    hint: 'Thoáng thấy nó, giấc mơ sẽ hiện lên.',
    lore: 'Loài sinh vật hiền lành này tỏa ra một làn sương mờ ảo. Làn sương ấy chứa đựng những giấc mơ đẹp đẽ nhất của mọi người và cả những người bạn Pokémon. Chúng mang đến sự bình yên và xua tan đi những cơn ác mộng. Nếu bạn gặp chúng, hãy nghĩ về những điều vui vẻ, vì chúng sẽ giúp giấc mơ của bạn thêm lung linh.',
    rarity: 'rare',
  ),

  'pidove': PokemonMeta(
    hint: 'Chú chim nhỏ màu xám, hay làm theo lời người huấn luyện.',
    lore: 'Loài chim nhỏ bé này rất chăm chỉ làm theo mệnh lệnh của người huấn luyện. Tuy nhiên, đôi khi chúng gặp khó khăn trong việc hiểu các yêu cầu phức tạp. Chúng thích sống thành đàn và luôn cố gắng hết sức để làm vui lòng người bạn đồng hành của mình. Đôi cánh nhỏ bé của chúng giúp chúng bay lượn nhẹ nhàng trên bầu trời.',
    rarity: 'common',
  ),

  'tranquill': PokemonMeta(
    hint: 'Chú chim này có thể về nhà dù đi xa đến đâu.',
    lore: 'Sinh vật này có đôi cánh uyển chuyển và khả năng phi thường để tìm đường về với người huấn luyện của mình, dù cho khoảng cách có xa đến bao nhiêu. Nó có thể bay lượn trên bầu trời, cảm nhận được phương hướng một cách kỳ lạ, luôn hướng về nơi mà trái tim (và người bạn đồng hành) của nó thuộc về. Sự gắn kết này thật đáng kinh ngạc, biến nó thành một người bạn đồng hành đáng tin cậy trong mọi cuộc phiêu lưu.',
    rarity: 'rare',
  ),

  'unfezant': PokemonMeta(
    hint: 'Chim trống múa lông cổ, chim mái bay giỏi.',
    lore: 'Loài chim này có cặp lông cổ rực rỡ. Khi đối mặt với kẻ thù, chim trống sẽ vẫy mạnh chiếc mào của mình để tỏ vẻ dũng mãnh. Tuy nhiên, khả năng bay lượn của chim mái lại vượt trội hơn hẳn so với chim trống, giúp chúng dễ dàng thoát khỏi nguy hiểm hoặc săn mồi từ trên cao.',
    rarity: 'rare',
  ),

  'blitzle': PokemonMeta(
    hint: 'Chú ngựa vằn nhỏ với bờm phát sáng.',
    lore: 'Khi bầu trời âm u, chú xuất hiện. Bờm của chú có thể hứng được tia sét và tích trữ năng lượng điện bên trong. Chú rất thích chạy nhảy dưới mưa bão, dường như năng lượng từ sấm sét làm chú tràn đầy sức sống hơn.',
    rarity: 'common',
  ),

  'zebstrika': PokemonMeta(
    hint: 'Nhanh như chớp, sấm rền vang.',
    lore: 'Sinh vật này di chuyển với tốc độ kinh ngạc, khiến không khí xung quanh rung chuyển như sấm. Mỗi bước chạy của chú là một dấu ấn của sức mạnh tự nhiên, xé toạc màn đêm với ánh sáng và âm thanh mãnh liệt. Chúng sở hữu vẻ đẹp hoang dã và đầy năng lượng, là biểu tượng của tốc độ và sự uyển chuyển.',
    rarity: 'rare',
  ),

  'roggenrola': PokemonMeta(
    hint: 'Tai nó hình lục giác, cứng như thép.',
    lore: 'Loài này sống sâu dưới lòng đất. Áp lực lớn khiến cơ thể nó trở nên cực kỳ cứng rắn, giống như thép vậy. Tai của nó có hình dạng đặc biệt, trông như một viên đá quý bị ép lại. Chúng thường di chuyển chậm rãi, vì cơ thể nặng nề và cứng cáp của mình.',
    rarity: 'common',
  ),

  'boldore': PokemonMeta(
    hint: 'Đá cam phát sáng tìm nước trong hang.',
    lore: 'Khi đầy năng lượng, viên đá màu cam trên người nó sẽ sáng lên rực rỡ. Sinh vật này rất thích khám phá lòng đất, đặc biệt là những nơi có mạch nước ngầm ẩn sâu trong hang động. Chúng dùng khả năng của mình để tìm kiếm nguồn nước mát lành, nơi có thể sinh sống và phát triển.',
    rarity: 'rare',
  ),

  'gigalith': PokemonMeta(
    hint: 'Khối đá khổng lồ, mạnh mẽ, phát sáng',
    lore: 'Nó bay lơ lửng trong không trung, tích trữ năng lượng khổng lồ từ cơ thể mình. Khi tập trung đủ, nó có thể giải phóng một luồng năng lượng mạnh mẽ, đủ sức quét sạch cả một ngọn núi. Cơ thể cứng cáp của nó là lớp vỏ bảo vệ tuyệt vời, giúp nó chống lại mọi đòn tấn công dù là dữ dội nhất.',
    rarity: 'rare',
  ),

  'woobat': PokemonMeta(
    hint: 'Tai to, bay trong bóng tối, dùng tiếng vang.',
    lore: 'Sinh vật nhỏ bé này thích trú ngụ trong những khu rừng âm u và hang động tối tăm. Nó có đôi tai to và nhạy cảm, chúng rung động nhẹ nhàng để lắng nghe thế giới xung quanh. Từ chiếc mũi nhỏ xinh, nó phát ra những sóng âm thanh đặc biệt để định vị đường đi và khám phá mọi vật cản, đảm bảo an toàn khi di chuyển trong bóng đêm.',
    rarity: 'common',
  ),

  'swoobat': PokemonMeta(
    hint: 'Môi chúm chím, biết nghe và tạo âm thanh.',
    lore: 'Loài sinh vật nhỏ bé này có một cái mũi rất đặc biệt, có thể phát ra những âm thanh với tần số đa dạng. Một số âm thanh mạnh mẽ đến mức có thể làm vỡ cả đá. Chúng sử dụng khả năng này để giao tiếp và khám phá môi trường xung quanh.',
    rarity: 'rare',
  ),

  'drilbur': PokemonMeta(
    hint: 'Chú bé có mũi khoan khỏe, đào đất nhanh như bay.',
    lore: 'Sinh vật nhỏ bé này sở hữu chiếc mũi khoan đặc biệt sắc bén, giúp nó di chuyển dưới lòng đất với tốc độ đáng kinh ngạc, có thể lên tới 48 km/h.  Nó có thể dễ dàng vượt qua nhiều chướng ngại vật bằng cách đào xuyên qua.  Khi cần thiết, nó dùng chiếc mũi khoan của mình để tìm kiếm thức ăn hoặc xây dựng tổ ấm vững chắc dưới lòng đất, tránh xa khỏi những kẻ săn mồi trên mặt đất.',
    rarity: 'rare',
  ),

  'excadrill': PokemonMeta(
    hint: 'Mũi khoan lớn, tay khỏe, đào đất giỏi.',
    lore: 'Sinh vật này có thể đào hầm cực nhanh, nhờ vào chiếc mũi khoan trên đầu được tôi luyện thành thép cứng. Nó giúp ích cho việc xây dựng đường hầm.  Và nó có thể khoan xuyên cả những tấm thép dày.',
    rarity: 'rare',
  ),

  'timburr': PokemonMeta(
    hint: 'Cậu bé cơ bắp với khúc gỗ trong tay.',
    lore: 'Sinh vật nhỏ bé này rất chăm chỉ, luôn mang theo khúc gỗ của mình và luyện tập sức mạnh. Nó thích đập phá đồ vật để rèn luyện cơ bắp. Khi nào nó có thể vung khúc gỗ lớn một cách dễ dàng, điều đó có nghĩa là nó sắp trở nên mạnh mẽ hơn rồi đấy. Bạn có tò mò muốn biết nó sẽ biến thành gì không?',
    rarity: 'common',
  ),

  'gurdurr': PokemonMeta(
    hint: 'Tay nó to như khúc gỗ, lực mạnh vô cùng.',
    lore: 'Sinh vật này sở hữu cơ bắp cuồn cuộn và thân hình rắn chắc đến mức ngay cả một đám đô vật hùng mạnh cũng không thể lay chuyển nó dù chỉ một ly. Sức mạnh của nó đến từ việc nhấc và di chuyển những vật nặng như thanh sắt lớn mỗi ngày. Nó có ý chí kiên cường, không bao giờ bỏ cuộc trước bất kỳ thử thách nào.',
    rarity: 'rare',
  ),

  'conkeldurr': PokemonMeta(
    hint: 'Voi sức mạnh khủng khiếp, nó dùng cột bê tông làm vũ khí.',
    lore: 'Chẳng ai biết chính xác làm sao, nhưng người ta đồn rằng sinh vật này đã chỉ dạy con người cách chế tạo xi măng và bê tông từ cách đây hơn hai thiên niên kỷ. Họ tin rằng nhờ có nó mà những công trình đồ sộ mới có thể được xây dựng.',
    rarity: 'rare',
  ),

  'tympole': PokemonMeta(
    hint: 'Cái má rung rung phát ra tiếng kêu.',
    lore: 'Khi phát hiện nguy hiểm, sinh vật nhỏ này sẽ rung đôi má của nó thật nhanh. Âm thanh lanh lảnh vang lên báo động cho mọi người xung quanh, giúp họ kịp thời tránh xa hiểm nguy. Chúng thích sống ở những nơi ẩm ướt, gần nguồn nước trong lành.',
    rarity: 'common',
  ),

  'palpitoad': PokemonMeta(
    hint: 'Sinh vật màu xanh với cái bướu trên đầu',
    lore: 'Khi cái bướu trên đầu cái sinh vật này rung lên, nó có thể tạo ra những cơn sóng mạnh mẽ trên mặt nước. Trên đất liền, rung động đó còn mạnh hơn, đủ sức làm rung chuyển cả mặt đất như một trận động đất nhỏ. Nó thích sống ở những nơi ẩm ướt.',
    rarity: 'rare',
  ),

  'seismitoad': PokemonMeta(
    hint: 'Đốm sần trên đầu phun chất gây tê, rung động tấn công.',
    lore: 'Sinh vật này sở hữu những chiếc gai đặc biệt trên đỉnh đầu, có khả năng phun ra một loại chất lỏng có tác dụng làm tê liệt đối thủ. Không chỉ vậy, chúng còn có thể tạo ra những rung động mạnh mẽ từ cơ thể mình để gây sát thương cho kẻ địch. Chúng thường sống ở những vùng ẩm ướt, thích nghi với môi trường xung quanh và sử dụng khả năng của mình để tự vệ hoặc săn mồi.',
    rarity: 'rare',
  ),

  'sewaddle': PokemonMeta(
    hint: 'Trông giống một chiếc lá nhỏ có cái đầu tròn',
    lore: 'Khi mới nở, người lớn đã may quần áo cho nó từ lá cây. Nó thích giấu đầu vào mũ trùm khi ngủ, như thể đang cuộn mình trong chiếc lá. Chiếc mũ này giúp nó ấm áp và an toàn.',
    rarity: 'common',
  ),

  'swadloon': PokemonMeta(
    hint: 'Sinh vật nhỏ bé với chiếc lá trên lưng.',
    lore: 'Những khu rừng nơi loài sinh vật này sinh sống có cây cối xanh tươi, rậm rạp. Chúng hấp thụ chất dinh dưỡng từ những chiếc lá rụng để nuôi dưỡng sự sống xung quanh. Chúng thường ẩn mình trong bóng râm, tận hưởng không khí trong lành của rừng.',
    rarity: 'rare',
  ),

  'leavanny': PokemonMeta(
    hint: 'Chú bọ cánh cứng có cánh lá và tay sắc bén.',
    lore: 'Khi tìm thấy một Pokémon nhỏ bé, nó sẽ tỉ mỉ dùng những chiếc kéo trên cánh tay và tơ dính để dệt quần áo bằng lá cho bạn bè nhỏ của mình. Chúng rất tốt bụng và luôn muốn giúp đỡ những ai cần.',
    rarity: 'rare',
  ),

  'venipede': PokemonMeta(
    hint: 'Cơ thể phân đốt, gai sắc nhọn, rủ xuống.',
    lore: 'Sinh vật bé nhỏ này sống ở nơi tối tăm, ẩm ướt. Khi bị đe dọa, nó cong người lại và dùng phần thân hình ăng-ten phía trên đầu để phóng ra một chất độc mạnh mẽ. Chất độc này đủ sức làm tê liệt chim chóc to lớn muốn bắt nó làm thức ăn, bảo vệ bản thân khỏi nguy hiểm.',
    rarity: 'common',
  ),

  'whirlipede': PokemonMeta(
    hint: 'Vỏ cứng, lăn tròn tấn công.',
    lore: 'Loài sinh vật có chiếc mai cứng này cuộn tròn cơ thể như bánh xe. Nó lao đi vun vút, va chạm thật mạnh vào đối thủ để bảo vệ bản thân hoặc tấn công kẻ xâm phạm. Dù trông có vẻ nặng nề, nó lại di chuyển rất nhanh khi cần thiết. Cái mai cứng giúp nó chống chịu được nhiều đòn tấn công.',
    rarity: 'rare',
  ),

  'scolipede': PokemonMeta(
    hint: 'Nhanh nhẹn, lao tới tấn công không ngừng nghỉ.',
    lore: 'Sinh vật trông giống con rết này di chuyển với tốc độ đáng kinh ngạc, không bao giờ bỏ cuộc khi đối mặt với kẻ thù. Đôi sừng sắc nhọn của nó được dùng để tấn công liên tục, đảm bảo nó sẽ giành chiến thắng. Nó luôn săn đuổi và không ngừng tấn công cho đến khi đạt được mục tiêu.',
    rarity: 'rare',
  ),

  'cottonee': PokemonMeta(
    hint: 'Trông giống quả bóng bông biết chạy trốn.',
    lore: 'Một sinh vật nhỏ bé tràn đầy bông gòn. Mỗi khi có kẻ lạ tới gần hoặc tấn công, nó sẽ tung ra những sợi bông trắng xốp từ cơ thể. Những đám bông này bay lơ lửng trong không khí, tạo ra một màn sương mờ ảo để đánh lạc hướng kẻ muốn bắt chúng. Nhờ vậy, nó có thể nhanh chóng chuồn êm, ẩn mình vào bụi cây hoặc bay đi xa.',
    rarity: 'common',
  ),

  'whimsicott': PokemonMeta(
    hint: 'Cỏ bông nhỏ nhanh nhẹn, ẩn mình trong gió.',
    lore: 'Sinh vật nhỏ bé này thích đùa giỡn với những cơn gió, luồn lách qua mọi khe hở dù là nhỏ nhất. Khi nó phiêu du, hãy để ý những quả bông trắng mềm mại mà nó để lại. Chúng như những dấu chân tí hon trên bầu trời, kể về chuyến đi vui vẻ của nó.',
    rarity: 'rare',
  ),

  'petilil': PokemonMeta(
    hint: 'Một em bé thực vật với lá xanh trên đầu.',
    lore: 'Loài cây nhỏ bé này có những chiếc lá trên đầu rất đắng. Tuy nhiên, ăn một chiếc lá này được cho là có thể giúp cơ thể cảm thấy sảng khoái và tràn đầy năng lượng hơn, xua tan mệt mỏi. Chúng thường được tìm thấy ở những nơi có ánh nắng mặt trời và chăm sóc thật tốt.',
    rarity: 'common',
  ),

  'lilligant': PokemonMeta(
    hint: 'Bông hoa trên đầu tỏa hương thơm dịu dàng.',
    lore: 'Loài Pokémon này rất được lòng các ngôi sao nhờ vẻ ngoài xinh đẹp. Để khiến bông hoa trên đỉnh đầu nó nở rộ là cả một thử thách ngay cả với những huấn luyện viên kinh nghiệm nhất. Hương thơm ngọt ngào của nó có thể làm dịu đi mọi tâm hồn.',
    rarity: 'rare',
  ),

  'sandile': PokemonMeta(
    hint: 'Một sinh vật nhỏ bé thích vùi mình trong cát ấm.',
    lore: 'Sinh vật nhỏ bé này sống cô độc dưới lòng đất cát sa mạc. Cơ thể chúng được giữ ấm bởi cái nóng của cát, giúp chúng tránh bị lạnh. Chúng thường ẩn mình dưới lớp cát, chỉ thỉnh thoảng mới lộ ra đôi mắt tò mò nhìn ngó xung quanh. Chúng rất thích tắm nắng và cảm nhận hơi ấm từ mặt trời chiếu qua lớp cát.',
    rarity: 'common',
  ),

  'krokorok': PokemonMeta(
    hint: 'Sinh vật sa mạc đội mũ, mắt được bảo vệ.',
    lore: 'Chúng sống theo nhóm nhỏ và rất bảo vệ lẫn nhau. Để thích nghi với môi trường khắc nghiệt, chúng có một lớp màng đặc biệt bao bọc đôi mắt, giúp chống lại những cơn bão cát dữ dội. Điều này cho phép chúng săn mồi và di chuyển dễ dàng ngay cả trong điều kiện thời tiết xấu nhất.',
    rarity: 'rare',
  ),

  'krookodile': PokemonMeta(
    hint: 'Hàm răng sắc bén, dáng vẻ đáng sợ.',
    lore: 'Sinh vật mạnh mẽ này nổi tiếng với cú đớp không thể thoát. Hàm răng của nó đủ sức nghiền nát cả ô tô, một minh chứng cho sức mạnh đáng gờm của nó. Dù trông có vẻ hung dữ, nó lại rất thông minh và khéo léo săn mồi. Khi gặp nguy hiểm, nó có thể dùng bùn đất để che mắt đối phương và tẩu thoát nhanh chóng. Nó thường ẩn mình dưới lớp bùn dày, chờ đợi con mồi đi ngang qua để tấn công bất ngờ.',
    rarity: 'rare',
  ),

  'darumaka': PokemonMeta(
    hint: 'Chú khỉ đỏ với ngọn lửa trên đầu.',
    lore: 'Khi ngọn lửa bên trong bừng cháy, chú không thể đứng yên mà cứ chạy nhảy lung tung. Khi ngọn lửa ấy dần nguội đi, chú sẽ chìm vào giấc ngủ say sưa.  Ánh lửa chiếu sáng trong đêm tối.',
    rarity: 'rare',
  ),

  'darmanitan': PokemonMeta(
    hint: 'Mặt đỏ, cơ bắp cuồn cuộn, nóng bỏng.',
    lore: 'Khi thức tỉnh, sinh vật này tỏa ra sức nóng khủng khiếp, lên đến 2.500 độ F. Ngọn lửa bên trong nó mạnh mẽ đến mức chỉ với một cú đấm, nó có thể dễ dàng làm nát một chiếc xe ben. Nó thường trông rất mạnh mẽ và sẵn sàng lao vào chiến đấu bất cứ lúc nào.',
    rarity: 'rare',
  ),

  'dwebble': PokemonMeta(
    hint: 'Mang theo một tảng đá nhỏ làm nhà.',
    lore: 'Sinh vật nhỏ bé này có khả năng phun ra chất lỏng thần kỳ từ miệng, có thể làm tan chảy ngay cả những tảng đá cứng rắn nhất. Chúng thường sử dụng khả năng này để tạo ra những nơi trú ẩn an toàn bằng cách khoét những cái hang vừa vặn. Bạn có thể tìm thấy chúng leo trèo trên những vách đá gồ ghề hoặc ẩn mình trong các khe nứt.',
    rarity: 'common',
  ),

  'crustle': PokemonMeta(
    hint: 'Sinh vật nhỏ với chiếc mai đá khổng lồ trên lưng.',
    lore: 'Khi tranh giành lãnh thổ, những sinh vật này chiến đấu rất dữ dội. Ai làm vỡ tảng đá của đối phương sẽ là người thua cuộc. Chúng rất khỏe và bướng bỉnh, luôn cố gắng bảo vệ ngôi nhà lớn của mình bằng mọi giá. Đôi khi, chúng còn dùng chiếc mai đá của mình để tấn công nữa đấy!',
    rarity: 'rare',
  ),

  'scraggy': PokemonMeta(
    hint: 'Da nó co giãn, dùng để đỡ đòn.',
    lore: 'Bọc da quanh cổ để giảm sát thương. Mỗi lần chiến đấu, nó sẽ kéo căng lớp da này. Nó rất thích cọ xát bộ da của mình vào đá để làm nó dày và đàn hồi hơn.',
    rarity: 'common',
  ),

  'scrafty': PokemonMeta(
    hint: 'Kẻ bắt nạt với chiếc quần sành điệu, phun chất chua.',
    lore: 'Sinh vật này sống theo nhóm, sẵn sàng lao vào tấn công bất kỳ kẻ lạ nào dám bén mảng đến lãnh thổ của chúng. Với cái miệng đặc biệt, chúng có thể phun ra chất lỏng có tính axit để tự vệ hoặc dọa nạt kẻ thù. Phong thái của chúng trông khá ngầu, như thể chúng luôn sẵn sàng cho một cuộc đối đầu.',
    rarity: 'rare',
  ),

  'yamask': PokemonMeta(
    hint: 'Sinh vật mang mặt nạ buồn bã',
    lore: 'Những sinh vật này mang theo một chiếc mặt nạ đã từng là khuôn mặt của chúng khi còn là con người. Đôi khi, chúng nhìn vào chiếc mặt nạ và lệ rơi vì những ký ức xưa cũ. Chúng sống trong những tàn tích cổ xưa, luôn hoài niệm về quá khứ đã mất. Dù vẻ ngoài có phần đáng sợ, chúng lại mang một nỗi buồn sâu sắc và sự cô đơn.',
    rarity: 'common',
  ),

  'cofagrigus': PokemonMeta(
    hint: 'Nó trông giống một chiếc rương cổ với cánh tay.',
    lore: 'Sinh vật huyền bí này, được cho là có khả năng biến người tiếp xúc gần thành xác ướp, mang một sự hấp dẫn kỳ lạ với vàng.  Nó thường cư ngụ trong những nơi cổ xưa và bí ẩn, ẩn náu chờ đợi những vàng thỏi lấp lánh.  Sự xuất hiện của nó thường mang đến cảm giác tò mò và một chút sợ hãi nhẹ nhàng, như một phần của những câu chuyện cổ xưa được thì thầm qua nhiều thế hệ.',
    rarity: 'rare',
  ),

  'tirtouga': PokemonMeta(
    hint: 'Rùa cổ đại vỏ cứng, thích lặn sâu.',
    lore: 'Sinh vật già nua này được hồi sinh từ hóa thạch cổ xưa. Nó có một bộ mai cực kỳ cứng cáp, giúp bảo vệ nó khi lặn xuống những rặng san hô xa xôi và những lòng biển sâu thẳm. Tật xấu của nó là thích nghỉ ngơi dưới đáy biển, trông giống như một tảng đá biết đi vậy!',
    rarity: 'rare',
  ),

  'carracosta': PokemonMeta(
    hint: 'Mai rùa cứng cáp, sống cả trên cạn lẫn dưới biển.',
    lore: 'Sinh vật cổ đại này có chiếc mai to và chắc khỏe như đá. Chúng có thể bơi lội trên biển sâu hoặc di chuyển chậm rãi trên đất liền. Với sức mạnh đáng kinh ngạc, một cú vỗ của chi trước có thể gây ra thiệt hại lớn, đủ sức làm thủng cả những vật liệu kim loại dày.',
    rarity: 'rare',
  ),

  'archen': PokemonMeta(
    hint: 'Cánh nhỏ, chân to, nhảy giỏi trên cành',
    lore: 'Loài chim cổ đại này không thể bay, chúng chỉ biết nhảy từ cành cây này sang cành cây khác. Chúng từng là tổ tiên của nhiều loài chim sau này, mang trong mình dòng máu của những sinh vật hùng mạnh đã thống trị bầu trời.',
    rarity: 'rare',
  ),

  'archeops': PokemonMeta(
    hint: 'Voi cánh to, thích chạy lấy đà để bay.',
    lore: 'Sinh vật này rất thông minh và có khả năng phối hợp với đồng loại để săn mồi. Chúng thường tận dụng sức chạy lấy đà từ mặt đất để có thể cất cánh lên bầu trời. Với đôi cánh lớn và bộ lông óng ánh, chúng lướt đi trên không trung một cách dũng mãnh, là những kẻ săn mồi đáng gờm bằng trí tuệ và sự nhanh nhẹn của mình.',
    rarity: 'rare',
  ),

  'trubbish': PokemonMeta(
    hint: 'Con tớ có mùi khó chịu, thích rác rưởi.',
    lore: 'Loài này đặc biệt thích những nơi bẩn thỉu, nhiều rác. Chúng thường thở ra thứ khí có mùi hôi thối. Nếu chẳng may hít phải lượng lớn khí này, bạn có thể ngủ say đến cả tuần lễ đấy! Hãy cẩn thận khi gặp chúng nhé, đặc biệt là ở những bãi rác hay khu vực dơ bẩn.',
    rarity: 'common',
  ),

  'garbodor': PokemonMeta(
    hint: 'Cánh tay khổng lồ, hơi thở độc hại.',
    lore: 'Sinh vật này sống trong những bãi rác khổng lồ, thu thập mọi thứ để phát triển. Nó có thể sử dụng cánh tay to lớn của mình để tóm lấy đối thủ. Sau đó, nó sẽ phun ra một luồng khí độc hại khó chịu từ miệng để kết liễu.',
    rarity: 'rare',
  ),

  'zorua': PokemonMeta(
    hint: 'Hình dáng như đứa trẻ, hay biến hóa để trêu chọc.',
    lore: 'Sinh vật nhỏ bé này có khả năng đặc biệt, dùng nó để biến thành hình dạng của người khác, thường là một đứa trẻ im lặng.  Nó làm vậy để khiến mọi người bất ngờ, tạo ra những tình huống thú vị và đôi khi hơi tinh nghịch.  Đôi mắt của nó thường ánh lên vẻ lém lỉnh khi thành công trong việc đánh lừa ai đó.',
    rarity: 'rare',
  ),

  'zoroark': PokemonMeta(
    hint: 'Sở hữu bộ lông đen mượt và đôi mắt đỏ rực, hay dùng ảo ảnh đánh lừa đối thủ.',
    lore: 'Tương truyền, chúng có một trái tim nhân hậu và luôn quan tâm đến bạn bè. Khi cảm nhận được sự nguy hiểm, nó sẽ dùng khả năng tạo ảo ảnh để đánh lạc hướng kẻ thù, bảo vệ sự an toàn cho cả đàn.  Dù vẻ ngoài có chút bí ẩn, nhưng tình cảm mà chúng dành cho đồng loại lại vô cùng sâu sắc.',
    rarity: 'rare',
  ),

  'minccino': PokemonMeta(
    hint: 'Vui vẻ, thích chải chuốt',
    lore: 'Sinh vật nhỏ nhắn, bộ lông mềm mại, cực kỳ sạch sẽ. Chúng dùng chiếc đuôi luôn được chăm chút để chào hỏi bạn bè, một cái chạm nhẹ nhàng như lời chúc tốt đẹp. Chúng rất thích chạy nhảy và nghịch ngợm, mang lại niềm vui cho mọi người xung quanh.  Bộ lông của chúng luôn bóng mượt và thơm tho, khiến ai cũng muốn vuốt ve.',
    rarity: 'common',
  ),

  'cinccino': PokemonMeta(
    hint: 'Bộ lông trắng óng mượt giúp phòng thủ.',
    lore: 'Chú Pokémon này có bộ lông trắng muốt, mềm mại như nhung, được phủ một lớp dầu đặc biệt. Lớp dầu này không chỉ giúp bộ lông luôn sạch sẽ và bóng bẩy mà còn có khả năng chống lại các đòn tấn công một cách hiệu quả. Chúng thường chải chuốt bộ lông của mình rất kỹ lưỡng để luôn giữ được vẻ ngoài đáng yêu và khả năng phòng vệ tốt nhất.',
    rarity: 'rare',
  ),

  'gothita': PokemonMeta(
    hint: 'Luôn nhìn chằm chằm với đôi ruy băng.',
    lore: 'Những xúc tu giống ruy băng của sinh vật này không chỉ để trang trí mà còn giúp tăng cường khả năng tâm linh mạnh mẽ của chúng. Chúng thường xuyên chăm chú nhìn vào một điểm nào đó, như thể đang khám phá một thế giới vô hình hoặc suy nghĩ điều gì đó sâu sắc. Đôi khi, bạn có thể thấy chúng đứng yên lặng hàng giờ, chỉ khẽ lắc lư những chiếc ruy băng của mình.',
    rarity: 'common',
  ),

  'gothorita': PokemonMeta(
    hint: 'Bóng váy tím, mái tóc dài bí ẩn, dùng phép thuật dụ dỗ.',
    lore: 'Sinh vật này có khả năng thôi miên, làm cho mọi người và các loài Pokémon khác mất phương hướng. Những câu chuyện về chúng đã ám ảnh mọi ngóc ngách, cảnh báo về những hành trình lạc lối không lối về.',
    rarity: 'rare',
  ),

  'gothitelle': PokemonMeta(
    hint: 'Thích ngắm bầu trời đêm, đôi mắt lấp lánh.',
    lore: 'Sinh vật huyền bí này có khả năng làm biến dạng không gian, mở ra những cánh cửa nhìn thấu vũ trụ xa xôi. Khi chúng buồn, những vì sao xa xôi hàng ngàn năm ánh sáng sẽ hiện hữu trong khoảng không bị nhiễu loạn bởi sức mạnh tâm linh mãnh liệt của chúng. Chúng thường được tìm thấy ở những nơi tĩnh lặng, trầm tư suy nghĩ về những điều bí ẩn của dải ngân hà.',
    rarity: 'rare',
  ),

  'solosis': PokemonMeta(
    hint: 'Like a tiny floating heart with arms, it defends itself with thought.',
    lore: 'Sinh vật nhỏ bé này bao bọc mình trong một lớp màn sương kỳ ảo. Nó có khả năng ngoại cảm mạnh mẽ, giúp nó giao tiếp với đồng loại và đẩy lùi kẻ thù. Khi cảm thấy bị đe dọa, nó sẽ phóng ra sức mạnh tinh thần để bảo vệ bản thân. Đôi khi, nó trông giống như một quả bóng chứa đầy chất lỏng, di chuyển một cách nhẹ nhàng trong không khí.',
    rarity: 'common',
  ),

  'duosion': PokemonMeta(
    hint: 'Hai cái đầu suy nghĩ, hành động đôi khi khác nhau.',
    lore: 'Sinh vật này có hai bộ não riêng biệt, khiến nó đôi khi hành động theo hai hướng trái ngược nhau một cách đột ngột.  Thật thú vị khi quan sát, nhưng cũng hơi mệt mỏi cho nó!  Khi chúng tập trung, chúng thật thông minh và khéo léo, nhưng đôi lúc sự phân chia trong suy nghĩ lại khiến chúng lúng túng. Chúng thường sống trong môi trường yên tĩnh để tránh bị phân tâm.',
    rarity: 'rare',
  ),

  'reuniclus': PokemonMeta(
    hint: 'Sinh vật màu xanh lá, đầu tròn, có chân tay như mầm cây.',
    lore: 'Khi những sinh vật này nắm tay nhau, một mạng lưới hình thành giữa bộ não của chúng, giúp tăng cường sức mạnh tinh thần. Chúng có thể chữa lành vết thương cho người khác bằng năng lượng tâm linh. Chúng hiền lành và thân thiện, thích chơi đùa trong không gian yên tĩnh.',
    rarity: 'rare',
  ),

  'ducklett': PokemonMeta(
    hint: 'Chú chim nhỏ màu xanh này lặn giỏi lắm.',
    lore: 'Sinh vật bé nhỏ này rất thích bơi lội dưới làn nước trong veo. Chúng là những thợ lặn tài ba, luôn tìm kiếm món ăn yêu thích của mình là rêu than bùn. Lông của chúng luôn giữ được độ óng mượt ngay cả sau khi lặn sâu. Khi cảm thấy an toàn, chúng thường bơi thành từng đàn nhỏ, tạo nên một cảnh tượng đáng yêu.',
    rarity: 'common',
  ),

  'swanna': PokemonMeta(
    hint: 'Những chú chim trắng xinh đẹp nhảy múa lúc hoàng hôn.',
    lore: 'Khi hoàng hôn buông xuống, cả đàn chim trắng tuyệt đẹp lại tập hợp lại để thực hiện điệu nhảy uyển chuyển. Mỗi chuyển động duyên dáng của chúng như kể một câu chuyện. Chú chim nổi bật nhất, đứng ở chính giữa, chính là người dẫn đầu, chỉ huy cả đàn với những bước nhảy nhịp nhàng. Chúng cùng nhau tạo nên một khung cảnh mê hoặc.',
    rarity: 'rare',
  ),

  'vanillite': PokemonMeta(
    hint: 'Sinh vật tí hon đội nón kem, thổi hơi lạnh',
    lore: 'Khi một đám mây có hơi ẩm tan vào không khí lạnh, những sinh vật này sẽ được sinh ra. Chúng có thể tạo ra những bông tuyết lấp lánh trong không khí và làm cho tuyết rơi xuống từ những đám mây gần đó. Chúng sống ở những nơi rất lạnh, nơi mà không khí luôn đóng băng. Hơi thở của chúng có thể làm đóng băng mọi thứ ngay lập tức.',
    rarity: 'common',
  ),

  'vanillish': PokemonMeta(
    hint: 'Cục kem tuyết đáng yêu, thích đùa giỡn.',
    lore: 'Sinh vật này sống ở những đỉnh núi phủ đầy tuyết trắng. Khi xưa, vào một thời kỳ lạnh giá, chúng đã di chuyển đến những vùng đất ấm áp hơn ở phía nam. Chúng ta có thể tìm thấy chúng chơi đùa trong những trận bão tuyết.',
    rarity: 'rare',
  ),

  'vanilluxe': PokemonMeta(
    hint: 'Tảng băng lạnh lẽo với hai cái đầu tròn.',
    lore: 'Sinh vật này thu thập hơi nước trong không khí và biến nó thành mây tuyết bên trong cơ thể. Khi tức giận, nó có thể phun ra những trận bão tuyết dữ dội, làm đóng băng mọi thứ xung quanh. Nó thường xuất hiện ở những vùng núi cao, nơi không khí lạnh giá và sạch sẽ, tạo ra những bông tuyết tinh khiết nhất.',
    rarity: 'rare',
  ),

  'deerling': PokemonMeta(
    hint: 'Bộ lông của nó thay đổi màu sắc, hòa mình vào cỏ.',
    lore: 'Sinh vật nhỏ nhắn này có bộ lông độc đáo, thay đổi màu sắc và mùi hương để hòa hợp hoàn hảo với màu xanh mướt của cỏ trên những ngọn núi. Chúng rất nhút nhát, khi phát hiện bất kỳ dấu hiệu đe dọa hay sự thù địch nào, chúng sẽ nhanh chóng ẩn mình trong bụi cỏ dày đặc, trở nên vô hình đối với kẻ lạ.',
    rarity: 'common',
  ),

  'sawsbuck': PokemonMeta(
    hint: 'Bộ sừng thay đổi theo mùa, báo hiệu thời tiết.',
    lore: 'Loài vật này di cư theo mùa. Người ta có thể đoán biết được mùa hiện tại khi nhìn vào bộ sừng độc đáo của chúng. Mỗi mùa, bộ sừng lại mang một hình dáng và màu sắc khác biệt, tô điểm thêm cho vẻ đẹp của chúng khi băng qua những cánh rừng thay đổi.',
    rarity: 'rare',
  ),

  'karrablast': PokemonMeta(
    hint: 'Cái vỏ của nó là thứ để ăn.',
    lore: 'Loài sinh vật này có một chiếc vỏ đặc biệt, không phải để tự vệ mà là thức ăn. Khi cảm nhận được tia lửa điện cùng với một bạn vỏ khác, chúng sẽ trải qua một thay đổi bất ngờ. Cứ như một món quà từ sấm sét, cuộc sống của chúng bỗng nhiên rẽ sang một hướng mới, mạnh mẽ và lột xác hơn trước.',
    rarity: 'common',
  ),

  'escavalier': PokemonMeta(
    hint: 'Vuốt bay nhanh, dùng giáo đâm tới.',
    lore: 'Những chiến binh dũng cảm này bay vút trong không trung với tốc độ đáng kinh ngạc, dùng những chiếc giáo nhọn của mình để tấn công đối thủ. Dù gặp khó khăn hay nguy hiểm, chúng vẫn luôn đối mặt với kẻ thù một cách can đảm và không hề nao núng. Chúng là biểu tượng của lòng quả cảm và sự kiên cường trên chiến trường.',
    rarity: 'rare',
  ),

  'foongus': PokemonMeta(
    hint: 'Nó trông giống một quả bóng bắt, ẩn chứa độc tố.',
    lore: 'Loài nấm này có một vẻ ngoài đánh lừa, bắt chước hình dáng của những quả bóng đặc biệt mà các huấn luyện viên sử dụng. Nó sử dụng hình dáng quen thuộc đó để dụ dỗ những người tò mò đến gần. Khi nạn nhân lại gần, nó sẽ bất ngờ giải phóng một đám mây bào tử độc hại vào không khí. Lý do tại sao nó lại mang hình dáng giống một quả bóng bắt vẫn còn là một bí ẩn chưa lời giải đáp.',
    rarity: 'common',
  ),

  'amoonguss': PokemonMeta(
    hint: 'Nó trông giống một quả bóng và có vũ điệu mời gọi.',
    lore: 'Sinh vật này có khả năng đặc biệt là tạo ra ảo ảnh. Nó dùng những chiếc mũ giống Poké Ball trên đầu để thu hút con mồi. Khi mọi thứ đã đủ gần, nó sẽ dùng những chiếc mũ này đung đưa như đang nhảy múa, khiến sinh vật khác xao nhãng và dễ dàng bị bắt.',
    rarity: 'rare',
  ),

  'frillish': PokemonMeta(
    hint: 'Cánh tay mỏng manh như mạng che bao lấy đối phương.',
    lore: 'Sinh vật biển này ẩn mình dưới đáy đại dương. Với những xúc tu mỏng manh, nó nhẹ nhàng quấn quanh cơ thể của bất kỳ kẻ nào không may tiếp cận. Sau đó, nó từ từ kéo con mồi xuống đáy biển sâu, nơi nó có thể yên bình nghỉ ngơi. Những xúc tu của nó không chỉ dùng để bắt mồi mà còn giúp nó di chuyển uyển chuyển trong làn nước.',
    rarity: 'common',
  ),

  'jellicent': PokemonMeta(
    hint: 'Sinh vật màu hồng có vòng, thích nước sâu.',
    lore: 'Truyền thuyết kể rằng những con tàu và thủy thủ lạc vào nhà của sinh vật này đều chìm nghỉm, mất tích và tan biến không còn dấu vết. Nó ẩn mình dưới đáy biển sâu, chờ đợi những linh hồn lang thang để kéo xuống vực thẳm.  Rất ít người từng nhìn thấy nó và sống sót để kể lại câu chuyện.',
    rarity: 'rare',
  ),

  'joltik': PokemonMeta(
    hint: 'Sinh vật bé nhỏ màu vàng, bám víu vào mọi thứ.',
    lore: 'Những sinh vật nhỏ bé này rất thích tụ tập ở những nơi có nhiều điện. Chúng có thể làm bạn bất ngờ bằng cách bất ngờ xuất hiện và hút năng lượng từ các ổ cắm điện trong nhà bạn. Tuy nhỏ bé nhưng chúng có thể tạo ra những tia điện bất ngờ và thú vị.',
    rarity: 'common',
  ),

  'galvantula': PokemonMeta(
    hint: 'Chú nhện nhỏ với bộ lông vàng óng, phun chỉ điện bảo vệ mình.',
    lore: 'Khi gặp nguy hiểm, sinh vật bé nhỏ này sẽ co giật và phun ra vô số sợi chỉ tích điện. Những sợi chỉ này tạo thành một màn chắn bảo vệ, vừa khiến kẻ tấn công bị giật mình, vừa ngăn cản chúng tiếp cận. Chúng di chuyển thoăn thoắt trên mặt đất và đôi khi còn leo trèo trên thân cây, luôn sẵn sàng tạo ra \'bức tường điện\' nếu cần thiết.',
    rarity: 'rare',
  ),

  'ferroseed': PokemonMeta(
    hint: 'Một quả bóng gai nhỏ bé lăn lộn dữ dội.',
    lore: 'Khi cảm thấy nguy hiểm, sinh vật nhỏ bé này sẽ phóng ra vô số chiếc gai sắc nhọn để tự vệ. Nhờ lớp vỏ cứng cáp và khả năng lăn tròn, nó có thể nhanh chóng thoát khỏi kẻ thù và tìm nơi ẩn náu an toàn. Chiếc gai của nó có thể đâm xuyên qua nhiều loại vật liệu, khiến nó trở thành một đối thủ đáng gờm.',
    rarity: 'common',
  ),

  'ferrothorn': PokemonMeta(
    hint: 'Tay gai nhọn swings and smashes.',
    lore: 'Sinh vật này có những chiếc xúc tu sắc nhọn làm bằng thép. Một cú chạm từ chúng đủ mạnh để làm vỡ nát cả tảng đá. Nó dùng những chiếc gai ấy để tấn công kẻ thù, khiến chúng không thể tiến lại gần. Nó sống trong rừng và thường dùng bộ gai của mình để ẩn mình giữa các bụi cây. Nếu bị đe dọa, nó sẽ vung những chiếc xúc tu này với sức mạnh khủng khiếp.',
    rarity: 'rare',
  ),

  'klink': PokemonMeta(
    hint: 'Hai bánh răng nhỏ xoay tròn và khớp với nhau.',
    lore: 'Cặp bánh răng này sinh ra để song hành. Khi chạm vào những bánh răng khác, chúng sẽ tự động bật ra, không bao giờ chịu khớp nối. Chúng cứ thế xoay tròn theo quy luật định sẵn, tạo nên bản giao hưởng của sự ăn khớp hoàn hảo giữa hai cá thể được gắn kết.',
    rarity: 'rare',
  ),

  'klang': PokemonMeta(
    hint: 'Chiếc chuông kim loại kêu vang, xoay tròn theo cảm xúc.',
    lore: 'Sinh vật hình chuông này dùng tốc độ xoay để biểu lộ tâm trạng. Khi vui, nó rung nhẹ nhàng, còn khi tức giận thì xoay nhanh hơn, tạo ra âm thanh dồn dập như muốn cảnh báo mọi người. Nó giao tiếp với đồng loại bằng những âm điệu đặc biệt vang lên từ thân mình kim loại. Âm thanh này có thể rất êm dịu hoặc khá mạnh mẽ tùy thuộc vào cảm xúc của nó.',
    rarity: 'rare',
  ),

  'klinklang': PokemonMeta(
    hint: 'Ngôi sao đỏ bé nhỏ xoay tròn thật nhanh.',
    lore: 'Sinh vật này có những chiếc bánh răng gắn kết với nhau. Khi vòng nhỏ bên trong quay thật nhanh, nó tạo ra một lượng lớn năng lượng. Chúng thường di chuyển cùng nhau, tạo thành những đội hình ấn tượng.  Năng lượng được tạo ra có thể thắp sáng cả một khu rừng nhỏ!',
    rarity: 'epic',
  ),

  'tynamo': PokemonMeta(
    hint: 'Cơ thể lấp lánh, bơi theo đàn.',
    lore: 'Nhỏ bé và yếu ớt khi đứng một mình, sinh vật nhỏ bé này trở nên đáng gờm khi tập hợp lại. Chúng tạo thành một chuỗi dài những tia sáng nhỏ, có thể tạo ra sức mạnh sánh ngang sấm sét. Chúng thích sống trong những vùng nước sâu và tối tăm, nơi chúng có thể dễ dàng tụ tập mà không bị phát hiện. Sự đoàn kết của chúng là chìa khóa cho sức mạnh của cả đàn.',
    rarity: 'common',
  ),

  'eelektrik': PokemonMeta(
    hint: 'Sinh vật có hình tròn, quấn quanh kẻ địch bằng điện',
    lore: 'Sinh vật này có những vòng tròn kỳ lạ trên cơ thể, chúng không chỉ để trang trí mà còn là nguồn năng lượng điện mạnh mẽ. Khi tấn công, chúng sẽ quấn chặt lấy đối phương và truyền dòng điện tích tụ, khiến kẻ địch bất động. Chúng thường rình rập trong những khu vực có nhiều nguồn điện.',
    rarity: 'rare',
  ),

  'eelektross': PokemonMeta(
    hint: 'Sinh vật điện vươn tay từ biển cả bắt mồi.',
    lore: 'Sinh vật này có khả năng dùng cánh tay để di chuyển trên cạn. Chúng thường tìm kiếm thức ăn ở bờ biển rồi nhanh chóng kéo con mồi xuống nước để thưởng thức. Sức mạnh điện của chúng giúp chúng bắt giữ con mồi dễ dàng. Chúng sống ở những vùng nước sâu và đôi khi xuất hiện gần bờ.',
    rarity: 'epic',
  ),

  'elgyem': PokemonMeta(
    hint: 'Một sinh vật nhỏ bé có đầu lớn và đôi mắt phát sáng.',
    lore: 'Nó có khả năng tâm linh mạnh mẽ, có thể gây ra những cơn đau đầu dữ dội cho đối thủ bằng cách tác động vào não bộ của họ. Sinh vật này đến từ vũ trụ xa xôi, mang theo những bí ẩn của các vì sao. Nó thường được tìm thấy ở những nơi yên tĩnh, nơi nó có thể tập trung năng lượng của mình.',
    rarity: 'common',
  ),

  'beheeyem': PokemonMeta(
    hint: 'Sinh vật với ba ngón tay đa sắc, gây lú lẫn.',
    lore: 'Loài này có khả năng kỳ lạ làm thay đổi kí ức của đối thủ. Nó giao tiếp bằng cách nháy các ngón tay có ba màu khác nhau. Người ta tin rằng nó đến từ một nơi rất xa, mang theo sức mạnh bí ẩn từ vũ trụ. Trí tuệ của nó được cho là vượt xa hiểu biết thông thường, khiến nó trở thành một bí ẩn đối với nhiều nhà nghiên cứu.',
    rarity: 'rare',
  ),

  'litwick': PokemonMeta(
    hint: 'Ngọn lửa nhỏ bé dẫn đường hay ám ảnh?',
    lore: 'Khi đêm xuống, một đốm sáng dịu nhẹ xuất hiện trong bóng tối. Nó không phải là ánh sao hay đom đóm, mà là một sinh vật tí hon mang trong mình ngọn lửa bí ẩn. Ngọn lửa ấy không chỉ chiếu sáng mà còn thu hút sinh vật sống xung quanh, hút lấy chút năng lượng ấm áp của họ để nuôi dưỡng chính mình. Đừng để vẻ ngoài mong manh của nó đánh lừa, bởi đằng sau ánh sáng ấy là một vòng tuần hoàn sự sống kỳ lạ.',
    rarity: 'common',
  ),

  'lampent': PokemonMeta(
    hint: 'Chiếc đèn ma quái lang thang tìm kiếm linh hồn.',
    lore: 'Thứ ánh sáng lạ lùng mang theo nỗi sợ hãi len lỏi khắp nơi. Nó đi qua các thành phố, như thể đang tìm kiếm điều gì đó đã mất. Người ta nói rằng chiếc đèn này chỉ xuất hiện khi có điều không may xảy ra. Ánh sáng của nó có thể làm dịu đi nỗi buồn hoặc dẫn lối cho những linh hồn lạc lõng.',
    rarity: 'rare',
  ),

  'chandelure': PokemonMeta(
    hint: 'Ngọn lửa trên tay nó ru ngủ bạn đấy',
    lore: 'Khi nó hấp thụ một linh hồn, nó sẽ biến nó thành ngọn lửa để đốt cháy. Ngọn lửa trên cánh tay nó rung động nhẹ nhàng, tạo ra một điệu múa thôi miên đẹp mắt, khiến người nhìn vào cảm thấy mụ mị và mất phương hướng. Cẩn thận đừng để bị vẻ đẹp huyền bí của nó cuốn hút nhé!',
    rarity: 'rare',
  ),

  'axew': PokemonMeta(
    hint: 'Răng nanh sắc nhọn, thích ăn trái cây.',
    lore: 'Sinh vật nhỏ bé này có đôi răng nanh đặc biệt, dùng để nghiền nát những loại quả mọng ngon lành. Mỗi lần mọc lại, đôi răng nanh lại trở nên cứng cáp và sắc bén hơn, là công cụ đắc lực cho việc săn tìm thức ăn và tự vệ. Chúng thường sống trong rừng sâu, nơi có nhiều loại trái cây yêu thích.',
    rarity: 'rare',
  ),

  'fraxure': PokemonMeta(
    hint: 'Răng nanh sắc bén, mài giũa trên đá.',
    lore: 'Khi chiến đấu, chiếc ngà của Pokémon này có thể bị sứt mẻ và không bao giờ mọc lại. Vì vậy, sau mỗi trận chiến, chúng cẩn thận mài giũa những chiếc ngà của mình trên những tảng đá ven sông để giữ cho chúng luôn thật sắc bén, sẵn sàng cho cuộc đối đầu tiếp theo.',
    rarity: 'rare',
  ),

  'haxorus': PokemonMeta(
    hint: 'Rồng hiền lành, nanh sắc bén, bảo vệ lãnh thổ.',
    lore: 'Sinh vật hùng mạnh này có bộ giáp vảy lấp lánh và chiếc sừng lớn trên đầu. Chúng rất hiền lành và thân thiện với những người bạn của mình. Tuy nhiên, khi lãnh thổ của chúng bị đe dọa, chúng sẽ trở nên vô cùng đáng sợ. Chiếc nanh của chúng đủ sắc bén để cắt xuyên cả thép, khiến kẻ thù phải khiếp sợ lùi bước. Chúng chiến đấu với lòng dũng cảm và sự quyết tâm không gì lay chuyển để bảo vệ bạn bè và nơi chốn của mình.',
    rarity: 'rare',
  ),

  'cubchoo': PokemonMeta(
    hint: 'Chú gấu con thích ho sụt sịt.',
    lore: 'Chú gấu nhỏ nhắn này có chiếc mũi hay chảy nước. Khi mũi đặc lại, chú càng mạnh mẽ hơn. Nhưng nếu mũi chảy lỏng, chú sẽ hơi yếu đi một chút. Chú thích vùi mặt vào chiếc khăn ấm áp của mình.',
    rarity: 'rare',
  ),

  'beartic': PokemonMeta(
    hint: 'Chú gấu trắng to lớn thổi băng tuyết.',
    lore: 'Sinh sống ở vùng biển phương Bắc lạnh giá, sinh vật này có khả năng điều khiển hơi thở của mình để đóng băng không khí. Rất thích bơi lội, nó lặn sâu dưới làn nước để săn mồi. Cơ thể to lớn và bộ lông dày giúp nó chống chọi với cái rét cắt da cắt thịt. Dù vẻ ngoài có phần đáng sợ, nhưng khi không săn mồi, nó có thể rất hiền lành.',
    rarity: 'rare',
  ),

  'shelmet': PokemonMeta(
    hint: 'Cái vỏ của nó có thể đóng lại để tự vệ. Nó phun ra chất lỏng dính.',
    lore: 'Sinh vật nhỏ bé này sống trong chiếc vỏ cứng cáp. Khi cảm thấy nguy hiểm, nó sẽ rụt hết người vào trong, biến thành một khối tròn bất động. Đừng lại gần quá nhé, vì nó có thể phun ra một chất lỏng màu xanh lá cây rất dính và hơi độc nữa đấy. Nó thường ẩn mình trong các bụi cây hoặc trên cành cây để tránh kẻ thù.',
    rarity: 'common',
  ),

  'accelgor': PokemonMeta(
    hint: 'Luôn mang theo lớp vỏ mỏng manh quanh mình.',
    lore: 'Sinh vật này rất sợ bị khô và luôn giữ cho cơ thể ẩm ướt bằng cách quấn mình trong nhiều lớp màng mỏng. Chúng có thể di chuyển cực nhanh, lướt trên mọi địa hình như thể đang bay vậy. Nhanh nhẹn và khó bắt, chúng là những người bạn đồng hành thú vị.',
    rarity: 'rare',
  ),

  'mienfoo': PokemonMeta(
    hint: 'Vuốt sắc, ra đòn như múa.',
    lore: 'Chú linh thú nhỏ bé này lao vào trận chiến với chuỗi đòn tấn công uyển chuyển, không ngừng nghỉ. Bộ vuốt sắc bén của nó có thể cắt xuyên qua mọi đối thủ. Dù trông có vẻ nhẹ nhàng, nhưng sức mạnh và tốc độ đáng kinh ngạc của nó khiến mọi kẻ thù phải dè chừng. Nó yêu thích những trận đấu và luôn thể hiện sự nhanh nhẹn của mình trên chiến trường.',
    rarity: 'common',
  ),

  'mienshao': PokemonMeta(
    hint: 'Vũ khí lợi hại nhất là đôi tay mềm mại như roi?',
    lore: 'Sinh vật này khiến đối thủ kinh ngạc với tốc độ ra đòn không tưởng. Những cú đánh từ cánh tay của nó nhanh đến mức mắt thường khó lòng theo kịp. Lông trên cánh tay mềm mại nhưng lại có thể vung như roi, giáng những đòn chí mạng khiến đối phương choáng váng. Nó luôn giữ cho cơ thể uyển chuyển, sẵn sàng tung ra những đòn thế điêu luyện để bảo vệ bản thân.',
    rarity: 'rare',
  ),

  'golett': PokemonMeta(
    hint: 'Cục đá biết đi, trông như một bức tượng cổ.',
    lore: 'Thứ năng lượng bí ẩn bên trong giúp nó cử động. Người ta vẫn chưa tìm ra đó là loại năng lượng gì. Nó trông giống một bức tượng cổ biết đi, được tạo ra từ đất sét cứng. Dù im lặng, nó vẫn luôn sẵn sàng bảo vệ những gì quan trọng với mình.',
    rarity: 'common',
  ),

  'golurk': PokemonMeta(
    hint: 'Một người khổng lồ bay trên trời với tốc độ kinh hoàng.',
    lore: 'Sinh vật này là một người máy cổ đại được tạo ra để phục vụ con người. Khi còn nguyên vẹn, nó có khả năng bay với tốc độ cực cao, vượt qua cả tiếng động. Tuy nhiên, khi lớp niêm phong trên ngực bị gỡ bỏ, năng lượng bên trong nó sẽ bùng phát và trở nên khó kiểm soát, tạo ra một luồng sức mạnh nguy hiểm. Nó như một vệ sĩ hùng mạnh, nhưng ẩn chứa một bí mật có thể giải phóng sức mạnh vũ bão.',
    rarity: 'rare',
  ),

  'pawniard': PokemonMeta(
    hint: 'Cơ thể toàn lưỡi sắc bén.',
    lore: 'Đứa bé chiến binh này có cơ thể được tạo thành từ những lưỡi dao sắc bén. Khi những lưỡi dao này bị cùn đi trong các trận chiến, nó sẽ tìm đến những tảng đá ven sông để mài sắc lại. Nó rất kiêu hãnh về sự sắc bén của mình và không bao giờ để vũ khí của mình bị cùn.',
    rarity: 'rare',
  ),

  'bisharp': PokemonMeta(
    hint: 'Vị thủ lĩnh với lưỡi kiếm sắc bén.',
    lore: 'Sinh vật này là thủ lĩnh của một bầy pawniard. Nó luôn chiến đấu để khẳng định vị trí thống lĩnh của mình. Tuy nhiên, nếu thất bại trong trận chiến, nó sẽ bị trục xuất khỏi đàn. Sự cạnh tranh khốc liệt này giúp củng cố sức mạnh và tinh thần chiến đấu của cả nhóm, đảm bảo chỉ những kẻ mạnh nhất mới có thể dẫn dắt.',
    rarity: 'rare',
  ),

  'kingambit': PokemonMeta(
    hint: 'Chiếc mũ sắt khổng lồ, lãnh đạo quân đoàn',
    lore: 'Chỉ một thủ lĩnh hùng mạnh nhất, kẻ đã chinh phục mọi đối thủ trong đội quân của mình, mới có thể đạt đến sức mạnh tối thượng này, biến đổi thành một vị vua uy dũng. Vị vua này mang trên mình vinh quang của những trận chiến đã qua, với chiếc mũ sắt biểu tượng cho quyền lực và lòng dũng cảm vô song. Luôn dẫn dắt đàn em của mình tiến bước, không bao giờ lùi bước trước mọi hiểm nguy.',
    rarity: 'epic',
  ),

  'rufflet': PokemonMeta(
    hint: 'Chim non dũng cảm, móng vuốt sắc bén nghiền nát quả mọng.',
    lore: 'Chúng có bộ lông trắng xinh xắn và cái mỏ vàng óng. Mặc dù nhỏ bé, chúng không hề sợ hãi trước bất kỳ đối thủ nào. Với đôi chân mạnh mẽ, chúng có thể dễ dàng giẫm nát những trái cây chín mọng để ăn. Sự can đảm của chúng khiến ai cũng phải ngưỡng mộ, luôn sẵn sàng bảo vệ bản thân và bạn bè.',
    rarity: 'common',
  ),

  'braviary': PokemonMeta(
    hint: 'Chim lớn với đôi cánh mạnh mẽ, sẵn sàng chiến đấu.',
    lore: 'Chim dũng cảm với bộ lông oai vệ. Chúng có trái tim quả cảm, luôn bảo vệ bạn bè mà không màng hiểm nguy. Khả năng bay phi thường cho phép chúng mang vác vật nặng, thể hiện sức mạnh và lòng trung thành tuyệt đối.',
    rarity: 'rare',
  ),

  'vullaby': PokemonMeta(
    hint: 'Cánh bé xíu, đuôi trùm xương.',
    lore: 'Sinh vật này có đôi cánh nhỏ không đủ sức để bay lượn. Chúng luôn cẩn thận bảo vệ phần sau cơ thể mình bằng những bộ xương mà loài khác giúp chúng thu thập. Đôi khi, chúng có thể trông hơi vụng về vì đôi cánh không dùng để bay này.',
    rarity: 'common',
  ),

  'mandibuzz': PokemonMeta(
    hint: 'Chim lớn mổ bụng, thích trang trí tổ bằng xương.',
    lore: 'Loài chim này rất thích thu thập những bộ xương tìm thấy để làm tổ. Chúng rất mạnh mẽ, có thể dùng móng vuốt sắc bén để bắt những con mồi yếu ớt và mang về tổ của mình. Tổ của chúng trông thật đặc biệt với toàn xương. Chúng sống ở những nơi hoang vu và thường hay ẩn mình.',
    rarity: 'rare',
  ),

  'deino': PokemonMeta(
    hint: 'Bé con thích gặm nhấm mọi thứ, trông hơi giống khủng long con.',
    lore: 'Sinh vật nhỏ này có một chiếc miệng nhỏ nhưng lại rất thích cắn và nếm mọi thứ xung quanh. Nó không hề kén ăn, nên bất cứ thứ gì rơi vào tầm ngắm đều có thể trở thành món ăn của nó. Vì vậy, nếu thấy một bé con nhỏ nhắn màu tím đang loay hoay, hãy cẩn thận kẻo bị bất ngờ nhé.',
    rarity: 'rare',
  ),

  'zweilous': PokemonMeta(
    hint: 'Con quái vật có hai đầu, luôn tranh cãi với nhau.',
    lore: 'Khi đã ăn hết thức ăn ở nơi mình ở, nó sẽ đi tìm vùng đất mới. Hai cái đầu của nó không bao giờ đồng ý điều gì, luôn luôn cãi cọ và tranh giành nhau. Đôi khi chúng còn tự làm mình bị thương vì bất đồng quan điểm. Sự hung hăng của nó khiến những con mồi nhỏ phải sợ hãi bỏ chạy.',
    rarity: 'rare',
  ),

  'hydreigon': PokemonMeta(
    hint: 'Quái vật có sáu cánh, hung dữ tấn công mọi thứ.',
    lore: 'Sinh vật mạnh mẽ này bay lượn trên bầu trời với sáu đôi cánh lớn. Nó có một thái độ vô cùng hiếu chiến và coi mọi chuyển động là một lời thách thức, khiến nó liên tục tấn công mọi thứ xung quanh.',
    rarity: 'rare',
  ),

  'larvesta': PokemonMeta(
    hint: 'Cánh bướm rực lửa, ẩn chứa sức mạnh mặt trời.',
    lore: 'Người ta tin rằng sinh vật nhỏ bé này được sinh ra từ chính mặt trời. Khi trưởng thành và tiến hóa, toàn bộ cơ thể nó sẽ bùng cháy trong một biển lửa rực rỡ. Ánh sáng và sức nóng mà nó tỏa ra vô cùng mạnh mẽ, báo hiệu một sức mạnh tiềm ẩn khổng lồ sắp được giải phóng. Nó mang trong mình tinh túy của ánh dương, sẵn sàng soi sáng mọi nơi nó đi qua.',
    rarity: 'rare',
  ),

  'volcarona': PokemonMeta(
    hint: 'Cánh bướm rực lửa sáng soi đêm tối',
    lore: 'Khi bầu trời bị tro bụi núi lửa che phủ, người ta kể rằng ngọn lửa của sinh vật này đã thay thế mặt trời, mang lại ánh sáng ấm áp cho thế giới. Nó sưởi ấm mọi thứ xung quanh bằng đôi cánh rực rỡ của mình.',
    rarity: 'epic',
  ),

  'chespin': PokemonMeta(
    hint: 'Bạn nhỏ màu xanh lá cây với gai nhọn',
    lore: 'Món ăn yêu thích của nó là trái cây và hạt. Khi cảm thấy nguy hiểm, nó sẽ dựng đứng những chiếc gai trên đầu. Những chiếc gai này ban đầu mềm mại nhưng khi dựng lên lại trở nên cứng và sắc nhọn, có thể xuyên thủng cả đá. Nó thích ẩn mình trong những bụi cây rậm rạp để nghỉ ngơi.',
    rarity: 'rare',
  ),

  'quilladin': PokemonMeta(
    hint: 'Chú sâu xanh bọc giáp, trông rất cứng cáp.',
    lore: 'Khi gặp nguy hiểm, chú cuộn tròn mình lại, chiếc mai cứng rắn giúp che chắn khỏi kẻ thù. Đừng dại dột lại gần, bởi chú sẵn sàng phóng ra những chiếc gai sắc nhọn để tự vệ. Chiếc mai ấy còn giúp chú di chuyển nhanh nhẹn trong khu rừng rậm.',
    rarity: 'rare',
  ),

  'chesnaught': PokemonMeta(
    hint: 'Thân hình to lớn, vai có gai sắc nhọn.',
    lore: 'Loài Pokémon này có bộ giáp cứng cáp như một chiếc khiên. Khi chiến đấu, nó sẽ dùng thân mình che chắn cho đồng đội khỏi mọi đòn tấn công nguy hiểm. Sức mạnh của nó kinh khủng đến nỗi một cú húc có thể lật tung cả một chiếc xe tăng khổng lồ. Nó rất dũng cảm và luôn sẵn sàng bảo vệ những người yếu thế hơn.',
    rarity: 'rare',
  ),

  'fennekin': PokemonMeta(
    hint: 'Tai to, thích ăn cành cây.',
    lore: 'Chú cáo nhỏ này có đôi tai to lớn, có thể xả ra hơi nóng hơn 390 độ F! Đôi tai đặc biệt này giúp nó điều chỉnh nhiệt độ và còn là nơi để giải tỏa năng lượng khi ăn những cành cây thơm ngon.  Khi ăn cành cây, chú cảm thấy tràn đầy sức sống và sẵn sàng khám phá thế giới xung quanh.',
    rarity: 'rare',
  ),

  'braixen': PokemonMeta(
    hint: 'Đuôi của nó có một cành cây bốc lửa.',
    lore: 'Nhờ ma sát của bộ lông trên đuôi, nó có thể đốt cháy cành cây và phóng nó vào trận chiến. Ngọn lửa từ đuôi của nó có thể thiêu đốt mọi thứ. Nó thường sử dụng đuôi để làm tín hiệu hoặc để sưởi ấm vào ban đêm. Khi vui vẻ, ngọn lửa bùng lên rực rỡ hơn.',
    rarity: 'rare',
  ),

  'delphox': PokemonMeta(
    hint: 'Cái đuôi bốc lửa và quyền trượng của nó mang lại sức mạnh.',
    lore: 'Nó có khả năng nhìn vào tương lai bằng cách nhìn sâu vào ngọn lửa trên cây gậy của mình. Dáng vẻ uyên bác và ánh mắt tinh anh giúp nó suy đoán trước mọi tình huống. Đôi khi, ngọn lửa trên tay nó còn có thể dùng để sưởi ấm hoặc tấn công.',
    rarity: 'rare',
  ),

  'froakie': PokemonMeta(
    hint: 'Tạo bong bóng linh hoạt để bảo vệ bản thân.',
    lore: 'Loài sinh vật nhỏ bé này có khả năng đặc biệt là tiết ra những bong bóng mềm dẻo từ ngực và lưng. Những bong bóng này không chỉ trông thật vui mắt mà còn có công dụng tuyệt vời. Khi bị tấn công, những bong bóng này sẽ hấp thụ bớt lực tác động, giúp bảo vệ chúng khỏi bị tổn thương. Chúng thường sống gần nguồn nước, thích hợp với môi trường ẩm ướt.',
    rarity: 'rare',
  ),

  'frogadier': PokemonMeta(
    hint: 'Chú ếch xanh với bong bóng diệu kỳ.',
    lore: 'Sinh vật hoạt bát này sở hữu khả năng ném những viên sỏi nhỏ phủ đầy bong bóng với độ chính xác đáng kinh ngạc. Nó có thể dễ dàng đánh trúng mục tiêu ở khoảng cách xa, ngay cả những vật nhỏ như lon rỗng. Sự khéo léo này giúp nó vừa săn mồi vừa rèn luyện kỹ năng của mình, chuẩn bị cho những thử thách lớn hơn trong tương lai.',
    rarity: 'rare',
  ),

  'greninja': PokemonMeta(
    hint: 'Chú ếch nước với chiếc lưỡi đáng gờm.',
    lore: 'Khi chiến đấu, chú có thể nén và biến nước thành những ngôi sao sắc bén. Tốc độ quay của những ngôi sao này nhanh đến mức có thể chém đôi cả kim loại. Chú rất nhanh nhẹn và thường dùng chiếc lưỡi của mình như một chiếc khăn choàng.',
    rarity: 'rare',
  ),

  'bunnelby': PokemonMeta(
    hint: 'Tai to, đào hang cả đêm.',
    lore: 'Chuột tai to này dùng đôi tai khỏe mạnh của mình để đào những cái hang sâu dưới lòng đất. Chúng chăm chỉ lắm, cứ đào mãi, đào mãi suốt cả đêm. Rất thích đào bới nên ban ngày thường nghỉ ngơi trong tổ ấm.',
    rarity: 'common',
  ),

  'diggersby': PokemonMeta(
    hint: 'Tai to, sức khỏe phi thường, thích đào bới.',
    lore: 'Bé tai to này có đôi tai cực khỏe, có thể nhấc cả tảng đá nặng cả tấn. Nhờ vậy, bé rất được ưa chuộng ở các công trình xây dựng, giúp đỡ mọi người di chuyển vật nặng. Bé còn thích đào những đường hầm dưới lòng đất nữa!',
    rarity: 'rare',
  ),

  'fletchling': PokemonMeta(
    hint: 'Chim nhỏ múa may, hót líu lo vui tai.',
    lore: 'Những chú chim nhỏ bé này rất thân thiện, chúng giao tiếp với nhau bằng những giai điệu líu lo tuyệt đẹp và những cử động đuôi xinh xắn. Chúng thường được nhìn thấy đang vẫy đuôi trong khi chuyền cành hoặc chuyền từ cây này sang cây khác, tạo nên một cảnh tượng đáng yêu.',
    rarity: 'common',
  ),

  'fletchinder': PokemonMeta(
    hint: 'Chim nhỏ màu cam, có mỏ phun lửa.',
    lore: 'Chú chim nhỏ này có bộ lông màu cam rực rỡ, giống như những tia lửa đang nhảy múa. Khi nó tức giận hoặc đang săn mồi, từ chiếc mỏ xinh xắn sẽ phun ra những tia lửa nóng bỏng. Những tia lửa này có thể làm bốc cháy cả những lùm cỏ cao. Thế rồi, khi các con mồi nhỏ hoảng sợ nhảy ra khỏi đám cỏ cháy, chú chim sẽ nhanh nhẹn vồ lấy chúng. Đây là một cách săn mồi rất thông minh và hiệu quả của loài chim này.',
    rarity: 'rare',
  ),

  'talonflame': PokemonMeta(
    hint: 'Chim đỏ rực lửa, đôi cánh mạnh mẽ.',
    lore: 'Khi trận chiến lên cao trào, nó tung ra những tia lửa ấm áp như sưởi ấm cả không gian. Đôi cánh của nó mang sức mạnh phi thường, giúp nó lướt đi trên bầu trời cao vợi. Bạn có thể cảm nhận được sự nhiệt huyết và lòng dũng cảm của nó ngay cả từ xa.',
    rarity: 'rare',
  ),

  'scatterbug': PokemonMeta(
    hint: 'Cục bột nhỏ màu xanh lá, thích nôn bột đen gây tê liệt.',
    lore: 'Khi bị tấn công bởi các Pokémon chim, sinh vật bé nhỏ này sẽ phun ra một loại bột đen bí ẩn. Bột này không chỉ có mùi khó chịu mà còn chứa chất độc gây tê liệt tức thì khi chạm vào. Điều này giúp nó có thời gian trốn thoát khỏi nguy hiểm, ẩn mình trong những bụi cây rậm rạp để dưỡng sức và chuẩn bị cho lần lột xác kế tiếp.',
    rarity: 'common',
  ),

  'spewpa': PokemonMeta(
    hint: 'Thích ẩn mình trong bóng tối, xù lông để dọa.',
    lore: 'Sinh vật nhỏ bé này thích sống ẩn mình trong những lùm cây rậm rạp, hòa mình vào bóng tối. Khi cảm thấy nguy hiểm hoặc có kẻ săn mồi tiếp cận, nó sẽ nhanh chóng làm cho bộ lông trên khắp cơ thể dựng đứng lên. Hành động này giống như một lời cảnh báo, khiến kẻ tấn công phải dè chừng. Nó thường chỉ lộ diện khi thật sự cần thiết hoặc khi cảm thấy an toàn.',
    rarity: 'rare',
  ),

  'vivillon': PokemonMeta(
    hint: 'Cánh bướm sặc sỡ thay đổi theo nơi ở.',
    lore: 'Loài bướm này có những đôi cánh tuyệt đẹp với vô vàn kiểu dáng khác nhau, chúng được tìm thấy ở khắp mọi nơi trên thế giới. Màu sắc và hoa văn trên cánh của chúng sẽ thay đổi để phù hợp với khí hậu của nơi chúng sinh sống. Có loài có cánh như những cánh đồng hoa rực rỡ, có loài lại mang vẻ đẹp tinh tế của bầu trời đêm đầy sao. Mỗi một kiểu cánh là một câu chuyện về vùng đất mà chúng đã đi qua.',
    rarity: 'rare',
  ),

  'litleo': PokemonMeta(
    hint: 'Sư tử nhỏ với bờm rực lửa.',
    lore: 'Khi gặp đối thủ mạnh, bờm của nó bùng cháy dữ dội hơn, mang lại sức mạnh phi thường. Sinh vật này sinh sống ở những vùng đất khô cằn, nơi có ánh nắng mặt trời chiếu rọi. Nó rất dũng cảm và không ngại đương đầu với những kẻ thù hùng mạnh hơn mình. Mỗi khi chiến thắng, nó lại càng trở nên mạnh mẽ và kiên cường hơn.',
    rarity: 'common',
  ),

  'pyroar': PokemonMeta(
    hint: 'Sư tử rực lửa với bờm to lớn là thủ lĩnh.',
    lore: 'Loài này sống theo đàn, và con đực với bờm lửa lớn nhất thường là kẻ dẫn đầu. Chúng rất mạnh mẽ và bảo vệ lãnh thổ của mình. Những con cái thì nhỏ hơn và có vai trò săn mồi. Bờm lửa của con đực không chỉ để khoe mẽ mà còn giúp giữ ấm và đôi khi dùng để đe dọa đối thủ.',
    rarity: 'rare',
  ),

  'flabebe': PokemonMeta(
    hint: 'Một sinh vật nhỏ bé với bông hoa trên tay.',
    lore: 'Sinh vật này có thể điều khiển sức mạnh tiềm ẩn của hoa. Bông hoa mà nó cầm chặt dường như là một phần gắn liền với cơ thể nó. Nó rất yêu hoa và bảo vệ bông hoa của mình. Khi không có hoa, nó trở nên buồn bã. Nó có thể tìm thấy ở những nơi có nhiều hoa nở rộ, như cánh đồng hoặc khu vườn. Màu sắc của bông hoa thay đổi tùy theo giống.',
    rarity: 'common',
  ),

  'floette': PokemonMeta(
    hint: 'Đóa hoa nhỏ xinh biết chăm sóc hoa.',
    lore: 'Sinh vật bé nhỏ này yêu thích những cánh đồng hoa, nơi nó dành thời gian chăm sóc những bông hoa đang héo úa. Năng lượng bí ẩn từ hoa cỏ giúp nó trở nên mạnh mẽ trong các trận chiến, biến những bông hoa đang tàn lụi thành sức mạnh tiềm tàng. Nó mang lại vẻ đẹp và sự sống cho khu vườn của mình.',
    rarity: 'rare',
  ),

  'florges': PokemonMeta(
    hint: 'Hoa xinh đẹp, bảo vệ khu vườn',
    lore: 'Sinh vật này yêu thích những khu vườn ngập tràn hoa thơm cỏ lạ. Nó được nuôi dưỡng và trở nên mạnh mẽ hơn nhờ hấp thụ năng lượng tinh khiết tỏa ra từ những bông hoa đang khoe sắc. Nó coi những khu vườn rực rỡ là lãnh thổ của mình và sẽ bảo vệ chúng bằng tất cả sức mạnh.',
    rarity: 'rare',
  ),

  'skiddo': PokemonMeta(
    hint: 'Trông giống một chú dê con nhỏ nhắn, thích gặm cỏ êm dịu.',
    lore: 'Được cho là một trong những Pokémon đầu tiên chung sống hòa thuận với con người. Loài này có bản tính hiền lành, ưa thích những đồng cỏ xanh tươi. Chúng thường tìm kiếm những nơi yên tĩnh để nghỉ ngơi và gặm nhấm lá cây non. Bộ lông mềm mại của chúng đôi khi còn có những bông hoa nhỏ mọc lên, khiến chúng trở nên đáng yêu và hòa hợp với thiên nhiên.',
    rarity: 'common',
  ),

  'gogoat': PokemonMeta(
    hint: 'Chú dê rừng với sừng to, là người bạn đồng hành thân thiết.',
    lore: 'Sinh vật hiền lành này có thể cảm nhận tâm trạng của bạn chỉ qua cái nắm tay. Nó là biểu tượng của sự kết nối sâu sắc, có thể cùng nhau chạy băng băng như một thể. Bộ lông xù và tính cách ấm áp khiến nó trở thành người bạn tuyệt vời cho mọi cuộc phiêu lưu.',
    rarity: 'rare',
  ),

  'pancham': PokemonMeta(
    hint: 'Chú bé trúc cau có, hay gặm lá cây.',
    lore: 'Sinh vật nhỏ bé này luôn cố gắng tỏ ra đáng gờm trước đối thủ, nhưng ánh mắt nhìn trừng trừng của nó lại không đủ uy dũng. Dù vậy, hành động nhai một chiếc lá cây đã trở thành đặc trưng không thể nhầm lẫn của nó. Nó tìm kiếm sự tôn trọng, nhưng có lẽ cần thêm chút thời gian để mọc đủ lớn và đủ mạnh để kẻ thù thực sự phải dè chừng.',
    rarity: 'common',
  ),

  'pangoro': PokemonMeta(
    hint: 'Sư tử đội mũ lá, hung dữ nhưng chính trực.',
    lore: 'Chú Pokémon này có tính khí khá nóng nảy, nhưng nó không bao giờ dung thứ cho việc bắt nạt. Nó dùng chiếc lá trên miệng để cảm nhận chuyển động của kẻ thù, giống như một giác quan thứ sáu. Khi không chiến đấu, chú Pokémon này khá ôn hòa, nhưng đừng bao giờ thử thách lòng dũng cảm của nó. Nó luôn sẵn sàng đứng lên bảo vệ những kẻ yếu thế hơn.',
    rarity: 'rare',
  ),

  'espurr': PokemonMeta(
    hint: 'Tai nó che giấu sức mạnh, mắt luôn mở to.',
    lore: 'Sinh vật nhỏ bé này có đôi tai đặc biệt, dùng để che chắn và giữ lại nguồn năng lượng tâm linh khổng lồ. Đôi mắt to tròn như đang nhìn thấu mọi thứ. Nó có thể sử dụng sức mạnh này để bảo vệ bản thân hoặc thậm chí gây choáng váng cho kẻ địch. Khi cảm thấy nguy hiểm, nó sẽ tập trung sức mạnh để tránh bị phát hiện.',
    rarity: 'common',
  ),

  'meowstic': PokemonMeta(
    hint: 'Mèo có đôi tai vẫy, sức mạnh tâm linh ghê gớm.',
    lore: 'Loài mèo này có khả năng sử dụng sức mạnh tâm linh phi thường. Khi gặp nguy hiểm, đôi tai của nó sẽ dựng lên và giải phóng năng lượng đủ mạnh để biến chiếc xe tải nặng 10 tấn thành bụi mịn trong chớp mắt. Chúng thường sống trong rừng sâu và tránh xa con người, chỉ lộ diện khi cảm thấy bị đe dọa.',
    rarity: 'rare',
  ),

  'honedge': PokemonMeta(
    hint: 'Kiếm lưỡi sắc, linh hồn trú ngụ bên trong.',
    lore: 'Sinh ra từ linh hồn người đã khuất nhập vào thanh kiếm. Nó bám lấy con người, hút cạn sinh lực để tồn tại. Ai bị nó đeo bám sẽ cảm thấy yếu dần, như bị ai đó hút đi năng lượng vậy. Thanh kiếm này rất nguy hiểm, nên tránh xa khi gặp.',
    rarity: 'common',
  ),

  'doublade': PokemonMeta(
    hint: 'Hai thanh kiếm luôn đi cùng nhau, tấn công cùng lúc.',
    lore: 'Khi tiến hóa, thanh kiếm đơn ban đầu tách thành hai lưỡi sắc bén. Chúng kết nối với nhau bằng một loại thần giao cách cảm đặc biệt, giúp phối hợp những nhát chém cực kỳ chính xác. Cả hai cùng nhau lao tới, cắt địch thành từng mảnh trong chớp mắt. Chúng là những chiến binh dũng cảm, luôn sát cánh bên nhau trong mọi trận chiến.',
    rarity: 'rare',
  ),

  'aegislash': PokemonMeta(
    hint: 'Vũ khí cổ xưa này có thể điều khiển tâm trí.',
    lore: 'Trong nhiều thế kỷ, vị vua này đã tôn thờ một thanh kiếm ma thuật và chiếc khiên biết đi. Họ có sức mạnh siêu nhiên để kiểm soát người và Pokémon khác. Khi kẻ thù tấn công, họ sẽ biến đổi thành một tấm khiên vững chắc, còn đội quân của họ sẽ ẩn mình trong lưỡi kiếm sắc bén, sẵn sàng tấn công bất cứ lúc nào.',
    rarity: 'rare',
  ),

  'spritzee': PokemonMeta(
    hint: 'Chú chim nhỏ với chiếc mỏ cong, tỏa hương dịu dàng.',
    lore: 'Sinh vật nhỏ bé này mang trên mình một mùi hương đặc biệt, gọi là \'hương phấn\'. Mùi hương này có khả năng mê hoặc bất kỳ ai hít phải, khiến họ cảm thấy dễ chịu và hạnh phúc. Điều thú vị là, loại hương phấn mà nó tỏa ra có thể thay đổi tùy thuộc vào những thứ nó ăn. Nếu ăn trái cây ngọt ngào, hương phấn sẽ thơm lừng mùi hoa quả. Ngược lại, nếu ăn những loại thảo mộc đắng, hương phấn sẽ có chút cay nồng. Người ta tin rằng mùi hương này còn giúp nó giao tiếp với đồng loại và tìm kiếm bạn đời nữa.',
    rarity: 'common',
  ),

  'aromatisse': PokemonMeta(
    hint: 'Sinh vật phát ra mùi hương kỳ lạ để chiến đấu.',
    lore: 'Sinh vật này sở hữu khả năng tạo ra những mùi hương độc đáo, có thể quyến rũ hoặc xua đuổi. Khi đối mặt với kẻ thù, nó sẽ tung ra những mùi hương khó chịu để làm mất tập trung và giành lợi thế. Mùi hương của nó có thể thay đổi tùy thuộc vào mục đích, từ quyến rũ đến tấn công, khiến nó trở thành một đối thủ khó lường và thú vị.',
    rarity: 'rare',
  ),

  'swirlix': PokemonMeta(
    hint: 'Sinh vật bé nhỏ với lớp bông xoắn',
    lore: 'Một sinh vật nhỏ bé dễ thương, nó tỏa ra những sợi màu trắng ngọt ngào và dai như kẹo bông. Sợi này dùng để quấn lấy đối thủ. Khi bị đe dọa, nó sẽ phun ra những sợi này để làm chậm hoặc entrampar kẻ tấn công, giúp nó có thời gian trốn thoát hoặc chuẩn bị cho cuộc tấn công tiếp theo. Nó rất thích ăn đồ ngọt.',
    rarity: 'common',
  ),

  'slurpuff': PokemonMeta(
    hint: 'Mũm mĩm, hay ngửi, thích làm bánh.',
    lore: 'Loài sinh vật này có chiếc mũi cực thính, có thể nhận biết được mùi hương nhỏ nhất. Các đầu bếp bánh ngọt thường nhờ đến sự giúp đỡ của chúng để tạo ra những món tráng miệng thơm ngon hoàn hảo. Chúng thích được âu yếm và có một bộ lông mềm mại như kẹo bông gòn.',
    rarity: 'rare',
  ),

  'inkay': PokemonMeta(
    hint: 'Sinh vật nhỏ xoay tròn và nhấp nháy ánh sáng.',
    lore: 'Khi đối thủ nhìn vào những đốm sáng lấp lánh trên cơ thể nó, chúng sẽ trở nên choáng váng và mất hết ý chí chiến đấu. Loài sinh vật nhỏ bé này thích sống ở những nơi tối tăm và dùng khả năng phát sáng của mình để làm tê liệt kẻ thù trước khi tấn công. Nó xoay tròn cơ thể để tạo ra những ảo ảnh thị giác khiến đối phương mất phương hướng hoàn toàn.',
    rarity: 'common',
  ),

  'malamar': PokemonMeta(
    hint: 'Sinh vật này dùng mắt để thôi miên mọi thứ.',
    lore: 'Nó sở hữu sức mạnh thôi miên mạnh nhất trong tất cả các Pokémon. Bất cứ ai nhìn vào mắt nó đều trở thành con rối, làm theo mọi điều nó muốn. Sinh vật này thường sử dụng khả năng của mình để lừa gạt và bắt bầy khác làm theo ý mình, sống một cuộc đời thoải mái bằng sức lao động của người khác. Chỉ cần nhìn vào mắt nó, bạn sẽ không thể kháng cự lại mệnh lệnh của nó.',
    rarity: 'rare',
  ),

  'binacle': PokemonMeta(
    hint: 'Hai bạn nhỏ sống chung trên một tảng đá.',
    lore: 'Loài này sống theo cặp, gắn bó trên những tảng đá ven biển. Một bạn luôn bám chắc, trong khi bạn kia có thể thò chân ra ngoài để tìm kiếm thức ăn. Khi bất hòa, một trong hai sẽ rời đi để tìm bạn đồng hành mới trên một tảng đá khác.',
    rarity: 'rare',
  ),

  'barbaracle': PokemonMeta(
    hint: 'Bảy sinh vật nhỏ bám vào một cái vỏ lớn hơn.',
    lore: 'Khi tiến hóa, hai sinh vật nhỏ ban đầu nhân lên thành bảy cá thể. Chúng hợp sức chiến đấu, sử dụng sức mạnh tổng hợp của cả bảy. Mỗi cá thể đều có ý chí riêng và phối hợp nhịp nhàng để tấn công kẻ thù. Lớp vỏ cứng bên ngoài giúp bảo vệ chúng khỏi những đòn tấn công chí mạng và cho phép chúng lao vào đối thủ với tốc độ đáng kinh ngạc.',
    rarity: 'rare',
  ),

  'skrelp': PokemonMeta(
    hint: 'Trông giống tảo biển thối, phun độc vào con mồi.',
    lore: 'Loài sinh vật này ẩn mình khéo léo như những mảng rong biển phân hủy trong nước. Những kẻ săn mồi dại dột mon men lại gần sẽ bất ngờ bị phun một dòng chất lỏng độc hại. Sau đó, nó sẽ tấn công con mồi đã bị choáng váng để kết liễu.',
    rarity: 'common',
  ),

  'dragalge': PokemonMeta(
    hint: 'Sinh vật biển màu tím phun chất độc.',
    lore: 'Loài sinh vật biển độc đáo này sống ở vùng nước sâu, nơi ánh sáng mặt trời khó có thể chiếu tới. Chất độc của chúng cực kỳ mạnh, có khả năng ăn mòn kim loại dày. Chúng bảo vệ lãnh thổ của mình một cách quyết liệt, không ngần ngại phun chất độc vào bất cứ thứ gì xâm phạm. Dù trông có vẻ đáng sợ, nhưng chúng đóng vai trò quan trọng trong hệ sinh thái, giúp cân bằng các loài khác.',
    rarity: 'rare',
  ),

  'clauncher': PokemonMeta(
    hint: 'Vuốt lớn bắn nước như súng lục.',
    lore: 'Sinh vật biển này sở hữu những chiếc càng khổng lồ, có khả năng phun tia nước cực mạnh. Chúng dùng chiêu thức này để hạ gục con mồi đang bay lượn trên không. Chiếc càng còn lại thì dùng để bảo vệ bản thân và di chuyển dưới đáy biển.',
    rarity: 'common',
  ),

  'clawitzer': PokemonMeta(
    hint: 'Cặp càng to lớn bắn ra những quả cầu nước mạnh mẽ.',
    lore: 'Sinh vật biển với chiếc càng khổng lồ, có khả năng phóng ra những tia nước như tên bắn, đủ sức xuyên thủng cả những vật cứng rắn nhất. Chúng sống ở vùng biển sâu, sử dụng chiếc càng của mình để săn mồi và bảo vệ lãnh thổ. Những vụ nổ nước từ càng của nó tạo ra âm thanh vang dội dưới đáy biển.',
    rarity: 'rare',
  ),

  'helioptile': PokemonMeta(
    hint: 'Chú thằn lằn nhỏ vàng cam thích tắm nắng.',
    lore: 'Sinh vật bé nhỏ này sống ở sa mạc nóng bỏng. Chúng có khả năng đặc biệt là tự tạo ra năng lượng chỉ bằng cách phơi mình dưới ánh mặt trời rực rỡ. Vì vậy, chúng không cần phải ăn uống gì cả!  Einstein như một viên pin tí hon, luôn sẵn sàng cho cuộc phiêu lưu dưới cái nóng sa mạc.',
    rarity: 'common',
  ),

  'heliolisk': PokemonMeta(
    hint: 'Vảy trên đầu nó phát sáng rất vui.',
    lore: 'Khi muốn tạo ra thật nhiều điện, nó sẽ xòe chiếc mào quanh cổ ra. Một mình chú khủng long bé nhỏ này có thể tạo đủ điện để thắp sáng cả một tòa nhà chọc trời khổng lồ. Chúng thích tắm nắng và luôn tràn đầy năng lượng.',
    rarity: 'rare',
  ),

  'tyrunt': PokemonMeta(
    hint: 'Cậu bé khủng long hay giận dỗi, răng sắc nhọn.',
    lore: 'Sinh vật này được hồi sinh từ hóa thạch cổ xưa. Nó sở hữu một tinh thần mạnh mẽ, nhưng cũng rất bướng bỉnh. Khi gặp điều gì không vừa ý, nó sẽ trở nên rất tức giận và chạy lung tung khắp nơi, gây náo loạn. Đừng làm nó khó chịu nhé!',
    rarity: 'rare',
  ),

  'tyrantrum': PokemonMeta(
    hint: 'Hàm răng khổng lồ, bộ dạng khủng long hung tợn.',
    lore: 'Sinh vật cổ đại với bộ hàm mạnh mẽ đến kinh ngạc, có thể nghiền nát mọi thứ như giấy vụn. Trong thế giới đã lụi tàn, không gì có thể chống lại sức mạnh của nó. Nó là bá chủ của thời đại đó, một kẻ săn mồi không đối thủ với bộ hàm đáng sợ.',
    rarity: 'rare',
  ),

  'amaura': PokemonMeta(
    hint: 'Sinh vật cổ đại với những cánh lớn, đôi mắt phát sáng.',
    lore: 'Một sinh vật hóa thạch được hồi sinh từ băng giá hàng triệu năm. Nó từng sống trong một thế giới cổ xưa, nơi mặt đất phủ đầy băng tuyết. Khi đối mặt với nguy hiểm, nó có thể đóng băng kẻ thù bằng hơi thở lạnh giá của mình. Nó di chuyển nhẹ nhàng và có dáng vẻ uyển chuyển, giống như một vũ công của thời tiền sử.',
    rarity: 'rare',
  ),

  'aurorus': PokemonMeta(
    hint: 'Lưng có pha lê hình kim cương phun hơi lạnh',
    lore: 'Sinh vật cổ đại này có những viên pha lê trên mình, có khả năng tỏa ra hơi lạnh thấu xương, có thể đóng băng mọi thứ trong chớp mắt. Nó thường sống ở những vùng núi cao, nơi không khí cực kỳ lạnh giá. Những viên pha lê lấp lánh của nó không chỉ là vũ khí mà còn là cách nó thích nghi với môi trường khắc nghiệt, giúp nó duy trì nhiệt độ cơ thể hoàn hảo.',
    rarity: 'rare',
  ),

  'goomy': PokemonMeta(
    hint: 'Chú ếch màu tím trơn trượt, thích nơi ẩm ướt.',
    lore: 'Sinh vật bé nhỏ này cảm thấy dễ chịu nhất khi được ở những nơi mát mẻ, ẩm ướt và không bị ánh nắng chiếu trực tiếp. Làn da trơn nhờn của nó giúp giữ ẩm, là điều cần thiết để nó luôn khỏe mạnh.  Bạn có thể tìm thấy nó ẩn mình trong những góc tối và ẩm thấp, nơi nó cảm thấy an toàn nhất.',
    rarity: 'rare',
  ),

  'sliggoo': PokemonMeta(
    hint: 'Dịch nhầy dính chảy ra, mắt không nhìn thấy.',
    lore: 'Sinh vật bé nhỏ này phóng ra dịch nhờn cực dính, có thể làm tan chảy mọi thứ. Đôi mắt của nó đã tiêu biến hoàn toàn nên nó không thể nhìn thấy. Nó sống sót bằng cách dựa vào các giác quan khác để tìm đường đi và cảm nhận môi trường xung quanh. Khi cảm thấy nguy hiểm, nó sẽ phun chất nhờn để tự vệ và đẩy lùi kẻ thù. Chất nhờn này tuy nguy hiểm nhưng cũng là vũ khí lợi hại của nó.',
    rarity: 'rare',
  ),

  'goodra': PokemonMeta(
    hint: 'Nó thích ôm chặt với chất nhờn của mình.',
    lore: 'Sinh vật này rất hiền lành, luôn muốn ôm lấy người mình yêu quý. Nụ ôm của nó có thể khiến bạn ướt sũng chất nhờn, một chất dịch hơi dính nhưng hoàn toàn vô hại.  Nó thích chơi đùa và thể hiện tình cảm theo cách riêng của mình.  Dù trông hơi nhầy nhụa, nhưng nó lại là một người bạn đồng hành tuyệt vời, luôn mang lại sự ấm áp và vui vẻ cho mọi người.',
    rarity: 'rare',
  ),

  'phantump': PokemonMeta(
    hint: 'Một khúc gỗ có đôi mắt biết đi.',
    lore: 'Khi một linh hồn lạc lối nhập vào một gốc cây mục ruỗng, một sinh vật bé nhỏ sẽ được sinh ra. Chúng thường trốn mình trong những khu rừng hoang vắng, nơi ít người qua lại. Những tiếng khóc nhỏ bé có thể vang lên từ xa, nhưng đừng lại gần, có thể chúng đang tìm kiếm người bạn đồng hành mới để cùng chơi đùa trong lòng rừng sâu.',
    rarity: 'rare',
  ),

  'trevenant': PokemonMeta(
    hint: 'Cây khô biết đi, ẩn mình trong rừng sâu.',
    lore: 'Sinh vật này canh giữ khu rừng thiêng liêng. Nếu ai dám đốn hạ cây cối, nó sẽ dùng sức mạnh của mình để trói buộc kẻ đó, biến họ thành một phần của khu rừng mãi mãi, không bao giờ có thể thoát ra được. Nó bảo vệ thiên nhiên bằng mọi giá.',
    rarity: 'rare',
  ),

  'pumpkaboo': PokemonMeta(
    hint: 'Quả bí ngô biết cử động khi đêm xuống.',
    lore: 'Tưởng tượng một linh hồn bị mắc kẹt trong quả bí ngô. Khi hoàng hôn buông xuống, nó trở nên hiếu động và chỉ muốn vui chơi. Nó thích những nơi tối tăm và có thể thắp sáng chiếc đèn lồng trên người để dẫn đường hoặc… dọa dẫm bạn bè mới đấy!',
    rarity: 'rare',
  ),

  'gourgeist': PokemonMeta(
    hint: 'Lùm cây bí ẩn hát bài ca đáng sợ trong đêm.',
    lore: 'Vào đêm không trăng, những cái lùm cây kỳ lạ này lang thang khắp các con phố, cất lên những giọng hát ma quái. Ai lỡ nghe thấy giai điệu của chúng sẽ bị dính lời nguyền khó hiểu. Chúng thường ẩn mình nơi tối tăm, chỉ xuất hiện khi màn đêm buông xuống, mang theo sự bí ẩn và một chút rờn rợn.',
    rarity: 'rare',
  ),

  'bergmite': PokemonMeta(
    hint: 'Cục băng nhỏ có lớp vỏ cứng, tự vá lành.',
    lore: 'Sinh vật bé nhỏ này thích sống ở những nơi lạnh giá. Cơ thể được bao bọc bởi một lớp băng dày, giúp nó chống đỡ mọi đòn tấn công. Nếu lớp băng này bị nứt, nó sẽ dùng hơi lạnh xung quanh để tự động sửa chữa, tạo ra lớp băng mới cứng cáp hơn. Nó là một chiến binh kiên cường, luôn bảo vệ mình bằng lớp áo giáp băng giá.',
    rarity: 'common',
  ),

  'avalugg': PokemonMeta(
    hint: 'Cổ hãi, nặng nề, băng giá cứng rắn.',
    lore: 'Sinh vật khổng lồ này sở hữu cơ thể phủ băng cứng như thép. Với thân hình nặng nề và chậm chạp, nó không hề khoan nhượng, nghiền nát mọi thứ cản đường. Mặc dù nhìn có vẻ chậm chạp, nhưng sức mạnh của nó thật đáng gờm, tạo ra những tảng băng lớn để bảo vệ bản thân khỏi kẻ thù.',
    rarity: 'rare',
  ),

  'noibat': PokemonMeta(
    hint: 'Tai to, sống trong hang tối, phát ra âm thanh.',
    lore: 'Sinh vật bé nhỏ này thích sống trong những hang động tối đen như mực. Đôi tai to khổng lồ của chúng không chỉ để nghe mà còn có thể phát ra những làn sóng siêu âm mạnh mẽ, tần số lên đến 200.000 hertz. Những âm thanh này giúp chúng định vị và giao tiếp trong bóng tối sâu thẳm.',
    rarity: 'common',
  ),

  'noivern': PokemonMeta(
    hint: 'Rồng bay đêm, không ai thấy rõ',
    lore: 'Sinh vật này ưa thích bầu trời đêm không sao. Chúng lượn lờ không tiếng động, đôi mắt tinh tường dò tìm con mồi. Trong bóng tối, chúng là những kẻ săn mồi bậc thầy, không gì sánh kịp. Ánh sáng của đêm là chiến trường của chúng, nơi chúng thể hiện sức mạnh vượt trội và sự nhanh nhẹn đáng kinh ngạc.',
    rarity: 'rare',
  ),

  'rowlet': PokemonMeta(
    hint: 'Chim nhỏ màu xanh lá, thích bay lượn ban đêm.',
    lore: 'Loài chim nhỏ bé này rất cảnh giác. Chúng hấp thụ ánh nắng mặt trời để tích trữ năng lượng vào ban ngày, sau đó trở nên hoạt bát hơn khi màn đêm buông xuống. Chúng sử dụng đôi cánh mềm mại của mình để di chuyển một cách im lặng trong bóng tối, tìm kiếm thức ăn và khám phá thế giới xung quanh khi mọi thứ chìm vào giấc ngủ.',
    rarity: 'rare',
  ),

  'dartrix': PokemonMeta(
    hint: 'Dễ thương, thích chải chuốt bộ lông mềm mại.',
    lore: 'Chú chim nhỏ này rất tỉ mỉ với bộ lông của mình, dành thời gian rảnh để chải sửa từng chiếc lông vũ cho thật hoàn hảo. Sự chú tâm này đôi khi khiến chú quên mất xung quanh, có thể bị phân tâm bởi một đốm bụi nhỏ trên cánh. Nếu bộ lông không sạch sẽ, chú cảm thấy không tự tin và khó tập trung vào việc chiến đấu.',
    rarity: 'rare',
  ),

  'decidueye': PokemonMeta(
    hint: 'Chú chim với đôi cánh bắn tên sắc bén.',
    lore: 'Sinh vật này có đôi cánh biến hóa thành cung tên, bắn ra những chiếc lông vũ sắc nhọn với độ chính xác phi thường. Dù bay lượn trong đêm tối, nó vẫn có thể nhắm trúng mục tiêu từ xa hàng trăm mét, xuyên thủng cả những viên đá nhỏ nhất. Nó thường rình rập trong bóng tối để tấn công con mồi mà không bị phát hiện.',
    rarity: 'rare',
  ),

  'litten': PokemonMeta(
    hint: 'Chú mèo con thích táp lửa vào lông tự liếm láp.',
    lore: 'Khi liếm láp bộ lông mượt mà của mình, nó tích tụ lông trong bụng. Sau đó, nó đốt cháy đám lông đó và phun ra những đòn tấn công lửa dữ dội. Những đòn tấn công này có thể thay đổi tùy thuộc vào cách nó ho, tạo ra những hiệu ứng bất ngờ và rực rỡ.  Cứ mỗi lần ho, một luồng lửa mới lại bùng phát!',
    rarity: 'rare',
  ),

  'torracat': PokemonMeta(
    hint: 'Chuông lửa ở cổ, kêu vang khi nó phun lửa.',
    lore: 'Chú mèo con dũng cảm này có một chiếc chuông đặc biệt bằng lửa ngay cổ họng. Mỗi khi nó phun ra ngọn lửa ấm áp, chiếc chuông lại rung lên lanh lảnh. Nó rất thích nô đùa và khoe tài phun lửa của mình, khiến mọi người xung quanh cảm thấy vui vẻ hơn. Chiếc chuông lửa không chỉ là một bộ phận cơ thể mà còn là biểu tượng cho sự nhiệt huyết và năng động của chú.',
    rarity: 'rare',
  ),

  'incineroar': PokemonMeta(
    hint: 'Chú mèo lửa hoang dã, thích cào cấu nhưng cũng thích ôm ấp.',
    lore: 'Sinh vật này có tính cách bạo lực và ích kỷ.  Nếu không muốn nghe lời, nó sẽ hoàn toàn phớt lờ huấn luyện viên của mình.  Nó thích thi đấu và luôn tìm kiếm đối thủ mạnh mẽ để trổ tài.  Thậm chí, nó còn có thể điều khiển lửa từ tay của mình để tấn công đối phương.  Tuy có vẻ ngoài đáng sợ, nhưng khi đã tin tưởng ai đó, nó lại rất trung thành.',
    rarity: 'rare',
  ),

  'popplio': PokemonMeta(
    hint: 'Thổi bong bóng bằng mũi, chăm chỉ luyện tập.',
    lore: 'Loài sinh vật này nổi tiếng với sự chăm chỉ không ngừng nghỉ.  Nó có khả năng đặc biệt là dùng mũi để phun ra những bong bóng làm từ chất lỏng trong cơ thể, rồi dùng chúng để tấn công kẻ địch.  Sẽ thật vui nếu được ngắm nhìn nó làm việc hăng say!',
    rarity: 'rare',
  ),

  'brionne': PokemonMeta(
    hint: 'Chú chim nhỏ với vũ điệu nước uyển chuyển.',
    lore: 'Sinh vật đáng yêu này sở hữu những bước nhảy duyên dáng và đầy mê hoặc. Mỗi lần xoay mình, nó tung ra những quả bóng nước lung linh, tạo nên một màn trình diễn mãn nhãn. Nó sử dụng những quả bóng nước này để bảo vệ bản thân và tấn công kẻ địch một cách nhanh nhẹn. Âm thanh tiếng vỗ tay của nó như những giọt nước trong trẻo.',
    rarity: 'rare',
  ),

  'primarina': PokemonMeta(
    hint: 'Vũ công dưới nước với bong bóng nước hát êm',
    lore: 'Sinh vật biển này sở hữu giọng hát tuyệt vời, có thể điều khiển những quả bóng nước bằng giai điệu. Bài hát của nó là một truyền thống được học hỏi và truyền lại qua nhiều thế hệ, tạo nên một bản giao hưởng độc đáo của đại dương.',
    rarity: 'rare',
  ),

  'pikipek': PokemonMeta(
    hint: 'Chim nhỏ, mỏ nhọn, hay hót líu lo.',
    lore: 'Chú chim bé nhỏ này rất chăm chỉ, có thể dùng mỏ nhọn của mình đục một cái lỗ trong cây chỉ trong nháy mắt. Những chiếc lỗ này không chỉ là nơi cất giữ thức ăn mà còn là ngôi nhà ấm áp cho gia đình chim.',
    rarity: 'common',
  ),

  'trumbeak': PokemonMeta(
    hint: 'Chim ăn quả mọng, dùng hạt tấn công kẻ địch.',
    lore: 'Loài chim này đặc biệt yêu thích các loại quả mọng ngọt lành, chúng dành rất nhiều thời gian để kiếm ăn và tích trữ những hạt giống nhỏ bé trong chiếc mỏ quen thuộc của mình. Khi cảm thấy bị đe dọa bởi kẻ thù hoặc nhìn thấy con mồi, với một tiếng kêu vang, nó sẽ phóng ra tất cả hạt giống đã tích trữ tạo nên một cơn mưa hạt bất ngờ, làm đối phương hoang mang và bỏ chạy.',
    rarity: 'rare',
  ),

  'toucannon': PokemonMeta(
    hint: 'Chim nhiều màu với cái mỏ nóng rực.',
    lore: 'Thức ăn của nó là trái cây giòn, và nó thường xuyên đánh răng bằng trái cây để giữ cho chiếc mỏ của mình luôn sạch sẽ và sẵn sàng cho trận chiến. Khi chiến đấu, mỏ của nó nóng lên, có thể đốt cháy bất cứ thứ gì chạm vào.',
    rarity: 'rare',
  ),

  'yungoos': PokemonMeta(
    hint: 'Răng sắc nhọn, hay cắn mọi thứ.',
    lore: 'Loài này không phải đến từ Alola, chúng được mang đến từ nơi khác. Với bộ răng sắc bén, nó không ngần ngại tấn công bất cứ thứ gì đến gần. Chúng thường ẩn mình và bất ngờ xuất hiện, tạo nên sự bất ngờ cho kẻ địch hoặc những người xung quanh.',
    rarity: 'common',
  ),

  'gumshoos': PokemonMeta(
    hint: 'Mắt to, thích rình mồi, luôn ngủ quên.',
    lore: 'Chú thích theo dõi dấu vết con mồi. Một khi đã phát hiện ra, chú sẽ kiên nhẫn chờ đợi tại chỗ đó. Tuy nhiên, dù có say mê công việc đến đâu, màn đêm buông xuống là chú lại chìm vào giấc ngủ say sưa, bỏ lỡ mọi thứ.',
    rarity: 'rare',
  ),

  'grubbin': PokemonMeta(
    hint: 'Chú giấu mình dưới lòng đất và ăn nhựa cây ngọt.',
    lore: 'Sinh vật nhỏ bé này có bộ hàm khỏe, giúp nó cào lớp vỏ cây để hút nhựa. Chúng thường sống trong hang dưới lòng đất, nơi có thể tìm thấy nhiều thức ăn. Khi trời tối, chúng có thể trồi lên mặt đất để tìm kiếm thêm nhựa cây.',
    rarity: 'common',
  ),

  'charjabug': PokemonMeta(
    hint: 'Cục pin biết bay, thân hình tròn trịa',
    lore: 'Với cơ thể đặc biệt có thể tích trữ điện năng, sinh vật nhỏ nhắn này là người bạn đồng hành tuyệt vời cho những chuyến dã ngoại. Khi màn đêm buông xuống, sự tỏa sáng dịu nhẹ của nó cùng khả năng cung cấp năng lượng bất ngờ sẽ giúp mọi người cảm thấy ấm áp và an toàn hơn giữa thiên nhiên hoang dã.',
    rarity: 'rare',
  ),

  'vikavolt': PokemonMeta(
    hint: 'Côn trùng có càng lớn, bay nhanh, phóng điện.',
    lore: 'Sinh vật nhỏ bé này di chuyển cực nhanh, luôn tìm kiếm điểm yếu của đối thủ. Nó tích tụ năng lượng điện mạnh mẽ trong bộ hàm to lớn của mình. Khi đã sẵn sàng, nó sẽ phóng ra tia điện chớp nhoáng để tấn công kẻ thù. Đôi khi, nó nhử con mồi bằng cách rung cánh tạo ra tiếng ù ù khó chịu.',
    rarity: 'rare',
  ),

  'crabrawler': PokemonMeta(
    hint: 'Chú cua gấu đấm với càng chắc khỏe.',
    lore: 'Sinh vật này được biết đến với sự hung hăng và khả năng phòng thủ đáng gờm. Nó dùng đôi càng của mình để che chắn những điểm yếu và chờ đợi cơ hội tung ra những đòn đấm mạnh mẽ. Khi bị đánh bại, nó sẽ sùi bọt mép và ngất đi, vì vậy đừng bắt nạt nó nhé!',
    rarity: 'common',
  ),

  'crabominable': PokemonMeta(
    hint: 'Cánh tay to lớn, bộ lông dày xù trắng',
    lore: 'Sinh vật này mơ ước chinh phục đỉnh cao, nhưng lại đi lạc tới một ngọn núi tuyết lạnh giá. Bị buộc phải chống chọi với cái rét buốt, nó đã tiến hóa, khoác lên mình một lớp lông dày ấm áp để sinh tồn trong môi trường khắc nghiệt.',
    rarity: 'rare',
  ),

  'cutiefly': PokemonMeta(
    hint: 'Cánh bướm nhỏ xinh biết hút mật hoa.',
    lore: 'Sinh vật bé nhỏ này rất thích những bông hoa tươi thắm. Chúng có thể cảm nhận được năng lượng kỳ lạ bao quanh những nụ hoa sắp nở. Nhờ khả năng đặc biệt này, chúng luôn tìm được những bông hoa ngon lành nhất để thưởng thức mật ngọt và phấn hoa thơm.',
    rarity: 'common',
  ),

  'ribombee': PokemonMeta(
    hint: 'Cánh nhỏ xíu, mang theo bông hoa.',
    lore: 'Chú bướm nhỏ bé vo tròn phấn hoa thành những cục bông mềm mại. Mỗi loại phấn hoa được vo tròn có công dụng khác nhau. Một số dùng để làm thức ăn thơm ngon, bổ dưỡng, trong khi số khác lại có sức mạnh đặc biệt để hỗ trợ bạn bè trong những trận chiến thú vị. Chúng bay lượn khắp nơi, mang đến niềm vui và những điều bất ngờ.',
    rarity: 'rare',
  ),

  'rockruff': PokemonMeta(
    hint: 'Vẻ ngoài tinh nghịch, luôn thích chơi đùa.',
    lore: 'Chú cún nhỏ này rất thân thiện, nên được nhiều người yêu mến. Nhưng khi lớn lên, tính cách của nó sẽ trở nên mạnh mẽ và đôi chút khó bảo hơn. Tuy vậy, nó vẫn luôn là người bạn đồng hành đáng tin cậy cho những ai biết cách chăm sóc và yêu thương nó.',
    rarity: 'common',
  ),

  'lycanroc': PokemonMeta(
    hint: 'Chạy nhanh như chớp, bộ bờm đá sắc nhọn',
    lore: 'Sinh vật này có bộ bờm đá sắc bén, không chỉ để trang trí mà còn là vũ khí lợi hại. Với tốc độ kinh hoàng và những cú vồ chớp nhoáng, nó khiến kẻ thù lạc lối trong ảo ảnh. Móng vuốt và hàm răng chắc khỏe kết hợp với bờm đá càng làm tăng thêm sự nguy hiểm của nó.  Nó là một đối thủ đáng gờm, luôn sẵn sàng lao vào trận chiến.',
    rarity: 'rare',
  ),

  'mareanie': PokemonMeta(
    hint: 'Sinh vật biển có gai độc, tấn công bằng nhiều xúc tu.',
    lore: 'Sinh vật đáng yêu dưới đáy biển này có một chiếc gai nhọn trên đầu, dùng để tấn công con mồi. Khi con mồi yếu đi, nó sẽ dùng mười chiếc xúc tu của mình để kết liễu. Mặc dù trông có vẻ đáng sợ, nhưng nó chỉ đơn giản là muốn bắt thức ăn để sinh tồn.',
    rarity: 'common',
  ),

  'toxapex': PokemonMeta(
    hint: 'Sinh vật biển có 12 chân, di chuyển chậm chạp.',
    lore: 'Nó bò dưới đáy biển, chậm rãi và cẩn thận. Mỗi bước đi của nó, dù nhẹ nhàng, lại có thể khiến những nhánh san hô màu hồng vụn vỡ và rơi rớt lại phía sau, tạo nên một con đường kỳ lạ.  Nó không cố tình làm vậy, nhưng sức nặng trên những chiếc chân của nó đủ để để lại dấu vết trên lớp vỏ mỏng manh của những rặng san hô.',
    rarity: 'rare',
  ),

  'mudbray': PokemonMeta(
    hint: 'Chú ngựa con có đôi chân đầy bùn, chạy rất khỏe.',
    lore: 'Sinh vật nhỏ bé này mang trên mình lớp bùn đất bám chặt. Lớp bùn này không chỉ giúp nó có lực bám tốt hơn khi phi nước đại mà còn tạo nên những bước chạy mạnh mẽ, đầy uy lực. Dù nhỏ nhắn, nó lại sở hữu sức mạnh đáng kinh ngạc, có thể vượt qua nhiều địa hình khó khăn nhờ đôi chân đặc biệt này.',
    rarity: 'common',
  ),

  'mudsdale': PokemonMeta(
    hint: 'Chú ngựa mạnh mẽ toàn thân phủ đầy bùn.',
    lore: 'Loài sinh vật này có một khả năng đặc biệt, chúng phun ra một loại bùn quý giá. Loại bùn này không chỉ giúp che chắn khỏi những cơn gió mạnh mà còn chống lại những giọt mưa dai dẳng. Chính vì thế, vào thời xưa, người ta thường dùng bùn của chúng để trát lên tường nhà cũ, tạo nên những lớp bảo vệ vững chắc cho ngôi nhà trước phong ba bão táp.',
    rarity: 'rare',
  ),

  'dewpider': PokemonMeta(
    hint: 'Sinh vật nhỏ bé dùng bong bóng nước để thở và bảo vệ đầu mềm.',
    lore: 'Sinh vật nhỏ bé này sống chủ yếu ở gần nước, nhưng thỉnh thoảng lại lên cạn để kiếm thức ăn. Bong bóng nước mà nó mang trên đầu không chỉ giúp nó thở khi ở trên cạn mà còn bảo vệ phần đầu mềm yếu ớt của mình. Khi cảm thấy nguy hiểm, nó có thể ẩn mình dưới lớp bong bóng nước này.',
    rarity: 'common',
  ),

  'araquanid': PokemonMeta(
    hint: 'Đầu nó có bong bóng nước, sẵn sàng đập mạnh.',
    lore: 'Sinh vật này là một thợ săn tài ba, sử dụng chiếc bong bóng nước trên đầu mình như một vũ khí độc đáo. Nó có thể dùng chiếc bong bóng này để tấn công đối thủ bằng những cú đập đầu mạnh mẽ. Điều đáng sợ hơn là chiếc bong bóng còn có khả năng hút những kẻ địch nhỏ bé vào bên trong, nơi chúng không thể thoát ra và dần bị nhấn chìm trong nước. Một chiến thuật săn mồi đầy tàn nhẫn nhưng hiệu quả.',
    rarity: 'rare',
  ),

  'fomantis': PokemonMeta(
    hint: 'Cánh hoa trên đầu là nơi hấp thụ ánh sáng.',
    lore: 'Khi mặt trời lên, chú bé này say giấc nồng, tận hưởng những tia nắng ấm áp. Khi bóng tối buông xuống, chú thức dậy, tìm kiếm một nơi thật an toàn để tiếp tục giấc ngủ. Đôi khi, chú ẩn mình trong những bụi cây rậm rạp hoặc dưới những chiếc lá to để tránh nguy hiểm. Ánh sáng ban ngày chính là nguồn năng lượng quý giá giúp chú lớn lên từng ngày.',
    rarity: 'common',
  ),

  'lurantis': PokemonMeta(
    hint: 'Hoa lá rực rỡ, uyển chuyển như vũ công.',
    lore: 'Loài Pokemon này có bộ cánh màu sắc tươi tắn, rực rỡ như những cánh hoa. Để giữ được vẻ đẹp ấy, người chăm sóc cần dành rất nhiều thời gian và công sức, tỉ mỉ chăm chút như chăm sóc một loài hoa quý. Nhiều người xem việc này như một thú vui tao nhã, một sở thích đặc biệt để thể hiện tình yêu với chúng.',
    rarity: 'rare',
  ),

  'morelull': PokemonMeta(
    hint: 'Nó có những đốm sáng lấp lánh trên mũ.',
    lore: 'Loài nấm nhỏ bé này thích sống trong rừng sâu. Khi đêm xuống, những đốm sáng trên mũ của chúng sẽ nhấp nháy như hàng ngàn vì sao nhỏ. Ai lỡ nhìn vào thứ ánh sáng kỳ diệu ấy sẽ thấy buồn ngủ và chìm vào giấc mơ đẹp. Chúng thường ẩn mình dưới những tán lá rậm rạp, và chỉ xuất hiện khi trời tối hẳn.',
    rarity: 'common',
  ),

  'shiinotic': PokemonMeta(
    hint: 'Những đốm sáng lung linh dẫn lối trong rừng.',
    lore: 'Loài nấm phát sáng này sống sâu trong rừng. Ánh sáng kỳ lạ của nó có thể khiến những kẻ đi lạc vào rừng đêm mất phương hướng, và họ dễ dàng lạc bước, không bao giờ tìm thấy đường về nhà nữa.',
    rarity: 'rare',
  ),

  'salandit': PokemonMeta(
    hint: 'Nhỏ bé, có mào và thường phun khí độc.',
    lore: 'Sinh vật nhỏ bé này có khả năng đặc biệt là đốt cháy chất lỏng trong cơ thể để tạo ra một loại khí độc. Khi đối thủ bị choáng váng vì hít phải loại khí này, nó sẽ nhân cơ hội tấn công. Chúng thường sống ở những nơi ấm áp, ẩm ướt và rất tinh ranh trong việc săn mồi.',
    rarity: 'rare',
  ),

  'salazzle': PokemonMeta(
    hint: 'Nóng bỏng với bộ váy đỏ, nó dụ dỗ và thống trị.',
    lore: 'Loài này chỉ có con cái. Chúng sống cùng một nhóm những kẻ đi theo đực yếu hơn, những người bảo vệ chúng và mang thức ăn. Chúng có thể tạo ra một đám mây độc hại bằng cách thở ra khí gas có mùi thơm để befuddle kẻ thù hoặc những kẻ chinh phục, sau đó những kẻ chinh phục bị tấn công bởi những kẻ đi theo của chúng.',
    rarity: 'rare',
  ),

  'stufful': PokemonMeta(
    hint: 'Nhìn đáng yêu nhưng rất mạnh mẽ.',
    lore: 'Mặc dù trông cực kỳ dễ thương, nhưng khi tức giận, sinh vật này sẽ vùng vẫy dữ dội. Đôi tay và đôi chân của nó có thể khiến cả một đô vật chuyên nghiệp ngã nhào. Đừng để vẻ ngoài lừa dối bạn, nó sở hữu sức mạnh đáng kinh ngạc.',
    rarity: 'rare',
  ),

  'bewear': PokemonMeta(
    hint: 'Rất khỏe, thích ôm, đừng đến gần nó nhé!',
    lore: 'Loài vật khổng lồ này có sức mạnh phi thường, sẵn sàng dùng cánh tay vạm vỡ của mình để ôm chặt bất cứ ai lại gần. Nhưng hãy cẩn thận, cái ôm của nó có thể rất nguy hiểm! Chính vì sự nguy hiểm và sức mạnh đáng kinh ngạc, nơi sinh sống của nó thường không được phép lui tới bởi bất kỳ ai.',
    rarity: 'rare',
  ),

  'bounsweet': PokemonMeta(
    hint: 'Quả ngọt tỏa hương thơm, bị chim lớn ăn thịt.',
    lore: 'Sinh vật nhỏ bé này tỏa ra hương thơm ngọt ngào, mời gọi. Mùi hương ấy quyến rũ đến nỗi nhiều loài chim lớn, đặc biệt là Toucannon, không thể cưỡng lại và thường nuốt chửng chúng. Dù vậy, vẻ ngoài đáng yêu và mùi hương hấp dẫn khiến nhiều người yêu thích chúng như một loại trái cây độc đáo.',
    rarity: 'common',
  ),

  'steenee': PokemonMeta(
    hint: 'Chiếc mũ lá cứng giúp nó không bị tổn thương khi bị mổ.',
    lore: 'Loài này có những chiếc lá cứng trên đầu, giống như một chiếc mũ bảo hiểm tự nhiên. Chúng phát triển để bảo vệ cơ thể khỏi những cú mổ mạnh mẽ của các Pokémon chim. Nhờ lớp bảo vệ này, nó có thể thoải mái khám phá thế giới mà không lo lắng về những kẻ tấn công từ trên không. Chiếc mũ lá còn giúp nó che chắn khỏi ánh nắng gay gắt nữa.',
    rarity: 'rare',
  ),

  'tsareena': PokemonMeta(
    hint: 'Chân dài, múa may, tung cước cực hay.',
    lore: 'Những chiếc chân dài, gây ấn tượng không chỉ để trưng bày mà còn để tung ra những cú đá điêu luyện. Khi chiến thắng, nó phô diễn bằng cách đá vào đối thủ đã bị đánh bại, vừa cười lớn vừa đắc chí.',
    rarity: 'rare',
  ),

  'wimpod': PokemonMeta(
    hint: 'Chú bé nhút nhát vụng về chân văng khắp nơi.',
    lore: 'Chú bé rất sợ hãi và thường xuyên bỏ chạy. Khi cố gắng trốn thoát, vô số đôi chân bé tí của chú vung vẩy tứ tung, vô tình tạo ra một con đường lấp lánh sạch bong phía sau. Sự nhút nhát là đặc điểm nổi bật, khiến chú luôn tìm cách ẩn mình hoặc bỏ chạy khỏi mọi nguy hiểm tiềm ẩn.',
    rarity: 'rare',
  ),

  'golisopod': PokemonMeta(
    hint: 'Có móng vuốt sắc nhọn, di chuyển nhanh.',
    lore: 'Sinh vật này sống ở những vùng biển sâu, nơi có ít ánh sáng mặt trời. Nó sử dụng cặp móng vuốt khổng lồ của mình để cắt xuyên qua dòng nước và săn mồi. Với tốc độ đáng kinh ngạc, nó có thể tấn công trước khi đối phương kịp nhận ra. Sau khi trưởng thành, nó trở nên mạnh mẽ và tự tin hơn.',
    rarity: 'rare',
  ),

  'sandygast': PokemonMeta(
    hint: 'Hình dáng kỳ lạ, vui đùa dưới cát.',
    lore: 'Sinh ra từ đống cát vui tươi của một đứa trẻ, sinh vật này mang trong mình nỗi oán giận của những người đã khuất. Mặc dù trông có vẻ ngộ nghĩnh, nó lại là nơi trú ngụ của những linh hồn không cam lòng, bảo vệ ngôi nhà cát của mình bằng mọi giá.',
    rarity: 'rare',
  ),

  'palossand': PokemonMeta(
    hint: 'Vương quốc cát bí ẩn với trái tim là chiếc móng vuốt.',
    lore: 'Sinh vật cát này từng là nơi trú ẩn an toàn cho con người. Tuy nhiên, khi nó lớn mạnh hơn, nó biến con người thành nô lệ và nơi ở của chúng trở thành một pháo đài ma quái. Người ta nói rằng những ai đánh mất đường vào vương quốc cát của nó sẽ không bao giờ tìm thấy lối ra, vĩnh viễn bị giam cầm bởi câu thần chú của nó.',
    rarity: 'rare',
  ),

  'type-null': PokemonMeta(
    hint: 'Mặt nạ nặng nề, trông rất bí ẩn.',
    lore: 'Sinh vật này mang trên mình một chiếc mặt nạ cồng kềnh, che giấu sức mạnh tiềm ẩn phi thường.  Dù vẻ ngoài có chút nặng nề, bên trong nó sở hữu những khả năng đặc biệt mà ít ai biết đến.  Nó đang chờ đợi thời khắc để bộc lộ hết tiềm năng của mình và trở thành một chiến binh mạnh mẽ.',
    rarity: 'legendary',
  ),

  'silvally': PokemonMeta(
    hint: 'Hãy nhìn vào bộ giáp ánh kim và đôi mắt sáng rực của nó.',
    lore: 'Chú thú cưng này có một trái tim quả cảm, sẵn sàng bảo vệ bạn bè của mình. Nó sở hữu khả năng đặc biệt để thay đổi hình dạng, thích ứng với mọi thử thách trong trận chiến. Sức mạnh thực sự của nó đến từ tình bạn khăng khít, giúp nó vượt qua mọi khó khăn.',
    rarity: 'legendary',
  ),

  'jangmo-o': PokemonMeta(
    hint: 'Rồng nhỏ có vảy kêu leng keng.',
    lore: 'Loài rồng nhỏ đáng yêu này sống trên những ngọn núi cao. Khi buồn hay vui, nó sẽ dùng chiếc vảy trên đầu để tạo ra những âm thanh leng keng như kim loại. Tiếng động vang vọng khắp nơi, báo hiệu sự có mặt của nó giữa không trung.',
    rarity: 'rare',
  ),

  'hakamo-o': PokemonMeta(
    hint: 'Rồng nhỏ dũng cảm với vảy cứng, đấm mạnh mẽ.',
    lore: 'Sinh vật nhỏ bé này nổi tiếng với sự dũng cảm, luôn sẵn sàng lao vào đối thủ với tiếng kêu vang dội. Những cú đấm được bao phủ bởi lớp vảy sắc bén của nó có sức sát thương đáng kinh ngạc, có thể làm tung xé mọi thứ trên đường đi. Dù nhỏ con, nó sở hữu tinh thần chiến đấu mãnh liệt và không bao giờ lùi bước trước thử thách.',
    rarity: 'rare',
  ),

  'kommo-o': PokemonMeta(
    hint: 'Rồng có vảy, thích lắc đuôi tạo tiếng động.',
    lore: 'Khi phát hiện kẻ địch, nó đe dọa bằng cách rung lắc những chiếc vảy trên đuôi. Đối thủ yếu ớt sẽ hoảng sợ và bỏ chạy trong hoảng loạn. Sinh vật này thường sống ở những nơi hẻo lánh, ẩn mình trong núi. Tiếng leng keng của vảy có thể nghe thấy từ xa, báo hiệu sự hiện diện của nó.',
    rarity: 'rare',
  ),

  'cosmog': PokemonMeta(
    hint: 'Thân hình mong manh, trôi lơ lửng trong không trung.',
    lore: 'Sinh vật này có cơ thể làm từ khí và rất yếu ớt. Nó cần thời gian để thu thập bụi trong khí quyển, dần dần lớn lên.  Thường xuất hiện ở những nơi cao, nơi có nhiều bụi để nó hấp thụ.  Dù nhỏ bé, nó mang trong mình nguồn năng lượng bí ẩn và đang chờ ngày phát triển.',
    rarity: 'legendary',
  ),

  'cosmoem': PokemonMeta(
    hint: 'Trông như đang ngủ say, ấm áp khi chạm vào.',
    lore: 'Từng được gọi là chiếc kén của những vì sao, vật thể này dường như bất động, nhưng lại tỏa ra hơi ấm dịu nhẹ. Nó mang trong mình một bí ẩn thẳm sâu, gợi nhớ về những vì tinh tú lấp lánh trên bầu trời đêm.',
    rarity: 'legendary',
  ),

  'solgaleo': PokemonMeta(
    hint: 'Sư tử mặt trời rực sáng, tỏa ánh vàng khắp nơi.',
    lore: 'Sống ở một thế giới khác, nó mang trong mình ánh sáng mạnh mẽ. Ánh sáng này có thể làm bừng sáng cả những đêm tối nhất, khiến cho màn đêm u tối trở nên rực rỡ như ban ngày. Có câu chuyện kể rằng nó là hiện thân của mặt trời, mang đến sự ấm áp và hy vọng cho mọi sinh vật.',
    rarity: 'legendary',
  ),

  'lunala': PokemonMeta(
    hint: 'Cánh đêm với mắt thứ ba, bay tới thế giới khác.',
    lore: 'Sinh vật huyền bí từ vũ trụ xa xôi, mang theo bí mật của màn đêm. Khi con mắt thứ ba trên trán của nó mở ra, một cánh cửa tới thế giới khác sẽ hé mở và sinh vật này sẽ bay thẳng vào đó. Nó được cho là một hóa thân khác của một sinh vật bé nhỏ mang sức mạnh của vũ trụ.',
    rarity: 'legendary',
  ),

  'poipole': PokemonMeta(
    hint: 'Sinh vật màu tím có sừng, thích bay lượn.',
    lore: 'Chẳng ai ngờ một sinh vật đến từ thế giới khác lại có thể trở thành người bạn đồng hành đầu tiên. Nó rất được yêu quý và dường như quen với việc chăm sóc người khác.  Mỗi lần nó phun thứ gì đó ra, những đốm sáng màu tím nhỏ sẽ bay lung tung.  Nó có đôi tai lớn xinh xinh và chiếc sừng dài trên đầu.',
    rarity: 'rare',
  ),

  'naganadel': PokemonMeta(
    hint: 'Vòi rồng khổng lồ phun nọc độc mạnh mẽ.',
    lore: 'Cơ thể nó chứa hàng trăm lít chất lỏng độc hại, sẵn sàng phun trào bất cứ lúc nào. Sinh vật này là một trong những dạng sống bí ẩn được gọi là UBs. Chúng có thể xuất hiện đột ngột từ những chiều không gian khác, mang theo sức mạnh và sự nguy hiểm khó lường.',
    rarity: 'rare',
  ),

  'meltan': PokemonMeta(
    hint: 'Một khối kim loại lỏng có đuôi hình chiếc cờ.',
    lore: 'Sinh vật bé nhỏ này tồn tại nhờ việc hấp thụ kim loại từ lòng đất. Nó rỉ ra chất lỏng kim loại nóng chảy, thu hút các mảnh sắt và khoáng chất khác. Khi đã đủ, nó tự nung chảy các mảnh kim loại đó, biến chúng thành một phần cơ thể lỏng của mình. Nó thích nghi với môi trường xung quanh bằng cách thay đổi hình dạng và đôi khi để lại dấu vết lấp lánh sau khi đi qua.',
    rarity: 'mythical',
  ),

  'melmetal': PokemonMeta(
    hint: 'Cơ thể làm từ kim loại, tay cầm hai chiếc "búa" cỡ lớn.',
    lore: 'Sinh vật này từng được tôn thờ vì khả năng tạo ra sắt từ hư không. Sau ba nghìn năm yên giấc, nó đã hồi sinh một cách bí ẩn, mang theo sức mạnh cổ xưa và vẻ ngoài đồ sộ. Người ta tin rằng nó là hiện thân của sự bền bỉ và sức mạnh kim loại vĩnh cửu.',
    rarity: 'mythical',
  ),

  'grookey': PokemonMeta(
    hint: 'Chú khỉ xanh lục, chơi bằng gậy cây.',
    lore: 'Cây gậy đặc biệt của sinh vật nhỏ bé này có sức mạnh kỳ lạ. Khi nó vỗ gậy theo nhịp điệu, những làn sóng âm thanh phát ra sẽ mang theo năng lượng hồi sinh đến cây cỏ và hoa lá xung quanh.  Âm nhạc của nó làm cho mọi thứ thêm tươi tốt và rạng rỡ.  Nó rất vui vẻ khi được chia sẻ phép màu này.',
    rarity: 'rare',
  ),

  'thwackey': PokemonMeta(
    hint: 'Tai vỗ theo nhịp, bạn bè sẽ ngưỡng mộ.',
    lore: 'Chú bé này rất thích vỗ hai chiếc gậy của mình theo những nhịp điệu khác nhau. Càng vỗ nhanh và hay, chú càng được bạn bè yêu quý. Mỗi nhịp điệu chú tạo ra đều mang một ý nghĩa riêng, đôi khi là lời chào, đôi khi là lời cảnh báo. Chú luôn cố gắng luyện tập để trở thành tay trống cừ khôi trong khu rừng của mình.',
    rarity: 'rare',
  ),

  'rillaboom': PokemonMeta(
    hint: 'Chú khỉ xanh lá cây với cây trống lớn trên lưng.',
    lore: 'Khi chú khỉ này đánh trống, nó sử dụng sức mạnh từ gốc cây đặc biệt của mình. Rễ cây sẽ nghe theo lệnh của chú trong trận chiến, giúp chú tấn công và phòng thủ một cách hiệu quả.',
    rarity: 'rare',
  ),

  'scorbunny': PokemonMeta(
    hint: 'Chú thỏ nhỏ màu cam, chạy nhảy nhanh nhẹn.',
    lore: 'Khi bắt đầu sưởi ấm bằng cách chạy nhảy, năng lượng nóng bỏng tràn khắp cơ thể nó. Lúc đó, chú sẵn sàng chiến đấu hết mình với sức mạnh cao nhất.',
    rarity: 'rare',
  ),

  'raboot': PokemonMeta(
    hint: 'Lông dày ấm áp, chân bốc lửa.',
    lore: 'Chú mèo trắng với chiếc lông dày và mềm mại, luôn tỏa ra hơi ấm. Khi nó giận dữ, đôi chân sẽ bốc lên ngọn lửa rực rỡ, đủ sức làm tan chảy cả băng tuyết. Bộ lông không chỉ giữ ấm mà còn giúp nó thực hiện những đòn tấn công rực lửa mạnh mẽ hơn, để lại một vệt sáng lấp lánh mỗi khi di chuyển nhanh.\n\nNó rất thích chạy nhảy và chơi đùa, đặc biệt là trong những ngày trời lạnh. Ước mơ của chú là trở thành một chiến binh lửa dũng mãnh, bảo vệ bạn bè khỏi mọi nguy hiểm.',
    rarity: 'rare',
  ),

  'cinderace': PokemonMeta(
    hint: 'Thỏ nhảy múa, chân đá lửa.',
    lore: 'Chú thỏ tinh nghịch nhảy nhót trên đôi chân nhanh nhẹn. Nó nhặt một viên sỏi bằng chân, thổi bùng ngọn lửa biến nó thành một quả bóng đá rực cháy. Những cú sút thần tốc của chú không chỉ mạnh mẽ mà còn để lại dấu ấn bỏng rát trên đối thủ. Niềm vui của nó là tạo ra những màn trình diễn đầy lửa và tốc độ, khiến mọi trận đấu trở nên hấp dẫn hơn bao giờ hết.',
    rarity: 'rare',
  ),

  'sobble': PokemonMeta(
    hint: 'Chú ếch nhỏ màu xanh hay khóc.',
    lore: 'Khi cảm thấy sợ hãi, sinh vật này sẽ rơi lệ. Giọt nước mắt của nó cay nồng như 100 củ hành tây, khiến kẻ tấn công không thể kìm được sự xúc động mà bật khóc.',
    rarity: 'rare',
  ),

  'drizzile': PokemonMeta(
    hint: 'Chú rồng nhỏ phun nước rất giỏi.',
    lore: 'Sinh vật này rất thông minh khi chiến đấu. Nó dùng những quả bóng nước được tạo ra từ hơi ẩm tiết ra từ lòng bàn tay để tấn công kẻ thù. Đôi khi nó còn dùng những quả bóng này để tránh né đòn tấn công hoặc làm phân tán sự chú ý của đối phương. Chúng có thể tạo ra những quả bóng nước nhỏ và nhanh hoặc những quả lớn hơn để gây bất ngờ.',
    rarity: 'rare',
  ),

  'inteleon': PokemonMeta(
    hint: 'Ngón tay phun nước, màng lưng lượn bay.',
    lore: 'Sinh vật này sở hữu những khả năng bất ngờ. Từ đầu ngón tay mảnh mai, nó có thể bắn ra những tia nước mạnh mẽ, như một xạ thủ tài ba. Khi nó dang rộng tấm màng đặc biệt trên lưng, nó có thể lướt đi nhẹ nhàng trong không trung, như một bóng hình bí ẩn đang bay lượn giữa bầu trời. Đây là một vũ khí linh hoạt và đầy bất ngờ trong mọi tình huống.',
    rarity: 'rare',
  ),

  'skwovet': PokemonMeta(
    hint: 'Cái má phồng to, ham ăn quả mọng.',
    lore: 'Sinh vật nhỏ bé này sống ở vùng đất Galar. Nó luôn mang theo những quả mọng trong hai chiếc túi má xinh xắn của mình. Nếu không có quả nào, nó sẽ cảm thấy rất buồn bã và bất an. Nó thích tìm kiếm những loại quả ngon nhất để nhét đầy má, sẵn sàng cho bất kỳ lúc nào cần ăn vặt hoặc nhấm nháp.',
    rarity: 'common',
  ),

  'greedent': PokemonMeta(
    hint: 'Cái đuôi đầy quả mọng lúc nào cũng rơi vãi, chú ta không biết.',
    lore: 'Chú ta thích tích trữ thật nhiều quả mọng trong chiếc đuôi xù xì của mình. Nhưng mà, vì hơi đãng trí, chú ta thường làm rơi rớt chúng mà không hề hay biết. Cứ mỗi lần đi qua là lại thấy quả rơi tí tách, nhưng chú ta vẫn vui vẻ tiến về phía trước, nghĩ rằng mình đang có một bữa tiệc thịnh soạn.',
    rarity: 'rare',
  ),

  'rookidee': PokemonMeta(
    hint: 'Chú chim nhỏ dũng cảm, không ngại đối đầu.',
    lore: 'Dù nhỏ bé, chú chim nhỏ này luôn sẵn sàng đương đầu với bất kỳ đối thủ nào, dù mạnh mẽ đến đâu. Mỗi trận chiến, dù thắng hay thua, đều là cơ hội để nó học hỏi và trở nên mạnh mẽ hơn. Thái độ kiên cường và lòng dũng cảm không ngại thử thách làm nên sức mạnh thực sự của chú.',
    rarity: 'common',
  ),

  'corvisquire': PokemonMeta(
    hint: 'Chim có bộ lông lấp lánh, dùng đá tấn công địch.',
    lore: 'Loài chim rất thông minh này có thể dùng vật dụng trong trận chiến. Chúng thường nhặt đá và ném thật mạnh, hoặc dùng dây thừng để trói chặt đối thủ. Khả năng sáng tạo này giúp chúng trở thành những chiến binh đáng gờm.',
    rarity: 'rare',
  ),

  'corviknight': PokemonMeta(
    hint: 'Chú chim thép đen với đôi cánh mạnh mẽ.',
    lore: 'Khi bay lượn trên bầu trời Galar, sinh vật này là chúa tể của không trung. Lớp vỏ đen bóng của nó có thể khiến bất kỳ đối thủ nào cũng phải khiếp sợ. Sức mạnh và sự oai vệ của nó thực sự khiến mọi sinh vật ngưỡng mộ.',
    rarity: 'rare',
  ),

  'blipbug': PokemonMeta(
    hint: 'Chú bọ nhỏ với đôi mắt to tròn, luôn quan sát xung quanh.',
    lore: 'Sinh vật bé nhỏ này dành cả ngày để thu thập mọi thông tin mà nó có thể tìm thấy. Nó ghi nhớ mọi thứ mình nhìn thấy và nghe được, biến nó thành một nhà thông thái nhỏ bé. Mặc dù rất thông minh, nhưng cơ thể nhỏ nhắn của nó lại không có nhiều sức mạnh.',
    rarity: 'common',
  ),

  'dottler': PokemonMeta(
    hint: 'Cậu bé ốc sên màu xanh lá cây nằm yên.',
    lore: 'Ẩn mình trong chiếc vỏ cứng cáp, sinh vật nhỏ bé này dường như sống bằng cách hấp thụ năng lượng từ môi trường xung quanh. Sự tĩnh lặng và cô độc đã giúp nó phát triển những năng lực tâm linh kỳ lạ, cho phép nó cảm nhận và giao tiếp theo những cách mà chúng ta chưa hiểu hết. Dù trông có vẻ chậm chạp, nhưng bên trong lại ẩn chứa một sức mạnh tiềm ẩn.',
    rarity: 'rare',
  ),

  'orbeetle': PokemonMeta(
    hint: 'Ong bắp cày với đôi mắt to như đĩa',
    lore: 'Sinh vật trí tuệ này có bộ não khổng lồ, minh chứng cho sức mạnh tâm linh phi thường của nó. Nó nổi tiếng là loài thông minh, có thể điều khiển mọi vật bằng ý nghĩ. Hãy cẩn thận nếu bạn gặp nó, vẻ ngoài hiền lành nhưng ẩn chứa sức mạnh khó lường.',
    rarity: 'rare',
  ),

  'nickit': PokemonMeta(
    hint: 'Bạn nhỏ nhanh nhẹn, thích lén lút kiếm đồ ăn.',
    lore: 'Sinh vật bé nhỏ này có đôi chân êm ái giúp nó di chuyển thật nhẹ nhàng. Chúng thường lẻn vào nơi cất giữ thức ăn của những Pokémon khác để lấy trộm đồ ăn. Bằng cách này, chúng có thể sống sót qua ngày mà không cần phải tự mình đi săn.',
    rarity: 'common',
  ),

  'thievul': PokemonMeta(
    hint: 'Chú cáo nhỏ thầm lặng, giỏi hành động lén lút.',
    lore: 'Sinh vật này có khứu giác nhạy bén, có thể đánh hơi những thứ quý giá từ xa. Nó bí mật đánh dấu con mồi bằng một mùi hương đặc biệt. Sau đó, nó rình rập theo mùi hương đó, chờ đợi thời cơ thích hợp để lấy đi những gì mình muốn mà chủ nhân không hề hay biết. Bộ lông và đôi mắt thông minh giúp nó ẩn mình và di chuyển êm ái trong bóng tối.',
    rarity: 'rare',
  ),

  'gossifleur': PokemonMeta(
    hint: 'Hoa nhỏ xinh, một chân đứng, thích tắm nắng.',
    lore: 'Khi hoa nhỏ này tìm được chỗ thích hợp, nó sẽ cắm chắc cái chân duy nhất xuống đất. Sau đó, nó vươn mình đón ánh nắng mặt trời ấm áp. Khi đã no nê ánh sáng, những cánh hoa của nó sẽ bung nở rực rỡ, khoe sắc thật tươi tắn.',
    rarity: 'common',
  ),

  'eldegoss': PokemonMeta(
    hint: 'Tóc bông trắng bồng bềnh, tỏa hạt may mắn.',
    lore: 'Nhờ lớp bông xù mang theo những hạt giống dinh dưỡng, sinh vật nhỏ bé này vô cùng thân thiện. Khi gió thổi, những hạt giống này sẽ được lan tỏa khắp nơi. Chúng giúp cho cây cối trên mặt đất phát triển xanh tốt và đồng thời cung cấp nguồn thức ăn bổ dưỡng cho các bạn Pokemon khác. Nhờ vậy, nơi nào có sinh vật này đi qua, nơi đó sẽ tràn đầy sức sống và sự tươi mới.',
    rarity: 'rare',
  ),

  'wooloo': PokemonMeta(
    hint: 'Bộ lông xoăn mềm mại như những quả bóng len.',
    lore: 'Loài sinh vật này có bộ lông dày và xoăn tít, giống như những đám mây bông hoặc những cuộn len êm ái. Bộ lông đó không chỉ ấm áp mà còn vô cùng đàn hồi. Nếu chẳng may bị ngã từ trên cao xuống, chúng sẽ bật nhẹ nhàng như đang nảy trên một chiếc bạt lò xo khổng lồ, hoàn toàn không hề hấn gì. Chúng thường sống thành từng đàn trên những đồng cỏ xanh mướt, di chuyển uyển chuyển và đáng yêu.',
    rarity: 'common',
  ),

  'dubwool': PokemonMeta(
    hint: 'Lông bông xù, nảy tưng tưng.',
    lore: 'Bộ lông dày và đàn hồi như lò xo. Nếu dùng để dệt thảm, nó sẽ giống một chiếc bạt nhún hơn là thảm thông thường. Đặt chân lên là bạn sẽ lập tức bật lên cao. Loài này rất thích được chải chuốt bộ lông mềm mượt của mình.',
    rarity: 'rare',
  ),

  'chewtle': PokemonMeta(
    hint: 'Răng nhọn, thích cắn mọi thứ.',
    lore: 'Khi mọc răng, bé rùa con này rất ngứa nướu. Vì thế, nó hay ngậm thật mạnh vào bất cứ thứ gì ngáng đường. Chiếc mai cứng cáp bảo vệ nó khỏi những cú đớp bất ngờ. Bé rùa thích sống ở những nơi có nước để thỏa mãn cơn ngứa của mình.',
    rarity: 'common',
  ),

  'drednaw': PokemonMeta(
    hint: 'Cái mõm khổng lồ, luôn săn mồi.',
    lore: 'Sinh vật biển cổ đại này có hàm răng sắc bén như thép, đủ sức cắn nát mọi thứ. Nó cực kỳ hung hăng và sẽ không ngần ngại tấn công bất cứ thứ gì xâm phạm lãnh thổ của mình. Dù trông có vẻ chậm chạp, nhưng nó có thể lao tới rất nhanh để chộp lấy con mồi bằng bộ hàm mạnh mẽ của mình.',
    rarity: 'rare',
  ),

  'yamper': PokemonMeta(
    hint: 'Chú cún nhỏ có tai dài và đuôi búp.',
    lore: 'Ở vùng Galar, loài vật dễ thương này rất được yêu quý và được dùng để chăn gia súc. Khi chạy, chúng tạo ra điện từ phần gốc chiếc đuôi xinh xắn của mình. Chúng thường thể hiện sự vui vẻ bằng cách vẫy đuôi.',
    rarity: 'common',
  ),

  'boltund': PokemonMeta(
    hint: 'Chú chó điện chạy rất nhanh.',
    lore: 'Chú chó này có thể chạy liên tục trong ba ngày liền! Nó tạo ra điện và truyền vào chân để luôn khỏe mạnh. Khi chạy, đôi chân của nó phát sáng năng lượng.',
    rarity: 'rare',
  ),

  'rolycoly': PokemonMeta(
    hint: 'Cục đá tròn, đen, có bánh xe.',
    lore: 'Nó được tìm thấy trong các mỏ than cách đây hàng trăm năm. Cơ thể của chú tròn tròn này có cấu tạo giống như than.',
    rarity: 'common',
  ),

  'carkol': PokemonMeta(
    hint: 'Sinh vật có than đá trong người, phát sáng khi vận động.',
    lore: 'Loài Pokémon này tạo ra than đá bên trong cơ thể mình. Than đá rơi ra từ nó từng là nguồn năng lượng quý giá, nuôi sống cuộc sống của con người ở vùng Galar xưa. Khi cơ thể nóng lên, nó sẽ tỏa ra ánh sáng rực rỡ.',
    rarity: 'rare',
  ),

  'coalossal': PokemonMeta(
    hint: 'Khủng long núi lửa to lớn với than hồng rực cháy.',
    lore: 'Khi sự bình yên của nơi khai thác than bị phá hoại, sinh vật này sẽ nổi giận. Ngọn lửa nóng rực của nó có thể thiêu rụi mọi thứ, biến kẻ xấu thành tro bụi. Nó là người bảo vệ trung thành của những mỏ than, mang trong mình sức mạnh rực lửa của lòng đất.',
    rarity: 'rare',
  ),

  'applin': PokemonMeta(
    hint: 'Sinh vật nhỏ bé ẩn mình trong quả táo',
    lore: 'Loài này sống cả đời bên trong một quả táo, nó trốn tránh kẻ thù tự nhiên là các Pokémon chim bằng cách giả vờ mình chỉ là một quả táo bình thường. Sự ngụy trang này giúp nó an toàn và phát triển. Nó thậm chí còn ăn phần thịt quả để lớn lên.',
    rarity: 'common',
  ),

  'flapple': PokemonMeta(
    hint: 'Trông giống quả táo bay với đôi cánh.',
    lore: 'Trước đây, nó ăn một quả táo rất chua, điều này đã khiến nó biến đổi. Nó có khả năng lưu trữ một loại axit mạnh trong má, có thể gây bỏng hóa học.  Loại axit này rất hữu ích trong các trận chiến, giúp nó làm tê liệt đối thủ.',
    rarity: 'rare',
  ),

  'appletun': PokemonMeta(
    hint: 'Sinh vật tròn với táo trên lưng, tỏa mùi hương ngọt ngào.',
    lore: 'Một quả táo ngọt ngào đã mang đến sự tiến hóa cho nó. Mùi hương ngọt ngào tỏa ra từ cơ thể, thu hút các Pokémon côn trùng làm thức ăn. Nó sống trong những khu rừng yên tĩnh, nơi có nhiều trái cây chín mọng. Khi cảm thấy nguy hiểm, nó có thể trốn mình vào bên trong lớp vỏ táo cứng cáp của mình.',
    rarity: 'rare',
  ),

  'dipplin': PokemonMeta(
    hint: 'Trái cây mọng nước này ẩn chứa một bất ngờ ngọt ngào.',
    lore: 'Đây là hai sinh vật hòa quyện thành một. Một loại táo đặc biệt, chỉ có ở một vùng đất duy nhất, đã đánh thức khả năng tiến hóa của nó. Khi lớn lên, nó tìm kiếm những trái táo chín mọng nhất để tích trữ năng lượng và phát triển.',
    rarity: 'rare',
  ),

  'hydrapple': PokemonMeta(
    hint: 'Bảy con rắn nhỏ sống trong một quả táo siro ngọt ngào.',
    lore: 'Trong quả táo óng ánh tựa siro, bảy con rắn nhỏ bé cùng nhau sinh sống. Mỗi con đều có vai trò riêng, nhưng có một con đặc biệt hơn cả. Nó nằm ở chính giữa, như vị tướng chỉ huy tài ba, điều khiển cả đội quân của mình. Chúng cùng nhau tạo nên một vũ điệu kỳ lạ, vừa đáng yêu vừa bí ẩn, luôn sẵn sàng bảo vệ ngôi nhà ngọt ngào của mình.',
    rarity: 'epic',
  ),

  'silicobra': PokemonMeta(
    hint: 'Rắn nhỏ màu nâu với chiếc cổ phồng lên chứa đầy cát.',
    lore: 'Sinh vật nhỏ bé này rất thích đào bới. Khi đào, nó ngậm đầy cát vào miệng và cất giữ trong chiếc túi ở cổ. Chiếc túi này có thể chứa được rất nhiều cát, ước tính lên tới hơn 8kg. Số cát này có thể trở thành vũ khí lợi hại, giúp nó tự vệ hoặc tấn công những kẻ xâm phạm lãnh thổ của mình một cách bất ngờ.',
    rarity: 'common',
  ),

  'sandaconda': PokemonMeta(
    hint: 'Rắn khổng lồ phun đầy cát.',
    lore: 'Sinh vật này sống ở sa mạc. Khi nó co cơ thể lại, hàng trăm pound cát bắn ra từ mũi. Nó thu thập cát và mang theo trong chiếc bướu của mình. Nếu hết cát, nó sẽ buồn bã và mất hết tinh thần. Nó sẽ không thể chiến đấu hoặc bảo vệ bản thân nếu thiếu đi nguồn cung cấp cát quý giá này.',
    rarity: 'rare',
  ),

  'arrokuda': PokemonMeta(
    hint: 'Vũ khí lợi hại nhất là cái hàm sắc nhọn.',
    lore: 'Nó rất tự hào về chiếc hàm nhọn hoắt của mình. Nếu phát hiện có bất kỳ sự chuyển động nào xung quanh, nó sẽ lao tới ngay lập tức với chiếc hàm sắc bén làm mũi nhọn dẫn đường. Nó giống như một mũi tên lao về phía mục tiêu với tốc độ đáng kinh ngạc.',
    rarity: 'common',
  ),

  'barraskewda': PokemonMeta(
    hint: 'Mũi giáo sắc bén lao đi vun vút.',
    lore: 'Nó có bộ hàm cứng như thép, sắc như mũi giáo. Loài cá này rất khỏe và nhanh nhẹn. Điều thú vị là thịt của nó cũng có vị rất ngon. Nó xứng đáng là nỗi khiếp sợ của biển cả.',
    rarity: 'rare',
  ),

  'toxel': PokemonMeta(
    hint: 'Chú nhím nhỏ với những đốm màu độc đáo trên da.',
    lore: 'Sinh vật nhỏ bé này có một túi bên trong chứa chất độc, và nó rỉ ra qua làn da mỏng manh. Nếu bạn vô tình chạm vào, bạn sẽ cảm thấy một cảm giác ngứa ran khó chịu lan tỏa. Tuy nhiên, đừng lo lắng, cảm giác này sẽ sớm biến mất. Sinh vật này thường được tìm thấy ở những nơi ẩm ướt, thích ẩn mình trong bóng râm.',
    rarity: 'rare',
  ),

  'toxtricity': PokemonMeta(
    hint: 'Móng vuốt sáng lấp lánh đập vào ngực.',
    lore: 'Khi nó tạo ra âm thanh như đang chơi guitar, thực chất nó đang dùng móng vuốt cào vào những mấu lồi trên ngực để tạo ra điện. Tiếng đàn của nó có thể là cảnh báo hoặc lời mời gọi, tùy thuộc vào tâm trạng của nó. Sinh vật này rất thích âm nhạc và thường xuyên biểu diễn những bản nhạc điện của riêng mình, làm cho mọi thứ xung quanh rung lên.',
    rarity: 'rare',
  ),

  'sizzlipede': PokemonMeta(
    hint: 'Đốt nóng bụng vàng ruộm để tấn công kẻ xấu.',
    lore: 'Sinh vật bé nhỏ này tích trữ khí dễ cháy trong cơ thể. Khi cần, nó sử dụng lượng khí này để tạo ra hơi nóng. Đặc biệt, những mảng màu vàng trên bụng nó trở nên cực kỳ nóng bỏng, sẵn sàng làm bốc hơi mọi thứ xung quanh nếu bị đe dọa. Chúng thường sống ở những nơi ấm áp, tỏa ra lượng nhiệt dễ chịu, nhưng đừng vì thế mà đánh giá thấp sức nóng ẩn chứa bên trong.',
    rarity: 'common',
  ),

  'centiskorch': PokemonMeta(
    hint: 'Cơ thể nóng rực, quất mạnh như roi',
    lore: 'Sinh vật này có thể nóng lên tới 1500 độ F! Khi giận dữ, nó quất mạnh cơ thể như một chiếc roi lửa, lao thẳng vào kẻ địch. Vảy của nó tỏa nhiệt khủng khiếp, khiến bất kỳ ai chạm vào đều cảm thấy bỏng rát.',
    rarity: 'rare',
  ),

  'clobbopus': PokemonMeta(
    hint: 'Sinh vật bạch tuộc nhỏ bé thích đấm mọi thứ.',
    lore: 'Sinh vật nhỏ bé này rất tò mò về thế giới xung quanh. Mỗi khi muốn tìm hiểu điều gì đó, nó sẽ dùng những xúc tu của mình để đấm thử. Chính nhu cầu tìm kiếm thức ăn đã thôi thúc nó di chuyển lên đất liền. Đôi khi, sự vụng về của nó khiến nó vấp ngã, tạo ra những tiếng ồn vui nhộn.',
    rarity: 'common',
  ),

  'grapploct': PokemonMeta(
    hint: 'Cánh tay vạm vỡ, cơ bắp cuồn cuộn.',
    lore: 'Sinh vật này có cơ thể làm từ cơ bắp thuần túy, giúp những cú vật của nó với các xúc tu trở nên cực kỳ mạnh mẽ. Nó có thể siết chặt mọi thứ với sức mạnh phi thường, khiến đối thủ khó lòng thoát ra.  Nó cực kỳ thích thi triển sức mạnh trong những trận đấu tay đôi.',
    rarity: 'rare',
  ),

  'sinistea': PokemonMeta(
    hint: 'Một tách trà nhỏ bé, thích trốn trong đồ sứ.',
    lore: 'Người ta tin rằng một linh hồn cô đơn đã nhập vào một cốc trà nguội lạnh còn sót lại mà sinh ra sinh vật này. Nó rất nhút nhát và chỉ xuất hiện khi không có ai nhìn, thường ẩn mình trong những món đồ bằng sứ cũ hoặc những vật dụng tương tự, chờ đợi để chia sẻ chút hơi ấm của mình với những ai tìm thấy nó.',
    rarity: 'rare',
  ),

  'polteageist': PokemonMeta(
    hint: 'Chú yêu tinh nhỏ trong ấm trà cổ.',
    lore: 'Sinh vật nhỏ bé này ẩn mình trong những ấm trà cổ kính. Hầu hết những chiếc ấm tìm thấy đều chỉ là đồ giả mạo, nhưng đôi khi, may mắn thay, lại phát hiện ra một tác phẩm đích thực.  Nó thích cuộc sống yên tĩnh và thưởng thức trà.',
    rarity: 'rare',
  ),

  'hatenna': PokemonMeta(
    hint: 'Đầu với cái sừng, cảm nhận tâm trạng.',
    lore: 'Loài sinh vật này dùng phần nhô ra trên đầu để dò tìm cảm xúc của người khác. Nếu bạn không giữ được sự bình tĩnh, nó sẽ không bao giờ thân thiết với bạn. Nó rất nhạy cảm với những rung động tiêu cực và chỉ mong muốn được ở bên cạnh những người có trái tim ấm áp và tâm hồn thanh thản. Giao tiếp với nó đòi hỏi sự kiên nhẫn và một ý chí tĩnh tại.',
    rarity: 'common',
  ),

  'hattrem': PokemonMeta(
    hint: 'Tai rung rung, tóc xoăn, cảm xúc mãnh liệt',
    lore: 'Sinh vật này có khả năng đặc biệt là cảm nhận và phản ứng với cảm xúc mạnh mẽ. Khi ai đó thể hiện sự giận dữ, buồn bã hay quá phấn khích, nó sẽ im lặng họ một cách quyết liệt bằng năng lượng bí ẩn của mình. Dù trông có vẻ mong manh, nó mang trong mình sức mạnh đáng gờm để bảo vệ sự yên tĩnh khỏi những rung động cảm xúc tiêu cực.',
    rarity: 'rare',
  ),

  'hatterene': PokemonMeta(
    hint: 'Tóc dài, đội mũ, vẻ mặt cau có.',
    lore: 'Sinh vật này tỏa ra sức mạnh tinh thần đáng kể, đủ gây nhức đầu cho bất kỳ ai mon men lại gần. Nó sử dụng khả năng này để bảo vệ không gian riêng tư, giữ cho thế giới bên ngoài tránh xa. Vẻ ngoài có phần u buồn ẩn chứa một ý chí mạnh mẽ để được yên tĩnh.',
    rarity: 'rare',
  ),

  'impidimp': PokemonMeta(
    hint: 'Cái mũi của nó hút lấy sự khó chịu',
    lore: 'Sinh vật bé nhỏ này sống nhờ vào những cảm xúc tiêu cực. Khi ai đó bực bội hoặc khó chịu, nó sẽ \'hút\' lấy năng lượng đó qua chiếc mũi đặc biệt của mình. Món \'ăn\' này giúp nó khỏe mạnh và vui vẻ. Nó thường ẩn mình ở những nơi có người hoặc Pokémon hay cằn nhằn, tìm kiếm \'bữa ăn\' tiếp theo.',
    rarity: 'common',
  ),

  'morgrem': PokemonMeta(
    hint: 'Nó hay giả vờ làm nũng để dụ dỗ kẻ địch.',
    lore: 'Sinh vật này có mái tóc dài như lưỡi giáo, rất nguy hiểm. Khi nó cúi mình xuống như muốn xin tha thứ, đó là dấu hiệu cảnh báo. Nó đang âm mưu đánh lừa đối phương bằng vẻ ngoài đáng thương, rồi bất ngờ tấn công bằng những sợi tóc sắc nhọn của mình.',
    rarity: 'rare',
  ),

  'grimmsnarl': PokemonMeta(
    hint: 'Tóc quấn quanh người, cơ bắp cuồn cuộn.',
    lore: 'Chiếc áo choàng bằng tóc này không chỉ giữ ấm mà còn có sức mạnh phi thường. Nó có thể bám vào bất cứ thứ gì, sử dụng bộ lông làm dây thừng để trèo lên vách đá hoặc quất mạnh vào đối thủ. Sức mạnh của nó vượt xa vẻ ngoài lôi thôi, thậm chí có thể đánh bại những đối thủ to lớn hơn rất nhiều.',
    rarity: 'rare',
  ),

  'milcery': PokemonMeta(
    hint: 'Bé con màu trắng xinh, làm từ kem mềm mại.',
    lore: 'Sinh ra từ những hạt li ti thơm ngọt trong không khí, cơ thể của Pokémon này mềm mại như kem tươi. Khi di chuyển, nó để lại một vệt sáng lấp lánh và hương thơm dịu nhẹ lan tỏa khắp nơi. Nó rất vui vẻ và thích được ôm ấp.',
    rarity: 'common',
  ),

  'alcremie': PokemonMeta(
    hint: 'Chú bánh ngọt đội mũ kem xinh xắn.',
    lore: 'Khi cảm thấy tin tưởng bạn, chú sẽ đãi bạn những loại quả mọng được trang trí bằng lớp kem mềm mịn. Mỗi lần chú xuất hiện, không khí xung quanh đều trở nên ngọt ngào và vui vẻ.',
    rarity: 'rare',
  ),

  'snom': PokemonMeta(
    hint: 'Chú nhỏ phủ sương, trông như cành băng giá.',
    lore: 'Khi ngủ, sinh vật nhỏ bé này phun ra những sợi chỉ lạnh lẽo. Nó dùng những sợi chỉ này để tự buộc mình vào cành cây, trông giống như một cây băng giá. Cách ngụy trang này giúp nó tránh được kẻ thù và giữ ấm trong cái lạnh.',
    rarity: 'common',
  ),

  'frosmoth': PokemonMeta(
    hint: 'Đôi cánh phủ băng tuyết, phát sáng trong đêm.',
    lore: 'Khi nó bay qua những cánh đồng và núi non, những chiếc vảy băng giá rơi xuống như tuyết. Nhiệt độ đôi cánh của nó lạnh hơn -178 độ C, khiến mọi thứ nó chạm vào đều đóng băng ngay lập tức. Những người dân địa phương tin rằng nó mang đến một mùa đông lạnh giá nhưng cũng mang lại vẻ đẹp lộng lẫy cho phong cảnh.',
    rarity: 'rare',
  ),

  'cufant': PokemonMeta(
    hint: 'Chú voi nhỏ với chiếc vòi khỏe mạnh.',
    lore: 'Sinh vật đáng yêu này dùng chiếc vòi to lớn của mình để đào bới đất đá một cách dễ dàng. Nó sở hữu sức mạnh phi thường, có thể nhấc bổng những vật nặng gấp hơn 5 tấn mà không hề nao núng. Dù có vẻ ngoài hơi vụng về, nhưng nó lại cực kỳ hữu ích trong việc vận chuyển đồ đạc trên những quãng đường dài. Đừng để vẻ ngoài của nó đánh lừa, nó là một người bạn đồng hành đáng tin cậy và mạnh mẽ.',
    rarity: 'common',
  ),

  'copperajah': PokemonMeta(
    hint: 'Chú voi xanh to lớn với làn da mát lạnh.',
    lore: 'Loài voi hiền lành này đã đến từ một vùng đất xa xôi từ rất lâu rồi. Chúng luôn sẵn lòng giúp đỡ con người trong công việc. Làn da xanh độc đáo của chúng có khả năng chống nước tuyệt vời, giúp chúng thoải mái làm việc dưới trời mưa hoặc gần nguồn nước. Chúng rất mạnh mẽ và đáng tin cậy.',
    rarity: 'rare',
  ),

  'dreepy': PokemonMeta(
    hint: 'Sinh vật màu xanh tìm kiếm bóng tối, trôi nổi buồn bã.',
    lore: 'Sau khi hóa thân thành một Pokémon ma, nó lang thang trên những vùng đất từng sống trong biển cả xa xưa. Dù đã qua đời, nó vẫn mang theo ký ức về cuộc sống trước đây, thường xuất hiện ở những nơi có nhiều nước và bóng tối, tìm kiếm điều gì đó đã mất hoặc đơn giản là để cảm nhận lại nhịp thở của thế giới sinh vật.',
    rarity: 'rare',
  ),

  'drakloak': PokemonMeta(
    hint: 'Bạn biết con rồng nhỏ với lớp phủ bay lượn không?',
    lore: 'Chú rồng nhỏ bé này có tốc độ bay hơn 190 km/h. Nó luôn đồng hành và chăm sóc cho những chú Dreepy cho đến khi chúng tiến hóa thành công. Nó rất yêu thương và bảo vệ những chú Dreepy của mình.',
    rarity: 'rare',
  ),

  'dragapult': PokemonMeta(
    hint: 'Rồng nhìn giống khủng long, có sừng và đuôi.',
    lore: 'Khi không chiến đấu, rồng giữ những sinh vật nhỏ trong các lỗ trên sừng. Khi trận chiến bắt đầu, nó sẽ phóng những sinh vật này đi với tốc độ kinh hoàng, như những tên lửa siêu thanh lao tới đối thủ.',
    rarity: 'rare',
  ),

  'kubfu': PokemonMeta(
    hint: 'Chú gấu nhỏ ham học hỏi, say mê luyện tập.',
    lore: 'Sinh vật bé nhỏ này dành cả ngày để rèn luyện các kỹ năng chiến đấu. Sự kiên trì và những đòn thế nó nắm vững sẽ quyết định hình dáng tương lai khi nó trưởng thành.  Mỗi buổi tập là một bước tiến để trở nên mạnh mẽ hơn, sẵn sàng đối mặt với mọi thử thách.',
    rarity: 'legendary',
  ),

  'urshifu': PokemonMeta(
    hint: 'Võ sĩ mạnh mẽ với nắm đấm cứng như thép.',
    lore: 'Được ban tặng sức mạnh của một nghìn lần tập luyện, sinh vật này chuyên sử dụng một đòn tấn công duy nhất để hạ gục đối thủ. Nó lao tới với tốc độ kinh hoàng, tung ra một cú đấm đủ mạnh để phá tan mọi phòng thủ. Đòn tấn công này là đỉnh cao của sự kỷ luật và sức mạnh ẩn giấu.',
    rarity: 'legendary',
  ),

  'sprigatito': PokemonMeta(
    hint: 'Bạn mèo con với bộ lông xanh mướt như lá cây.',
    lore: 'Cậu bạn nhỏ bé này có bộ lông mềm mại đặc biệt, trông giống như những chiếc lá nhỏ vậy đó! Để bộ lông luôn xanh tươi và không bị khô, bạn ấy rất chăm chỉ lúc nào cũng rửa mặt sạch sẽ. Bạn ấy thích nô đùa và khám phá xung quanh với vẻ tinh nghịch đáng yêu.',
    rarity: 'rare',
  ),

  'floragato': PokemonMeta(
    hint: 'Chiếc đuôi dài giấu một chiếc roi hoa.',
    lore: 'Sinh vật nhỏ bé này rất nhanh nhẹn và thích trêu đùa. Nó thường giấu những chiếc gai cứng như đá bên dưới bộ lông mềm mại của mình. Khi cần, nó sẽ dùng chiếc roi hoa đó để tấn công đối thủ một cách bất ngờ. Mặc dù trông có vẻ dễ thương nhưng nó có thể tung ra những cú đánh khá mạnh mẽ.',
    rarity: 'rare',
  ),

  'meowscarada': PokemonMeta(
    hint: 'Hoa nở trên mặt nạ, ảo ảnh lơ lửng kỳ lạ.',
    lore: 'Chú mèo này có bộ lông ấm áp như nhung, che giấu cành hoa bên trong chiếc áo choàng. Lớp lông phản chiếu tạo ra ảo ảnh khiến bông hoa trông như đang tự mình bay lơ lửng trên cao.  Nó rất thích chơi đùa và sử dụng phép thuật che mắt kẻ thù, xuất hiện và biến mất như một bóng ma trong rừng cây.',
    rarity: 'rare',
  ),

  'fuecoco': PokemonMeta(
    hint: 'Có vảy hình vuông, thích nằm trên đá ấm.',
    lore: 'Sinh vật nhỏ bé này thích nằm dài trên những tảng đá ấm áp. Lớp vảy vuông của nó hấp thụ nhiệt từ mặt trời, rồi sử dụng lượng nhiệt đó để tạo ra năng lượng lửa. Điều này giúp nó luôn ấm áp và sẵn sàng cho những cuộc phiêu lưu.',
    rarity: 'rare',
  ),

  'crocalor': PokemonMeta(
    hint: 'Lửa hình quả trứng trên đầu, trông rất vui nhộn.',
    lore: 'Một sinh vật nhỏ bé với nguồn năng lượng ấm áp chảy tràn. Bên trong cơ thể nó ẩn chứa một quả cầu lửa nhỏ bé hình dạng giống quả trứng, luôn tỏa ra hơi nóng dễ chịu. Khi vui vẻ, quả cầu lửa này có thể nhảy múa nhẹ nhàng, mang đến không khí ấm áp và tràn đầy sức sống cho mọi người xung quanh. Ồ, đôi khi nó còn phát ra những tiếng kêu líu lo vui tai nữa đấy!',
    rarity: 'rare',
  ),

  'skeledirge': PokemonMeta(
    hint: 'Chim lửa phát ra bản nhạc ấm áp và rực cháy.',
    lore: 'Chim lửa này thay đổi hình dạng khi chú chim hồng hạc hát. Người ta đồn rằng chú chim này ra đời khi quả cầu lửa trên đầu chú chim hồng hạc có linh hồn. Khi cất tiếng hát, chú chim hồng hạc sẽ tạo ra một vũ điệu lửa, những cánh hoa lửa sẽ rơi xuống như những nốt nhạc trong bản giao hưởng của chú. Nhạc của chú có sức mạnh xoa dịu nỗi buồn và mang đến niềm vui cho mọi người xung quanh.',
    rarity: 'rare',
  ),

  'quaxly': PokemonMeta(
    hint: 'Chú chim nhỏ màu xanh với chiếc mào duyên dáng.',
    lore: 'Loài sinh vật này đã đến vùng đất Paldea từ những nơi xa xôi từ rất lâu rồi. Chất nhờn tiết ra từ bộ lông giúp giữ cho chúng luôn sạch sẽ và khô ráo, ngay cả khi tiếp xúc với nước hay bùn đất văng lên. Chúng thường xuất hiện gần mặt nước.',
    rarity: 'rare',
  ),

  'quaxwell': PokemonMeta(
    hint: 'Chú chim xanh thích nhảy múa dưới nước.',
    lore: 'Sinh vật bé nhỏ với đôi chân khỏe mạnh này dành cả ngày để chạy nhảy và tập luyện trong làn nước nông. Chúng thích thi đấu xem ai có thể đá nước một cách uyển chuyển và đẹp mắt nhất. Những cú đá của chúng trông như những điệu nhảy nước đầy mê hoặc, khiến ai nhìn thấy cũng phải trầm trồ.',
    rarity: 'rare',
  ),

  'quaquaval': PokemonMeta(
    hint: 'Chú chim nhảy múa với đôi chân mạnh mẽ.',
    lore: 'Với những bước nhảy uyển chuyển và đôi chân có lực vô tận, sinh vật này có thể tung ra những cú đá mạnh đến mức có thể làm chiếc xe tải lăn bánh. Nó học được những vũ điệu đặc sắc từ những vùng đất xa xôi để thể hiện bản thân và thu hút sự chú ý.\n',
    rarity: 'rare',
  ),

  'lechonk': PokemonMeta(
    hint: 'Lợn ta mập mạp, ham ăn, thích ngửi đất.',
    lore: 'Chú heo nhỏ bé luôn mải miết tìm kiếm thức ăn từ sáng đến tối.  Chiếc mũi thính nhạy bén giúp chú lần ra những món ngon giấu trong lòng đất, nhưng chú chỉ dùng nó cho việc ăn uống mà thôi.  Dù hơi vụng về, chú rất đáng yêu và thích được vuốt ve.',
    rarity: 'common',
  ),

  'oinkologne': PokemonMeta(
    hint: 'Da bóng mịn, đuôi tỏa hương thơm.',
    lore: 'Loài heo này rất tự hào về lớp da bóng mượt của mình. Chúng có khả năng tiết ra một mùi hương đặc biệt từ chóp đuôi. Mùi hương này có thể khiến những thứ xung quanh cảm thấy dễ chịu và thư giãn. Chúng thường sống trong các khu rừng rậm, tìm kiếm thức ăn và vui đùa.',
    rarity: 'rare',
  ),

  'tarountula': PokemonMeta(
    hint: 'Giống như một quả bóng len, nó cuộn tròn để tự vệ.',
    lore: 'Niềm tự hào của sinh vật bé nhỏ này là cuộn chỉ đàn hồi bao quanh cơ thể. Sợi chỉ này dai chắc đến nỗi có thể đỡ được lưỡi hái sắc bén của kẻ thù truyền kiếp. Nhờ sự khéo léo và sợi chỉ đặc biệt, nó có thể xoay sở và né tránh mọi nguy hiểm, tự tin dạo bước trong thế giới rộng lớn.',
    rarity: 'common',
  ),

  'spidops': PokemonMeta(
    hint: 'Nhện giăng tơ, lơ lửng trong bóng đêm.',
    lore: 'Sinh vật này là bậc thầy ẩn mình, sử dụng những sợi tơ mỏng manh để bám vào mọi bề mặt. Nó di chuyển êm ái đến nỗi con mồi không hề hay biết sự hiện diện của nó cho đến khi quá muộn.  Với sự kiên nhẫn và khéo léo, nó rình rập trong bóng tối, chờ đợi thời điểm thích hợp để tấn công mà không gây ra tiếng động.',
    rarity: 'rare',
  ),

  'nymble': PokemonMeta(
    hint: 'Chân giấu, bật nhảy xa bất ngờ.',
    lore: 'Khi bị dồn vào đường cùng, sinh vật bé nhỏ này có thể sử dụng sức mạnh đôi chân tiềm ẩn để bật nhảy xa hơn 30 feet, như một cú phóng mình ấn tượng để thoát thân. Đôi khi, đôi chân thứ ba của nó vẫn còn gấp lại, chờ thời cơ hành động.',
    rarity: 'common',
  ),

  'lokix': PokemonMeta(
    hint: 'Kiến nhỏ nhanh nhẹn, đôi chân đặc biệt',
    lore: 'Khi xung trận, nó đứng thẳng trên đôi chân đã gấp lại, kích hoạt Chế độ Biểu diễn. Kẻ địch sẽ nhanh chóng bị hóa giải. Sức mạnh của nó thể hiện qua tốc độ và sự quyết đoán, khiến mọi đối thủ đều phải dè chừng.',
    rarity: 'epic',
  ),

  'pawmi': PokemonMeta(
    hint: 'Chú béo má hồng có hai cục điện nhỏ.',
    lore: 'Cậu bé này có những túi điện chưa phát triển trên má. Những túi này chỉ có thể tạo ra điện nếu chú dùng đệm chân trước của mình xoa mạnh vào chúng. Đôi khi, chú ấy sẽ làm điều này một cách ngẫu hứng, và tia lửa nhỏ tóe ra sẽ khiến chú ấy nhảy cẫng lên vì ngạc nhiên. Rất đáng yêu và đôi khi hơi giật mình!',
    rarity: 'common',
  ),

  'pawmo': PokemonMeta(
    hint: 'Chú sóc điện mượt mà, sẵn sàng chiến đấu.',
    lore: 'Khi nguy hiểm ập đến, chú nhanh nhẹn lao vào trước. Với những cú đánh mạnh mẽ kết hợp với dòng điện, chú bảo vệ bạn bè khỏi kẻ thù. Vẻ ngoài nhanh nhẹn và bộ lông mềm mại ẩn chứa sức mạnh phi thường.',
    rarity: 'rare',
  ),

  'pawmot': PokemonMeta(
    hint: 'Chú gấu điện hoạt náo, sẵn sàng tấn công.',
    lore: 'Thông thường, nó có vẻ hơi chậm chạp, nhưng khi bước vào trận chiến, nó sẽ hạ gục kẻ thù bằng những bước di chuyển nhanh như chớp. Với đôi tay rực điện, nó có thể tạo ra những cú đấm mạnh mẽ và nhanh đến mức đối thủ khó lòng né tránh. Khi chiến đấu, nguồn năng lượng bên trong nó bùng nổ, biến nó thành một vũ điệu sấm sét đầy uy lực.',
    rarity: 'rare',
  ),

  'tandemaus': PokemonMeta(
    hint: 'Cặp song sinh bé nhỏ, lúc nào cũng dính nhau.',
    lore: 'Sinh vật nhỏ bé này sống theo cặp, luôn vui vẻ bên nhau. Chúng có cặp răng cửa nhỏ xinh, rất khéo léo dùng để cắt nhỏ những vật liệu mà chúng tìm thấy. Mục đích của chúng là gom góp những món đồ này để xây dựng tổ ấm thật ấm cúng và an toàn. Khi đã có đủ, chúng sẽ nhanh chóng mang về tổ của mình, luôn cố gắng làm việc cùng nhau thật ăn ý.',
    rarity: 'common',
  ),

  'maushold': PokemonMeta(
    hint: 'Một bầy chuột nhỏ bé nhảy nhót trên mặt đất.',
    lore: 'Chúng xuất hiện bất ngờ, nhỏ xíu và đáng yêu. Có thể là anh em họ hàng, nhưng thật khó để biết chắc chắn về gia đình của chúng. Bầy hoan hỉ này luôn đi cùng nhau, tạo nên một cảnh tượng vui nhộn.',
    rarity: 'rare',
  ),

  'fidough': PokemonMeta(
    hint: 'Cục bột tròn xoe, phồng xốp, có tai mềm mại.',
    lore: 'Chiếc bánh mì bé bỏng này tỏa ra mùi hương ngọt ngào quyến rũ. Hơi thở của nó chứa men, có khả năng khiến mọi thứ xung quanh lên men, biến chúng thành những mẻ bánh thơm lừng. Ôm ấp chú Pokémon này bạn sẽ cảm nhận được sự mềm mại và ẩm ướt dễ chịu, như chạm vào một ổ bánh mì mới ra lò.',
    rarity: 'common',
  ),

  'dachsbun': PokemonMeta(
    hint: 'Chú cún với chiếc bánh mì trên đầu.',
    lore: 'Chú cún đáng yêu này thải ra một mùi hương khoan khoái, giúp cây lúa mì phát triển mạnh mẽ. Vì vậy, những ngôi làng nông nghiệp luôn yêu quý và gìn giữ chú như một báu vật. Mùi hương quyến rũ của chú còn có thể khiến mọi người cảm thấy thư thái, như đang thưởng thức một chiếc bánh mì thơm lừng vừa ra lò vậy.',
    rarity: 'rare',
  ),

  'smoliv': PokemonMeta(
    hint: 'Quả trên đầu tỏa ra chất nhờn cay đắng',
    lore: 'Khi gặp nguy hiểm, quả trên đầu chú bắt đầu tiết ra một lớp dầu. Chất dầu này có vị rất đắng và chát, đủ sức khiến kẻ thù phải nhăn mặt lùi bước. Chú mang theo thứ vũ khí tự vệ tự nhiên này để bảo vệ bản thân khỏi mọi mối đe dọa xung quanh.',
    rarity: 'common',
  ),

  'dolliv': PokemonMeta(
    hint: 'Sinh vật nhỏ thơm tho, thích chia sẻ',
    lore: 'Nó có một loại dầu ngọt ngào, tươi mát để chia sẻ cùng những người bạn. Sinh vật này đã sống cùng con người từ rất lâu rồi, tạo nên một tình bạn bền chặt qua nhiều thế hệ. Mùi hương từ cơ thể nó mang lại cảm giác dễ chịu và thư thái.',
    rarity: 'rare',
  ),

  'arboliva': PokemonMeta(
    hint: 'Cây xanh có trái ngọt, lòng nhân hậu.',
    lore: 'Một Pokémon dịu dàng và giàu lòng trắc ẩn. Nó sẵn lòng chia sẻ thứ dầu bổ dưỡng, thơm ngon của mình cho những Pokémon yếu đuối. Tinh dầu này mang lại sức sống và giúp phục hồi nhanh chóng. Nhờ sự hào phóng này, nó luôn được yêu mến và kính trọng trong thế giới tự nhiên. Vẻ ngoài hiền lành và hành động cao đẹp khiến nó trở thành biểu tượng của sự sẻ chia.',
    rarity: 'rare',
  ),

  'nacli': PokemonMeta(
    hint: 'Tảng đá mặn nhỏ nhắn, cực kỳ hữu ích.',
    lore: 'Sinh vật bé nhỏ này đến từ những tầng sâu thẳm của lòng đất, nơi có những lớp đá muối dày đặc. Thuở xưa, chúng được coi là báu vật vì khả năng chia sẻ lượng muối quý giá. Chính sự hào phóng này đã giúp ích cho rất nhiều người và cộng đồng xung quanh, khiến chúng trở thành những người bạn đồng hành đáng tin cậy.',
    rarity: 'common',
  ),

  'naclstack': PokemonMeta(
    hint: 'Tạo ra những tảng muối trắng bằng nước biển.',
    lore: 'Sinh vật này là bậc thầy phù phép biển cả. Nó có khả năng hút cạn nước trong cơ thể con mồi bằng cách phun những tinh thể muối tinh khiết. Quá trình "phơi khô" này biến con mồi thành những tác phẩm điêu khắc mặn mà, giữ lại hình dáng ban đầu nhưng mất đi sự sống. Một số người dân làng ven biển đồn rằng những tảng muối này chứa đựng những câu chuyện xưa cũ của đại dương.',
    rarity: 'rare',
  ),

  'garganacl': PokemonMeta(
    hint: 'Đá mặn khổng lồ, có ngón tay rắc muối.',
    lore: 'Khi thấy bạn bè bị thương, sinh vật này sẽ dùng những ngón tay đặc biệt của mình để rắc một loại muối kỳ diệu lên vết thương.  Chỉ cần một chút muối ấy thôi, dù vết thương có nặng đến đâu cũng sẽ mau chóng lành lại.  Nó rất tốt bụng và luôn sẵn sàng giúp đỡ những ai gặp khó khăn.',
    rarity: 'rare',
  ),

  'charcadet': PokemonMeta(
    hint: 'Một cục than hồng rực nhảy múa với ý chí chiến đấu.',
    lore: 'Khi than hồng của bếp lửa nguội dần, một sinh linh bé nhỏ với ngọn lửa rực cháy bên trong đã chào đời. Sinh vật này mang trong mình một tinh thần chiến đấu quả cảm, không ngại ngần đối mặt với bất kỳ đối thủ nào, dù mạnh mẽ đến đâu. Ánh sáng ấm áp từ cơ thể nó có thể xua tan bóng tối, mang lại hy vọng cho những ai yếu đuối.',
    rarity: 'rare',
  ),

  'armarouge': PokemonMeta(
    hint: 'Chiến binh rực lửa với áo giáp lớn.',
    lore: 'Vốn là một chiến binh dũng mãnh, sau khi khoác lên mình bộ giáp cổ xưa, nó đã biến đổi thành một chiến binh trung thành. Bộ giáp này mang theo sức mạnh cùng tinh thần kiên cường của chủ nhân cũ. Nó luôn sẵn sàng chiến đấu bảo vệ bạn bè.',
    rarity: 'epic',
  ),

  'ceruledge': PokemonMeta(
    hint: 'Vũ khí rực lửa trên tay vung lên trong cơn giận dữ.',
    lore: 'Những lưỡi kiếm rực lửa trên cánh tay nó cháy bùng với sự uất hận còn sót lại của một người sử dụng kiếm đã gục ngã trước khi hoàn thành mục tiêu. Nó không ngừng rèn luyện, hy vọng một ngày nào đó sẽ tìm thấy ý nghĩa mới cho sức mạnh của mình và trả lại công bằng cho người chủ cũ bằng những đòn tấn công mạnh mẽ. Mỗi đường kiếm là một lời nhắc nhở về quá khứ, thôi thúc nó tiến lên phía trước.',
    rarity: 'epic',
  ),

  'tadbulb': PokemonMeta(
    hint: 'Sinh vật nhỏ bé có đuôi phát sáng và đầu chớp đèn.',
    lore: 'Khi cảm thấy nguy hiểm, sinh vật này sử dụng những cái nháy đèn từ đầu để ra tín hiệu cho bạn bè. Cái đuôi nhỏ bé của nó có khả năng tạo ra điện, giúp nó bảo vệ bản thân và đồng đội.',
    rarity: 'common',
  ),

  'bellibolt': PokemonMeta(
    hint: 'Trông giống con ếch màu xanh, cái bụng rung rinh.',
    lore: 'Khi nó phồng lên xẹp xuống, cái bụng xinh xinh kêu tí tách tạo ra rất nhiều điện năng. Cái bụng của nó có một bộ phận đặc biệt như chiếc máy phát điện tí hon. Khi nó vui vẻ, cái bụng sẽ rung lên và tia điện nhỏ sẽ phóng ra. Nó thích làm bạn với những ai không sợ điện.',
    rarity: 'rare',
  ),

  'wattrel': PokemonMeta(
    hint: 'Chim biển có cánh tạo ra điện khi bay',
    lore: 'Khi cánh của nó bắt gió, xương bên trong tạo ra điện. Sinh vật này lao xuống biển, bắt con mồi bằng cách điện giật chúng. Nó có thể sạc điện cho những đám mây bão bằng cách vỗ cánh.',
    rarity: 'common',
  ),

  'kilowattrel': PokemonMeta(
    hint: 'Chim điện với túi cổ phồng lớn',
    lore: 'Chim điện này có chiếc túi đặc biệt ở cổ, giúp nó khuếch đại sức mạnh điện. Nhờ khả năng bay lượn trên những luồng gió mạnh, mỗi ngày nó có thể di chuyển quãng đường hơn 430 dặm. Đây là một loài chim rất bền bỉ và có tầm nhìn xa.',
    rarity: 'rare',
  ),

  'maschiff': PokemonMeta(
    hint: 'Vẻ mặt cau có nhưng lại rất đáng yêu',
    lore: 'Sinh vật nhỏ này luôn cố tỏ ra hung dữ để khiến đối thủ phải dè chừng. Tuy nhiên, gương mặt cau có của nó lại mang một nét gì đó rất ngộ nghĩnh, khiến cho cả những em bé đang khóc cũng bật cười khi nhìn thấy nó. Dù cố gắng đến đâu, nó vẫn không thể dọa được ai cả, mà ngược lại còn trở nên thân thiện hơn trong mắt mọi người.',
    rarity: 'common',
  ),

  'mabosstiff': PokemonMeta(
    hint: 'Chú chó khổng lồ với chiếc yếm lớn đầy năng lượng.',
    lore: 'Khi tức giận, chú chó này sẽ xù lông và sử dụng năng lượng tích trữ trong chiếc yếm đặc biệt của mình. Năng lượng này được giải phóng đột ngột, tạo ra một luồng khí mạnh mẽ đủ sức đẩy lùi mọi kẻ địch. Dù ngoại hình có phần đáng sợ, chú lại rất trung thành và bảo vệ chủ nhân hết lòng.',
    rarity: 'rare',
  ),

  'shroodle': PokemonMeta(
    hint: 'Chú ta có đôi răng trước sắc nhọn như dao.',
    lore: 'Khi bị chọc tức, chú ta rất đáng sợ. Đừng để vẻ ngoài hiền lành đánh lừa bạn, vì chú ta sẽ cắn vào bất cứ thứ gì làm mình nổi giận. Vết cắn của chú ta có thể khiến nạn nhân bị tê liệt.',
    rarity: 'common',
  ),

  'grafaiai': PokemonMeta(
    hint: 'Vẽ tranh bằng nước bọt đổi màu trên cây.',
    lore: 'Loài vật này sử dụng nước bọt của mình, có màu sắc tùy thuộc vào thức ăn, để vẽ những hình thù kỳ lạ lên thân cây trong rừng.  Những họa tiết này có thể là lời cảnh báo, thông điệp bí ẩn hoặc đơn giản chỉ là cách chúng đánh dấu lãnh thổ.  Dân số của chúng có thể bị ảnh hưởng bởi độ đa dạng của các loại quả mọng và côn trùng trong môi trường sống, vì chúng là nguyên liệu tạo nên màu sắc cho nước bọt của chúng.',
    rarity: 'rare',
  ),

  'bramblin': PokemonMeta(
    hint: 'Cỏ khô bị gió thổi trôi thành hình thù kỳ lạ.',
    lore: 'Linh hồn lạc lối không thể siêu thoát, bị gió cuốn đi muôn nơi. Cuối cùng, nó quấn vào đám cỏ khô và mang hình dạng này. Nó thích lang thang khắp nơi, đôi khi dừng lại nghỉ ngơi dưới bóng cây hoặc dựa vào một tảng đá nào đó.',
    rarity: 'common',
  ),

  'brambleghast': PokemonMeta(
    hint: 'Thân cây quấn quanh như nhện, hút lấy sự sống.',
    lore: 'Sinh vật này ẩn mình trong bụi rậm, chờ đợi con mồi vô tình đi ngang qua. Khi con mồi đến gần, nó sẽ bung nở những cành lá trên đầu để bao bọc lấy nạn nhân. Sau khi hút cạn năng lượng sự sống cần thiết, nó sẽ nhả con mồi ra, bỏ lại một cái vỏ rỗng tuếch.',
    rarity: 'rare',
  ),

  'toedscool': PokemonMeta(
    hint: 'Cái mũ của nó có dạng cây nấm, chân nhỏ xíu.',
    lore: 'Sinh vật sống trong rừng ẩm ướt, đáng yêu này có những chiếc nắp rơi ra từ thân mình. Những chiếc nắp này rất dai và có vị ngon tuyệt vời, là món quà thiên nhiên ban tặng cho những ai khám phá ra chúng. Chúng thường được tìm thấy đang di chuyển nhẹ nhàng qua tán lá rậm rạp, đôi khi để lại dấu vết nhỏ trên con đường mòn.',
    rarity: 'common',
  ),

  'toedscruel': PokemonMeta(
    hint: 'Nấm lùn đi bộ thành đàn, ghét người lạ',
    lore: 'Sinh vật kỳ lạ này sống thành đàn sâu trong rừng. Mũ nấm của chúng có những chiếc chân dài để di chuyển. Chúng rất nhút nhát và sợ hãi khi có người lạ đến gần. Nếu bị làm phiền, chúng sẽ lẩn trốn thật nhanh vào bóng tối của khu rừng, tạo nên một khung cảnh bí ẩn.',
    rarity: 'rare',
  ),

  'capsakid': PokemonMeta(
    hint: 'Tựa như một cây ớt nhỏ biết đi với chiếc lá xanh.',
    lore: 'Khi basking dưới ánh mặt trời, sinh vật nhỏ này tăng cường sản xuất các chất hóa học cay nồng trong cơ thể.  Sức nóng từ những chất này giúp tăng cường sức mạnh cho các đòn tấn công của nó. Càng nhận được nhiều ánh nắng, nó càng trở nên mạnh mẽ hơn và các đòn tấn công của nó càng có khả năng làm đối thủ phải "cay mắt".  Nó thường vui vẻ nhảy múa dưới ánh mặt trời.',
    rarity: 'common',
  ),

  'scovillain': PokemonMeta(
    hint: 'Đầu đỏ phun lửa nóng bỏng.',
    lore: 'Cậu bé đội lốt nấm này có khả năng biến hóa những chất cay nồng thành sức mạnh lửa. Khi cảm thấy nguy hiểm hoặc muốn thể hiện, cậu sẽ bắn ra một dòng lửa siêu cay, làm nóng rực mọi thứ xung quanh. Mùi cay nồng lan tỏa theo từng tia lửa đỏ rực, khiến kẻ địch phải e dè lùi bước. Đây là một đối thủ đáng gờm với sức nóng bùng cháy và vị cay không ai sánh kịp.',
    rarity: 'rare',
  ),

  'rellor': PokemonMeta(
    hint: 'Cục bùn nhỏ biết bay, có mắt.',
    lore: 'Sinh vật này dùng năng lượng kỳ lạ của mình để trộn cát và đất, tạo nên một quả cầu bùn đặc biệt. Nó quý trọng quả cầu ấy hơn bất cứ thứ gì, luôn mang theo bên mình. Khi cảm thấy nguy hiểm, nó sẽ dùng quả cầu để phòng vệ hoặc tấn công. Cứ như quả cầu là một phần cơ thể vậy, nó không bao giờ muốn xa rời nó dù chỉ một khắc.',
    rarity: 'common',
  ),

  'rabsca': PokemonMeta(
    hint: 'Bò chậm, thân hình tròn phía trên.',
    lore: 'Sinh vật này hầu như không di chuyển phần thân dưới của mình, nơi nó dùng để giữ quả cầu. Điều này khiến nhiều người tin rằng cơ thể thật sự của nó nằm gọn bên trong quả cầu đó. Nó giống như đang dùng quả bóng làm phương tiện di chuyển hoặc mái nhà vậy.',
    rarity: 'rare',
  ),

  'flittle': PokemonMeta(
    hint: 'Những ngón chân nhấc lên khỏi mặt đất.',
    lore: 'Vì sức mạnh tâm linh tỏa ra từ phần diềm trên bụng, những ngón chân của sinh vật này lơ lửng cách mặt đất một chút. Nó trông như đang lướt đi vậy. Sinh vật này có vẻ rất nhẹ nhàng và thanh thoát.',
    rarity: 'rare',
  ),

  'espathra': PokemonMeta(
    hint: 'Đôi mắt to tỏa sức mạnh, kẻ địch hóa đá.',
    lore: 'Một sinh vật duyên dáng với đôi mắt khổng lồ. Dù trông có vẻ hiền lành, nó lại sở hữu tính khí rất hung dữ. Khi đối mặt với kẻ địch, nó tập trung toàn bộ năng lượng tâm linh vào đôi mắt và giải phóng một luồng sức mạnh khiến đối phương không thể cử động. Hãy cẩn thận với vẻ ngoài này, vì nó có thể tấn công bất cứ lúc nào.',
    rarity: 'rare',
  ),

  'tinkatink': PokemonMeta(
    hint: 'Chiếc búa bằng kim loại được rèn thủ công của nó hay bị lấy đi.',
    lore: 'Sinh vật nhỏ bé này rất thông minh và khéo léo, dành thời gian chế tạo một chiếc búa từ những vật liệu kim loại tìm được. Nó dùng chiếc búa này làm vũ khí phòng vệ để xua đuổi các mối đe dọa. Tuy nhiên, sự yêu thích của nó đối với kim loại đôi khi lại khiến kẻ khác thèm muốn, và những Pokémon khác có khả năng ăn kim loại có thể sẽ tấn công để cướp đi công cụ yêu quý của nó.',
    rarity: 'common',
  ),

  'tinkatuff': PokemonMeta(
    hint: 'Giống mèo nhỏ, dùng búa tự chế để đánh nhau.',
    lore: 'Sinh vật bé nhỏ này thích thu thập kim loại từ kẻ thù. Chúng sử dụng những vật liệu nhặt được để rèn nên những chiếc búa khổng lồ, đủ sức chống chọi với bất kỳ ai dám đối đầu. Dù trông có vẻ nhỏ bé, nhưng sự kiên trì và khả năng chế tạo vũ khí của chúng khiến nhiều đối thủ phải dè chừng.',
    rarity: 'rare',
  ),

  'tinkaton': PokemonMeta(
    hint: 'Đập đá trời, nhắm Corviknight.',
    lore: 'Chú Pokémon thông minh, có tính cách táo bạo. Nó dùng búa khổng lồ đập những tảng đá lên trời cao, với mục tiêu là những chú Corviknight đang bay lượn. Sự khéo léo và dũng cảm giúp nó cạnh tranh với những Pokémon to lớn hơn.',
    rarity: 'rare',
  ),

  'wiglett': PokemonMeta(
    hint: 'Trông giống một con lươn trắng dài, hay trốn dưới cát.',
    lore: 'Đây là loài Pokémon sống ở biển, cơ thể dài và mảnh mai, có màu trắng như sô cô la sữa. Chúng có biệt tài cảm nhận mùi hương của những loài sinh vật khác từ khoảng cách xa. Khi phát hiện nguy hiểm hoặc kẻ săn mồi tiềm năng như Veluza, chúng sẽ nhanh chóng rụt mình xuống lớp cát ấm áp dưới đáy biển để ẩn náu an toàn.',
    rarity: 'common',
  ),

  'wugtrio': PokemonMeta(
    hint: 'Ba con rắn biển dài với răng sắc nhọn.',
    lore: 'Mặc dù trông có vẻ thân thiện, sinh vật này có tính khí rất hung dữ. Nó dùng cơ thể dài quấn chặt con mồi rồi kéo vào hang của mình. Chúng thường ẩn nấp trong các hang động dưới nước, chờ đợi con mồi sơ ý đi ngang qua để tấn công bất ngờ.',
    rarity: 'rare',
  ),

  'finizen': PokemonMeta(
    hint: 'Vòng nước trên đuôi, thích chơi cùng bạn bè.',
    lore: 'Sinh vật hiền lành này sử dụng chiếc vòng nước độc đáo trên đuôi để vui đùa cùng đồng loại. Nó có khả năng đặc biệt là phát ra sóng siêu âm, giúp nó cảm nhận được tâm trạng của mọi loài sinh vật xung quanh. Nhờ vậy, nó luôn biết cách làm bạn với mọi người và lan tỏa niềm vui.',
    rarity: 'common',
  ),

  'palafin': PokemonMeta(
    hint: 'Nó biến hình khi nghe bạn bè kêu cứu.',
    lore: 'Loài Pokémon này có một khả năng đặc biệt: khi nghe tiếng gọi giúp đỡ từ đồng đội, nó sẽ ngay lập tức thay đổi hình dạng. Tuy nhiên, khoảnh khắc biến đổi kỳ diệu này lại là bí mật mà nó không bao giờ hé lộ với bất kỳ ai. Dù mang trong mình sức mạnh phi thường, nó luôn giữ kín sự thay đổi của mình, điều này càng làm tăng thêm vẻ bí ẩn và lòng dũng cảm của nó.',
    rarity: 'rare',
  ),

  'varoom': PokemonMeta(
    hint: 'Một cục sắt kêu ùng ục, tỏa khí độc.',
    lore: 'Người ta đồn rằng Pokémon này sinh ra từ một động cơ cũ bị bỏ hoang ở nhà máy tái chế. Một ngày nọ, một Pokémon độc lạ đã chui vào và ban cho nó sự sống. Giờ đây, nó lang thang khắp nơi, tạo ra tiếng động cơ inh ỏi và xả ra những luồng khí khó chịu, khiến mọi thứ xung quanh trở nên độc hại.',
    rarity: 'common',
  ),

  'revavroom': PokemonMeta(
    hint: 'Động cơ tám xi-lanh phun khói độc.',
    lore: 'Loài Pokemon này là một cỗ máy biết đi, sử dụng các chất độc và khoáng chất từ đá để tạo ra một loại khí đặc biệt. Khí này sau đó được đốt cháy trong tám xi-lanh của nó, tạo ra nguồn năng lượng mạnh mẽ cho mọi hoạt động. Sự rung động của động cơ tạo ra âm thanh như tiếng gầm rú vui tai.',
    rarity: 'rare',
  ),

  'glimmet': PokemonMeta(
    hint: 'Bông hoa nhỏ bé có cánh độc lấp lánh trong hang động.',
    lore: 'Sinh vật bé bỏng này có những cánh hoa đặc biệt làm từ chất độc kết tinh, chúng bám vào người nó như một lớp áo giáp. Nó sống ở những nơi tối tăm, ẩm ướt trong các hang động, thầm lặng hấp thụ dưỡng chất từ những bức tường đá xung quanh. Dù trông có vẻ mong manh, nhưng nó lại sở hữu một khả năng phòng vệ đáng nể.',
    rarity: 'rare',
  ),

  'glimmora': PokemonMeta(
    hint: 'Hoa đá xinh đẹp bắn tia sáng khi gặp nguy hiểm.',
    lore: 'Khi cảm nhận được mối đe dọa, loài hoa pha lê này sẽ xòe rộng những cánh lấp lánh. Từ phần nhọn trên đỉnh, nó phóng ra những tia sáng mạnh mẽ, tự vệ trước kẻ thù. Những viên pha lê trên cơ thể nó phản chiếu ánh sáng rực rỡ, tạo nên một cảnh tượng kỳ ảo.',
    rarity: 'epic',
  ),

  'greavard': PokemonMeta(
    hint: 'Chú chó nhỏ cô độc, với dáng vẻ buồn bã.',
    lore: 'Khi một chú chó hoang dã, chưa từng gặp con người, ra đi nơi thẳm sâu, linh hồn nó sẽ hóa thân thành chú Pokémon này. Mang theo nỗi buồn man mác, chú ta tìm kiếm sự ấm áp và tình bạn đã từng mong mỏi khi còn sống. Có lẽ, chỉ cần một cái vuốt ve dịu dàng, một ánh mắt sẻ chia, chú ta sẽ tìm thấy bình yên trong thế giới mới này.',
    rarity: 'rare',
  ),

  'houndstone': PokemonMeta(
    hint: 'Bạn chó đá, hay ngủ, rất trung thành.',
    lore: 'Sinh vật hiền lành này dành phần lớn thời gian để nghỉ ngơi giữa những ngôi mộ cổ. Nó được biết đến là người bạn đồng hành trung thành nhất trong số các Pokémon giống chó, luôn ở bên cạnh chủ nhân của mình dù có chuyện gì xảy ra. Tình cảm sâu sắc của nó dành cho người mà nó yêu quý là điều khiến nó trở nên đặc biệt.',
    rarity: 'rare',
  ),

  'cetoddle': PokemonMeta(
    hint: 'Chú lùn này có bộ lông trắng xù như tuyết.',
    lore: 'Sinh vật nhỏ bé này đã rời bỏ đại dương từ rất lâu, tập làm quen với cuộc sống trên cạn. Với thân hình mũm mĩm và bộ lông trắng như bông, nó trông giống như một cục bông biết đi. Dù có vẻ ngoài đáng yêu, nó có họ hàng xa với một loài cá voi to lớn, cho thấy một hành trình tiến hóa kỳ diệu từ biển cả lên đất liền.',
    rarity: 'common',
  ),

  'cetitan': PokemonMeta(
    hint: 'Một sinh vật khổng lồ với lớp mỡ dày và cơ bắp mạnh mẽ.',
    lore: 'Sinh vật to lớn này thích khám phá những vùng đất phủ đầy tuyết và băng giá. Nó tự bảo vệ mình bằng lớp mỡ dày dưới lớp da và cơ bắp săn chắc. Bộ lông trắng muốt giúp nó hòa mình vào môi trường xung quanh, khiến nó trở thành một thợ săn tài ba trong khu vực lạnh giá.',
    rarity: 'rare',
  ),

  'frigibax': PokemonMeta(
    hint: 'Cái vây trên lưng giúp nó làm lạnh mọi thứ xung quanh.',
    lore: 'Sinh vật nhỏ bé này có một khả năng kỳ diệu: chiếc vây trên lưng của nó có thể hấp thụ nhiệt độ. Càng nóng, nó càng có nhiều sức mạnh để tạo ra băng giá. Bạn có thể thấy nó chơi đùa trong những ngày nắng nóng, nhưng đừng để vẻ ngoài đáng yêu của nó đánh lừa, vì nó có thể đóng băng mọi thứ chỉ bằng một cái chạm nhẹ.',
    rarity: 'rare',
  ),

  'arctibax': PokemonMeta(
    hint: 'Nhân vật màu trắng mắt xanh, có vây lưng băng sắc nhọn.',
    lore: 'Sinh vật màu trắng như tuyết này có khả năng làm đóng băng không khí xung quanh. Chiếc mặt nạ băng bí ẩn giúp che chắn khuôn mặt, còn vây lưng của nó biến thành một lưỡi kiếm băng sắc bén, sẵn sàng tấn công kẻ xâm phạm. Nó thường ẩn mình trong những vùng đất lạnh giá, mang theo hơi thở của mùa đông.',
    rarity: 'epic',
  ),

  'baxcalibur': PokemonMeta(
    hint: 'Rồng băng khổng lồ với sừng sắc nhọn.',
    lore: 'Khi nó thở ra, không khí lạnh giá tuôn trào mạnh mẽ, có thể đóng băng cả dung nham đang sôi sục. Cơ thể nó được bao phủ trong lớp băng dày, giúp nó chống chọi với nhiệt độ cực thấp. Vảy của nó cứng như thép, và đôi cánh lớn cho phép nó bay lượn trên bầu trời lạnh giá.',
    rarity: 'epic',
  ),

  'gimmighoul': PokemonMeta(
    hint: 'Sinh vật nhỏ bé có hình dáng kỳ lạ, thích ẩn mình trong rương.',
    lore: 'Pokémon này được sinh ra trong một chiếc rương kho báu khoảng 1.500 năm trước. Nó hút sinh lực của những kẻ gian ác cố gắng ăn cắp kho báu. Những kẻ xấu xa sẽ bị nó trừng phạt bằng cách lấy đi sức sống của chúng.',
    rarity: 'rare',
  ),

  'gholdengo': PokemonMeta(
    hint: 'Một sinh vật được tạo thành từ vô số đồng xu lấp lánh.',
    lore: 'Sinh vật này trông như được làm từ hàng ngàn đồng xu. Nó rất hòa đồng và nhanh chóng trở thành bạn bè với mọi người. Lần đầu gặp ai đó, nó thường để lộ vẻ thân thiện và cố gắng kết nối. Sự hiện diện của nó mang lại cảm giác may mắn và vui vẻ, khiến mọi người xung quanh cảm thấy dễ chịu và được chào đón. Nó thích chia sẻ những câu chuyện và khám phá thế giới cùng những người bạn mới của mình.',
    rarity: 'rare',
  ),

  'duraludon': PokemonMeta(
    hint: 'Thân hình kim loại sáng bóng, nhẹ mà bền.',
    lore: 'Đây là một sinh vật có vẻ ngoài lấp lánh như kim loại được đánh bóng. Mặc dù cơ thể nó có khả năng chống chọi tốt, điểm yếu duy nhất là rất dễ bị gỉ sét. Hãy cẩn thận giữ cho nó luôn khô ráo và sạch sẽ nhé!',
    rarity: 'rare',
  ),

  'archaludon': PokemonMeta(
    hint: 'Một sinh vật hùng vĩ, mang hình dáng giống cây cầu, tích điện năng mạnh mẽ.',
    lore: 'Sinh vật này có khả năng thu thập điện từ môi trường xung quanh, lưu trữ nó trong cơ thể như một kho năng lượng khổng lồ. Khi nó đứng trên bốn chân, cơ thể đồ sộ của nó giống như một cây cầu vững chãi. Lúc này, nó có thể giải phóng những tia năng lượng cực kỳ mạnh mẽ, có sức công phá đáng kinh ngạc, sẵn sàng bảo vệ lãnh thổ của mình hoặc tấn công kẻ thù xâm phạm.',
    rarity: 'epic',
  ),

  'unown': PokemonMeta(
    hint: 'Hình dáng giống chữ cổ, có đôi.',
    lore: 'Những sinh vật bí ẩn với hình dáng kỳ lạ, giống như những biểu tượng trên các bảng đá cổ xưa. Người ta đồn rằng hai sinh vật cùng loại này có mối liên hệ đặc biệt với nhau. Chúng có thể ảnh hưởng đến tâm trí con người, khiến họ nhìn thấy những điều kỳ lạ. Sự tồn tại của chúng gắn liền với những bí mật cổ xưa chưa được giải đáp.',
    rarity: 'common',
  ),

  'delibird': PokemonMeta(
    hint: 'Chú chim nhỏ mang quà và thức ăn, luôn tươi cười.',
    lore: 'Chú chim nhỏ vui vẻ luôn mang theo thức ăn trong chiếc túi đặc biệt của mình. Có những câu chuyện kể rằng những người bị lạc trong núi tuyết đã được cứu sống nhờ những bữa ăn ấm bụng mà chú chim này để lại. Chú ấy luôn sẵn lòng chia sẻ những gì mình có với những ai gặp khó khăn, và nụ cười của chú ấy làm ấm lòng mọi người.',
    rarity: 'rare',
  ),

  'skarmory': PokemonMeta(
    hint: 'Chim sắt với cánh rỗng bay lượn',
    lore: 'Sinh vật này có bộ lông cứng như kim loại và đôi cánh lớn, trông có vẻ nặng nề. Tuy nhiên, bên trong đôi cánh lại rỗng và rất nhẹ. Nhờ cấu tạo đặc biệt này, chúng có thể bay lượn một cách dễ dàng trên bầu trời xanh thẳm. Cặp cánh mạnh mẽ giúp chúng di chuyển nhanh nhẹn và vững vàng trong không trung.',
    rarity: 'epic',
  ),

  'sableye': PokemonMeta(
    hint: 'Sinh vật mắt đỏ, sống trong hang sâu, thích ăn đá quý.',
    lore: 'Trong bóng tối hang động, đôi mắt đỏ rực đôi khi loé lên. Sinh vật này sống ẩn dật, lặng lẽ. Người ta đồn rằng chúng có thể đánh cắp linh hồn của những kẻ lạc bước, làm chúng hoang mang tột độ. Chúng rất thích gặm nhấm những viên đá quý lấp lánh dưới lòng đất, việc này được cho là giúp phát sáng đôi mắt chúng.',
    rarity: 'rare',
  ),

  'mawile': PokemonMeta(
    hint: 'Miệng rộng làm bằng thép, vẻ mặt hiền lành.',
    lore: 'Chiếc miệng khổng lồ của sinh vật này thực chất là những chiếc sừng thép đã biến đổi. Khuôn mặt trông có vẻ hiền lành của nó được dùng để khiến đối phương mất cảnh giác. Khi đối phương ít ngờ tới nhất, nó sẽ ngoạm chặt kẻ địch bằng hàm răng há hốc.',
    rarity: 'rare',
  ),

  'plusle': PokemonMeta(
    hint: 'Chú chuột má hồng, tai dài vẫy gọi.',
    lore: 'Chú Pokémon này luôn là người cổ vũ nhiệt tình cho đồng đội. Mỗi khi đồng đội chiến đấu tốt, chú sẽ tạo ra những tiếng leng keng vui tai bằng cách phát ra tia lửa điện, thể hiện niềm vui mừng.',
    rarity: 'common',
  ),

  'minun': PokemonMeta(
    hint: 'Chú sóc tai dài, má phồng, thích nảy tưng tưng.',
    lore: 'Sinh vật này rất quan tâm đến việc cổ vũ cho đồng đội hơn là sự an toàn của bản thân. Nó phóng điện từ cơ thể để tạo ra những tia lửa lấp lánh, như một màn pháo hoa nhỏ bé để khích lệ bạn bè. Sự nhiệt tình này đôi khi khiến nó kiệt sức, nhưng nó luôn cố gắng hết sức để làm cho mọi người vui vẻ.',
    rarity: 'common',
  ),

  'volbeat': PokemonMeta(
    hint: 'Một chú bọ phát sáng, nhấp nháy theo điệu nhạc.',
    lore: 'Khi đêm xuống, sinh vật nhỏ bé này tỏa sáng từ chiếc đuôi xinh xắn của mình. Nó trò chuyện với đồng loại bằng cách thay đổi cường độ và kiểu nhấp nháy ánh sáng. Mùi hương ngọt ngào của một loài bạn thân thu hút nó đến gần.',
    rarity: 'common',
  ),

  'illumise': PokemonMeta(
    hint: 'Ong nhỏ tỏa hương thơm ngọt ngào.',
    lore: 'Loài côn trùng nhỏ bé này mang theo hương thơm ngọt ngào. Khi màn đêm buông xuống, nó dẫn đường cho những người bạn đồng hành tạo nên những hình ảnh lung linh trên bầu trời. Ánh sáng của chúng lập lòe như những vì sao di động, mang đến một cảnh tượng kỳ diệu.',
    rarity: 'common',
  ),

  'torkoal': PokemonMeta(
    hint: 'Rùa phun khói, càng bốc mạnh càng khỏe.',
    lore: 'Chú rùa này có một lớp vỏ cứng như mai, và bên trong nó luôn giữ lửa. Khói bốc ra từ mai cho ta biết chú đang cảm thấy thế nào. Nếu khói bốc lên mạnh mẽ và nhanh thì đó là dấu hiệu chú đang rất khỏe mạnh và tràn đầy năng lượng. Chú thích phơi nắng để giữ cho ngọn lửa bên trong luôn bùng cháy.',
    rarity: 'rare',
  ),

  'spinda': PokemonMeta(
    hint: 'Một chú gấu màu hồng với những đốm xoáy vui nhộn.',
    lore: 'Chú yêu thích nhảy múa nhưng bước đi hay loạng choạng, đôi khi còn làm ngã chính mình nữa. Những đốm xoáy trên người không bao giờ giống nhau, mỗi chú một vẻ độc đáo. Có lẽ vì thế mà chúng thu hút sự chú ý của mọi người xung quanh.',
    rarity: 'common',
  ),

  'zangoose': PokemonMeta(
    hint: 'Lông trắng, đuôi đỏ, nhảy múa uyển chuyển né tránh.',
    lore: 'Sinh vật cơ thể trắng muốt này mang trong mình ký ức về những trận chiến nảy lửa với kẻ thù không đội trời chung. Mỗi tế bào đều ghi nhớ từng chiêu thức, giúp nó né tránh đòn tấn công của đối thủ bằng sự nhanh nhẹn đáng kinh ngạc. Những bước di chuyển uyển chuyển và vẻ ngoài oai vệ khiến nó trở thành một chiến binh dũng mãnh.',
    rarity: 'rare',
  ),

  'seviper': PokemonMeta(
    hint: 'Rắn có lưỡi kiếm sắc bén trên đuôi',
    lore: 'Loài rắn này có mối thù truyền kiếp với một loài khác. Những vết sẹo trên cơ thể là minh chứng cho những trận chiến khốc liệt. Nó tấn công bằng chiếc đuôi có cạnh như lưỡi kiếm.',
    rarity: 'rare',
  ),

  'lunatone': PokemonMeta(
    hint: 'Trông giống đá mặt trăng, phát sáng trong đêm.',
    lore: 'Loài Pokémon này được tìm thấy ở nơi thiên thạch rơi. Có người cho rằng nó đến từ vũ trụ, nhưng chưa ai chứng minh được. Nó có vẻ ngoài kỳ lạ, giống như một khối đá biết di chuyển và phát sáng màu xanh lam hoặc vàng dưới ánh trăng.',
    rarity: 'rare',
  ),

  'solrock': PokemonMeta(
    hint: 'Vật thể hình tròn, tỏa sáng khi quay',
    lore: 'Sinh vật này hấp thụ năng lượng từ mặt trời, khiến nó trở nên mạnh mẽ hơn vào ban ngày. Khi nó xoay vòng, cơ thể nó sẽ phát sáng rực rỡ. Ánh sáng đó có thể làm chói mắt kẻ thù và tiếp thêm sức mạnh cho đồng minh. Nó thường được tìm thấy ở những vùng đất đầy nắng, nơi nó có thể hấp thụ nhiều năng lượng nhất.',
    rarity: 'rare',
  ),

  'castform': PokemonMeta(
    hint: 'Luôn thay đổi hình dáng theo thời tiết xung quanh.',
    lore: 'Sinh vật nhỏ bé này có khả năng đặc biệt, thay đổi hình dạng và sức mạnh của mình hòa quyện với phong cảnh thiên nhiên. Khi trời nắng, nó rực rỡ như mặt trời. Khi mưa, nó mềm mại và êm dịu. Nếu có sấm sét, nó sẽ bùng nổ với năng lượng. Khả năng thích ứng này giúp nó tồn tại và bảo vệ chính mình trong thế giới rộng lớn.',
    rarity: 'rare',
  ),

  'kecleon': PokemonMeta(
    hint: 'Cái gì có thể thay đổi màu sắc để ẩn mình?',
    lore: 'Sinh vật này có một khả năng đặc biệt là thay đổi màu sắc trên cơ thể mình. Nó làm vậy để hòa mình vào môi trường xung quanh, giống như một chiếc lá ngụy trang. Ngoài ra, biểu cảm của nó cũng ảnh hưởng đến màu sắc, khiến nó trở nên vui vẻ hoặc buồn bã thông qua những gam màu rực rỡ hay trầm lắng.  Thật kỳ diệu phải không nào!',
    rarity: 'common',
  ),

  'tropius': PokemonMeta(
    hint: 'Bạn có thấy chùm trái cây trên cổ không?',
    lore: 'Những chùm trái cây quanh cổ nó rất được trẻ em yêu thích. Sinh vật này rất thích trái cây và ăn chúng liên tục. Dường như tình yêu trái cây đã khiến nó tự mọc ra trái cây đấy.',
    rarity: 'common',
  ),

  'absol': PokemonMeta(
    hint: 'Sinh vật màu đen với chiếc lưỡi liềm trên đầu.',
    lore: 'Loài này báo hiệu những sự kiện kinh hoàng sắp xảy ra, như động đất hay sóng thần. Vì thế, người ta gọi nó là \'Pokémon Thảm họa\'. Nó sống một mình và thường xuất hiện ở những vùng đất xa xôi, tránh xa con người và các Pokémon khác. Mặc dù mang danh \'thảm họa\', nó không hề ác độc mà chỉ là người mang tin xấu.',
    rarity: 'epic',
  ),

  'relicanth': PokemonMeta(
    hint: 'Cá cổ đại há miệng hớp mồi.',
    lore: 'Loài sinh vật này đã tồn tại hàng triệu năm, giữ nguyên hình dạng qua mọi biến đổi. Nó dùng chiếc miệng không răng của mình để hấp thụ những sinh vật nhỏ bé li ti trong nước. Một hóa thạch sống, mang trong mình bí ẩn của thời gian xa xưa, chậm rãi bơi lội trong lòng đại dương sâu thẳm, chứng kiến sự hình thành và biến mất của bao loài.',
    rarity: 'epic',
  ),

  'luvdisc': PokemonMeta(
    hint: 'Sinh vật hình trái tim sống ở biển nhiệt đới ấm áp.',
    lore: 'Loài sinh vật đáng yêu này có hình dáng trái tim và sinh sống ở vùng biển ấm áp của các đại dương nhiệt đới. Chúng rất thích bơi theo các cặp đôi mà chúng nhìn thấy lướt sóng trên mặt biển. Nhiều người tin rằng việc nhìn thấy chúng mang lại may mắn trong tình yêu và đôi khi người ta còn nhặt chúng lên như một món quà lưu niệm khi đi nghỉ mát.',
    rarity: 'common',
  ),

  'regirock': PokemonMeta(
    hint: 'Cơ thể nó toàn đá, tự vá víu khi sứt mẻ.',
    lore: 'Sinh vật khổng lồ này tạo nên từ những tảng đá cứng cáp nhất. Khi chiến đấu, nếu một mảnh cơ thể bị vỡ ra, nó sẽ tìm những viên đá xung quanh để tự sửa chữa. Mỗi lần tái tạo, nó lại trở nên mạnh mẽ hơn, như một ngọn núi vững chãi không gì lay chuyển nổi. Nó có thể đứng im hàng trăm năm, hòa mình vào cảnh vật, chỉ hành động khi cần thiết.',
    rarity: 'legendary',
  ),

  'regice': PokemonMeta(
    hint: 'Khối băng khổng lồ với đôi mắt đỏ rực.',
    lore: 'Cơ thể nó được tạo ra từ thời kỳ băng hà, lạnh lẽo đến mức không thể tan chảy, kể cả bởi lửa. Nó có khả năng điều khiển không khí cực lạnh, luôn bao phủ mình trong một lớp băng giá vĩnh cửu. Khi xuất hiện, nhiệt độ xung quanh sẽ giảm mạnh, mang theo luồng gió lạnh buốt.',
    rarity: 'legendary',
  ),

  'registeel': PokemonMeta(
    hint: 'Khối kim loại chắc chắn, rỗng bên trong.',
    lore: 'Thân thể nó cứng hơn bất kỳ kim loại nào, nhưng bên trong lại rỗng tuếch. Người ta không biết làm sao nó sống được.  Nó thường được nhìn thấy ở những nơi hoang vắng, tĩnh lặng. Có lẽ nó lấy năng lượng từ thiên nhiên hoặc hấp thụ khoáng chất từ lòng đất, nhưng chưa ai xác nhận điều này. Hình dáng của nó gợi lên sự cổ xưa và bí ẩn.',
    rarity: 'legendary',
  ),

  'latias': PokemonMeta(
    hint: 'Cánh đỏ, mắt to tròn, bạn bè hay trốn tìm',
    lore: 'Sinh vật thuần khiết này có khả năng cảm nhận cảm xúc của con người một cách nhạy bén. Khi phát hiện sự thù địch, nó sẽ xù lông và cất tiếng kêu để cảnh báo kẻ thù. Đôi cánh đỏ rực như tia nắng, đôi mắt to tròn luôn ánh lên vẻ thân thiện. Nó thích chơi đùa và dành thời gian bên cạnh những người nó tin tưởng. Nếu ai đó muốn làm hại bạn bè, nó sẽ trở nên rất mạnh mẽ để bảo vệ họ.',
    rarity: 'legendary',
  ),

  'latios': PokemonMeta(
    hint: 'Chú rồng bay xanh với đôi mắt to và khả năng ảo ảnh.',
    lore: 'Sinh vật hùng mạnh này có trí tuệ phi thường, có thể thấu hiểu lời nói của con người. Nó sở hữu khả năng đặc biệt là chiếu những hình ảnh mà nó từng thấy hoặc tưởng tượng vào tâm trí đối thủ. Điều này khiến cho việc đối mặt với nó trở nên vô cùng khó khăn, bởi bạn không bao giờ biết điều gì là thật.',
    rarity: 'legendary',
  ),

  'kyogre': PokemonMeta(
    hint: 'Vua biển khổng lồ, tạo mưa lớn',
    lore: 'Sinh vật màu xanh dương to lớn này có sức mạnh phi thường, có thể tạo ra những đám mây mưa khổng lồ bao phủ bầu trời, mang đến những cơn mưa xối xả. Nó đã từng cứu giúp những người đang khốn khổ vì hạn hán, mang lại sự sống cho những vùng đất khô cằn. Sức mạnh của nó gắn liền với đại dương và những cơn mưa.',
    rarity: 'legendary',
  ),

  'groudon': PokemonMeta(
    hint: 'Rồng đỏ khổng lồ, mang sức mạnh của đất.',
    lore: 'Sinh vật huyền thoại này được cho là đã tạo ra lục địa và mở rộng đất đai. Sau trận chiến dữ dội với đối thủ đại dương, nó đã chìm vào giấc ngủ sâu.',
    rarity: 'legendary',
  ),

  'rayquaza': PokemonMeta(
    hint: 'Rồng lớn trên trời, cư ngụ tận mây xanh.',
    lore: 'Sinh vật cổ đại, sống hàng trăm triệu năm trên tầng ozone. Nó không bao giờ xuống đất và dường như ăn nước cùng các hạt nhỏ trong không khí. Đôi khi, nó xuất hiện để làm dịu cơn giận của hai Pokémon huyền thoại khác.',
    rarity: 'legendary',
  ),

  'jirachi': PokemonMeta(
    hint: 'Ngôi sao nhỏ với đôi mắt to tròn, luôn mang theo những mảnh giấy ước.',
    lore: 'Truyền thuyết kể rằng khi ngôi sao nhỏ này thức tỉnh, bất kỳ điều ước nào được viết trên những mảnh giấy gắn trên đầu nó đều sẽ trở thành sự thật. Nhưng nếu cảm nhận được nguy hiểm, nó sẽ chiến đấu ngay cả khi vẫn còn ngủ say. Nó là biểu tượng của những giấc mơ và hy vọng, mang lại niềm vui cho mọi người.',
    rarity: 'mythical',
  ),

  'deoxys': PokemonMeta(
    hint: 'Tia laze biến đổi virus vũ trụ thành sinh vật lạ',
    lore: 'Một virus đến từ không gian đã đột ngột biến đổi khi tiếp xúc với tia laze.  Viên pha lê trên ngực nó là bộ não, giúp nó thay đổi hình dạng để thích nghi với mọi tình huống.  Nó di chuyển với tốc độ kinh hoàng, có thể vượt qua cả ánh sáng.  Nó mang trong mình sức mạnh kỳ lạ từ vũ trụ.',
    rarity: 'mythical',
  ),

  'pachirisu': PokemonMeta(
    hint: 'Chú sóc nhỏ màu vàng với đôi má phồng, có thể tạo ra tia lửa điện.',
    lore: 'Sinh vật nhỏ bé này có bộ lông mềm mại và đôi má phúng phính. Khi phấn khích hoặc cảm thấy nguy hiểm, nó có thể tạo ra những quả cầu lông nhỏ phát ra tia điện lách tách. Những quả cầu điện này được nó cất giữ cẩn thận cùng với những loại trái cây yêu thích trong các hốc cây rỗng. Chúng thường sống thành đàn nhỏ và rất nhanh nhẹn trong việc di chuyển trên cây.',
    rarity: 'common',
  ),

  'chatot': PokemonMeta(
    hint: 'Chú chim biết nói với chiếc mỏ hình nốt nhạc.',
    lore: 'Sinh vật nhỏ nhắn này có khả năng ghi nhớ và lặp lại mọi thứ chúng nghe được, đặc biệt là tiếng nói của con người. Nếu nhiều bạn cùng loài tụ tập lại, chúng sẽ cùng nhau học một câu nói y hệt nhau. Chúng thường dùng khả năng này để giao tiếp hoặc trêu đùa người bạn của mình, tạo nên những khoảnh khắc vui nhộn và đáng yêu.',
    rarity: 'epic',
  ),

  'spiritomb': PokemonMeta(
    hint: 'Bóng tối cuộn xoáy, luôn ẩn mình.',
    lore: 'Nó được tạo thành từ 108 linh hồn, bị giam cầm trong một viên đá kỳ lạ. Nó trôi nổi và dường như không có cơ thể vật lý, chỉ là một đám mây tối với ánh mắt phát sáng. Nó thường được tìm thấy ở những nơi bỏ hoang và có thể khiến mọi người cảm thấy sợ hãi hoặc buồn bã. Dù trông đáng sợ, nó là một Pokémon có thể kết bạn nếu bạn kiên nhẫn và tốt bụng.',
    rarity: 'rare',
  ),

  'carnivine': PokemonMeta(
    hint: 'Một cái cây biết nhai với chiếc lưỡi như cái bẫy.',
    lore: 'Sinh vật này có nước dãi ngọt ngào để dụ dỗ con mồi. Khi con mồi đã đến gần, nó sẽ há miệng thật to và ngồm ngoàm. Việc tiêu hóa con mồi là một quá trình lâu dài, có thể kéo dài cả ngày. Đừng để vẻ ngoài đáng yêu đánh lừa bạn, nó là một kẻ săn mồi khéo léo!',
    rarity: 'common',
  ),

  'rotom': PokemonMeta(
    hint: 'Vật thể plasma bí ẩn thích chơi khăm trong các thiết bị.',
    lore: 'Sinh vật này là một khối plasma sống, có khả năng thâm nhập vào các thiết bị điện tử. Nó thích trêu chọc con người bằng cách gây ra những trò nghịch ngợm vui nhộn, như làm nhấp nháy đèn hoặc phát ra âm thanh kỳ lạ. Mặc dù đôi khi khá tinh quái, nó không bao giờ thực sự làm hại ai.  Nó giống như một vị khách không mời mà đến, mang theo chút hỗn loạn và tiếng cười đến mọi nơi nó ghé qua.',
    rarity: 'rare',
  ),

  'uxie': PokemonMeta(
    hint: 'Tâm trí sáng rực, đôi mắt nhìn thấu mọi thứ.',
    lore: 'Sinh vật này mang trong mình sự uyên bác vô biên, được gọi là \'Thần Trí Tuệ\'. Tương truyền, đôi mắt của nó có sức mạnh đặc biệt, có thể xóa sạch ký ức của bất kỳ ai dám nhìn vào. Nhiều người tìm kiếm nó để tìm kiếm sự thông thái, nhưng ai cũng phải dè chừng sức mạnh khó lường của nó.',
    rarity: 'legendary',
  ),

  'mesprit': PokemonMeta(
    hint: 'Tâm trạng luôn thay đổi, bé nhỏ tỏa sáng.',
    lore: 'Sinh vật nhỏ bé này mang theo những rung động của mọi cảm xúc, từ nỗi buồn man mác đến niềm vui rạng rỡ và cả nỗi đau day dứt. Nó đã dạy cho con người cách cảm nhận sâu sắc những cung bậc tình cảm ấy, và hiểu rằng mỗi cảm xúc đều có nét đẹp riêng, góp phần làm cho cuộc sống thêm phong phú và ý nghĩa.',
    rarity: 'legendary',
  ),

  'azelf': PokemonMeta(
    hint: 'Giấc mơ ở đáy hồ, giúp thế giới cân bằng.',
    lore: 'Sinh vật này được gọi là "Đấng Hiện Thân Của Ý Chí". Nó có vẻ ngoài nhỏ bé với đôi mắt to tròn và đôi cánh nhỏ. Khi thế giới mất cân bằng, nó sẽ thức dậy từ giấc ngủ sâu dưới đáy hồ để khôi phục lại sự hài hòa. Nó có khả năng mạnh mẽ liên quan đến ý chí và quyết tâm.',
    rarity: 'legendary',
  ),

  'dialga': PokemonMeta(
    hint: 'Rồng kim cương xanh, chủ nhân thời gian.',
    lore: 'Trong thần thoại vùng Sinnoh, có một vị thần cổ xưa sở hữu sức mạnh phi thường. Thần ấy có thể thao túng dòng chảy của thời gian, khiến quá khứ, hiện tại và tương lai diễn ra theo ý mình. Sinh vật huyền thoại này được tôn thờ như một vị thần canh giữ sự cân bằng của vũ trụ, với vẻ ngoài uy nghiêm và sức mạnh vô biên.',
    rarity: 'legendary',
  ),

  'palkia': PokemonMeta(
    hint: 'Rồng ngọc trai, điều khiển không gian.',
    lore: 'Theo thần thoại Sinnoh, đây là một vị thần có sức mạnh bẻ cong không gian. Nó thường được miêu tả là một sinh vật hùng vĩ với bộ ngọc trai lấp lánh. Dù mang vẻ ngoài uy nghiêm, nó cũng rất quan tâm đến sự cân bằng của thế giới và đôi khi xuất hiện để sửa chữa những "sai sót" trong vũ trụ.',
    rarity: 'legendary',
  ),

  'heatran': PokemonMeta(
    hint: 'Sinh vật màu đỏ với chân hình chữ thập.',
    lore: 'Nó sống trong hang động núi lửa nóng bỏng. Với đôi chân đặc biệt hình chữ thập, nó có thể bám chắc và di chuyển trên trần và tường hang đá. Đây là một sinh vật rất mạnh mẽ, có thể điều khiển được dung nham chảy.',
    rarity: 'legendary',
  ),

  'regigigas': PokemonMeta(
    hint: 'Khổng lồ với những khối đá gắn liền với cơ thể.',
    lore: 'Người ta kể rằng nó từng dùng dây thừng khổng lồ để kéo cả các lục địa. Tồn tại một truyền thuyết lâu đời về sức mạnh phi thường của sinh vật này, có thể di chuyển cả những khối đất đá lớn nhất. Nó ngủ rất lâu, chỉ thức dậy khi cần thiết.',
    rarity: 'legendary',
  ),

  'giratina': PokemonMeta(
    hint: 'Thoát ra từ thế giới đối diện, nó mang hình dáng kỳ dị.',
    lore: 'Tương truyền, sinh vật này ngự trị một thế giới song song, nơi mọi thứ đảo ngược. Nó có thể xuất hiện bất cứ lúc nào tại những nghĩa trang cổ xưa, nơi ranh giới giữa hai thế giới trở nên mỏng manh nhất. Sự hiện diện của nó thường đi kèm với những hiện tượng kỳ lạ và cảm giác bất an.',
    rarity: 'legendary',
  ),

  'cresselia': PokemonMeta(
    hint: 'Cánh tỏa sáng như vầng trăng khuyết.',
    lore: 'Sinh vật huyền bí này mang lại giấc mơ êm đềm cho những ai ngủ sâu. Tương truyền, nó xuất hiện để xoa dịu nỗi buồn và mang đến hy vọng. Những hạt lấp lánh rơi ra từ đôi cánh của nó như một tấm màn lung linh, tạo nên một cảnh tượng siêu thực. Nó ẩn mình trong bóng đêm, chỉ thỉnh thoảng hiện ra, tượng trưng cho sự dịu dàng và bí ẩn của ánh trăng.',
    rarity: 'legendary',
  ),

  'phione': PokemonMeta(
    hint: 'sinh vật nhỏ bé, màu hồng, trôi nổi trên biển.',
    lore: 'Sinh vật này thích sống ở vùng biển ấm áp.  Dù có đi xa đến đâu, nó luôn tìm đường quay về nơi mình được sinh ra.  Nó bồng bềnh theo những dòng hải lưu, mang theo một chút bí ẩn của đại dương.',
    rarity: 'mythical',
  ),

  'manaphy': PokemonMeta(
    hint: 'Cơ thể nhỏ bé màu hồng, luôn mang theo quả trứng.',
    lore: 'Sinh ra từ đáy biển lạnh giá, sinh vật bé nhỏ này có khả năng đặc biệt. Nó luôn bơi theo những hành trình dài, vượt qua hàng ngàn dặm để tìm về nơi mình được sinh ra. Cuộc sống của nó gắn liền với đại dương bao la, nơi nó khám phá và khám phá những bí ẩn.',
    rarity: 'mythical',
  ),

  'darkrai': PokemonMeta(
    hint: 'Bóng đêm bay lượn, đưa mọi người vào giấc mơ.',
    lore: 'Sinh vật bí ẩn này xuất hiện trong đêm không trăng. Nó có khả năng ru ngủ mọi người và tạo ra những giấc mơ kỳ lạ. Có người nói rằng nó ẩn mình trong bóng tối và chỉ lộ diện khi màn đêm buông xuống, mang theo những ảo ảnh không thể đoán trước. Hãy cẩn thận nếu bạn nhìn thấy một sinh vật mờ ảo trong đêm tối, nó có thể đang ghé thăm giấc mơ của bạn.',
    rarity: 'mythical',
  ),

  'shaymin': PokemonMeta(
    hint: 'Núp trong bụi hoa, trông như một bông hoa đang nở.',
    lore: 'Sinh vật nhỏ bé này ẩn mình trong các khu vườn đầy hoa xinh đẹp. Khi cảm thấy nguy hiểm, nó cuộn tròn lại, trông giống hệt như một bông hoa đang khoe sắc. Nhờ khả năng ngụy trang tài tình này, rất khó để ai đó phát hiện ra nó giữa thảm thực vật rực rỡ. Nó yêu thích những nơi có nhiều cỏ cây và ánh nắng mặt trời, mang đến vẻ đẹp và sự sống cho môi trường xung quanh.',
    rarity: 'mythical',
  ),

  'arceus': PokemonMeta(
    hint: 'Linh vật vũ trụ sở hữu nhiều tay',
    lore: 'Theo thần thoại, sinh vật này đã tạo ra cả vũ trụ với sức mạnh phi thường. Nó được cho là có khả năng thay đổi hình dạng và ban tặng cho mọi loài sự sống.  Truyền thuyết kể rằng nó đã làm nên mọi thứ từ những thứ nhỏ bé nhất đến những vì sao lấp lánh trên bầu trời đêm.',
    rarity: 'mythical',
  ),

  'victini': PokemonMeta(
    hint: 'Nhảy múa vui vẻ, mang theo may mắn bất ngờ.',
    lore: 'Sinh vật bé nhỏ này mang trong mình năng lượng vô tận. Người ta tin rằng bất cứ ai có được sự đồng hành của nó sẽ luôn gặt hái thành công trong mọi thử thách. Ánh sáng và niềm vui luôn tỏa ra từ nó, tiếp thêm sức mạnh và lòng dũng cảm cho người bạn đồng hành.',
    rarity: 'mythical',
  ),

  'audino': PokemonMeta(
    hint: 'Tai nó rung rung, nghe tim đập thấu nỗi lòng.',
    lore: 'Chú Pokémon này có đôi tai rất nhạy cảm. Bằng cách chạm nhẹ vào người khác bằng những chiếc tai nhỏ xinh, nó có thể cảm nhận được nhịp đập trái tim. Từ đó, chú hiểu được cảm xúc của mọi người, dù là vui hay buồn. Chú luôn sẵn sàng lắng nghe và an ủi bằng sự đồng cảm chân thành của mình.',
    rarity: 'common',
  ),

  'throh': PokemonMeta(
    hint: 'Lưng cong, đai chắc, sức mạnh tăng.',
    lore: 'Chú nhím này có một chiếc đai đặc biệt. Khi nó siết chặt nó, sức mạnh sẽ tăng lên gấp bội. Những chú nhím hoang dã tự tay dệt nên chiếc đai từ những sợi dây leo mềm mại. Chúng rất thích tranh tài với nhau để xem ai là người mạnh nhất. Chiếc đai không chỉ giúp chúng mạnh hơn mà còn là biểu tượng cho sự bền bỉ và ý chí kiên cường.',
    rarity: 'rare',
  ),

  'sawk': PokemonMeta(
    hint: 'Túi đồ trên đầu nó rung lên khi đấm.',
    lore: 'Loài võ sĩ này dành cả ngày để rèn luyện sức mạnh. Tiếng nó đấm vào đá và cây cối vang vọng khắp núi non. Chúng chiến đấu với kẻ thù bằng những cú đấm mạnh mẽ, luôn tập trung vào việc hoàn thiện kỹ năng của mình để trở nên mạnh mẽ hơn nữa.',
    rarity: 'rare',
  ),

  'basculin': PokemonMeta(
    hint: 'Cá bơi hung hăng, hay đánh nhau.',
    lore: ' Loài cá này rất hay giận dữ và cực kỳ hung hăng. Chúng không ưa nhau và sẽ lao vào đánh nhau ngay lập tức khi gặp mặt. Trong các vùng nước chúng sinh sống, sự hiếu chiến của chúng khiến các loài khác e dè.',
    rarity: 'epic',
  ),

  'basculegion': PokemonMeta(
    hint: 'Cá bụng trắng, mang hình dáng một con cá lớn, thường bơi cùng đàn.',
    lore: 'Loài cá này mang trong mình linh hồn của những người bạn đã hy sinh trên dòng sông hùng vĩ. Sức mạnh của chúng dường như không có đối thủ trong mọi dòng sông thuộc vùng Hisui xưa kia. Chúng bơi lội duyên dáng, thi thoảng lại làm một cú nhảy vút lên khỏi mặt nước, mang theo những câu chuyện chưa kể về hành trình dang dở của đồng đội.',
    rarity: 'rare',
  ),

  'maractus': PokemonMeta(
    hint: 'Luôn nhảy múa, tỏa sắc rực rỡ.',
    lore: 'Khi những kẻ săn hạt giống bay lượn ngang qua, sinh vật này sẽ trình diễn một bài nhảy sôi động cùng giai điệu vui tươi. Vũ điệu và âm nhạc của nó đủ sức làm cho những kẻ xâm nhập sợ hãi bỏ chạy, bảo vệ những hạt mầm quý giá của mình.',
    rarity: 'common',
  ),

  'sigilyph': PokemonMeta(
    hint: 'Cánh quạt sặc sỡ xoay tròn trên bầu trời.',
    lore: 'Loài chim này luôn bay theo một lộ trình cố định, như thể trí nhớ về việc canh giữ một thành phố cổ xưa chưa bao giờ phai nhạt. Chúng bay lượn quanh những tàn tích bí ẩn, đôi mắt chúng dường như nhìn thấu quá khứ xa xăm. Không ai biết chính xác chúng đã bảo vệ điều gì, nhưng sự tận tâm của chúng là không thể lay chuyển.',
    rarity: 'rare',
  ),

  'emolga': PokemonMeta(
    hint: 'Bay lượn và phóng điện từ hai má má.',
    lore: 'Sinh vật nhỏ bé này có đôi má chứa đầy năng lượng điện. Khi bay lượn, nó giải phóng dòng điện tích trữ trong lớp màng của mình.  Nó có thể sử dụng khả năng này để làm choáng kẻ thù hoặc đơn giản là để vui đùa trên bầu trời.  Đôi cánh giúp nó di chuyển nhanh nhẹn và duyên dáng giữa không trung.',
    rarity: 'common',
  ),

  'alomomola': PokemonMeta(
    hint: 'Cá tim hồng chăm sóc vết thương cho bạn',
    lore: 'Loài cá thân hình trái tim này có lớp màng đặc biệt bao phủ cơ thể. Lớp màng này có khả năng chữa lành các vết thương một cách kỳ diệu. Nó thường bơi chậm rãi, tìm kiếm những sinh vật đang gặp khó khăn để giúp đỡ. Những ai may mắn được nó giúp đỡ đều cảm thấy ấm áp và hồi phục nhanh chóng nhờ vào phép màu từ làn da của nó.',
    rarity: 'rare',
  ),

  'cryogonal': PokemonMeta(
    hint: 'Cơ thể nó đóng băng thành tinh thể băng óng ánh.',
    lore: 'Sinh vật này có cơ thể hoàn toàn bằng băng. Nó biến thành hơi nước khi nóng lên và trở lại thành băng khi lạnh đi. Khi di chuyển, nó tạo ra những tiếng lách cách vui tai. Nó thích sống ở những nơi lạnh giá và thường được tìm thấy ở những ngọn núi cao hoặc vùng cực.',
    rarity: 'epic',
  ),

  'stunfisk': PokemonMeta(
    hint: 'Một con cá dẹt có da cực cứng, mỉm cười khi tạo ra điện.',
    lore: 'Loài sinh vật này có lớp da dày và cứng cáp, giúp nó an toàn ngay cả khi bị những đô vật to lớn giẫm lên. Điều thú vị là nó lại nở nụ cười mỗi khi truyền ra dòng điện mạnh mẽ.  Đừng để vẻ ngoài hiền lành đánh lừa, vì nó có thể bất ngờ tạo ra điện.',
    rarity: 'rare',
  ),

  'druddigon': PokemonMeta(
    hint: 'Cánh của nó hấp thụ ánh nắng để giữ ấm.',
    lore: 'Sinh vật này thích phơi mình dưới ánh nắng mặt trời để sưởi ấm cơ thể, đặc biệt là đôi cánh rộng của nó. Nếu thân nhiệt giảm xuống, nó sẽ trở nên chậm chạp và không thể di chuyển được nữa, giống như một tảng đá lạnh giá. Vì vậy, nó luôn tìm những nơi có nắng để tận hưởng sự ấm áp.',
    rarity: 'rare',
  ),

  'bouffalant': PokemonMeta(
    hint: 'Bộ lông dày rậm che chở nó khi húc đầu mạnh mẽ.',
    lore: 'Sinh vật to lớn này có bộ lông xù trắng dày như đám mây trên đầu, trông giống như một mái tóc bồng bềnh. Chúng rất dũng mãnh với chiếc đầu to tròn, luôn sẵn sàng dùng nó để bảo vệ bản thân và tấn công kẻ địch. Bộ lông không chỉ để làm đẹp mà còn giúp chúng chịu được những cú va chạm mạnh.',
    rarity: 'rare',
  ),

  'heatmor': PokemonMeta(
    hint: 'Lửa phun ra từ đuôi, sẵn sàng săn mồi.',
    lore: 'Sinh vật này mang trong mình ngọn lửa bất diệt, được nuôi dưỡng từ bên trong. Nó thở ra hơi nóng từ một cái lỗ đặc biệt trên chiếc đuôi của mình. Thức ăn yêu thích của nó là những con côn trùng nhỏ bé có lớp vỏ cứng, thường bị nó thiêu rụi trước khi kịp nhận ra điều gì đang xảy ra.',
    rarity: 'rare',
  ),

  'durant': PokemonMeta(
    hint: 'Sinh vật nhỏ bé, toàn thân bọc thép.',
    lore: 'Chúng sống theo bầy đàn, tự vệ bằng lớp giáp cứng cáp.  Lớp vỏ này giúp chúng chống lại kẻ săn mồi lớn. Khi nguy hiểm cận kề, chúng sẽ tập hợp lại thật nhanh, tạo thành một bức tường thép vững chãi để bảo vệ lẫn nhau.',
    rarity: 'rare',
  ),

  'cobalion': PokemonMeta(
    hint: 'Ngài thường đi cùng hai đồng đội, rất uy nghiêm.',
    lore: 'Trong quá khứ xa xưa, khi con người bắt đầu phá hoại môi trường sống của các loài, một Pokémon huyền thoại đã đứng lên bảo vệ. Ngài cùng những người bạn của mình đã chiến đấu anh dũng để mang lại sự cân bằng. Tính cách của ngài điềm đạm, không bao giờ nổi nóng, luôn suy xét mọi việc cẩn thận trước khi hành động. Ngài là biểu tượng của sự chính nghĩa và gìn giữ hòa bình.',
    rarity: 'legendary',
  ),

  'terrakion': PokemonMeta(
    hint: 'Một chú ngựa giống bò có cặp sừng hùng mạnh.',
    lore: 'Khi con người gây chiến và phá hủy nhà cửa của các loài khác, một sinh vật mạnh mẽ đã xuất hiện. Nó xông pha vào nguy hiểm để bảo vệ những người yếu thế hơn, không để những kẻ tham lam chiếm đoạt nơi ở của chúng. Sức mạnh và lòng dũng cảm của nó là một minh chứng cho tình yêu thương với tự nhiên.',
    rarity: 'legendary',
  ),

  'virizion': PokemonMeta(
    hint: 'Chú ngựa xanh lá mạnh mẽ, nhanh nhẹn lao tới bảo vệ bạn bè.',
    lore: 'Vị anh hùng rừng xanh, sẵn sàng chiến đấu chống lại kẻ xấu để bảo vệ những người thân yêu. Truyền thuyết về lòng quả cảm và sự hy sinh của chú đã được kể lại qua bao thế hệ, khiến ai cũng ngưỡng mộ.',
    rarity: 'legendary',
  ),

  'tornadus': PokemonMeta(
    hint: 'Cánh gió lốc với đuôi mây.',
    lore: 'Sinh vật này mang theo những cơn gió cực mạnh. Nó chu du trên bầu trời với tốc độ chóng mặt, biến đổi thời tiết bằng hơi thở của mình. Người ta đồn rằng khi nó nổi giận, cơn bão có thể ập đến bất cứ lúc nào.',
    rarity: 'legendary',
  ),

  'thundurus': PokemonMeta(
    hint: 'Cơn bão giáng thế, vương quốc sấm sét',
    lore: 'Sinh vật huyền thoại này mang theo sức mạnh sấm sét khủng khiếp, có thể gây ra những cơn bão dữ dội.  Nơi nào nó đi qua, cảnh vật thường bị biến đổi bởi những tàn tích cháy đen, minh chứng cho uy lực không thể cản phá.  Ngay cả những đỉnh núi cao nhất cũng không tránh khỏi sự ghé thăm của nó, mang đến những tia sét chói lòa và âm thanh rền vang của sấm.  Sự xuất hiện của nó báo hiệu một sự thay đổi lớn lao, đôi khi mang đến sự hủy diệt nhưng cũng có thể là khởi đầu mới.',
    rarity: 'legendary',
  ),

  'reshiram': PokemonMeta(
    hint: 'Đuôi nó bốc lửa, thiêu rụi mọi thứ.',
    lore: 'Truyền thuyết kể về một Pokémon có khả năng phun ra lửa từ đuôi, tạo nên những luồng lửa rực cháy bao trùm mọi thứ xung quanh. Sức mạnh của nó giống như một ngọn lửa vĩnh cửu, có thể mang lại sự ấm áp hoặc hủy diệt hoàn toàn. Ánh sáng từ hơi nóng tỏa ra từ nó có thể làm tan chảy cả núi băng.',
    rarity: 'legendary',
  ),

  'zekrom': PokemonMeta(
    hint: 'Con rồng sấm sét, đuôi phát sáng.',
    lore: 'Sinh vật huyền thoại này ẩn mình trong những đám mây sấm sét, bay lượn khắp vùng đất Unova rộng lớn. Nó sở hữu khả năng tạo ra dòng điện mạnh mẽ trong chiếc đuôi của mình, dùng nó để bảo vệ bản thân và bay đi với tốc độ kinh hoàng. Sức mạnh của nó gắn liền với sự thật và lý tưởng.',
    rarity: 'legendary',
  ),

  'landorus': PokemonMeta(
    hint: 'Sinh vật khổng lồ với đôi cánh hùng vĩ, mang lại mùa màng bội thu.',
    lore: 'Sinh vật huyền thoại này được tôn sùng là "Vị thần bảo vệ cánh đồng". Nơi nào nó ghé thăm, đất đai trở nên màu mỡ, cây trồng sinh trưởng mạnh mẽ, mang lại vụ mùa bội thu cho người dân. Sự xuất hiện của nó báo hiệu một năm ấm no và sung túc.',
    rarity: 'legendary',
  ),

  'kyurem': PokemonMeta(
    hint: 'Thân thể màu trắng, có cánh băng lớn.',
    lore: 'Một sinh vật băng giá ẩn chứa sức mạnh khổng lồ bên trong. Năng lượng lạnh lẽo này mạnh đến nỗi đã khiến chính cơ thể nó bị đóng băng. Nó thích ẩn mình trong những hang động băng giá, nơi nhiệt độ cực thấp, để kiểm soát nguồn năng lượng của mình.',
    rarity: 'legendary',
  ),

  'keldeo': PokemonMeta(
    hint: 'Chú ngựa biển có chiếc sừng kỳ lạ.',
    lore: 'Chú ngựa biển này có thể lướt đi trên mặt nước bằng cách phun nước mạnh từ móng guốc. Nó rất giỏi sử dụng các đòn tấn công bằng chân khi chiến đấu. Người ta nói rằng nó có thể đánh bại mọi đối thủ bằng sức mạnh của mình.',
    rarity: 'mythical',
  ),

  'meloetta': PokemonMeta(
    hint: 'Ca sĩ nhỏ bé với giai điệu yêu thương.',
    lore: 'Loài Pokémon này có giọng hát kỳ diệu. Khi cất tiếng hát, nó có thể khiến mọi người vui vẻ, cảm động hoặc thậm chí là tràn đầy năng lượng. Âm nhạc của nó lan tỏa khắp nơi, mang đến niềm vui và sự ấm áp cho mọi sinh vật. Nó yêu thích việc biểu diễn cho bạn bè nghe, chia sẻ giai điệu đẹp đẽ của mình.',
    rarity: 'mythical',
  ),

  'genesect': PokemonMeta(
    hint: 'Robot côn trùng biết bay với cánh tay lớn.',
    lore: 'Sinh vật cổ đại này từng là nỗi khiếp sợ của mọi kẻ săn mồi, một chiến binh mạnh mẽ từ hàng trăm triệu năm trước. Giờ đây, nó đã được cải tiến bởi Team Plasma, trở thành một cỗ máy tiên tiến với công nghệ của con người, sẵn sàng đối mặt với mọi thử thách.',
    rarity: 'mythical',
  ),

  'furfrou': PokemonMeta(
    hint: 'Bộ lông mềm mại, có thể cắt tỉa làm đẹp.',
    lore: 'Loài Pokémon này rất thích được chăm sóc bộ lông. Người chơi có thể tỉa tót cho nó theo nhiều kiểu dáng khác nhau, từ đơn giản đến cầu kỳ. Mỗi kiểu cắt tỉa không chỉ khiến nó trông thêm quý phái mà còn giúp nó di chuyển nhanh nhẹn hơn, như một cơn gió lướt qua. Chúng rất trung thành với chủ nhân và luôn sẵn sàng bảo vệ.',
    rarity: 'common',
  ),

  'hawlucha': PokemonMeta(
    hint: 'Vũ công với đôi chân mạnh mẽ, bay lượn trên không.',
    lore: 'Sinh vật nhỏ bé này sở hữu kỹ năng chiến đấu điêu luyện. Dù thân hình nhỏ gọn, nó có thể đối đầu ngang ngửa với những đối thủ to lớn hơn nhờ sự nhanh nhẹn và sức mạnh trong những cú đá như chớp. Nó thường luyện tập những động tác nhào lộn đẹp mắt, vừa để rèn luyện sức mạnh vừa để làm hài lòng khán giả trên chiến trường.',
    rarity: 'rare',
  ),

  'dedenne': PokemonMeta(
    hint: 'Cái tai nhỏ màu vàng, dùng để nói chuyện.',
    lore: 'Sinh vật bé nhỏ này có đôi tai dài như râu, luôn rung rinh để bắt sóng điện. Nó có thể nói chuyện với bạn bè ở rất xa, như gửi tin nhắn qua không khí vậy. Đôi khi, nó nghịch ngợm phóng ra tia điện nhỏ để đùa giỡn. Nếu thấy nó nhấp nháy đèn trên má, có lẽ nó đang vui lắm đó!',
    rarity: 'common',
  ),

  'carbink': PokemonMeta(
    hint: 'Tảng đá lơ lửng với một viên đá quý trên đầu.',
    lore: 'Sinh ra từ sâu trong lòng đất, nơi nhiệt độ và áp suất cao ngự trị. Sinh vật nhỏ bé này mang trên mình một viên đá quý vô cùng quý giá, là nguồn năng lượng để nó phóng ra những tia sáng mạnh mẽ. Nó thường sống thành từng đàn, ẩn mình trong những hang động tối tăm và bí ẩn.',
    rarity: 'rare',
  ),

  'klefki': PokemonMeta(
    hint: 'Linh vật nhỏ bé luôn mang theo chùm chìa khóa leng keng.',
    lore: 'Sinh vật này có tập tính kỳ lạ là thu thập chìa khóa. Khi cảm thấy bị đe dọa, nó sẽ lắc mạnh chùm chìa khóa của mình để tạo ra âm thanh chói tai, khiến đối phương sợ hãi bỏ chạy. Chúng thường ẩn náu ở những nơi có nhiều đồ vật bị bỏ quên, nơi chúng có thể tìm thấy những chiếc chìa khóa mới để thêm vào bộ sưu tập.',
    rarity: 'rare',
  ),

  'xerneas': PokemonMeta(
    hint: 'Cây cổ thụ với sừng lấp lánh ban phước lành.',
    lore: 'Có một truyền thuyết kể rằng sinh vật này có thể ban tặng sự sống vĩnh cửu. Nó đã ngủ yên hàng ngàn năm dưới hình hài một cái cây khổng lồ trước khi thức tỉnh. Khi nó mang lại sự sống, ánh sáng từ cơ thể nó sẽ soi sáng cả khu rừng, xua tan bóng tối và mang lại sự ấm áp.',
    rarity: 'legendary',
  ),

  'yveltal': PokemonMeta(
    hint: 'Chim khổng lồ màu đỏ với đôi cánh hút sinh lực.',
    lore: 'Là một Pokémon huyền thoại mạnh mẽ, khi đôi cánh và đuôi của nó xòe rộng và phát sáng rực rỡ, nó hút lấy sinh lực từ mọi sinh vật xung quanh, ban cho sự sống hoặc lấy đi mãi mãi.  Nó biểu tượng cho sự hủy diệt và hồi sinh.',
    rarity: 'legendary',
  ),

  'zygarde': PokemonMeta(
    hint: 'Sinh vật giám hộ khổng lồ, xuất hiện khi cần thiết.',
    lore: 'Khi sự cân bằng tự nhiên của vùng Kalos gặp nguy hiểm, một sinh vật huyền thoại bí ẩn sẽ thức tỉnh từ trạng thái ngủ sâu. Sức mạnh phi thường của nó được hé lộ để khôi phục lại trật tự, bảo vệ mọi sinh vật khỏi sự hủy diệt. Nó coi trọng sự hài hòa của thế giới và luôn sẵn sàng hành động để giữ gìn nó.',
    rarity: 'legendary',
  ),

  'diancie': PokemonMeta(
    hint: 'Viên ngọc hồng lấp lánh, món quà từ Carbink.',
    lore: 'Sinh vật xinh đẹp này đến từ những khối đá nhỏ. Cơ thể hồng rực rỡ của nó phản chiếu ánh sáng tuyệt đẹp, như một viên ngọc quý giá. Người ta nói rằng vẻ đẹp của nó khiến ai nhìn thấy cũng phải trầm trồ. Nó có thể tạo ra những viên đá quý tuyệt đẹp từ không khí, mang lại niềm vui và sự lấp lánh cho thế giới xung quanh. Là một sinh vật hiếm thấy, nó mang sức mạnh tiềm ẩn và sự duyên dáng khó cưỡng.',
    rarity: 'mythical',
  ),

  'hoopa': PokemonMeta(
    hint: 'Sinh vật vui nhộn với những vòng tròn ma thuật.',
    lore: 'Sinh vật nhỏ bé này có khả năng dịch chuyển mọi thứ đến những nơi xa xôi nhờ chiếc vòng đặc biệt của mình. Nó thích làm những trò tinh nghịch và khiến mọi vật biến mất không dấu vết, đôi khi còn mang theo cả những món đồ không thuộc về nó. Chiếc vòng của nó có thể bẻ cong không gian, tạo ra những cánh cổng kỳ lạ để đưa bạn đến bất cứ đâu.',
    rarity: 'mythical',
  ),

  'volcanion': PokemonMeta(
    hint: 'Con quái vật hơi nước bí ẩn, biết biến mất vào sương mù.',
    lore: 'Sinh vật kỳ lạ này sống sâu trong những dãy núi hoang sơ, nơi con người không thể đặt chân đến. Nó tạo ra những làn hơi nước nóng bỏng, che giấu sự tồn tại của mình. Khi cần thiết, nó có thể phun ra những cột hơi nước cực mạnh và biến mất vào không khí mờ ảo. Truyền thuyết kể rằng nơi nó sống luôn bao phủ bởi một lớp sương mù dày đặc, khiến việc tìm kiếm nó trở nên bất khả thi.',
    rarity: 'mythical',
  ),

  'oricorio': PokemonMeta(
    hint: 'Chim sẻ vui nhộn tung cánh như lửa nhảy múa.',
    lore: 'Sinh vật nhỏ với bộ lông rực rỡ, nó lắc lư theo điệu nhạc của riêng mình. Khi biểu diễn, đôi cánh của nó bùng cháy, tạo ra những luồng lửa ấm áp bao bọc lấy mọi thứ xung quanh. Vũ điệu say đắm của nó mang đến niềm vui và sự ấm áp cho khu rừng.',
    rarity: 'rare',
  ),

  'wishiwashi': PokemonMeta(
    hint: 'Con cá nhỏ dễ thương, mắt sáng khi buồn.',
    lore: 'Khi gặp nguy hiểm, đôi mắt của chú cá nhỏ này sẽ rơm rớm nước và bắt đầu lấp lánh. Ánh sáng ấy thu hút những người bạn đồng hành của nó, và cả đàn sẽ cùng nhau đối mặt với kẻ thù. Chúng hợp lại thành một sức mạnh lớn lao, khiến kẻ xấu phải dè chừng.',
    rarity: 'rare',
  ),

  'comfey': PokemonMeta(
    hint: 'Bông hoa tươi tắn trên dây leo ngọt ngào.',
    lore: 'Loài hoa bé nhỏ này có khả năng đặc biệt, nó luôn tìm những bông hoa khác để kết bạn và trao đổi dưỡng chất. Nhờ sự chăm sóc tỉ mỉ, những bông hoa bạn bè xinh đẹp sẽ càng thêm rực rỡ và tỏa ra hương thơm dịu dàng, quyến rũ.  Nó giống như một người làm vườn tí hon, luôn mang đến vẻ đẹp và sự tươi mới cho thế giới xung quanh.',
    rarity: 'rare',
  ),

  'oranguru': PokemonMeta(
    hint: 'Vẻ ngoài trầm tư, thích chỉ bảo người khác.',
    lore: 'Loài Pokémon này có trí tuệ vượt trội, luôn quan sát và phân tích mọi thứ xung quanh. Nó không ngần ngại thể hiện sự khinh thường với những người thiếu kinh nghiệm, vì vậy chỉ những huấn luyện viên dày dạn mới có thể chinh phục được sự tôn trọng của nó. Nó thích sống trong rừng sâu và thường được tìm thấy đang suy ngẫm một mình hoặc giảng dạy cho những Pokémon khác.',
    rarity: 'rare',
  ),

  'passimian': PokemonMeta(
    hint: 'Tóc xanh và thích ném trái cây.',
    lore: 'Những chú khỉ này sống theo đàn khoảng 20 con. Chúng rất đoàn kết và luôn sẵn sàng giúp đỡ đồng đội. Lòng trung thành của chúng thật đáng ngưỡng mộ, không bao giờ bỏ rơi bạn bè trên chiến trường hay trong cuộc sống.',
    rarity: 'rare',
  ),

  'pyukumuku': PokemonMeta(
    hint: 'Cơ thể phủ đầy chất nhờn ẩm ướt.',
    lore: 'Sinh vật bé nhỏ này sống ở bờ biển, luôn giữ cho mình ẩm ướt bằng lớp chất nhờn đặc biệt. Nhờ vậy, nó có thể thoải mái dạo chơi trên cạn rất lâu mà không sợ bị khô da. Khi gặp nguy hiểm, nó sẽ phun ra chất nhờn từ miệng để tự vệ, khiến kẻ thù khó chịu và bỏ đi.',
    rarity: 'rare',
  ),

  'minior': PokemonMeta(
    hint: 'Viên đá bé nhỏ, có vảy lấp lánh.',
    lore: 'Sinh vật bé nhỏ này từng sống trên tầng ôzôn cao quý. Khi lớp vỏ bên ngoài trở nên quá nặng, nó sẽ rơi thẳng xuống đất. Bên trong lớp vỏ cứng rắn ấy là một tinh thể đầy màu sắc, tỏa sáng rực rỡ như một vì sao rơi. Nó rất thích được ở trên cao, nhưng đôi khi trọng lực lại kéo nó về phía mặt đất quen thuộc.',
    rarity: 'epic',
  ),

  'komala': PokemonMeta(
    hint: 'Luôn ngủ say, đầu đội khúc gỗ.',
    lore: 'Sinh ra trong giấc mộng, sống và chết trong mơ. Mọi cử động của nó dường như chỉ là do nó cựa quậy khi đang mơ. Có lẽ nó mơ về những điều tốt đẹp và yên bình, vì thế mà nó luôn giữ trên đầu một khúc gỗ để cảm thấy an tâm hơn.',
    rarity: 'rare',
  ),

  'turtonator': PokemonMeta(
    hint: 'Rùa rùa mang mai nóng, bụng có lỗ đáng ghét.',
    lore: 'Sinh vật này có một chiếc mai đặc biệt, chứa đầy chất rất dễ nổ. Chỉ cần một cú chạm nhẹ là nó có thể bùng nổ dữ dội, tạo ra một màn trình diễn ánh sáng ấn tượng. Tuy nhiên, sinh vật này có một điểm yếu duy nhất nằm ở chiếc bụng có một cái lỗ nhỏ. Khi đối mặt với nguy hiểm, nó thường cố gắng bảo vệ chiếc bụng này bằng mọi cách có thể, dù trông có vẻ khó khăn.',
    rarity: 'rare',
  ),

  'togedemaru': PokemonMeta(
    hint: 'Cắt hai quả bông tròn có gai nhọn.',
    lore: 'Khi cảm thấy nguy hiểm, gai trên lưng của sinh vật này sẽ dựng đứng và đâm vào kẻ thù. Nó cuộn tròn thành một quả bóng gai để tự vệ. Đôi khi, nó có thể sạc điện cho những chiếc gai nhọn này, tạo ra một vụ nổ điện nhỏ khi bị tấn công. Sinh vật này thích sống ở những ngọn núi, nơi nó có thể tự do lăn lộn và chơi đùa.',
    rarity: 'common',
  ),

  'mimikyu': PokemonMeta(
    hint: 'Ẩn mình dưới lớp vải, trông nó thật đáng thương.',
    lore: 'Sinh vật kỳ lạ này luôn bao phủ cơ thể trong một tấm vải cũ. Người ta đồn rằng vẻ ngoài thật sự của nó đáng sợ đến mức khiến ai nhìn thấy cũng phát hoảng. Nó sống ở những nơi tối tăm, và cố gắng hòa mình vào môi trường xung quanh để tránh bị phát hiện.  Món đồ chơi cũ kỹ này chỉ muốn có bạn bè, nhưng nỗi sợ hãi trong trái tim khiến nó luôn cô đơn.',
    rarity: 'rare',
  ),

  'bruxish': PokemonMeta(
    hint: 'Răng sắc nhọn, đầu có cục bướu.',
    lore: 'Sinh vật biển này có chiếc mũi dài và những chiếc răng sắc nhọn. Khi cảm thấy bị đe dọa hoặc muốn tấn công, nó sẽ phát ra những âm thanh chói tai từ cái bướu trên đầu, làm rung chuyển cả vùng biển xung quanh. Sức mạnh tâm linh của nó mạnh mẽ đến nỗi có thể gây khó chịu cho bất kỳ kẻ địch nào.',
    rarity: 'rare',
  ),

  'drampa': PokemonMeta(
    hint: 'Sinh vật hiền lành, có mây trên người, hơi thở mạnh mẽ.',
    lore: 'Loài vật này có tính cách rất tốt bụng, luôn yêu thương mọi người xung quanh. Tuy nhiên, nếu bị chọc giận, nó sẽ phun ra luồng khí nóng bỏng, có thể thiêu rụi mọi thứ. Dù có vẻ ngoài đáng yêu, nó ẩn chứa một sức mạnh tiềm tàng đáng gờm. Người ta kể rằng nó thích hát những bài hát êm dịu để làm dịu đi mọi căng thẳng.',
    rarity: 'rare',
  ),

  'dhelmise': PokemonMeta(
    hint: 'Thân mình là rong biển, tay cầm mỏ neo khổng lồ.',
    lore: 'Sinh vật bí ẩn này có vẻ ngoài giống như một bó rong biển trôi dạt, nhưng ẩn chứa sức mạnh đáng kinh ngạc. Nó thường lơ lửng trong nước, chỉ để lộ phần giống như con mắt ở trên cùng. Khi tức giận hoặc sẵn sàng chiến đấu, nó sẽ vung chiếc mỏ neo bằng thép của mình với tốc độ kinh hoàng. Sức mạnh của nó đủ để đánh bại những Pokémon to lớn nhất chỉ trong một đòn tấn công duy nhất.',
    rarity: 'epic',
  ),

  'tapu-koko': PokemonMeta(
    hint: 'Chú chim thần màu vàng có sừng trên đầu tạo ra sấm sét.',
    lore: 'Thần hộ mệnh này của đảo Melemele rất thích khám phá thế giới. Nó có thể triệu hồi những đám mây giông và tích trữ tia sét bên trong cơ thể mình. Khi ai đó lại gần, nó sẽ phóng ra một lượng điện tích lớn để cảnh báo. Tuy nhiên, nó cũng rất tò mò và thích quan sát mọi thứ xung quanh với đôi mắt lấp lánh.',
    rarity: 'legendary',
  ),

  'tapu-lele': PokemonMeta(
    hint: 'Tia sáng hoa lan tỏa, đôi cánh tuyệt đẹp.',
    lore: 'Vị thần bảo hộ của đảo Akala này có vẻ ngây thơ nhưng lại rất tàn nhẫn. Năng lượng của nó đến từ hương thơm ngọt ngào của muôn loài hoa. Khi vui vẻ, nó rắc bụi hoa lấp lánh, khiến mọi sinh vật quên hết sầu lo và chìm vào giấc ngủ. Nhưng nếu tức giận, những cánh hoa nó mang theo có thể gây ra ảo giác kinh hoàng.',
    rarity: 'legendary',
  ),

  'tapu-bulu': PokemonMeta(
    hint: 'Chiếc sừng cong mạnh mẽ, khuấy động cây cối.',
    lore: 'Sinh vật thần thoại này có khả năng khuấy động núi non và tạo ra sự sống. Nó nhổ bật những cây cổ thụ to lớn lên khỏi mặt đất và dùng chúng như đồ chơi, quăng quật tứ tung. Sau đó, nó vun trồng cây cối, khiến chúng phát triển mạnh mẽ, rồi hấp thụ năng lượng từ chính sự sống đó. Sức mạnh của nó gắn liền với sự màu mỡ của đất đai.',
    rarity: 'legendary',
  ),

  'tapu-fini': PokemonMeta(
    hint: 'Cô tiên rùa ẩn mình trong sương mù.',
    lore: 'Vùng nước mà nó sinh sống được ban phước bởi sự tinh khiết. Sức mạnh của nó đến từ dòng hải lưu, và màn sương dày đặc nó tạo ra khiến kẻ thù rơi vào mê cung, chịu đựng số phận bi đát.',
    rarity: 'legendary',
  ),

  'nihilego': PokemonMeta(
    hint: 'Sinh vật óng ánh, giống sứa, gây bạo lực.',
    lore: 'Một loài sinh vật kỳ bí đến từ một thế giới khác, được gọi là Ultra Beast. Nó rực rỡ và lấp lánh, nhưng ẩn chứa một sức mạnh nguy hiểm. Những ai bị nó "lây nhiễm" có thể trở nên cư xử bất thường và hung hăng một cách khó hiểu. Thật là một bí ẩn lớn!',
    rarity: 'rare',
  ),

  'buzzwole': PokemonMeta(
    hint: 'Cơ bắp cuồn cuộn, trông giống côn trùng.',
    lore: 'Sinh vật kỳ lạ này đến từ một thế giới khác. Nó phô trương sức mạnh cơ bắp của mình một cách đầy tự tin. Không rõ liệu đây là một lời khoe khoang về thể chất hay là một lời cảnh báo đầy đe dọa. Nó cực kỳ thích tập luyện và tìm kiếm những đối thủ xứng tầm để thử sức.',
    rarity: 'rare',
  ),

  'pheromosa': PokemonMeta(
    hint: 'Cô nàng xinh đẹp, đôi chân dài thoăn thoắt.',
    lore: 'Một sinh vật kỳ lạ từ thế giới khác, nó sở hữu vẻ ngoài vô cùng quyến rũ nhưng ẩn chứa sức mạnh đáng gờm.  Nó di chuyển với tốc độ không tưởng, lướt qua phong cảnh như một cơn gió.  Dù trông mong manh, nhưng đừng để vẻ ngoài đánh lừa bạn.  Nó là một trong những sinh vật được gọi là Ultra Beast, mang trong mình những bí ẩn của vũ trụ.',
    rarity: 'rare',
  ),

  'xurkitree': PokemonMeta(
    hint: 'Nó giống một cái cây kỳ lạ với những sợi dây điện',
    lore: 'Sinh vật bí ẩn này tỏa ra những luồng điện mạnh mẽ từ khắp cơ thể. Người ta nói rằng nó đến từ một thế giới khác, mang theo sức mạnh điện từ kinh ngạc. Đừng lại gần vì nó có thể gây giật bất ngờ!',
    rarity: 'rare',
  ),

  'celesteela': PokemonMeta(
    hint: 'Một con tàu vũ trụ khổng lồ biết bay.',
    lore: 'Sinh vật này đến từ một thế giới xa lạ, xuất hiện qua những cánh cổng hư không bí ẩn. Người ta thường thấy nó lướt đi trên bầu trời với tốc độ chóng mặt, như một vì sao băng khổng lồ. Cơ thể của nó có cấu trúc kỳ lạ, giống như một con tàu được chế tạo từ kim loại sáng bóng. Nó khiến mọi người kinh ngạc với sự xuất hiện đột ngột và hành trình bí ẩn của mình trên bầu trời đêm.',
    rarity: 'rare',
  ),

  'kartana': PokemonMeta(
    hint: 'Sinh vật mỏng manh, sắc như dao.',
    lore: 'Một sinh vật kỳ lạ đến từ một thế giới khác qua Chiếc Lỗ Siêu Lớn. Nó không thực sự tấn công, nhưng cơ thể mỏng manh và sắc nhọn của nó tự nó đã là một vũ khí nguy hiểm. Cẩn thận đừng chạm vào nó nếu không muốn bị cắt đứt!',
    rarity: 'rare',
  ),

  'guzzlord': PokemonMeta(
    hint: 'Kẻ khổng lồ háu ăn, nuốt chửng mọi thứ trên đường đi.',
    lore: 'Sinh vật kỳ lạ này đến từ một thế giới khác. Nó có một cái miệng khổng lồ và có thể ăn bất cứ thứ gì, từ núi non đến các tòa nhà chọc trời. Nó không ngừng tìm kiếm thức ăn và đã được ghi nhận là đã tiêu thụ rất nhiều. Nó là một trong những Sinh vật Siêu Việt, những thực thể bí ẩn và mạnh mẽ.',
    rarity: 'rare',
  ),

  'necrozma': PokemonMeta(
    hint: 'Sinh vật hình lăng trụ, ẩn mình dưới lòng đất.',
    lore: 'Sinh vật này được cho là đến từ một thế giới khác từ thời xa xưa. Trông nó có nét tương đồng với các Ultra Beasts. Nó dường như đang ngủ yên dưới lòng đất.',
    rarity: 'legendary',
  ),

  'magearna': PokemonMeta(
    hint: 'Cô bé máy với đôi mắt tròn và lớp vỏ kim loại sáng bóng.',
    lore: 'Một món quà từ người thợ kim hoàn bí ẩn, sinh vật máy này đã tồn tại hơn 500 năm. Nó có thể hiểu mọi điều bạn nói, nhưng lại không thể tự mình thốt lên lời nào. Được chế tạo tinh xảo, nó mang trong mình một trái tim nhân tạo chứa đầy tình yêu thương, mặc dù không thể bày tỏ bằng lời nói.',
    rarity: 'mythical',
  ),

  'marshadow': PokemonMeta(
    hint: 'Ẩn mình trong bóng tối, nhảy múa không dấu vết.',
    lore: 'Sinh vật huyền bí này được đồn đại là sống ẩn dật, chỉ hiện diện dưới ánh trăng mờ ảo. Nó có khả năng hòa mình vào bóng tối, trở nên vô hình với mắt người.  Vì thế, chỉ có những câu chuyện cổ tích mới nhắc đến sự tồn tại của nó, khiến nhiều người tin rằng đó chỉ là truyền thuyết.  Nó tựa như một vũ công thầm lặng, lướt đi trong đêm mà không hề để lại dấu vết.',
    rarity: 'mythical',
  ),

  'stakataka': PokemonMeta(
    hint: 'Robot khổng lồ được ghép từ nhiều khối vuông.',
    lore: 'Sinh vật kỳ lạ này đến từ một chiều không gian khác, chui ra từ một cánh cổng ánh sáng bí ẩn. Cơ thể nó trông như được tạo thành từ vô số viên gạch xếp chồng lên nhau, tạo thành một khối hình tháp vững chắc. Mỗi viên gạch đó lại là một sự sống riêng biệt, cùng nhau hòa hợp để tạo nên một sinh vật to lớn và mạnh mẽ. Nó di chuyển một cách chậm rãi nhưng đầy uy lực, khiến ai nhìn thấy cũng phải kinh ngạc.',
    rarity: 'epic',
  ),

  'blacephalon': PokemonMeta(
    hint: 'Chúng có cái đầu phát nổ và hay rình rập.',
    lore: 'Một sinh vật kỳ lạ này sẽ lén lút tiến lại gần mọi người. Thật bất ngờ, cái đầu của nó sẽ phát nổ! Nó được cho là một loại Siêu Quái Vật. Hãy cẩn thận khi gặp nó, vì nó rất nguy hiểm.',
    rarity: 'epic',
  ),

  'zeraora': PokemonMeta(
    hint: 'Vằn vàng, lao nhanh, điện giật.',
    lore: 'Sinh vật nhanh nhẹn này có khả năng tích điện, khiến móng vuốt của nó tỏa ra năng lượng mạnh mẽ. Khi tấn công, nó sử dụng móng vuốt sắc bén để xé toạc đối thủ. Sức mạnh của nó đáng sợ đến nỗi ngay cả khi né tránh được đòn đánh trực diện, kẻ địch vẫn có thể bị tê liệt bởi những tia lửa điện bay ra. Nó sống ở những khu rừng xa xôi và hiếm khi xuất hiện trước mặt con người.',
    rarity: 'mythical',
  ),

  'cramorant': PokemonMeta(
    hint: 'Chim biển mỏ lớn, hay quên.',
    lore: 'Loài chim này có cái mỏ rất khỏe, đủ sức hạ gục đối thủ chỉ bằng một cú táp. Tuy nhiên, đôi khi nó lại đãng trí đến mức quên mất mình đang giao tranh với ai ngay giữa trận chiến. Điều này đôi khi mang lại lợi thế bất ngờ cho nó, nhưng cũng có thể khiến nó bỏ lỡ cơ hội chiến thắng.',
    rarity: 'rare',
  ),

  'runerigus': PokemonMeta(
    hint: 'Hình ảnh cổ xưa biết di chuyển, mang linh hồn người quá cố.',
    lore: 'Trước kia, nó là một bức tranh cũ kỹ mang lời nguyền mạnh mẽ. Khi một linh hồn Yamask trú ngụ bên trong, bức tranh đã thức tỉnh và bắt đầu cử động. Giờ đây, nó đi lang thang, mang theo những ký ức và hận thù của người xưa, lan tỏa lời nguyền đến những ai dám làm phiền nó. Sinh vật này có vẻ ngoài của một bức tranh vỡ vụn, với những nét vẽ cổ xưa hiện rõ trên cơ thể.',
    rarity: 'rare',
  ),

  'falinks': PokemonMeta(
    hint: 'Đoàn quân hùng mạnh xếp thành hàng ngũ tiến lên.',
    lore: 'Trong một đội quân gồm sáu chiến binh dũng cảm, có một người dẫn đầu. Anh ta đưa ra mệnh lệnh và những người còn lại tuân theo không chút do dự. Họ cùng nhau chiến đấu bảo vệ đồng đội và khu vực sinh sống của mình, luôn giữ vững kỷ luật và tinh thần đoàn kết. Mỗi trận chiến là một bài học để họ trở nên mạnh mẽ hơn, sẵn sàng đối mặt với mọi thử thách bằng sự hợp tác ăn ý.',
    rarity: 'rare',
  ),

  'pincurchin': PokemonMeta(
    hint: 'Sống dưới biển, có gai nhọn phát điện.',
    lore: 'Sinh vật biển này có bộ dạng giống như một chú nhím nhỏ bé, nhưng thay vì gai bình thường, những chiếc gai của nó lại có khả năng phát ra dòng điện. Nó thích sống ở những vùng biển có rong biển và dùng răng nhỏ xinh của mình để cạo chúng ra khỏi đá để ăn. Khi cảm thấy bị đe dọa, những chiếc gai này sẽ phóng ra điện, khiến kẻ địch phải dè chừng.',
    rarity: 'rare',
  ),

  'stonjourner': PokemonMeta(
    hint: 'Tảng đá khổng lồ đứng trên đồng cỏ, thích đá bóng.',
    lore: 'Nó đứng sừng sững trên những đồng cỏ rộng lớn, lặng lẽ ngắm nhìn mặt trời lặn từ đỉnh cao xuống đường chân trời.  Loài Pokémon này có biệt tài tung ra những cú đá đầy uy lực, mạnh mẽ đến bất ngờ.  Những cú đá của nó có thể làm rung chuyển mặt đất, khiến mọi đối thủ phải dè chừng dù vẻ ngoài có phần chậm chạp.',
    rarity: 'rare',
  ),

  'eiscue': PokemonMeta(
    hint: 'Sinh vật đội mũ băng, thích nước lạnh.',
    lore: 'Đến từ xứ sở băng giá, sinh vật này trôi dạt trên biển cả. Nó luôn giữ cho chiếc mũ băng trên đầu thật lạnh để cơ thể luôn mát mẻ.  Món đồ yêu thích của nó là những tảng băng trôi, nơi nó có thể thư giãn và tận hưởng không khí se lạnh.  Đôi mắt lấp lánh đằng sau lớp băng cho thấy sự vui vẻ và tinh nghịch.',
    rarity: 'rare',
  ),

  'indeedee': PokemonMeta(
    hint: 'Chú giúp việc nhỏ nhắn với đôi sừng biết cảm nhận cảm xúc.',
    lore: 'Sinh vật này có đôi sừng trên đầu để cảm nhận mọi cảm xúc xung quanh. Những chú cái thường rất hiền lành và dễ mến. Còn những chú đực lại rất chu đáo, chúng coi sóc mọi thứ cho người mà chúng phục vụ, luôn sẵn sàng giúp đỡ và làm hài lòng người bạn đồng hành.',
    rarity: 'epic',
  ),

  'morpeko': PokemonMeta(
    hint: 'Chú chuột nhỏ với túi má phát điện.',
    lore: 'Chú ta có những chiếc túi nhỏ trên má để cất giữ đồ ăn. Khi ăn hạt, chú không chỉ no bụng mà còn tạo ra điện năng. Nguồn năng lượng này giúp chú ta thay đổi màu sắc và tâm trạng dựa trên mức độ đói của mình. Chú ta luôn tìm kiếm những hạt ngon lành để nạp đầy năng lượng và giữ cho bản thân vui vẻ.',
    rarity: 'common',
  ),

  'dracozolt': PokemonMeta(
    hint: 'Thân dưới to khỏe, trông như khủng long kỳ lạ.',
    lore: 'Sinh vật cổ đại này từng bất khả chiến bại nhờ đôi chân mạnh mẽ. Tuy nhiên, nó đã tuyệt chủng vì ăn hết mọi cây cỏ xung quanh. Giờ đây, nó chỉ tồn tại dưới dạng hóa thạch.',
    rarity: 'rare',
  ),

  'arctozolt': PokemonMeta(
    hint: 'Sống ở băng, thân trên rung động tạo ra điện.',
    lore: 'Sinh vật cổ đại này có phần trên đóng băng và phần dưới đã chết. Khi thân trên lạnh giá của nó rung lên, nó sẽ tạo ra điện. Tuy nhiên, vì chân của nó đã ngừng hoạt động từ lâu, nó khó có thể di chuyển và chỉ có thể trườn trên mặt đất hoặc dựa vào gió để di chuyển.',
    rarity: 'rare',
  ),

  'dracovish': PokemonMeta(
    hint: 'Chân khỏe, hàm to, săn mồi giỏi.',
    lore: 'Sinh vật khổng lồ từng thống trị vùng biển. Nhờ đôi chân mạnh mẽ và hàm răng sắc nhọn, nó là kẻ săn mồi đáng gờm nhất thời bấy giờ. Tuy nhiên, sự tàn sát quá mức nguồn thức ăn đã dẫn đến sự tuyệt chủng bi thảm của loài này.',
    rarity: 'rare',
  ),

  'arctovish': PokemonMeta(
    hint: 'Miệng kì lạ, thích săn mồi bằng băng giá.',
    lore: 'Sinh vật cổ đại này có một chiếc đầu độc đáo với miệng nằm trên đỉnh, giúp nó dễ dàng đóng băng môi trường xung quanh để bắt con mồi. Tuy nhiên, vì vị trí miệng bất tiện, việc ăn uống sau đó lại trở thành một thử thách. Nó lang thang ở những vùng cực lạnh giá, những dấu tích của nó thỉnh thoảng được tìm thấy trong lớp băng vĩnh cửu.',
    rarity: 'rare',
  ),

  'zacian': PokemonMeta(
    hint: 'Vị vua anh hùng với thanh kiếm sáng chói.',
    lore: 'Người ta kể rằng vị anh hùng này đã chiến đấu cùng con người để bảo vệ vùng đất khỏi một mối đe dọa tăm tối. Nó mang trong mình sức mạnh của bầu trời và lòng dũng cảm vô biên. Thanh kiếm trên tay nó không chỉ là vũ khí mà còn là biểu tượng của hy vọng. Nó luôn sẵn sàng chiến đấu vì chính nghĩa, bảo vệ mọi người khỏi hiểm nguy.',
    rarity: 'legendary',
  ),

  'zamazenta': PokemonMeta(
    hint: 'Chú chó anh hùng với chiếc khiên lớn trên ngực.',
    lore: 'Thuở xưa, nó cùng vị vua nhân dân đã chung tay bảo vệ vùng Galar. Sinh vật này hấp thụ kim loại để sử dụng trong các trận chiến, trở thành một lá chắn vững chắc và một chiến binh dũng mãnh, luôn sẵn sàng bảo vệ những người yếu thế.',
    rarity: 'legendary',
  ),

  'eternatus': PokemonMeta(
    hint: 'Sinh vật khổng lồ màu tím, tỏa ra năng lượng.',
    lore: 'Nó có một lõi trên ngực hấp thụ năng lượng từ vùng Galar, giúp nó luôn hoạt động. Sinh vật này được cho là đến từ một vì sao xa xôi và có sức mạnh khủng khiếp, có thể thay đổi thời tiết và tạo ra vụ nổ năng lượng khổng lồ. Mặc dù có vẻ ngoài đáng sợ và sức mạnh đáng kinh ngạc, nhưng nó không hoàn toàn xấu xa và chỉ hành động theo bản năng của mình.',
    rarity: 'legendary',
  ),

  'zarude': PokemonMeta(
    hint: 'Quái vật rừng rậm với bàn tay cứng cáp.',
    lore: 'Sinh vật bí ẩn này sống theo đàn trong rừng sâu. Chúng cực kỳ hung hăng, khiến các loài vật khác phải khiếp sợ. Sức mạnh thể chất đáng gờm và sự uy nghiêm khiến chúng trở thành nỗi ám ảnh của mọi kẻ xâm phạm lãnh thổ.',
    rarity: 'mythical',
  ),

  'regieleki': PokemonMeta(
    hint: 'Cụm năng lượng điện, có các vòng trên cơ thể.',
    lore: 'Tương truyền, Pokémon này là một khối năng lượng điện thuần túy. Nó có tốc độ cực nhanh, có thể di chuyển quãng đường dài trong khoảnh khắc. Những chiếc vòng trên người nó được cho là nơi chứa đựng sức mạnh tiềm ẩn. Nếu những chiếc vòng này bị tháo ra, Pokémon sẽ giải phóng toàn bộ năng lượng khủng khiếp của mình, tạo ra một luồng điện cực mạnh.',
    rarity: 'legendary',
  ),

  'regidrago': PokemonMeta(
    hint: 'Cánh tay giống đầu rồng xưa, vẫn còn bí ẩn.',
    lore: 'Người ta nói rằng những cánh tay khổng lồ của sinh vật này từng là đầu của một loài rồng cổ đại. Tuy nhiên, đây vẫn chỉ là một giả thuyết chưa được chứng minh. Sức mạnh ẩn chứa trong cơ thể nó là điều khiến nhiều nhà khoa học tò mò nghiên cứu.',
    rarity: 'legendary',
  ),

  'glastrier': PokemonMeta(
    hint: 'Móng guốc lạnh băng, tính tình hung hăng.',
    lore: 'Sinh vật này tỏa ra hơi lạnh chết người từ móng guốc.  Nó nổi tiếng là kẻ hiếu chiến, sẵn sàng dùng vũ lực để đoạt lấy mọi thứ mình mong muốn.  Sự giận dữ của nó có thể biến cảnh vật xung quanh thành băng tuyết ngay lập tức.',
    rarity: 'legendary',
  ),

  'spectrier': PokemonMeta(
    hint: 'Bóng ma trắng có bờm đen, không nhìn thấy.',
    lore: 'Sinh vật bí ẩn này không dùng mắt để nhìn thế giới xung quanh. Thay vào đó, nó cảm nhận mọi thứ bằng các giác quan khác. Người ta đồn rằng cú đá của nó có thể tách rời linh hồn khỏi thể xác, khiến nó trở thành một đối thủ đáng sợ trong bóng tối.',
    rarity: 'legendary',
  ),

  'calyrex': PokemonMeta(
    hint: 'Vị vua đội vương miện hoa, ban phước lành.',
    lore: 'Trước đây, một Pokémon đã cai trị vùng Galar với lòng nhân từ. Nó sở hữu sức mạnh chữa lành và ban phước cho mọi sinh vật.  Dù quyền uy, nó luôn đối xử dịu dàng với muôn loài, mang lại sự an lành và thịnh vượng cho vùng đất.',
    rarity: 'legendary',
  ),

  'enamorus': PokemonMeta(
    hint: 'Đôi cánh rực rỡ báo hiệu mùa xuân đến.',
    lore: 'Khi nó bay đến đây từ biển cả, mùa đông giá rét sẽ chấm dứt. Theo truyền thuyết, tình yêu của sinh vật này đã mang lại sức sống mới cho vạn vật khắp Hisui vào mùa xuân.',
    rarity: 'legendary',
  ),

  'squawkabilly': PokemonMeta(
    hint: 'Chim sẻ thành phố, lông sặc sỡ, thích đánh nhau.',
    lore: 'Loài chim này rất thích sinh sống ở các thành phố nhộn nhịp. Chúng tụ tập thành đàn theo màu lông rực rỡ của mình và thường xuyên tranh giành lãnh thổ với các đàn khác. Tiếng hót líu lo vang vọng khắp các khu phố, báo hiệu sự hiện diện của đàn chim độc đáo này.',
    rarity: 'common',
  ),

  'klawf': PokemonMeta(
    hint: 'Chú cua treo mình trên đỉnh núi chờ con mồi.',
    lore: 'Sinh vật này dành phần lớn thời gian treo ngược mình trên các vách đá cheo leo, tạo thành một cái bẫy tự nhiên hoàn hảo. Với cái vỏ cứng cáp và đôi càng khỏe mạnh, nó lặng lẽ rình rập để tóm lấy những con mồi vô tình đi ngang qua. Tuy nhiên, tư thế treo mình này không kéo dài mãi mãi. Do máu dồn lên đầu, nó buộc phải thay đổi vị trí để tránh cảm giác khó chịu.',
    rarity: 'rare',
  ),

  'bombirdier': PokemonMeta(
    hint: 'Chim bé mang túi, thích thả đồ từ trên cao.',
    lore: 'Sinh vật bé nhỏ này có một chiếc túi nhỏ làm từ lông rụng và lông trên ngực, nơi nó thu thập các vật phẩm. Sau đó, nó thích thú thả những thứ này từ trên cao xuống, quan sát chúng rơi. Hoạt động này dường như mang lại niềm vui cho nó, giống như một trò chơi mà nó tự tạo ra.',
    rarity: 'epic',
  ),

  'cyclizar': PokemonMeta(
    hint: 'Một con thằn lằn với chiếc đuôi như bánh xe, sống ở vùng đất cổ xưa.',
    lore: 'Từ ngàn xưa, sinh vật này đã là người bạn đồng hành tin cậy. Những bức tranh khắc trên tường hang động 10.000 năm tuổi cho thấy hình ảnh mọi người cưỡi trên lưng nó. Nó di chuyển nhanh nhẹn trên mọi địa hình, đôi khi còn tạo ra những vòng xoáy trên mặt đất.',
    rarity: 'common',
  ),

  'orthworm': PokemonMeta(
    hint: 'Giun đất có xúc tu đánh trả dữ dội.',
    lore: 'Sinh vật này cuộn tròn dưới đất, chỉ để lộ chiếc đầu nhỏ bé. Khi gặp nguy hiểm, nó sẽ dùng những xúc tu trên cơ thể để tung ra những cú đấm như vũ bão, khiến kẻ thù không kịp trở tay. Như một chiếc lò xo, nó có thể bật dậy và tấn công bất cứ lúc nào. Với khả năng phòng vệ tuyệt vời, nó luôn sẵn sàng bảo vệ bản thân.',
    rarity: 'epic',
  ),

  'flamigo': PokemonMeta(
    hint: 'Chim hồng hạc với chiếc cổ thắt nút độc đáo.',
    lore: 'Sinh vật này có một thói quen lạ lùng là thắt nút phần gốc cổ của mình. Người ta tin rằng hành động này giúp giữ năng lượng được tích trữ trong bụng, ngăn chúng thoát ra ngoài qua mỏ. Điều này có thể là một cơ chế đặc biệt để duy trì sức mạnh hoặc để chuẩn bị cho những cú tấn công bất ngờ.',
    rarity: 'rare',
  ),

  'veluza': PokemonMeta(
    hint: 'Cá xinh đẹp, thích tự cắt tỉa mình cho nhanh nhẹn.',
    lore: 'Loài cá này có khả năng đặc biệt là tự cắt bỏ phần thịt thừa không cần thiết trên cơ thể. Hành động này giúp nó trở nên nhanh nhẹn hơn và tăng cường sức mạnh tinh thần. Điều thú vị là phần thịt dư thừa được cắt bỏ lại có hương vị rất ngon, có thể dùng làm món ăn nhẹ hấp dẫn.',
    rarity: 'rare',
  ),

  'dondozo': PokemonMeta(
    hint: 'Một kẻ háu ăn thích hợp tác để kiếm ăn.',
    lore: 'Loài Pokémon này rất thích ăn nhưng lại vụng về trong việc tự kiếm thức ăn. Chúng thường kết thân với một loài Pokémon khác có màu sắc sặc sỡ để cùng nhau săn mồi. Khi đã cùng nhau, chúng trở thành một cặp đôi đáng gờm, biến con mồi nhỏ bé trở thành bữa ăn thịnh soạn.',
    rarity: 'epic',
  ),

  'tatsugiri': PokemonMeta(
    hint: 'Sinh vật bé nhỏ sống trong miệng rồng lớn.',
    lore: 'Một chú rồng con đáng yêu, nó thường ẩn mình bên trong miệng của một người bạn khổng lồ. Nơi trú ẩn an toàn này giúp nó tránh xa những kẻ xấu luôn rình rập. Dù bé nhỏ, nó lại rất dũng cảm, luôn canh gác cho người bạn của mình và bảo vệ cả hai khỏi nguy hiểm.',
    rarity: 'rare',
  ),

  'great-tusk': PokemonMeta(
    hint: 'Gã khổng lồ răng nanh khổng lồ với bộ áo choàng rách',
    lore: 'Sinh vật to lớn này đã được nhìn thấy gần đây, mang một cái tên được lấy cảm hứng từ một câu chuyện cổ. Nó có sức mạnh phi thường và có thể làm rung chuyển mặt đất khi bước đi. Bộ hàm vạm vỡ của nó có thể nghiền nát bất cứ thứ gì cản đường. Nó mang theo một vẻ ngoài mạnh mẽ, đôi khi trông như thể đã trải qua nhiều trận chiến.',
    rarity: 'epic',
  ),

  'scream-tail': PokemonMeta(
    hint: 'Trông giống sinh vật bí ẩn, thích làm nũng.',
    lore: 'Loài Pokémon này vô cùng hiếm gặp, chỉ có một lần duy nhất được ghi nhận. Hình ảnh của nó xuất hiện trong một cuốn nhật ký thám hiểm cũ kỹ, gợi lên sự tò mò về nguồn gốc và cuộc sống bí ẩn của nó. Người ta đồn rằng nó thích được vuốt ve và có giọng hát rất dễ thương.',
    rarity: 'rare',
  ),

  'brute-bonnet': PokemonMeta(
    hint: 'Cánh của nó giống như cánh bướm, nhưng trông khá dữ tợn.',
    lore: 'Người ta đồn rằng đôi khi chiếc mũ trên đầu nó đội lên lại là đầu của một loài sinh vật khác. Sống trong những khu rừng rậm rạp, nó thường ẩn mình và đi săn vào ban đêm. Nó rất thích những trái cây ngọt và có thể sử dụng những chiếc gai sắc nhọn trên người để tự vệ khi cảm thấy bị đe dọa. Câu chuyện về nó được ghi lại trong những cuốn sách cổ, nhưng rất ít người từng nhìn thấy nó thực sự.',
    rarity: 'rare',
  ),

  'flutter-mane': PokemonMeta(
    hint: 'Bộ lông xù như mây, dáng vẻ mong manh.',
    lore: 'Sinh vật này được mô tả trong một cuốn sách cổ với vẻ ngoài giống như những cánh hoa mỏng manh, bay lượn trên không trung như một ảo ảnh. Người ta tin rằng nó mang theo sự bí ẩn từ quá khứ xa xưa, và hiếm khi xuất hiện trước mắt mọi người. Sự tồn tại của nó thường gắn liền với những truyền thuyết kỳ lạ về một vùng đất đã lãng quên.',
    rarity: 'epic',
  ),

  'slither-wing': PokemonMeta(
    hint: 'Con côn trùng khổng lồ có cánh như bướm.',
    lore: 'Trong các bản ghi cổ xuất hiện một sinh vật kỳ lạ, trông giống như một loài côn trùng khổng lồ với đôi cánh rộng lớn. Nó bí ẩn và được cho là có sức mạnh phi thường, lượn lờ trong những khu rừng già. Nhiều người tin rằng nó là hậu duệ của những sinh vật huyền thoại được mô tả trong các câu chuyện cổ xưa, mang trong mình vẻ đẹp vừa mạnh mẽ vừa mong manh.',
    rarity: 'epic',
  ),

  'sandy-shocks': PokemonMeta(
    hint: 'Sinh vật kim loại cổ đại với đôi chân giống nam châm.',
    lore: 'Người ta tin rằng sinh vật bí ẩn này đến từ quá khứ xa xôi. Mặc dù không có ghi chép nào về việc nó từng bị bắt, nhưng một cuốn nhật ký thám hiểm cũ đã mô tả một sinh vật có những đặc điểm tương tự, gợi ý về một sự tồn tại cổ xưa và ẩn giấu.  Nó có thể sử dụng sức mạnh điện để tự vệ.',
    rarity: 'epic',
  ),

  'iron-treads': PokemonMeta(
    hint: 'Trông giống một cổ máy bí ẩn, có thể bay lơ lửng.',
    lore: 'Có một câu chuyện lan truyền trên mạng xã hội rằng sinh vật này thực chất là một vũ khí khoa học viễn tưởng được gửi đến Trái đất bởi những người ngoài hành tinh. Nó dường như không có cảm xúc và thường bị bắt gặp đang di chuyển với tốc độ cao trong các khu vực hẻo lánh.',
    rarity: 'epic',
  ),

  'iron-bundle': PokemonMeta(
    hint: 'Tàu lượn băng giá cổ đại giống robot',
    lore: 'Có hình dáng giống một robot bí ẩn được nhắc đến trong tạp chí về điều kỳ lạ, sinh vật này được cho là do một nền văn minh cổ đại tạo ra. Nó di chuyển nhanh nhẹn trên băng và có khả năng làm đóng băng mọi thứ xung quanh chỉ bằng cái chạm.',
    rarity: 'rare',
  ),

  'iron-hands': PokemonMeta(
    hint: 'Cánh tay sắt bao phủ bởi tạp chí kỳ lạ.',
    lore: 'Sinh vật này trông như một người máy được bao phủ toàn thân bởi những trang tạp chí về những điều bí ẩn. Người ta đồn rằng nó là hình dạng đã được sửa đổi của một vận động viên thể thao tài năng, giờ đây với sức mạnh vượt trội và vẻ ngoài độc đáo.',
    rarity: 'rare',
  ),

  'iron-jugulis': PokemonMeta(
    hint: 'Rồng sắt xảo quyệt với đôi cánh máy móc.',
    lore: 'Sinh vật tương lai này có vẻ ngoài giống một con quái vật bí ẩn xuất hiện trên các trang báo huyền bí. Có tin đồn rằng nó là kết quả của một tình yêu kỳ lạ giữa một Hydreigon mạnh mẽ và một người máy tiên tiến. Nó bay lượn trên bầu trời, mang theo sức mạnh đáng kinh ngạc.',
    rarity: 'epic',
  ),

  'iron-moth': PokemonMeta(
    hint: 'Sinh vật bằng kim loại, bay lượn bí ẩn.',
    lore: 'Nó trông giống những vật thể lạ được mô tả trong các tạp chí huyền bí. Người ta đồn rằng nó đến từ một nơi xa xôi, quan sát thế giới của chúng ta. Nó im lặng và uyển chuyển, đôi khi xuất hiện như một vụ lướt qua trên bầu trời đêm. Nhiều người tò mò không biết nó đến từ đâu và mục đích của nó là gì.',
    rarity: 'epic',
  ),

  'iron-thorns': PokemonMeta(
    hint: 'Chiếc gai sắt nhọn hoắt, bộ giáp mạnh mẽ.',
    lore: 'Một Pokémon đến từ tương lai xa xôi, có những nét giống với Tyranitar từng được giới thiệu trên một tạp chí đáng ngờ. Nó sở hữu một lớp vỏ ngoài cứng cáp, làm từ hợp kim đặc biệt, giúp nó chống chịu mọi đòn tấn công. Sức mạnh và vẻ ngoài đáng gờm của nó khiến nhiều người phải dè chừng.',
    rarity: 'epic',
  ),

  'wo-chien': PokemonMeta(
    hint: 'Nó trông giống như một đống lá khô biết đi.',
    lore: 'Nó là hóa thân của một người bị phạt vì ghi lại những việc làm xấu xa của vua lên những tấm gỗ. Sự oán giận của người đó đã khoác lên mình bộ dạng của những chiếc lá chết, trở thành một Pokémon bí ẩn, lang thang trong rừng sâu.',
    rarity: 'legendary',
  ),

  'chien-pao': PokemonMeta(
    hint: 'Một sinh vật tuyết trắng với đôi mắt sáng, vồ tuyết như đồ chơi.',
    lore: 'Nó có sức mạnh điều khiển 100 tấn tuyết rơi. Nó thích chơi đùa ngây thơ, nhảy ra nhảy vào những trận tuyết lở mà nó tạo ra, như thể đó là một trò chơi thú vị. Sự xuất hiện của nó mang theo cái lạnh mùa đông buốt giá.',
    rarity: 'legendary',
  ),

  'ting-lu': PokemonMeta(
    hint: 'Vẻ ngoài cục mịch, có phần đáng sợ và chậm chạp.',
    lore: 'Sinh vật này được đồn đại là hiện thân của nỗi sợ hãi đã bị giam cầm trong một chiếc bình cổ xưa. Khi nỗi sợ ngày càng lớn, nó đã biến hình, lấy đi lớp vỏ bằng đá và đất. Nó di chuyển chậm rãi, nhưng sức mạnh của nó đến từ sự kiên định và khả năng hấp thụ năng lượng tiêu cực.',
    rarity: 'legendary',
  ),

  'chi-yu': PokemonMeta(
    hint: 'Lửa chảy, rực cháy, bơi trong dung nham.',
    lore: 'Sinh vật này cai quản ngọn lửa có nhiệt độ khủng khiếp, đủ để làm tan chảy đá và cát.  Nó tự do di chuyển trong biển dung nham do chính mình tạo ra, một cảnh tượng vừa đáng sợ vừa ngoạn mục.  Nó rất thích nơi nóng bỏng và không hề sợ hãi sức nóng.  Nó có vẻ ngoài giống cá và có bộ phận cơ thể màu đỏ rực.',
    rarity: 'legendary',
  ),

  'roaring-moon': PokemonMeta(
    hint: 'Lớn, có cánh, trông như khủng long',
    lore: 'Một sinh vật cổ xưa, đôi cánh mạnh mẽ vút bay trên bầu trời. Nó có vẻ rất giận dữ và có thể là giống loài đã được viết trong những ghi chép bí ẩn từ lâu.',
    rarity: 'epic',
  ),

  'iron-valiant': PokemonMeta(
    hint: 'Ngoại hình kỳ lạ, giống như trong truyện khoa học viễn tưởng.',
    lore: 'Sinh vật này được tạo ra bằng cách kết hợp công nghệ tiên tiến với những bí ẩn siêu nhiên. Nó sở hữu sức mạnh phi thường và một vẻ ngoài khiến người ta liên tưởng đến những thí nghiệm đột phá được hé lộ trên các tạp chí kỳ lạ.  Những ai chạm trán với nó sẽ cảm nhận được sự kết hợp độc đáo giữa sức mạnh và vẻ bí ẩn.',
    rarity: 'epic',
  ),

  'koraidon': PokemonMeta(
    hint: 'Vua Cánh Xé Ngang Địa Hình Bằng Nắm Đấm.',
    lore: 'Vị vua được nhắc đến trong nhật ký đoàn thám hiểm cổ xưa, được cho là có sức mạnh phi thường. Nó có thể dùng nắm đấm trần để tách rời cả mặt đất. Vẻ ngoài oai vệ, gợi nhớ đến những vị vua đã từng thống trị vùng đất này từ lâu đời.',
    rarity: 'legendary',
  ),

  'miraidon': PokemonMeta(
    hint: 'Sinh vật to lớn như thằn lằn, sở hữu sức mạnh phi thường.',
    lore: 'Du hành từ quá khứ xa xưa, sinh vật này mang hình dáng giống loài thằn lằn cổ đại nhưng ẩn chứa sức mạnh hủy diệt. Nó di chuyển với tốc độ kinh hoàng, đôi khi còn biến đổi cơ thể để thích nghi với môi trường. Nhiều bí ẩn xoay quanh nguồn gốc và khả năng của nó, khiến nó trở thành một đối thủ đáng gờm và đầy bí ẩn.',
    rarity: 'legendary',
  ),

  'walking-wake': PokemonMeta(
    hint: 'Lưng nó có những đường sọc giống như những con sóng, trông rất đáng sợ.',
    lore: 'Sinh vật hung tợn này ẩn mình trong bóng tối. Người ta bảo nó được đặt tên theo một quái vật dưới nước từng được ghi lại trong một cuốn nhật ký thám hiểm cũ. Rất ít người từng nhìn thấy nó, và những người may mắn sống sót kể về một cảnh tượng đáng kinh ngạc.',
    rarity: 'legendary',
  ),

  'iron-leaves': PokemonMeta(
    hint: 'Giống như một hiệp sĩ tương lai, với đôi chân mạnh mẽ và thanh kiếm sắc bén.',
    lore: 'Loài Pokémon này được cho là đến từ tương lai xa xôi, mang trong mình sức mạnh bí ẩn. Vẻ ngoài của nó gợi nhớ đến một sinh vật cổ xưa, nhưng lại toát lên khí chất hiện đại và mạnh mẽ. Người ta đồn rằng nó sở hữu đôi chân nhanh nhẹn có thể lướt đi trên mặt đất và một lưỡi kiếm sắc bén có thể chém xuyên qua mọi thứ. Sự tồn tại của nó đã từng được đưa tin trên một tạp chí kỳ lạ, khiến nhiều người tò mò về nguồn gốc và khả năng phi thường của nó.',
    rarity: 'legendary',
  ),

  'poltchageist': PokemonMeta(
    hint: 'Một chiếc cốc trà nhỏ bé đang phun những đám mây màu xanh lá cây.',
    lore: 'Người ta đồn rằng những hối tiếc về việc chưa hoàn hảo trong một buổi trà đạo đã ám vào một ít bột trà xanh và biến thành một sinh vật dễ thương. Nó thích được chăm sóc và thể hiện sự tôn trọng của mình bằng cách phun ra những đám hơi trà ấm áp.',
    rarity: 'rare',
  ),

  'sinistcha': PokemonMeta(
    hint: 'Cốc trà giả vờ mời gọi, ẩn chứa điều tồi tệ.',
    lore: 'Một chiếc bình trà nhỏ bé, trông giống như thức uống ấm áp, luôn cố gắng đánh lừa mọi người. Nó muốn hút hết năng lượng sống của bạn, nhưng thật may mắn, trò lừa gạt này hiếm khi thành công. Nó chỉ đơn giản là một kẻ bắt chước khát khao, luôn tìm kiếm những nạn nhân mà nó tin rằng thật ngây thơ.',
    rarity: 'rare',
  ),

  'okidogi': PokemonMeta(
    hint: 'Thân hình đô con, đeo xích độc trên cổ.',
    lore: 'Loài Pokemon này sở hữu cơ bắp cực kỳ phát triển nhờ được cường hóa bởi chiếc vòng độc quanh cổ. Điều này đã biến đổi nó thành một sinh vật có sức mạnh thể chất đáng kinh ngạc, sẵn sàng đối mặt với mọi thử thách.',
    rarity: 'legendary',
  ),

  'munkidori': PokemonMeta(
    hint: 'Chú khỉ có chiếc vòng cổ độc hại, trí tuệ siêu phàm.',
    lore: 'Vòng cổ đặc biệt của sinh vật này được tạo nên từ những chất độc có khả năng tăng cường sức mạnh. Khi tiếp xúc, nó đã kích thích bộ não của sinh vật, đánh thức và phát triển những năng lực tâm linh vô cùng mạnh mẽ, giúp chú trở nên thông minh và có khả năng đặc biệt.',
    rarity: 'legendary',
  ),

  'fezandipiti': PokemonMeta(
    hint: 'Vẻ ngoài lộng lẫy, giọng hát ngọt ngào từ chất độc.',
    lore: 'Sinh vật này sở hữu vẻ đẹp mê hồn và giọng ca trong trẻo nhờ những chất kích thích độc hại phát ra từ sợi dây quấn quanh cơ thể. Sự quyến rũ chết người của nó khiến bao kẻ say đắm, dù biết rõ sự nguy hiểm tiềm ẩn. Nó thường dùng lời ca để thu hút con mồi hoặc đơn giản là để thưởng thức vẻ đẹp của chính mình.',
    rarity: 'legendary',
  ),

  'ogerpon': PokemonMeta(
    hint: 'Một chú pet dễ thương thường đội mặt nạ có thể thay đổi hình dáng.',
    lore: 'Chú pet này rất nhanh nhẹn, di chuyển thoăn thoắt và tung những cú đá đầy bất ngờ. Khi thay đổi mặt nạ, sức mạnh và đặc điểm của nó cũng thay đổi theo, khiến kẻ địch khó lòng đoán trước được. Nó sống trong khu rừng yên bình, chăm sóc cho cây cỏ và đôi khi trêu đùa những kẻ xâm phạm với sự lém lỉnh của mình.',
    rarity: 'legendary',
  ),

  'gouging-fire': PokemonMeta(
    hint: 'Khủng long lửa khổng lồ gầm thét, phun lửa như trụ.',
    lore: 'Sinh vật cổ đại này hiếm khi được nhìn thấy. Một đoạn video ngắn quay lại cảnh nó hung hãn phá phách, phun ra những cột lửa lớn. Có lẽ nó sống ở những nơi rất nóng hoặc dưới lòng đất sâu.',
    rarity: 'epic',
  ),

  'raging-bolt': PokemonMeta(
    hint: 'Vệt sáng rực rỡ chạy trên bộ lông, phóng ra những luồng điện.',
    lore: 'Sinh vật này có một sức mạnh đáng kinh ngạc, có thể tạo ra những tia sét lung linh từ bộ lông của mình. Người ta tin rằng mọi thứ xung quanh nó có thể bốc cháy bởi luồng điện mạnh mẽ đó. Tuy nhiên, có rất ít thông tin được tiết lộ về nguồn gốc và khả năng thực sự của nó, khiến nó trở thành một bí ẩn đầy mê hoặc.',
    rarity: 'epic',
  ),

  'iron-boulder': PokemonMeta(
    hint: 'Trông giống một con thú kiên cố với bờm đá.',
    lore: 'Một sinh vật lạ được cho là đã thay đổi bởi một tổ chức xấu xa. Nó có vẻ ngoài mạnh mẽ, gợi nhớ đến một loài Pokémon trong truyền thuyết, nhưng với những sửa đổi khiến nó trở nên độc đáo và có phần kỳ lạ. Sức mạnh và hình dáng của nó khiến người ta phải dè chừng.',
    rarity: 'epic',
  ),

  'iron-crown': PokemonMeta(
    hint: 'Nó trông giống vũ khí tiên tiến có hình dáng lạ.',
    lore: 'Một loài Pokémon bí ẩn, được cho là vũ khí tối tân xuất hiện trên tạp chí kỳ bí. Hình dáng của nó gợi nhớ đến một sinh vật huyền thoại, nhưng lại mang vẻ ngoài của một cỗ máy. Khả năng của nó vẫn còn là ẩn số, khiến nhiều người tò mò và kinh ngạc.',
    rarity: 'epic',
  ),

  'terapagos': PokemonMeta(
    hint: 'Rùa có mai pha lê lấp lánh',
    lore: 'Chú rùa này có khả năng biến năng lượng thành những viên pha lê cứng để tự bảo vệ.  Nó là nguồn gốc của hiện tượng Terastal kỳ diệu, nơi các sinh vật có thể hóa đá lấp lánh và thay đổi sức mạnh.  Chú rùa này mang trong mình sức mạnh cổ xưa và là điểm khởi đầu cho mọi sự biến hình năng lượng.',
    rarity: 'legendary',
  ),

  'pecharunt': PokemonMeta(
    hint: 'Sinh vật nhỏ bé có đôi mắt đỏ, luôn mang theo những viên kẹo độc.',
    lore: 'Vương quốc ẩn mình của một sinh vật bí ẩn đang kiểm soát những người khác. Nó dụ dỗ mọi người bằng những chiếc bánh mochi ngon ngọt, chứa đựng mầm mống sự ham muốn và khả năng ẩn giấu. Khi nếm thử, người ăn sẽ dần mất đi ý chí của mình, trở thành nô lệ trung thành, thực hiện mọi mệnh lệnh mà không hề hay biết. Một lời nguyền ngọt ngào khiến mọi người bị trói buộc vào ý chí của nó.',
    rarity: 'mythical',
  ),

};

/// ===============================
/// SERVICE
/// ===============================

class PokemonMetaService {

  static PokemonMeta? getMeta(
    String name,
  ) {
    return pokemonMetaData[name];
  }
}


/// ===============================
/// EXTENSION
/// ===============================

extension PokemonStageMeta on PokemonStage {

  PokemonMeta? get meta =>
      PokemonMetaService.getMeta(name);

  String get hint =>
      meta?.hint ?? '';

  String get lore =>
      meta?.lore ?? '';

  String get rarity =>
      meta?.rarity ?? 'common';
}