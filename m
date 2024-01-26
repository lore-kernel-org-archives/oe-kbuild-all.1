Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07D1CD37
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706280989; cv=none; b=HRrB5nAMb8RTE90jONcqUbdyep8Fmrl946ynSWpNV6dg5jYU/rJCqWAMKMTmuXY0z6j65/wzXXDlSgJs+KkHTzUdZFV/cZW9oEYhzntLUQthGoFPRAMRA0UguGGHYH6aUJEP7PL0ezPXrrCIyMaABAHegIOwfQ7vH8Uu0lCnYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706280989; c=relaxed/simple;
	bh=LrmC7cqkU3gaK6P35QOYKHzNpNTTxreTX0mv+KSiEOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5BFCtBanIRZTHYZVFxfak7pOSUAqgvY+hiVULZTvOP1LVeg3aEHvFBzIMkzGGocI95EazPA3Gda6Zz3KTKWzRBj+1/OlzvGZg/4LUcKU7IyXgOA4maguR6PpNCK+xqzeccPy2jTlYwhB1UdkmXkYjmuV3kpU5EIaJvPAPzY2Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzI0CLcA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzI0CLcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706280987; x=1737816987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrmC7cqkU3gaK6P35QOYKHzNpNTTxreTX0mv+KSiEOc=;
  b=hzI0CLcASQPMYnBEGwIoF6bjz+1rramCm86iptbHmekkCH21wGMkKuUw
   VIPzFF80TWCG6mEMBIZPQbqZkqzFFqic3kvbssRJ2yhx8DMWeCKi0XHLE
   rv/MEQAMlCCvMB2IbBFQW2P6Yz4ZopXItoDbuBuQ4geCzcG9fV+bMm0El
   nzcv86U1TmAGcEtwuRePPfmBMRsiMsimqA5FyZDBYd8x8QnKwI+4rNcUd
   Vo5DtzsCDbM/34iUrZ+kmC4ijYV++4b14mFh55Tc4PbNOHd/RTi1f88C+
   f5E/10ehPKYcNyhgNhNo0qP9Hx64jlB8g4HAybMqywBZJZkyWFobEv7+F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2357016"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2357016"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 06:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877415841"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="877415841"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2024 06:56:22 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTNcy-00016g-2W;
	Fri, 26 Jan 2024 14:56:20 +0000
Date: Fri, 26 Jan 2024 22:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <keescook@chromium.org>
Subject: [kees:for-next/hardening 2/2] drivers/misc/lkdtm/bugs.c:302:1:
 warning: 'noreturn' function does return
Message-ID: <202401262204.wUFKRYZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
head:   edb6538da3df83806fffcfc1b873d0895c81b9e8
commit: edb6538da3df83806fffcfc1b873d0895c81b9e8 [2/2] lkdtm/bugs: Adjust lkdtm_HUNG_TASK() to avoid tail call optimization
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240126/202401262204.wUFKRYZF-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401262204.wUFKRYZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401262204.wUFKRYZF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `__kernel_entry':
>> (.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
   arch/mips/kernel/head.o: in function `smp_bootstrap':
>> (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x10): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x18): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0x50): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x58): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x90): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x98): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0xd0): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xd8): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x108): additional relocation overflows omitted from the output
--
   drivers/misc/lkdtm/bugs.c: In function 'lkdtm_HUNG_TASK':
>> drivers/misc/lkdtm/bugs.c:302:1: warning: 'noreturn' function does return
     302 | }
         | ^


vim +/noreturn +302 drivers/misc/lkdtm/bugs.c

00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  296  
edb6538da3df83 drivers/misc/lkdtm/bugs.c Douglas Anderson 2024-01-22  297  static void __noreturn lkdtm_HUNG_TASK(void)
00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  298  {
00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  299  	set_current_state(TASK_UNINTERRUPTIBLE);
00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  300  	schedule();
edb6538da3df83 drivers/misc/lkdtm/bugs.c Douglas Anderson 2024-01-22  301  	BUG_ON(1);
00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26 @302  }
00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  303  

:::::: The code at line 302 was first introduced by commit
:::::: 00f496c416122e7f5a572a4511cf87c7240ba761 lkdtm: split remaining logic bug tests to separate file

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
