Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC7724418F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 23:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017771; cv=none; b=GM9O5+uW8Ucu7UEqm5Fwcmi1KsThDVOFmChLbOYNl95OG4CN0BRVBR8L3Ek9JAyi07iDy2uqLdFUrfBIX1MbCVJK0t5kB95A6chKNJj6SAwIps3z8f7C4CZ6mwoTOb6wcTlaQrGrMTzYhau+YDaPaNbGn3KAxPd334MLUOFWxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017771; c=relaxed/simple;
	bh=TA/7dEeJwchYzKgFym1Q+xasCWQHiGmfZNCPx98xUko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MW2ckb5DnNiqj8pFPcmjb9wFIPn/fHwQi553m+9801vDMThFH/2hAEKRs9bKe1VTg3lgrXBkb69DgTE568XWpI4AQaDOk8YCiA/O3brQOO8iovLMD2wzBrxSuyrD2/RGO0K4o+A5RlTs70Umvfhip/t848NCgH4E9c/o9Od18IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFtfsUR0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFtfsUR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745017769; x=1776553769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TA/7dEeJwchYzKgFym1Q+xasCWQHiGmfZNCPx98xUko=;
  b=cFtfsUR0ItSSs64EObsHFvaa6oNl4bb3MLZEedYK0Cda/G9CVfIpO5Rp
   tdVs4oNEtVKVo+THkG9qYAAYxPYl5y58rZ2vFnleNhTmmA5imQronL90S
   xfvB3EAWmZu1SHVUWbox6B1n+Fzy7liaA9vEbYgv4UAZ3Yz8Ta5P4SJM4
   EyU2yFGikgpDvTBZaiZcXZk7jL2a6Y0bhbBrSonZXl9n/ggfNgZ4xOnDb
   97pdSz76Zxyj36J7Mxuuqo4zGFNdIaQdStKn25yGkxXDJ1hlM85j1t3XM
   rNh+EHXnhlEIUGx3N333nzchJbghcNd1hed4oG8S0v5W89v74DZBl1FjY
   w==;
X-CSE-ConnectionGUID: yEfEq9PRT22oDskuwcVY/g==
X-CSE-MsgGUID: i+6xbZHXT0O+iPUJ1nzzUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="58020341"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="58020341"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 16:09:28 -0700
X-CSE-ConnectionGUID: Twip2IdEQQyjr5yFAI+Rvw==
X-CSE-MsgGUID: 1n/epqFtQ3Kaz3jlsAU8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="136097317"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Apr 2025 16:09:26 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5upl-0003Ph-2Y;
	Fri, 18 Apr 2025 23:09:21 +0000
Date: Sat, 19 Apr 2025 07:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype
 for function '__get_vcpu'
Message-ID: <202504190619.Y5BGziwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3614d7f3b2fd7f48d1810f3cd50a08419d96f7f1
commit: 41148bbeb73900a1fe8c5d7c64bbec5207d84c06 [1/1] ANDROID: KVM: arm64: iommu: Make allocation guest aware
config: arm64-randconfig-004-20250419 (https://download.01.org/0day-ci/archive/20250419/202504190619.Y5BGziwf-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190619.Y5BGziwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190619.Y5BGziwf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype for function '__get_vcpu' [-Wmissing-prototypes]
      77 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         |                       ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      77 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         | ^
         | static 
   1 warning generated.


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
