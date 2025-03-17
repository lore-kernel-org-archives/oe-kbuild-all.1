Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744961F3BAC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 20:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742244156; cv=none; b=rFM9uLcoIgr+CmWENT+5x0N/0frvRHZqRf2PaVCWNfniiALYQup5yovqdbYniJ1JQY2lGGoXMj5Ggnc7yOxraG/ibaGCMpVuC6FCSpFBTCblBstbXi2m3A3BhE4Ok4b9lUDNDhsHA09r0MfZjtamf751jUlT+HHEgP1U/rDFbts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742244156; c=relaxed/simple;
	bh=wWFt6Nkm9pKirRZru2+3CHnGUbRBgMhe1Taf8HevkpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6T8zNfKqJywCmtHfYBpuCNfy0CtD4sMHTFYy2XEhY2W2mQuu+++KeQNP18OJtW4kdbQkHvIU+LIBvEh35dVrSCm4HR0SKK2K2gNJIXGTSJ8lMn1KqazHe9X1eLsVr7diy9iEUX0c9VoK4J3ApSMUxnal6VNXx1CIO3w3Z9XBTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkBBuvK+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkBBuvK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742244154; x=1773780154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWFt6Nkm9pKirRZru2+3CHnGUbRBgMhe1Taf8HevkpM=;
  b=NkBBuvK+P7rHlIS3f/JWjcY577GA5vScupAeH6kRVPylMiJSL2EFYF1K
   IqFqOUwkQgZ9CDbtG8u9bHmFtgCn4LEL96Q4zDLOAbx1NV2qxOeCzyEiI
   HCGwllTk9NJmEjaqGQYqvmOsBJ1hxzn+3gSzToO7gAYyQaOyg3L/f+dUp
   q7GHPR54L8N6pHeBNp5V0y93HAUSjKTkh6Fph/4Bs2trbuiIkWGMsLRhz
   4dw+MDws/udF74K7TTPH/vSI/2MxieIoIA2tbS50Nf4aREHx/BpMx7sJ8
   kV1/6EbN5PMLAK71hrmj03MhC+4JiRUwYmcDk+N8ooqURqHtTsaS5419+
   Q==;
X-CSE-ConnectionGUID: oKNr3NrbTZu9VGzFLNV+1g==
X-CSE-MsgGUID: +vwA7k7IToeI9SFVeefxhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54735131"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="54735131"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 13:42:32 -0700
X-CSE-ConnectionGUID: K98qcKYFTF+1Nyta4pMSqw==
X-CSE-MsgGUID: /gdwSXyjS5KD6vWWB27Z4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="153035998"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2025 13:42:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuHHp-000D9Z-06;
	Mon, 17 Mar 2025 20:42:14 +0000
Date: Tue, 18 Mar 2025 04:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 3298/4359] arch/m68k/include/asm/irqflags.h:44:29: error: implicit
 declaration of function 'hardirq_count'
Message-ID: <202503180407.SubcEppP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   0f317f352994cb64676e93a4b91c8c7464f13c98
commit: b2c87200aae5db99ba86065d020ac14a22d22a03 [3298/4359] mm: security: Check early if HARDENED_USERCOPY is enabled
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250318/202503180407.SubcEppP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180407.SubcEppP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180407.SubcEppP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:257,
                    from include/linux/thread_info.h:221,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/processor.h:11,
                    from include/linux/sched.h:13,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/irqflags.h: In function 'arch_local_irq_enable':
>> arch/m68k/include/asm/irqflags.h:44:29: error: implicit declaration of function 'hardirq_count' [-Wimplicit-function-declaration]
      44 |         if (MACH_IS_Q40 || !hardirq_count())
         |                             ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/m68k/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/hardirq_count +44 arch/m68k/include/asm/irqflags.h

df9ee29270c11d David Howells 2010-10-07  31  
df9ee29270c11d David Howells 2010-10-07  32  static inline void arch_local_irq_enable(void)
df9ee29270c11d David Howells 2010-10-07  33  {
df9ee29270c11d David Howells 2010-10-07  34  #if defined(CONFIG_COLDFIRE)
df9ee29270c11d David Howells 2010-10-07  35  	asm volatile (
df9ee29270c11d David Howells 2010-10-07  36  		"move	%/sr,%%d0	\n\t"
df9ee29270c11d David Howells 2010-10-07  37  		"andi.l	#0xf8ff,%%d0	\n\t"
df9ee29270c11d David Howells 2010-10-07  38  		"move	%%d0,%/sr	\n"
df9ee29270c11d David Howells 2010-10-07  39  		: /* no outputs */
df9ee29270c11d David Howells 2010-10-07  40  		:
df9ee29270c11d David Howells 2010-10-07  41  		: "cc", "%d0", "memory");
df9ee29270c11d David Howells 2010-10-07  42  #else
df9ee29270c11d David Howells 2010-10-07  43  # if defined(CONFIG_MMU)
df9ee29270c11d David Howells 2010-10-07 @44  	if (MACH_IS_Q40 || !hardirq_count())
df9ee29270c11d David Howells 2010-10-07  45  # endif
df9ee29270c11d David Howells 2010-10-07  46  		asm volatile (
df9ee29270c11d David Howells 2010-10-07  47  			"andiw %0,%%sr"
df9ee29270c11d David Howells 2010-10-07  48  			:
df9ee29270c11d David Howells 2010-10-07  49  			: "i" (ALLOWINT)
df9ee29270c11d David Howells 2010-10-07  50  			: "memory");
df9ee29270c11d David Howells 2010-10-07  51  #endif
df9ee29270c11d David Howells 2010-10-07  52  }
df9ee29270c11d David Howells 2010-10-07  53  

:::::: The code at line 44 was first introduced by commit
:::::: df9ee29270c11dba7d0fe0b83ce47a4d8e8d2101 Fix IRQ flag handling naming

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
