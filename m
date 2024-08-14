Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968A1BD514
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723662399; cv=none; b=uxa8Uc1b5+xr6r5mM0qDU7SN8EZ89tfuC959aB15NfDXdyiL7eQzkYSnBaG0YLkWw13hbBqibEvtt/CYddrjScxlf9pyylx3O3beytpmSV+gLISTCzvGV4z41URBdQx33zfLaOQVnJH/2Xmmh1GCdAC7cAy2fvshsvrDUzv5GUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723662399; c=relaxed/simple;
	bh=JEnl+dUe2enpdh2KInhiVsvP1MCCbLZW64ZMa1XzW2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iN0Qc0E7Bg46LyDOO0ykz/4O/cL0cAuzUoJ5FydRUZukC7ygKD7xrBhUV4zew+N1VDC0yQOg9YWkQXcxADzBqgPwuieU3EqcqFUyWbEocxg+/SyaiHLFo8AzwKzHotqedXgtb6N8eEkJIPvBz3nZOUNl85i5sqY51W3f+RndsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISedkSIL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISedkSIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723662397; x=1755198397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEnl+dUe2enpdh2KInhiVsvP1MCCbLZW64ZMa1XzW2A=;
  b=ISedkSIL1aqS0gTtBFts9BkDN1yHZMx76GpGYVtTbRk2hKXB4/uurppD
   5g21VZCGkHSt+sN1KBUkdU5DpAIarviAA1i9esPHb/6FWOtrzDJNkyLBX
   qKiqo5U3I2JccznKsgj8Rimy5Na4y7ZHGL0c4I/OtAOhv0VooRw13Arp3
   lvb2jHZVBMT1Gfhg9deR8wbNMUG/fCmqRFD4C8MjO9JSAAowcrp20FyRr
   6eJF2r3bWTYrnX+6xJKYFxTfaeR1dhw2/gRbs1P0CgWzHjC7meidThh1d
   fRdRzqFEXk2CdYsiDwpSKLzuXC0H0jM/cvVLXj5SUDM1xEiCL0EbHZ9PT
   w==;
X-CSE-ConnectionGUID: t/Ez0ClWSBSDs7Lqcm27Hg==
X-CSE-MsgGUID: ExAxc3IVQ2KvWdk3ugajNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21758111"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21758111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 12:06:35 -0700
X-CSE-ConnectionGUID: hfZ/gC7nRMeMyBoIywl9sQ==
X-CSE-MsgGUID: JB71uN8PRqGQoaH3PIGZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="58777492"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2024 12:06:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seJKJ-0002kg-1z;
	Wed, 14 Aug 2024 19:06:31 +0000
Date: Thu, 15 Aug 2024 03:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 230/253] fs/xfs/xfs_bmap_util.h:89:66: error:
 expected identifier or '(' before '-' token
Message-ID: <202408150316.Z8SISv5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   dabb7872a6f25b04b590e544cc0f5f3ac560194e
commit: d889f27844ddd965dcfdbfbdab2a41bae07d33bf [230/253] xfs: add an ioctl to map free space into a file
config: x86_64-randconfig-002-20240814 (https://download.01.org/0day-ci/archive/20240815/202408150316.Z8SISv5W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150316.Z8SISv5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408150316.Z8SISv5W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_bmap_util.c:21:
>> fs/xfs/xfs_bmap_util.h:89:66: error: expected identifier or '(' before '-' token
      89 | # define xfs_map_free_rt_space(ip, off, len)                    (-EOPNOTSUPP)
         |                                                                  ^
   fs/xfs/xfs_bmap_util.c:2224:1: note: in expansion of macro 'xfs_map_free_rt_space'
    2224 | xfs_map_free_rt_space(
         | ^~~~~~~~~~~~~~~~~~~~~


vim +89 fs/xfs/xfs_bmap_util.h

    74	
    75	xfs_extnum_t xfs_bmap_count_leaves(struct xfs_ifork *ifp, xfs_filblks_t *count);
    76	int xfs_bmap_count_blocks(struct xfs_trans *tp, struct xfs_inode *ip,
    77				  int whichfork, xfs_extnum_t *nextents,
    78				  xfs_filblks_t *count);
    79	
    80	int	xfs_flush_unmap_range(struct xfs_inode *ip, xfs_off_t offset,
    81				      xfs_off_t len);
    82	
    83	#ifdef CONFIG_XFS_RT
    84	int xfs_convert_rtbigalloc_file_space(struct xfs_inode *ip, loff_t pos,
    85			uint64_t len);
    86	int xfs_map_free_rt_space(struct xfs_inode *ip, xfs_off_t off, xfs_off_t len);
    87	#else
    88	# define xfs_convert_rtbigalloc_file_space(ip, pos, len)	(-EOPNOTSUPP)
  > 89	# define xfs_map_free_rt_space(ip, off, len)			(-EOPNOTSUPP)
    90	#endif
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
