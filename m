Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CEA747D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTl+dF7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698831425; x=1730367425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AftvP+N7OVr5mTD5tr6axR1Tpzxp2aSsVYauATiXdfs=;
  b=hTl+dF7gR9NCvUADsQzvn4JQYc8k491VJkkIg0Z+KJBGLszar2WhGXWQ
   ZdWBpuMWec4qwDZieWssECoo6naXAzfOAhQqILA8kZvdBsVOiY68kB31u
   7xX2CbW5KWJoQnMk7d5CRXQB/KtxHXmCC4eFPJJPgGz44hhCUvyoY3RyU
   MkWHbJEmM84vwYpp3iyoYJ7LP49gkO9BgalyFuezBYppGQ6P8eNf8/AfF
   Pm/q8YJUKtyKsfOB8Qzg88lC5QEdtaxfVmS0MzzUE/cNDtkNR6jrkj491
   ntTi6pCrK9zVkNLTPswW8wh6jI3RWDAqX5lsPxRlvjhOiGQCQ3btkU8as
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="392326319"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="392326319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="795854350"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="795854350"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Nov 2023 02:37:03 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy7en-0000iO-2e;
	Wed, 01 Nov 2023 09:37:01 +0000
Date: Wed, 1 Nov 2023 17:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 3/48] fs/xfs/libxfs/xfs_bmap.c:3312:33: warning:
 variable 'fld' set but not used
Message-ID: <202311011748.g3GHV8js-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   c4f7071632b671933d29f8b9cdb202a6c1c43dd4
commit: 83ec94c3b4fa9f15e47b75555ef167ae31a1ec74 [3/48] xfs: also use xfs_bmap_btalloc_accounting for RT allocations
config: s390-randconfig-002-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011748.g3GHV8js-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011748.g3GHV8js-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011748.g3GHV8js-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmap_alloc_account':
>> fs/xfs/libxfs/xfs_bmap.c:3312:33: warning: variable 'fld' set but not used [-Wunused-but-set-variable]
    3312 |         uint                    fld;
         |                                 ^~~


vim +/fld +3312 fs/xfs/libxfs/xfs_bmap.c

  3304	
  3305	/* Update all inode and quota accounting for the allocation we just did. */
  3306	void
  3307	xfs_bmap_alloc_account(
  3308		struct xfs_bmalloca	*ap)
  3309	{
  3310		bool			isrt = xfs_ifork_is_realtime(ap->ip,
  3311						xfs_bmapi_whichfork(ap->flags));
> 3312		uint			fld;
  3313	
  3314		if (ap->flags & XFS_BMAPI_COWFORK) {
  3315			/*
  3316			 * COW fork blocks are in-core only and thus are treated as
  3317			 * in-core quota reservation (like delalloc blocks) even when
  3318			 * converted to real blocks. The quota reservation is not
  3319			 * accounted to disk until blocks are remapped to the data
  3320			 * fork. So if these blocks were previously delalloc, we
  3321			 * already have quota reservation and there's nothing to do
  3322			 * yet.
  3323			 */
  3324			if (ap->wasdel) {
  3325				xfs_mod_delalloc(ap->ip->i_mount, -(int64_t)ap->length);
  3326				return;
  3327			}
  3328	
  3329			/*
  3330			 * Otherwise, we've allocated blocks in a hole. The transaction
  3331			 * has acquired in-core quota reservation for this extent.
  3332			 * Rather than account these as real blocks, however, we reduce
  3333			 * the transaction quota reservation based on the allocation.
  3334			 * This essentially transfers the transaction quota reservation
  3335			 * to that of a delalloc extent.
  3336			 */
  3337			ap->ip->i_delayed_blks += ap->length;
  3338			xfs_trans_mod_dquot_byino(ap->tp, ap->ip, isrt ?
  3339					XFS_TRANS_DQ_RES_RTBLKS : XFS_TRANS_DQ_RES_BLKS,
  3340					-(long)ap->length);
  3341			return;
  3342		}
  3343	
  3344		/* data/attr fork only */
  3345		ap->ip->i_nblocks += ap->length;
  3346		xfs_trans_log_inode(ap->tp, ap->ip, XFS_ILOG_CORE);
  3347		if (ap->wasdel) {
  3348			ap->ip->i_delayed_blks -= ap->length;
  3349			xfs_mod_delalloc(ap->ip->i_mount, -(int64_t)ap->length);
  3350			fld = isrt ? XFS_TRANS_DQ_DELRTBCOUNT : XFS_TRANS_DQ_DELBCOUNT;
  3351		} else {
  3352			fld = isrt ? XFS_TRANS_DQ_RTBCOUNT : XFS_TRANS_DQ_BCOUNT;
  3353		}
  3354	
  3355		xfs_trans_mod_dquot_byino(ap->tp, ap->ip, fld, ap->length);
  3356	}
  3357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
