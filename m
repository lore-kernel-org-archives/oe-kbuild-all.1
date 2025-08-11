Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8752E0B5A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 21:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754948202; cv=none; b=iSbR/WyNpffOtdqjkekWEQehAMHBnrAdjhD9ExVnthYxHd+rAgugru8ApRaCtDCFxeM5OwaWqUQjQhdz7gLg4ZaNFCtiKRCJnepXfj2N3QMG/beFIJmBsGxeE5ZPE02TMKtV+aeXb+kCGJjQf5hUXVfDnuwkLOQvlH/I3RLj93I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754948202; c=relaxed/simple;
	bh=ybJKTQOsEONkjT/RYrha5b53NKLmJtENv6zVGWIDDV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hdd1UUffDWI9Kw+IjERgVBVIVnBYnuJjOfxPI65QhwuiAojd/l8/ah4W1x7aDGOVSvm2/DWDy4wbQ7EmFdeQPO9z/r9PQYDCO2FH9GpgHO2WOl9IQ+FCxW4YMFvdlTEga8bxjR6CoRJrZB8eK5PL5Lc11BXKhvIR33Qve/VOFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RypnuFiD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RypnuFiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754948201; x=1786484201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ybJKTQOsEONkjT/RYrha5b53NKLmJtENv6zVGWIDDV4=;
  b=RypnuFiD4M0y1I6Pw04KQAVS9OYG/9ThiIWk7xSZa0W9TCTkTC6jRQFa
   JnPVbz5pnKWdF3/w5u8hll5C2JsqkI4uAfYs4u1TjVNvhvgyDEKL1UXxb
   /Yd6L6bM13OSoB2j7CbksDk6dQ0v5Glkh0CSFD+OjjMIuFCrOBBX/DoM9
   HvjgoIgiYyGD9c9Es7F/uc9NU4QAXs8rf8ilSSzA44NXS6rI/+z043lhA
   7Rlo8W6M99/VpF23436yRm2UBpAlpzBU7gc6HKvahMWTMJubtaNAwEXcC
   BF6rBggHnTc0E2Yn31KSKyE7/AG3C9Z5KzC2QWuc8GzSKS9kRDFeqkzfw
   Q==;
X-CSE-ConnectionGUID: k2l1u3gPSFqbwaW+9ouY/A==
X-CSE-MsgGUID: 9yqAtyPTT4CZChrcH4Ms9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56239208"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56239208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 14:36:40 -0700
X-CSE-ConnectionGUID: y5Lfva4JRGuxFTF4pYBeww==
X-CSE-MsgGUID: 0+4Zi+iiR4ub9DXoKLGeVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166376617"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Aug 2025 14:36:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulaBW-0006F0-3C;
	Mon, 11 Aug 2025 21:36:15 +0000
Date: Tue, 12 Aug 2025 05:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2667/2667] arch/arm64/kvm/arm.c:569:5: warning:
 no previous prototype for 'kvm_arch_rec_init'
Message-ID: <202508120550.HjIMCdCV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5185c1b0fd7a9b3ea9b6923d5bcedc7392c59b7
commit: fa36fa3469d2461c1887e823371059401941ae8a [2667/2667] CCA: Fix cca kabi conflict
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250812/202508120550.HjIMCdCV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120550.HjIMCdCV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120550.HjIMCdCV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:569:5: warning: no previous prototype for 'kvm_arch_rec_init' [-Wmissing-prototypes]
     569 | int kvm_arch_rec_init(struct kvm_vcpu_arch *vcpu_arch)
         |     ^~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/arm.c:52:
   arch/arm64/kvm/hisilicon/hisi_virt.h:116:13: warning: 'hisi_ipiv_enable_per_vm' defined but not used [-Wunused-function]
     116 | static void hisi_ipiv_enable_per_vm(struct kvm_vcpu *vcpu) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hisilicon/hisi_virt.h:112:13: warning: 'hisi_ipiv_supported_per_vm' defined but not used [-Wunused-function]
     112 | static bool hisi_ipiv_supported_per_vm(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_arch_rec_init +569 arch/arm64/kvm/arm.c

   568	
 > 569	int kvm_arch_rec_init(struct kvm_vcpu_arch *vcpu_arch)
   570	{
   571		struct realm_rec *rec;
   572	
   573		rec = kzalloc(sizeof(struct realm_rec), GFP_KERNEL_ACCOUNT);
   574		if (!rec)
   575			return -ENOMEM;
   576		rec->mpidr = INVALID_HWID;
   577		vcpu_arch->rec = rec;
   578		return 0;
   579	}
   580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
