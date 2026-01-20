Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE75346761
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 04:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768883447; cv=none; b=QORkaQXEs4qEA0XLyaJMBTKDKPaxyBQBjytiXeqa7xvW274K8aAsoqSUwKKWqJ4yCCLqBlopqWMqrcTHNpD3M3Uk/kSZhFv1rhN3fILO8is7WRkYeJeICEYx9uj5VUyzKkXqa/NR/jBsA88kukQI376NogzKWjFcvrcOhwpKLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768883447; c=relaxed/simple;
	bh=IvCvtGFMU+zMSiL0kWDIyAHqIaW7BLSXNeH5bGaW47U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=onv/maGYeL/DsDO2WMFDieWYvM6n1PyL8Ez1qDYYJ2jYTXQ9FdJUA1LRoFXQGsmUWVm60qTrVwxQNVqgvxhoYg7vZzkPjgnBt4EnDeUoKp7HBP4p9MnAJR7U9fDl/Axww22fmxSImafJp7sovTHOAdPl9ilEqjN6ou9GmyGl3KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQBapclx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQBapclx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768883442; x=1800419442;
  h=date:from:to:cc:subject:message-id;
  bh=IvCvtGFMU+zMSiL0kWDIyAHqIaW7BLSXNeH5bGaW47U=;
  b=UQBapclxnYOJ+4qABVGJqK4LiVxnpP25vOEz46Rs7vDparOYJw2VzkBL
   QMNU13dJhSFdmfu09EtuyU4unPYSgjxRH9eEtjQeyzseeT84SFQo0JMsz
   ltHSTdpCRvniVu1iCZ3ULE2aIz6wdt+dWK6COjWswyhR2mHmVNBlwhVAp
   Jw4DeSuIg1mwM3FwxiuKfj7vWFGnDz5C7Z2qg3NpN6E88xSp2OW1hpltd
   AGsSH2yQV0hdwMgVWmoUJbkYBTE2wAJOYb2VwAOYl0jr6P54pf9d2HcaO
   Hd6JrfP607iSqUME0ZTvyTy/GOhRES+YRxsAgf3mdwmPj5qiv+RnTlcNY
   A==;
X-CSE-ConnectionGUID: 7NkzIIARQdu+koAYJ5fS9w==
X-CSE-MsgGUID: rQ7x4N8oQxeTc86UoY9ioQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73712884"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="73712884"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 20:30:37 -0800
X-CSE-ConnectionGUID: FfXQy86jRFGTwne+Pzv4WA==
X-CSE-MsgGUID: gBv55u1URiK0U0cd0gobqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="228940070"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 20:30:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi3Nx-00000000OYd-1ptv;
	Tue, 20 Jan 2026 04:30:33 +0000
Date: Tue, 20 Jan 2026 12:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 417/421] fs/xfs/xfs_file.c:1977:36: error:
 incompatible type for argument 1 of 'daxdev_mapping_supported'
Message-ID: <202601201209.cGuf98oB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   e4348a62bb1acacafcdeb149c9363291fae08c0c
commit: e3900da1b37f861133669d26ae02415f18fa71b9 [417/421] mm: update all remaining mmap_prepare users to use vma_flags_t
config: parisc-randconfig-001-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201209.cGuf98oB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201209.cGuf98oB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201209.cGuf98oB-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_file.c: In function 'xfs_file_mmap_prepare':
>> fs/xfs/xfs_file.c:1977:36: error: incompatible type for argument 1 of 'daxdev_mapping_supported'
     if (!daxdev_mapping_supported(desc->vma_flags, file_inode(file),
                                   ~~~~^~~~~~~~~~~
   In file included from fs/xfs/xfs_buf.h:14,
                    from fs/xfs/xfs_linux.h:81,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_file.c:6:
   include/linux/dax.h:114:56: note: expected 'vm_flags_t' {aka 'long unsigned int'} but argument is of type 'vma_flags_t' {aka 'struct <anonymous>'}
    static inline bool daxdev_mapping_supported(vm_flags_t vm_flags,
                                                ~~~~~~~~~~~^~~~~~~~


vim +/daxdev_mapping_supported +1977 fs/xfs/xfs_file.c

  1964	
  1965	STATIC int
  1966	xfs_file_mmap_prepare(
  1967		struct vm_area_desc	*desc)
  1968	{
  1969		struct file		*file = desc->file;
  1970		struct inode		*inode = file_inode(file);
  1971		struct xfs_buftarg	*target = xfs_inode_buftarg(XFS_I(inode));
  1972	
  1973		/*
  1974		 * We don't support synchronous mappings for non-DAX files and
  1975		 * for DAX files if underneath dax_device is not synchronous.
  1976		 */
> 1977		if (!daxdev_mapping_supported(desc->vma_flags, file_inode(file),
  1978					      target->bt_daxdev))
  1979			return -EOPNOTSUPP;
  1980	
  1981		file_accessed(file);
  1982		desc->vm_ops = &xfs_file_vm_ops;
  1983		if (IS_DAX(inode))
  1984			vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
  1985		return 0;
  1986	}
  1987	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
