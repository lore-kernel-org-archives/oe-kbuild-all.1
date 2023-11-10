Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911DD24A1A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcdsxPxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699645580; x=1731181580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCGky73OAcF4hTzrwdjE4ZRc8FSP8qF10tB5ai86xCg=;
  b=AcdsxPxyD6cN5K/nDBG90IX8Ni2Ec/uzw+JBOGa3KZ0J8cUMCku6L7Zf
   RP2fP12L9bcwwjRwkVjsrBhu/8IaAZdHZksxbgdt1vQx6iXgvzYCxETU6
   Zv5hOBd/LmnUvdXdrIMZo8Dw3BcJNFZWCpEV8mUcNOKrhGSFU+82w63cg
   WtiMlS8/6jk/HShXeRJG8FtJLNWA6hna5tChL7FriJnJjsVWF7mj8Ewrg
   b3B1RZjSmhPswLEYI+CJgoodHGiZthgFHlaWuO4JTmUFnUc9M8qKzaV/4
   CfbVlhiQxq+O3XxqAQcwqy4zjB09rDdlzCnYaAcMfLZjEeZm2s8YSpmIK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369558887"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="369558887"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 11:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1095254794"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="1095254794"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2023 11:46:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1XSK-0009rG-11;
	Fri, 10 Nov 2023 19:46:16 +0000
Date: Sat, 11 Nov 2023 03:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
	Steven Price <steven.price@arm.com>
Subject: [mmind-rockchip:dev/panthor 36/41]
 drivers/gpu/drm/panthor/panthor_device.c:307:31: error: implicit declaration
 of function 'virt_to_pfn'; did you mean 'virt_to_kpte'?
Message-ID: <202311110336.AUEAC1Vw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Boris,

First bad commit (maybe != root cause):

tree:   https://github.com/mmind/linux-rockchip dev/panthor
head:   ef8d76d568fba69012333ce6e9d7cce4aebbb2da
commit: 86d43fb902f5db2a81e432041864dd7523314c70 [36/41] drm/panthor: Allow driver compilation
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110336.AUEAC1Vw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110336.AUEAC1Vw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110336.AUEAC1Vw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_device.c: In function 'panthor_mmio_vm_fault':
>> drivers/gpu/drm/panthor/panthor_device.c:307:31: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_kpte'? [-Werror=implicit-function-declaration]
     307 |                         pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
         |                               ^~~~~~~~~~~
         |                               virt_to_kpte
   cc1: some warnings being treated as errors


vim +307 drivers/gpu/drm/panthor/panthor_device.c

0397be1efb94b5 Boris Brezillon 2023-08-09  284  
0397be1efb94b5 Boris Brezillon 2023-08-09  285  static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
0397be1efb94b5 Boris Brezillon 2023-08-09  286  {
0397be1efb94b5 Boris Brezillon 2023-08-09  287  	struct vm_area_struct *vma = vmf->vma;
0397be1efb94b5 Boris Brezillon 2023-08-09  288  	struct panthor_device *ptdev = vma->vm_private_data;
0397be1efb94b5 Boris Brezillon 2023-08-09  289  	u64 id = (u64)vma->vm_pgoff << PAGE_SHIFT;
0397be1efb94b5 Boris Brezillon 2023-08-09  290  	unsigned long pfn;
0397be1efb94b5 Boris Brezillon 2023-08-09  291  	pgprot_t pgprot;
0397be1efb94b5 Boris Brezillon 2023-08-09  292  	vm_fault_t ret;
0397be1efb94b5 Boris Brezillon 2023-08-09  293  	bool active;
0397be1efb94b5 Boris Brezillon 2023-08-09  294  	int cookie;
0397be1efb94b5 Boris Brezillon 2023-08-09  295  
0397be1efb94b5 Boris Brezillon 2023-08-09  296  	if (!drm_dev_enter(&ptdev->base, &cookie))
0397be1efb94b5 Boris Brezillon 2023-08-09  297  		return VM_FAULT_SIGBUS;
0397be1efb94b5 Boris Brezillon 2023-08-09  298  
0397be1efb94b5 Boris Brezillon 2023-08-09  299  	mutex_lock(&ptdev->pm.mmio_lock);
0397be1efb94b5 Boris Brezillon 2023-08-09  300  	active = atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE;
0397be1efb94b5 Boris Brezillon 2023-08-09  301  
0397be1efb94b5 Boris Brezillon 2023-08-09  302  	switch (panthor_device_mmio_offset(id)) {
0397be1efb94b5 Boris Brezillon 2023-08-09  303  	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
0397be1efb94b5 Boris Brezillon 2023-08-09  304  		if (active)
0397be1efb94b5 Boris Brezillon 2023-08-09  305  			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
0397be1efb94b5 Boris Brezillon 2023-08-09  306  		else
0397be1efb94b5 Boris Brezillon 2023-08-09 @307  			pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
0397be1efb94b5 Boris Brezillon 2023-08-09  308  		break;
0397be1efb94b5 Boris Brezillon 2023-08-09  309  
0397be1efb94b5 Boris Brezillon 2023-08-09  310  	default:
0397be1efb94b5 Boris Brezillon 2023-08-09  311  		ret = VM_FAULT_SIGBUS;
0397be1efb94b5 Boris Brezillon 2023-08-09  312  		goto out_unlock;
0397be1efb94b5 Boris Brezillon 2023-08-09  313  	}
0397be1efb94b5 Boris Brezillon 2023-08-09  314  
0397be1efb94b5 Boris Brezillon 2023-08-09  315  	pgprot = vma->vm_page_prot;
0397be1efb94b5 Boris Brezillon 2023-08-09  316  	if (active)
0397be1efb94b5 Boris Brezillon 2023-08-09  317  		pgprot = pgprot_noncached(pgprot);
0397be1efb94b5 Boris Brezillon 2023-08-09  318  
0397be1efb94b5 Boris Brezillon 2023-08-09  319  	ret = vmf_insert_pfn_prot(vma, vmf->address, pfn, pgprot);
0397be1efb94b5 Boris Brezillon 2023-08-09  320  
0397be1efb94b5 Boris Brezillon 2023-08-09  321  out_unlock:
0397be1efb94b5 Boris Brezillon 2023-08-09  322  	mutex_unlock(&ptdev->pm.mmio_lock);
0397be1efb94b5 Boris Brezillon 2023-08-09  323  	drm_dev_exit(cookie);
0397be1efb94b5 Boris Brezillon 2023-08-09  324  	return ret;
0397be1efb94b5 Boris Brezillon 2023-08-09  325  }
0397be1efb94b5 Boris Brezillon 2023-08-09  326  

:::::: The code at line 307 was first introduced by commit
:::::: 0397be1efb94b59f907d905466bcef6aad6508d9 drm/panthor: Add the device logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
