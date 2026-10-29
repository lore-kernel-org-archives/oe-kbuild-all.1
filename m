Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307638;
	b=N68hfurznnQBbRb1iPlpsQrJYpdpKgaH2dkbD4mnylL+XrwlN0UipyXrlyon+jxhkgJN
	 n+J7OBFd0zFxssvQFB+Lx0U//J//nqZ4R/1cVgWNmSrV9IFJPBRumnk+pNSYJP3Nekb4K
	 CeK3YOToDR++EmMpOBTb/zm192cuu/GEEvK5h+yZrxV4NkFSpYYgv4gxi7czGvHkMiI34
	 g9dgiNfI1rV1WUJWnFjnE7qY3xLKWMyB4RWK+y+5XwpfV+2owtqYNfNnXQ1oEt4UdUOR0
	 cNnYN9hz6LICrDAoqcorfCq2XjizXCeJpJYHfIpDS2bLq9+ZNe7ENOJiJT2VzqrFpaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307638;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EOySfBguRO8ltqJSI0hgsoE4NGR4VRAtkN4A95Rnees=;
	b=VaVNLoPIhaIyUvTz38cOxaLLvBzLsvkzDAZnK+p8ihE8U0K/G1iET2TDWN+DAroEKALm
	 9ktKawkNCBy8HF/Mm+rn/W8Yv9+OpOfgiUGIQS+YUXv/CEpP1V584l/mof0Y1VIR4At1U
	 ajH31AHCob4O0V0xfWasSrqDpAJxrjhWwaCuphhiy1z+zPuLTD4l9krNSCrBH5tmeOufR
	 IrjVSfCltBgZWugI1AI9AWtpZ4vtc3MPfpMzJRODdAs1tHVjwY2dVZY/Olhx7lMYZnhhd
	 KwHSfRSIgdkoMFhy+WhEzeEnw2dnD/rzpC+JK4ZMUh/gNK15zfgm3blSEsPo53K17og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j0ESnwIy;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19672606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 21:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19672606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j0ESnwIy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793307636; x=1824843636;
  h=date:from:to:cc:subject:message-id;
  bh=laJIFjsck36z2AAOGh8eCXlj54aFK2MT6jeBsE3urO0=;
  b=j0ESnwIyh0fn228lXKyHGdu5JsQwhoUc2BJUtKb2aOIFx6qb/4JG4Eh3
   4RwZGblErtDnzlcem21b2e2l9Yr04R5Ehg2n8TmMQYpYpzBN0/nhWSFEP
   ePD3UjcUHRiOXlitCmmIA/qns3u0bbJom3YLNjhqeZTZNTDWYuQm4q6wg
   XqVgtTBzCR1Sj1ixwhDqqqldgQcZd2M+iAgi3SrLlhcexqdrSMazCfhjm
   zOXZQftcMbPlJZ3v/e4AqRjo6Lpbr7hpf1gTklfnwcJrWhlofiwNDGhDR
   ZRnsYy1IhzWCfeMXUANtNxwFg7NNLgdpo0qSjpr8nGkw7PAHePtROsXt/
   Q==;
X-CSE-ConnectionGUID: Rz9SHm82Ts67IvlbUikvqw==
X-CSE-MsgGUID: A7xq+ffpShCbt0VcgTtu8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2057594"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2057594"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 14:00:36 -0700
X-CSE-ConnectionGUID: FseRzKKkQLSg9sSHl5hiyg==
X-CSE-MsgGUID: c/xc35jMSa6uwMEcrILgUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5273900"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2026 14:00:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMXEe-00000000awG-1daD;
	Thu, 29 Oct 2026 21:00:32 +0000
Date: Fri, 30 Oct 2026 04:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 3/3]
 arch/arm64/kvm/iommu.c:63:15: warning: no previous prototype for
 'kvm_get_iommu_id'
Message-ID: <202610300417.BjuO5J1b-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   7da6ff620cd4f55d97a6bce32fbce1aea0da6484
commit: 9d5e57d93b40eb389a4d67fc606dc62089e1cae6 [3/3] ANDROID: KVM: arm64: iommu: Add kernel wrapper for HOST_HVC PD
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261030/202610300417.BjuO5J1b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300417.BjuO5J1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300417.BjuO5J1b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/iommu.c:63:15: warning: no previous prototype for 'kvm_get_iommu_id' [-Wmissing-prototypes]
      63 | pkvm_handle_t kvm_get_iommu_id(struct device *dev)
         |               ^~~~~~~~~~~~~~~~


vim +/kvm_get_iommu_id +63 arch/arm64/kvm/iommu.c

    62	
  > 63	pkvm_handle_t kvm_get_iommu_id(struct device *dev)
    64	{
    65		return iommu_driver->get_iommu_id(dev);
    66	}
    67	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
