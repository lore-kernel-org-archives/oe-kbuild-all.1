Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049AB10E5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739016653; cv=none; b=gcRF/ygrD4EbMgCV6c6jCLM7tvicYLGivxKAF1u+5/DAwPHMtVHrtsMrZM6ckD5awYB+Ydw20xg+92hWtX5ca2CtPyD3xgxsLf/vHCS/YhHYOnL0Ok0XDGfrDRRmJEW+MkPCujGeDtSJ0vZmprpnzveFIWEpVcys5RDBSwATyaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739016653; c=relaxed/simple;
	bh=ki82FshDGtm+FixwfZs1LZlYgPJjX5G1fwf1WGbxLwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GeTK+FQ9G3Io4WkrNHFdYrEWw3dCk5URy+wihtY8xWQh8Iodru0WsyLBsbueYWlwJrPw10YIAgdOTv+drsL4lLwy16LO+o8IjZFPJDU8KiZhZ/QsN9iQIxNHEGX8p3oae1oQjEOPDnMYhIqeMeXjsW9UHNMCQb1J5n56ODQg2Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpI8bDfs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpI8bDfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739016651; x=1770552651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ki82FshDGtm+FixwfZs1LZlYgPJjX5G1fwf1WGbxLwg=;
  b=fpI8bDfsZo3dXgTvL7SDZtHNJfKPydbb+qdwgJ6pHP3m2MVOMSVnoUI+
   YVs5lQaNoiW9JX3IpDT8hA3rvMZOpj1ib+rZkS9i5vVKzxsvud/rNpePF
   boLDB9Q8xurT92dyyDYZbnpt22COKkssIXNCRhbMWN+qC0TNwPRPmVF3y
   mYKmPjhJ97LqX5xUzxCaKcsEFED1JNUSBWoFkLo75ftF1eYf/Z0pfNmjJ
   +X8LTyIuaSJT/X86wbjFGK2fyDz1EGJg6UNkaWVyRJR/PeajLkTFyzaLq
   +Wit6ZKgLcTR3b+ZL5JxWTXosy4dEDYVuOyRX+SDOxn7NoPhSlIHwEbEW
   A==;
X-CSE-ConnectionGUID: lgPrAjGcQV+Ong5ff/nXrA==
X-CSE-MsgGUID: O46BgNK/RRW7c541Ge3u2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="57070803"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="57070803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:10:50 -0800
X-CSE-ConnectionGUID: 7+5doYy+QC2oTKAhI+ETHA==
X-CSE-MsgGUID: wwUjErBASQaU/nRZqh/RyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="116770917"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2025 04:10:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgjfa-000zwA-3D;
	Sat, 08 Feb 2025 12:10:46 +0000
Date: Sat, 8 Feb 2025 20:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb:
 /reserved-memory/apu-reserve-memory@95000000: failed to match any schema
 with compatible: ['mediatek,apu-resv-mem']
Message-ID: <202502082058.XUPaIeZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: eedd3dc85418bed76f97e53a19c649187456e91a [211/211] CHROMIUM: arm64: dts: mt8196: Add device nodes for APU
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/archive/20250208/202502082058.XUPaIeZF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082058.XUPaIeZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082058.XUPaIeZF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /firmware/mtk-svp-heap: failed to match any schema with compatible: ['mediatek,secure-heap']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: scmi: 'protocol@80' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/adsp-mem-region@90000000: failed to match any schema with compatible: ['mediatek,adsp-reserved-memory']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/apu-reserve-memory@95000000: failed to match any schema with compatible: ['mediatek,apu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/gpueb-reserved-memory@a0000000: failed to match any schema with compatible: ['mediatek,gpueb-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu-qos@13f800: failed to match any schema with compatible: ['mediatek,gpu-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: cm-mgr@c100000: required-opps: [[40], [41], [42], [43], [44], [45], [46], [47], [48], [49]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@180f3000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000: failed to match any schema with compatible: ['mediatek,mt8196-apusys_rv']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-ctrl: failed to match any schema with compatible: ['mediatek,apu-ctrl-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-top-rpmsg: failed to match any schema with compatible: ['mediatek,aputop-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-mdw-rpmsg: failed to match any schema with compatible: ['mediatek,apu-mdw-rpmsg-v5']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-apummu: failed to match any schema with compatible: ['mediatek,apu-apummu-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-apummu-rx: failed to match any schema with compatible: ['mediatek,apu-apummu-rx']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-edma: failed to match any schema with compatible: ['mediatek,apu-edma-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/edma-rx: failed to match any schema with compatible: ['mediatek,edma-rx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-mnoc: failed to match any schema with compatible: ['mediatek,apu-mnoc-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/mdla-tx-rpmsg: failed to match any schema with compatible: ['mediatek,mdla-tx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/mdla-rx-rpmsg: failed to match any schema with compatible: ['mediatek,mdla-rx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/mvpu-tx-rpmsg: failed to match any schema with compatible: ['mediatek,mvpu-tx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/mvpu-rx-rpmsg: failed to match any schema with compatible: ['mediatek,mvpu-rx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/aps-tx-rpmsg: failed to match any schema with compatible: ['mediatek,aps-tx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/aps-rx-rpmsg: failed to match any schema with compatible: ['mediatek,aps-rx-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/sapu-lock-rpmsg: failed to match any schema with compatible: ['mediatek,apu-lock-rv-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-scp-mdw-rpmsg: failed to match any schema with compatible: ['mediatek,apu-scp-mdw-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-scp-np-recover-rpmsg: failed to match any schema with compatible: ['mediatek,apu-scp-np-recover-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/remoteproc@19001000/apu-ipi-ut-rpmsg: failed to match any schema with compatible: ['mediatek,apu-ipi-ut-rpmsg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: opp-table-apu: Unevaluated properties are not allowed ('opp@1115000000', 'opp@1300000000', 'opp@1450000000', 'opp@1600000000', 'opp@1800000000', 'opp@385000000', 'opp@457500000', 'opp@530000000', 'opp@630000000', 'opp@730000000', 'opp@930000000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: power-controller@19020000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@19020000: failed to match any schema with compatible: ['mt8196,apu-top-3']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/logger@19024000: failed to match any schema with compatible: ['mediatek,apusys-hw-logger']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/adsp@1a000000: failed to match any schema with compatible: ['mediatek,mt8196-dsp']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@1a019000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1a110000: failed to match any schema with compatible: ['mediatek,mt8196-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mt8196-afe-pcm@1a110000: failed to match any schema with compatible: ['mediatek,mt8196-sound']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mailbox@1a350000: compatible:0: 'mediatek,mt8196-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mailbox@1a350000: compatible: ['mediatek,mt8196-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mailbox@1a350000: failed to match any schema with compatible: ['mediatek,mt8196-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mailbox@1a360000: compatible:0: 'mediatek,mt8196-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/ghpm@4b800000: failed to match any schema with compatible: ['mediatek,ghpm']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b890000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b8b0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: 'smmu-mediatek-parents' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/apusys-apummu: failed to match any schema with compatible: ['mediatek,rv-apummu-mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mtk-apu-mem-code: compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mtk-apu-mem-data: compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mvpu: compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-mt6681-sound']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
