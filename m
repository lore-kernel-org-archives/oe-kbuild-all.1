Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE072D9ECB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645869; cv=none; b=tPXxsQ/kPpAHRqWtZmhqN8g3bYDzFOCDycpGG3jlw+2/A63ZEDBU6sTr0mEpntnKzr6zMjyRsmujlayJCPtV/u2EZ42tJV5goMl6hCfPrXl/p/6hvfBs5BDrNtTkRudKvHteOuGr69gGqLArIc+IJ0ekmJ2uxDgwRDkqCsD/4I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645869; c=relaxed/simple;
	bh=fyy5xL2HYjpjMgowmt0Ib0jn2opONMADP6KyuJ0HPCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQC38/FLkiljnNApESPVj/DURIBfyowiHC3HQmS4a/fdNoTw/NhkuXsIy3kiCIxtpbaoEj7beP8Aez5aE18OOY71Q4a8uZTC9derAlw47O6xnSkfCvq/Oo2xwr6Y/ed6LDCtzyCtEVlDbwxoqwph7F7pMZNZpiI03OujLyy5W3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRcd8GfK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRcd8GfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765645868; x=1797181868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fyy5xL2HYjpjMgowmt0Ib0jn2opONMADP6KyuJ0HPCk=;
  b=BRcd8GfKr40UEeji/443BQfW37GU7sSLaoWOOyDkgQ6IIVUps6lyw18P
   H6PwDLXgwsnM31UleiXA1I9rtaTWIzQ67Si/gBCi0ahjbc4y9WihJGa1I
   TK4cPAHpC3glxEM0R6VRzgeVzRm1NlIvvFN5EL7qK/M9bM7c9O0+dqeoz
   WMVVFkc8J/ybE6sZ7jQakQBxz55FmDdgrJCbEHDEFo9Ew2uLWO3TGdR2v
   dY8HN+oB40L4fuciaBuKXiLrpIw2k67Pokk3TiRwwoq8jgPiNPW9HY5oD
   Y+YQBjLrZAe3N9ZB3k4eAgJAkXGo12asP9Glh9j6qSvbF61gFg0dnxwKJ
   A==;
X-CSE-ConnectionGUID: oDbLO316TNSOFMrt4kFErw==
X-CSE-MsgGUID: gHPjYICHRbWUDIkXx1+3OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90270242"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="90270242"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:11:08 -0800
X-CSE-ConnectionGUID: c/vBWUuUQ2Gc9/ptxYeCWQ==
X-CSE-MsgGUID: Uzj3uptsRVWsLBcYn55uVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197338000"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 09:11:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUT95-000000007xz-1Rrj;
	Sat, 13 Dec 2025 17:11:03 +0000
Date: Sun, 14 Dec 2025 01:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Subject: arch/sh/kernel/cpu/sh3/../../entry-common.S:85: Warning: overflow in
 branch to __restore_all; converted into longer instruction sequence
Message-ID: <202512140138.RJPb6LkH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: f74f8bb246cf22f27752977da62079cb615f55b2 rv: Add rtapp_sleep monitor
date:   5 months ago
config: sh-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140138.RJPb6LkH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140138.RJPb6LkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140138.RJPb6LkH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/kernel/cpu/sh3/../../entry-common.S: Assembler messages:
>> arch/sh/kernel/cpu/sh3/../../entry-common.S:85: Warning: overflow in branch to __restore_all; converted into longer instruction sequence
>> arch/sh/kernel/cpu/sh3/../../entry-common.S:357: Warning: overflow in branch to syscall_exit_work; converted into longer instruction sequence
   arch/sh/kernel/cpu/sh3/../../entry-common.S:360: Warning: overflow in branch to syscall_exit_work; converted into longer instruction sequence


vim +85 arch/sh/kernel/cpu/sh3/../../entry-common.S

de39840646a223 Yoshinori Sato 2006-11-05  63  
de39840646a223 Yoshinori Sato 2006-11-05  64  	.align	2
de39840646a223 Yoshinori Sato 2006-11-05  65  ret_from_exception:
cafb0ddac60556 Matt Fleming   2009-08-02  66  	CFI_STARTPROC simple
cafb0ddac60556 Matt Fleming   2009-08-02  67  	CFI_DEF_CFA r14, 0
cafb0ddac60556 Matt Fleming   2009-08-02  68  	CFI_REL_OFFSET 17, 64
142698282ceb68 Matt Fleming   2010-01-27  69  	CFI_REL_OFFSET 15, 60
cafb0ddac60556 Matt Fleming   2009-08-02  70  	CFI_REL_OFFSET 14, 56
142698282ceb68 Matt Fleming   2010-01-27  71  	CFI_REL_OFFSET 13, 52
142698282ceb68 Matt Fleming   2010-01-27  72  	CFI_REL_OFFSET 12, 48
142698282ceb68 Matt Fleming   2010-01-27  73  	CFI_REL_OFFSET 11, 44
142698282ceb68 Matt Fleming   2010-01-27  74  	CFI_REL_OFFSET 10, 40
142698282ceb68 Matt Fleming   2010-01-27  75  	CFI_REL_OFFSET 9, 36
142698282ceb68 Matt Fleming   2010-01-27  76  	CFI_REL_OFFSET 8, 32
de39840646a223 Yoshinori Sato 2006-11-05  77  	preempt_stop()
de39840646a223 Yoshinori Sato 2006-11-05  78  ENTRY(ret_from_irq)
de39840646a223 Yoshinori Sato 2006-11-05  79  	!
de39840646a223 Yoshinori Sato 2006-11-05  80  	mov	#OFF_SR, r0
de39840646a223 Yoshinori Sato 2006-11-05  81  	mov.l	@(r0,r15), r0	! get status register
de39840646a223 Yoshinori Sato 2006-11-05  82  	shll	r0
de39840646a223 Yoshinori Sato 2006-11-05  83  	shll	r0		! kernel space?
de39840646a223 Yoshinori Sato 2006-11-05  84  	get_current_thread_info r8, r0
de39840646a223 Yoshinori Sato 2006-11-05 @85  	bt	resume_kernel	! Yes, it's from kernel, go back soon
de39840646a223 Yoshinori Sato 2006-11-05  86  

:::::: The code at line 85 was first introduced by commit
:::::: de39840646a223ae13a346048c280b7c871bf56e sh: Exception vector rework and SH-2/SH-2A support.

:::::: TO: Yoshinori Sato <ysato@users.sourceforge.jp>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
