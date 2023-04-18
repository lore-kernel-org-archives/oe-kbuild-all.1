Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0427290D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 13:52:19 +0000 (UTC)
Received: from [IPV6:2a01:e0a:120:3210:9493:29e1:3046:42cb] (unknown [IPv6:2a01:e0a:120:3210:9493:29e1:3046:42cb])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F3A88660318B;
	Tue, 18 Apr 2023 14:52:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681825938;
	bh=DXfYeJ0/OXmca31i5Ki8W/t0J803CNe5/C9mokTsz8M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b1mQlPZN6DEodZ5h4jdJ79BizYZMjbF2b/hH9g3om97Y2D4Q4u7GXj8p74W0dCj6R
	 4PWC+iAPWCkE4BSslj1TjRwrXRNHwhu2SrtDmaYQYhmFXcrWPWiiW9M3faB1ok8lrW
	 DtVEH3kjpLYcU6zvPNNs31EynuSgtoqgoLJF7Qm66m+Al9rSq+rC3Vk/vmBTn7Ju9J
	 2L+dnQILVHlgq/h5ID4btFf9+gSGQGajMLMH0kKJ0tUWxrqU8aJlVmcg2dmHoOFdIM
	 hBlQlNG6FLjZxLwFVhbVs/esIN+aKnuu2CbGpVuBFmFSZmd78l++oDAjS8yZh15+hE
	 zQv/tiFWZa8rw==
Message-ID: <b20df55a-8b45-510b-6aba-33c7fe7809b0@collabora.com>
Date: Tue, 18 Apr 2023 15:52:15 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [hverkuil-media-tree:for-v6.4l 211/215]
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1024:1:
 warning: the frame size of 1112 bytes is larger than 1024 bytes
To: Hans Verkuil <hverkuil@xs4all.nl>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <202304181533.M3yTL6Ju-lkp@intel.com>
 <5daf4d39-f999-353a-cd3e-1c9f9e75cdec@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <5daf4d39-f999-353a-cd3e-1c9f9e75cdec@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 18/04/2023 à 15:45, Hans Verkuil a écrit :
> On 18/04/2023 09:32, kernel test robot wrote:
>> tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.4l
>> head:   007517353ed5a98dc414642c541252edea3133e2
>> commit: b64337cb7965e94c72bf01017c37fd47f85c5d33 [211/215] media: verisilicon: Add Rockchip AV1 decoder
>> config: arm-randconfig-r036-20230418 (https://download.01.org/0day-ci/archive/20230418/202304181533.M3yTL6Ju-lkp@intel.com/config)
>> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
>>          git fetch --no-tags hverkuil-media-tree for-v6.4l
>>          git checkout b64337cb7965e94c72bf01017c37fd47f85c5d33
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/platform/verisilicon/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: https://lore.kernel.org/oe-kbuild-all/202304181533.M3yTL6Ju-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:320:6: warning: no previous prototype for 'rockchip_vpu981_av1_dec_exit' [-Wmissing-prototypes]
>>       320 | void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
>>           |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:356:5: warning: no previous prototype for 'rockchip_vpu981_av1_dec_init' [-Wmissing-prototypes]
>>       356 | int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
>>           |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1143:6: warning: no previous prototype for 'rockchip_vpu981_av1_dec_done' [-Wmissing-prototypes]
>>      1143 | void rockchip_vpu981_av1_dec_done(struct hantro_ctx *ctx)
>>           |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1890:5: warning: no previous prototype for 'rockchip_vpu981_av1_dec_run' [-Wmissing-prototypes]
>>      1890 | int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
>>           |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_segmentation':
>>>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1024:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>      1024 | }
>>           | ^
> Benjamin, can you take a look at this? The last warning should be addressed
> in your latest series, but the other prototype warnings are likely something
> else.

The prototype warning are on functions not used in this patch but later in the series on another file.
The prototypes are in "media: verisilicon: Enable AV1 decoder on rk3588" patch.

Regards,
Benjamin

>
> We won't make it for 6.4 (we were close, but no cigar...), but I aim to get
> AV1 in early in the next cycle.
>
> Regards,
>
> 	Hans
>
