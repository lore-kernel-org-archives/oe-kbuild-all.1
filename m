Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236E2DBF76
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289857; cv=none; b=IFzXBGf/AxbEc/uVBICYiqQoAU+W1R8dpBfivhCDAaeAI+LBHPl78Sq2WfbRKnDHbh79b0ridJYb7DopK01MNqtvgQvFhW28SeSRUvBm2uZPYv6keHSjDL5SiKY4sr6Thjh/g6H4kMIZRsqx311zOBYUo/yj/kUUB9bnzYywicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289857; c=relaxed/simple;
	bh=WRq2/E9kH1slW0pgZcbsq4ZIQT1Ovuu/hcqfd8d1Mec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RucZvNZ4rlMlfy9Aq60vlYC9b2tZzdNtsVle17oxR9ieOZQuWNC4MIwJ4q9djbLajfDiR1kj02Mg57qUCm/gc19xufLb5nhsdN9nN++Cbu0KX2oCOLuMAkWKANoOymjw3F9vX434c81+c6pFAbnxFBio9KNnD7uQQvQ/SCfmHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqwDDmoj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqwDDmoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289855; x=1799825855;
  h=date:from:to:cc:subject:message-id;
  bh=WRq2/E9kH1slW0pgZcbsq4ZIQT1Ovuu/hcqfd8d1Mec=;
  b=IqwDDmojod2XrR/gzV9uFo/77p/sSSriagG5EG8gOVcMu1h6dGoWD1b7
   cJYKKXppA41Np9XUzf8SlNZr9VSSRIXbA6Uxufr6dr3h91yIc+a3insZl
   g9b5K73V/up+qfWMFR1SO36hAQeG8MTG5FNVrz+kOgwZ+EbZ/ZPEwv2of
   9LAPnYJAsAbdK4MKNAl6UmdF2zRu2D7dOCBs3cIL2eOiRXg+eLuiSmB5Q
   ZduI8jDes3ASMztbwjmkTNbQupggI8VDDXbkZdAA59UhpezWdOys6d9kH
   O5JwaL4Tp4EuyDuuHz5tYYIMkku3hCPGHC8VqxtOOHgztRogY1CZbe0kq
   A==;
X-CSE-ConnectionGUID: o18LqYJxSyOj+OYIaINTmg==
X-CSE-MsgGUID: U65FjJrnR6GEcxnHcoSyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80289970"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80289970"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:37:35 -0800
X-CSE-ConnectionGUID: jB4WhLEZTbWE7L08e1j4Yg==
X-CSE-MsgGUID: 8rUinvvbSA2rkZ7vPd2o3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204935633"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jan 2026 23:37:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfYy2-00000000ENe-3FyR;
	Tue, 13 Jan 2026 07:37:30 +0000
Date: Tue, 13 Jan 2026 15:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/rqspinlock.c:100:39: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202601131534.cgHPGxRw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: e2082e32fd57976e811086708043c136ee596978 rqspinlock: Add entry to Makefile, MAINTAINERS
date:   10 months ago
config: arm64-randconfig-r121-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131534.cgHPGxRw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131534.cgHPGxRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131534.cgHPGxRw-lkp@intel.com/

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
