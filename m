Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D03E7647
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 19:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575197; cv=none; b=HpWoncoJrHgBmdSdKt7vSzs6LePtgChMTIidX3+0eYf5nw9jQCEq6i3Hfl+M5jwIHPx4FXZEat2VsmdfqagCL0CIHb1wwkEkUj5iOCtPblPLdoHYQVaRoR5D7vQAKcO2SsbuR7hOMqJyBtoV/giA8+DdfadGxjpeIpDS8HsjUbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575197; c=relaxed/simple;
	bh=m0cIFxvNl/PdQ9cN0knwYL2Mufx3XvaHJw3v9jIR+7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e5wfxQ7/83ej1Fcw6zNwmoE9bJIEYut83DAGNfFZuu2pXcPr1QKKd7lpP08cq5acw4rHlaZKAydSF4LaeVe9X3FN/EGlTlT1uUCSyu/se1wPBbtHqwoWeQ6VAE8NJXv5vyHpskEqHUdc1DwkWWKH1f6V8Tn9UuS2qsK53Qf0XgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVEzzsSr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVEzzsSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791575189; x=1823111189;
  h=date:from:to:cc:subject:message-id;
  bh=m0cIFxvNl/PdQ9cN0knwYL2Mufx3XvaHJw3v9jIR+7A=;
  b=AVEzzsSrwOO2cX0QTE6ohAq+uFXsEi03KuSn/rjZ2lL7lb15X4L+ZBef
   sjKCVcbh35WEewv35+fua5lrH4+TRi0x8Qg19MdQQrztLtP/h+Qs9qjAr
   yvj8JgZ8z7pvXZ8FESyrybaKKDrkDdMUVIcPOW8nKoKv5W2QSvi+qP7au
   x15itiXPsefg7NbY0U/catZZ0o+zacrzgnB891aeQT8rO21MPSOO6EN6K
   vuQuQuA0IqL0ytkdQ+Slphu7o23QyRAbYH3gmvj2pVSsBrX5blzpZPE0T
   Dj/iNYBkX9iMPn7TAbphTx8bnBTwfTfBCLxHgdCxk15UbliOQiH255+4i
   Q==;
X-CSE-ConnectionGUID: dXLE4Ml8Rj6y4cteyFw3qg==
X-CSE-MsgGUID: TCtqs6meQiWCYkzG3shg6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="374191"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="374191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 12:46:17 -0700
X-CSE-ConnectionGUID: S5Vzr+WYSB2mgiWiAJapTg==
X-CSE-MsgGUID: iWDpQ4tmS2GmVpxB+jzTvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="382150"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Oct 2026 12:46:15 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFGXl-000000007GB-0OUQ;
	Fri, 09 Oct 2026 19:46:13 +0000
Date: Fri, 09 Oct 2026 21:46:09 +0200
From: kernel test robot <lkp@intel.com>
To: Yu Zhang <zhangyu1@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>,
 Wei Liu <wei.liu@kernel.org>,
 Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
 Jacob Pan <jacob.pan@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [iommu:hyper-v 4/5]
 drivers/iommu/hyperv/hv-iommu-guest.c:25:21: sparse: sparse: symbol
 'hv_iommu_device' was not declared. Should it be static?
Message-ID: <202610092126.TuSXnTYR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git hyper-v
head:   87c5e5ae83492d951877eb5711dc03f2314d2695
commit: 2690d4156b51f7e9fe874dd480fc928594615552 [4/5] iommu/hyperv: Add para-virtualized IOMMU support for Hyper-V guest
config: x86_64-randconfig-r2301-20261009 (https://download.01.org/0day-ci/archive/20261009/202610092126.TuSXnTYR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610092126.TuSXnTYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610092126.TuSXnTYR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/hyperv/hv-iommu-guest.c:25:21: sparse: sparse: symbol 'hv_iommu_device' was not declared. Should it be static?

vim +/hv_iommu_device +25 drivers/iommu/hyperv/hv-iommu-guest.c

    24	
  > 25	struct hv_iommu_dev *hv_iommu_device;
    26	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
