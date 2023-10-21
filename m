Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C1820B10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFu/PaKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697925449; x=1729461449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H9oJf5rBwbt1fhd10EZ57tspUzSoYsOwuGYiIaR+las=;
  b=YFu/PaKNAlordz6e0E9QqmUHLCxjA/OuUT67j19pcp1RcZSw5vFTXV30
   wj0G9HO/kP5fZ+H9jETxh+f8EHEMLm97l+90NBwbZCmbjF1bWHJKgnQlv
   EkrAQPjIeHDdVSe8pEuYLbehb9suYDBWTol5hTdYF3YI5yqjpTnpQ21Ax
   vIZJaYDnsOb36sRlMR0BL4+zVBLVJ78qzZthxmXZN1IPWTRHstEqcF9KG
   i3BSU87h2eZyHrcLdpY0j6A35Z1qK6aTThtiYG18FMnUrgCibRF+4/xci
   MBnPuN6BomCE22bUXmrS6Pt1QXvBXqtOPy2g8DSuZMFKmM7zlBU96adzN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8223122"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="8223122"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 14:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="848424142"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="848424142"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2023 14:57:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quJyF-0005Gs-20;
	Sat, 21 Oct 2023 21:57:23 +0000
Date: Sun, 22 Oct 2023 05:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: arch/x86/kernel/apic/apic.c:2135: warning: Function parameter or
 member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ'
Message-ID: <202310220541.IoPM2U3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d537ae43f8a107761fb5a85c3f0cfce5ca79bcb1
commit: fa5e5c409213265da8a188b4a5e4e641b1382eb4 x86/entry: Use idtentry for interrupts
date:   3 years, 4 months ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231022/202310220541.IoPM2U3C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220541.IoPM2U3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220541.IoPM2U3C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/apic.c:2135: warning: Function parameter or member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ'
   arch/x86/kernel/apic/apic.c:2135: warning: Excess function parameter 'regs' description in 'DEFINE_IDTENTRY_IRQ'
   arch/x86/kernel/apic/apic.c:2135: warning: Excess function parameter 'vector' description in 'DEFINE_IDTENTRY_IRQ'


vim +2135 arch/x86/kernel/apic/apic.c

c0104d38a740b25 arch/x86/kernel/apic/apic.c Yinghai Lu      2010-12-07  2118  
^1da177e4c3f415 arch/x86_64/kernel/apic.c   Linus Torvalds  2005-04-16  2119  /*
0e078e2f5060e06 arch/x86/kernel/apic_64.c   Thomas Gleixner 2008-01-30  2120   * Local APIC interrupts
^1da177e4c3f415 arch/x86_64/kernel/apic.c   Linus Torvalds  2005-04-16  2121   */
^1da177e4c3f415 arch/x86_64/kernel/apic.c   Linus Torvalds  2005-04-16  2122  
633260fa143bbed arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2123  /**
fa5e5c409213265 arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2124   * spurious_interrupt - Catch all for interrupts raised on unused vectors
633260fa143bbed arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2125   * @regs:	Pointer to pt_regs on stack
fa5e5c409213265 arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2126   * @vector:	The vector number
633260fa143bbed arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2127   *
633260fa143bbed arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2128   * This is invoked from ASM entry code to catch all interrupts which
633260fa143bbed arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2129   * trigger on an entry which is routed to the common_spurious idtentry
633260fa143bbed arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2130   * point.
633260fa143bbed arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2131   *
633260fa143bbed arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2132   * Also called from smp_spurious_apic_interrupt().
0e078e2f5060e06 arch/x86/kernel/apic_64.c   Thomas Gleixner 2008-01-30  2133   */
fa5e5c409213265 arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2134  DEFINE_IDTENTRY_IRQ(spurious_interrupt)
^1da177e4c3f415 arch/x86_64/kernel/apic.c   Linus Torvalds  2005-04-16 @2135  {
dc1528dd864a0b7 arch/x86/kernel/apic_64.c   Yinghai Lu      2008-08-24  2136  	u32 v;
dc1528dd864a0b7 arch/x86/kernel/apic_64.c   Yinghai Lu      2008-08-24  2137  
61069de7a3252be arch/x86/kernel/apic/apic.c Thomas Gleixner 2017-08-28  2138  	trace_spurious_apic_entry(vector);
61069de7a3252be arch/x86/kernel/apic/apic.c Thomas Gleixner 2017-08-28  2139  
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2140  	inc_irq_stat(irq_spurious_count);
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2141  
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2142  	/*
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2143  	 * If this is a spurious interrupt then do not acknowledge
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2144  	 */
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2145  	if (vector == SPURIOUS_APIC_VECTOR) {
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2146  		/* See SDM vol 3 */
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2147  		pr_info("Spurious APIC interrupt (vector 0xFF) on CPU#%d, should never happen.\n",
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2148  			smp_processor_id());
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2149  		goto out;
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2150  	}
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2151  
0e078e2f5060e06 arch/x86/kernel/apic_64.c   Thomas Gleixner 2008-01-30  2152  	/*
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2153  	 * If it is a vectored one, verify it's set in the ISR. If set,
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2154  	 * acknowledge it.
0e078e2f5060e06 arch/x86/kernel/apic_64.c   Thomas Gleixner 2008-01-30  2155  	 */
2414e021ac8d588 arch/x86/kernel/apic/apic.c Jan Beulich     2014-11-03  2156  	v = apic_read(APIC_ISR + ((vector & ~0x1f) >> 1));
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2157  	if (v & (1 << (vector & 0x1f))) {
fa5e5c409213265 arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2158  		pr_info("Spurious interrupt (vector 0x%02x) on CPU#%d. Acked\n",
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2159  			vector, smp_processor_id());
0e078e2f5060e06 arch/x86/kernel/apic_64.c   Thomas Gleixner 2008-01-30  2160  		ack_APIC_irq();
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2161  	} else {
fa5e5c409213265 arch/x86/kernel/apic/apic.c Thomas Gleixner 2020-05-21  2162  		pr_info("Spurious interrupt (vector 0x%02x) on CPU#%d. Not pending!\n",
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2163  			vector, smp_processor_id());
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2164  	}
f8a8fe61fec8006 arch/x86/kernel/apic/apic.c Thomas Gleixner 2019-06-28  2165  out:
2414e021ac8d588 arch/x86/kernel/apic/apic.c Jan Beulich     2014-11-03  2166  	trace_spurious_apic_exit(vector);
0e078e2f5060e06 arch/x86/kernel/apic_64.c   Thomas Gleixner 2008-01-30  2167  }
c4d58cbd158dc9b arch/x86/kernel/apic_64.c   Thomas Gleixner 2007-10-12  2168  

:::::: The code at line 2135 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
