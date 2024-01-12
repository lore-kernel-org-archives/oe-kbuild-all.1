Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC403537F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ro4wKMrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705061110; x=1736597110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xd0MdpS8iE4G9Wrae+k+vsFTGjIyhjxqBFxlkuzH8Lw=;
  b=Ro4wKMrzym67ToIrxHSmiLx2N46nQE//YC3+TjFDoEzcCS5E2/CQIDCH
   pEfGCyWX/ZksHbAVl0RzRwPFEBYPngcAVf8uV9BPc8Mu1uO9BVIu4zfQS
   jCtfZXg3Bs210JlSmCpfA6TRNyV3UtioKjTVPb/pVbixPWLOdfvCBbFaj
   xRGD/Tl3mCKMGSOCm0TuyQrjt8nDGK7gT10Q9lrj8BT+Ldt3s032kv5VC
   wq9Rw7g3M1YrrCSmLCm5yG2jE1QKxpfNUQmwqQmiTkc0x9a3/+SC57oiX
   cRrHG4g7S3G/gQeMNU9IkX15DQVzzXBDznDYIdQrZGZDrJOn7kqJ4xGTC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="398840245"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="398840245"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 04:05:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="31367160"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2024 04:05:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOGHZ-0009Qu-1V;
	Fri, 12 Jan 2024 12:05:05 +0000
Date: Fri, 12 Jan 2024 20:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfiles-wtf 203/614] fs/xfs/libxfs/xfs_btree.c:315:11:
 error: unused variable 'bno'
Message-ID: <202401121950.ZZ1UXrZC-lkp@intel.com>
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
commit: 6aef791999d622317e1bcb743374e00238ef8662 [203/614] xfs: support in-memory btrees
config: x86_64-sof-customedconfig-compile-test-defconfig (https://download.01.org/0day-ci/archive/20240112/202401121950.ZZ1UXrZC-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121950.ZZ1UXrZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121950.ZZ1UXrZC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_btree.c:315:11: error: unused variable 'bno' [-Werror,-Wunused-variable]
     315 |                 xfbno_t bno             = be64_to_cpu((&ptr->l)[index]);
         |                         ^~~
   1 error generated.


vim +/bno +315 fs/xfs/libxfs/xfs_btree.c

   302	
   303	/*
   304	 * Check that a given (indexed) btree pointer at a certain level of a
   305	 * btree is valid and doesn't point past where it should.
   306	 */
   307	static int
   308	xfs_btree_check_ptr(
   309		struct xfs_btree_cur		*cur,
   310		const union xfs_btree_ptr	*ptr,
   311		int				index,
   312		int				level)
   313	{
   314		if (cur->bc_ops->type == XFS_BTREE_TYPE_MEM) {
 > 315			xfbno_t bno		= be64_to_cpu((&ptr->l)[index]);
   316	
   317			ASSERT(cur->bc_ops->ptr_len == XFS_BTREE_LONG_PTR_LEN);
   318	
   319			if (xfbtree_verify_bno(cur->bc_mem.xfbtree, bno))
   320				return 0;
   321	
   322			xfs_err(cur->bc_mp,
   323	"In-memory: Corrupt btree %d flags 0x%x pointer at level %d index %d fa %pS.",
   324					cur->bc_btnum, cur->bc_flags, level, index,
   325					__this_address);
   326			return -EFSCORRUPTED;
   327		}
   328	
   329		if (cur->bc_ops->ptr_len == XFS_BTREE_LONG_PTR_LEN) {
   330			if (xfs_btree_check_lptr(cur, be64_to_cpu((&ptr->l)[index]),
   331					level))
   332				return 0;
   333			xfs_err(cur->bc_mp,
   334	"Inode %llu fork %d: Corrupt btree %d pointer at level %d index %d.",
   335					cur->bc_ino.ip->i_ino,
   336					cur->bc_ino.whichfork, cur->bc_btnum,
   337					level, index);
   338		} else {
   339			if (xfs_btree_check_sptr(cur, be32_to_cpu((&ptr->s)[index]),
   340					level))
   341				return 0;
   342			xfs_err(cur->bc_mp,
   343	"AG %u: Corrupt btree %d pointer at level %d index %d.",
   344					cur->bc_ag.pag->pag_agno, cur->bc_btnum,
   345					level, index);
   346		}
   347	
   348		xfs_btree_mark_sick(cur);
   349		return -EFSCORRUPTED;
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
