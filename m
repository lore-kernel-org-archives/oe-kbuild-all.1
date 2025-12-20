Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5400E219A89
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766232115; cv=none; b=IbE//tZgff6TIz8lrdcPWCr09mfaAUWJKZ94ewYpax3/MJMIPbaaMDGPHtpquxL6IFwyGNJaTHOuyRBHamAaC3tzVvzkejlMI8iPQ0YW80vEn1g/8gw3szTW0jooTjqZ1N6t3F9bwlSmRXj8usdh2nNxD0k6bSe/3XLNRdZP6h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766232115; c=relaxed/simple;
	bh=soTs0nKEyPzWiVrQzqa/m1yBpgKre7AS7OEFz6seBKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nEjVhYErByV/A5/sjxZ8qSLJrUVy+2SlCepthQ4KMbG0r0Ii9s4jibMCUlR/Mx5FVcdRJqu38ZvCSHdspP4NmNfrok/aCmnXT/VYTE2q2NM50MGJD9O0LdMGelQFfjgM316cO9JtpZASy3a8Wa094zWJFwRYxdVPRXqbup/e1+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOI+Sfin; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOI+Sfin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766232114; x=1797768114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=soTs0nKEyPzWiVrQzqa/m1yBpgKre7AS7OEFz6seBKs=;
  b=fOI+Sfin2BsG6MmFx9wS+qo+mCM8c7Kc+UBHcP+3j9D8D3LFqUKj+oV1
   a4bODOsAo0IiH7fbKMqYZJm+bRBbVoXMrkJifotaks+LmKBzByL9bf0pA
   9jbt1hAcRkVqokM1W1xXnPJ3EQFOAg8q4PRlZ5TZDsYbSfm8st/8nfHG7
   6Wet9DOBMAtbswK/EpntmaIw/jrERXg1bR0Pu/hhSs51etaZOVnAAhCIi
   Uj4FLNoN9ChaT8t/+fdwZDlIauUYLPA7SVD+0mTADJ4XxD8w7RVGxCArx
   pFHuIJkRH66ROWGKvtlw5tAmK9xsgWj3fsGc0kQyyCho2IziHHnFKDhfd
   A==;
X-CSE-ConnectionGUID: yu2C7NmbRCKtmNrufdSzpg==
X-CSE-MsgGUID: WpwqhwNBRNGsSAS43TZnoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68049914"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68049914"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 04:01:52 -0800
X-CSE-ConnectionGUID: bxXeAQ9KT/i1NudAUE9AAw==
X-CSE-MsgGUID: mVHb/GjmRHeKepxZtX1Igw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199958983"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 04:01:51 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWvee-000000004W3-3NrI;
	Sat, 20 Dec 2025 12:01:48 +0000
Date: Sat, 20 Dec 2025 20:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:lockless-random-v2 6/7]
 include/linux/atomic/atomic-arch-fallback.h:399:29: error: implicit
 declaration of function 'arch_cmpxchg64_local'; did you mean
 'try_cmpxchg64_local'?
Message-ID: <202512201942.b8QAB1Ke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git lockless-random-v2
head:   dbb71d73b311be70b14e89a9b5f804efeae1637f
commit: e09c333785b181335f70697c2bd41bf828e42dcd [6/7] random: Use a lockless fast path for get_random_uXX()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251220/202512201942.b8QAB1Ke-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201942.b8QAB1Ke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201942.b8QAB1Ke-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/current.h:6,
                    from ./arch/openrisc/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/utsname.h:6,
                    from drivers/char/random.c:28:
   drivers/char/random.c: In function 'get_random_u8':
>> include/linux/atomic/atomic-arch-fallback.h:399:29: error: implicit declaration of function 'arch_cmpxchg64_local'; did you mean 'try_cmpxchg64_local'? [-Wimplicit-function-declaration]
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:407:16: note: in expansion of macro 'raw_cmpxchg64_local'
     407 |         ___r = raw_cmpxchg64_local((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5031:9: note: in expansion of macro 'raw_try_cmpxchg64_local'
    5031 |         raw_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:14: note: in expansion of macro 'try_cmpxchg64_local'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, &next, next + 1)) {            \
         |              ^~~~~~~~~~~~~~~~~~~
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
