Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D3DDDA6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686303364; x=1717839364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rk7chkn2Ajk2IUmRC+vui8JKJ3e/M+H0BoW4sdyq49Q=;
  b=hoDI9jNIhtqhDkk3ERrNkkccY4v5oQiqd6xkjF+m+eHLmtc+07RvUw6M
   rM0aFttWyNTpnNoE5q7dBU/1vPIxvb0fDLfQE4xHSSCaTr1fam5R6n6WM
   pR5mFhe61JTrOmKrkYTMhe0Vrw5PJH6rVJSZtSyyH3/GeTRLB8ZwO3W/8
   YK4juEWlq+pOGxcRaAAmS5xFmHB9bSD0D5Gr1MeFvjoBpBbhTCSRP1ipD
   FIdT75LUqxfNVWUa0NIfEbUkg/ScLOBY4fv2KCgqHHZk7cW2G1vYjyoa6
   K98B01hdSyLC6ScKZR79pJMX2qoipmvSquOKnJd+3yc9AQqcqcGiks797
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360918491"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="360918491"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713449337"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713449337"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Jun 2023 02:36:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7YXJ-0008to-1m;
	Fri, 09 Jun 2023 09:36:01 +0000
Date: Fri, 9 Jun 2023 17:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/include/asm/hw_irq.h:494 mtmsr_isync_irqsafe() warn:
 inconsistent indenting
Message-ID: <202306091705.0mLF1ntp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33f2b5785a2b6b0ed1948aafee60d3abb12f1e3a
commit: 0fa6831811f62cfc10415d731bcf9fde2647ad81 powerpc/64: Fix msr_check_and_set/clear MSR[EE] race
date:   8 months ago
config: powerpc-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091705.0mLF1ntp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091705.0mLF1ntp-lkp@intel.com/

New smatch warnings:
arch/powerpc/include/asm/hw_irq.h:494 mtmsr_isync_irqsafe() warn: inconsistent indenting

Old smatch warnings:
arch/powerpc/kernel/process.c:445 giveup_all() warn: bitwise AND condition is false here
arch/powerpc/kernel/process.c:587 save_all() warn: bitwise AND condition is false here

vim +494 arch/powerpc/include/asm/hw_irq.h

   473	
   474	static inline unsigned long mtmsr_isync_irqsafe(unsigned long msr)
   475	{
   476	#ifdef CONFIG_PPC64
   477		if (arch_irqs_disabled()) {
   478			/*
   479			 * With soft-masking, MSR[EE] can change from 1 to 0
   480			 * asynchronously when irqs are disabled, and we don't want to
   481			 * set MSR[EE] back to 1 here if that has happened. A race-free
   482			 * way to do this is ensure EE is already 0. Another way it
   483			 * could be done is with a RESTART_TABLE handler, but that's
   484			 * probably overkill here.
   485			 */
   486			msr &= ~MSR_EE;
   487			mtmsr_isync(msr);
   488			irq_soft_mask_set(IRQS_ALL_DISABLED);
   489			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
   490		} else
   491	#endif
   492			mtmsr_isync(msr);
   493	
 > 494		return msr;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
