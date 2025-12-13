Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C171A285
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 23:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765666950; cv=none; b=JxWCqDEdfQQMTkesg1TFPGFbPSK3LNutcLWTn+M3GbrTnBmPhPcaSnUpJXAU5vfluFwRy4HR1gevglZlYJh8KhhGfHgDCzi/NIrIBNcPwtNkLJtZoqQVYbam8739kFXwIZNVbI3sBFgMOd9x1up2GzVA2GyLP9pnT2TarCpkKj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765666950; c=relaxed/simple;
	bh=6Yw6IkV/Nzb3dxGlVjWJAkJvnvvNhr89Tmr5gJbxEOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=icXNEb3pay3gPVzKrY7r2jEH09w6Rzn37FOQhhD6pb9O2PApaf7bJscVE5iahUvsq1XulrPzsgVWi9fo7UTUYCkwu4kkiSqvpcKjwQbD1ITMmHkxkcFZL3aqLKD0Q2QcZentvUShxMWaOzt74YgmDqgJJHeWgo7yPA2sGpROApg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldATnpKJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldATnpKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765666949; x=1797202949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Yw6IkV/Nzb3dxGlVjWJAkJvnvvNhr89Tmr5gJbxEOM=;
  b=ldATnpKJRSRvFa4k8DTaWFnvZ8YcSYvH5FwSWkht81URKZZgJX36GP/F
   zZpM2VFV2aDCNboWUOUbAcX1XHCsndoHNOU1Iz3vZwu2dADZ3OdFmXh1E
   M+rU+cT9iI1NEP04SyvPSVxzKxzVY+otjpnqeoBmgbaA93hps3f1yfusA
   f9oPEUBbXLuU9U6ncoVTH2G0m2YrksXbskr2dVwFpSyEjIZct20nDIjWx
   1zlK3nI284aGKeFHkdhNaiITu58YPXguA/CSZareRIv9Mqv8BRJVtE9kl
   qv6jJOOmNh3coKQ18XqdgmRxxRro/BSMWwpF3cuKDs5T+USRmvn8uyXw2
   A==;
X-CSE-ConnectionGUID: coTi3tbDQ1alx5l+P1Z2sw==
X-CSE-MsgGUID: vGGFoJ1MSKSf0SpR5Ges+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90277405"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="90277405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:02:29 -0800
X-CSE-ConnectionGUID: IdPBiE2cTyaVqlm7xuLR3w==
X-CSE-MsgGUID: LGfwVM65SHmh3ju5QZxJwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196470540"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Dec 2025 15:02:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYd6-000000008I3-1q6h;
	Sat, 13 Dec 2025 23:02:24 +0000
Date: Sun, 14 Dec 2025 07:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Subject: arch/sh/kernel/cpu/sh4/../sh3/../../entry-common.S:85: Warning:
 overflow in branch to __restore_all; converted into longer instruction
 sequence
Message-ID: <202512140648.pAbemH3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: f74f8bb246cf22f27752977da62079cb615f55b2 rv: Add rtapp_sleep monitor
date:   5 months ago
config: sh-randconfig-002-20251214 (https://download.01.org/0day-ci/archive/20251214/202512140648.pAbemH3J-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140648.pAbemH3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140648.pAbemH3J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/kernel/cpu/sh4/../sh3/../../entry-common.S: Assembler messages:
>> arch/sh/kernel/cpu/sh4/../sh3/../../entry-common.S:85: Warning: overflow in branch to __restore_all; converted into longer instruction sequence
   arch/sh/kernel/cpu/sh4/../sh3/../../entry-common.S:357: Warning: overflow in branch to syscall_exit_work; converted into longer instruction sequence
   arch/sh/kernel/cpu/sh4/../sh3/../../entry-common.S:360: Warning: overflow in branch to syscall_exit_work; converted into longer instruction sequence


vim +85 arch/sh/kernel/cpu/sh4/../sh3/../../entry-common.S

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
