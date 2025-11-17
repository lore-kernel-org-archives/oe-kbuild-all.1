Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5D335072
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763389811; cv=none; b=GPaNGbY0wFsKGlPxnlguxfgw6FxjRHTI92zW7udSFuh/oznZkEPGLpXgEjJpiIBeYlI9454pz7w0Ri8jLLC0pGMRDVDdxeud7fXB+VY1WvZG28iaXpc9mzomOAhxuCFLQqsZ6Fec143eqCYw0iWaAHOzNGNx/qtKma/43eQ0zMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763389811; c=relaxed/simple;
	bh=PTbbaJoSZw2Ty/iJGv67pSMKbEpK04mxLQb2w4oEG3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kv41a9HSb1rw7h594MsVqv67KRnFgxTYHs4j8HcUL36MEu0cCUWYim1FQ91EGN8aHFqHX7jVaYyx7lPlyrvpwNIbiiYdk9ZUdsufka+VWsE1Ewh3HDRPqPLf3OwbGqbFy/nYXavYODHGB4pvdz7zssGniJ2KKkcqmMg73zn5X+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErkA6k3V; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErkA6k3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763389810; x=1794925810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PTbbaJoSZw2Ty/iJGv67pSMKbEpK04mxLQb2w4oEG3c=;
  b=ErkA6k3VTwujepUlrPAXBLIw7EjVXQytmSu+nY+IYVnro/a6d9WoNAYQ
   agK6iLpheLQRoNzvHuA0i8kpzdsKZEjJO8IEJzBRSpmH3stc4i47fgRwa
   EOW1cpeDdW6B/mpjl8/3RIdubzXKLuBlyG//doPuISRQhgVXGrPkGaNll
   2+5roMzTqMg0N3YUKtuW37GyWHyrYUF0kE/APhxzffonaGoVrt23q20eJ
   G0JHSqHxYCuLTK9Vufdi52tcWTyXXkeZdYPFZ23iqmnNxMkIa7HHgofmz
   nzfeC3mEYZrLUaaQsmEss22VEOzQAsgwUOjyYrB2x/kr06QhyeZYCpa8d
   Q==;
X-CSE-ConnectionGUID: 5IVZFpGpRpaYs5bAnx6PyQ==
X-CSE-MsgGUID: dQREXlVdRwSbecntGhekDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90866826"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="90866826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 06:30:09 -0800
X-CSE-ConnectionGUID: sWs9Nb5rRjKt3GCAR+eukQ==
X-CSE-MsgGUID: 20lk6izOTvur9YCCf4rLmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195404100"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2025 06:30:08 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL0F3-0000fL-2b;
	Mon, 17 Nov 2025 14:30:05 +0000
Date: Mon, 17 Nov 2025 22:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8868/9360] arch/m68k/include/asm/page.h:20:27:
 error: lvalue required as unary '&' operand
Message-ID: <202511172257.CjElDcRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0c1c7a6a83feaf2cf182c52983ffe330ffb50280
commit: f54f0efb9d91fa2eee95a7eb29d0051f2176df47 [8868/9360] mm/damon/vaddr: cleanup using pmd_trans_huge_lock()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251117/202511172257.CjElDcRX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511172257.CjElDcRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511172257.CjElDcRX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/highmem.h:5,
                    from mm/damon/vaddr.c:10:
   mm/damon/vaddr.c: In function 'damon_mkold_pmd_entry':
>> arch/m68k/include/asm/page.h:20:27: error: lvalue required as unary '&' operand
      20 | #define pmd_val(x)      ((&x)->pmd)
         |                           ^
   arch/m68k/include/asm/motorola_pgtable.h:116:34: note: in expansion of macro 'pmd_val'
     116 | #define pmd_present(pmd)        (pmd_val(pmd) & _PAGE_TABLE)
         |                                  ^~~~~~~
   mm/damon/vaddr.c:314:21: note: in expansion of macro 'pmd_present'
     314 |                 if (pmd_present(pmdp_get(pmd)))
         |                     ^~~~~~~~~~~


vim +20 arch/m68k/include/asm/page.h

138ff3462f53a7 Greg Ungerer   2010-09-07  14  
138ff3462f53a7 Greg Ungerer   2010-09-07  15  /*
138ff3462f53a7 Greg Ungerer   2010-09-07  16   * These are used to make use of C type-checking..
138ff3462f53a7 Greg Ungerer   2010-09-07  17   */
60e50f34b13e9e Mike Rapoport  2019-12-04  18  #if !defined(CONFIG_MMU) || CONFIG_PGTABLE_LEVELS == 3
ef22d8abd876e8 Peter Zijlstra 2020-01-31  19  typedef struct { unsigned long pmd; } pmd_t;
ef22d8abd876e8 Peter Zijlstra 2020-01-31 @20  #define pmd_val(x)	((&x)->pmd)
ef22d8abd876e8 Peter Zijlstra 2020-01-31  21  #define __pmd(x)	((pmd_t) { (x) } )
60e50f34b13e9e Mike Rapoport  2019-12-04  22  #endif
60e50f34b13e9e Mike Rapoport  2019-12-04  23  

:::::: The code at line 20 was first introduced by commit
:::::: ef22d8abd876e805b604e8f655127de2beee2869 m68k: mm: Restructure Motorola MMU page-table layout

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
