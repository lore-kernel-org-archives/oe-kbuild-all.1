Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCDC363
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 06:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=n2tgUFJtaLu8GXpryVyvm3e+s93+KzWkSHVZD95uPGY=; b=WPIpVVQ87yJZdcxIdMlz8K9hmh
	DOUeNMsvFiYsCFbllXhw0H1ybs7pQ6XjP5HU1lrh+tBaVrSjMA9Ig/VxjPQAATvphC7ztsc9TtbEp
	/CHLIdeFE8uHJQ2hpZIJLTafXyCB53Tcc+693bzOK3gI9Ku0V3EUA2+zHlJJep4LFF/2fd8OJXnn1
	fZqLR1u8anK3N86KyZR91Nwym4hXWkS3PctCToRWz9yP1rZTfrINlKw7COx/JS5xEb9zAngI1TLzS
	RIRP94akw1+z0jPFMoyRbXgB+lRQMrxchJuRs2KyPzZkdgjy12pRdB0mHO5l3xOHINAt61M8oRwUV
	/5dQ1q4g==;
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTdQq-000rGS-RU; Sun, 19 Feb 2023 06:44:20 +0000
Message-ID: <901d5e4c-c5b3-5315-3789-93d50a280d3f@infradead.org>
Date: Sat, 18 Feb 2023 22:44:19 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: cc1: error: arch/sh/include/mach-hp6xx: No such file or directory
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>
References: <202302190641.30VVXnPb-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202302190641.30VVXnPb-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yamada,

On 2/18/23 14:35, kernel test robot wrote:
> Hi Masahiro,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   5e725d112e1a54c2611d5dffd124a79415d0f0de
> commit: 4c8dd95a723d9cccf8810be54aa62be82885c9d8 kbuild: add some extra warning flags unconditionally
> date:   3 years, 9 months ago
> config: sh-randconfig-r021-20230219 (https://download.01.org/0day-ci/archive/20230219/202302190641.30VVXnPb-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4c8dd95a723d9cccf8810be54aa62be82885c9d8
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 4c8dd95a723d9cccf8810be54aa62be82885c9d8
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302190641.30VVXnPb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

I don't know what has caused this, but if I do this patch, there are no -Werror=missing-include-dirs
problems with this build:


diff -- a/arch/sh/Makefile b/arch/sh/Makefile
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -116,7 +116,7 @@ export ld-bfd
 
 # Mach groups
 machdir-$(CONFIG_SOLUTION_ENGINE)              += mach-se
-machdir-$(CONFIG_SH_HP6XX)                     += mach-hp6xx
+machdir-$(CONFIG_SH_HP6XX)                     += ../boards/mach-hp6xx
 machdir-$(CONFIG_SH_DREAMCAST)                 += mach-dreamcast
 machdir-$(CONFIG_SH_SH03)                      += mach-sh03
 machdir-$(CONFIG_SH_RTS7751R2D)                        += mach-r2d

Ideas?

Thanks.

>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>    cc1: all warnings being treated as errors
> --
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>    arch/sh/kernel/hw_breakpoint.c: In function 'arch_bp_generic_fields':
>    arch/sh/kernel/hw_breakpoint.c:159:27: error: this statement may fall through [-Werror=implicit-fallthrough=]
>      159 |                 *gen_type = HW_BREAKPOINT_R;
>          |                 ~~~~~~~~~~^~~~~~~~~~~~~~~~~
>    arch/sh/kernel/hw_breakpoint.c:160:9: note: here
>      160 |         case SH_BREAKPOINT_WRITE:
>          |         ^~~~
>    cc1: all warnings being treated as errors
> --
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>    arch/sh/kernel/machvec.c: In function 'early_parse_mv':
>    arch/sh/kernel/machvec.c:43:15: error: variable 'mv_comma' set but not used [-Werror=unused-but-set-variable]
>       43 |         char *mv_comma;
>          |               ^~~~~~~~
>    arch/sh/kernel/machvec.c: In function 'sh_mv_setup':
>    arch/sh/kernel/machvec.c:104:33: error: array subscript 'struct sh_machine_vector[0]' is partly outside array bounds of 'long int[1]' [-Werror=array-bounds]
>      104 |                         sh_mv = *(struct sh_machine_vector *)&__machvec_start;
>          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from arch/sh/kernel/machvec.c:13:
>    arch/sh/include/asm/sections.h:7:13: note: object '__machvec_start' of size 4
>        7 | extern long __machvec_start, __machvec_end;
>          |             ^~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> --
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>    arch/sh/kernel/ptrace_32.c: In function 'arch_ptrace':
>    arch/sh/kernel/ptrace_32.c:380:40: error: comparison of unsigned expression in '< 0' is always false [-Werror=type-limits]
>      380 |                 if ((addr & 3) || addr < 0 ||
>          |                                        ^
>    arch/sh/kernel/ptrace_32.c:420:40: error: comparison of unsigned expression in '< 0' is always false [-Werror=type-limits]
>      420 |                 if ((addr & 3) || addr < 0 ||
>          |                                        ^
>    cc1: all warnings being treated as errors
> --
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>    arch/sh/kernel/kgdb.c: In function 'kgdb_arch_handle_exception':
>    arch/sh/kernel/kgdb.c:267:20: error: this statement may fall through [-Werror=implicit-fallthrough=]
>      267 |                 if (kgdb_hex2long(&ptr, &addr))
>          |                    ^
>    arch/sh/kernel/kgdb.c:269:9: note: here
>      269 |         case 'D':
>          |         ^~~~
>    cc1: all warnings being treated as errors
> --
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>    arch/sh/kernel/kprobes.c: In function 'kprobe_exceptions_notify':
>    arch/sh/kernel/kprobes.c:481:24: error: variable 'p' set but not used [-Werror=unused-but-set-variable]
>      481 |         struct kprobe *p = NULL;
>          |                        ^
>    cc1: all warnings being treated as errors
> --
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]

> 

-- 
~Randy
