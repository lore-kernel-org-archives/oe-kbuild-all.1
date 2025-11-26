Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8724A046
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 23:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764198389; cv=none; b=O5bZoA0dzP1r3G8iiCcpXdILyfJ9J3MhzyYpszoP9lfPNdKNTeA8jEU31Yt1NrYV8cqDeZOI60M8ueNizhvt3/SqoKYzSQHEXKsUgB6I+xhoDqL3TfjK3kR9uRLDVPOXME0lyu8xaXqWOKcIbcDKKK339qHXaL3b19NhHqUJuEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764198389; c=relaxed/simple;
	bh=IP7+uEOaOKENyAEaY9c6bCB7NnODRWadnNDZPRI8Jko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KT2Bync5mmUwQkyuT+rgJqU3lMPYUTesaJ0/7vjnI21qms7Xx6Kxf6nUoLjmOj/7mW7IJz7pnea8OQFWPugp/4q9yNuZmD1Nd4dA64O5bOYA171NSJdQwCYFIGyVPnIdKCFliYR3zxPTlm0nGUEuNHs6M19tMlLjqS7dBPsb+ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQ9Nvycs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQ9Nvycs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764198387; x=1795734387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IP7+uEOaOKENyAEaY9c6bCB7NnODRWadnNDZPRI8Jko=;
  b=GQ9NvycsANcBJ+rPpJPREZzedsW0d4uA0/XPaKuXOCAXyv5wv1vnp6/+
   T1yaUxHEp1V7mLp8zrBaty5UNNbDLJwog13rwG/H12ajKmfS5fIWGh2qw
   lte5MCgTVFXAJ+GqyHpmoxAn6mMAL4dH5w6HShWvItDmGesOIA0UiAPen
   2r0kYCrcENdgMKRtyZgt/qpPlNAskQswianSf9kIzt9pZaPatp2N27RSt
   yZAAzQTd0uZqUvukmwEOaMDSr3PI3iBcMLzMGReLDQNcq9zgnrmvHfcMr
   +IfyJqGAfbObDcmJLp4V7DFYq95Z28QbzmJH4tTHpXhIX9/s28eDwyNNJ
   w==;
X-CSE-ConnectionGUID: d+ag3HUFSja+yvSVHpWWBg==
X-CSE-MsgGUID: kFUi1GRiS6WC+FwDpAtyOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76933527"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76933527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:06:27 -0800
X-CSE-ConnectionGUID: ehd2Lu+LR/qiW4pAhHuYZw==
X-CSE-MsgGUID: Zt7WbzR4RImYuZLnBDzJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="198023062"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 15:06:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOOae-000000003RI-0lbr;
	Wed, 26 Nov 2025 23:06:24 +0000
Date: Thu, 27 Nov 2025 07:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 2/4]
 include/linux/atomic/atomic-arch-fallback.h:399:29: error: implicit
 declaration of function 'arch_cmpxchg64_local'; did you mean
 'try_cmpxchg64_local'?
Message-ID: <202511270635.trEd7j6i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   36c8d6393fcd1f917beed0c0b3cbd2969cfda4c4
commit: 93d36d27a0ec6d3d42148038c6e3d50a443c8a16 [2/4] random: Use a lockless fast path for get_random_uXX()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20251127/202511270635.trEd7j6i-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270635.trEd7j6i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270635.trEd7j6i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/current.h:6,
                    from arch/arc/include/asm/current.h:20,
                    from include/linux/sched.h:12,
                    from include/linux/utsname.h:6,
                    from drivers/char/random.c:28:
   drivers/char/random.c: In function 'get_random_u8':
>> include/linux/atomic/atomic-arch-fallback.h:399:29: error: implicit declaration of function 'arch_cmpxchg64_local'; did you mean 'try_cmpxchg64_local'? [-Wimplicit-function-declaration]
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4998:9: note: in expansion of macro 'raw_cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:13: note: in expansion of macro 'cmpxchg64_local'
     552 |         if (cmpxchg64_local(&batch->posgen, next, next - 1) != next - 1) {      \
         |             ^~~~~~~~~~~~~~~
   drivers/char/random.c:570:1: note: in expansion of macro 'DEFINE_BATCHED_ENTROPY'
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +399 include/linux/atomic/atomic-arch-fallback.h

8c8b096a23d12f Peter Zijlstra 2023-05-31  398  
9257959a6e5b4f Mark Rutland   2023-06-05 @399  #define raw_cmpxchg64_local arch_cmpxchg64_local
8c8b096a23d12f Peter Zijlstra 2023-05-31  400  

:::::: The code at line 399 was first introduced by commit
:::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
