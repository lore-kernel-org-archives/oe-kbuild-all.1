Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B182475CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 03:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771211662; cv=none; b=BBqkKiUaacs5nmQ+IDuiIGGSMIKQDTTtVCsGEaczEcSuZWxtNggMlMoq3iWQQxdcqfR9EQWZGJE4CuJJjILMgcAmiC5AsEDyvy5Oud8A4PmPrWzi7RTieWe77uQpFpB1QqxpooFJy5u1RhqqUEfBm2RjCYQbgyKAUgMDDcGDoaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771211662; c=relaxed/simple;
	bh=3Hg2HkU7pZM8BMXZYTsQLpgl8e0f4y3uR6Nc9tPvzjg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ABRiTDy2ryLq66nUwQqJg01uzGLEuaGp6SZIY6ZB1/Dmlx8YCkrDWqJfgv/RXnQ4UBBEY5e3KuckCBjjmQvrxgIO6TEreF/cPc/3fkkzDAXr+KDXslbQqVrVmaXidZaN7+tO3iAbXtkLYx3lcBONSAHynlWbEBi4RBLo6CRUgw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3LiuZQy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3LiuZQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771211660; x=1802747660;
  h=date:from:to:cc:subject:message-id;
  bh=3Hg2HkU7pZM8BMXZYTsQLpgl8e0f4y3uR6Nc9tPvzjg=;
  b=a3LiuZQy8EiSWS+GkLK5Ze19VS9cL2s2UYsO/bvdKpdS6zCoB3x0N4fN
   1NxTmGv29pguVLLYa0O4qTbcsRdqjHSSYugbRkuIKeUZPhM5E+6J6BQOL
   KuLp6I1IYeow7QTNSGLb2BKp5N4SUijcTbUQKku3wkEUgsizq/cMqlj9Q
   4yB38CmZBulkl6LZGaINcxnvPZ4n4o2GATfbT5tVH8nb1GLR6k2gqICAz
   UDJUJdqSDRG0ZxKGdZ7sUd1ll54ObWvgaiIZj3dstlzhIiqvR6OPhUcn0
   YtIvTuEmliszVXmQVhxvjppZmNWbMyvJhfwn1IksgxyWypsfRjOMHhle8
   w==;
X-CSE-ConnectionGUID: l7jTMz/cTPGAsznHlliYVQ==
X-CSE-MsgGUID: Ea9PlcvrRjOQy4Pv5whfxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="76147817"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="76147817"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 19:14:20 -0800
X-CSE-ConnectionGUID: 8iCuwKjMQayE1gY259UbgQ==
X-CSE-MsgGUID: bT2D/9njQh60fHllJDyLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="251149921"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2026 19:14:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrp3w-00000000zMi-09UC;
	Mon, 16 Feb 2026 03:14:16 +0000
Date: Mon, 16 Feb 2026 11:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/rqspinlock.c:100:39: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202602161139.B1owy5fU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kumar,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: e2082e32fd57976e811086708043c136ee596978 rqspinlock: Add entry to Makefile, MAINTAINERS
date:   11 months ago
config: x86_64-randconfig-121-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161139.B1owy5fU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161139.B1owy5fU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161139.B1owy5fU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/rqspinlock.c:100:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:100:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:100:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:122:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:122:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:122:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:135:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:135:51: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:135:51: sparse:     got struct rqspinlock_held *

vim +100 kernel/bpf/rqspinlock.c

31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15   96  
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15   97  static noinline int check_deadlock_AA(rqspinlock_t *lock, u32 mask,
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15   98  				      struct rqspinlock_timeout *ts)
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15   99  {
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15 @100  	struct rqspinlock_held *rqh = this_cpu_ptr(&rqspinlock_held_locks);
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  101  	int cnt = min(RES_NR_HELD, rqh->cnt);
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  102  
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  103  	/*
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  104  	 * Return an error if we hold the lock we are attempting to acquire.
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  105  	 * We'll iterate over max 32 locks; no need to do is_lock_released.
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  106  	 */
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  107  	for (int i = 0; i < cnt - 1; i++) {
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  108  		if (rqh->locks[i] == lock)
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  109  			return -EDEADLK;
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  110  	}
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  111  	return 0;
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  112  }
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  113  

:::::: The code at line 100 was first introduced by commit
:::::: 31158ad02ddbed2b0672c9701a0a2f3e5b3bc01a rqspinlock: Add deadlock detection and recovery

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
