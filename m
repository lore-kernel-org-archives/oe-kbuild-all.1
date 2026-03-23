Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B322571C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774309648; cv=none; b=tk6dhrpcWwjkrkm4qr1sgWQc/0VSSzXPYCccANW2fpqEFztvHS2bhZY8MASY1rsFu31NpHRKS8HgUS35mmjrGflhOsbj2FDYCd55VERUynB8H+gGB3LqIGGueuX1fb16A4m+nR3ih4/9YkfSdcRVOkDTc/75EKgnXmmiIl8G5sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774309648; c=relaxed/simple;
	bh=2Q72PblaNnR8p9dMWRQ/l64P+cPS69Xf8ikLMWyjdu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hcG4dZrB+gsfJZlzLmxQ1naLlJgP/rg09p7MaGLztfBxI2AIGxsB/aYY36q3+r8mEatpB8Vtme7+jCnWd/0LIXHV6JDBKttDrqwCM0ykZ13Dul/ars8IRsR60y8nYIQOSA0xyTmhqHdfCmHaJr9KzIEO5ep3QrdL4//Dxh7Qp6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9CdBox8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9CdBox8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774309646; x=1805845646;
  h=date:from:to:cc:subject:message-id;
  bh=2Q72PblaNnR8p9dMWRQ/l64P+cPS69Xf8ikLMWyjdu4=;
  b=T9CdBox8FOV4+6ZHwIc5jgM/SOnfk2J3Lsizah/FLPN8MUZ1WJUBBIRH
   ebqWUcpeBPE/df7x0GLhtq58XjJHYZej0AVAQcE/0Yi97OfG5jm7fWDNk
   NCELfwC4XUYU1Tb+C2o2luCIZ+TWwLmgCADLvQQ2SZOEPvtEbbZV9KtuH
   ZZ3sLYnrD8HUppcrNbCVRgFG8T7mBjJ1fJXN0SzhVIeoUIRnTefe1g8Kk
   QHf7M/l5VWp1MryzlcOJH1zSE57kzi+Flj1UbOIlVLdaIfJIxo+e+TSJF
   76WOiubmcAZ9OnjpvRx9AJKe/9iwrFHUjL6BGU+XNAt2HC2+PYqKjVBii
   Q==;
X-CSE-ConnectionGUID: fYW/0VwDQHeCtUZpxHhI7g==
X-CSE-MsgGUID: SjwpDpH+QhyQ0nI3dHvAAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86392947"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86392947"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 16:47:26 -0700
X-CSE-ConnectionGUID: tuVCcqhtSYS9KziIAvpOfg==
X-CSE-MsgGUID: LkcPMf/gT2O9EAhmlkgeAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224191516"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2026 16:47:24 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4ozS-000000003PP-19Fw;
	Mon, 23 Mar 2026 23:47:22 +0000
Date: Tue, 24 Mar 2026 07:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/f2fs/file.c:42:12:
 warning: no previous prototype for 'f2fs_filemap_fault'
Message-ID: <202603240747.B2Yd9Pzk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: db302359ea1b5252a28abcb23a382be91c961ac0 [1/1] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240747.B2Yd9Pzk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240747.B2Yd9Pzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240747.B2Yd9Pzk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/file.c:42:12: warning: no previous prototype for 'f2fs_filemap_fault' [-Wmissing-prototypes]
    vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
               ^~~~~~~~~~~~~~~~~~


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
