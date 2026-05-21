Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65E2367B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 03:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779333406; cv=none; b=UxsAzY/RpzzsW+hwCW8kExsYJIvTad5X82Brdz+zf2dNmRJQFCcMtsa1qYFZlJcvHxcgVI/iDVZCxLwL73YW+dAXVDWAjA3BVJXl8NUNfmHVY7unKMCn6eRMt/Dx3tmyOiaoFSSFDpigdfqcGgjI+Pka71vnxQkF4ZcGdUP4sEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779333406; c=relaxed/simple;
	bh=ZaAHS1TtaUOGnrhjsoiECBIOZWavP6Rzts8pkw/hpnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PKqtRfYs6qp3SE33dp93XUptNJzHVaUUhOsXwaLVGmOUGm6+7J9VS8p4scWd6YnxzC4ZrB9l7v6sDwryFGxhL0bcXoT7qy7Q6xlgv0fbUP3oC/HkRYJ+UoyPqiAtnzmxR/2XWOVWmMF7q+BSjXtw3SRmPQPGfDhy0V93+/o9RoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcxcwVjg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcxcwVjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779333403; x=1810869403;
  h=date:from:to:cc:subject:message-id;
  bh=ZaAHS1TtaUOGnrhjsoiECBIOZWavP6Rzts8pkw/hpnQ=;
  b=mcxcwVjgwvBWAakhBr7bHylboPJSJIG7qsXSm91a6WhJcI6YaCIHpGCI
   NcNtDe/BXA9kYsAG1q2AYV3EYAfvi/6FXMMyCdOWOmxHPwkfLXgEMjUyr
   +/S9pGqFYiuoKRH99BrMKe/VTUXSjJ+n+fwuKfkZeoOnyM7AlJVmd2zcj
   RB0mRyPqAZht45wFMYEEeMTVffkAd+SIlFBgAiy4HuKk8pUfrqei1ynu6
   +dLKzc2gdXM9vZSzM0TlxYZBS6uViws5Tc+rCxDXZAqbN88OAT/4z1EwM
   lbUwlLH+DxlNqrqwIQ7CpOppImm2Q97CLka7YGjs4Ah7aDUzhW0qhSmAn
   g==;
X-CSE-ConnectionGUID: a8/6FC77RnCo1gKOgm5hRQ==
X-CSE-MsgGUID: ihnHdeDySeeWhTDFT3P9BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91354755"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91354755"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 20:16:40 -0700
X-CSE-ConnectionGUID: kSk2SIrhRE2WBerrfW9rMg==
X-CSE-MsgGUID: 5dss5sAwT2247BGMNayXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="234050154"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 20:16:40 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPtsY-000000004Hj-3UhS;
	Thu, 21 May 2026 03:15:48 +0000
Date: Thu, 21 May 2026 11:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 453/1130]
 include/linux/compat.h:1112:9: warning: 'is_compat32_task' redefined
Message-ID: <202605211142.NIFHQAkB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: a24490a245a48d7f53ca8da50ec8173e825b8d6c [453/1130] [CHERRY-PICK] arch: rename 32bit_compat to compat32
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211142.NIFHQAkB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211142.NIFHQAkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211142.NIFHQAkB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/parisc/kernel/signal32.h:9,
                    from arch/parisc/kernel/asm-offsets.c:34:
>> include/linux/compat.h:1112:9: warning: 'is_compat32_task' redefined
    1112 | #define is_compat32_task() (0)
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/compat.h:22:
   arch/parisc/include/asm/compat.h:140:9: note: this is the location of the previous definition
     140 | #define is_compat32_task is_compat_task
         |         ^~~~~~~~~~~~~~~~
--
   In file included from arch/parisc/kernel/signal32.h:9,
                    from arch/parisc/kernel/asm-offsets.c:34:
>> include/linux/compat.h:1112:9: warning: 'is_compat32_task' redefined
    1112 | #define is_compat32_task() (0)
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/compat.h:22:
   arch/parisc/include/asm/compat.h:140:9: note: this is the location of the previous definition
     140 | #define is_compat32_task is_compat_task
         |         ^~~~~~~~~~~~~~~~


vim +/is_compat32_task +1112 include/linux/compat.h

  1110	
  1111	#define is_compat_task() (0)
> 1112	#define is_compat32_task() (0)
  1113	/* Ensure no one redefines in_compat_syscall() under !CONFIG_COMPAT */
  1114	#define in_compat_syscall in_compat_syscall
  1115	static inline bool in_compat_syscall(void) { return false; }
  1116	#define in_compat32_syscall in_compat32_syscall
  1117	static inline bool in_compat32_syscall(void) { return false; }
  1118	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
