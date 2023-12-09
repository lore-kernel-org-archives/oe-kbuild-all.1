Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9AD7461
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QDQhgp9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702117665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sgSSZVoHbtMUxorEO7aIxD48351b/dT2/kcqCclHl8=;
	b=QDQhgp9iyOQwIdcXtPpt4EF42zeE7xMAWRyPOYvAWb0ubBMmIjgdjjY3mWeLwybWvLGP3R
	Gxnh5+0s0GEw/joVmnIHtplNaNo4k8Nx1TbKJPMGcNxtsxL2bSCbdk5y6SYl4WIoseMkUZ
	M4j8/l/mZ7hwLCX2ZB/jl100uqQhRJA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-zPsDZ64SN4STonRKT-E_xw-1; Sat, 09 Dec 2023 05:27:43 -0500
X-MC-Unique: zPsDZ64SN4STonRKT-E_xw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33335c6d495so2379254f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 09 Dec 2023 02:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702117662; x=1702722462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sgSSZVoHbtMUxorEO7aIxD48351b/dT2/kcqCclHl8=;
        b=im3QL5z5gg5rPQYcsJr2mNYgUPcFwDuqvXinF3bmfPyC7UY8B5UqD0xlvyFMQA5lFw
         1DeWyzMXlmEsNMSBjEH1wyZvPhW71b3pjwLtJMPaUhNAljJEdlSsyLa/fzuRBVxpBDjt
         45ijcYEpVUwzcSUDB2oNZz0EPYfLvBShLPTPwLGJoXEYtW6BDGkN1Ok8l9UdrGvN5FeS
         37qKGRxszxXEdpyrVJV8juIz+slXFps4rs3I9a5oRfJ0ovGNxB1VH+ijVrppjxyLefkO
         yFuZvzleGbtGVW0b2b69nq+QagIbI6A8DgiITp5Ca72bC6bno8i0q1rBzAKbMbKEolDB
         6AhA==
X-Gm-Message-State: AOJu0YxaSe6ZGh70NcfeA1hcXVsLDXfOPh55bBfpCDERqmTUdkbYCwb8
	LlcQsMS7lQcONemPNygZ++dY/fsANRZOA6tvcYAoGwWP2153EbnUFW5Rb5GOBmfHS/B01vQnhGM
	EsvKJ7PCmXjlG0RwHWSRR425EIA==
X-Received: by 2002:a5d:6611:0:b0:333:4896:100d with SMTP id n17-20020a5d6611000000b003334896100dmr664687wru.8.1702117662543;
        Sat, 09 Dec 2023 02:27:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDiHXF4XIUOFxXmVXFha/8eTa6nHvn907AvowQMaqP0gK0hvBFBHsptrwJMLI54FcKEUH+MQ==
X-Received: by 2002:a5d:6611:0:b0:333:4896:100d with SMTP id n17-20020a5d6611000000b003334896100dmr664676wru.8.1702117662230;
        Sat, 09 Dec 2023 02:27:42 -0800 (PST)
Received: from redhat.com ([2a06:c701:73ff:4f00:b091:120e:5537:ac67])
        by smtp.gmail.com with ESMTPSA id m1-20020a056000008100b00334b3208700sm3961093wrx.49.2023.12.09.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 02:27:41 -0800 (PST)
Date: Sat, 9 Dec 2023 05:27:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, netdev@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	oe-kbuild-all@lists.linux.dev, jasowang@redhat.com,
	pabeni@redhat.com, kuba@kernel.org, yinjun.zhang@corigine.com,
	edumazet@google.com, davem@davemloft.net, hawk@kernel.org,
	john.fastabend@gmail.com, ast@kernel.org, horms@kernel.org,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH net-next v7 4/4] virtio-net: support rx netdim
Message-ID: <20231209052724-mutt-send-email-mst@kernel.org>
References: <9be20d1e86bea91b373f28401a96401b640ef4d1.1701929854.git.hengqi@linux.alibaba.com>
 <202312091132.7eR6Cbs9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202312091132.7eR6Cbs9-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 09, 2023 at 11:22:11AM +0800, kernel test robot wrote:
> Hi Heng,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Heng-Qi/virtio-net-returns-whether-napi-is-complete/20231207-143044
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/9be20d1e86bea91b373f28401a96401b640ef4d1.1701929854.git.hengqi%40linux.alibaba.com
> patch subject: [PATCH net-next v7 4/4] virtio-net: support rx netdim
> config: nios2-randconfig-r064-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091132.7eR6Cbs9-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091132.7eR6Cbs9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312091132.7eR6Cbs9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    nios2-linux-ld: drivers/net/virtio_net.o: in function `virtnet_rx_dim_work':
>    virtio_net.c:(.text+0x21dc): undefined reference to `net_dim_get_rx_moderation'
> >> virtio_net.c:(.text+0x21dc): relocation truncated to fit: R_NIOS2_CALL26 against `net_dim_get_rx_moderation'
>    nios2-linux-ld: drivers/net/virtio_net.o: in function `virtnet_poll':
>    virtio_net.c:(.text+0x97bc): undefined reference to `net_dim'
> >> virtio_net.c:(.text+0x97bc): relocation truncated to fit: R_NIOS2_CALL26 against `net_dim'


Looks like select DIMLIB is missing?

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

