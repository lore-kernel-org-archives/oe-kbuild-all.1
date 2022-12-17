Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458521FBB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Dec 2022 13:59:43 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id f16so4870747ljc.8
        for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Dec 2022 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7p2fUOGwLtjJ8LUx/gRZfm7ILkPpG2j+TwX25KqMNrc=;
        b=VeGz58vO3aP6XMA/I7dh31CD6Eqc4JEabc9WB+mTnWVE95tX/DfGtCAM4CnJEI35IO
         sSzXGk5TvMsl4ltN6Q2T6LutmU+x9ZOa+fzVkTfksccgtmnfP5nOCTB3C2w1qHoCoc0u
         cUnq7GVm9tH4SCA25FqnNNkwIFbTqPWlEUiTgtqFu/xAADENOp8pgsc1kDo2hFXfVv0d
         S62lH5B1vsKAYC1YIPBpBZrsqz2Ghu68UfxVI/cw1sxwPmrhZV4h5eHByseE38O+wOAv
         PDq14Sz7o97huArBKLmgVcNIRoRI0ytNof8MOOWfDrjqpl0axHBp+5lgfu+HEbi5GLDw
         4X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7p2fUOGwLtjJ8LUx/gRZfm7ILkPpG2j+TwX25KqMNrc=;
        b=k68k6DE+CIuW/ihS/HDCKPt04au42Hhw3VZLfETzjwBD3q1RlQ8uIUdBKGyJuWG0XZ
         tCtML1K6w+L0axVfjmmcGhwMP2dRkkvqOwoeFjEkwfNGoJVkAf+QKMo5sTGt3DLd6zm/
         wfnm1kNn3UzHfgjr8dENGTUWGYl91zCU78tYH+nmAuAcydzIcVbPVh9u99EIbPo0Cebw
         1HphvPKTzwhEqeMU9XUJp3vjsFGD2rzXdSQuqdA+t62SNk79yUTvbIDHHTGtwLsKXHYF
         xELQVCG/6qzu++3Pypl/JWcfaCcADij4VIRMXWb02Rn265Hh3ffvt0PPHLf7t2cHOR6v
         Nd2Q==
X-Gm-Message-State: ANoB5pl4F0LBE+UPMDiYiEXASSsJEI7BdS+p11Ge7E8hQVnRrfmCIUcX
	3Sf+7ExtUWm04dirLod3IG7wMHvH6Evt4n1IjWg=
X-Google-Smtp-Source: AA0mqf4z34DGn0nWK4WnWI95ODV5Evmo4z4NVQSkvku2IU9VHxrqu0tawlq8W7yMmoM4xFB0MZfW1ZUd0vYhAP6X3Xw=
X-Received: by 2002:a2e:320a:0:b0:279:effa:dfdd with SMTP id
 y10-20020a2e320a000000b00279effadfddmr9262916ljy.40.1671285581172; Sat, 17
 Dec 2022 05:59:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221217105833.24851-3-laoar.shao@gmail.com> <202212172023.1aT46Aia-lkp@intel.com>
In-Reply-To: <202212172023.1aT46Aia-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sat, 17 Dec 2022 21:59:04 +0800
Message-ID: <CALOAHbBHzEqZufYd-mthkJa3fwjGkNLOX77nWSqs=tc6uSA70w@mail.gmail.com>
Subject: Re: [PATCH -mm 2/2] mm: page_idle: split 32bit page_idle's flag from
 the common flags
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, oe-kbuild-all@lists.linux.dev, vbabka@suse.cz, 
	42.hyeyoo@gmail.com, willy@infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 17, 2022 at 8:46 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Yafang,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-page_ext-split-page_ext-flags/20221217-190044
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20221217105833.24851-3-laoar.shao%40gmail.com
> patch subject: [PATCH -mm 2/2] mm: page_idle: split 32bit page_idle's flag from the common flags
> config: arc-randconfig-r001-20221217
> compiler: arceb-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/b2ccea224a74e091007c4c772b78b8163bb11b6c
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Yafang-Shao/mm-page_ext-split-page_ext-flags/20221217-190044
>         git checkout b2ccea224a74e091007c4c772b78b8163bb11b6c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arceb-elf-ld: mm/filemap.o: in function `get_page_idle':
>    include/linux/page_idle.h:24: undefined reference to `page_idle_ops'
> >> arceb-elf-ld: include/linux/page_idle.h:24: undefined reference to `page_idle_ops'
>    arceb-elf-ld: mm/swap.o: in function `get_page_idle':
>    include/linux/page_idle.h:24: undefined reference to `page_idle_ops'
> >> arceb-elf-ld: include/linux/page_idle.h:24: undefined reference to `page_idle_ops'
>    arceb-elf-ld: mm/rmap.o: in function `get_page_idle':
>    include/linux/page_idle.h:24: undefined reference to `page_idle_ops'
>    arceb-elf-ld: mm/rmap.o:include/linux/page_idle.h:24: more undefined references to `page_idle_ops' follow
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

Ah, because of  CONFIG_IDLE_PAGE_TRACKING=n, and mm/page_idle.c is for
page_idle_tracking only but not for  page_idle_flag ...
Will update it in the next version.
Thanks for the report.

-- 
Regards
Yafang
