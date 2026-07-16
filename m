Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584B73FBEC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197869; cv=none; b=aVHxvlHpbAlEhpCEth7b9vNG6AMY5/J3G2wuo2tm98VuBFRi0KN7ElrNXdhc6R8DwQVm/aZvouq7TvOEp0ANbEpkIQAepRKjCO/LWDsOnk3TtEVXBs2ZYsY9yhypl6+6ZMAeb0JY5ZCob+FjJorbj2SAdHf7E2v2whXxBWK9IEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197869; c=relaxed/simple;
	bh=laFEu9lEozlJA1m3vDHWH5ULO3Zr8mz/eZEl0zwOvFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JGmWj3Z4xYFhnqd8bWOFpCOeFaWWNHDayUmk5fCEo2m5Ety8DRKJrQoqbzPVp9YDnvssAGdayfYSkwwziWDl8E8Tlj+tU0ti4MNaVr+uvW4415OL8VHzENRLOoxNN9Na+9OYQonupGW54q0RW8y2Gs4yPKzkOFrNhjicuJk9giI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcC3Vtfr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcC3Vtfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784197868; x=1815733868;
  h=date:from:to:cc:subject:message-id;
  bh=laFEu9lEozlJA1m3vDHWH5ULO3Zr8mz/eZEl0zwOvFY=;
  b=FcC3VtfrcUJSSl1+OEl4bV0v6yHBRfR7BQlVx+nqeu7Yrr75NB6ye5HS
   dwwwu/8B44UchCZVkMVYPkJcOW1ECh0SZURGHnLD4ShRUp7/92QlnA4U8
   TQy6oa8L3xg1Pz278XrMzeDBbKvH6xg+zoiqRWtTJmj4/B3gxcQREWg/I
   VN1A41Nf/ol4OnbdU0H7bCvDpcr2r/9QlhfwzzLoytRJlZP6MEsLmeCpw
   2RVONNsOHzvzGdWOeyUSragTOm2TKadMZnMO7prXE0D3f1zInhh5VanVU
   9gWHrgYHGg/B2lXbV+FXmowFaEDUpsA73sQrh5M+kd42qSqABt/a3TkPr
   Q==;
X-CSE-ConnectionGUID: rVy6HBMNR823/2i34ErFWA==
X-CSE-MsgGUID: rlfyfinURIqjaah24lCJXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88530029"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88530029"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 03:31:08 -0700
X-CSE-ConnectionGUID: 8BcN2RxRRzydLqQMhkxNUQ==
X-CSE-MsgGUID: L0yHl4DkRiGmjvmdLrHKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255941362"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Jul 2026 03:31:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkJMq-00000000Ogd-0Znw;
	Thu, 16 Jul 2026 10:31:01 +0000
Date: Thu, 16 Jul 2026 18:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype
 for '__get_vcpu'
Message-ID: <202607161813.HBiuznQA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c6f9cfff7e5303d62cede4879db0c6a80745aefb
commit: 41148bbeb73900a1fe8c5d7c64bbec5207d84c06 [12/12] ANDROID: KVM: arm64: iommu: Make allocation guest aware
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260716/202607161813.HBiuznQA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161813.HBiuznQA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161813.HBiuznQA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype for '__get_vcpu' [-Wmissing-prototypes]
      77 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         |                       ^~~~~~~~~~


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
