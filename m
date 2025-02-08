Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124DD1A3151
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 23:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739058806; cv=none; b=YmLWSFObVjDTdfx9rv6mFbMBCDj05O4MFQmMa5By0UQ6F19slPWqeZnt5SB+nW9NlUA1Nektq2DnJ5ivKRLLlvwc62qcOCZ1J8EobvJLLwXoOHmbgwnchbz23RogfYW5m/RjKXxaPDy/v5hJeiwufNLfggVrJouuUYX7+QmzLaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739058806; c=relaxed/simple;
	bh=jmp6fvzhXSBCMgBVA4KBoyqIjomlicBaPDoV5N8Wv/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRGs5ja5a67czxh2XG+Y6ugWsopMmo47CRMV1mlLjszZnQFlTeMGIX4AWm/rtzalro9uWQeOFnEgMmPzxVC5WLKgR6ubdL/SUT4sRdWAIqQhT5aBCwLNDz11JTIjPn2LDGnrlsLhXG2xkBFh3mrsa1rJtgNbISRzZdWg+6d/vu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQa2F7dZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQa2F7dZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739058805; x=1770594805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmp6fvzhXSBCMgBVA4KBoyqIjomlicBaPDoV5N8Wv/0=;
  b=UQa2F7dZHkW1zyy0eud+leV28nVEbTPu8puTPQvJWDZO506sh2QvvU/U
   BDsK1fnvYorIJkUWKnvy5fabrPtxdMBHw8jeFYX+sDtmv8HrqLnuRRAY0
   EU2JLC6lJ5yYrwgl9egxGCa38mIU8MG5+k0qYIv9/921/g2YQnrHm33Bq
   YcW1XUkVgeOnhIaUbcdKtaHiviwii3icUsozSSSWzaj547CkM4Qtr5omw
   ZaE/WU1gpH3Li2NsMKHxw5iXUIuuwhbZFHvsdAM8Cfg1WIVX9zz2QPIfJ
   /0FImahkkkuAFR0716o2WcrxMri48xiegL0s4du3S/uzjkjZzxOMQOnLX
   Q==;
X-CSE-ConnectionGUID: FmOouFcVS9yXyagJ7sfh8w==
X-CSE-MsgGUID: Ivaqd4YNRcOsTQN/l2B1Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43595085"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="43595085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 15:53:21 -0800
X-CSE-ConnectionGUID: 9sU5NAclQFSXPjEmT5xxgw==
X-CSE-MsgGUID: rU8RNHSlSCKl4y6AOA0mQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112284250"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2025 15:53:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgudS-0010mv-05;
	Sat, 08 Feb 2025 23:53:18 +0000
Date: Sun, 9 Feb 2025 07:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/prjc 2/2] include/linux/sched.h:2205:20: error:
 redefinition of 'task_is_runnable'
Message-ID: <202502090705.29edRYXj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/prjc
head:   359095094f9446de0bc3637a66a97c5c9e56d2ba
commit: 359095094f9446de0bc3637a66a97c5c9e56d2ba [2/2] sched/alt: [Sync] sched/fair: Fix external p->on_rq users
config: i386-buildonly-randconfig-001-20250209 (https://download.01.org/0day-ci/archive/20250209/202502090705.29edRYXj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090705.29edRYXj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090705.29edRYXj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:12,
                    from arch/x86/include/asm/msr.h:15,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:17,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/sched.h:2205:20: error: redefinition of 'task_is_runnable'
    2205 | static inline bool task_is_runnable(struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~
   include/linux/sched.h:2196:20: note: previous definition of 'task_is_runnable' with type 'bool(struct task_struct *)' {aka '_Bool(struct task_struct *)'}
    2196 | static inline bool task_is_runnable(struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~
   include/linux/sched.h: In function 'task_is_runnable':
>> include/linux/sched.h:2207:30: error: 'struct task_struct' has no member named 'se'
    2207 |         return p->on_rq && !p->se.sched_delayed;
         |                              ^~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3813010482
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=3813010482
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3813010482
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3813010482
   make: Target 'prepare' not remade because of errors.


vim +/task_is_runnable +2205 include/linux/sched.h

  2204	
> 2205	static inline bool task_is_runnable(struct task_struct *p)
  2206	{
> 2207		return p->on_rq && !p->se.sched_delayed;
  2208	}
  2209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
