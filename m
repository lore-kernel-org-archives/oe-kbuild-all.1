Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB8348C56
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 04:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780980380; cv=none; b=ko1ANOKcNu/HCy5RlDMo8UEgTVIWw4VaYHbiAw+WKqSl6UJLxuKJ4RjGqQUGYlSb6CTJkLypWKZ9KXnwOy9kQpw3BlpRvUH3xflepEiWQo2s8+aRdyXnSV6CzuO1zYD67pQzkCrOM/Ssb+83qKoINlAO+/zBOdqAXbdSFhZv3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780980380; c=relaxed/simple;
	bh=8z7e+9NCGPQZoj0N5Xg4C+kzh+FTTJQzHnxO2CV4MhY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ILL26hPSP/q8zAph6jqVyv0feWg9jC+H4v2NUSmJWnMzHC3gqjOm2tAMcBZurCZQX+AIdlE6CTSO1ItS7iFvUYYfGKn6Nal8dKEwptO4WdHhY2gE2BMl4EswtEPn4wCPDEkX4ovhmtuJMZpCFO+wqpCxJGIlzE+PZjgoCBMgxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqfgid/5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqfgid/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780980378; x=1812516378;
  h=date:from:to:cc:subject:message-id;
  bh=8z7e+9NCGPQZoj0N5Xg4C+kzh+FTTJQzHnxO2CV4MhY=;
  b=fqfgid/5Tq9VVDHdYwHnDVOu7/3CrVg9vVztiigzRGXMGoz5mGvk4apq
   X+uQ1i39JUuZOnELNNVqLtua0pxf/DlXqSvPUweYwtOF2bumRNW7wFgek
   H9d3DeQ54AM/hU2wNn5+Px/q9iCvBrmzVW/IDJmsZTbv0wKSSJp/lzoIe
   HNcpx18lvuZTVQj7YL8ohRx7eWEl4ORNMm7vAA/VH4VcMAQl2uctWZJBb
   ZNVPYarcQR36vEj6SKB4ZGdT2oik11F0gfBsj2oK/49+iCEJZkG6tdn91
   NMuiym9sBDZwkCr1jfFr07q8cfemlTJ16wO/Wme8gOLp8McuvS/DJ/fTk
   Q==;
X-CSE-ConnectionGUID: egxB/DCsQzayINeA8vfGvw==
X-CSE-MsgGUID: +fj365eGSDygKL2i9U4BbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="93220998"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="93220998"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 21:46:17 -0700
X-CSE-ConnectionGUID: 7tiKmc2YTuKbYcyg9iEQPA==
X-CSE-MsgGUID: BSQxyfP5QwCrGC1vMk6eFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="247617771"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2026 21:46:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWoLt-000000003Oz-1cgK;
	Tue, 09 Jun 2026 04:46:13 +0000
Date: Tue, 09 Jun 2026 06:45:24 +0200
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: [linux-next:master 10559/12096]
 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb:
 dma-controller@8400000 (nvidia,tegra264-gpcdma): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202606090602.UHcNu9dL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a87737435cfa134f9cdcc696ba3080759d04cf72
commit: cc6049bd3fa8501ee27042df469a19ed69cf406d [10559/12096] dt-bindings: dma: nvidia,tegra186-gpc-dma: Make reset optional
config: arm64-randconfig-2051-20260608 (https://download.01.org/0day-ci/archive/20260609/202606090602.UHcNu9dL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606090602.UHcNu9dL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606090602.UHcNu9dL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3557.15-3587.5: Warning (simple_bus_reg): /bus@8100000000/pci@c000000: simple-bus unit address format error, expected "d0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3893.15-3923.5: Warning (simple_bus_reg): /bus@a800000000/pci@8400000: simple-bus unit address format error, expected "a8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3925.15-3955.5: Warning (simple_bus_reg): /bus@a800000000/pci@8420000: simple-bus unit address format error, expected "b0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3957.15-3987.5: Warning (simple_bus_reg): /bus@a800000000/pci@8440000: simple-bus unit address format error, expected "b8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3989.15-4019.5: Warning (simple_bus_reg): /bus@a800000000/pci@8460000: simple-bus unit address format error, expected "c0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:4021.15-4051.5: Warning (simple_bus_reg): /bus@a800000000/pci@8480000: simple-bus unit address format error, expected "c8b0000000"
>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: dma-controller@8400000 (nvidia,tegra264-gpcdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra264-gpcdma', 'nvidia,tegra186-gpcdma'] is too long
   	'nvidia,tegra264-gpcdma' is not one of ['nvidia,tegra234-gpcdma', 'nvidia,tegra194-gpcdma']
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra186-gpc-dma.yaml
--
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3557.15-3587.5: Warning (simple_bus_reg): /bus@8100000000/pci@c000000: simple-bus unit address format error, expected "d0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3893.15-3923.5: Warning (simple_bus_reg): /bus@a800000000/pci@8400000: simple-bus unit address format error, expected "a8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3925.15-3955.5: Warning (simple_bus_reg): /bus@a800000000/pci@8420000: simple-bus unit address format error, expected "b0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3957.15-3987.5: Warning (simple_bus_reg): /bus@a800000000/pci@8440000: simple-bus unit address format error, expected "b8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3989.15-4019.5: Warning (simple_bus_reg): /bus@a800000000/pci@8460000: simple-bus unit address format error, expected "c0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:4021.15-4051.5: Warning (simple_bus_reg): /bus@a800000000/pci@8480000: simple-bus unit address format error, expected "c8b0000000"
>> arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dtb: dma-controller@8400000 (nvidia,tegra264-gpcdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra264-gpcdma', 'nvidia,tegra186-gpcdma'] is too long
   	'nvidia,tegra264-gpcdma' is not one of ['nvidia,tegra234-gpcdma', 'nvidia,tegra194-gpcdma']
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra186-gpc-dma.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
