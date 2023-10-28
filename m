Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37C20F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 23:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epW4FtLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698537169; x=1730073169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5U2h+8VFH6btce2hpUCih99+IlEvpHuy/7zdqmJJ13c=;
  b=epW4FtLoVYsUgdhcyTotfqWlOMXoYbYZ2BTCEnNqd/SwbTJsy9RZSvpx
   BCvL0aOdaeBFqSio4PGUo+agOqwycNcr1cAlTNNCWBXIasrfAuRfX2tCo
   8ODgKos0wFHGZk4vis8xT5BQ+59XiROxqnm2Kik4zp0EKOhdW4Mo/Ow5w
   pE/g4ghouul5AIF2B3qS86iRPJSHrHb28R4GctEhcW+JTejytOznfA9pH
   OxdtBiuzX9QMbFat0UcUquBfaRWpnWCt3QEeTIwd14ruWPMNR6olV0yMH
   A20FO/NATxVx6NtImybHQAHp2nugN+IuILZNsExuVE6jZdE29diTGs3T7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="454390471"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="454390471"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 16:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="1007077006"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="1007077006"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Oct 2023 16:52:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwt6f-000CBV-2O;
	Sat, 28 Oct 2023 23:52:41 +0000
Date: Sun, 29 Oct 2023 07:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 11/11] shmem: add per-block uptodate tracking
Message-ID: <202310290754.qn6yKgu6-lkp@intel.com>
References: <20231028211518.3424020-12-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028211518.3424020-12-da.gomez@samsung.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20231027]
[cannot apply to linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/XArray-add-cmpxchg-order-test/20231029-051730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231028211518.3424020-12-da.gomez%40samsung.com
patch subject: [RFC PATCH 11/11] shmem: add per-block uptodate tracking
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231029/202310290754.qn6yKgu6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290754.qn6yKgu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290754.qn6yKgu6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2904:6: warning: no previous prototype for 'shmem_invalidate_folio' [-Wmissing-prototypes]
    2904 | void shmem_invalidate_folio(struct folio *folio, size_t offset, size_t len)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> mm/shmem.c:2917:6: warning: no previous prototype for 'shmem_release_folio' [-Wmissing-prototypes]
    2917 | bool shmem_release_folio(struct folio *folio, gfp_t gfp_flags)
         |      ^~~~~~~~~~~~~~~~~~~
>> mm/shmem.c:2930:6: warning: no previous prototype for 'shmem_is_partially_uptodate' [-Wmissing-prototypes]
    2930 | bool shmem_is_partially_uptodate(struct folio *folio, size_t from, size_t count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   mm/shmem.c: In function 'shmem_alloc_and_add_folio.isra':
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_360' declared with attribute error: BUILD_BUG failed
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:257:28: note: in expansion of macro 'BUILD_BUG'
     257 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^~~~~~~~~
   include/linux/huge_mm.h:67:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
      67 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^~~~~~~~~~~~~~~
   include/linux/huge_mm.h:68:26: note: in expansion of macro 'HPAGE_PMD_ORDER'
      68 | #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
         |                          ^~~~~~~~~~~~~~~
   mm/shmem.c:1774:25: note: in expansion of macro 'HPAGE_PMD_NR'
    1774 |                 pages = HPAGE_PMD_NR;
         |                         ^~~~~~~~~~~~


vim +/shmem_invalidate_folio +2904 mm/shmem.c

  2903	
> 2904	void shmem_invalidate_folio(struct folio *folio, size_t offset, size_t len)
  2905	{
  2906		/*
  2907		 * If we're invalidating the entire folio, clear the dirty state
  2908		 * from it and release it to avoid unnecessary buildup of the LRU.
  2909		 */
  2910		if (offset == 0 && len == folio_size(folio)) {
  2911			WARN_ON_ONCE(folio_test_writeback(folio));
  2912			folio_cancel_dirty(folio);
  2913			sfs_free(folio);
  2914		}
  2915	}
  2916	
> 2917	bool shmem_release_folio(struct folio *folio, gfp_t gfp_flags)
  2918	{
  2919		sfs_free(folio);
  2920		return true;
  2921	}
  2922	
  2923	/*
  2924	 * shmem_is_partially_uptodate checks whether blocks within a folio are
  2925	 * uptodate or not.
  2926	 *
  2927	 * Returns true if all blocks which correspond to the specified part
  2928	 * of the folio are uptodate.
  2929	 */
> 2930	bool shmem_is_partially_uptodate(struct folio *folio, size_t from, size_t count)
  2931	{
  2932		struct shmem_folio_state *sfs = folio->private;
  2933		struct inode *inode = folio->mapping->host;
  2934		unsigned first, last, i;
  2935	
  2936		if (!sfs)
  2937			return false;
  2938	
  2939		/* Caller's range may extend past the end of this folio */
  2940		count = min(folio_size(folio) - from, count);
  2941	
  2942		/* First and last blocks in range within folio */
  2943		first = from >> inode->i_blkbits;
  2944		last = (from + count - 1) >> inode->i_blkbits;
  2945	
  2946		for (i = first; i <= last; i++)
  2947			if (!sfs_block_is_uptodate(sfs, i))
  2948				return false;
  2949		return true;
  2950	}
  2951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
