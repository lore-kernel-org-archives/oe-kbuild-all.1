Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBE942AFA9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075161; cv=none; b=Zxbt5al3ZyPVKRJMx92BUjGS5IKkqVuUWcTS2PvehxVlxUx4bWtLUxm6mEGDp2vD71XZ7XHHOgGyKl3vKxk5ZxI03jkzgZfRmKirxhagBYZPvxAVHh+2fZazWqKC0VaMGALvD5TMu3MCom3WhUG7W2/yCjDIW/hRC/oIQGx5prU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075161; c=relaxed/simple;
	bh=IawTxksbLdoQtjLcQx6qmRxSGThyH1QQ7RxndFI3xjA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dxS0sUtclYcJTP+vO7kvacKtKAbSFxdmgeIiLHubp/pUlqAf+8/h2N8PZ2OEWz+enlhafGez+KM3Pedimy0/2C0g47s9e5+E7p4seivvL/adQPa2DUR2cy0hj4bU5k0TXZtu5FK9oiYS47qOj2wwO1mJqEOxevBJUNQNJ+jfOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esiDtr60; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esiDtr60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789075153; x=1820611153;
  h=date:from:to:cc:subject:message-id;
  bh=IawTxksbLdoQtjLcQx6qmRxSGThyH1QQ7RxndFI3xjA=;
  b=esiDtr604gHGYl74jqQL/sU+efsYM2ce3K3Jym+ByQZdu9v+hXytTMZY
   PyXu60/ZJHCS74lJZqXYCHsZrwGueONWRSv+6Vydbx8vLI9uvCkLZn9g1
   PK7/MHw7dCzgdzY6g7bhFURWgDzxpWCd2VZl+xbegsfyWOqgFpPJ84qTY
   n1sZ8/mYOFOvsTiMUlDbWO1P3rLKR4Z/nmYv+XQfBrC5I0n+QAx+7XtbN
   586luv8RSVtnzWSXREmG+Nm+k8y4ZQEVO1tun9vjBhS3ZHmN0K9YBEPxK
   XarNXQY6Scw+9yaNcjI0ZndHLEOuoq5WKpR6aaHGI+3NHTFy8yy/d21Bb
   Q==;
X-CSE-ConnectionGUID: ecmzu29/RwW0nsOtrJ7Z/w==
X-CSE-MsgGUID: 6oMD+wP/TUa+N506hayjaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89377381"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89377381"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 14:19:08 -0700
X-CSE-ConnectionGUID: ulphI/UlRGOJg3xlh/3/qg==
X-CSE-MsgGUID: Mq914YN+Q8S5sAKZpi1JKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="269151317"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 14:19:06 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4mAh-000000000Yh-3ZJm;
	Thu, 10 Sep 2026 21:19:03 +0000
Date: Fri, 11 Sep 2026 05:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 barry.song@csr.com
Subject: [baohua:dev/kairui_scanbalance 9/9] mm/vmscan.c:1957:46:
 error: dereferencing pointer to incomplete type 'struct lru_gen_folio'
Message-ID: <202609110429.UIZ3Tr8e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git dev/kairui_scanbalance
head:   c96aacd4045a7a4c8d292e6c9ba6d169cdc0b570
commit: c96aacd4045a7a4c8d292e6c9ba6d169cdc0b570 [9/9] mm/mglru: avoid placing rejected folios below populated gen
config: powerpc-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110429.UIZ3Tr8e-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110429.UIZ3Tr8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110429.UIZ3Tr8e-lkp@intel.com/

All errors (new ones prefixed by >>):

                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                                               ^~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:3: note: in expansion of macro 'if'
      if (!(condition))     \
      ^~
   include/linux/compiler_types.h:690:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                                               ^~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:3: note: in expansion of macro 'if'
      if (!(condition))     \
      ^~
   include/linux/compiler_types.h:690:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   In file included from <command-line>:
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                                               ^~
   include/linux/compiler_types.h:626:13: note: in definition of macro '__unqual_scalar_typeof'
      _Generic((x),      \
                ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
     __READ_ONCE(x);       \
     ^~~~~~~~~~~
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/asm-generic/bug.h:5,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/vmscan.c:15:
   mm/vmscan.c:1955:44: error: 'struct lruvec' has no member named 'lrugen'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                                               ^~
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
    #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   mm/vmscan.c:1955:26: note: in expansion of macro 'READ_ONCE'
     unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
                             ^~~~~~~~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/vmscan.c:15:
>> mm/vmscan.c:1957:46: error: dereferencing pointer to incomplete type 'struct lru_gen_folio'
     if (folio_test_unevictable(folio) || !lrugen->enabled)
                                                 ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
   mm/vmscan.c:1957:2: note: in expansion of macro 'if'
     if (folio_test_unevictable(folio) || !lrugen->enabled)
     ^~
   mm/vmscan.c:1960:8: error: implicit declaration of function 'lru_gen_folio_seq'; did you mean 'lru_to_folio'? [-Werror=implicit-function-declaration]
     seq = lru_gen_folio_seq(lruvec, folio, false);
           ^~~~~~~~~~~~~~~~~
           lru_to_folio
   mm/vmscan.c:1962:8: error: implicit declaration of function 'lru_gen_from_seq'; did you mean 'lru_gen_set_refs'? [-Werror=implicit-function-declaration]
     gen = lru_gen_from_seq(seq);
           ^~~~~~~~~~~~~~~~
           lru_gen_set_refs
   mm/vmscan.c:1967:2: error: implicit declaration of function 'lru_gen_update_size'; did you mean 'huge_page_size'? [-Werror=implicit-function-declaration]
     lru_gen_update_size(lruvec, folio, -1, gen);
     ^~~~~~~~~~~~~~~~~~~
     huge_page_size
   mm/vmscan.c:1953:6: warning: variable 'zone' set but not used [-Wunused-but-set-variable]
     int zone = folio_zonenum(folio);
         ^~~~
   mm/vmscan.c:1952:6: warning: variable 'type' set but not used [-Wunused-but-set-variable]
     int type = folio_is_file_lru(folio);
         ^~~~
   cc1: some warnings being treated as errors


vim +1957 mm/vmscan.c

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
  1952		int type = folio_is_file_lru(folio);
  1953		int zone = folio_zonenum(folio);
  1954		struct lru_gen_folio *lrugen = &lruvec->lrugen;
> 1955		unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
  1956	
> 1957		if (folio_test_unevictable(folio) || !lrugen->enabled)
  1958			return false;
  1959	
  1960		seq = lru_gen_folio_seq(lruvec, folio, false);
  1961		seq = max(seq, min(scanned_seq + 1, max_seq));
  1962		gen = lru_gen_from_seq(seq);
  1963		flags = (gen + 1UL) << LRU_GEN_PGOFF;
  1964		/* see the comment on MIN_NR_GENS about PG_active */
  1965		set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active), flags);
  1966	
  1967		lru_gen_update_size(lruvec, folio, -1, gen);
  1968		list_add(&folio->lru, &lrugen->folios[gen][type][zone]);
  1969	
  1970		return true;
  1971	}
  1972	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
