Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A5EA922
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 16:09:25 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id x26so1411536qkj.4
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BgnEkrF24X6SgiL6R27Puw6rLHqe/LjIdnxUFsUlSCE=;
        b=TCja8n01EUldNduZxmd23IrGcLHQSDoZopr2PD2xJ17riFwRUH1PazaRHEvj+DaITJ
         YM3JbaKm2fcOyGBbJF5uBP4XrO1X2yDnDkCl1D+DccshmzQ+ZOHihMKy0OLlfIklcRMm
         PGvSleGn6cYRuRHqUa9/HtAjo+sWs6vxjIbDsyVHlBXC7nLTymhilYM2omXMvujWTeux
         w1PFyFRAyY2rqH0qp+OUcW8UKxFu2VEY7QqURddRCLXyFGqRPb1fvve3zvw5b7gCL19g
         RnKliscwi7cxTVp0OsyCnBpWUiVEr/WBqRfqcaWrAFBHAX/jPU1LT/uU8XxjDaBcTohm
         gBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgnEkrF24X6SgiL6R27Puw6rLHqe/LjIdnxUFsUlSCE=;
        b=6uG+R2G4uVJYhnZ3FK8/SFrCjzBRKjxbbOlslzFDgUycBCk+ggnt7t9VGvzWt4MbQ/
         hFEZf8V82Gx5Hw1EfpEG9TvW3/cd7qzD6MUtqsT+z69hwTpPuCuM6bU9IKRoG3PYJN28
         8wjHoQpYJ1buVNCmUXqMCwzRph6OhMXaxwAOMjnbpSl+/Yn0cgR5fQaYMwm1kpfeskDD
         ElrDvhf4V48nPPVvXLyjGJ5rVM1dxQksK54DFiviFefRy4k9xFKLuAResJk59Fi1P36w
         AvteAo8Yx7waEsVDeYT+HcLi4/0H+x/QDre2qT0rfKvC/M2+HfFAjm+B+bvU5W+RfVHp
         37xQ==
X-Gm-Message-State: AFqh2kqHIXXbP+3yhmj6XGRvPI+gftOSEy5j23ItWHwvHLDSkEEW5fqg
	mzMYWBtVICuuF0zV2aimoB+Oa7xEcRxsg+pE9PI=
X-Google-Smtp-Source: AMrXdXtJjCU2hs7+F+84WngZpGAXLlrU8kUcLyU03M0YlJ3htDqBM72au+1ajeWRgeBkOSi4F5gkXaJb44LADIMtZuQ=
X-Received: by 2002:a37:684e:0:b0:6ff:b61f:97f4 with SMTP id
 d75-20020a37684e000000b006ffb61f97f4mr625062qkc.309.1674144564080; Thu, 19
 Jan 2023 08:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y8kJ/BhadFcTkSxr@yujie-X299>
In-Reply-To: <Y8kJ/BhadFcTkSxr@yujie-X299>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 19 Jan 2023 08:09:13 -0800
Message-ID: <CAKEwX=PVR3HCBtWkhichkyFKRiPGYD_9xHJEWA8-5mwVRY0aWw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-hotfixes-unstable 25/30] mm/zsmalloc.c:940:13:
 warning: unused function 'obj_allocated'
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

This bug was detected and fix by Arnd Bergmann:

https://lore.kernel.org/lkml/CAKEwX=OTpY9Wg6YPfADDqeu7FFzciY9o_nNE5dRR3cu_-2ntaw@mail.gmail.com/T/

It is triggered when neither CONFIG_ZPOOL nor CONFIG_COMPACTION is set.

On Thu, Jan 19, 2023 at 1:16 AM kernel test robot <yujie.liu@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-hotfixes-unstable
> head:   4de77094279d6b179bab4314bdca80e6694cfcf0
> commit: f950c3c5d55be15a74d250edde93e404c6ecd409 [25/30] zsmalloc: fix a race with deferred_handles storing
> config: hexagon-buildonly-randconfig-r001-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190830.4tstTsgZ-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=f950c3c5d55be15a74d250edde93e404c6ecd409
>         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>         git fetch --no-tags akpm-mm mm-hotfixes-unstable
>         git checkout f950c3c5d55be15a74d250edde93e404c6ecd409
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <yujie.liu@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> mm/zsmalloc.c:940:13: warning: unused function 'obj_allocated' [-Wunused-function]
>    static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
>                ^
>
> Please check if it needs to be guarded with a config.
>
>
> vim +/obj_allocated +940 mm/zsmalloc.c
>
> 312fcae22703761 Minchan Kim 2015-04-15  939
> f950c3c5d55be15 Nhat Pham   2023-01-10 @940  static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
> f950c3c5d55be15 Nhat Pham   2023-01-10  941  {
> f950c3c5d55be15 Nhat Pham   2023-01-10  942     return obj_tagged(page, obj, phandle, OBJ_ALLOCATED_TAG);
> f950c3c5d55be15 Nhat Pham   2023-01-10  943  }
> f950c3c5d55be15 Nhat Pham   2023-01-10  944
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
