Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E802F3D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 06:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiCZ9eCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699250552; x=1730786552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7/rz59nlu5jFxdGD4VcC+NQvddGliZ5GRR2NlWdamU=;
  b=eiCZ9eCfqA4RBepltlWYVhqaVm35lJW5x5ztEP0aeuNrtpnIWKEZbs5F
   Wum8RKoKvkSMm47xvWhXJdn/ALSSt76jBp+PBLobJTu9CV/fQmi4n1cHr
   v3oRmuaymk2U/f6ksWC52vvvXfLFMIxZdoxFNuJ8Z6VnJqz/JhpZTYLFP
   SprQkQ0dBMCrXDSQ+EeO37mu5VQwglqbbt4gTI2xvYzpWQ5xD0r7HRfyH
   TvXPZpOKZXxE5mgF8r6jNvaTR+gEgE5QG8ODN3Ax8MD8HzqjH5cT5DYGc
   ncsB1/t2/uE6Dtt1Y9zAOso7dzWBYVYtcrVqJ2kYo9W6/VYvvZ3J8t75z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="388095363"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="388095363"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 22:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1009426845"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="1009426845"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Nov 2023 22:02:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzsgt-0006Ae-31;
	Mon, 06 Nov 2023 06:02:27 +0000
Date: Mon, 6 Nov 2023 14:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ben Skeggs <bskeggs@redhat.com>
Subject: drivers/gpu/drm/nouveau/nouveau_svm.c:829:13: warning: variable
 'ret' set but not used
Message-ID: <202311061339.WUjbKLrr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: e3d8b08904694e9ccae5163d0bb7d35fa66e5bdc drm/nouveau/svm: map pages after migration
date:   3 years, 6 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061339.WUjbKLrr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061339.WUjbKLrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061339.WUjbKLrr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_svm.c: In function 'nouveau_pfns_map':
>> drivers/gpu/drm/nouveau/nouveau_svm.c:829:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     829 |         int ret;
         |             ^~~


vim +/ret +829 drivers/gpu/drm/nouveau/nouveau_svm.c

   823	
   824	void
   825	nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
   826			 unsigned long addr, u64 *pfns, unsigned long npages)
   827	{
   828		struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 > 829		int ret;
   830	
   831		args->p.addr = addr;
   832		args->p.size = npages << PAGE_SHIFT;
   833	
   834		mutex_lock(&svmm->mutex);
   835	
   836		svmm->vmm->vmm.object.client->super = true;
   837		ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, sizeof(*args) +
   838					npages * sizeof(args->p.phys[0]), NULL);
   839		svmm->vmm->vmm.object.client->super = false;
   840	
   841		mutex_unlock(&svmm->mutex);
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
