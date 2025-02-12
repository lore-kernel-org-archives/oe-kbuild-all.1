Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15BD6F30C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739325278; cv=none; b=KVZkR5pGf9DtX2sgotefKk3nILQ6QW7v1JN/fFF/HmpGhJVKdGvxTrp9OlZD3/nngrA4LpjG2NV5ij52979BNPX89r3+8u3HMeWo59U9nCmPll23RKn86IqefDL4PESplBVkd3l5m9TlJ77wgQY8VtetF8Divfjwj9hvQFC6FrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739325278; c=relaxed/simple;
	bh=zEdnLQUPPSSsHT3Mvgwpjpni8SzfpUS69j1DRYZLUgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQDswN6zItTju64LkwFUZPxk3AUKpysYHmTunY4qQdF9Ily5ocp+rz/t94pcvFJFDJ+yCqoBer9P0mU300TWRYOiibl9hqt8VLhJ2lfBimqJQvP1v7Qjdb6SHPKipFXneUb1PfEV+iLAiRP9noVhy6/ovixgEYHDvnDWCfEZyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3VieNL0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3VieNL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739325276; x=1770861276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEdnLQUPPSSsHT3Mvgwpjpni8SzfpUS69j1DRYZLUgA=;
  b=g3VieNL0DS9rjmj5vtd0vxX01ilBs1av0d0YgtNC3gMVNV8Pib031cEq
   WO1/KDUrhYadAltZlNVZiZYGSEl6xt9v1G+lyI48Jiqdq4IbB9L9ILqbY
   PyFuTxH2Oj0O4OnfAMSaHaTRqjpuWutKD+eZTPEjomAdYxCmuzdKsdqTf
   N/OhuFC/Xe9/9gICH5I5XlAh+DnSeXVCGQdLlJmvBoa9O4fklQDe3IrVY
   nRhVVLn3RHZmZbIQtmMKmX1e3UvQ7qyrOwQKq2LGoFtD3aEeJsEgz8eNF
   qEBN4aZVqfElmpatr2JAQSAMhbKZlsPfGrRCfgVLsXBL9Llx9ls3pHFg5
   g==;
X-CSE-ConnectionGUID: sloS0KF0RXy9UI+pKBmZaQ==
X-CSE-MsgGUID: ULcuWpysRGqaP9w5LqTjAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39829355"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="39829355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 17:54:35 -0800
X-CSE-ConnectionGUID: JTEtncQjS0anmvTt4AfP2Q==
X-CSE-MsgGUID: xJ+NcxbkQ5qbipMbRpIyfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143595861"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2025 17:54:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti1xQ-0014xj-09;
	Wed, 12 Feb 2025 01:54:32 +0000
Date: Wed, 12 Feb 2025 09:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 5/5]
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: nfc@28: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202502120945.J2pKRjth-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   7b6df7ad6ccb2c1f0d82abb3ea088c9684cc7545
commit: 6b3d104e52893493964a5eefa50dd0fdb472515a [5/5] arm64: dts: qcom: sm7325: Add device-tree for Nothing Phone 1
config: arm64-randconfig-051-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120945.J2pKRjth-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120945.J2pKRjth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120945.J2pKRjth-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4582.26-4653.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: nfc@28: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nxp,pn553', 'nxp,nxp-nci-i2c'] is too long
   	'nxp,nxp-nci-i2c' was expected
   	'nxp,pn553' is not one of ['nxp,nq310', 'nxp,pn547']
   	from schema $id: http://devicetree.org/schemas/net/nfc/nxp,nci.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: /soc@0/geniqup@ac0000/i2c@a84000/nfc@28: failed to match any schema with compatible: ['nxp,pn553', 'nxp,nxp-nci-i2c']
   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: usb@8cf8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
