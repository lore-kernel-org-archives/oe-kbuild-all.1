Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C142718562A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722425316; cv=none; b=eycWkaST5l+zY/vrOCW+kCkhyhtUDa5dC44Roqivrl23mQpJYkOD+AuNN8l4JmbR06ngpH3m7opWx/Aq/9NXhPRXbnv7Jxkwopbbu3lGY526xRnpVmWOi2DIEASOac2a9LkPcz2ymaS2b/ZkB7u8+3XBRCj0LCi/pvPjz2NUZ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722425316; c=relaxed/simple;
	bh=E+hnrLeWH/OfbwA7U7v5BfbBpE0V5mjHibQjdYqzUT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=prviY+7+Wvox0j79CRS++skKtN0yPzTCbcEwH3wZXT9e4WNc+aVnkNabrvy+Xbn59D127hYq/UR4vtjChnkoohjDZB+SVp4xFLNWe/sMKsh3pPolorpJYMbscDUMf8P4dJo1LhLINCSYRQGPlQZJnaoZf8QP4Rc3tRP+pkiSTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fV9ICy1b; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fV9ICy1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722425315; x=1753961315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E+hnrLeWH/OfbwA7U7v5BfbBpE0V5mjHibQjdYqzUT0=;
  b=fV9ICy1bSJMqUTTx4BNcu/2W4twTiYDvTnHgjkOIbOO8jH+wsV6MfMpv
   AlhKuOuqtw1lYC9kYDAvWa8gln1s9oNZaC5mNDv6Q4ei9JxHuqNP7G2H3
   6LXkZALFxB0PPE7qV89SIvaAQrGYY8q6lgZpYkbJbqEf/GLywWxT0qWGy
   VWMyQRA6DXte39c+7a/0R7PCbCBMDBi56BI97Nz1lX1HP6MRPWRj9oigM
   gpPkOFp+iuM/rPaS2QGEsA3Y+iOpFZnbtodSIXfpUxKduCZA5rIXcz1Bi
   SJ3+/v/PbxPz4flA1Ta6jM/Q+rkxja4nfoMHZ3ZXc9+w8Sb/tlLwAfSu3
   A==;
X-CSE-ConnectionGUID: 2EmrhHSFRLKcIacI5Uu0kw==
X-CSE-MsgGUID: oaB56QGHRFur5O2EBJwfeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19990484"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="19990484"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 04:28:34 -0700
X-CSE-ConnectionGUID: OAnOZ1BbSE6qrS6bAXdU1Q==
X-CSE-MsgGUID: 3wuYoNuZRL677zZESpng9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54710018"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2024 04:28:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ7VP-000uBs-00;
	Wed, 31 Jul 2024 11:28:31 +0000
Date: Wed, 31 Jul 2024 19:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/f2fs/file.c:42:12: warning: no
 previous prototype for function 'f2fs_filemap_fault'
Message-ID: <202407311936.Mz6SAabv-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311936.Mz6SAabv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311936.Mz6SAabv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311936.Mz6SAabv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/file.c:42:12: warning: no previous prototype for function 'f2fs_filemap_fault' [-Wmissing-prototypes]
      42 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         |            ^
   fs/f2fs/file.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         | ^
         | static 
   1 warning generated.


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
