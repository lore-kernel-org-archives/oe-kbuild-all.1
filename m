Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01833FE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709949913; cv=none; b=lWkQaVCQ+t+93npzCKCfyHF2SG4qn8yzJuYGNZTSKbK4iQ8nWlGh2iQPuVLuIW9ePnv4FaosnGW+dd/hveZVaxu6ZgUYIqBC4VdHVrtaVjdqrscqpf/Nny+hfMrC+A3dZpEkKPVoaEiJphaVSZhIbqeV2Cp2xAwC29maq7G+5PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709949913; c=relaxed/simple;
	bh=a/xbqGEJ5jYT7vl7g+UjWwyBy5ubP/kJkgeowjUsCGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLi5A0+3ar0psuKxSi74ORKxUl2vH5c/UaKqxonnGjewj/JWKIniD0Wl7pOlYeKJ+jJphd10DJ7nQhcb+NzR/yZ/AFGjpZ74Qnu2Hmo2QLU1OgB7boF5XdScjTMBj5wImtwVE+idgPO5HYhzGZ1BU81wJSpqsantyKFc7ONMFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URr83rDp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URr83rDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709949912; x=1741485912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/xbqGEJ5jYT7vl7g+UjWwyBy5ubP/kJkgeowjUsCGY=;
  b=URr83rDpkbuyHqcl9/wccALgMBlJIiuyS9qyRJfyL/CGeoCPwSP2KTKx
   ERIqi1rgK9B54RW8ez5ikbHSztHPwUxzwEyav2+PD2/PayGomfRd0tUXk
   rOMhm8WzVEDFZ33VhObbtUnFdocOmLyDNwVwrZwLQZJYqniEV1Vmcz1ri
   AsmMbEMo7RcWTlGq5igKWAp23jogqT5VaOKr4kH/0KF+eTYWPHBoQE5QF
   RUYIl4nBEAPY730Zf6UoKBVjW/FwuQODTwjBoTEjxkNeXcl4pkGUBplwM
   /lDdkMZXmc+df2J2c8hOHtftryQyBKnbAb7jB3ExvFTcF43yEXS8wFY8q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="7641001"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="7641001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 18:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10696079"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2024 18:05:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rim5D-0006tH-2I;
	Sat, 09 Mar 2024 02:05:07 +0000
Date: Sat, 9 Mar 2024 10:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 21/37]
 fs/xfs/libxfs/xfs_ondisk.h:19:31: error: expression in static assertion is
 not constant
Message-ID: <202403090939.ewcaX0vX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   0dbdaafd38ae4f4af18c8650ff875d6a39f50bc4
commit: 8d4c4b96db63ef47a68c7ec47792eedf89efaff5 [21/37] xfs: add fs-verity support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240309/202403090939.ewcaX0vX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090939.ewcaX0vX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090939.ewcaX0vX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/semaphore.h:11,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> fs/xfs/libxfs/xfs_ondisk.h:19:31: error: expression in static assertion is not constant
      19 |         static_assert((value) == (expected), \
         |                       ~~~~~~~~^~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/xfs/libxfs/xfs_ondisk.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert((value) == (expected), \
         |         ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:199:9: note: in expansion of macro 'XFS_CHECK_VALUE'
     199 |         XFS_CHECK_VALUE(strlen(XFS_VERITY_DESCRIPTOR_NAME),
         |         ^~~~~~~~~~~~~~~


vim +19 fs/xfs/libxfs/xfs_ondisk.h

30cbc591c34e68 fs/xfs/xfs_ondisk.h Darrick J. Wong   2016-03-09   8  
30cbc591c34e68 fs/xfs/xfs_ondisk.h Darrick J. Wong   2016-03-09   9  #define XFS_CHECK_STRUCT_SIZE(structname, size) \
c12c50393c1f6f fs/xfs/xfs_ondisk.h Christoph Hellwig 2023-12-04  10  	static_assert(sizeof(structname) == (size), \
c12c50393c1f6f fs/xfs/xfs_ondisk.h Christoph Hellwig 2023-12-04  11  		"XFS: sizeof(" #structname ") is wrong, expected " #size)
30cbc591c34e68 fs/xfs/xfs_ondisk.h Darrick J. Wong   2016-03-09  12  
3f94c441e2c3de fs/xfs/xfs_ondisk.h Darrick J. Wong   2016-06-21  13  #define XFS_CHECK_OFFSET(structname, member, off) \
c12c50393c1f6f fs/xfs/xfs_ondisk.h Christoph Hellwig 2023-12-04  14  	static_assert(offsetof(structname, member) == (off), \
3f94c441e2c3de fs/xfs/xfs_ondisk.h Darrick J. Wong   2016-06-21  15  		"XFS: offsetof(" #structname ", " #member ") is wrong, " \
3f94c441e2c3de fs/xfs/xfs_ondisk.h Darrick J. Wong   2016-06-21  16  		"expected " #off)
3f94c441e2c3de fs/xfs/xfs_ondisk.h Darrick J. Wong   2016-06-21  17  
f93e5436f0ee5a fs/xfs/xfs_ondisk.h Darrick J. Wong   2020-08-17  18  #define XFS_CHECK_VALUE(value, expected) \
c12c50393c1f6f fs/xfs/xfs_ondisk.h Christoph Hellwig 2023-12-04 @19  	static_assert((value) == (expected), \
f93e5436f0ee5a fs/xfs/xfs_ondisk.h Darrick J. Wong   2020-08-17  20  		"XFS: value of " #value " is wrong, expected " #expected)
f93e5436f0ee5a fs/xfs/xfs_ondisk.h Darrick J. Wong   2020-08-17  21  

:::::: The code at line 19 was first introduced by commit
:::::: c12c50393c1f6f7d7e45c7f55da9c013c0cc0522 xfs: use static_assert to check struct sizes and offsets

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Chandan Babu R <chandanbabu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
