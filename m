Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B72367B67
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783896825; cv=none; b=BQ0k2mHvPDUe9MB1IdaOo2MNlKQBiAojOrYZrbUaqH14jl03PkHFe3aWbAfuRHhUQSfAnfP6St1nASiskv1Sd/JkGykuLUnUxMIcOK7jKG580kesnx2EyH9uNLntg+kqB8aJkvnk8yCjBFBhGDaUQzUsNmLkLiLBdA80fO7SAe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783896825; c=relaxed/simple;
	bh=bBMhJnoXqjrJYbFuvZ7/ZlwIyQ6Uu5qXTV+rBl2yV54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IM22FMzV+r3HPLn1MDW7ztHNcrKxId9yVCu9gI+ARXItuP7BHkB72UkacqrXJJnvKbCrx1MHCfWgpxwwp6yl14HvqvelSh0rlbdSj4lOqKR26sZ2AzuQshPOTXloAtVBEmJTeGXhS2wyJN//HWoP6IQFubG+bQVLsL5sPdt0KFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eERZv4wY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eERZv4wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783896823; x=1815432823;
  h=date:from:to:cc:subject:message-id;
  bh=bBMhJnoXqjrJYbFuvZ7/ZlwIyQ6Uu5qXTV+rBl2yV54=;
  b=eERZv4wYkYmjlSi0Dbl14lKYVl8y+CFdURXEPeXMomAmDF6Q3xG7xwek
   VwniuJS6OwnTtEASkMpTtZChp5bgEHCFBiPYK2d/4S1CNfSYmzQmQMFau
   HdNIsJ3NjDtd6sVS0tcTnyZ7XCSP7fzXC46OwLpQ+04oePHgjOHP5v/jM
   olNqyNNnlxENrhDWqKsVy+/sSPOAN3t2U1B5EnsNvRFg5CX7P9JA/R4dR
   UqzOzNOMXN9Qmyu4kkBuOJ8aaT4D/SjUE6QUXPMb5BQIqga9b8EgwKWMY
   IvLTg/u4kEo+FesKcuVM1D19pDrby+DdQGAeWohTcQh8OUmCJ94y5QrTu
   A==;
X-CSE-ConnectionGUID: BMSu9wMhR3aMDuPzvDZKOg==
X-CSE-MsgGUID: /fhLM0MjRM+pp9EqjPH8Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95109654"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95109654"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 15:53:40 -0700
X-CSE-ConnectionGUID: eDIrKzA9SdiZPJQHpEo+XA==
X-CSE-MsgGUID: 8voYsERcR1acEsSRpkYwCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250980744"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2026 15:53:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj33I-00000000LBc-1kWI;
	Sun, 12 Jul 2026 22:53:36 +0000
Date: Mon, 13 Jul 2026 06:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 59/59]
 arch/openrisc/include/asm/fpu.h:10:30: error: implicit declaration of
 function 'mfspr'
Message-ID: <202607130632.Cfjk4qV6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 0ad363c8e014568032d53fe2c7ab288de68373f4 [59/59] treewide: Remove asm/timex.h includes from generic code
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20260713/202607130632.Cfjk4qV6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130632.Cfjk4qV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130632.Cfjk4qV6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/openrisc/kernel/process.c:39:
   arch/openrisc/include/asm/fpu.h: In function 'save_fpu':
>> arch/openrisc/include/asm/fpu.h:10:30: error: implicit declaration of function 'mfspr' [-Wimplicit-function-declaration]
      10 |         task->thread.fpcsr = mfspr(SPR_FPCSR);
         |                              ^~~~~
   arch/openrisc/include/asm/fpu.h: In function 'restore_fpu':
>> arch/openrisc/include/asm/fpu.h:15:9: error: implicit declaration of function 'mtspr'; did you mean 'mt_prev'? [-Wimplicit-function-declaration]
      15 |         mtspr(SPR_FPCSR, task->thread.fpcsr);
         |         ^~~~~
         |         mt_prev


vim +/mfspr +10 arch/openrisc/include/asm/fpu.h

4dc70e1aadfadf9 Stafford Horne 2024-03-30   6  
4dc70e1aadfadf9 Stafford Horne 2024-03-30   7  #ifdef CONFIG_FPU
4dc70e1aadfadf9 Stafford Horne 2024-03-30   8  static inline void save_fpu(struct task_struct *task)
4dc70e1aadfadf9 Stafford Horne 2024-03-30   9  {
4dc70e1aadfadf9 Stafford Horne 2024-03-30 @10  	task->thread.fpcsr = mfspr(SPR_FPCSR);
4dc70e1aadfadf9 Stafford Horne 2024-03-30  11  }
4dc70e1aadfadf9 Stafford Horne 2024-03-30  12  
4dc70e1aadfadf9 Stafford Horne 2024-03-30  13  static inline void restore_fpu(struct task_struct *task)
4dc70e1aadfadf9 Stafford Horne 2024-03-30  14  {
4dc70e1aadfadf9 Stafford Horne 2024-03-30 @15  	mtspr(SPR_FPCSR, task->thread.fpcsr);
4dc70e1aadfadf9 Stafford Horne 2024-03-30  16  }
4dc70e1aadfadf9 Stafford Horne 2024-03-30  17  #else
4dc70e1aadfadf9 Stafford Horne 2024-03-30  18  #define save_fpu(tsk)			do { } while (0)
4dc70e1aadfadf9 Stafford Horne 2024-03-30  19  #define restore_fpu(tsk)		do { } while (0)
4dc70e1aadfadf9 Stafford Horne 2024-03-30  20  #endif
4dc70e1aadfadf9 Stafford Horne 2024-03-30  21  

:::::: The code at line 10 was first introduced by commit
:::::: 4dc70e1aadfadf968676d983587c6f5d455aba85 openrisc: Move FPU state out of pt_regs

:::::: TO: Stafford Horne <shorne@gmail.com>
:::::: CC: Stafford Horne <shorne@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
