Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347C236C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 02:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674355565; x=1705891565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7JxessS1C5MOQ+njwK7vKSrJWGrwNujGmHN306VwfRI=;
  b=JLJDloRkxT6Vsy8iKj9Vu3R2fCtP0Jqu+5gTOrQGww8hfKTfDCfwEvkg
   vUH+ASGpT8MTk/q35eL08zVYAPUrWMyLyyl7v5fVndx9HtEFubYuXrVsy
   FZngcZCA8UejOp6zEYoyOT6S7kW2xxnNoL71NfKtbzdv8YQqQz2nd9jnK
   69LK1/VJBgntVcFAzgVKP/+I87Z/Oc4ScvbQxO0L2A4Sg3QrGCw/b1n0F
   wFp+REcQmQTIlxEC1duFC0jycQvjiw6BIvoQpna06N89WQ5WZqB0mAheT
   PkZE5EMGde/jg6yfpnpWnU5PRn5cVw/UyKaCk5wEXoAyWePKNN702Z0Yt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="323551886"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="323551886"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 18:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="610903178"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="610903178"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Jan 2023 18:46:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJQMr-0004h2-2z;
	Sun, 22 Jan 2023 02:46:01 +0000
Date: Sun, 22 Jan 2023 10:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/include/asm/hw_irq.h:494 mtmsr_isync_irqsafe() warn:
 inconsistent indenting
Message-ID: <202301221036.HWXK8O00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
commit: 0fa6831811f62cfc10415d731bcf9fde2647ad81 powerpc/64: Fix msr_check_and_set/clear MSR[EE] race
date:   4 months ago
config: powerpc-randconfig-m031-20230121 (https://download.01.org/0day-ci/archive/20230122/202301221036.HWXK8O00-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

smatch warnings:
arch/powerpc/include/asm/hw_irq.h:494 mtmsr_isync_irqsafe() warn: inconsistent indenting

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
https://github.com/intel/lkp-tests
