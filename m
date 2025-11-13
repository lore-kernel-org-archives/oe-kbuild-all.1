Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935635CBDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763066406; cv=none; b=KS4nk8CRgnlOETxw5eGr8Cr62eCVCFMRL3KsqjFSE474o/Zl1OTNt/c+mUNqJxbqgdy9XRd7/sY9XmBDBvOpT26FGT+cjlBRL2WbYhOYIWNOvb+5QMv2cjnwBPyxFPnfs9rQv3zKqgzfI/dRGtYN2/Q6ijpbRJOOz1uxkKHBS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763066406; c=relaxed/simple;
	bh=sXCsBnadJSBj2rRtHMfKPdYhYQzNFmTpwDXYSbUNWHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksyvi9gSqBSTH7BBZU7VRiILtT8vJt9ZNM3QuAYC4ef9CiQMcRIrJNVUwqZmQOB9uMSAgA6xS9pdY3jw/ZfYdbaJQDS6DE1PlHg9SOdNXkP9iEhbo1QS2zmkD5U1UmsOjwNZYHEnBgRZnV8TTqNkgmRJ451CwdGny8atWKBuOuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQkBqAsw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQkBqAsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763066405; x=1794602405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXCsBnadJSBj2rRtHMfKPdYhYQzNFmTpwDXYSbUNWHk=;
  b=XQkBqAswv9Itud0/rhFCTOPtNiqKAqVoUNmDvjdOlqiGnTXEViDbZZ/7
   Z09i5TgldJILyKUj79aaUyhpjSvVzou4lxulEzzCGrk7f6vp2Ao+3rMLI
   l94Wk0NVsTaTIjWnmpkZH9c75UJ22CSDactNHRsyglskva35EM6IRH5iq
   ZCz7Fsirtt1LaMKHXNVR9h1cAYAthJNziV4NYrknME0j6SQ96Qbtl/7iT
   wuiTWNnzIcauq2h0oGaxAjzclAQ5/M6U2kQ5GjcLM1botoFzYhSIBywx4
   2Bvc9KUcdRv2hws6e2w66bXDsoYZclTeVP+Lg9ohwuIqZF8NYuU2cfUmL
   w==;
X-CSE-ConnectionGUID: 1tfJsbx5TZumEBg3fFCj9w==
X-CSE-MsgGUID: fhb5lMw8RWGtiJz6ktJw4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52725471"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="52725471"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 12:40:04 -0800
X-CSE-ConnectionGUID: 3t/TAMAFQv+RTsIJhvjxxw==
X-CSE-MsgGUID: vIs/2JnhQoych8/bSwNWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="220230110"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 12:40:03 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJe6r-0005qV-1K;
	Thu, 13 Nov 2025 20:40:01 +0000
Date: Fri, 14 Nov 2025 04:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:gr1 8/10] include/linux/find.h:541:38: error: passing
 argument 2 of 'find_next_bit' makes integer from pointer without a cast
Message-ID: <202511140432.BAPCDjEV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux gr1
head:   e007560f02c959741536cbd5f8cd927bf0bf6b58
commit: ca959c4d4cb8c7703e76042b9e281067e6a2c4ad [8/10] cpumask: add for_each_cpumask_and_wrap()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251114/202511140432.BAPCDjEV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140432.BAPCDjEV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140432.BAPCDjEV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/find.h: In function '__for_each_and_wrap':
>> include/linux/find.h:541:38: error: passing argument 2 of 'find_next_bit' makes integer from pointer without a cast [-Wint-conversion]
     541 |         bit = find_next_bit(bitmap1, bitmap2, start, n);
         |                                      ^~~~~~~
         |                                      |
         |                                      const long unsigned int *
   include/linux/find.h:63:70: note: expected 'long unsigned int' but argument is of type 'const long unsigned int *'
      63 | unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
         |                                                        ~~~~~~~~~~~~~~^~~~
>> include/linux/find.h:541:15: error: too many arguments to function 'find_next_bit'; expected 3, have 4
     541 |         bit = find_next_bit(bitmap1, bitmap2, start, n);
         |               ^~~~~~~~~~~~~                          ~
   include/linux/find.h:63:15: note: declared here
      63 | unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
         |               ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/find_next_bit +541 include/linux/find.h

   522	
   523	static __always_inline
   524	unsigned long __for_each_and_wrap(const unsigned long *bitmap1, const unsigned long *bitmap2,
   525					  unsigned long size, unsigned long start, unsigned long n)
   526	{
   527		unsigned long bit;
   528	
   529		/* If not wrapped around */
   530		if (n > start) {
   531			/* and have a bit, just return it. */
   532			bit = find_next_and_bit(bitmap1, bitmap2, size, n);
   533			if (bit < size)
   534				return bit;
   535	
   536			/* Otherwise, wrap around and ... */
   537			n = 0;
   538		}
   539	
   540		/* Search the other part. */
 > 541		bit = find_next_bit(bitmap1, bitmap2, start, n);
   542		return bit < start ? bit : size;
   543	}
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
