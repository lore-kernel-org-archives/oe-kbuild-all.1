Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E1136E01
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717830748; cv=none; b=dC6F5YKQpz9FOJMVkJ1Fx8ihBcBpX3KR2pVe17RHi+Q3lRO4ZaSxJxbt+HfSDfHQYCr5V/Fou7/7Cqd1S1RVhistTs+4bAPsSl+C5nqbWM087HhqZaGvTiVPsiaLki3kjRnhmEnsEkNyjMrKWzRzw2B20xR4r60KjjYJO8Ywa/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717830748; c=relaxed/simple;
	bh=+EmydIY+tqyKAHtljJT7p4ieYhGNl4t2J1Jq0Pq7ZnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AEqtfHGTy8H2tvQfsIHk5+qyHz5EVpOgOY0AJWn8aBhBm5N3qArrvsJNwRu0g2dE+/kmBfkdY2CJZbVn4Hx4ctP4uwOlPc+SD0ZaBmATkBoOsNUE1J8zqCwEJ4NTb7jrcTdjknzhAja1P+OsuYpcelQhcKxzOUvNpq3ClHciVx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hs1haoOl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hs1haoOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717830744; x=1749366744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+EmydIY+tqyKAHtljJT7p4ieYhGNl4t2J1Jq0Pq7ZnQ=;
  b=Hs1haoOlVOrCy2htlg2bGXV1vXun3wVFjBInwjLXzzcKKTHdqFcZe0Sb
   //DOOX3uTOcV8YkX5N6qlnzhtTnvmI1bEIXPRuEvUDbezIpnaw35ijpFO
   J+GRw2lFTrlnGGbX8Y0NtwCW+y0X7ZCsgSckX0u+a9a+VJAuZhOuYSnse
   vRv6pKbAZvSEpYBxgmqLgw3Q/z6xgUqa5ZOi9Qj5m08phKY4nyyBmYs7H
   I2PxYvHfOTGiha/fkH2BbicbmQu0/CXT/qZedA6KRKMljWBmnGVUkn2xE
   KDQBw5bjjkGf5uGJqa/4hhyEzYLFs5IF/S+VxjqhYhhdtfoNzYcushwnX
   Q==;
X-CSE-ConnectionGUID: uVDKX1SeSwWvFqt5p4KvSg==
X-CSE-MsgGUID: +uGgewwWSTy1jnA7z9y80Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25975910"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25975910"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 00:12:23 -0700
X-CSE-ConnectionGUID: zGQY2z2GTeuYGN2R/RPpDQ==
X-CSE-MsgGUID: 4a76yKKsQVW1YrbSyEHhZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38538127"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2024 00:12:22 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFqFP-0001De-2I;
	Sat, 08 Jun 2024 07:12:19 +0000
Date: Sat, 8 Jun 2024 15:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 5/42] include/linux/find.h:385:15: error:
 static declaration of 'find_first_zero_bit' follows non-static declaration
Message-ID: <202406081500.Oorw7dyK-lkp@intel.com>
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
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240608/202406081500.Oorw7dyK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081500.Oorw7dyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081500.Oorw7dyK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/sbitmap.c:7:
   include/linux/find_atomic.h:294:8: error: call to undeclared function 'find_first_zero_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |         bit = find_first_zero_bit(addr, nbits);
         |               ^
   In file included from lib/sbitmap.c:8:
   In file included from include/linux/sched.h:13:
   In file included from arch/s390/include/asm/processor.h:33:
   In file included from include/linux/cpumask.h:13:
   In file included from include/linux/bitmap.h:11:
>> include/linux/find.h:385:15: error: static declaration of 'find_first_zero_bit' follows non-static declaration
     385 | unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
         |               ^
   include/linux/find_atomic.h:294:8: note: previous implicit declaration is here
     294 |         bit = find_first_zero_bit(addr, nbits);
         |               ^
   In file included from lib/sbitmap.c:11:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/sbitmap.c:11:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/sbitmap.c:11:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/sbitmap.c:11:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/sbitmap.c:11:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/sbitmap.c:11:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/sbitmap.c:11:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/sbitmap.c:11:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];


vim +/find_first_zero_bit +385 include/linux/find.h

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
