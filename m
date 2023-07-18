Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8915AD8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 17:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689702258; x=1721238258;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+qAjGMd3rHIqsR3YbpxV2FYrJLanBqmA3kQAv1VgQMg=;
  b=UjJUHc/wJmsU6ZXdBgNw1RZuuHdtkSOJKsG5vTP7BoXvjHUMDD47Phch
   yTXdvLrZNxABHI7/iyG8EbCfBvhilzYc+C0Wgr2AgbIlsri2CUQmY802a
   ZKrZhCTOQTA8j+EEPz4YJRJlstZd80ygEdfbTlu/2MPgRyCa8+hDv0NCW
   6jBQL5pGxUMfNOgpCq7fsNynEpmVjqH1sOn1dYthHjwOUfmosntNkufKc
   15OL8exPFAfL984SembYxegkNBrClPVq6KD3pr488yCbsqwgO3sBsZ9cw
   sVGQ6IqZ3Nhb/F8SsAOPkOlXUJ35oeAPOSybBKzMmod6v4hYg9xzV6Oj5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="363731127"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="363731127"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 10:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867188677"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2023 10:44:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLokB-00033D-35
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Jul 2023 17:44:15 +0000
Date: Wed, 19 Jul 2023 01:43:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2308/26803]
 arch/x86/kernel/apic/apic.c:2201: warning: expecting prototype for
 spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ_PIPELINED()
 instead
Message-ID: <202307190126.1rL86mQV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   9ebe966c9db2389fa11b6997119b22b7374fd44d
commit: 410d2c33dc6ffc875be6b6beecee5be798431269 [2308/26803] x86: irq_pipeline: add IRQ pipeline core
config: i386-randconfig-r035-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190126.1rL86mQV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190126.1rL86mQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190126.1rL86mQV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/apic/apic.c:2201: warning: Function parameter or member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ_PIPELINED'
>> arch/x86/kernel/apic/apic.c:2201: warning: expecting prototype for spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ_PIPELINED() instead


vim +2201 arch/x86/kernel/apic/apic.c

c4d58cbd158dc9 arch/x86/kernel/apic_64.c   Thomas Gleixner 2007-10-12  2190  
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2191  /**
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2192   * spurious_interrupt - Catch all for interrupts raised on unused vectors
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2193   * @regs:	Pointer to pt_regs on stack
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2194   * @vector:	The vector number
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2195   *
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2196   * This is invoked from ASM entry code to catch all interrupts which
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2197   * trigger on an entry which is routed to the common_spurious idtentry
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2198   * point.
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2199   */
410d2c33dc6ffc arch/x86/kernel/apic/apic.c Philippe Gerum  2019-04-24  2200  DEFINE_IDTENTRY_IRQ_PIPELINED(spurious_interrupt)
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10 @2201  {
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2202  	handle_spurious_interrupt(vector);
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2203  }
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2204  

:::::: The code at line 2201 was first introduced by commit
:::::: 3c5e0267ec3e6ed7d3f1793273cbf0beb4f86a74 x86/apic: Split out spurious handling code

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
