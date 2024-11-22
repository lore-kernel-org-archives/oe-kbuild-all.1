Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A691DDA32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 18:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732301771; cv=none; b=PrS7nkOicUtHNTPDn/z4Z9Y8Kg/HCsyAG1PLl8yInigHAZ/jz9ldpxqf9C1FQZdzNahIe2cx3t+g0xYQFeC6ZUttcV4Edk7xTcYYCfprbvyIHLhIAFnLJW6Cakpq66xUxhQUnxxkvnvuxQkWaOHxvOXKDEQ26osrV16h4MEuZYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732301771; c=relaxed/simple;
	bh=efxdvqjv1mBsbEP1O444JTul88aaO5eTGZBOhQ4/mLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lc+ueUSRAjdhVtfXW3M2Db6mzV9AFDBglw+q5NIhE2WKtZR1crrSoR8WXqD8jPaSTZjQ1EmfpLCk3XgHiRyRT6ADpM2QTTPZUDDS+3wBwWO6Iick20hBt9Wgac2oxegiWnAliumIMNG3NJZKwy8rQK2ND4+NqAliLmRVUh/JHdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgPsFSRm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgPsFSRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732301770; x=1763837770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efxdvqjv1mBsbEP1O444JTul88aaO5eTGZBOhQ4/mLs=;
  b=QgPsFSRmVsqTF6DUAydjVjCXq9hnrDSOO3sSLtoAAAOoPpQ/Rli4W7uW
   RSZF6VSwVZm4zZhmeZft1QE05biuuqn1+QKNYOyhv/ynyU1xFdyZXpyEU
   UmmG1/FiEeabnbI/eOg8L0IvLh2BdQnIqffvumelYJVzh+URizh4M+jLp
   kG4Z6k0eWT3X/0PyABGqBFpCgkehinNJ9+9P3TKkG2tGc1tt5YO5ut5y1
   ezADJrofZsKs6PdG2KWVAIKTMteBfkVowosRj0JnlYXrEn0vOLJIkLNbH
   BMAIYWi+XtRlaoN20WhhK9CmaTZIA0bGs7BlZFA+22pwot96sB2uIsHOh
   w==;
X-CSE-ConnectionGUID: QefwjoovTjCPVa0RZv7PwQ==
X-CSE-MsgGUID: mYOls0MxQCGZxASD3NjCFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36132182"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="36132182"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 10:56:05 -0800
X-CSE-ConnectionGUID: fiHwbi4kQwS2uj9iqQyYCg==
X-CSE-MsgGUID: cixo4cfSRU6qBr2Qu9DIjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="91458002"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2024 10:56:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEYoy-00048v-1F;
	Fri, 22 Nov 2024 18:56:00 +0000
Date: Sat, 23 Nov 2024 02:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 16/44]
 drivers/virt/gunyah/vm_mgr.c:173:21: error: call to undeclared function
 'module_refcount'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202411230241.JyM0GKtH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   750f274d5959541e9b06c3ec33be00380e94728d
commit: f3be66c6dc3c15949929f656944ec339cb5096e5 [16/44] FROMLIST: gunyah: vm_mgr: Add framework for VM Functions
config: arm64-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230241.JyM0GKtH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230241.JyM0GKtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230241.JyM0GKtH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virt/gunyah/vm_mgr.c:173:21: error: call to undeclared function 'module_refcount'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         WARN_ON(fn->mod && module_refcount(fn->mod));
         |                            ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/module_refcount +173 drivers/virt/gunyah/vm_mgr.c

   169	
   170	void gunyah_vm_function_unregister(struct gunyah_vm_function *fn)
   171	{
   172		/* Expecting unregister to only come when unloading a module */
 > 173		WARN_ON(fn->mod && module_refcount(fn->mod));
   174		xa_erase(&gunyah_vm_functions, fn->type);
   175	}
   176	EXPORT_SYMBOL_GPL(gunyah_vm_function_unregister);
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
