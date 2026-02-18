Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D3344DA7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 17:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771436407; cv=none; b=i/DKq9O1EDVKv7S3H+BtQKv2+/mu9fTf82H6fW/3ZU8G4El0a+ouninfdTolJ5L0kOVmSlZ9PmlEad1JWMgJrIPAN9h1BxKmOcaVw/zEoTcl87lbYK+vwHnaiKYmIZrD+j6jf9Yxp7knLvHj6FKwlwoRzUMnU309eqeJJ1mlkwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771436407; c=relaxed/simple;
	bh=J3fdovcl5xtRihItvrYLp65jBxuEyvykf2Yh5saczsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lft9bqdNuh5e8mm55otWhkMsf0UoEqGAUiDc/17YxLv/rt442dcHHxncXuz7ne22amXki7K46hZVsIGI6/R51MasT7Q3doWPoKAVwlSW5lRQW4ZXswTVUNbg8uUAt+FerQglTDDG44TYuvWAuVm+BhdaKJILSIwO3X4yLvcHJQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9a8TkXX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9a8TkXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771436406; x=1802972406;
  h=date:from:to:cc:subject:message-id;
  bh=J3fdovcl5xtRihItvrYLp65jBxuEyvykf2Yh5saczsE=;
  b=M9a8TkXXHCQnvB4/FJKtN+7FAWoLdfZunTCj5uhrfqovKowuV2X1lUcT
   FIrTN8m+wdIt2R76I8mFkQQuxCaqbhrHL40jZeSD9zUDjX4vkg1TEXoCQ
   8jrWD00oSeTx+ix8zyAazOKPp7jseuLqGfNnWNjf/1jbUKKgTeAoUqlNh
   dXPA/VkRwVimTsSj8jBqIrloZO6X6CAwyzm5OLx+sKzJwn/pm9XBo1I/z
   FvoonqbHS0ByEMG14IhhcWgM/MngsojwVegxOFECAy/kek0J5ND0WKO07
   i9Nad6eaHZre5OvmFwbolneHFf7SHP0yco5gGNliPPQ/v+/nu0lOkgrmN
   g==;
X-CSE-ConnectionGUID: brj0egzEQ5ewKJID5qEdgA==
X-CSE-MsgGUID: FjxNSkPiTuiDBY55iIsH8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="90102689"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="90102689"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 09:40:03 -0800
X-CSE-ConnectionGUID: dNQdBRzKRcyjHRk/DDDN9w==
X-CSE-MsgGUID: 1vHy64OOSD2ziJdw6hJkhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="213015948"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Feb 2026 09:40:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vslWq-000000012aO-01Ga;
	Wed, 18 Feb 2026 17:40:00 +0000
Date: Thu, 19 Feb 2026 01:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 drivers/vfio/vfio_main.c:436:9: warning: variable 'fn' set but not used
Message-ID: <202602190132.g7HIpQVV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   aaa1bf8bd54bdc7c0e7c525db0155d118cf49387
commit: e43f03eb172d7e8ecac55bc3f9547c18f436ea82 [7/7] ANDROID: drivers/vfio: Call KVM directly
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602190132.g7HIpQVV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190132.g7HIpQVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190132.g7HIpQVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/vfio_main.c:436:9: warning: variable 'fn' set but not used [-Wunused-but-set-variable]
     436 |         bool (*fn)(struct kvm *kvm);
         |                ^
>> drivers/vfio/vfio_main.c:437:7: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     437 |         bool ret;
         |              ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/fn +436 drivers/vfio/vfio_main.c

0bfc6a4ea63c2a drivers/vfio/vfio.c      Jason Gunthorpe 2021-03-30  431  
09e33b04552608 drivers/vfio/vfio_main.c Paolo Bonzini   2024-01-04  432  #if IS_ENABLED(CONFIG_KVM)
5c6de3ea73768d drivers/vfio/vfio_main.c Yi Liu          2023-07-18  433  void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  434  {
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  435  	void (*pfn)(struct kvm *kvm);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03 @436  	bool (*fn)(struct kvm *kvm);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03 @437  	bool ret;
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  438  
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  439  	lockdep_assert_held(&device->dev_set->lock);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  440  
5c6de3ea73768d drivers/vfio/vfio_main.c Yi Liu          2023-07-18  441  	if (!kvm)
5c6de3ea73768d drivers/vfio/vfio_main.c Yi Liu          2023-07-18  442  		return;
5c6de3ea73768d drivers/vfio/vfio_main.c Yi Liu          2023-07-18  443  
e43f03eb172d7e drivers/vfio/vfio_main.c Mostafa Saleh   2026-02-03  444  	/* See kvm_vfio_file_set_kvm() */
e43f03eb172d7e drivers/vfio/vfio_main.c Mostafa Saleh   2026-02-03  445  #if IS_BUILTIN(CONFIG_KVM)
e43f03eb172d7e drivers/vfio/vfio_main.c Mostafa Saleh   2026-02-03  446  	ret = kvm_get_kvm_safe(kvm);
e43f03eb172d7e drivers/vfio/vfio_main.c Mostafa Saleh   2026-02-03  447  	pfn = kvm_put_kvm;
e43f03eb172d7e drivers/vfio/vfio_main.c Mostafa Saleh   2026-02-03  448  	/* silence compiler warning */
e43f03eb172d7e drivers/vfio/vfio_main.c Mostafa Saleh   2026-02-03  449  	fn = NULL;
e43f03eb172d7e drivers/vfio/vfio_main.c Mostafa Saleh   2026-02-03  450  #else
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  451  	pfn = symbol_get(kvm_put_kvm);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  452  	if (WARN_ON(!pfn))
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  453  		return;
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  454  
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  455  	fn = symbol_get(kvm_get_kvm_safe);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  456  	if (WARN_ON(!fn)) {
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  457  		symbol_put(kvm_put_kvm);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  458  		return;
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  459  	}
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  460  
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  461  	ret = fn(kvm);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  462  	symbol_put(kvm_get_kvm_safe);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  463  	if (!ret) {
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  464  		symbol_put(kvm_put_kvm);
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  465  		return;
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  466  	}
e43f03eb172d7e drivers/vfio/vfio_main.c Mostafa Saleh   2026-02-03  467  #endif
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  468  
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  469  	device->put_kvm = pfn;
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  470  	device->kvm = kvm;
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  471  }
2b48f52f2bff8e drivers/vfio/vfio_main.c Matthew Rosato  2023-02-03  472  

:::::: The code at line 436 was first introduced by commit
:::::: 2b48f52f2bff8e8926165983f3a3d7b89b33de08 vfio: fix deadlock between group lock and kvm lock

:::::: TO: Matthew Rosato <mjrosato@linux.ibm.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
