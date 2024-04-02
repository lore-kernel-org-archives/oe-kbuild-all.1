Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122015CD54
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 19:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712086850; cv=none; b=pEZKG+eO+8HhV/AgEw6DdbCZi2hu3zO1MeVohFJ9RCXX10TGRIr5ElXIrb0ajtaz5u1xvrADj4ztTAZCgJFuElsDG/Tg6y5rbamb3z5abhGcid5gqftQ+aQKgaBbMM4oXnaYy6UmBi+QMQUsWzFZA5hPpmiU1+9ZMsYfjC0dqUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712086850; c=relaxed/simple;
	bh=BG1Yg9eunvbTSBK5CmXqzTh65CLHmT7u8ooc0I48NXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZl9ePXd87gPSJvUcBE4W+wlxFX6AKmXDvqMVc60LoQbKzFapFJUuM8EgrhEXc2qqYAiymRK8XMTnPKLpPro7d8+Yz7az+AAhjEdw1MDAc+H86v4eET9o+/PkTi5bPqDCCzk5VIov7NQzuI77CGtPElK+CuYmAyvS2n0uixskd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiOZfr+R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiOZfr+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712086848; x=1743622848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BG1Yg9eunvbTSBK5CmXqzTh65CLHmT7u8ooc0I48NXY=;
  b=IiOZfr+RSCrJxpIcn4tUKnOmaQnN3EzZVvwiricT9/XvxjkA9F5mRMwa
   /yF5w0Ts5EG6h9YLCRPHf6u7bip7vPJ0gkD5Zq6Ccf5QzUw2GaoJuuHkK
   TH7o4Z688c5k7ochpEAVa69VMCUdTwOY2/1wSjrO5SLUbCMb2TmeIRyII
   0Z+orB0JHQBt5pIkIJBVx8PXtPij/5jFnuhFp4hXSJbNnxDgzlzRMzyG7
   e8jqx3FM/yYDJzFGcDTXThv2kJRYNKnsRyG4nqf7kih5qqlioyfspmQiP
   gEtic5EwmRtOkKEZUhnYUwG6O0dGIdbdmX7ikqjgYVnmTgC6QeJYYgzt2
   g==;
X-CSE-ConnectionGUID: x4uqoOtxSM+ktZN74H4fPA==
X-CSE-MsgGUID: keNs/klNSVCZ40uRGvk0TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11106184"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="11106184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 12:40:47 -0700
X-CSE-ConnectionGUID: pd/NA7naSxGOp/BQROp1Ig==
X-CSE-MsgGUID: NZfkwdAiSdiM9m9lu6r/OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22923283"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2024 12:40:45 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrjzv-0001TJ-0E;
	Tue, 02 Apr 2024 19:40:43 +0000
Date: Wed, 3 Apr 2024 03:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:misc.cmpxchg 4/8]
 arch/sparc/include/asm/cmpxchg_32.h:51:61: sparse: sparse: cast truncates
 bits from constant value (eb9f becomes 9f)
Message-ID: <202404030332.d8MKrNbM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git misc.cmpxchg
head:   9e2f22ef1ae21b949a3903727d7e7cd5eb48810f
commit: 1b2857f7277164d8bed4e831e3c3696572a51f0b [4/8] sparc32: add __cmpxchg_u{8,16}() and teach __cmpxchg() to handle those sizes
config: sparc-randconfig-r132-20240403 (https://download.01.org/0day-ci/archive/20240403/202404030332.d8MKrNbM-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240403/202404030332.d8MKrNbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030332.d8MKrNbM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:2157:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2187:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_32.h, arch/sparc/include/asm/atomic.h, ...):
>> arch/sparc/include/asm/cmpxchg_32.h:51:61: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
   kernel/bpf/helpers.c: note: in included file (through include/linux/timer.h, include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/bpf/helpers.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_32.h, arch/sparc/include/asm/atomic.h, ...):
>> arch/sparc/include/asm/cmpxchg_32.h:51:61: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
   kernel/bpf/helpers.c:2495:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2500:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +51 arch/sparc/include/asm/cmpxchg_32.h

    44	
    45	/* don't worry...optimizer will get rid of most of this */
    46	static inline unsigned long
    47	__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
    48	{
    49		switch (size) {
    50		case 1:
  > 51			return __cmpxchg_u8((u8 *)ptr, (u8)old, (u8)new_);
    52		case 2:
    53			return __cmpxchg_u16((u16 *)ptr, (u16)old, (u16)new_);
    54		case 4:
    55			return __cmpxchg_u32((u32 *)ptr, (u32)old, (u32)new_);
    56		default:
    57			__cmpxchg_called_with_bad_pointer();
    58			break;
    59		}
    60		return old;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
