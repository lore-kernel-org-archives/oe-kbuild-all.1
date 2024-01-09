Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95F939AE2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfIrQxOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704812945; x=1736348945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VExWJMtmECk6x3rLAErldmgfJgbicZRHJ27mpSkUMLI=;
  b=EfIrQxObhoXAWXbB/sKx41Ac3exxYJklcJYkyNv6wGgxqyMrogOSQQki
   dmsZxezonbOu5uZ7mymiFGBiV3nKRDoRrxe2fQHiC5dTEM2CNM9D4aZ+Q
   GLCrfjYIgQctg9mstueZxyXlauMMWJ1FwSkNgbbo7RuncLoF+Te8NNgB+
   /UDn1RsY7+/8IjLDUKHZGVFE/IFVE6cVO8B9eumnjYLVUgvR1CX4SRBFf
   1m4XCzlZtP0dO4mWtuT0ik1+FIVfdCJjzb8/GA8JrN7lYZNWg4v/Vnl1C
   PceUVrAN1IdHa8CuLX9zc1d+6mNYLz2A/2xGSmO+hdwBY2kE3E9gnALSa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4969216"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="4969216"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 07:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900795444"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="900795444"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2024 07:09:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNDit-0005yI-29;
	Tue, 09 Jan 2024 15:08:59 +0000
Date: Tue, 9 Jan 2024 23:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:file-force-align 581/585]
 fs/xfs/libxfs/xfs_bmap.c:6515:16: warning: variable 'rtxlen_in' set but not
 used
Message-ID: <202401092342.6IleIXNB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git file-force-align
head:   151af0286abbbf46f31ed58288a2ead816feb5bc
commit: 57846a41039819243ad4db17daed0d1f96ff3f9d [581/585] xfs: add an ioctl to map free space into a file
config: i386-randconfig-002-20240109 (https://download.01.org/0day-ci/archive/20240109/202401092342.6IleIXNB-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401092342.6IleIXNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401092342.6IleIXNB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_bmap.c:6515:16: warning: variable 'rtxlen_in' set but not used [-Wunused-but-set-variable]
    6515 |                 xfs_extlen_t    rtxlen_in, rtxlen_out;
         |                                 ^
>> fs/xfs/libxfs/xfs_bmap.c:6539:25: warning: variable 'rtxlen_out' is uninitialized when used here [-Wuninitialized]
    6539 |                 mval->br_blockcount = rtxlen_out * mp->m_sb.sb_rextsize;
         |                                       ^~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:6515:37: note: initialize the variable 'rtxlen_out' to silence this warning
    6515 |                 xfs_extlen_t    rtxlen_in, rtxlen_out;
         |                                                      ^
         |                                                       = 0
>> fs/xfs/libxfs/xfs_bmap.c:6534:7: warning: variable 'rtx_out' is uninitialized when used here [-Wuninitialized]
    6534 |                 if (rtx_out != rtx_in) {
         |                     ^~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:6514:31: note: initialize the variable 'rtx_out' to silence this warning
    6514 |                 xfs_rtxnum_t    rtx_in, rtx_out;
         |                                                ^
         |                                                 = 0
   3 warnings generated.


vim +/rtxlen_in +6515 fs/xfs/libxfs/xfs_bmap.c

  6463	
  6464	/*
  6465	 * Given a file and a free physical extent, map it into the file at the same
  6466	 * offset if the file were a sparse image of the physical device.  Set @mval to
  6467	 * whatever mapping we added to the file.
  6468	 */
  6469	int
  6470	xfs_bmapi_freesp(
  6471		struct xfs_trans	*tp,
  6472		struct xfs_inode	*ip,
  6473		xfs_fsblock_t		fsbno,
  6474		xfs_extlen_t		len,
  6475		struct xfs_bmbt_irec	*mval)
  6476	{
  6477		struct xfs_bmbt_irec	irec;
  6478		struct xfs_mount	*mp = ip->i_mount;
  6479		xfs_fileoff_t		startoff;
  6480		bool			isrt = XFS_IS_REALTIME_INODE(ip);
  6481		int			nimaps;
  6482		int			error;
  6483	
  6484		trace_xfs_bmapi_freesp(ip, fsbno, len);
  6485	
  6486		error = xfs_iext_count_may_overflow(ip, XFS_DATA_FORK,
  6487				XFS_IEXT_ADD_NOSPLIT_CNT);
  6488		if (error)
  6489			return error;
  6490	
  6491		if (isrt)
  6492			startoff = fsbno;
  6493		else
  6494			startoff = xfs_fsblock_to_fileoff(mp, fsbno);
  6495	
  6496		/* Make sure the entire range is a hole. */
  6497		nimaps = 1;
  6498		error = xfs_bmapi_read(ip, startoff, len, &irec, &nimaps, 0);
  6499		if (error)
  6500			return error;
  6501	
  6502		if (irec.br_startoff != startoff ||
  6503		    irec.br_startblock != HOLESTARTBLOCK ||
  6504		    irec.br_blockcount < len)
  6505			return -EINVAL;
  6506	
  6507		/*
  6508		 * Allocate the physical extent.  We should not have dropped the lock
  6509		 * since the scan of the free space metadata, so this should work,
  6510		 * though the length may be adjusted to play nicely with metadata space
  6511		 * reservations.
  6512		 */
  6513		if (isrt) {
  6514			xfs_rtxnum_t	rtx_in, rtx_out;
> 6515			xfs_extlen_t	rtxlen_in, rtxlen_out;
  6516			uint32_t	mod;
  6517	
  6518			rtx_in = xfs_rtb_to_rtxrem(mp, fsbno, &mod);
  6519			if (mod) {
  6520				ASSERT(mod == 0);
  6521				return -EFSCORRUPTED;
  6522			}
  6523	
  6524			rtxlen_in = xfs_rtb_to_rtxrem(mp, len, &mod);
  6525			if (mod) {
  6526				ASSERT(mod == 0);
  6527				return -EFSCORRUPTED;
  6528			}
  6529	
  6530			error = xfs_rtallocate_extent(tp, rtx_in, rtxlen_in,
  6531					&rtxlen_out, &rtx_out);
  6532			if (error)
  6533				return error;
> 6534			if (rtx_out != rtx_in) {
  6535				ASSERT(0);
  6536				xfs_bmap_mark_sick(ip, XFS_DATA_FORK);
  6537				return -EFSCORRUPTED;
  6538			}
> 6539			mval->br_blockcount = rtxlen_out * mp->m_sb.sb_rextsize;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
