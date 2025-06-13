Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E652571BD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845657; cv=none; b=ONHQlbuJdsOXvtKNU/q+u7zaOF4MpHSxcGBxnWx2HmUK49Nqs1iAZdvtBPDWL1OgovzLnU/U4wShT4/9rTv/fuF73s2gbknjm/lPjcEkqhDQVFKoa8stXWbvg4+hnA1jnZYKfQlOfknw8lFd2aIYth2sAOWNDNdSW4CyNHTQlSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845657; c=relaxed/simple;
	bh=vL/xwLl6CQs8RHPAyA1an0XRc166ava3oRz+2X/NS8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LT8ZxYYpw/Y96TFwOO8rinHEHV5FpR4b96ncIdW6Ng2eWJO+q6/jpIbZuDuig0nqVGqqh9U//yhXBz91u6vKTRALUI1k86+SV5xerxmXrVgqW1H80EytPj07/bGKoAFUcnHt79XzKDy+7qXFIMFy49zODybLGUcmG8JZcy++lFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvGz2g9+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvGz2g9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749845656; x=1781381656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vL/xwLl6CQs8RHPAyA1an0XRc166ava3oRz+2X/NS8A=;
  b=jvGz2g9+O049SG6IHD7RQiN68iHtp5pJyGZTuHkTvv+LklSGvjjMdtrk
   cHw1iMyjN2CFM9dUUAES6KYNHTEDHFlGtUeA5YzFqRD54v306rsaxYLrZ
   Xj7rvuTFkwjyf62fnkrcZ9Z7eNfsvxaTwU8Ti2QR8O7LArI0+uBVH6cfU
   5Mnc86v9xS1rsdXo1S0wMukAfJXo1ZFTZTXXD/vh7CKU3f2Kl++EsWEJR
   T1Mrw3QQ88/x3sAGGV+vKcDKnmCdu0TpZK4+3ZECYDoQiwxqcbtc/TIog
   Ql+oTu8hbHcHoCAcm4qf5SerRpkxDUxc3/63TO5UzTNKkhrC08gm/ccJ8
   g==;
X-CSE-ConnectionGUID: CyqQy+8KTHWzHoCXszJ/AQ==
X-CSE-MsgGUID: oKnv/pH0QiWrIs2XZORx/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62682580"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="62682580"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 13:14:15 -0700
X-CSE-ConnectionGUID: NS8VpFwASBa65KmrZ+p3WA==
X-CSE-MsgGUID: xKy1akZ7TE+8HeWp5QdZMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="153201010"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jun 2025 13:14:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQAmx-000Cyg-2G;
	Fri, 13 Jun 2025 20:14:11 +0000
Date: Sat, 14 Jun 2025 04:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 30/45] fs/fuse/file_iomap.c:144:30:
 warning: expression result unused
Message-ID: <202506140417.PZDrJ7gp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   62857bad704590b8ed2cc579b4a859b953b93d5f
commit: 0b8727685521b8e9c162ae1cf400d9b74aa4704b [30/45] fuse: implement the basic iomap mechanisms
config: i386-buildonly-randconfig-001-20250614 (https://download.01.org/0day-ci/archive/20250614/202506140417.PZDrJ7gp-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140417.PZDrJ7gp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140417.PZDrJ7gp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/file_iomap.c:144:30: warning: expression result unused [-Wunused-value]
     144 |                 BAD_DATA(outarg->read_type == FUSE_IOMAP_TYPE_PURE_OVERWRITE);
         |                          ~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/file_iomap.c:24:31: note: expanded from macro 'BAD_DATA'
      24 | # define BAD_DATA(condition)    (condition)
         |                                  ^~~~~~~~~
   1 warning generated.


vim +144 fs/fuse/file_iomap.c

    84	
    85	/* Check the incoming mappings to make sure they're not nonsense */
    86	static inline int
    87	fuse_iomap_begin_validate(const struct fuse_iomap_begin_out *outarg,
    88				  const struct inode *inode,
    89				  unsigned opflags, loff_t pos)
    90	{
    91		const unsigned int blocksize = i_blocksize(inode);
    92		uint64_t end;
    93	
    94		BUILD_BUG_ON(FUSE_IOMAP_OP_WRITE	!= IOMAP_WRITE);
    95		BUILD_BUG_ON(FUSE_IOMAP_OP_ZERO		!= IOMAP_ZERO);
    96		BUILD_BUG_ON(FUSE_IOMAP_OP_REPORT	!= IOMAP_REPORT);
    97		BUILD_BUG_ON(FUSE_IOMAP_OP_FAULT	!= IOMAP_FAULT);
    98		BUILD_BUG_ON(FUSE_IOMAP_OP_DIRECT	!= IOMAP_DIRECT);
    99		BUILD_BUG_ON(FUSE_IOMAP_OP_NOWAIT	!= IOMAP_NOWAIT);
   100		BUILD_BUG_ON(FUSE_IOMAP_OP_OVERWRITE_ONLY != IOMAP_OVERWRITE_ONLY);
   101		BUILD_BUG_ON(FUSE_IOMAP_OP_UNSHARE	!= IOMAP_UNSHARE);
   102		BUILD_BUG_ON(FUSE_IOMAP_OP_ATOMIC	!= IOMAP_ATOMIC);
   103		BUILD_BUG_ON(FUSE_IOMAP_OP_DONTCACHE	!= IOMAP_DONTCACHE);
   104	
   105		/* No garbage mapping types or flags */
   106		if (BAD_DATA(!fuse_iomap_check_type(outarg->read_type)))
   107			return -EIO;
   108		if (BAD_DATA(!fuse_iomap_check_flags(outarg->read_flags)))
   109			return -EIO;
   110	
   111		if (BAD_DATA(!fuse_iomap_check_type(outarg->write_type)))
   112			return -EIO;
   113		if (BAD_DATA(!fuse_iomap_check_flags(outarg->write_flags)))
   114			return -EIO;
   115	
   116		/*
   117		 * Must have returned a mapping for at least the first byte in the
   118		 * range.
   119		 */
   120		if (BAD_DATA(outarg->offset > pos))
   121			return -EIO;
   122		if (BAD_DATA(outarg->length == 0))
   123			return -EIO;
   124	
   125		/* File range must be aligned to blocksize */
   126		if (BAD_DATA(!IS_ALIGNED(outarg->offset, blocksize)))
   127			return -EIO;
   128		if (BAD_DATA(!IS_ALIGNED(outarg->length, blocksize)))
   129			return -EIO;
   130	
   131		/* No overflows in the file range */
   132		if (BAD_DATA(check_add_overflow(outarg->offset, outarg->length, &end)))
   133			return -EIO;
   134		if (BAD_DATA(end <= pos))
   135			return -EIO;
   136	
   137		/* File range cannot start past maxbytes */
   138		if (BAD_DATA(outarg->offset >= inode->i_sb->s_maxbytes))
   139			return -EIO;
   140	
   141		switch (outarg->read_type) {
   142		case FUSE_IOMAP_TYPE_PURE_OVERWRITE:
   143			/* "Pure overwrite" only allowed for write mapping */
 > 144			BAD_DATA(outarg->read_type == FUSE_IOMAP_TYPE_PURE_OVERWRITE);
   145			return -EIO;
   146		case FUSE_IOMAP_TYPE_MAPPED:
   147		case FUSE_IOMAP_TYPE_UNWRITTEN:
   148			/* Mappings backed by space must have a device/addr */
   149			if (BAD_DATA(outarg->read_dev == FUSE_IOMAP_DEV_NULL))
   150				return -EIO;
   151			if (BAD_DATA(outarg->read_addr == FUSE_IOMAP_NULL_ADDR))
   152				return -EIO;
   153			break;
   154		case FUSE_IOMAP_TYPE_DELALLOC:
   155		case FUSE_IOMAP_TYPE_HOLE:
   156		case FUSE_IOMAP_TYPE_INLINE:
   157			/* Mappings not backed by space cannot have a device addr. */
   158			if (BAD_DATA(outarg->read_dev != FUSE_IOMAP_DEV_NULL))
   159				return -EIO;
   160			if (BAD_DATA(outarg->read_addr != FUSE_IOMAP_NULL_ADDR))
   161				return -EIO;
   162			break;
   163		default:
   164			/* should have been caught already */
   165			return -EIO;
   166		}
   167	
   168		switch (outarg->write_type) {
   169		case FUSE_IOMAP_TYPE_MAPPED:
   170		case FUSE_IOMAP_TYPE_UNWRITTEN:
   171			/* Mappings backed by space must have a device/addr */
   172			if (BAD_DATA(outarg->write_dev == FUSE_IOMAP_DEV_NULL))
   173				return -EIO;
   174			if (BAD_DATA(outarg->write_addr == FUSE_IOMAP_NULL_ADDR))
   175				return -EIO;
   176			break;
   177		case FUSE_IOMAP_TYPE_PURE_OVERWRITE:
   178		case FUSE_IOMAP_TYPE_HOLE:
   179		case FUSE_IOMAP_TYPE_DELALLOC:
   180		case FUSE_IOMAP_TYPE_INLINE:
   181			/* Mappings not backed by space cannot have a device addr. */
   182			if (BAD_DATA(outarg->write_dev != FUSE_IOMAP_DEV_NULL))
   183				return -EIO;
   184			if (BAD_DATA(outarg->write_addr != FUSE_IOMAP_NULL_ADDR))
   185				return -EIO;
   186			break;
   187		default:
   188			/* should have been caught already */
   189			return -EIO;
   190		}
   191	
   192		/* XXX: Check the device cookie */
   193		ASSERT(outarg->read_dev == 0);
   194	
   195		/* No overflows in the device range, if supplied */
   196		if (outarg->read_addr != FUSE_IOMAP_NULL_ADDR &&
   197		    BAD_DATA(check_add_overflow(outarg->read_addr, outarg->length, &end)))
   198			return -EIO;
   199	
   200		if (outarg->write_addr != FUSE_IOMAP_NULL_ADDR &&
   201		    BAD_DATA(check_add_overflow(outarg->write_addr, outarg->length, &end)))
   202			return -EIO;
   203	
   204		if (!(opflags & FUSE_IOMAP_OP_REPORT)) {
   205			/*
   206			 * XXX inline data reads and writes are not supported, how do
   207			 * we do this?
   208			 */
   209			if (BAD_DATA(outarg->read_type == FUSE_IOMAP_TYPE_INLINE))
   210				return -EIO;
   211			if (BAD_DATA(outarg->write_type == FUSE_IOMAP_TYPE_INLINE))
   212				return -EIO;
   213		}
   214	
   215		return 0;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
