Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA613202F9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763067669; cv=none; b=GaSU8hi+Y6gBXrGkVroZAVJRvUA82ce2DxncG1itZgGAuWaNSQ2oyekOuZt+4xMsMO7ptUp3wFKmex+Ygqn41vMAKNUc4Y4qGn6DSGSpuNMeS4lMhFqWmjToldV5vIY56mQXJAFlYwY4pF7DZOBeAxtaQcmcKC4eRiwkbwiGPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763067669; c=relaxed/simple;
	bh=v2caavYMtL/qs+bManu4RfjbWOnSZJMvNNrZJEoDmyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YayVKT28616cIAJdwuF9xWa/7hK5SGYXgvDpbuzWvzqESlg8tIQTbxTVhQOd0dUlYmxbkyflGM8oJvYN7naO93jUdZQly+Ub7XUZa4VpPr62sfQj4jqhSvRxQYU1l7pu9xX4jEN+OceuED9BqKldWdUFC4JL3LBPMHjH1DLFADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbEfAXj7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbEfAXj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763067668; x=1794603668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2caavYMtL/qs+bManu4RfjbWOnSZJMvNNrZJEoDmyE=;
  b=TbEfAXj7tN5tePbDR1xGDTL+NPc7dv/v7K08SbndAlCjE/Zfa/ToTqYU
   L6h7a0arkFjJ/VU4oFyxXdkFsfiOGtD7rVJOW6ecwNY5NqnbGKZz0pHZ6
   quDAtoW1YYLiEohASJw0iAlWS5g0yG/bxQ/mmpLZ5IsyN57OY5vszWnoJ
   G30RKr5jalxYGeSI5ItVZvEc/3pd6heR5g2iiCseXp0tSWlkCSCeKyRb0
   guCDVSKrFN30JayL5JGCpmb/DfXBVDqeJw13z1fkMjZGEhiNqs9f+HuTI
   SampFMRXCoarqA3lJ2wvi+AHQivPB4lcAbHhvV/E9wFNEsangFg7JsiYW
   A==;
X-CSE-ConnectionGUID: H0v6ZmYxRomcIbbq5T2xoQ==
X-CSE-MsgGUID: vY8bySF9THW9YcCr3Tx19g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75768084"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="75768084"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:01:07 -0800
X-CSE-ConnectionGUID: UaQKz3DOTxOTDUbckadIkg==
X-CSE-MsgGUID: fAxx8TqhRO+EiU7ecSOMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="194583581"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 13:01:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJeRE-0005rS-0a;
	Thu, 13 Nov 2025 21:01:04 +0000
Date: Fri, 14 Nov 2025 05:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:gr1 8/10] include/linux/find.h:541:38: warning: passing
 argument 2 of 'find_next_bit' makes integer from pointer without a cast
Message-ID: <202511140419.KCTiFaF4-lkp@intel.com>
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
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251114/202511140419.KCTiFaF4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140419.KCTiFaF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140419.KCTiFaF4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/nios2/kernel/asm-offsets.c:8:
   include/linux/find.h: In function '__for_each_and_wrap':
>> include/linux/find.h:541:38: warning: passing argument 2 of 'find_next_bit' makes integer from pointer without a cast [-Wint-conversion]
     541 |         bit = find_next_bit(bitmap1, bitmap2, start, n);
         |                                      ^~~~~~~
         |                                      |
         |                                      const long unsigned int *
   include/linux/find.h:63:70: note: expected 'long unsigned int' but argument is of type 'const long unsigned int *'
      63 | unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
         |                                                        ~~~~~~~~~~~~~~^~~~
   include/linux/find.h:541:15: error: too many arguments to function 'find_next_bit'
     541 |         bit = find_next_bit(bitmap1, bitmap2, start, n);
         |               ^~~~~~~~~~~~~
   include/linux/find.h:63:15: note: declared here
      63 | unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
         |               ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/nios2/kernel/asm-offsets.s] Error 1
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
