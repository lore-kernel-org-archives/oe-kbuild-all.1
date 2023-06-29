Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0D310ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 01:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688001064; x=1719537064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nA+ut5m4/RLEvLp/jVxSS0JnpcSvDicHrRwAHhXtNFQ=;
  b=NiJMupWctMty5Qo170lRa52MHzA/L8C2zwTDKPq9EqpL3g8bYnOmne8O
   X9DmFwjeZ6+r6xZOKDW6zfEEx0UJ7q1umryM51zK14xX0UPPYfuH7ZTGR
   o1+3v2yCeyJqzW3zCFl/+leeihnbWfEk0wss1D+7dHfcl2zPP/Aj+0rRw
   r0vPPKRLySF9As8PilWDeM0dqfxbzWESbX47SPaKiW+0FV/6O/XdGzUUX
   7eUwpIEIV/D7zqG0OYunQn34Ms1JiD5CsZJF8IrV95EU50yD4Z/kU65RB
   CtX1pz/pgSQggbLsJpFxNXy9WMpbY221bQPnbKO65bInUqw++wqVM61vL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="425667912"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="425667912"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 18:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="861731127"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="861731127"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 18:11:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEgBZ-000DeN-1E;
	Thu, 29 Jun 2023 01:11:01 +0000
Date: Thu, 29 Jun 2023 09:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 22/32] drivers/eisa/eisa-bus.c:436:19:
 error: conflicting types for 'eisa_init'; have 'int(void)'
Message-ID: <202306290952.UByfBLVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   214047a456ac7f6ea80f532dd98c81f5d555c8db
commit: 1de0c3dc65777c7dc433217ae9060d739420ce5c [22/32] parisc: Move function declarations to header file
config: parisc-randconfig-r013-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290952.UByfBLVv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290952.UByfBLVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290952.UByfBLVv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/eisa/eisa-bus.c:436:19: error: conflicting types for 'eisa_init'; have 'int(void)'
     436 | static int __init eisa_init(void)
         |                   ^~~~~~~~~
   In file included from arch/parisc/include/asm/spinlock.h:7,
                    from arch/parisc/include/asm/atomic.h:22,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from drivers/eisa/eisa-bus.c:8:
   arch/parisc/include/asm/processor.h:325:13: note: previous declaration of 'eisa_init' with type 'void(void)'
     325 | extern void eisa_init(void);
         |             ^~~~~~~~~


vim +436 drivers/eisa/eisa-bus.c

^1da177e4c3f41 Linus Torvalds                2005-04-16  435  
^1da177e4c3f41 Linus Torvalds                2005-04-16 @436  static int __init eisa_init(void)
^1da177e4c3f41 Linus Torvalds                2005-04-16  437  {
^1da177e4c3f41 Linus Torvalds                2005-04-16  438  	int r;
^1da177e4c3f41 Linus Torvalds                2005-04-16  439  
33fd797b3e2c6a Thadeu Lima de Souza Cascardo 2010-03-05  440  	r = bus_register(&eisa_bus_type);
33fd797b3e2c6a Thadeu Lima de Souza Cascardo 2010-03-05  441  	if (r)
^1da177e4c3f41 Linus Torvalds                2005-04-16  442  		return r;
^1da177e4c3f41 Linus Torvalds                2005-04-16  443  
^1da177e4c3f41 Linus Torvalds                2005-04-16  444  	printk(KERN_INFO "EISA bus registered\n");
^1da177e4c3f41 Linus Torvalds                2005-04-16  445  	return 0;
^1da177e4c3f41 Linus Torvalds                2005-04-16  446  }
^1da177e4c3f41 Linus Torvalds                2005-04-16  447  

:::::: The code at line 436 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
