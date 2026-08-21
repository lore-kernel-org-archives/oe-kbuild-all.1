Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44EA30D407
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330750; cv=none; b=fGFiwMO7JMOn6en55FJl4wbz4wO2tfLCa0WLxaE2cElAm/BtgKgnHwsvRvH9Nvyxb1cGgSPZdYOnahVmH7vNkJuH4y3aBzJ26av645mA+kGk2BfbodYGeGBU/WacmAinJ1Nn43l/odoP05JkcRVpbugoSyfvPQ11OfMj4uRGet8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330750; c=relaxed/simple;
	bh=rgwh4nEo3oYXgD1TykgEWGR+FP3P8nUJyOMwzDeFdYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eaFezkC7L3xBTQjpZIdrebLHgX84wdxkGyseqMtGn18NfhWfdmbCj7oLW/uLKf0u1K6v/2Qy2SwECfm1WCyCPbVQMgbhQc2WYxrxso1+BM49zAF0BKYcY9oF/NDaaneJru3ZaLEc3wvIqi1L799HJeiLE7cO7AgUIlnXtbMgy9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjYP4Uio; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjYP4Uio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787330747; x=1818866747;
  h=date:from:to:cc:subject:message-id;
  bh=rgwh4nEo3oYXgD1TykgEWGR+FP3P8nUJyOMwzDeFdYE=;
  b=HjYP4UioT3hmNgm2wGFntTiEdWOb+Ou0mazBs9DoqBBF/RlCnztZsdH1
   cZXZx6+LjSCee3FadohVaOnpqLgiCpidJXEk6JIyGhYS8SAslFGaLU0PZ
   cj3zqDfv/ump/4WmTqneT2dQEnFvplo6RRbGE5xWuPtls7hRMYVOT79vB
   otCSCWqGmSrL7Uz5kAfV36vZKoorU6CLMZghrAOO3PoO4lhAs0om9izup
   VJp3GwV0ULicACqh22WHTno/vJJfDAuVE6FTvqKJWk0MgmI6HxmK3L1CX
   C4Opfc7Ze2UVcshUc5JDJ/+oRFkcPWpoZwLJ6vOU/tZRBUZhWevdpoQNe
   w==;
X-CSE-ConnectionGUID: j3rqMXpqTYqculiG9Yg1tA==
X-CSE-MsgGUID: E5boj/TjTw2lLosoBXGk9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="88086868"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="88086868"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:45:45 -0700
X-CSE-ConnectionGUID: G1bq5Gj9RaGoZA0I7Qd6vQ==
X-CSE-MsgGUID: RHg7eAJ+QlWUI7zrQQEjAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="304591367"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 09:45:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxSNA-000000007iT-48Re;
	Fri, 21 Aug 2026 16:45:40 +0000
Date: Fri, 21 Aug 2026 18:45:22 +0200
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Helgaas <helgaas@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 16040/16703]
 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: pci@c000000
 (nvidia,tegra264-pcie): 'oneOf' conditional failed, one must be fixed:
Message-ID: <202608211844.7CpmsPWY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7079a12d7506b07fb53b54a664bfad5fa9b16d70
commit: d86c91afe28b4666b6d8dd86c25d25235f88eebc [16040/16703] dt-bindings: PCI: tegra264: Strictly distinguish C0 from C1-C5
config: arm64-randconfig-2051-20260820 (https://download.01.org/0day-ci/archive/20260821/202608211844.7CpmsPWY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211844.7CpmsPWY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211844.7CpmsPWY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3513.15-3543.5: Warning (simple_bus_reg): /bus@8100000000/pci@c000000: simple-bus unit address format error, expected "d0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3893.15-3923.5: Warning (simple_bus_reg): /bus@a800000000/pci@8400000: simple-bus unit address format error, expected "a8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3925.15-3955.5: Warning (simple_bus_reg): /bus@a800000000/pci@8420000: simple-bus unit address format error, expected "b0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3957.15-3987.5: Warning (simple_bus_reg): /bus@a800000000/pci@8440000: simple-bus unit address format error, expected "b8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3989.15-4019.5: Warning (simple_bus_reg): /bus@a800000000/pci@8460000: simple-bus unit address format error, expected "c0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:4021.15-4051.5: Warning (simple_bus_reg): /bus@a800000000/pci@8480000: simple-bus unit address format error, expected "c8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: dma-controller@8400000 (nvidia,tegra264-gpcdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra264-gpcdma', 'nvidia,tegra186-gpcdma'] is too long
   	'nvidia,tegra264-gpcdma' is not one of ['nvidia,tegra234-gpcdma', 'nvidia,tegra194-gpcdma']
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra186-gpc-dma.yaml
>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: pci@c000000 (nvidia,tegra264-pcie): 'oneOf' conditional failed, one must be fixed:
   	[[208, 2952790016, 0, 268435456], [0, 201326592, 0, 16384], [0, 201342976, 0, 4096], [0, 201347072, 0, 4096]] is too short
   	['ecam', 'xal', 'xtl', 'xtl-pri'] is too short
   	'xal' was expected
   	'xtl' was expected
   	'xtl-pri' was expected
   	'ecam' was expected
   	'xpl' was expected
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra264-pcie.yaml
>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: pci@8400000 (nvidia,tegra264-pcie): 'oneOf' conditional failed, one must be fixed:
   	[[168, 2952790016, 0, 268435456], [0, 138412032, 0, 16384], [0, 138428416, 0, 4096], [0, 138432512, 0, 4096], [0, 138477568, 0, 65536]] is too long
   	['ecam', 'xal', 'xtl', 'xtl-pri', 'xpl'] is too long
   	'xal' was expected
   	'xtl' was expected
   	'xtl-pri' was expected
   	'ecam' was expected
   	'xpl' was expected
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra264-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: pci@8420000 (nvidia,tegra264-pcie): 'oneOf' conditional failed, one must be fixed:
   	[[176, 2952790016, 0, 268435456], [0, 138543104, 0, 16384], [0, 138559488, 0, 4096], [0, 138563584, 0, 4096], [0, 138608640, 0, 65536]] is too long
--
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3925.15-3955.5: Warning (simple_bus_reg): /bus@a800000000/pci@8420000: simple-bus unit address format error, expected "b0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3957.15-3987.5: Warning (simple_bus_reg): /bus@a800000000/pci@8440000: simple-bus unit address format error, expected "b8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3989.15-4019.5: Warning (simple_bus_reg): /bus@a800000000/pci@8460000: simple-bus unit address format error, expected "c0b0000000"
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:4021.15-4051.5: Warning (simple_bus_reg): /bus@a800000000/pci@8480000: simple-bus unit address format error, expected "c8b0000000"
   arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dtb: dma-controller@8400000 (nvidia,tegra264-gpcdma): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra264-gpcdma', 'nvidia,tegra186-gpcdma'] is too long
   	'nvidia,tegra264-gpcdma' is not one of ['nvidia,tegra234-gpcdma', 'nvidia,tegra194-gpcdma']
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra186-gpc-dma.yaml
>> arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dtb: pci@c000000 (nvidia,tegra264-pcie): 'oneOf' conditional failed, one must be fixed:
   	[[208, 2952790016, 0, 268435456], [0, 201326592, 0, 16384], [0, 201342976, 0, 4096], [0, 201347072, 0, 4096]] is too short
   	['ecam', 'xal', 'xtl', 'xtl-pri'] is too short
   	'xal' was expected
   	'xtl' was expected
   	'xtl-pri' was expected
   	'ecam' was expected
   	'xpl' was expected
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra264-pcie.yaml
>> arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dtb: pci@8400000 (nvidia,tegra264-pcie): 'oneOf' conditional failed, one must be fixed:
   	[[168, 2952790016, 0, 268435456], [0, 138412032, 0, 16384], [0, 138428416, 0, 4096], [0, 138432512, 0, 4096], [0, 138477568, 0, 65536]] is too long
   	['ecam', 'xal', 'xtl', 'xtl-pri', 'xpl'] is too long
   	'xal' was expected
   	'xtl' was expected
   	'xtl-pri' was expected
   	'ecam' was expected
   	'xpl' was expected
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra264-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dtb: pci@8420000 (nvidia,tegra264-pcie): 'oneOf' conditional failed, one must be fixed:
   	[[176, 2952790016, 0, 268435456], [0, 138543104, 0, 16384], [0, 138559488, 0, 4096], [0, 138563584, 0, 4096], [0, 138608640, 0, 65536]] is too long

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
