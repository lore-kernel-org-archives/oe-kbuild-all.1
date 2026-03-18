Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0840C1917FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829253; cv=none; b=epiw5/TTserEqJqjEqdry+TFt8mNMeYes0bMCFYwAS8NwWbIM3cry/WFNBbRBY+E0Ovf+m+WbXeFVR97PS7V7uqFYPYBm9pMM1kl1BqGIGwQxpTToPbo1Ul01a+epm8ZRASmN+uOTKOXj7q1YWMcgKjNTApN9989QphCuBDYj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829253; c=relaxed/simple;
	bh=h9t6DLQ8Gx5JyTDKW7R9479dzcpEfROs33l5r0QQdX0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=trBGYzvrfr4dO6w+8tUsAizYfNUYa4peohCYgTNZrz7GYq5ABcGceDD22UjcCeqsWgzgHyiN4ft6jWPiuzuCg1uWquuPcm2yvAYwQ9+OKYm7KKttXQuvmw5ViwI6ybS7JbpnTuIqECuq62DHDF3Ha2Rn1AJKu29WFhcVSKvKCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k04eeBTm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k04eeBTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773829251; x=1805365251;
  h=date:from:to:cc:subject:message-id;
  bh=h9t6DLQ8Gx5JyTDKW7R9479dzcpEfROs33l5r0QQdX0=;
  b=k04eeBTmlncqIhnTbMoAnwrGyH2L4A53jssiHKJFd7LE02XlLZsDdVcm
   IhraLfh5RvoqQ5ZBgVOd1e4eRY8EsJeSaFzfrSXJ4PoCO6kGD8mbvxyAr
   3VsmaI0P77dGkJm6xMv46OGUfg1hptpDGo7k+Zjj/Dpn6gTr1DRl2QULX
   4a7gXiIlRafeQFBanoiYmu8qXIRvMJsm5S3m1QZ38C45hsERhgYP1PSqM
   LHYAifp2oQuvmoFrdLnHQKkC+oigciqWfqnUFc7uvNToSXi1T2QwfYOdE
   uqb2niVI+GYZb+XRo6yj204VE1ZQjm/AHEOUbKVzr6l/MIZwBigObpVBf
   g==;
X-CSE-ConnectionGUID: YA6XKBcvR1C0HiF4pLRcrg==
X-CSE-MsgGUID: 1HcCA7CzQ8yy/lnVIXvbtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74578930"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74578930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 03:20:51 -0700
X-CSE-ConnectionGUID: 8ziTjBMRSouM4i/IMdiImw==
X-CSE-MsgGUID: 1p2WBOmoRQ226GW6WulFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="221817007"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Mar 2026 03:20:49 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2o18-000000002nl-0w8W;
	Wed, 18 Mar 2026 10:20:46 +0000
Date: Wed, 18 Mar 2026 18:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 88/95] include/linux/mm.h:3577:38:
 error: implicit declaration of function 'pmd_none'; did you mean 'p4d_none'?
Message-ID: <202603181834.KjOHRXtJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   01c25d61d382657141c2c31e1363a4daf850670a
commit: 6e531aff60e8712ce19732d51778d03784f9682a [88/95] treewide: Add lock context annotations in all include files
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260318/202603181834.KjOHRXtJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181834.KjOHRXtJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181834.KjOHRXtJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/jump_label.h:77,
                    from include/linux/once.h:6,
                    from include/linux/prandom.h:12,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/mm.h: In function 'pte_alloc_map_lock':
>> include/linux/mm.h:3577:38: error: implicit declaration of function 'pmd_none'; did you mean 'p4d_none'? [-Wimplicit-function-declaration]
    3577 | #define pte_alloc(mm, pmd) (unlikely(pmd_none(*(pmd))) && __pte_alloc(mm, pmd))
         |                                      ^~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/mm.h:3586:16: note: in expansion of macro 'pte_alloc'
    3586 |         return pte_alloc(mm, pmd) ? NULL :
         |                ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +3577 include/linux/mm.h

c74df32c724a165 Hugh Dickins            2005-10-29  3576  
4cf58924951ef80 Joel Fernandes (Google  2019-01-03 @3577) #define pte_alloc(mm, pmd) (unlikely(pmd_none(*(pmd))) && __pte_alloc(mm, pmd))
3ed3a4f0ddffece Kiryl Shutsemau         2016-03-17  3578  

:::::: The code at line 3577 was first introduced by commit
:::::: 4cf58924951ef80eec636b863e7a53973c44261a mm: treewide: remove unused address argument from pte_alloc functions

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
