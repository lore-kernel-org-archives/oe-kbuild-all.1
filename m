Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DA288DB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712998069; cv=none; b=IF3jcOqNpCe4tPCOO8StENh4XI5wgSnRDErK8qMW6rxJjEYCw8xC2U1lfM85mZyQugEZQvgUYJfgUTu/vIaGONXBAlVROHUyhIU4Q/nH5VuYFas6wcdA9mlAPfPpRnC7OPe9ewlV6wbSVHTYW4ZxL/rnGwtVkpbWiRUZ8XghZfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712998069; c=relaxed/simple;
	bh=LhSvIEduc00iDldIz61FSZWRtRyr+HKhlNwCxJdIK5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9apKuJezjAYJClrHXdcD0Ceq04wUnpSxKUhK7mucI/MfJ68/WHjL0DWAMPgh7b3HA5V9nARLBGDRnfZJKXwVZ3jq6XgjAZHbXquRdThNBxBfffdZEGFLF4liwHcbyXCvz0nyQR2vgSzBTZGReAs34jpZmIm6PhPfyGy3wdY21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1zmVzeF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1zmVzeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712998067; x=1744534067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LhSvIEduc00iDldIz61FSZWRtRyr+HKhlNwCxJdIK5k=;
  b=e1zmVzeFrrsOW6NFFCHextXwhuv4eoqg4eMlb/BEcqA1WOsu/ynTDwt/
   YpzAYfaSy05AbWFuY4Li15Eq30vNCLmsK2hOICBLtOcWEvz3yJqimiaSo
   uUiZyU547qcqsn7XO++N8mIyYBftnZIoX8F5TUANUprpvG8jeQRMeGRCN
   lzTaVLP5racTMq5nAAdRuhUhzFdFOIbF5XiG0x+CRKB75GyvJBcnlAoj7
   zMEMFKADMlAHIVQpWZI2TxhUCTtQs5vas8HjR3IPf1CMnovQa2N3RpFk9
   ePvj9wUhO1V7AAt9OE+3yoX7/xUVYKrECu2E9pPXtJBcAhEN0XbvK0FB8
   g==;
X-CSE-ConnectionGUID: nsV66KjJSkS45vDuKBZAEA==
X-CSE-MsgGUID: tAQhdiWbQeanK7jdc92RHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19600652"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="19600652"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 01:47:47 -0700
X-CSE-ConnectionGUID: MUN/wkXIRxqmnNMtK/xV5Q==
X-CSE-MsgGUID: 47w0A5bYQAm4wdov7JDQRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21936842"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Apr 2024 01:47:45 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvZ31-000288-01;
	Sat, 13 Apr 2024 08:47:43 +0000
Date: Sat, 13 Apr 2024 16:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:xtensa-get_order 1/1]
 include/asm-generic/getorder.h:33:48: error: 'PAGE_SHIFT' undeclared
Message-ID: <202404131602.Mv27VmBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git xtensa-get_order
head:   5753575a2fd1f256be0791d70b403a9e45a6b28c
commit: 5753575a2fd1f256be0791d70b403a9e45a6b28c [1/1] xtensa: remove the get_order() implementation
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20240413/202404131602.Mv27VmBr-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131602.Mv27VmBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131602.Mv27VmBr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/page.h:20,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/ptrace.h:6,
                    from arch/xtensa/kernel/asm-offsets.c:21:
   include/asm-generic/getorder.h: In function 'get_order':
>> include/asm-generic/getorder.h:33:48: error: 'PAGE_SHIFT' undeclared (first use in this function)
      33 |                         return BITS_PER_LONG - PAGE_SHIFT;
         |                                                ^~~~~~~~~~
   include/asm-generic/getorder.h:33:48: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:117: arch/xtensa/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/PAGE_SHIFT +33 include/asm-generic/getorder.h

d66acc39c7cee3 include/asm-generic/getorder.h David Howells    2012-02-20   9  
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  10  /**
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  11   * get_order - Determine the allocation order of a memory size
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  12   * @size: The size for which to get the order
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  13   *
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  14   * Determine the allocation order of a particular sized block of memory.  This
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  15   * is on a logarithmic scale, where:
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  16   *
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  17   *	0 -> 2^0 * PAGE_SIZE and below
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  18   *	1 -> 2^1 * PAGE_SIZE to 2^0 * PAGE_SIZE + 1
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  19   *	2 -> 2^2 * PAGE_SIZE to 2^1 * PAGE_SIZE + 1
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  20   *	3 -> 2^3 * PAGE_SIZE to 2^2 * PAGE_SIZE + 1
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  21   *	4 -> 2^4 * PAGE_SIZE to 2^3 * PAGE_SIZE + 1
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  22   *	...
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  23   *
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  24   * The order returned is used to find the smallest allocation granule required
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  25   * to hold an object of the specified size.
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  26   *
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  27   * The result is undefined if the size is 0.
e0891a9816316b include/asm-generic/getorder.h David Howells    2012-02-20  28   */
0a571b085ff6da include/asm-generic/getorder.h Christophe Leroy 2020-12-15  29  static __always_inline __attribute_const__ int get_order(unsigned long size)
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  30  {
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  31  	if (__builtin_constant_p(size)) {
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  32  		if (!size)
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02 @33  			return BITS_PER_LONG - PAGE_SHIFT;
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  34  
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  35  		if (size < (1UL << PAGE_SHIFT))
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  36  			return 0;
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  37  
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  38  		return ilog2((size) - 1) - PAGE_SHIFT + 1;
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  39  	}
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  40  
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  41  	size--;
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  42  	size >>= PAGE_SHIFT;
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  43  #if BITS_PER_LONG == 32
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  44  	return fls(size);
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  45  #else
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  46  	return fls64(size);
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  47  #endif
cbedfe11347fe4 include/asm-generic/getorder.h Qian Cai         2019-08-02  48  }
fd4fd5aac12828 include/asm-generic/page.h     Stephen Rothwell 2005-09-03  49  

:::::: The code at line 33 was first introduced by commit
:::::: cbedfe11347fe418621bd188d58a206beb676218 asm-generic: fix -Wtype-limits compiler warnings

:::::: TO: Qian Cai <cai@lca.pw>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
