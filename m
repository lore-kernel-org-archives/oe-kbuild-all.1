Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CED8248F72
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375068; cv=none; b=iuNTlbY19miJHuI4hZizpY1EtiDpsUE/noNn8AUgZSCH7cCh/ILkBoI1aRXYY6oaxF961h2hBPY1n1zUO9o6ZqXQ1KCeOH6/NY6rsEcRxkwSBVZgEodOGLf5MYiPQD8SA7FtSXAhHP6LMhRziRvwo7AZeGh29HipGN3AwDFeLyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375068; c=relaxed/simple;
	bh=mlIJ2m81cPccLlva/ekX4WbZFv9mnMSOHx4VIHZwaSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJ2mbpnbSZjQft7WZqPDflVaP6xLEgId5McVPKAenxlEtNy6lUUx2B1iEoTmigZUdp2rubUruQ1BnrtK7+yY21MX/5DeC6J2/vkTz5hr/8LTRXXvmJmBvZmR91oVI15zaKzEy18nBJYIBqnNfMK/DdljJ66wyMx2+xkoreQysjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfDqigws; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfDqigws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748375066; x=1779911066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mlIJ2m81cPccLlva/ekX4WbZFv9mnMSOHx4VIHZwaSE=;
  b=kfDqigwsDYeACnEZDILWIeILuT99I66DHOBC3KJFdUYR2DAItU7cWQiV
   mq+xj9v96jZvAXlEI1Wn9O1Kbm8r1MKUd7PnXHtKtlBRcJk/UXds0M1hK
   v3OlCgROxp80hZNb6xWrTkodj5hTSZfdvEEkaLdCcg+scc8+pm1RYe/EL
   /5B/su/uiQ0GPzkWj8B9CHZWKHumxgKnTVyfr9e4TmA5nOTHrryC6HpGu
   lMPJBZryoSHcv45idxIERO1fcTMTEwZ5TUSEoXw0T8IFGht3d7xwudMNJ
   3He+sVc2M0w0OCt3NzQ+3MCG6gS/IpmR/aEghmMbr4zWZz5U7o5vg0VGU
   Q==;
X-CSE-ConnectionGUID: j5KA0TZaSzOdwIPMQnlXyQ==
X-CSE-MsgGUID: bWCx7GIjTbGv1BNHKg6r2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54036657"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="54036657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:44:26 -0700
X-CSE-ConnectionGUID: jvnlioVmTa20eBXoueDYjw==
X-CSE-MsgGUID: AH55ATI3QCaOfAnzva3Xrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="148086023"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 May 2025 12:44:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK0Dm-000Uy4-1N;
	Tue, 27 May 2025 19:44:22 +0000
Date: Wed, 28 May 2025 03:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core 2/15] arc-linux-ld:
 kernel/cpu.o:(.bss+0x2c): multiple definition of `housekeeping_flags';
 init/main.o:(.bss+0x28): first defined here
Message-ID: <202505280353.tI7CG7RL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core
head:   5f864154521cea5391361b58372298785bc43639
commit: 1038c66d1274b5fcfd225024b739046f0954e865 [2/15] sched/isolation: Remove housekeeping static key
config: arc-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280353.tI7CG7RL-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280353.tI7CG7RL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280353.tI7CG7RL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arc-linux-ld: kernel/cpu.o:(.bss+0x2c): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/workqueue.o:(.bss+0x210): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/kthread.o:(.bss+0x1c): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/sched/core.o:(.bss+0x10): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/sched/fair.o:(.bss+0xc): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/sched/build_policy.o:(.bss+0x1c): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/sched/build_utility.o:(.bss+0x4): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/irq/manage.o:(.bss+0x10): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/rcu/update.o:(.bss+0xfc): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/rcu/tree.o:(.bss+0xf0): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/time/hrtimer.o:(.bss+0x8): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: kernel/cgroup/cpuset.o:(.bss+0x58): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: mm/vmstat.o:(.bss+0x20): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: drivers/pci/pci-driver.o:(.bss+0x8): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: drivers/char/random.o:(.bss+0x18): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: drivers/base/cpu.o:(.bss+0xc): multiple definition of `housekeeping_flags'; init/main.o:(.bss+0x28): first defined here
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_muldi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_muldi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_udivsi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_udivsi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_divsi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_divsi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_umodsi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_umodsi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_modsi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_modsi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_divmod_tools.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_divmod_tools.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_muldf3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_muldf3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_divsf3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_divsf3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_divdf3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_divdf3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_floatsisf.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_floatsisf.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_fixunsdfsi.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_fixunsdfsi.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_floatunsidf.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_floatunsidf.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_lshrdi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_lshrdi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_ashldi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_ashldi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_ashrdi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_ashrdi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_cmpdi2.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_cmpdi2.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_ucmpdi2.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_ucmpdi2.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_udivdi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_udivdi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_mulsi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_mulsi3.o)
   arc-linux-ld: ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_umulsidi3.o): compiled for a little endian system and target is big endian
   arc-linux-ld: failed to merge target specific data of file ../lib/gcc/arc-linux/13.3.0/arc700/libgcc.a(_umulsidi3.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
