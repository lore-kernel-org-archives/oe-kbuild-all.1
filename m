Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763141799F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751105269; cv=none; b=iyeOHHZAUVu/znROxm9P5EitSJnSLa7ScIV5Xq353VxPre12GVXnkbKol/rUnqrf2RtuHVDBcDfjURzd3oFPrp4lUr+QhIX4PpyTNiQ8hfx7pc9ZSZOvKxu5Km+EEOhwrhrfC5F2dzbxW5I3R9cRUcmIQnZATgLEzu/x0WK0blE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751105269; c=relaxed/simple;
	bh=jaGRDV3y+L/pdjPAaUNPT3wKfM7TTLTFm7lWJ98z7f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYLpDXrerIqFiKFN7f2LHWh0CStNf0Dup6++R1H79sDxYQ41wezzWJ9fiRRnBscRfCJu6kvfVATrmPZD4pMzWQfIyg8J4XpWiQFRnSB4I3vbFh1JNNhiO+SPDUozwXHHdXRl6EunR2dPzwnV4EupeEes0eIbPhtWDl7X7+O3Cx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbiVzLO5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbiVzLO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751105267; x=1782641267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jaGRDV3y+L/pdjPAaUNPT3wKfM7TTLTFm7lWJ98z7f8=;
  b=SbiVzLO5960/4CCLDL9OIdrSpN0nzUp/N6gMx/t6VwKwUPdQ6egwsjXa
   Y8kjwBsGnDSWYvHv6nMwwoQfUU0uxxPd1UJG2vQoSY/PxUJQaj39OQYXC
   /z9B0/JPij1MDLezwYwh4QW97fjwM5d4qkny2sDwEuzDrdhy+NXpggmvx
   cp1BbVyFA8wFUG8eDcD4MYdyhBmvcA3OMoJQeY8MuOWOpohcqXnP7OWqu
   6/XahLkmddDPwBxRjh9eeHML3vjsVWDpVOjpksxXXDkrlDapcAvwThpIf
   35LdTl0KGTVmuoxtyHe84YID1McdFXGNYUP74A9wyQz1x1pFdwn+fd+bf
   A==;
X-CSE-ConnectionGUID: REzIQgWeR46Eq1fCm8QveA==
X-CSE-MsgGUID: 8SiCIdBGSFa8d3Y45TAHGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="56024509"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="56024509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 03:07:47 -0700
X-CSE-ConnectionGUID: qeguitj1Q46X2s4cV18guA==
X-CSE-MsgGUID: BElNms1MQ9KVwwAgbqqNnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="153308602"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2025 03:07:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVSTH-000WyW-2K;
	Sat, 28 Jun 2025 10:07:43 +0000
Date: Sat, 28 Jun 2025 18:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, "Naveen N Rao (AMD)" <naveen@kernel.org>
Subject: [linux-next:master 3640/5998]
 include/asm-generic/bitops/fls64.h:24:20: sparse: sparse: cast truncates
 bits from constant value (ffffffffff000 becomes fffff000)
Message-ID: <202506281823.KIJ5j5Pi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 2e002ddc896684f668427113ec027f3025fe6c41 [3640/5998] KVM: SVM: Drop pointless masking of kernel page pa's with AVIC HPA masks
config: i386-randconfig-061-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281823.KIJ5j5Pi-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281823.KIJ5j5Pi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281823.KIJ5j5Pi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/svm/avic.c: note: in included file (through arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/fls64.h:24:20: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)

vim +24 include/asm-generic/bitops/fls64.h

a54baa1487c51c8 Akinobu Mita           2006-03-26   6  
d57594c203b1e7b Alexander van Heukelum 2008-03-15   7  /**
d57594c203b1e7b Alexander van Heukelum 2008-03-15   8   * fls64 - find last set bit in a 64-bit word
d57594c203b1e7b Alexander van Heukelum 2008-03-15   9   * @x: the word to search
d57594c203b1e7b Alexander van Heukelum 2008-03-15  10   *
d57594c203b1e7b Alexander van Heukelum 2008-03-15  11   * This is defined in a similar way as the libc and compiler builtin
d57594c203b1e7b Alexander van Heukelum 2008-03-15  12   * ffsll, but returns the position of the most significant set bit.
d57594c203b1e7b Alexander van Heukelum 2008-03-15  13   *
d57594c203b1e7b Alexander van Heukelum 2008-03-15  14   * fls64(value) returns 0 if value is 0 or the position of the last
d57594c203b1e7b Alexander van Heukelum 2008-03-15  15   * set bit if value is nonzero. The last (most significant) bit is
d57594c203b1e7b Alexander van Heukelum 2008-03-15  16   * at position 64.
d57594c203b1e7b Alexander van Heukelum 2008-03-15  17   */
d57594c203b1e7b Alexander van Heukelum 2008-03-15  18  #if BITS_PER_LONG == 32
c8399943bdb70fe Andi Kleen             2009-01-12  19  static __always_inline int fls64(__u64 x)
2dfc383ad587bbe Akinobu Mita           2006-03-26  20  {
2dfc383ad587bbe Akinobu Mita           2006-03-26  21  	__u32 h = x >> 32;
2dfc383ad587bbe Akinobu Mita           2006-03-26  22  	if (h)
2dfc383ad587bbe Akinobu Mita           2006-03-26  23  		return fls(h) + 32;
2dfc383ad587bbe Akinobu Mita           2006-03-26 @24  	return fls(x);
2dfc383ad587bbe Akinobu Mita           2006-03-26  25  }
d57594c203b1e7b Alexander van Heukelum 2008-03-15  26  #elif BITS_PER_LONG == 64
c8399943bdb70fe Andi Kleen             2009-01-12  27  static __always_inline int fls64(__u64 x)
d57594c203b1e7b Alexander van Heukelum 2008-03-15  28  {
d57594c203b1e7b Alexander van Heukelum 2008-03-15  29  	if (x == 0)
d57594c203b1e7b Alexander van Heukelum 2008-03-15  30  		return 0;
d57594c203b1e7b Alexander van Heukelum 2008-03-15  31  	return __fls(x) + 1;
d57594c203b1e7b Alexander van Heukelum 2008-03-15  32  }
d57594c203b1e7b Alexander van Heukelum 2008-03-15  33  #else
d57594c203b1e7b Alexander van Heukelum 2008-03-15  34  #error BITS_PER_LONG not 32 or 64
d57594c203b1e7b Alexander van Heukelum 2008-03-15  35  #endif
2dfc383ad587bbe Akinobu Mita           2006-03-26  36  

:::::: The code at line 24 was first introduced by commit
:::::: 2dfc383ad587bbead84739a9ff9273df3eda983d [PATCH] bitops: generic fls64()

:::::: TO: Akinobu Mita <mita@miraclelinux.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
