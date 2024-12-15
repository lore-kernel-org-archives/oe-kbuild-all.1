Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446801114
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 00:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734223486; cv=none; b=efmV0hJpTkZLufTmKyfyfeMlMu+u8bojE/JXtAZeU2EbJj/QVTbLTUzhnR5WfrY9FAyxt+VDBWejxO6UqN8ocBrTy4XMduKPJPrIKv2TW9Rq+wdvszQ8Xva198B86omGH1qomJGH9p32wBvl1IojWJZQt+n8shAJOjF2chFUor4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734223486; c=relaxed/simple;
	bh=QrHFSg+Zn8/fYe668R+Z7k/wyvoIrZ8tNVGAT2B4t0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOuvIOUbdTwQHtJNuwDryoIXpxhC9DUnmedS6BteLcpWsExOMNpDWiREaD1gfNyTb2H2mZnNKIaN20Ug/mV1xZCjEqxEL3cWtFryJO/UadED7sRr53DmJAKFf7guxTJ0dUZu6q7QNsNUCfw0aFAB+Eec77mzqeN2U62yDaUrOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idVzbzxN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idVzbzxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734223484; x=1765759484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrHFSg+Zn8/fYe668R+Z7k/wyvoIrZ8tNVGAT2B4t0c=;
  b=idVzbzxNsdC+HbpwQYAfhkzMGZhFsVgaFuZAWk6nF/uH0T9TjIh2TWVe
   ZntsLJLAf3G6wZQtiVUKNbC6vqgbI+jpPBiSnpFaJcYWYzsFWvbvaO1UC
   Jo2AogZDK+pgxjf83AURlkNE7Mg4dSnsC4fQeUEjjSjhul/4xI2ZHwnEh
   oo3qAliF76gGGewROZ+ghDE7fd7KlP+848gkW2A399BTBrhRxCugIYSvF
   8Xkh5VXBsR/RYk+7CxuY6R+mTOBXiOyxLS2hWYuyMEUTjZHz1maWm5hT9
   GIRSpUcNYePXWoBxKn8XNe6JULWycWxlf0TykB1m0bo5ckuh7FjUbsqr7
   w==;
X-CSE-ConnectionGUID: QhHfqD7gSUe4B4/0JeQZ4Q==
X-CSE-MsgGUID: VK0+t8uiT/aDadaqpOQE4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34561368"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34561368"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 16:44:42 -0800
X-CSE-ConnectionGUID: HBORvpPrTXyZQswbP8p7Ig==
X-CSE-MsgGUID: sAHdkY9NRn6Ee5b6edPzQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134210673"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2024 16:44:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMckQ-000DLY-0M;
	Sun, 15 Dec 2024 00:44:38 +0000
Date: Sun, 15 Dec 2024 08:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: arch/x86/kernel/apic/apic.c:2135: warning: Function parameter or
 struct member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ'
Message-ID: <202412150840.1QCL4y44-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a446e965a188ee8f745859e63ce046fe98577d45
commit: fa5e5c409213265da8a188b4a5e4e641b1382eb4 x86/entry: Use idtentry for interrupts
date:   4 years, 6 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241215/202412150840.1QCL4y44-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150840.1QCL4y44-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150840.1QCL4y44-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/apic.c:2135: warning: Function parameter or struct member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ'
>> arch/x86/kernel/apic/apic.c:2135: warning: expecting prototype for spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ() instead


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
