Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086EC659
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 05:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680587478; x=1712123478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xpM9bExXO20dg7n/9m9CqvzvBN/JhA/m7n4LAZOmaEQ=;
  b=Mu4jZISdDslWNJRuqLgDmH6GmNh3YaRPYQsUzueD43VED/3+jdHt+roP
   UqSmI4NnfQbKK+DlnuM/9PnGrDXuIO+r1o2xrGDl9vPp0ZpRbD3qkaESZ
   RcFh5PFemDoUjqqth0vQyzIefeJuDLQl7mTl4ZJ87s6ouR9UbJpJ0JAb6
   1NkYM0OeL241hWwjAyCFO+rcXlwJK8LEYmz3iLTstAsOHHh5rnBVN6uSQ
   ep3PDXdHjvyLL2ZEFzESGyCg6bY82/Mbi+uwk7AA/+cd1Lo7maKEmp2se
   uOOpz7Y1tCqpsv0OBEt5PLDLW5k7YS/yl684uZFBVLd7Utoew8bx1/q4r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322489027"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="322489027"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 22:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="775509748"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="775509748"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2023 22:51:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjZZT-000PG6-3D;
	Tue, 04 Apr 2023 05:51:07 +0000
Date: Tue, 4 Apr 2023 13:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: arch/m68k/kernel/uboot.c:67:43: warning: variable 'uboot_initrd_end'
 set but not used
Message-ID: <202304041351.UoS1HYnY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masami,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   148341f0a2f53b5e8808d093333d85170586a15d
commit: a2a9d67a26ec94a99ed29efbd61cf5be0a575678 bootconfig: Support embedding a bootconfig file in kernel
date:   11 months ago
config: m68k-buildonly-randconfig-r001-20230404 (https://download.01.org/0day-ci/archive/20230404/202304041351.UoS1HYnY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2a9d67a26ec94a99ed29efbd61cf5be0a575678
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a2a9d67a26ec94a99ed29efbd61cf5be0a575678
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash arch/m68k/kernel/ drivers/clk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041351.UoS1HYnY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/m68k/kernel/uboot.c: In function 'parse_uboot_commandline':
>> arch/m68k/kernel/uboot.c:67:43: warning: variable 'uboot_initrd_end' set but not used [-Wunused-but-set-variable]
      67 |         unsigned long uboot_initrd_start, uboot_initrd_end;
         |                                           ^~~~~~~~~~~~~~~~
>> arch/m68k/kernel/uboot.c:67:23: warning: variable 'uboot_initrd_start' set but not used [-Wunused-but-set-variable]
      67 |         unsigned long uboot_initrd_start, uboot_initrd_end;
         |                       ^~~~~~~~~~~~~~~~~~
   arch/m68k/kernel/uboot.c:66:23: warning: variable 'uboot_kbd' set but not used [-Wunused-but-set-variable]
      66 |         unsigned long uboot_kbd;
         |                       ^~~~~~~~~
   arch/m68k/kernel/uboot.c: At top level:
   arch/m68k/kernel/uboot.c:90:13: warning: no previous prototype for 'process_uboot_commandline' [-Wmissing-prototypes]
      90 | __init void process_uboot_commandline(char *commandp, int size)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/uboot_initrd_end +67 arch/m68k/kernel/uboot.c

aa5ac789bd96c7 Greg Ungerer       2016-09-05  30  
aa5ac789bd96c7 Greg Ungerer       2016-09-05  31  /*
aa5ac789bd96c7 Greg Ungerer       2016-09-05  32   * parse_uboot_commandline
aa5ac789bd96c7 Greg Ungerer       2016-09-05  33   *
aa5ac789bd96c7 Greg Ungerer       2016-09-05  34   * Copies u-boot commandline arguments and store them in the proper linux
aa5ac789bd96c7 Greg Ungerer       2016-09-05  35   * variables.
aa5ac789bd96c7 Greg Ungerer       2016-09-05  36   *
aa5ac789bd96c7 Greg Ungerer       2016-09-05  37   * Assumes:
aa5ac789bd96c7 Greg Ungerer       2016-09-05  38   *	_init_sp global contains the address in the stack pointer when the
aa5ac789bd96c7 Greg Ungerer       2016-09-05  39   *	kernel starts (see head.S::_start)
aa5ac789bd96c7 Greg Ungerer       2016-09-05  40   *
aa5ac789bd96c7 Greg Ungerer       2016-09-05  41   *	U-Boot calling convention:
aa5ac789bd96c7 Greg Ungerer       2016-09-05  42   *	(*kernel) (kbd, initrd_start, initrd_end, cmd_start, cmd_end);
aa5ac789bd96c7 Greg Ungerer       2016-09-05  43   *
aa5ac789bd96c7 Greg Ungerer       2016-09-05  44   *	_init_sp can be parsed as such
aa5ac789bd96c7 Greg Ungerer       2016-09-05  45   *
aa5ac789bd96c7 Greg Ungerer       2016-09-05  46   *	_init_sp+00 = u-boot cmd after jsr into kernel (skip)
aa5ac789bd96c7 Greg Ungerer       2016-09-05  47   *	_init_sp+04 = &kernel board_info (residual data)
aa5ac789bd96c7 Greg Ungerer       2016-09-05  48   *	_init_sp+08 = &initrd_start
aa5ac789bd96c7 Greg Ungerer       2016-09-05  49   *	_init_sp+12 = &initrd_end
aa5ac789bd96c7 Greg Ungerer       2016-09-05  50   *	_init_sp+16 = &cmd_start
aa5ac789bd96c7 Greg Ungerer       2016-09-05  51   *	_init_sp+20 = &cmd_end
aa5ac789bd96c7 Greg Ungerer       2016-09-05  52   *
aa5ac789bd96c7 Greg Ungerer       2016-09-05  53   *	This also assumes that the memory locations pointed to are still
aa5ac789bd96c7 Greg Ungerer       2016-09-05  54   *	unmodified. U-boot places them near the end of external SDRAM.
aa5ac789bd96c7 Greg Ungerer       2016-09-05  55   *
aa5ac789bd96c7 Greg Ungerer       2016-09-05  56   * Argument(s):
aa5ac789bd96c7 Greg Ungerer       2016-09-05  57   *	commandp = the linux commandline arg container to fill.
aa5ac789bd96c7 Greg Ungerer       2016-09-05  58   *	size     = the sizeof commandp.
aa5ac789bd96c7 Greg Ungerer       2016-09-05  59   *
aa5ac789bd96c7 Greg Ungerer       2016-09-05  60   * Returns:
aa5ac789bd96c7 Greg Ungerer       2016-09-05  61   */
aa5ac789bd96c7 Greg Ungerer       2016-09-05  62  static void __init parse_uboot_commandline(char *commandp, int size)
aa5ac789bd96c7 Greg Ungerer       2016-09-05  63  {
aa5ac789bd96c7 Greg Ungerer       2016-09-05  64  	extern unsigned long _init_sp;
aa5ac789bd96c7 Greg Ungerer       2016-09-05  65  	unsigned long *sp;
aa5ac789bd96c7 Greg Ungerer       2016-09-05  66  	unsigned long uboot_kbd;
aa5ac789bd96c7 Greg Ungerer       2016-09-05 @67  	unsigned long uboot_initrd_start, uboot_initrd_end;
aa5ac789bd96c7 Greg Ungerer       2016-09-05  68  	unsigned long uboot_cmd_start, uboot_cmd_end;
aa5ac789bd96c7 Greg Ungerer       2016-09-05  69  
aa5ac789bd96c7 Greg Ungerer       2016-09-05  70  	sp = (unsigned long *)_init_sp;
aa5ac789bd96c7 Greg Ungerer       2016-09-05  71  	uboot_kbd = sp[1];
aa5ac789bd96c7 Greg Ungerer       2016-09-05  72  	uboot_initrd_start = sp[2];
aa5ac789bd96c7 Greg Ungerer       2016-09-05  73  	uboot_initrd_end = sp[3];
aa5ac789bd96c7 Greg Ungerer       2016-09-05  74  	uboot_cmd_start = sp[4];
aa5ac789bd96c7 Greg Ungerer       2016-09-05  75  	uboot_cmd_end = sp[5];
aa5ac789bd96c7 Greg Ungerer       2016-09-05  76  
aa5ac789bd96c7 Greg Ungerer       2016-09-05  77  	if (uboot_cmd_start && uboot_cmd_end)
aa5ac789bd96c7 Greg Ungerer       2016-09-05  78  		strncpy(commandp, (const char *)uboot_cmd_start, size);
aa5ac789bd96c7 Greg Ungerer       2016-09-05  79  #if defined(CONFIG_BLK_DEV_INITRD)
aa5ac789bd96c7 Greg Ungerer       2016-09-05  80  	if (uboot_initrd_start && uboot_initrd_end &&
aa5ac789bd96c7 Greg Ungerer       2016-09-05  81  	    (uboot_initrd_end > uboot_initrd_start)) {
aa5ac789bd96c7 Greg Ungerer       2016-09-05  82  		initrd_start = uboot_initrd_start;
aa5ac789bd96c7 Greg Ungerer       2016-09-05  83  		initrd_end = uboot_initrd_end;
aa5ac789bd96c7 Greg Ungerer       2016-09-05  84  		ROOT_DEV = Root_RAM0;
7c79e1eef8c9a7 Geert Uytterhoeven 2016-12-06  85  		pr_info("initrd at 0x%lx:0x%lx\n", initrd_start, initrd_end);
aa5ac789bd96c7 Greg Ungerer       2016-09-05  86  	}
aa5ac789bd96c7 Greg Ungerer       2016-09-05  87  #endif /* if defined(CONFIG_BLK_DEV_INITRD) */
aa5ac789bd96c7 Greg Ungerer       2016-09-05  88  }
aa5ac789bd96c7 Greg Ungerer       2016-09-05  89  

:::::: The code at line 67 was first introduced by commit
:::::: aa5ac789bd96c7a6628a8167de562fa660f1f481 m68k: generalize uboot command line support

:::::: TO: Greg Ungerer <gerg@linux-m68k.org>
:::::: CC: Greg Ungerer <gerg@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
