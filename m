Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3354F366
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jan 2023 05:32:37 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id z4-20020a17090a170400b00226d331390cso19639008pjd.5
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jan 2023 21:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gXZvX83SeBc52XjU1Y6N0bZnckRh8rvbN9PDXBDBT+E=;
        b=YlK4VmtRv5pPEZ8VK+iArvY/y5aC3QkQRQZLLmZ5O1gta9lmy1BpflBNvxxcMso6+y
         afYdebZUKUX/zOkkn/iDSxCTdaJGpWUlALlMzmecciY+DX6F+k4IGqkCFL62dexkIbuH
         ufa6cwO/VWcmg5Q4e7XDPNN4bYNOeLdM6bCr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXZvX83SeBc52XjU1Y6N0bZnckRh8rvbN9PDXBDBT+E=;
        b=XO6x8KopQpMfrfmzky6he213Lhe68t0VOB/7TJHHVutji8TNfOToDeVuEPXv4pLebn
         uWm5wX8MO4mxcCWO7iZnwudqNHHZuwzrTokS6AJWuvC9xrY1AY4WW+qLRKcpbVJNpsol
         wPzxse1Y9USiVC4isaOnB0xR2eaCxEVjWntZz8SI3CJOKG2VjGlYtTxM2qN830UtP/Nq
         pGzQoLzpgFSNfb8JIw6/hrUf72YaTa+Qfiwkr8lAy4wy1uElLCDw4KSxHQ3oHTNw8wl3
         zAO+T2sKzgNt/BAaKO0bfNs92+pcdIl/hUK5tAuzBD9d0+SNujKBv9vlllLsqjqbweps
         NaaA==
X-Gm-Message-State: AFqh2kqb6EXrvJMdADpoXgEJ/Hej1s3ZmZfv2icX1K0vJc19wTz7SGol
	vTedcofRroaN27MY34SJ1m8fnv528q7iMsbH
X-Google-Smtp-Source: AMrXdXsY6/wvjkH9n4aQV53ZEyylIqjDX4UjL692UNjbUXuUHWBSS5zDlX3hPH4mdHGcT6x5DZ83lA==
X-Received: by 2002:a17:902:eb4b:b0:194:623e:f401 with SMTP id i11-20020a170902eb4b00b00194623ef401mr229345pli.8.1673501556524;
        Wed, 11 Jan 2023 21:32:36 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b00192d9b86318sm11086306plp.137.2023.01.11.21.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 21:32:35 -0800 (PST)
Date: Thu, 12 Jan 2023 14:32:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 262/266] mm/zsmalloc.c:224:28: error:
 variably modified 'size_class' at file scope
Message-ID: <Y7+bcLR79Z8/iK94@google.com>
References: <202301120505.al9KVH7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301120505.al9KVH7B-lkp@intel.com>

On (23/01/12 05:13), kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   8a0b7a30e285f66c8369f9f77c5784d8240ba1b3
> commit: eab24cc5a373f23bbf7e998c1b3db8bdbb8759d0 [262/266] zsmalloc: make zspage chain size configurable
> config: parisc64-allyesconfig
> compiler: hppa64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=eab24cc5a373f23bbf7e998c1b3db8bdbb8759d0
>         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>         git fetch --no-tags akpm-mm mm-unstable
>         git checkout eab24cc5a373f23bbf7e998c1b3db8bdbb8759d0
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from include/vdso/const.h:5,
>                     from include/linux/const.h:4,
>                     from include/linux/list.h:9,
>                     from include/linux/module.h:12,
>                     from mm/zsmalloc.c:40:
> >> mm/zsmalloc.c:122:59: warning: right shift count >= width of type [-Wshift-count-overflow]
>      122 |         MAX(32, (CONFIG_ZSMALLOC_CHAIN_SIZE << PAGE_SHIFT >> OBJ_INDEX_BITS))
>          |                                                           ^~
>    include/uapi/linux/const.h:34:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
>       34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>          |                                        ^
>    mm/zsmalloc.c:122:9: note: in expansion of macro 'MAX'
>      122 |         MAX(32, (CONFIG_ZSMALLOC_CHAIN_SIZE << PAGE_SHIFT >> OBJ_INDEX_BITS))
>          |         ^~~
>    mm/zsmalloc.c:140:59: note: in expansion of macro 'ZS_MIN_ALLOC_SIZE'
>      140 | #define ZS_SIZE_CLASSES (DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
>          |                                                           ^~~~~~~~~~~~~~~~~
>    mm/zsmalloc.c:224:39: note: in expansion of macro 'ZS_SIZE_CLASSES'
>      224 |         struct size_class *size_class[ZS_SIZE_CLASSES];
>          |                                       ^~~~~~~~~~~~~~~
> >> mm/zsmalloc.c:122:59: warning: right shift count >= width of type [-Wshift-count-overflow]
>      122 |         MAX(32, (CONFIG_ZSMALLOC_CHAIN_SIZE << PAGE_SHIFT >> OBJ_INDEX_BITS))
>          |                                                           ^~
>    include/uapi/linux/const.h:34:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
>       34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>          |                                        ^
>    mm/zsmalloc.c:122:9: note: in expansion of macro 'MAX'
>      122 |         MAX(32, (CONFIG_ZSMALLOC_CHAIN_SIZE << PAGE_SHIFT >> OBJ_INDEX_BITS))
>          |         ^~~
>    mm/zsmalloc.c:140:59: note: in expansion of macro 'ZS_MIN_ALLOC_SIZE'
>      140 | #define ZS_SIZE_CLASSES (DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
>          |                                                           ^~~~~~~~~~~~~~~~~
>    mm/zsmalloc.c:224:39: note: in expansion of macro 'ZS_SIZE_CLASSES'
>      224 |         struct size_class *size_class[ZS_SIZE_CLASSES];
>          |                                       ^~~~~~~~~~~~~~~
> >> mm/zsmalloc.c:224:28: error: variably modified 'size_class' at file scope
>      224 |         struct size_class *size_class[ZS_SIZE_CLASSES];

Thanks.

OK, so I think on hppa64 it wants chain-size to be explicitly casted to
unsigned long. Let me try it and send out a fixup patch.
