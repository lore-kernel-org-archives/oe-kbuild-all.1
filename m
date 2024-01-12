Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A257877
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2JxXJ92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705052199; x=1736588199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8K4HAAqnIIsw4JH6EeNSmg1cxXWPHL7+cWOCwlT1rqE=;
  b=V2JxXJ92A+9/hu7PWiDOIBnYM0m7H2psmMoeGDRpg0zzpiwaifRjz2ja
   ZqvoC1lYPxOVOS7U0cDLb4wJaAPs48JGw/+dm3kSlBAjeiKZHchhpD4gV
   BVBCrgSIwD0G/ww5QE/sxIV3NuN07NCxneYVMPR4xBeYmkwScOTI7TgWi
   yHkvIENojLU58V9IGFX077faSKcIZvTVqphau0Byj0XWTmr3mqbdTIMeX
   IKkoE20do0CCpXA/PiZD+QWZE2MDHxcWvtoCNco4dKSVfOWwQvNli0BIf
   hyU9N04aDiuN1cDUSE/Y0F0sNdhg7nMXODtpNP0/XjfZHWJRBmdjmqyNu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="17734929"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="17734929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 01:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="17347468"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2024 01:36:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rODxp-0009Iv-2F;
	Fri, 12 Jan 2024 09:36:34 +0000
Date: Fri, 12 Jan 2024 17:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfiles-wtf 202/614] fs/xfs/xfs_buf_mem.c:156:10:
 warning: variable 'gfp' set but not used
Message-ID: <202401121732.n4brrm6g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfiles-wtf
head:   b2d76ab4cf06faba959c4f2291472d3c068e10bc
commit: a75aab466f29c3f9dfcbd3f330eedf3912c40859 [202/614] xfs: support in-memory buffer cache targets
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240112/202401121732.n4brrm6g-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121732.n4brrm6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121732.n4brrm6g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_buf_mem.c:156:10: warning: variable 'gfp' set but not used [-Wunused-but-set-variable]
     156 |         gfp_t                   gfp = __GFP_NOWARN;
         |                                 ^
   fs/xfs/xfs_buf_mem.c:34:29: warning: unused function 'to_xfbuf' [-Wunused-function]
      34 | static inline struct xfbuf *to_xfbuf(struct xfs_buftarg *btp)
         |                             ^~~~~~~~
   2 warnings generated.


vim +/gfp +156 fs/xfs/xfs_buf_mem.c

   146	
   147	/* Directly map a shmem page into the buffer cache. */
   148	int
   149	xfbuf_map_pages(
   150		struct xfs_buf		*bp,
   151		xfs_buf_flags_t		flags)
   152	{
   153		struct inode		*inode = file_inode(bp->b_target->bt_file);
   154		struct folio		*folio = NULL;
   155		struct page		*page;
 > 156		gfp_t			gfp = __GFP_NOWARN;
   157		loff_t                  pos = BBTOB(xfs_buf_daddr(bp));
   158		int			error;
   159	
   160		ASSERT(bp->b_target->bt_flags & XFS_BUFTARG_MEM);
   161	
   162		if (bp->b_map_count != 1)
   163			return -ENOMEM;
   164		if (BBTOB(bp->b_length) != XFBUF_BLOCKSIZE)
   165			return -ENOMEM;
   166		if (offset_in_page(pos) != 0) {
   167			ASSERT(offset_in_page(pos));
   168			return -ENOMEM;
   169		}
   170	
   171		if (flags & XBF_READ_AHEAD)
   172			gfp |= __GFP_NORETRY;
   173	
   174		error = shmem_get_folio(inode, pos >> PAGE_SHIFT, &folio, SGP_CACHE);
   175		if (error)
   176			return error;
   177		if (!folio)
   178			return -ENOMEM;
   179	
   180		page = folio_file_page(folio, pos >> PAGE_SHIFT);
   181		if (PageHWPoison(page)) {
   182			folio_unlock(folio);
   183			folio_put(folio);
   184			return -EIO;
   185		}
   186	
   187		/*
   188		 * Mark the page dirty so that it won't be reclaimed once we drop the
   189		 * (potentially last) reference in xfbuf_unmap_pages.
   190		 */
   191		set_page_dirty(page);
   192		unlock_page(page);
   193	
   194		bp->b_addr = page_address(page);
   195		bp->b_pages = bp->b_page_array;
   196		bp->b_pages[0] = page;
   197		bp->b_page_count = 1;
   198		return 0;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
