Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1412B8B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 02:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725674925; cv=none; b=uey4CX8d5xVXm55JffecesslhbsHZQYNtDb7JHzwZk5ZBCoLgC2ZfHq/pri1hzdgKkEb+CSrekfl7+zPLwpLoUUuFvYsAltpITda9d2WIMLzwP+jXm+Mj3MNickkBzsFCU5ua1Xo3cvf0yw4dgrjKPMry266TpviOI1ng9iT22o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725674925; c=relaxed/simple;
	bh=IQu2Zo0elrsu4zOFZg4d1UcPIDvQmTXiNDGpukW/CxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z6vBVASjzpeXfHKR0DNmCj3m2/3X5LJREioyr0XtJCL5tBFcGssgm4NI+4M5LKwiXMk4/okTiA1qM165PeosEhn8qR3t/6AZ1u3qUx996cOLBsbjHj/tURhy/rnsQPFhOZ9uyR224s2htPUObb8hp7dTzAQ1tg9+f4FnrAFTeB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAAl+w2b; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAAl+w2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725674924; x=1757210924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQu2Zo0elrsu4zOFZg4d1UcPIDvQmTXiNDGpukW/CxA=;
  b=oAAl+w2b8eDRDIEvycjKpbEeZNbMo+uaFj/9Sm6S0oGJIBoYU3qTQUws
   N4NnIcBo8wsLX5qAf8mora3XSC2e7h9i6S0PaBW0HY0/l124EubxmvxsY
   RskkGzQSQF7ucIZf4/jg5hWgMP45/dhHu4ztt426d6ZF0+gDENMPoFqlz
   kQfvyQ9nBxHXN2bmsHKkiJXpY3vFVeMC7w4lKafKeCtMEYufZaJeKNl5k
   reUmsuuhzl1NzzdLEcC+fAAWE/IiBcm1GGfTTueuDJlwlm/EIQTDSt3QF
   tX+UO2K/43yxdFFxp0gK3ADOsDFKqS+WuZzt9l8ZFud+wyBLrA9PQKF7j
   Q==;
X-CSE-ConnectionGUID: iDxnOAsJQXCqJ5imaY9udA==
X-CSE-MsgGUID: +feYSI6dSKmtsYIXn/uGyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="27371795"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="27371795"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 19:08:43 -0700
X-CSE-ConnectionGUID: hVjccbRvTkCuuv/CqmcUGg==
X-CSE-MsgGUID: feKfe51eSZyB3/MeD8ucTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70917909"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2024 19:08:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smksR-000C2B-1c;
	Sat, 07 Sep 2024 02:08:39 +0000
Date: Sat, 7 Sep 2024 10:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>
Subject: [linux-next:master 9848/10296] fs/xfs/xfs_file.c:1286:undefined
 reference to `filemap_fsnotify_fault'
Message-ID: <202409071013.bbWWqWwI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 436df5326f579750c9a03b986e81132c4bab46f6 [9848/10296] xfs: add pre-content fsnotify hook for write faults
config: arm-randconfig-r031-20230101 (https://download.01.org/0day-ci/archive/20240907/202409071013.bbWWqWwI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071013.bbWWqWwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071013.bbWWqWwI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/xfs/xfs_file.o: in function `xfs_write_fault':
>> fs/xfs/xfs_file.c:1286:(.text+0xd5a): undefined reference to `filemap_fsnotify_fault'


vim +1286 fs/xfs/xfs_file.c

  1275	
  1276	static vm_fault_t
  1277	xfs_write_fault(
  1278		struct vm_fault		*vmf,
  1279		unsigned int		order)
  1280	{
  1281		struct inode		*inode = file_inode(vmf->vma->vm_file);
  1282		struct xfs_inode	*ip = XFS_I(inode);
  1283		unsigned int		lock_mode = XFS_MMAPLOCK_SHARED;
  1284		vm_fault_t		ret;
  1285	
> 1286		ret = filemap_fsnotify_fault(vmf);
  1287		if (unlikely(ret))
  1288			return ret;
  1289	
  1290		sb_start_pagefault(inode->i_sb);
  1291		file_update_time(vmf->vma->vm_file);
  1292	
  1293		/*
  1294		 * Normally we only need the shared mmaplock, but if a reflink remap is
  1295		 * in progress we take the exclusive lock to wait for the remap to
  1296		 * finish before taking a write fault.
  1297		 */
  1298		xfs_ilock(ip, XFS_MMAPLOCK_SHARED);
  1299		if (xfs_iflags_test(ip, XFS_IREMAPPING)) {
  1300			xfs_iunlock(ip, XFS_MMAPLOCK_SHARED);
  1301			xfs_ilock(ip, XFS_MMAPLOCK_EXCL);
  1302			lock_mode = XFS_MMAPLOCK_EXCL;
  1303		}
  1304	
  1305		if (IS_DAX(inode))
  1306			ret = xfs_dax_fault_locked(vmf, order, true);
  1307		else
  1308			ret = iomap_page_mkwrite(vmf, &xfs_page_mkwrite_iomap_ops);
  1309		xfs_iunlock(ip, lock_mode);
  1310	
  1311		sb_end_pagefault(inode->i_sb);
  1312		return ret;
  1313	}
  1314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
