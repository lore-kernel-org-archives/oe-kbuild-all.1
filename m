Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634C193072
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722426577; cv=none; b=Rl2rW+0sAUeS+kVO/sb77uScjfGYDoNgkxpLpgLxp8flLvSon7kVtY0gL4yfTj2paO6T//Kyuz/fbxkFj/5DHRvXcouXIuYhjjxKXKnRqQn0GeUqyfi9btpLGv4phidpwF+nQmVDeBtix0IJa6/PA+VDAt5EQMCqu3wmT0PWhZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722426577; c=relaxed/simple;
	bh=o8a2QkCR7yJx3v0cPMVp4TC77bXMTb4yTvGF+7kr2W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uyfKs24tQSE8TvNBGppturF6Q+cH+J0d9dZZs5Ejri3KiiXzag+6KtR7YMt4Gw5D58hNzqsGSDNUtQJyai27bmV+L2FYvTHMpk0KJRlUg5FocIujWF8bk/QBeIEeABe0HGdf2DCR8Qb0m3g+hTNSB3UUe7XUxajLy2r6g/I7h/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VM2rv4hk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VM2rv4hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722426575; x=1753962575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o8a2QkCR7yJx3v0cPMVp4TC77bXMTb4yTvGF+7kr2W4=;
  b=VM2rv4hkw8/AObYkVHz3KaSD5+rIdxs1lNR3TOfhU48VnFW7968j0sCI
   MJysVTGFTYKKU7D8b4a/h9vI86+HLwhXj5FQex8T+a9VuV7UBCUSqv5Sh
   /8IiGzo+UDaZTyPqCxfDOuRWjlmRnWVWgm853Y3U4LKZBIDGIMCeGp4hT
   elXFqqIARh0OK6psAmem7ULJUncItwL+o+qgv72sh0VUoIUc49/oQjqNF
   /Ue87DyD68IT/mErHkSxQNW766Sm6rXRFG5IQhdfEO02gjEJaBSGIX11Z
   89Q4isWxk5QfNllBjfTvzbGJ9eT7zCphnL3+Fe75Bt7Ivefd+6PuYWtq8
   w==;
X-CSE-ConnectionGUID: 8rpgjVM0RjetQRFnThVV1g==
X-CSE-MsgGUID: FJUJjIL4Sii8gZ/kQ3sX1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20437597"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="20437597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 04:49:35 -0700
X-CSE-ConnectionGUID: r8oqILgnQ1y1h6xNuoqpiA==
X-CSE-MsgGUID: Eb6U+VAnRPKnE9SEgV78hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59726586"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2024 04:49:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ7pj-000uCa-1X;
	Wed, 31 Jul 2024 11:49:31 +0000
Date: Wed, 31 Jul 2024 19:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/f2fs/file.c:42:12: warning: no
 previous prototype for 'f2fs_filemap_fault'
Message-ID: <202407311945.8bv2NHnY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   50061e6d7f65f65487f586d257952bfe7f5c4fd3
commit: db302359ea1b5252a28abcb23a382be91c961ac0 [1/1] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm-randconfig-001-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311945.8bv2NHnY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311945.8bv2NHnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311945.8bv2NHnY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/file.c:42:12: warning: no previous prototype for 'f2fs_filemap_fault' [-Wmissing-prototypes]
      42 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         |            ^~~~~~~~~~~~~~~~~~


vim +/f2fs_filemap_fault +42 fs/f2fs/file.c

    41	
  > 42	vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
    43	{
    44		struct inode *inode = file_inode(vmf->vma->vm_file);
    45		vm_flags_t flags = vmf->vma->vm_flags;
    46		vm_fault_t ret;
    47	
    48		ret = filemap_fault(vmf);
    49		if (ret & VM_FAULT_LOCKED)
    50			f2fs_update_iostat(F2FS_I_SB(inode), inode,
    51						APP_MAPPED_READ_IO, F2FS_BLKSIZE);
    52	
    53		trace_f2fs_filemap_fault(inode, vmf->pgoff, flags, ret);
    54	
    55		return ret;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
