Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FB20AF6C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433539; cv=none; b=WkPam1LavvVlKBH0YOnhjlXawUaXZi0DCwlzMCOP9cJtfVDB3G0UeZ958gN5IZKGYh+9ZLcw7ZNp6/nr9E24zQ6cb2HBQqtOSj8a7nNJGWcH4TsVkdaN/7iqFjKJUOWZEVrSKV2KXJmn367y7n49IcdeZ+mS442vbJLpK+D6Y/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433539; c=relaxed/simple;
	bh=awRQUFB4zgU0vF4qll2WOidShhGlXmj+N8PLLEqyIvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mAu+EHurYxFA5AJ1C7pot010eNmEBNkMurVdSVpLa+lHLxzsN3uePSez80Yp9jbITts66C44baft6yi+SndEIfBwDWoVK/UgvB66Qu7VmiGp9ZMl5d1EGvEBqSuq9y/vYZnZcCiB1t1+CotkET9s9gchlVfBOu7hVP3dMZlpT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9otpPiI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9otpPiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739433538; x=1770969538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awRQUFB4zgU0vF4qll2WOidShhGlXmj+N8PLLEqyIvQ=;
  b=O9otpPiIR151r350kzz17hya+ts4yTmzrkeS7R+jmAlLu+wpDLsaAkqq
   N/JckpmNzwnOVwkPifhCokN482m5iog52zgR1zvtiCIsEQXpCVSOfgGFh
   cjNux/0kb407kBPnea7xEajUTRQlXzxjgyLceF6uneCKQ6sLhzNgnYLsV
   7xxoT0z9urEwf5t1hqQyGqRFi3MdbkakarnY2qSn0N+0Mtfc+3NXMjwgX
   1hn1+m54bTiQTXWIXIdK1nHebfIqJ+dcl1RjX8DUDRjMSLTSOvgeT3eRO
   BZ/rrGKkJ7ueeJt9cHhOgdr4w5FklMaEnEi0Obif8QV9EZYotz7hVgpbY
   Q==;
X-CSE-ConnectionGUID: SADQNkrESHaylrbmgmhWcA==
X-CSE-MsgGUID: +eIy05WtTCmfA6PmP56cQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39823962"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39823962"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 23:58:58 -0800
X-CSE-ConnectionGUID: w32xV4S9SBqlvpI25B7+OQ==
X-CSE-MsgGUID: FvAriCKbSTe782fK3l9W8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113551763"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Feb 2025 23:58:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiU7a-0016ky-0a;
	Thu, 13 Feb 2025 07:58:54 +0000
Date: Thu, 13 Feb 2025 15:58:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [linux-next:master 3237/3437]
 arch/m68k/include/asm/irqflags.h:44:29: error: implicit declaration of
 function 'hardirq_count'
Message-ID: <202502131523.z4DBMW40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b7a883c7f4de1ee5040bd1c32aabaafde54d209
commit: fe348e05890776897acb931eb39987fcef0f6f65 [3237/3437] mm: security: Check early if HARDENED_USERCOPY is enabled
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250213/202502131523.z4DBMW40-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131523.z4DBMW40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131523.z4DBMW40-lkp@intel.com/

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
