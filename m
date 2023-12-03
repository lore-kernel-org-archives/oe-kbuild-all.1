Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E3F18B0C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JfRHNnL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701635226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pYTrpCRDHy3pVYrmuekoON7KTgLSFaRDili/ZX0QPtg=;
	b=JfRHNnL8wyly2EKdnDjOuj4NmYmlvA5x6RnA85dQXgYtym8zfKeolmW6KQ4O6VI3EcHoWN
	DOBpBO/fCHoKuo3dWPca6x3BeTYlLiz0njzG0dXgor+IoM3eYj+/n8D3ajdYSzBacRUEEs
	sZOA9Ipclao1xWQBWhxdu7OXsdZ/hDU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-nFs8iZrDPY6Jn56XO9G8wQ-1; Sun, 03 Dec 2023 15:27:04 -0500
X-MC-Unique: nFs8iZrDPY6Jn56XO9G8wQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40b23aef363so32445295e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Dec 2023 12:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701635223; x=1702240023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYTrpCRDHy3pVYrmuekoON7KTgLSFaRDili/ZX0QPtg=;
        b=r0xmhykd8it7+CimY5LCW0D3TgRDZVA7epiFGNPe4mtcsQRrdfteMOwGtMYTIT2zwF
         6D+vocJVxDFMysUyH82+RsFI5v/HKS8Bi+qByIvIM/Wnu5GfZOVh3E+vC7+RYCxS1Hwk
         T+31gIvy0WoCS4CH04pDm8t0y68m/SCo7KNFdIm+eRYC6MBJgX/tbJfzzQlwz72+dAM8
         EhFPHZOwqb43onK1aeKoT1LFCiNCOmevfYot8T5DEb34TYqW6xUnJYG2wtHGitRu3E3y
         xJoZPBwfPmWAoXk7+WAcUQQADbqmwyWFTC48z60xZuxsyFT0hGZhJ/IyEqPw5vkMfWML
         Soig==
X-Gm-Message-State: AOJu0YxN4c+VFTxpIMMJlon+d1peXeHQoz8Tt1i/svMabuepAOQ4StIl
	a5qA04cMooE9MJwIk5sZ5BGCtNLJl8JC+GC0BbJKdAvrkMyGnYR9V0BYiTHR/s2IGO0CU1T43Ex
	WZUCsxNZjq3ztuHKdQ58AJt3rZQ==
X-Received: by 2002:a05:600c:2218:b0:40c:9a7:5253 with SMTP id z24-20020a05600c221800b0040c09a75253mr579773wml.127.1701635223367;
        Sun, 03 Dec 2023 12:27:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGAC1lOWZDli3AMMFaxArgBcn7hOengWBWj6AEgPzfyNKh9vOJsJOrQiMQn4CXrHnXOLSBIQ==
X-Received: by 2002:a05:600c:2218:b0:40c:9a7:5253 with SMTP id z24-20020a05600c221800b0040c09a75253mr579767wml.127.1701635222966;
        Sun, 03 Dec 2023 12:27:02 -0800 (PST)
Received: from redhat.com ([2.55.57.48])
        by smtp.gmail.com with ESMTPSA id x10-20020a5d490a000000b003333c06fa79sm4270161wrq.71.2023.12.03.12.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 12:27:02 -0800 (PST)
Date: Sun, 3 Dec 2023 15:26:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Gonglei <arei.gonglei@huawei.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning:
 variable 'cpu' set but not used
Message-ID: <20231203152646-mutt-send-email-mst@kernel.org>
References: <202312040315.kPrI1OCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202312040315.kPrI1OCE-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 04, 2023 at 03:55:43AM +0800, kernel test robot wrote:
> Hi Gonglei,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
> commit: dbaf0624ffa57ae6e7d87a823185ccd9a7852d3c crypto: add virtio-crypto driver
> date:   7 years ago
> config: x86_64-randconfig-015-20231011 (https://download.01.org/0day-ci/archive/20231204/202312040315.kPrI1OCE-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312040315.kPrI1OCE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312040315.kPrI1OCE-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/crypto/virtio/virtio_crypto_algs.c:28:
>    drivers/crypto/virtio/virtio_crypto_common.h: In function 'virtio_crypto_get_current_node':
> >> drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
>      116 |         int cpu, node;
>          |             ^~~
> --
>    In file included from drivers/crypto/virtio/virtio_crypto_core.c:25:
>    drivers/crypto/virtio/virtio_crypto_common.h: In function 'virtio_crypto_get_current_node':
> >> drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
>      116 |         int cpu, node;
>          |             ^~~
>    In file included from drivers/crypto/virtio/virtio_crypto_core.c:20:
>    drivers/crypto/virtio/virtio_crypto_core.c: At top level:
>    include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'virtio_crypto_driver_init': 'cold' [-Wmissing-attributes]
>      132 |         int init_module(void) __attribute__((alias(#initfn)));
>          |             ^~~~~~~~~~~
>    include/linux/device.h:1463:1: note: in expansion of macro 'module_init'
>     1463 | module_init(__driver##_init); \
>          | ^~~~~~~~~~~
>    include/linux/virtio.h:190:9: note: in expansion of macro 'module_driver'
>      190 |         module_driver(__virtio_driver, register_virtio_driver, \
>          |         ^~~~~~~~~~~~~
>    drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion of macro 'module_virtio_driver'
>      471 | module_virtio_driver(virtio_crypto_driver);
>          | ^~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/virtio.h:8,
>                     from include/linux/virtio_config.h:6,
>                     from drivers/crypto/virtio/virtio_crypto_core.c:21:
>    drivers/crypto/virtio/virtio_crypto_core.c:471:22: note: 'init_module' target declared here
>      471 | module_virtio_driver(virtio_crypto_driver);
>          |                      ^~~~~~~~~~~~~~~~~~~~
>    include/linux/device.h:1459:19: note: in definition of macro 'module_driver'
>     1459 | static int __init __driver##_init(void) \
>          |                   ^~~~~~~~
>    drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion of macro 'module_virtio_driver'
>      471 | module_virtio_driver(virtio_crypto_driver);
>          | ^~~~~~~~~~~~~~~~~~~~
>    include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'virtio_crypto_driver_exit': 'cold' [-Wmissing-attributes]
>      138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
>          |              ^~~~~~~~~~~~~~
>    include/linux/device.h:1468:1: note: in expansion of macro 'module_exit'
>     1468 | module_exit(__driver##_exit);
>          | ^~~~~~~~~~~
>    include/linux/virtio.h:190:9: note: in expansion of macro 'module_driver'
>      190 |         module_driver(__virtio_driver, register_virtio_driver, \
>          |         ^~~~~~~~~~~~~
>    drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion of macro 'module_virtio_driver'
>      471 | module_virtio_driver(virtio_crypto_driver);
>          | ^~~~~~~~~~~~~~~~~~~~
>    drivers/crypto/virtio/virtio_crypto_core.c:471:22: note: 'cleanup_module' target declared here
>      471 | module_virtio_driver(virtio_crypto_driver);
>          |                      ^~~~~~~~~~~~~~~~~~~~
>    include/linux/device.h:1464:20: note: in definition of macro 'module_driver'
>     1464 | static void __exit __driver##_exit(void) \
>          |                    ^~~~~~~~
>    drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion of macro 'module_virtio_driver'
>      471 | module_virtio_driver(virtio_crypto_driver);
>          | ^~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/cpu +116 drivers/crypto/virtio/virtio_crypto_common.h
> 
>    113	
>    114	static inline int virtio_crypto_get_current_node(void)
>    115	{
>  > 116		int cpu, node;
>    117	
>    118		cpu = get_cpu();
>    119		node = topology_physical_package_id(cpu);
>    120		put_cpu();
>    121	
>    122		return node;
>    123	}
>    124	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Seems easy to fix. Gonglei?

-- 
MST

