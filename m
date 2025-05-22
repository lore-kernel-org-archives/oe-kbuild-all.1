Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF84F5E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899379; cv=none; b=PXIufnoyJtNYxuOSucH9+atY4QhN7A1h29doUC2KdPoVzEiktkmRminx3gb9ZzqMoul6MSm/TsUUdtPChJWFl1C5evGdbow0Tg3VDItzeCF4zZe7ROIce8WFd6K4toSarCVm7WVJ9DU4avKR3+AblohgPOvq4uoYKUwQzA+MgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899379; c=relaxed/simple;
	bh=dfpfw8zfAjn4h5P5si1j5UBz0Rp/V+nLo6lwca+zeEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8hCKx5IXAZrZ5IJkcssuJc5JnrL6p3/9foj0T/mRynDi7UVjRgx/SDozU0p7ZPIxAPG1bhrnQ/L3+a2ml1f3Obkn4gJtJ7YTI3A+7ZyI1FYGP1j0gd/kHO+PyFCFse0No8IIYQklp1VDf6YfE+T/0KaJSrZxYuOCwEl1pH9ABE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tmr3ODG6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tmr3ODG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747899378; x=1779435378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfpfw8zfAjn4h5P5si1j5UBz0Rp/V+nLo6lwca+zeEA=;
  b=Tmr3ODG6GHmx97vck+du1absj6nAYb1BqQt9z/IVZxykq7t2nKiuZu7k
   GDaNJGeySzIl1dmEO1BZsUiNFdGak8Df8DUO9ITxxYg8g0H3c03Dn24jc
   aXtn3+HTfW+yRDzh7ezq7qIjKuj5o6gBJrIUiGQOTjg4O2zR+qo6O/KMR
   hbgRf01acK5id3jt4qNiSFmIas//b6G1kekno6uzRfsypD5vK921NpPyI
   2I3JUxnS+Y3jNvqtrbonMtb0eFIohH9B8p24ZaOFYyTYo7scpGEJqSVlr
   3bgVrvI+MH1N0jVe4DA0DWgsETs+gy0cEEEOvymYF2DG4CHVMYSnCnMqU
   Q==;
X-CSE-ConnectionGUID: ylDZOqqlQ5uyHxTPMvC7VA==
X-CSE-MsgGUID: ax9dFKkoQNSUF4QGJK+ctA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60150987"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="60150987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 00:36:17 -0700
X-CSE-ConnectionGUID: i84cVVyfRnCFXHi11I2UoQ==
X-CSE-MsgGUID: LEXIXq1eRnqQ6lIJYU11ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140989092"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 May 2025 00:36:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI0TN-000P36-2I;
	Thu, 22 May 2025 07:36:13 +0000
Date: Thu, 22 May 2025 15:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap 39/43] fs/fuse/file_iomap.c:589:undefined
 reference to `iomap_dio_rw'
Message-ID: <202505221535.H6KmtCiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap
head:   5b397601da90a62bdc9e22c480dee2381a16ec90
commit: 52616c3e1a49a1564121672af64d5e4de6f0af11 [39/43] fuse: implement direct IO with iomap
config: s390-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221535.H6KmtCiR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221535.H6KmtCiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221535.H6KmtCiR-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_begin':
   fs/fuse/file_iomap.c:162:(.text+0x6a4): undefined reference to `I_BDEV'
   s390x-linux-ld: fs/fuse/file_iomap.c:162:(.text+0x782): undefined reference to `I_BDEV'
   s390x-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_fiemap':
   fs/fuse/file_iomap.c:484:(.text+0x1700): undefined reference to `iomap_fiemap'
   s390x-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_bmap':
   fs/fuse/file_iomap.c:495:(.text+0x17d4): undefined reference to `iomap_bmap'
   s390x-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_lseek':
   fs/fuse/file_iomap.c:515:(.text+0x19a8): undefined reference to `iomap_seek_hole'
   s390x-linux-ld: fs/fuse/file_iomap.c:518:(.text+0x19ee): undefined reference to `iomap_seek_data'
   s390x-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_direct_read':
>> fs/fuse/file_iomap.c:589:(.text+0x1d08): undefined reference to `iomap_dio_rw'
   s390x-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_direct_write':
   fs/fuse/file_iomap.c:701:(.text+0x21e6): undefined reference to `iomap_dio_rw'


vim +589 fs/fuse/file_iomap.c

   571	
   572	ssize_t fuse_iomap_direct_read(struct kiocb *iocb, struct iov_iter *to)
   573	{
   574		struct inode *inode = file_inode(iocb->ki_filp);
   575		ssize_t ret;
   576	
   577		ASSERT(fuse_has_iomap_direct_io(inode));
   578	
   579		trace_fuse_iomap_direct_read(iocb, to);
   580	
   581		if (!iov_iter_count(to))
   582			return 0; /* skip atime */
   583	
   584		file_accessed(iocb->ki_filp);
   585	
   586		ret = fuse_iomap_ilock_iocb(iocb, SHARED);
   587		if (ret)
   588			return ret;
 > 589		ret = iomap_dio_rw(iocb, to, &fuse_iomap_ops, NULL, 0, NULL, 0);
   590		inode_unlock_shared(inode);
   591	
   592		trace_fuse_iomap_direct_read_end(iocb, to, ret);
   593		return ret;
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
