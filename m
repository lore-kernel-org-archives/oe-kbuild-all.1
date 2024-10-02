Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50041103
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 00:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727829321; cv=none; b=WhJIkVnlvUXQ9MT5ClA/wHH0l46eiFjTfCQJQm4eqS9pOFoj4WQUFO7oh5pV2A9rn6AWRBtI/ah/kqDAHglxLd5lORkz8BThYDQyFGjCTfSZ9Pu6JVpey4sosHFfwY+EVn3RvCrlkoYOj1t0jBZhJgQba9hXbHt2JQNpsVKvok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727829321; c=relaxed/simple;
	bh=5ElPYvttxHt4Kr3OsrhKDORZ1Onf365JHgDLGZCt6tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=StqeFxa1J8GMTynolwTL9GGL57vE3kHdOIoHVBadh6cC6GFY6TnTBdAxgJHRVQ4317rN6TV98Ax0ddfC1BjAYIVF8H+ZQx2Tk1CCOosaSpFcxefDBZMuZ2etxpqlB7V0TPE3qk91V6ogRQalV1zeB4xtA7+i0tiOTpIG0cYZWPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFpm0hPE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFpm0hPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727829320; x=1759365320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ElPYvttxHt4Kr3OsrhKDORZ1Onf365JHgDLGZCt6tM=;
  b=SFpm0hPEJp+uKfsTFnhQHd56S8S+sMsM1ZzmepqfGiq1TAs+NX+UaKYX
   Dq5Ga0CHR/NJzziRxeb2A/Gq9HYvPhOxl4SEhK/UuDJwa1v5lTSIFFXAI
   lV3QNCVfuGNJ8jniYKHvsXXX5/IlH+icLSHNKbMTvI66vWeq+FgMhbIEo
   tGRRmnygYdzAIhf4uYJ8qSHl+hZZxmYMWzy7Yi/FISNo5EIxFbGERewFa
   zujlp94h08yMdxZSnlip5GjH+Jk3VDKYjJjzPyVaa4nK+4OuDoOvSDvuk
   7iEpHtd5iCx7fvQ0gkG+VI2TsFvbGYxkAc77S+iAVojtscvpEWilJZzRH
   w==;
X-CSE-ConnectionGUID: ILmtkPDoSdKc1piw4ZdUzg==
X-CSE-MsgGUID: TPqcIukuS4ej2Bjvz4H5rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27163970"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27163970"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 17:35:17 -0700
X-CSE-ConnectionGUID: 5Im2PgPcSS2VDOsyw0MQEw==
X-CSE-MsgGUID: w5Cx7Q+8QkSH0nH7tN+lig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78381602"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Oct 2024 17:35:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svnKk-000RMV-0F;
	Wed, 02 Oct 2024 00:35:14 +0000
Date: Wed, 2 Oct 2024 08:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 79/1491]
 drivers/media/pci/intel/ipu6/../ipu-dma.c:306:9: warning: unused variable
 'i'
Message-ID: <202410020829.gQazghjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 3d9537f3dbb4a00c2dcd0cdb1d19ccbd7cddd8f2 [79/1491] CHROMIUM: media/ipu6: use vm_insert_pages() and check the return value
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410020829.gQazghjH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020829.gQazghjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020829.gQazghjH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/../ipu-dma.c:306:9: warning: unused variable 'i' [-Wunused-variable]
     306 |         size_t i;
         |                ^
   1 warning generated.


vim +/i +306 drivers/media/pci/intel/ipu6/../ipu-dma.c

60e566f1ebecf5c Tianshu Qiu 2021-07-16  298  
60e566f1ebecf5c Tianshu Qiu 2021-07-16  299  static int ipu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
60e566f1ebecf5c Tianshu Qiu 2021-07-16  300  			void *addr, dma_addr_t iova, size_t size,
60e566f1ebecf5c Tianshu Qiu 2021-07-16  301  			unsigned long attrs)
60e566f1ebecf5c Tianshu Qiu 2021-07-16  302  {
60e566f1ebecf5c Tianshu Qiu 2021-07-16  303  	struct ipu_mmu *mmu = to_ipu_bus_device(dev)->mmu;
60e566f1ebecf5c Tianshu Qiu 2021-07-16  304  	struct vm_info *info;
60e566f1ebecf5c Tianshu Qiu 2021-07-16  305  	size_t count = PAGE_ALIGN(size) >> PAGE_SHIFT;
60e566f1ebecf5c Tianshu Qiu 2021-07-16 @306  	size_t i;
60e566f1ebecf5c Tianshu Qiu 2021-07-16  307  
60e566f1ebecf5c Tianshu Qiu 2021-07-16  308  	info = get_vm_info(mmu, iova);
60e566f1ebecf5c Tianshu Qiu 2021-07-16  309  	if (!info)
60e566f1ebecf5c Tianshu Qiu 2021-07-16  310  		return -EFAULT;
60e566f1ebecf5c Tianshu Qiu 2021-07-16  311  
60e566f1ebecf5c Tianshu Qiu 2021-07-16  312  	if (!info->vaddr)
60e566f1ebecf5c Tianshu Qiu 2021-07-16  313  		return -EFAULT;
60e566f1ebecf5c Tianshu Qiu 2021-07-16  314  
60e566f1ebecf5c Tianshu Qiu 2021-07-16  315  	if (vma->vm_start & ~PAGE_MASK)
60e566f1ebecf5c Tianshu Qiu 2021-07-16  316  		return -EINVAL;
60e566f1ebecf5c Tianshu Qiu 2021-07-16  317  
60e566f1ebecf5c Tianshu Qiu 2021-07-16  318  	if (size > info->size)
60e566f1ebecf5c Tianshu Qiu 2021-07-16  319  		return -EFAULT;
60e566f1ebecf5c Tianshu Qiu 2021-07-16  320  
3d9537f3dbb4a00 Bingbu Cao  2024-05-09  321  	return vm_insert_pages(vma, vma->vm_start, info->pages, &count);
60e566f1ebecf5c Tianshu Qiu 2021-07-16  322  }
60e566f1ebecf5c Tianshu Qiu 2021-07-16  323  

:::::: The code at line 306 was first introduced by commit
:::::: 60e566f1ebecf5c38e7718cc52e5a482505b6742 CHROMIUM: media: add Intel IPU6 drivers

:::::: TO: Tianshu Qiu <tian.shu.qiu@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
