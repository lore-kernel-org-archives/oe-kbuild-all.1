Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8828480
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717828228; cv=none; b=Foq9EU48cfU1rpWpsl6wFsP4hlHP/m3xrOJtbbjKdirvxQ4BgedyI8n28VGLY9Bl+MS3eSERxcBvw8TDnq6x4JeOQk1e1BEsdDi0719DMY6KTTEvL5VE83FP3FbVfUz75I+6KB6VIqlFnXfVg2C7SG8qwYbPYaGisXqcfprVQKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717828228; c=relaxed/simple;
	bh=Vukbv0/0L5GYXNZX5EF+NvRyj9c2AJ4mMnw4XZcOmWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYpSVmlHg1txvquoXv7a42ZfHe5WOHVUKARfAFm2wGW9n3QLNAf/Tcm/HL0RkbTe0gWehWD+Z0PhlweRj2Oc8PerOYzwkhnqp/ZK93ERDpEcBlcw72Pel1uo0tAPhCnCeotiud4E6vhfD0WTbK5Kjyt8zQOvOwp31EqVp4MxEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cchVzjGT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cchVzjGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717828224; x=1749364224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vukbv0/0L5GYXNZX5EF+NvRyj9c2AJ4mMnw4XZcOmWc=;
  b=cchVzjGTZCvpj9ya28TscsY7jSs+Ag7njx3UW3ck4X3aQyZQP/ESkqz5
   wGhw9pPQQYIy/002xtBIcWJ2fN8/UM2lktOS98x4idXdN7MwtKextu8zT
   efEUOuwvpkEv3IQl56h5ieQagwWmx8SRuMG5iN802R0dfZzekYPVcNucJ
   TJmaypnyJTX4z3szt6RSJef/J0NyBjPofdO4MtaCXrxMStX5ybDHhxVir
   6O6PZtJ1bckpfT+mXoyHcCn3+asRphSee4biobfaouuh6Be4227s1evUy
   K8dbj4uaDdE+rNGLvGpf5ASFN750AtTVOujkSHvrPgBtkyeqWm9cFWQmx
   w==;
X-CSE-ConnectionGUID: QmeKmkAuQC+B4+U/vOxxrQ==
X-CSE-MsgGUID: 14x5k8V+Sr+z/LPIO4uxLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14693632"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14693632"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 23:30:23 -0700
X-CSE-ConnectionGUID: sOgZbJsSTO+ZlSK9l1HEjA==
X-CSE-MsgGUID: OpWC4uHlTvmLBw/Z/swIAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38387656"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jun 2024 23:30:20 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFpaj-0001Ay-2t;
	Sat, 08 Jun 2024 06:30:17 +0000
Date: Sat, 8 Jun 2024 14:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 5/42] include/linux/find.h:385:15: error:
 conflicting types for 'find_first_zero_bit'; have 'long unsigned int(const
 long unsigned int *, long unsigned int)'
Message-ID: <202406081442.MU8MfHBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find-and-bit-v6
head:   01a427072a49f0674209d92684f2bc928b2509a1
commit: b6e5ee294460ddd054ff842f5dea2763d8c6b1ac [5/42] lib/sbitmap; optimize __sbitmap_get_word() by using find_and_set_bit()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240608/202406081442.MU8MfHBf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081442.MU8MfHBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081442.MU8MfHBf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/sbitmap.c:7:
   include/linux/find_atomic.h: In function '__find_and_set_bit':
   include/linux/find_atomic.h:294:15: error: implicit declaration of function 'find_first_zero_bit' [-Werror=implicit-function-declaration]
     294 |         bit = find_first_zero_bit(addr, nbits);
         |               ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:13,
                    from include/linux/sched.h:16,
                    from lib/sbitmap.c:8:
   include/linux/find.h: At top level:
>> include/linux/find.h:385:15: error: conflicting types for 'find_first_zero_bit'; have 'long unsigned int(const long unsigned int *, long unsigned int)'
     385 | unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/find_atomic.h:294:15: note: previous implicit declaration of 'find_first_zero_bit' with type 'int()'
     294 |         bit = find_first_zero_bit(addr, nbits);
         |               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +385 include/linux/find.h

cdc66553c41307 include/linux/find.h              Dawei Li       2024-04-16  374  
b7ec62d7ee0f0b include/asm-generic/bitops/find.h Yury Norov     2021-08-14  375  #ifndef find_first_zero_bit
708ff2a0097b02 include/asm-generic/bitops/find.h Akinobu Mita   2010-09-29  376  /**
708ff2a0097b02 include/asm-generic/bitops/find.h Akinobu Mita   2010-09-29  377   * find_first_zero_bit - find the first cleared bit in a memory region
708ff2a0097b02 include/asm-generic/bitops/find.h Akinobu Mita   2010-09-29  378   * @addr: The address to start the search at
ec778edf97dcaa include/asm-generic/bitops/find.h Cody P Schafer 2013-11-12  379   * @size: The maximum number of bits to search
708ff2a0097b02 include/asm-generic/bitops/find.h Akinobu Mita   2010-09-29  380   *
708ff2a0097b02 include/asm-generic/bitops/find.h Akinobu Mita   2010-09-29  381   * Returns the bit number of the first cleared bit.
ec778edf97dcaa include/asm-generic/bitops/find.h Cody P Schafer 2013-11-12  382   * If no bits are zero, returns @size.
708ff2a0097b02 include/asm-generic/bitops/find.h Akinobu Mita   2010-09-29  383   */
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  384  static inline
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06 @385  unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  386  {
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  387  	if (small_const_nbits(size)) {
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  388  		unsigned long val = *addr | ~GENMASK(size - 1, 0);
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  389  
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  390  		return val == ~0UL ? size : ffz(val);
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  391  	}
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  392  
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  393  	return _find_first_zero_bit(addr, size);
2cc7b6a44ac21d include/asm-generic/bitops/find.h Yury Norov     2021-05-06  394  }
b7ec62d7ee0f0b include/asm-generic/bitops/find.h Yury Norov     2021-08-14  395  #endif
b7ec62d7ee0f0b include/asm-generic/bitops/find.h Yury Norov     2021-08-14  396  

:::::: The code at line 385 was first introduced by commit
:::::: 2cc7b6a44ac21d31b398b03f4845c53152070416 lib: add fast path for find_first_*_bit() and find_last_bit()

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
