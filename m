Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754F0238142
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 18:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757961253; cv=none; b=ZvfJoaN/bjxcB05kpLpVokR6xp82uHgteoeSN7NXDN+jufU6tos+mKSPckvQPEgynnyi/6OkQvRNx1BwhQMqT/21+2442SZ5kM3uAzQF0MDdGbCMzDUAd7erjXeJ2H++E7h6ZzOqLKQnxWfgHwrgSIP/I+eFsROdWjnP1DDKM7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757961253; c=relaxed/simple;
	bh=TZC+H6eRGc+Z3JEU3E9ernW85DbRAtUT36rFei+847E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dfx8qQ3/a2iUivygoNIlXMnFWKzCrhCmyK+/FqeMb0EpXhZgAUWnXF/7LT7J+kVGbEATUIUW073hrmToYF/xa2TwhqmDtauowQyByIz6t0OYdZMUnlQ7ztKuceDKQuGXqeKaGl85DbMllJzluLdyiNqe792njVLCO0FGRpvdXjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDrHjpX7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDrHjpX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757961251; x=1789497251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZC+H6eRGc+Z3JEU3E9ernW85DbRAtUT36rFei+847E=;
  b=XDrHjpX7Ow/5k6IumeKtg5w5cXVYt9L1y8fRcWIguuxRsVeGpFVSK+mS
   wrzBPqraSbc9WAoHcbO0TW9eSQLoW0s96TmoqoEyUK5hpBl6xXorPzk5n
   T+UK2UXjnlbmdNS5bCSXJ/YQFMq3n5+E+KkGikQFj4uX0Do9Qup0LneDp
   gCQqipx/9xsqbzs8+cTasDbO4gM92OeTKwKEd2peWuuV86dfeRlunMUG6
   S15APrzZ3pxHQC23Wot9iiTwt8ZvGadKL6fV6GeIlgXt8RD7mGSAjRpah
   j+MQvsBc/U8zt0Z4H8A2yo6SreqiYMui0Pr2JGDA1SRyJ+rKaPXG4iotg
   w==;
X-CSE-ConnectionGUID: Z73bFEDjSlOWsz32hjYyvQ==
X-CSE-MsgGUID: QDXSiHLLQjW9UCAjoFHf4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64036630"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64036630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 11:34:10 -0700
X-CSE-ConnectionGUID: 8/5D6YqKSJu/tMIX803gYA==
X-CSE-MsgGUID: lcODT8ceRA2A5kunGGrhTQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2025 11:34:09 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyE1e-0000ZT-2x;
	Mon, 15 Sep 2025 18:34:06 +0000
Date: Tue, 16 Sep 2025 02:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	SeongJae Park <sj@kernel.org>
Subject: [akpm-mm:mm-unstable 187/225] arch/m68k/include/asm/page.h:20:27:
 error: lvalue required as unary '&' operand
Message-ID: <202509160214.gDtkbWC8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   0f409ed671a46de4b172899f7814a5bf37a33d86
commit: 00cd88c03fd1c3242be5726998b3bf47afbf17a1 [187/225] mm/rmap: extend rmap and migration support device-private entries
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250916/202509160214.gDtkbWC8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509160214.gDtkbWC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509160214.gDtkbWC8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from mm/page_idle.c:2:
   mm/page_idle.c: In function 'page_idle_clear_pte_refs_one':
>> arch/m68k/include/asm/page.h:20:27: error: lvalue required as unary '&' operand
      20 | #define pmd_val(x)      ((&x)->pmd)
         |                           ^
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   arch/m68k/include/asm/motorola_pgtable.h:116:34: note: in expansion of macro 'pmd_val'
     116 | #define pmd_present(pmd)        (pmd_val(pmd) & _PAGE_TABLE)
         |                                  ^~~~~~~
   mm/page_idle.c:74:36: note: in expansion of macro 'pmd_present'
      74 |                         if (likely(pmd_present(pmdp_get(pvmw.pmd))))
         |                                    ^~~~~~~~~~~


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
