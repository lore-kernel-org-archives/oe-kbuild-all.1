Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EFCA20
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 04:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iq3oapHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698554811; x=1730090811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jMpH37zkAI7I7IOsyH3/B+LachWNUrWL0/QvxxtrhT8=;
  b=Iq3oapHfK4SoQ4RYnlURgLl1b4ukGpS7HsfJ2DvR4mgdLw1GARUUU0iY
   KvainWrqZ+xVNAn07ZFNJU47lBJc/TctukQddcdQBtQzYH6MGLJaKibBR
   g4+IDZVG61+D9SWddWE2jkrFXnmip8440q2sEV0+8hrHDsbrFFQGqai0H
   3/WA8aJIpnbJChY63RbQAK7RcG0ajphOc9nE2YIliNUegrcsqzhVH6adt
   zToFPOV0gZNAU8hbkUc5rCYsYBicQmloqX1wJE9XjEp9AvkDgugFIwV/c
   l3P/Wjc9iH4aZLkXQsuXvoXKhcS7SuUdlBuJwdJUH2uzj/J40XbQtr9Li
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="385135689"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="385135689"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 21:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="709785523"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="709785523"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Oct 2023 21:46:48 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwxhG-000CKU-1z;
	Sun, 29 Oct 2023 04:46:46 +0000
Date: Sun, 29 Oct 2023 12:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 11/11] shmem: add per-block uptodate tracking
Message-ID: <202310291218.fYLv1WWN-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20231027]
[cannot apply to linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/XArray-add-cmpxchg-order-test/20231029-051730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231028211518.3424020-12-da.gomez%40samsung.com
patch subject: [RFC PATCH 11/11] shmem: add per-block uptodate tracking
config: powerpc64-randconfig-003-20231029 (https://download.01.org/0day-ci/archive/20231029/202310291218.fYLv1WWN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310291218.fYLv1WWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310291218.fYLv1WWN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/shmem.c:4673:29: error: 'shmem_invalidate_folio' undeclared here (not in a function); did you mean 'shmem_replace_folio'?
    4673 |         .invalidate_folio = shmem_invalidate_folio,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
         |                             shmem_replace_folio
>> mm/shmem.c:4674:27: error: 'shmem_release_folio' undeclared here (not in a function); did you mean 'shmem_replace_folio'?
    4674 |         .release_folio  = shmem_release_folio,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           shmem_replace_folio
>> mm/shmem.c:4675:34: error: 'shmem_is_partially_uptodate' undeclared here (not in a function); did you mean 'shmem_set_range_uptodate'?
    4675 |         .is_partially_uptodate = shmem_is_partially_uptodate,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  shmem_set_range_uptodate
>> mm/shmem.c:212:13: warning: 'sfs_free' defined but not used [-Wunused-function]
     212 | static void sfs_free(struct folio *folio)
         |             ^~~~~~~~


vim +4673 mm/shmem.c

  4662	
  4663	const struct address_space_operations shmem_aops = {
  4664		.writepage	= shmem_writepage,
  4665		.dirty_folio	= noop_dirty_folio,
  4666	#ifdef CONFIG_TMPFS
  4667		.write_begin	= shmem_write_begin,
  4668		.write_end	= shmem_write_end,
  4669	#endif
  4670	#ifdef CONFIG_MIGRATION
  4671		.migrate_folio	= migrate_folio,
  4672	#endif
> 4673		.invalidate_folio = shmem_invalidate_folio,
> 4674		.release_folio	= shmem_release_folio,
> 4675		.is_partially_uptodate = shmem_is_partially_uptodate,
  4676		.error_remove_page = shmem_error_remove_page,
  4677	};
  4678	EXPORT_SYMBOL(shmem_aops);
  4679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
