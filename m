Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F6A2A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Dec 2022 00:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669855558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfCT0rkce5sdvNSn+yVaq4U2qO0x5zIv4qHcFumYoS8=;
	b=ixIFibVRS+PRKdMKhEnWODPN04E2k9pc7/N6E6Wn5FFaKPTUANX6zSyNAPClB9v+KMmWKK
	Vv26Tv12e7rIPEU7brS7OxWY5YuO/HEa6PUNNwdi+EFXX7oelGJAHm0W9ESlJoOB4ey8lQ
	0yuex09hoGxuu4UR6tBtDHhXuPV+V0M=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-6tAYPYe0NVWvopEq6cERRw-1; Wed, 30 Nov 2022 19:45:56 -0500
X-MC-Unique: 6tAYPYe0NVWvopEq6cERRw-1
Received: by mail-pj1-f69.google.com with SMTP id n4-20020a17090a2fc400b002132adb9485so434388pjm.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Nov 2022 16:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfCT0rkce5sdvNSn+yVaq4U2qO0x5zIv4qHcFumYoS8=;
        b=qtfBFxVSpZY8Pry22XeqUuuCOWsFA2mCHgMPJIKmx5S3JaZWlDdFYmFDwsETYJkHmJ
         jju3vBzf77itTKRi7c4GgistMQ/NIdfdhAV+Em6ts4tIe9Bmb4yjuuCVk7k/p+YkgV+H
         Chhf9UuyL9jbyWas9ZWJrZpT4EyU+Xo7+LRWhsUh2UGXt0nyyUaQ9GkWVgThdX5nYng6
         nmtHIFTHZD3ziOSPGu+gotwNyKNsIwyyxuNzmj+TL1NBJPOIMu2Bn9cfHl9vICyz/1yG
         /XIauEbNG1zg5MMMaaXlrz04MVoYdoeCeVO4ldf3JP4ovEkLrl5P1ETceguO4QBAQykT
         B0sw==
X-Gm-Message-State: ANoB5pn9Z67VQ/IvkMzDRJNCg7g4ygJLoSolKmkkxXt9o1aYhSOGt82S
	EXHGOEuVGulv7HNa1G7NjdwyQmcZDybU2urmszM7PyeqrHviCHpuOSsyAEm6WfrbRNlJ7SZlftr
	zZhzouuvhvdE6Mks0h7BkyghkGw==
X-Received: by 2002:a17:90a:2806:b0:219:5079:7aa3 with SMTP id e6-20020a17090a280600b0021950797aa3mr10912168pjd.183.1669855555727;
        Wed, 30 Nov 2022 16:45:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf45AQabUslejQOausJQPN/b+XSXAA9JO0vdE63yuDx2wJ6UjGb4XkuYsw159TpdVrqQsU97wA==
X-Received: by 2002:a17:90a:2806:b0:219:5079:7aa3 with SMTP id e6-20020a17090a280600b0021950797aa3mr10912138pjd.183.1669855555402;
        Wed, 30 Nov 2022 16:45:55 -0800 (PST)
Received: from [10.72.12.171] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id f10-20020aa79d8a000000b0056e5bce5b7asm1938563pfq.201.2022.11.30.16.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 16:45:54 -0800 (PST)
Subject: Re: [ceph-client:testing 1/4] include/linux/fs.h:1342:20: error:
 static declaration of 'vfs_inode_has_locks' follows non-static declaration
To: Jeff Layton <jlayton@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ceph-devel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
References: <202212010417.wCjpGlKY-lkp@intel.com>
 <5843a4f790d1f87c3e33ef8554f8493404856257.camel@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <62207ac1-937a-d3d6-6471-2c9a6e1eee53@redhat.com>
Date: Thu, 1 Dec 2022 08:45:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5843a4f790d1f87c3e33ef8554f8493404856257.camel@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 01/12/2022 08:10, Jeff Layton wrote:
> On Thu, 2022-12-01 at 04:08 +0800, kernel test robot wrote:
>> tree:   https://github.com/ceph/ceph-client.git testing
>> head:   6a6f71f4a4a945600943c2ce926f7b4174f75c0d
>> commit: 8c552db6d9d144857f755a156b10de0b848a9de8 [1/4] [DO NOT MERGE] filelock: new helper: vfs_inode_has_locks
>> config: hexagon-randconfig-r041-20221128
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/ceph/ceph-client/commit/8c552db6d9d144857f755a156b10de0b848a9de8
>>          git remote add ceph-client https://github.com/ceph/ceph-client.git
>>          git fetch --no-tags ceph-client testing
>>          git checkout 8c552db6d9d144857f755a156b10de0b848a9de8
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare
>>
>> If you fix the issue, kindly add following tag where applicable
>>> Reported-by: kernel test robot <lkp@intel.com>
>> All errors (new ones prefixed by >>):
>>
>>     In file included from arch/hexagon/kernel/asm-offsets.c:12:
>>     In file included from include/linux/compat.h:17:
>>>> include/linux/fs.h:1342:20: error: static declaration of 'vfs_inode_has_locks' follows non-static declaration
>>     static inline bool vfs_inode_has_locks(struct inode *inode)
>>                        ^
>>     include/linux/fs.h:1173:6: note: previous declaration is here
>>     bool vfs_inode_has_locks(struct inode *inode);
>>          ^
> I'm really confused here.
>
> The non-static declaration is inside an #ifdef CONFIG_FILE_LOCKING
> block, and the static inline definition is in the #else block just
> after. How is it possible for them to conflict? Is the preprocessor
> borked or something?
>
> FWIW, I was able to build kernels on x86_64 with CONFIG_FILE_LOCKING
> both enabled and disabled. I'm not seeing the same problem there.

I think it's my fault.

I just pick the new section to patch to the current commit. I do it 
again by using the whole patch.

- Xiubo

>>     In file included from arch/hexagon/kernel/asm-offsets.c:15:
>>     In file included from include/linux/interrupt.h:11:
>>     In file included from include/linux/hardirq.h:11:
>>     In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>>     In file included from include/asm-generic/hardirq.h:17:
>>     In file included from include/linux/irq.h:20:
>>     In file included from include/linux/io.h:13:
>>     In file included from arch/hexagon/include/asm/io.h:334:
>>     include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             val = __raw_readb(PCI_IOBASE + addr);
>>                               ~~~~~~~~~~ ^
>>     include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>>                                                             ~~~~~~~~~~ ^
>>     include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>>     #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>>                                                       ^
>>     In file included from arch/hexagon/kernel/asm-offsets.c:15:
>>     In file included from include/linux/interrupt.h:11:
>>     In file included from include/linux/hardirq.h:11:
>>     In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>>     In file included from include/asm-generic/hardirq.h:17:
>>     In file included from include/linux/irq.h:20:
>>     In file included from include/linux/io.h:13:
>>     In file included from arch/hexagon/include/asm/io.h:334:
>>     include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>>                                                             ~~~~~~~~~~ ^
>>     include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>>     #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>>                                                       ^
>>     In file included from arch/hexagon/kernel/asm-offsets.c:15:
>>     In file included from include/linux/interrupt.h:11:
>>     In file included from include/linux/hardirq.h:11:
>>     In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>>     In file included from include/asm-generic/hardirq.h:17:
>>     In file included from include/linux/irq.h:20:
>>     In file included from include/linux/io.h:13:
>>     In file included from arch/hexagon/include/asm/io.h:334:
>>     include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             __raw_writeb(value, PCI_IOBASE + addr);
>>                                 ~~~~~~~~~~ ^
>>     include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>>                                                           ~~~~~~~~~~ ^
>>     include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>>                                                           ~~~~~~~~~~ ^
>>     6 warnings and 1 error generated.
>>     make[2]: *** [scripts/Makefile.build:118: arch/hexagon/kernel/asm-offsets.s] Error 1
>>     make[2]: Target 'prepare' not remade because of errors.
>>     make[1]: *** [Makefile:1270: prepare0] Error 2
>>     make[1]: Target 'prepare' not remade because of errors.
>>     make: *** [Makefile:231: __sub-make] Error 2
>>     make: Target 'prepare' not remade because of errors.
>>
>>
>> vim +/vfs_inode_has_locks +1342 include/linux/fs.h
>>
>>    1341	
>>> 1342	static inline bool vfs_inode_has_locks(struct inode *inode)
>>    1343	{
>>    1344		return false;
>>    1345	}
>>    1346	
>>

