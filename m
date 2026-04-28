Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BEB42EEDD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385703; cv=none; b=RKtMsTAOS8LR+LtKYXN0/GHpWb8JGdbCPP1z2URsmfwe20k7yYOAqzOJyKzlhOHvzvUYk+r2mIQ/vq/Bk2wQWtaEJQwZCqBbzwrJil1lqfKywNS17ZtdbDTtTooCsjLPK/y7wtTy1vjsR0TkFI2NENX4pvO/I6W7IzNGJImpf+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385703; c=relaxed/simple;
	bh=oIZPTYAL9wKzv9XlnSqRjzjNQYTEM7lfiLXRCwlBESI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hv5RFm3vdRmYeuoF7GNRhNLoeE+PJsYXXQVpzRcuINnsYOIZfAf68I7iZoOWn+JM0Lf9zJgNv+KRuYi4IgVJ5r1ntA+/lEgvK73XzufzFndr3Bs/LL8UtTvAOnq5ZsSk8qRIHDPKSwGh3sC+Sf5nSO+vXzxEGGiJApgVMF6Ykuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mv7awnao; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mv7awnao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777385702; x=1808921702;
  h=date:from:to:cc:subject:message-id;
  bh=oIZPTYAL9wKzv9XlnSqRjzjNQYTEM7lfiLXRCwlBESI=;
  b=Mv7awnaoXh5UU1CCKf0640oLxh88nNLadUYR5IwKi5jBg5onVH7ybfS7
   vjVzLzHu2HsjH9V5MmJrp3FngFM7eZ9J5yQsVq5ZU/hOiP9VBwLHFTIXT
   9xIYDA9YDkv8N4qK2cvHI3bZNTKUtECafLue57D4RR+85tp+xnP/Roy3+
   PjtwkLmVCfxVtYd6aRfLonGGCXGVOktCws6FOTfDgi8SyW/OzLP305J4e
   KXYPvivyDVwuGKFKrRO3OJaOFqZFJDTRTCW/s3BIrYeKw5eJosgtvdHu3
   h0fYR+fu3wcXRWheZIer3mk9uDB/jUjvOrOFy0XxMMGEkupATfO4Phe78
   w==;
X-CSE-ConnectionGUID: McToNt3kSweK1vbYV6yeTw==
X-CSE-MsgGUID: xFOgdRkyS32JGed2972vmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78278762"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78278762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 07:15:01 -0700
X-CSE-ConnectionGUID: jbbVsRYnTx6zk0Ctrc7mtg==
X-CSE-MsgGUID: YcyrTraASJmBqtTW/QdM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="229394484"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2026 07:14:59 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHjDF-000000009sI-2oA9;
	Tue, 28 Apr 2026 14:14:57 +0000
Date: Tue, 28 Apr 2026 22:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/hmx 54/66] kernel/sched/smp.h:19:20: error:
 redefinition of 'flush_smp_call_function_queue'
Message-ID: <202604282234.Bqmfqccc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/hmx
head:   1d0fb0b4cf1764f00775cff1c17c2b3494b6b94e
commit: 639356374155ee0c6dd113bc8e971a0c7165a34f [54/66] hexagon: flush SMP call-function queue before entering idle
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260428/202604282234.Bqmfqccc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604282234.Bqmfqccc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604282234.Bqmfqccc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:96:
>> kernel/sched/smp.h:19:20: error: redefinition of 'flush_smp_call_function_queue'
      19 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/core.c:11:
   include/linux/smp.h:237:20: note: previous definition of 'flush_smp_call_function_queue' with type 'void(void)'
     237 | static inline void flush_smp_call_function_queue(void) {  }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_smp_call_function_queue +19 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  15  
d664e399128bd7 Thomas Gleixner 2022-04-13  16  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  17  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  18  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @19  static inline void flush_smp_call_function_queue(void) { }
d664e399128bd7 Thomas Gleixner 2022-04-13  20  #endif
3d7e10188ae0b6 Peter Zijlstra  2025-05-23  21  

:::::: The code at line 19 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
