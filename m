Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED09529AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 22:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676759780; x=1708295780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsNI8hqW4WKziUwOLNXzi3I+iAtaihsXjk/rEwtmdxQ=;
  b=OYI/NIx+gxYv0Q4EdW1RkCOfVmbJDH9O1QDFuYkvEYOywytrU7V1mTik
   iXmOHuiZjD2s+HE9GnWRxYqNCJH2Bgkw3U0EQ/h6+eOP2xRe8F8p1a4mt
   gsi6Ymaok5qCC9wsqUsO/YnLiYjrJJ8F9LdI/QKe0dD85B2BSkLxhhz5r
   T/Qdibgvh1q38UPmUqv75LjWfM/paj/3MBNSz7wsrIGHV+S97z2nqNJWI
   D3DDKI6/THlREvcokpeLgEEkHW79bWeivOUZ6pOMIvwQdtOulEEMpmcYY
   Rex/i7JElX2QGyPLkFu6PnO2DWKK2MUyetQXjTEfyZGDkMsHCD5K6YNLA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="332213046"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="332213046"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 14:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="670935601"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="670935601"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Feb 2023 14:36:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTVoW-000Coz-0W;
	Sat, 18 Feb 2023 22:36:16 +0000
Date: Sun, 19 Feb 2023 06:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: cc1: error: arch/sh/include/mach-hp6xx: No such file or directory
Message-ID: <202302190641.30VVXnPb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5e725d112e1a54c2611d5dffd124a79415d0f0de
commit: 4c8dd95a723d9cccf8810be54aa62be82885c9d8 kbuild: add some extra warning flags unconditionally
date:   3 years, 9 months ago
config: sh-randconfig-r021-20230219 (https://download.01.org/0day-ci/archive/20230219/202302190641.30VVXnPb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4c8dd95a723d9cccf8810be54aa62be82885c9d8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4c8dd95a723d9cccf8810be54aa62be82885c9d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190641.30VVXnPb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
   arch/sh/kernel/hw_breakpoint.c: In function 'arch_bp_generic_fields':
   arch/sh/kernel/hw_breakpoint.c:159:27: error: this statement may fall through [-Werror=implicit-fallthrough=]
     159 |                 *gen_type = HW_BREAKPOINT_R;
         |                 ~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/sh/kernel/hw_breakpoint.c:160:9: note: here
     160 |         case SH_BREAKPOINT_WRITE:
         |         ^~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
   arch/sh/kernel/machvec.c: In function 'early_parse_mv':
   arch/sh/kernel/machvec.c:43:15: error: variable 'mv_comma' set but not used [-Werror=unused-but-set-variable]
      43 |         char *mv_comma;
         |               ^~~~~~~~
   arch/sh/kernel/machvec.c: In function 'sh_mv_setup':
   arch/sh/kernel/machvec.c:104:33: error: array subscript 'struct sh_machine_vector[0]' is partly outside array bounds of 'long int[1]' [-Werror=array-bounds]
     104 |                         sh_mv = *(struct sh_machine_vector *)&__machvec_start;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sh/kernel/machvec.c:13:
   arch/sh/include/asm/sections.h:7:13: note: object '__machvec_start' of size 4
       7 | extern long __machvec_start, __machvec_end;
         |             ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
   arch/sh/kernel/ptrace_32.c: In function 'arch_ptrace':
   arch/sh/kernel/ptrace_32.c:380:40: error: comparison of unsigned expression in '< 0' is always false [-Werror=type-limits]
     380 |                 if ((addr & 3) || addr < 0 ||
         |                                        ^
   arch/sh/kernel/ptrace_32.c:420:40: error: comparison of unsigned expression in '< 0' is always false [-Werror=type-limits]
     420 |                 if ((addr & 3) || addr < 0 ||
         |                                        ^
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
   arch/sh/kernel/kgdb.c: In function 'kgdb_arch_handle_exception':
   arch/sh/kernel/kgdb.c:267:20: error: this statement may fall through [-Werror=implicit-fallthrough=]
     267 |                 if (kgdb_hex2long(&ptr, &addr))
         |                    ^
   arch/sh/kernel/kgdb.c:269:9: note: here
     269 |         case 'D':
         |         ^~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
   arch/sh/kernel/kprobes.c: In function 'kprobe_exceptions_notify':
   arch/sh/kernel/kprobes.c:481:24: error: variable 'p' set but not used [-Werror=unused-but-set-variable]
     481 |         struct kprobe *p = NULL;
         |                        ^
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-hp6xx: No such file or directory [-Werror=missing-include-dirs]
   arch/sh/kernel/disassemble.c: In function 'print_sh_insn':
   arch/sh/kernel/disassemble.c:295:13: error: variable 'lastsp' set but not used [-Werror=unused-but-set-variable]
     295 |         int lastsp;
         |             ^~~~~~
   arch/sh/kernel/disassemble.c:478:36: error: this statement may fall through [-Werror=implicit-fallthrough=]
     478 |                                 if (0)
         |                                    ^
   arch/sh/kernel/disassemble.c:480:25: note: here
     480 |                         case F_REG_N:
         |                         ^~~~
   arch/sh/kernel/disassemble.c:487:36: error: this statement may fall through [-Werror=implicit-fallthrough=]
     487 |                                 if (rn & 1) {
         |                                    ^
   arch/sh/kernel/disassemble.c:491:25: note: here
     491 |                         d_reg_n:
         |                         ^~~~~~~
   arch/sh/kernel/disassemble.c:496:36: error: this statement may fall through [-Werror=implicit-fallthrough=]
     496 |                                 if (rm & 1) {
         |                                    ^
   arch/sh/kernel/disassemble.c:500:25: note: here
     500 |                         case D_REG_M:
         |                         ^~~~
   cc1: all warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
