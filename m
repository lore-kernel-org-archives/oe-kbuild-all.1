Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6042F43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742576909; cv=none; b=jiaMAjVQIJtzZpafP3LtcGnICPeMfl3AvscpUo5TAJawVgV/SCposHsBFLfnfKcFzJrBD7FT3Ek0LpRLnlxqKC1sO7fWvPqQjfMwyUbkZWUfrx9Ew7daUxz+8eoLdIjnNEchJ4+OWjpG36GaMyCbncmq7Nuf7L7Q4DcUkFmm2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742576909; c=relaxed/simple;
	bh=ff1vtFQmwJFSBThUgGaVAUQTo/aZU8cpQXdlTxuWQxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cGgkne76SQh5i1cCnQWkrvqoqBYYaMlnA71E8oaGbv9R/818DbRU6jhP4ccT5BTGoccUJ/ttIXj3uPEjdCtBhoLzjdagCqe1TThM1Vyg0nMgAQNdBVkU2NigVVrPZ0sU3OrDWcm12B7SpK1OMD0GQTwckcwLF9PtqTFqFazsFF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgBVceNs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgBVceNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742576905; x=1774112905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ff1vtFQmwJFSBThUgGaVAUQTo/aZU8cpQXdlTxuWQxE=;
  b=WgBVceNsSraQd7vlISV105pMxrvciOYEeRVmUR0Iwr3MNba+idw4XP9o
   GX+SXpMwidC6NUS1AxaSPNfJl/pfIVAhPkZPvE+mNbBWBixDTpp4K4cLV
   /n8XI1X2E2WmHqe75K3y+nZT8IEo50trmAnOL534DX5UNNMjq6bgjOhBi
   5cjv/f9g8tK73fixp+ZsROLmM9PMNQ4+4ra0NOuUxyD06TGNndw5SxZbP
   kfeA9ep4kWGxsKFmEwqFAr3bY70ujqjU7JTu9DR1me+22sJcx1H6I6f5h
   E1xtjV1tSZUQR0M1/iC/3iulMapgVHNQJ/COm/BEMczClmKuihqgxdqBj
   Q==;
X-CSE-ConnectionGUID: 2CLfMSxMSO2Xu7zW/mAoZw==
X-CSE-MsgGUID: bA2bud8sRYSpOn/Rfi940A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54064650"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="54064650"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 10:08:22 -0700
X-CSE-ConnectionGUID: c/mcqXFWQ4a/QLib/2b3sw==
X-CSE-MsgGUID: KEWJQbPUQsOCLBhuc+i1xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123257942"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Mar 2025 10:08:20 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvfqz-0001Wl-23;
	Fri, 21 Mar 2025 17:08:17 +0000
Date: Sat, 22 Mar 2025 01:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 24/24]
 drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for
 function 'gunyah_generic_vm_start_fail'
Message-ID: <202503220156.P5xBR1pG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fb42336fc7a1e10a24fa1bab0f58b716dec031e6
commit: 67d7d75278b34154c001ddfb435beae6bf2cd315 [24/24] ANDROID: gunyah: vm_mgr: Use auth_mgr_ops for a generic VM setup
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250322/202503220156.P5xBR1pG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220156.P5xBR1pG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220156.P5xBR1pG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for function 'gunyah_generic_vm_start_fail' [-Wmissing-prototypes]
     117 | void gunyah_generic_vm_start_fail(struct gunyah_vm *ghvm)
         |      ^
   drivers/virt/gunyah/vm_mgr.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | void gunyah_generic_vm_start_fail(struct gunyah_vm *ghvm)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/gunyah_generic_vm_start_fail +117 drivers/virt/gunyah/vm_mgr.c

   116	
 > 117	void gunyah_generic_vm_start_fail(struct gunyah_vm *ghvm)
   118	{
   119		/**
   120		 * need to rollback parcel_to_paged because RM is still
   121		 * tracking the parcel
   122		 */
   123		gunyah_vm_mm_erase_range(ghvm,
   124			ghvm->config_image.parcel.start,
   125			ghvm->config_image.parcel.pages);
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
