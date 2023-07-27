Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B012C7C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 01:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690420360; x=1721956360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N1Emfx5CCOehcr1Axb6BU6tf+Zht9DLrQGpMgj4tFLk=;
  b=eZ6x+Sb+PrGLdPaF/Svfdn41M1P7+3MxBES11FNCfg5CeY5yGo71ow1v
   BgX92CG/Cg5EKpA5va88Ag3EaEb6tOzXJqLmlhZ4qk8N/Y70ZtKHW/rDk
   x9u1H4q//ro6Q7Z1hpB/5+I/akuuND0ozqotJMRQP4h1l4zDQAVuxkmza
   uxhdlZZlN7QqMQ7c0xkbUVacpkWH2agb9J3RlDyGVTrpm2yuim9X2L54H
   Rk/8BaCh8Y1JabUvxpGoTv2mYC4tjdXadaP+JjQauRuv4OTVYzQ57Bl0e
   mtk1ohqI8F5iF3RqGrsrpj2cYCE5LCXfMjrnwjGWhTDuEGt0YI35M7SMB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353075653"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="353075653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 18:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756446185"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="756446185"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Jul 2023 18:12:36 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOpYS-0001Vm-0j;
	Thu, 27 Jul 2023 01:12:36 +0000
Date: Thu, 27 Jul 2023 09:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dirk Mueller <dmueller@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: [stable:linux-4.14.y 3076/9999] arch/mips/jz4740/setup.c:84:13:
 warning: no previous prototype for 'arch_init_irq'
Message-ID: <202307270959.9Ol82L9D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: 88f7a6aa7fb9aa5076b65489146045dac865f1d3 [3076/9999] scripts/dtc: Remove redundant YYLOC global declaration
config: mips-ci20_defconfig (https://download.01.org/0day-ci/archive/20230727/202307270959.9Ol82L9D-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270959.9Ol82L9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270959.9Ol82L9D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:782,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:19,
                    from include/linux/acpi.h:26,
                    from include/linux/irqchip.h:14,
                    from arch/mips/jz4740/setup.c:19:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   arch/mips/jz4740/setup.c: At top level:
>> arch/mips/jz4740/setup.c:84:13: warning: no previous prototype for 'arch_init_irq' [-Wmissing-prototypes]
      84 | void __init arch_init_irq(void)
         |             ^~~~~~~~~~~~~
--
   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/clk.h:17,
                    from drivers/mtd/nand/jz4780_bch.c:13:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   drivers/mtd/nand/jz4780_bch.c: In function 'jz4780_bch_read_parity':
>> drivers/mtd/nand/jz4780_bch.c:138:26: warning: this statement may fall through [-Wimplicit-fallthrough=]
     138 |                 dest8[2] = (val >> 16) & 0xff;
         |                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/jz4780_bch.c:139:9: note: here
     139 |         case 2:
         |         ^~~~
   drivers/mtd/nand/jz4780_bch.c:140:26: warning: this statement may fall through [-Wimplicit-fallthrough=]
     140 |                 dest8[1] = (val >> 8) & 0xff;
         |                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/jz4780_bch.c:141:9: note: here
     141 |         case 1:
         |         ^~~~


vim +/arch_init_irq +84 arch/mips/jz4740/setup.c

0e81db8f5b1abd Paul Burton 2015-05-24  83  
0e81db8f5b1abd Paul Burton 2015-05-24 @84  void __init arch_init_irq(void)

:::::: The code at line 84 was first introduced by commit
:::::: 0e81db8f5b1abd7245e13b585458ea2fb9826bdd MIPS: JZ4740: Move arch_init_irq out of arch/mips/jz4740/irq.c

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
