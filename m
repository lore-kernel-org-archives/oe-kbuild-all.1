Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B1417993
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752336059; cv=none; b=GkjZjkr3Vq0M9arqDtgVY+3YBw4XQuHVnKKtNNFp1G5tPTJ+cMl6DTCgFKhR2heZzEYjtFF37sVamhjn732vTmJw9BZictRrx6MGawFtzx8Lr0A+IwdVFHhYPDwQTnN5rsNYfeg73bD/sYeEaIx98WMjawIvyWh0XyKCsALCp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752336059; c=relaxed/simple;
	bh=PTfIFrzlNVikfRZaUpgZZsxIRLTlWbp92/2EjMxxyQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1zF8pq35ZAlQkR3r3+ikUvxqeGDQSIRfRUKp2NFuY3X9IHDDLXXWo3vLmL9+fA98TsQS13Qomn9wpemPcVLO6xTs/aXu5CgcoRXZU76JUGO7GkE5PoJcGj8OdBYHOxSVizqQssXuggub8cmKBMy8H05RX33e9HswYrY9KGcTkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGC/U8et; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGC/U8et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752336057; x=1783872057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PTfIFrzlNVikfRZaUpgZZsxIRLTlWbp92/2EjMxxyQM=;
  b=YGC/U8et1/aqs4vwxxbBMAbBSLwu7OtdXAiQtlU5f6pzIcr24iC4j4nX
   LFkm6raxqanZbAi8BtXgFROLdkH2SaJGUtlZrjgBsE5GNviC4MAyMQAR3
   IEcAU5RrhVybsNzW6czekDzxWNXcrZ/+ym059VTDkQ8gMCTuYP29Gh6SE
   N9yEHWEnMKWfHQRttjp/WWUGdLwrlobeFmwntdbTTuKhbABnoKEobYfLZ
   lXTeBkSHyDMiWmQuuuxsJcZqpw0Xf94t/ATaUkyMxhiKOyHunnCPzuqov
   Jrtv70iKy1WvmR53vDWLdtL0OpZC/cvFwi8NE40YTDbKFYQ+g1F0aUdrv
   A==;
X-CSE-ConnectionGUID: QOFF3AVFQUK/0JLEHf+yzA==
X-CSE-MsgGUID: 4iyj7gsfSj2Uh5paMtFe6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77140591"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="77140591"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 09:00:56 -0700
X-CSE-ConnectionGUID: KQdG0G42RhS0ggPtACXJKg==
X-CSE-MsgGUID: Kfj6PY4vT7i1zfkej+NWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="160897749"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jul 2025 09:00:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uacej-0007Rr-0J;
	Sat, 12 Jul 2025 16:00:53 +0000
Date: Sun, 13 Jul 2025 00:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pcie_switch_groups 18/19] iommu.c:undefined reference to
 `pci_for_each_dma_alias'
Message-ID: <202507122348.gmNmZZUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   e9f6d88c9b258a2ecf13633161b4f4c85723b420
commit: 7019fa4f10acf85b0847c6d2890777c099bb5453 [18/19] debug prints 2
config: sh-randconfig-002-20250712 (https://download.01.org/0day-ci/archive/20250712/202507122348.gmNmZZUQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507122348.gmNmZZUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507122348.gmNmZZUQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/iommu/iommu.o: in function `pci_device_group':
>> iommu.c:(.text.unlikely+0x140): undefined reference to `pci_for_each_dma_alias'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
