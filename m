Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAF146593
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 03:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762573930; cv=none; b=WwOSMrPsTvKuHA2kgSuAVgDAopHIItacZFrqy2f2C6Rv2RhNFbtx4QTqcByxx2FBtJHens48ggOFqR3o6yQpqg/0rQ/sdUACyj4RzQDmtcdaTRICu3RYSXwMp+8pYV4aDuiUSWQ0KEFwTi/OR96mbEyyr9ipcExYlnzmXucBUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762573930; c=relaxed/simple;
	bh=QNByaqPtxYoKLlVdpXtlCQUMyBvVqjwNo4P5QDQhNyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hnXXfzuXVDZlnEX4X3h/ahu0N76uIL8H2WzNrmKUjBgRJNRE/tikQQnrx03YHLcPYQg/Ib59jVtNv8Dfm3Bst2aJKDRmynCRlQhYzdZWG8WfGfDx9wE4K43lG0n+yRkXvq8g03R2Ohny0XIjufZUKZJu41YElwI0MFGAHV2oDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an6Ce6Rk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an6Ce6Rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762573929; x=1794109929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNByaqPtxYoKLlVdpXtlCQUMyBvVqjwNo4P5QDQhNyg=;
  b=an6Ce6Rkit4uywEciCmVnFI2hRmQ8qysVQk/522q7xV+DTG7V18WGDS/
   mKk51dvMm8d2Z8si+9zsQDjkchTpNklaWthp/pO+RWT+Jd2DdsL6skNxF
   7cLkXqpiVFHArOh8meMbanpn9wjPRyLNKZR1u/VjdT4Kcoh57I5KIJNK8
   tT9bOTd3Lj3OL1wPXh7AgOWvZSYG/wpdW0+Sb9M9Y3fWIEyaeDt5OGA6q
   7eDamj46IyfLMt7dGrrtqQ26FocXRLfSuzkS0MWDiJtXlWg3G/K+QDgVt
   UaAPzq7G/Y3gJnCsgdVO8DcTudDxLKd5ZltWOelWziYWIzrDErAEEGPnC
   A==;
X-CSE-ConnectionGUID: vSnMzs5rRZG55Wio8dwhyA==
X-CSE-MsgGUID: 1crKWtsIRBCRPWvT5+vtyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="52285514"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="52285514"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 19:52:06 -0800
X-CSE-ConnectionGUID: qIkulXAlSCG2vMOmoTCWTQ==
X-CSE-MsgGUID: wHUyVuGATzebfboJ5CQHng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="218937801"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2025 19:52:05 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHZze-0000gn-25;
	Sat, 08 Nov 2025 03:52:02 +0000
Date: Sat, 8 Nov 2025 11:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [akpm-mm:mm-nonmm-unstable 129/139] mm/shmem.c:5811:23: warning:
 unused variable 'flags'
Message-ID: <202511081101.9sXNBrzT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pratyush,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   2fa523fd0829356881811ce9553b707102f55bd3
commit: 730fb8720d1ba209cd74692ece9766101e1fdb56 [129/139] mm: shmem: use SHMEM_F_* flags instead of VM_* flags
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251108/202511081101.9sXNBrzT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081101.9sXNBrzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081101.9sXNBrzT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/shmem.c: In function '__shmem_file_setup':
>> mm/shmem.c:5811:23: warning: unused variable 'flags' [-Wunused-variable]
    5811 |         unsigned long flags = (vm_flags & VM_NORESERVE) ? SHMEM_F_NORESERVE : 0;
         |                       ^~~~~


vim +/flags +5811 mm/shmem.c

  5806	
  5807	static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
  5808					       loff_t size, unsigned long vm_flags,
  5809					       unsigned int i_flags)
  5810	{
> 5811		unsigned long flags = (vm_flags & VM_NORESERVE) ? SHMEM_F_NORESERVE : 0;
  5812		struct inode *inode;
  5813		struct file *res;
  5814	
  5815		if (IS_ERR(mnt))
  5816			return ERR_CAST(mnt);
  5817	
  5818		if (size < 0 || size > MAX_LFS_FILESIZE)
  5819			return ERR_PTR(-EINVAL);
  5820	
  5821		if (is_idmapped_mnt(mnt))
  5822			return ERR_PTR(-EINVAL);
  5823	
  5824		if (shmem_acct_size(flags, size))
  5825			return ERR_PTR(-ENOMEM);
  5826	
  5827		inode = shmem_get_inode(&nop_mnt_idmap, mnt->mnt_sb, NULL,
  5828					S_IFREG | S_IRWXUGO, 0, vm_flags);
  5829		if (IS_ERR(inode)) {
  5830			shmem_unacct_size(flags, size);
  5831			return ERR_CAST(inode);
  5832		}
  5833		inode->i_flags |= i_flags;
  5834		inode->i_size = size;
  5835		clear_nlink(inode);	/* It is unlinked */
  5836		res = ERR_PTR(ramfs_nommu_expand_for_mapping(inode, size));
  5837		if (!IS_ERR(res))
  5838			res = alloc_file_pseudo(inode, mnt, name, O_RDWR,
  5839					&shmem_file_operations);
  5840		if (IS_ERR(res))
  5841			iput(inode);
  5842		return res;
  5843	}
  5844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
