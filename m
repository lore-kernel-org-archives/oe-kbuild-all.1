Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053DE38E100
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029075; cv=none; b=f3wW+PVF/iGflIpK+XjK++JqvLJU6OlnW3mbRwbARq8NTfW8GDLh/0st32NemkwXaNYPyO6fqayKRwc6TuDC+c2Y5nTjJt+j5k7qevazLfS61x1RRzMggptsruFXGRDtT6xHitrl1fB5fylZMzR2BZE5YcOwosQChNG99KfLiWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029075; c=relaxed/simple;
	bh=EbMmTU7fLPivajyYSwoJ3YfsJpgKKnzVrH3AmmeYbWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gseeu0k+NKfDBSdtaTDFaX6VAC/zyPButqmQRzt0COCFaJjBuhH0Dz2KUBrda2bK3LYUHsUQ2gr9Nu8jLTAEiX1CDWUkUUFY3ZhCb0Ci4e9tBIRDcAwAYKcCTTMSRJmARyZ0QPByrUytUCMrfUjkvT6QZiIbLQdGCHelY15bG6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bas6O/WF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bas6O/WF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789029073; x=1820565073;
  h=date:from:to:cc:subject:message-id;
  bh=EbMmTU7fLPivajyYSwoJ3YfsJpgKKnzVrH3AmmeYbWY=;
  b=Bas6O/WFwYC2OWOQrKRNrb1fusvAJEc4JUAq+R0Cl6OsniEDMgr/LL9v
   1tNtySTiJEBQZ46Z792JQx1RRu2AARklsMK3hPv1ynnPuxuJJbT5t7fho
   jsmQ2SAhpgLjw+tpWRTfOZFfRA+HNBZBDwfEIMYVG1UFKaORXPOyLDx2I
   dk7Tl2VYKB1u8AW/iTXkp135pWtEX66epdKe7QDvFooiAyumnv509ACnQ
   oqCUPYYfm1bJ5hhUdwMPRUUTbtIfs1IlKewMXO1BIYum0Hq091kuvpDWE
   FVAdFek/NMonuqY1wvrUjnkgQ2TmxZNnBZVlRToNx0+ADyXy96Y/2jMDo
   g==;
X-CSE-ConnectionGUID: ef0TYJBkQtu8MPXMDJg2sg==
X-CSE-MsgGUID: 7xOqVPiiQ6GePJuzzA5aIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100133697"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100133697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:31:10 -0700
X-CSE-ConnectionGUID: 276tAET0R2+fsWrn06/3ng==
X-CSE-MsgGUID: m3gKOmSiS8yt+RGdS1gQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301466410"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 01:31:09 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4aBW-000000001aM-2dEV;
	Thu, 10 Sep 2026 08:31:06 +0000
Date: Thu, 10 Sep 2026 16:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 barry.song@csr.com
Subject: [baohua:dev/kairui_scanbalance 9/9] mm/vmscan.c:1953:6:
 warning: variable 'zone' set but not used
Message-ID: <202609101609.c4jRncpS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git dev/kairui_scanbalance
head:   c96aacd4045a7a4c8d292e6c9ba6d169cdc0b570
commit: c96aacd4045a7a4c8d292e6c9ba6d169cdc0b570 [9/9] mm/mglru: avoid placing rejected folios below populated gen
config: arm64-randconfig-r072-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101609.c4jRncpS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101609.c4jRncpS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101609.c4jRncpS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                            ^~
   include/linux/compiler_types.h:682:9: note: in definition of macro '__compiletime_assert'
     682 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                            ^~
   include/linux/compiler_types.h:682:9: note: in definition of macro '__compiletime_assert'
     682 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   In file included from <command-line>:
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                            ^~
   include/linux/compiler_types.h:626:13: note: in definition of macro '__unqual_scalar_typeof'
     626 |   _Generic((x),      \
         |             ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
      50 |  __READ_ONCE(x);       \
         |  ^~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   In file included from arch/arm64/include/asm/rwonce.h:81,
                    from include/linux/compiler.h:369,
                    from include/asm-generic/bug.h:5,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/vmscan.c:15:
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                                            ^~
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                        ^
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
    1955 |  unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
         |                          ^~~~~~~~~
   mm/vmscan.c:1957:46: error: invalid use of undefined type 'struct lru_gen_folio'
    1957 |  if (folio_test_unevictable(folio) || !lrugen->enabled)
         |                                              ^~
   mm/vmscan.c:1960:8: error: implicit declaration of function 'lru_gen_folio_seq' [-Werror=implicit-function-declaration]
    1960 |  seq = lru_gen_folio_seq(lruvec, folio, false);
         |        ^~~~~~~~~~~~~~~~~
   mm/vmscan.c:1962:8: error: implicit declaration of function 'lru_gen_from_seq' [-Werror=implicit-function-declaration]
    1962 |  gen = lru_gen_from_seq(seq);
         |        ^~~~~~~~~~~~~~~~
   mm/vmscan.c:1967:2: error: implicit declaration of function 'lru_gen_update_size'; did you mean 'huge_page_size'? [-Werror=implicit-function-declaration]
    1967 |  lru_gen_update_size(lruvec, folio, -1, gen);
         |  ^~~~~~~~~~~~~~~~~~~
         |  huge_page_size
   mm/vmscan.c:1968:31: error: invalid use of undefined type 'struct lru_gen_folio'
    1968 |  list_add(&folio->lru, &lrugen->folios[gen][type][zone]);
         |                               ^~
>> mm/vmscan.c:1953:6: warning: variable 'zone' set but not used [-Wunused-but-set-variable]
    1953 |  int zone = folio_zonenum(folio);
         |      ^~~~
>> mm/vmscan.c:1952:6: warning: variable 'type' set but not used [-Wunused-but-set-variable]
    1952 |  int type = folio_is_file_lru(folio);
         |      ^~~~
   cc1: some warnings being treated as errors


vim +/zone +1953 mm/vmscan.c

  1938	
  1939	/*
  1940	 * Even though we have called folio_set_active() for rejected folios
  1941	 * in evict_folios(), they may still be demoted or placed in the last
  1942	 * populated generation since we can now scan all generations.
  1943	 * Make sure these folios are neither demoted nor placed in the last
  1944	 * populated generation, unless it is also the youngest generation
  1945	 */
  1946	static inline bool lru_gen_add_rejected_folio(struct lruvec *lruvec, struct folio *folio,
  1947			unsigned long scanned_seq)
  1948	{
  1949		unsigned long seq;
  1950		unsigned long flags;
  1951		int gen;
> 1952		int type = folio_is_file_lru(folio);
> 1953		int zone = folio_zonenum(folio);
  1954		struct lru_gen_folio *lrugen = &lruvec->lrugen;
  1955		unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
  1956	
  1957		if (folio_test_unevictable(folio) || !lrugen->enabled)
  1958			return false;
  1959	
  1960		seq = lru_gen_folio_seq(lruvec, folio, false);
  1961		seq = max(seq, min(scanned_seq + 1, max_seq));
  1962		gen = lru_gen_from_seq(seq);
  1963		flags = (gen + 1UL) << LRU_GEN_PGOFF;
  1964		/* see the comment on MIN_NR_GENS about PG_active */
  1965		set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active), flags);
  1966	
> 1967		lru_gen_update_size(lruvec, folio, -1, gen);
> 1968		list_add(&folio->lru, &lrugen->folios[gen][type][zone]);
  1969	
  1970		return true;
  1971	}
  1972	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
