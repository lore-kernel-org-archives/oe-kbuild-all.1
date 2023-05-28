Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418F765C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 06:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685255245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qd1HsDPoIQCA1W8M9wRkc4OBlzVkt6/Jqm85Xt985zA=;
	b=VoAnEOLvwQPpXS7B1WHtXlhuhwwb8FtoIkCfqONequm3c0nt43u38jndYC3IzGvBzZddwI
	PK6vwicUSxnFkmcECyV6RKj+R0SbDdzShYT/AKvVoDCzDGjiKOQIOCpXJ78N909NUlBYHV
	8P9YwER4v8rKONczqqfAw0gJc4cqyaU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-2d2L1HyZOYyKttWRBu83Iw-1; Sun, 28 May 2023 02:27:23 -0400
X-MC-Unique: 2d2L1HyZOYyKttWRBu83Iw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30a938fcfb5so1263707f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 23:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685255242; x=1687847242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qd1HsDPoIQCA1W8M9wRkc4OBlzVkt6/Jqm85Xt985zA=;
        b=hX7OIQg5iWH9MUzEqre+Mku7v7dKqzL3oeYId8TJ/3Xbm8g3o4oest7kByepjB5mi0
         3fmTe11aV8dDMOTyZP16couDmiZDl9xPvrOZfmocYVmAyxeRwF4ezexRG5lmo0jteGYj
         nS6jjmaBi4uv8yAZBKQqsKa3qNJGDYnu0ii9JDxJCAMp1+qAtbubXoGsm2c9UF3M/Kk4
         0UPfsL8C9F3OAGNIn0RRdATSh25+sXwIgq9Xb/6361/jH4X/LM+r0MkZ4lmoUrB6pBLu
         gSVe2cIFxXdNFk22GlnJP107yic4ApRni0tSmkIfLls5OHkHhYZZfb1SexmHa5SXMfwX
         J8wg==
X-Gm-Message-State: AC+VfDyCFn5yXNR8efFP7JWp8vjupG0KIn3o9GaU1l8D38Ntv2QoIpZi
	ywHEFtNv6yBX50k5hTDpFacvJdNdJoI0g5haFrO8qrk3jzxTs6dspRF2Um7omx4X+S5dBlMPLV4
	4cH5Mn+OaJekYE50RZRq8wkakXQ==
X-Received: by 2002:a5d:4746:0:b0:307:a36b:e7b1 with SMTP id o6-20020a5d4746000000b00307a36be7b1mr6251108wrs.5.1685255242762;
        Sat, 27 May 2023 23:27:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45TZmWQVMRhP5RvxBOirJj2cEFa5HQb7lqFSHk19mNXmZUM8pT5LmgfgqJSeZVjSeHHK6LuA==
X-Received: by 2002:a5d:4746:0:b0:307:a36b:e7b1 with SMTP id o6-20020a5d4746000000b00307a36be7b1mr6251097wrs.5.1685255242491;
        Sat, 27 May 2023 23:27:22 -0700 (PDT)
Received: from redhat.com ([2.52.146.27])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003f423dfc686sm10083677wmc.45.2023.05.27.23.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 23:27:21 -0700 (PDT)
Date: Sun, 28 May 2023 02:27:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Liang Chen <liangchen.linux@gmail.com>, jasowang@redhat.com,
	oe-kbuild-all@lists.linux.dev,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, xuanzhuo@linux.alibaba.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	pabeni@redhat.com, alexander.duyck@gmail.com
Subject: Re: [PATCH net-next 2/5] virtio_net: Add page_pool support to
 improve performance
Message-ID: <20230528022658-mutt-send-email-mst@kernel.org>
References: <20230526054621.18371-2-liangchen.linux@gmail.com>
 <202305262334.GiFQ3wpG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202305262334.GiFQ3wpG-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 27, 2023 at 12:11:25AM +0800, kernel test robot wrote:
> Hi Liang,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Liang-Chen/virtio_net-Add-page_pool-support-to-improve-performance/20230526-135805
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20230526054621.18371-2-liangchen.linux%40gmail.com
> patch subject: [PATCH net-next 2/5] virtio_net: Add page_pool support to improve performance
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230526/202305262334.GiFQ3wpG-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/bfba563f43bba37181d8502cb2e566c32f96ec9e
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Liang-Chen/virtio_net-Add-page_pool-support-to-improve-performance/20230526-135805
>         git checkout bfba563f43bba37181d8502cb2e566c32f96ec9e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305262334.GiFQ3wpG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: vmlinux.o: in function `virtnet_find_vqs':
> >> virtio_net.c:(.text+0x901fb5): undefined reference to `page_pool_create'
>    ld: vmlinux.o: in function `add_recvbuf_mergeable.isra.0':
> >> virtio_net.c:(.text+0x905618): undefined reference to `page_pool_alloc_pages'
>    ld: vmlinux.o: in function `xdp_linearize_page':
>    virtio_net.c:(.text+0x906b6b): undefined reference to `page_pool_alloc_pages'
>    ld: vmlinux.o: in function `mergeable_xdp_get_buf.isra.0':
>    virtio_net.c:(.text+0x90728f): undefined reference to `page_pool_alloc_pages'


you need to tweak Kconfig to select PAGE_POOL I think.

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

