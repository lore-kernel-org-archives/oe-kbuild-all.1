Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B24F17C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 01:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687397666; x=1718933666;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jLxndlNezBo9OFWuxvpt54WQKderk0XkhP4wRi3CvjE=;
  b=KwMjto+0zeu0ILF13oSd6ztRP/lA57BtKXmpViIRcbzfe0Qf7mdwJUx/
   VjvPp+JfJ78wJpqJUKzqi0QHm7+KOhNm+FxrG7DpslmEgwC/KmtBwmcOy
   N3yDyNaU66PmLiBnsqrUIZXWPSktLYuCoitFnH36Eqxc3So95PNbs4fqE
   ogNaYqViiv7dqtmDim+oTXIxU2j0kK1O7RpJRv9wqcLvxiqc1exCrTyre
   O8eQsXcAXbZVrgw6d9uwbxCFdzA2PpbzmbIfUmIrEX7Jc5+3BM+bBTNlk
   pSlk0yDq9DJG2e9DHT/WW7mzWSp9fc6hjl4rTISRsPr9Zavr3LK01XvVr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="424026461"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="424026461"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 18:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804591909"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="804591909"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 18:34:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC9DM-0007ED-0Q
	for oe-kbuild-all@lists.linux.dev;
	Thu, 22 Jun 2023 01:34:24 +0000
Date: Thu, 22 Jun 2023 09:33:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2251/26045]
 kernel/irq_work.c:52:13: warning: no previous prototype for function
 'irq_local_work_raise'
Message-ID: <202306220945.JSgMZv0j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ef1fa9c790e4ab135c9beb006af1de69d2d48cd1
commit: 2d5253bea505b64cf79922d14e34f1411e1b9b95 [2251/26045] genirq: irq_pipeline: add IRQ pipeline core
config: hexagon-randconfig-r035-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220945.JSgMZv0j-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220945.JSgMZv0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220945.JSgMZv0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq_work.c:45:13: warning: no previous prototype for function 'arch_irq_work_raise' [-Wmissing-prototypes]
      45 | void __weak arch_irq_work_raise(void)
         |             ^
   kernel/irq_work.c:45:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      45 | void __weak arch_irq_work_raise(void)
         | ^
         | static 
>> kernel/irq_work.c:52:13: warning: no previous prototype for function 'irq_local_work_raise' [-Wmissing-prototypes]
      52 | void __weak irq_local_work_raise(void)
         |             ^
   kernel/irq_work.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | void __weak irq_local_work_raise(void)
         | ^
         | static 
   2 warnings generated.


vim +/irq_local_work_raise +52 kernel/irq_work.c

    44	
  > 45	void __weak arch_irq_work_raise(void)
    46	{
    47		/*
    48		 * Lame architectures will get the timer tick callback
    49		 */
    50	}
    51	
  > 52	void __weak irq_local_work_raise(void)
    53	{
    54		arch_irq_work_raise();
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
