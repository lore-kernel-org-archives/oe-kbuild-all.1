Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3CC3DFC8A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 18:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897176; cv=none; b=kCn/rYM9NJ1ubbikzG8PbeKIG2bLaWrp9180MFDy9bbImdbq4xiefAdkP4GXP0APJQc3tjtn/by9qiZYmCkn+D4DRzueEi4dv4nzZMp+zRdPam7GLe8aE0SSoXy5bqCFnNuEy0feJCwFaNF76+cB1hY6niwGTZiDXcQXnBcHoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897176; c=relaxed/simple;
	bh=fQT4UbLwDRQsDUYeDCTO65ULwx4QBxH8Vqw2/livMLY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R6rUPHxjrBYBinn4owJ4sDmQaMoZgOswt50QWGNuOW5AW7ZP/jd3uoMCAwtNMA0tz3vLyKQw/eJe5Zgiu7OZAJ7CmveCBoSM9LwOnTQZYBP+ESAzUe5DjL3HywLBoDlrWx5uHMDhQ7QfKVqJ2VXuz/Uc3NuQ7RQrq5EFoXKf6q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OaKHYQ3u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaKHYQ3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774897175; x=1806433175;
  h=date:from:to:cc:subject:message-id;
  bh=fQT4UbLwDRQsDUYeDCTO65ULwx4QBxH8Vqw2/livMLY=;
  b=OaKHYQ3ueoVRfy9Wcti25/9cjaTO9I0Eu2dQ5LKXnOl/sjH8W/AJ8v32
   j0JsKTu6LIXBmAnmlMocq8zhxc/9Z6veS7oblKT0rKKCaglNEvlk7aSFe
   jxT/lO82GIez3+dSsw1dT6OIppzn7SAwtmEA+xVk5C+BXUQW6zAedQObg
   hm6Zj8A0ynUfqkhqI8sRsrXryDOjq6I/6Not8vL+TSOJVxcYMW2sIeMRi
   WFZAB+QVlfzLNTz38o7GdD3/XVH3oDJPCBXFGjVQHVe9fKv3F4vDyGXZS
   TtjeKQARb7Gr//FmPy0YoIpH9NiN+5RHxFmAOjcs97Map9yramCD+WbIX
   g==;
X-CSE-ConnectionGUID: Og5+V2P1QVOSZlsAoa9fSg==
X-CSE-MsgGUID: yHuIJDpHQBKzZv3SjAckAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87292663"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="87292663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 11:59:34 -0700
X-CSE-ConnectionGUID: qQqhKgikRz+kh5CkBNoFQg==
X-CSE-MsgGUID: 5jqkLLNTRnex5APa+bxKsg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 11:59:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Hpj-000000001Wf-1SvU;
	Mon, 30 Mar 2026 18:59:31 +0000
Date: Tue, 31 Mar 2026 02:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 5/5]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype
 for function '__get_vcpu'
Message-ID: <202603310244.khPDNg15-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 41148bbeb73900a1fe8c5d7c64bbec5207d84c06 [5/5] ANDROID: KVM: arm64: iommu: Make allocation guest aware
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603310244.khPDNg15-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310244.khPDNg15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310244.khPDNg15-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype for function '__get_vcpu' [-Wmissing-prototypes]
      77 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         |                       ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      77 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__get_vcpu +77 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    75	
    76	/* Return current vcpu or NULL for host. */
  > 77	struct pkvm_hyp_vcpu *__get_vcpu(void)
    78	{
    79		struct kvm_vcpu *vcpu = this_cpu_ptr(&kvm_host_data)->host_ctxt.__hyp_running_vcpu;
    80	
    81		if (vcpu)
    82			return container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
    83		return NULL;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
