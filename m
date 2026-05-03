Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5D23AEF4B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777798775; cv=none; b=X7CvLU0HsB73IzM7DBr/50LJLLXVy+vLZ/4BaQb0yw9LdIqXiPKCm9gvadj2ouGdz/ifgLAJEEBjg3Jp9s9E53/sQeYb85qB1BhDKffFDRiP7U2D21TO0q52uCWsWzM8K7DoSRTNxEFIIE7AxyD3C36D405Zkkx7XK6gGr5w+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777798775; c=relaxed/simple;
	bh=0f90sCT/ymX4HJVnlktsJ/rIPTSnllininZjBSv7niM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxWk8/Z9GOAUg7KexgPJ4N3vo6LrHoa1+PM978PPERoJeOnXGDi372cBETr942jMwQwir2sZWlWH39WHgdTYMGgLBrUfHErt4Q6PtRS9gQDll0bnHdYExSfFWlA2zg/jBgXUmvku+ErWNOIwbg1GxdETfoaRKRu1vW4Zo0i5a18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ek3wcBGY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ek3wcBGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777798773; x=1809334773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0f90sCT/ymX4HJVnlktsJ/rIPTSnllininZjBSv7niM=;
  b=Ek3wcBGYEI7weKT7tH1SX18FjlI1pTBcLxAHLnqLjXVZjS/cr7eOzWNu
   NeTPYtValpaweLhxv/X6zidmWABQgLdgDAYUNWcwmCDaonfFbG1xui1ru
   Q2112kaO0w5NH2L7tOODS7FpYVd6nyAkpDO7+KR4TPmLxZDx03YbiuQmw
   b0Zsfh8MZb2F49tWAoZb8cRA4HPzvrARkIrO6o6L87eDvGlk5kO78/RfK
   o6ZL3WJMfcqv+en1zZ5MwLLEmbzYsHZrad8/xGcgIdXV0Y62EY3enxEnk
   h1SD1t6MfkxmlqCHUZWS+ibsbjYfJ/aSK3fM4rXtnmK1Nap6qjj+pR6QF
   Q==;
X-CSE-ConnectionGUID: dFwYFO85SFCh2KMU8BOY4A==
X-CSE-MsgGUID: XR+gRn3ASp60sWZkq0cONg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82561347"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82561347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 01:59:32 -0700
X-CSE-ConnectionGUID: 8LGW6XpzQcKdrl3KkDt72A==
X-CSE-MsgGUID: ZpMRqhu6QcCIOgKHI6Nuvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="234219050"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2026 01:59:31 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJSff-000000002Nl-3Jou;
	Sun, 03 May 2026 08:59:27 +0000
Date: Sun, 3 May 2026 16:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alireza Haghdoost via B4 Relay <devnull+haghdoost.uber.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] memcg: add per-cgroup dirty page controls
 (dirty_ratio, dirty_min)
Message-ID: <202605031656.ByQM5ZN9-lkp@intel.com>
References: <20260501-rfc-memcg-dirty-v1-v1-1-9a8c80036ec1@uber.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-rfc-memcg-dirty-v1-v1-1-9a8c80036ec1@uber.com>

Hi Alireza,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 254f49634ee16a731174d2ae34bc50bd5f45e731]

url:    https://github.com/intel-lab-lkp/linux/commits/Alireza-Haghdoost-via-B4-Relay/memcg-add-per-cgroup-dirty-page-controls-dirty_ratio-dirty_min/20260502-235916
base:   254f49634ee16a731174d2ae34bc50bd5f45e731
patch link:    https://lore.kernel.org/r/20260501-rfc-memcg-dirty-v1-v1-1-9a8c80036ec1%40uber.com
patch subject: [PATCH RFC] memcg: add per-cgroup dirty page controls (dirty_ratio, dirty_min)
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031656.ByQM5ZN9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031656.ByQM5ZN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031656.ByQM5ZN9-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:428:25: note: in expansion of macro 'READ_ONCE'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                         ^~~~~~~~~
   mm/page-writeback.c:428:40: error: invalid use of undefined type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                        ^~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:428:25: note: in expansion of macro 'READ_ONCE'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                         ^~~~~~~~~
   mm/page-writeback.c:428:40: error: invalid use of undefined type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                        ^~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:428:25: note: in expansion of macro 'READ_ONCE'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                         ^~~~~~~~~
   mm/page-writeback.c:428:40: error: invalid use of undefined type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                        ^~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:428:25: note: in expansion of macro 'READ_ONCE'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                         ^~~~~~~~~
   mm/page-writeback.c:428:40: error: invalid use of undefined type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                        ^~
   include/linux/compiler_types.h:635:53: note: in definition of macro '__unqual_scalar_typeof'
     635 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/page-writeback.c:428:25: note: in expansion of macro 'READ_ONCE'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                         ^~~~~~~~~
   In file included from ./arch/openrisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from mm/page-writeback.c:15:
   mm/page-writeback.c:428:40: error: invalid use of undefined type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                        ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/page-writeback.c:428:25: note: in expansion of macro 'READ_ONCE'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                         ^~~~~~~~~
   mm/page-writeback.c: In function 'balance_dirty_pages':
   mm/page-writeback.c:1912:33: error: implicit declaration of function 'mem_cgroup_from_task'; did you mean 'mem_cgroup_from_css'? [-Wimplicit-function-declaration]
    1912 |                                 mem_cgroup_from_task(current);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 mem_cgroup_from_css
>> mm/page-writeback.c:1912:33: error: initialization of 'struct mem_cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/page-writeback.c:1915:63: error: invalid use of undefined type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                               ^~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1915:48: note: in expansion of macro 'READ_ONCE'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                ^~~~~~~~~
   mm/page-writeback.c:1915:63: error: invalid use of undefined type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                               ^~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1915:48: note: in expansion of macro 'READ_ONCE'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                ^~~~~~~~~
   mm/page-writeback.c:1915:63: error: invalid use of undefined type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                               ^~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1915:48: note: in expansion of macro 'READ_ONCE'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                ^~~~~~~~~
   mm/page-writeback.c:1915:63: error: invalid use of undefined type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                               ^~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1915:48: note: in expansion of macro 'READ_ONCE'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                ^~~~~~~~~
   mm/page-writeback.c:1915:63: error: invalid use of undefined type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                               ^~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1915:48: note: in expansion of macro 'READ_ONCE'


vim +1912 mm/page-writeback.c

  1853	
  1854	/*
  1855	 * balance_dirty_pages() must be called by processes which are generating dirty
  1856	 * data.  It looks at the number of dirty pages in the machine and will force
  1857	 * the caller to wait once crossing the (background_thresh + dirty_thresh) / 2.
  1858	 * If we're over `background_thresh' then the writeback threads are woken to
  1859	 * perform some writeout.
  1860	 */
  1861	static int balance_dirty_pages(struct bdi_writeback *wb,
  1862				       unsigned long pages_dirtied, unsigned int flags)
  1863	{
  1864		struct dirty_throttle_control gdtc_stor = { GDTC_INIT(wb) };
  1865		struct dirty_throttle_control mdtc_stor = { MDTC_INIT(wb, &gdtc_stor) };
  1866		struct dirty_throttle_control * const gdtc = &gdtc_stor;
  1867		struct dirty_throttle_control * const mdtc = mdtc_valid(&mdtc_stor) ?
  1868							     &mdtc_stor : NULL;
  1869		struct dirty_throttle_control *sdtc;
  1870		unsigned long nr_dirty;
  1871		long period;
  1872		long pause;
  1873		long max_pause;
  1874		long min_pause;
  1875		int nr_dirtied_pause;
  1876		unsigned long task_ratelimit;
  1877		unsigned long dirty_ratelimit;
  1878		struct backing_dev_info *bdi = wb->bdi;
  1879		bool strictlimit = bdi->capabilities & BDI_CAP_STRICTLIMIT;
  1880		unsigned long start_time = jiffies;
  1881		int ret = 0;
  1882	
  1883		for (;;) {
  1884			unsigned long cg_dirty_min = 0;
  1885			unsigned long cg_dirty_pages = 0;
  1886			unsigned long now = jiffies;
  1887	
  1888			nr_dirty = global_node_page_state(NR_FILE_DIRTY);
  1889	
  1890			balance_domain_limits(gdtc, strictlimit);
  1891	
  1892			/*
  1893			 * Under RCU, snapshot the current memcg's memory.dirty_min
  1894			 * reservation.  When it is non-zero, also snapshot the
  1895			 * memcg-wide dirty backlog.  These feed the per-writer
  1896			 * dirty_min bypass below; the dirty_ratio clamp itself
  1897			 * is applied inside domain_dirty_limits() keyed on
  1898			 * wb->memcg_css so balance_dirty_pages(),
  1899			 * wb_over_bg_thresh() (flusher kworker context), and
  1900			 * cgwb_calc_thresh() all see a consistent clamped
  1901			 * threshold.
  1902			 *
  1903			 * rcu_read_lock() is held only for the __rcu dereference
  1904			 * of current->cgroups; the memcg pointer does not escape
  1905			 * the critical section.  The counter read matches
  1906			 * domain_dirty_avail(mdtc, true) so the bypass compares
  1907			 * the same dirty+in-flight backlog the global path uses.
  1908			 */
  1909			rcu_read_lock();
  1910			{
  1911				struct mem_cgroup *memcg =
> 1912					mem_cgroup_from_task(current);
  1913	
  1914				if (memcg) {
  1915					cg_dirty_min = READ_ONCE(memcg->dirty_min);
  1916					if (cg_dirty_min)
  1917						cg_dirty_pages =
  1918							memcg_page_state(memcg,
  1919									 NR_FILE_DIRTY) +
  1920							memcg_page_state(memcg,
  1921									 NR_WRITEBACK);
  1922				}
  1923			}
  1924			rcu_read_unlock();
  1925	
  1926			if (mdtc) {
  1927				/*
  1928				 * For !root memcg, repeat the same three-step
  1929				 * sequence as balance_domain_limits(gdtc):
  1930				 * avail -> limits -> freerun.  We inline it here
  1931				 * so we can insert the mdtc->dirty override
  1932				 * between step 2 (domain_dirty_limits, which
  1933				 * publishes the per-memcg dirty_ratio clamp on
  1934				 * cg_dirty_cap) and step 3 (domain_dirty_freerun,
  1935				 * which consumes mdtc->dirty along with
  1936				 * thresh/bg_thresh).
  1937				 */
  1938				domain_dirty_avail(mdtc, true);
  1939				domain_dirty_limits(mdtc);
  1940	
  1941				/*
  1942				 * When the dirty_ratio clamp engaged, replace the
  1943				 * per-wb dirty count from mem_cgroup_wb_stats()
  1944				 * with the memcg-wide NR_FILE_DIRTY + NR_WRITEBACK
  1945				 * sum so freerun, the setpoint, and the rate-limit
  1946				 * smoothing see the true memcg backlog instead of
  1947				 * the subset that has migrated to this cgwb (cgwb
  1948				 * migration is lazy and can lag by many seconds),
  1949				 * and so a burst of buffered writes cannot silently
  1950				 * bypass the clamp by shifting pages from
  1951				 * NR_FILE_DIRTY into NR_WRITEBACK.
  1952				 *
  1953				 * Keyed on wb->memcg_css to match the clamp itself.
  1954				 * The cgwb holds a css reference, so the memcg
  1955				 * pointer is stable without additional locking.
  1956				 *
  1957				 * Caveat: memcg_page_state() aggregates across ALL
  1958				 * backing devices owned by this memcg, while mdtc
  1959				 * is scoped to one wb.  A writer to a fast BDI may
  1960				 * observe backlog accumulated on slow BDIs in the
  1961				 * same memcg and throttle more than strictly needed.
  1962				 * Accepted for v1; the alternative (summing per-wb
  1963				 * dirty across the memcg's cgwbs) walks the cgwb
  1964				 * list under RCU on a hot path.
  1965				 */
  1966				if (mdtc->cg_dirty_cap != PAGE_COUNTER_MAX) {
  1967					struct mem_cgroup *wb_memcg =
  1968						mem_cgroup_from_css(mdtc->wb->memcg_css);
  1969	
  1970					if (wb_memcg)
  1971						mdtc->dirty =
  1972							memcg_page_state(wb_memcg,
  1973									 NR_FILE_DIRTY) +
  1974							memcg_page_state(wb_memcg,
  1975									 NR_WRITEBACK);
  1976				}
  1977	
  1978				domain_dirty_freerun(mdtc, strictlimit);
  1979			}
  1980	
  1981			if (nr_dirty > gdtc->bg_thresh && !writeback_in_progress(wb))
  1982				wb_start_background_writeback(wb);
  1983	
  1984			/*
  1985			 * dirty_min bypass: when the current memcg's dirty+in-flight
  1986			 * backlog is below its memory.dirty_min reservation, let the
  1987			 * writer proceed without throttling.  This check must live
  1988			 * outside the if (mdtc) block because a writer's file may not
  1989			 * yet have been migrated to a cgwb; without cgwb, mdtc is NULL
  1990			 * and the per-memcg block above is skipped entirely.
  1991			 *
  1992			 * cg_dirty_min and cg_dirty_pages come from the per-iteration
  1993			 * snapshot taken above under rcu_read_lock; both are stored
  1994			 * in pages (page_counter_memparse converts bytes -> pages for
  1995			 * dirty_min), so no unit conversion is needed.
  1996			 */
  1997			if (cg_dirty_min && cg_dirty_pages < cg_dirty_min)
  1998				goto free_running;
  1999	
  2000			/*
  2001			 * If memcg domain is in effect, @dirty should be under
  2002			 * both global and memcg freerun ceilings.
  2003			 */
  2004			if (gdtc->freerun && (!mdtc || mdtc->freerun)) {
  2005				unsigned long intv;
  2006				unsigned long m_intv;
  2007	
  2008	free_running:
  2009				intv = domain_poll_intv(gdtc, strictlimit);
  2010				m_intv = ULONG_MAX;
  2011	
  2012				current->dirty_paused_when = now;
  2013				current->nr_dirtied = 0;
  2014				if (mdtc)
  2015					m_intv = domain_poll_intv(mdtc, strictlimit);
  2016				current->nr_dirtied_pause = min(intv, m_intv);
  2017				break;
  2018			}
  2019	
  2020			/*
  2021			 * Unconditionally start background writeback if it's not
  2022			 * already in progress. We need to do this because the global
  2023			 * dirty threshold check above (nr_dirty > gdtc->bg_thresh)
  2024			 * doesn't account for these cases:
  2025			 *
  2026			 * a) strictlimit BDIs: throttling is calculated using per-wb
  2027			 * thresholds. The per-wb threshold can be exceeded even when
  2028			 * nr_dirty < gdtc->bg_thresh
  2029			 *
  2030			 * b) memcg-based throttling: memcg uses its own dirty count and
  2031			 * thresholds and can trigger throttling even when global
  2032			 * nr_dirty < gdtc->bg_thresh
  2033			 *
  2034			 * Writeback needs to be started else the writer stalls in the
  2035			 * throttle loop waiting for dirty pages to be written back
  2036			 * while no writeback is running.
  2037			 */
  2038			if (unlikely(!writeback_in_progress(wb)))
  2039				wb_start_background_writeback(wb);
  2040	
  2041			mem_cgroup_flush_foreign(wb);
  2042	
  2043			/*
  2044			 * Calculate global domain's pos_ratio and select the
  2045			 * global dtc by default.
  2046			 */
  2047			balance_wb_limits(gdtc, strictlimit);
  2048			if (gdtc->freerun)
  2049				goto free_running;
  2050			sdtc = gdtc;
  2051	
  2052			if (mdtc) {
  2053				/*
  2054				 * If memcg domain is in effect, calculate its
  2055				 * pos_ratio.  @wb should satisfy constraints from
  2056				 * both global and memcg domains.  Choose the one
  2057				 * w/ lower pos_ratio.
  2058				 */
  2059				balance_wb_limits(mdtc, strictlimit);
  2060				if (mdtc->freerun)
  2061					goto free_running;
  2062				if (mdtc->pos_ratio < gdtc->pos_ratio)
  2063					sdtc = mdtc;
  2064			}
  2065	
  2066			wb->dirty_exceeded = gdtc->dirty_exceeded ||
  2067					     (mdtc && mdtc->dirty_exceeded);
  2068			if (time_is_before_jiffies(READ_ONCE(wb->bw_time_stamp) +
  2069						   BANDWIDTH_INTERVAL))
  2070				__wb_update_bandwidth(gdtc, mdtc, true);
  2071	
  2072			/* throttle according to the chosen dtc */
  2073			dirty_ratelimit = READ_ONCE(wb->dirty_ratelimit);
  2074			task_ratelimit = ((u64)dirty_ratelimit * sdtc->pos_ratio) >>
  2075								RATELIMIT_CALC_SHIFT;
  2076			max_pause = wb_max_pause(wb, sdtc->wb_dirty);
  2077			min_pause = wb_min_pause(wb, max_pause,
  2078						 task_ratelimit, dirty_ratelimit,
  2079						 &nr_dirtied_pause);
  2080	
  2081			if (unlikely(task_ratelimit == 0)) {
  2082				period = max_pause;
  2083				pause = max_pause;
  2084				goto pause;
  2085			}
  2086			period = HZ * pages_dirtied / task_ratelimit;
  2087			pause = period;
  2088			if (current->dirty_paused_when)
  2089				pause -= now - current->dirty_paused_when;
  2090			/*
  2091			 * For less than 1s think time (ext3/4 may block the dirtier
  2092			 * for up to 800ms from time to time on 1-HDD; so does xfs,
  2093			 * however at much less frequency), try to compensate it in
  2094			 * future periods by updating the virtual time; otherwise just
  2095			 * do a reset, as it may be a light dirtier.
  2096			 */
  2097			if (pause < min_pause) {
  2098				trace_balance_dirty_pages(wb,
  2099							  sdtc,
  2100							  dirty_ratelimit,
  2101							  task_ratelimit,
  2102							  pages_dirtied,
  2103							  period,
  2104							  min(pause, 0L),
  2105							  start_time);
  2106				if (pause < -HZ) {
  2107					current->dirty_paused_when = now;
  2108					current->nr_dirtied = 0;
  2109				} else if (period) {
  2110					current->dirty_paused_when += period;
  2111					current->nr_dirtied = 0;
  2112				} else if (current->nr_dirtied_pause <= pages_dirtied)
  2113					current->nr_dirtied_pause += pages_dirtied;
  2114				break;
  2115			}
  2116			if (unlikely(pause > max_pause)) {
  2117				/* for occasional dropped task_ratelimit */
  2118				now += min(pause - max_pause, max_pause);
  2119				pause = max_pause;
  2120			}
  2121	
  2122	pause:
  2123			trace_balance_dirty_pages(wb,
  2124						  sdtc,
  2125						  dirty_ratelimit,
  2126						  task_ratelimit,
  2127						  pages_dirtied,
  2128						  period,
  2129						  pause,
  2130						  start_time);
  2131			if (flags & BDP_ASYNC) {
  2132				ret = -EAGAIN;
  2133				break;
  2134			}
  2135			__set_current_state(TASK_KILLABLE);
  2136			bdi->last_bdp_sleep = jiffies;
  2137			io_schedule_timeout(pause);
  2138	
  2139			current->dirty_paused_when = now + pause;
  2140			current->nr_dirtied = 0;
  2141			current->nr_dirtied_pause = nr_dirtied_pause;
  2142	
  2143			/*
  2144			 * This is typically equal to (dirty < thresh) and can also
  2145			 * keep "1000+ dd on a slow USB stick" under control.
  2146			 */
  2147			if (task_ratelimit)
  2148				break;
  2149	
  2150			/*
  2151			 * In the case of an unresponsive NFS server and the NFS dirty
  2152			 * pages exceeds dirty_thresh, give the other good wb's a pipe
  2153			 * to go through, so that tasks on them still remain responsive.
  2154			 *
  2155			 * In theory 1 page is enough to keep the consumer-producer
  2156			 * pipe going: the flusher cleans 1 page => the task dirties 1
  2157			 * more page. However wb_dirty has accounting errors.  So use
  2158			 * the larger and more IO friendly wb_stat_error.
  2159			 */
  2160			if (sdtc->wb_dirty <= wb_stat_error())
  2161				break;
  2162	
  2163			if (fatal_signal_pending(current))
  2164				break;
  2165		}
  2166		return ret;
  2167	}
  2168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
