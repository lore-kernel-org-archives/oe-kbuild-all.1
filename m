Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7444B1A0712
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769360955; cv=none; b=KPpQsISaDnGEf618Sg8nmaFqeNNHd/4Ag30hqJZctZqbpfZVlvNnZb2CqK2BFISvh/tVMOoj2l3XfGDWNiA/2AB4y7TKLZ48hUXDR+q8jpBXQeidit7q4dtPcEyBFi+u1P23OC8FEpM+KTitT5D/GcFoeuLJKStfz9bYpmVwze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769360955; c=relaxed/simple;
	bh=hFMd+o50TyzLL3cO+jwJUR7I//gWaQ/1xyhCcHi1dhU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EPNooQtCRoR8KEh2tXq+AgG5sTloCha5nJcxbGm8HfCP2vGJmMP2CJaxZQKDDZzM0Jd23g8NAJVvGNiLJ1KJq2HMInwmt21wOlBURUvD9oNEZ58WOCYYgUCQBAYf8WduAQ+G0gt4dmJLRruMu0XBO1E1gFTqS7G7zALuMJdeaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEsCafFn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEsCafFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769360954; x=1800896954;
  h=date:from:to:cc:subject:message-id;
  bh=hFMd+o50TyzLL3cO+jwJUR7I//gWaQ/1xyhCcHi1dhU=;
  b=DEsCafFnLx0lBBoMf/s5FL+rH2EBeNNRPqo57k8hfMKF2XQ4Vpi8LBBd
   N1QmQwv7ENqnU0TCe77UDK/XFYhYZ2eqOfs91wdw6dwmVpQ2tbulpEmUl
   ro49r2nQ8JjcILqWbzdY9L/s4lPEyM8CcGcLDj7jHK3LMRLEYCFqwKBn2
   eHxND1+xuOYbC8VjWY+lsh4/7SA2f/l5K8Ws/nWO08pv6l5ew0mcljavw
   CtCWcJY6VZhjcEvdoH7n+CboXgh5K+ngeGn9jNUtBn04JKPzbh8N6Wr3k
   jD4KW5Fi8cK/HFZuGOcOrHehtp/1THBTJvf/XE2FbaCdpFclpk7oJGmry
   A==;
X-CSE-ConnectionGUID: xY8FmJ2aQCKS8f8wVdkIwg==
X-CSE-MsgGUID: MBQerNImTRqC9GbIrI/3iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="87965609"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="87965609"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:09:13 -0800
X-CSE-ConnectionGUID: f9HFtko4Tp6egQgAcjt9YQ==
X-CSE-MsgGUID: el3ezEc0TL257ABhP7C1BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="212358620"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2026 09:09:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk3bp-000000001JT-0TTU;
	Sun, 25 Jan 2026 17:09:09 +0000
Date: Sun, 25 Jan 2026 18:08:15 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
 Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 6698/9539]
 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb:
 nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-step-size: 0
 is less than the minimum of 1
Message-ID: <202601251833.e07tRPKb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 8124b4a4a96b57d6cc3705a9df9623c52baa047b [6698/9539] ARM: dts: imx: move nand related property under nand@0
config: arm-randconfig-2051-20260123 (https://download.01.org/0day-ci/archive/20260125/202601251833.e07tRPKb-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251833.e07tRPKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251833.e07tRPKb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand@0: nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand@0: nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
--
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand@0: nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand@0: nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
--
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand@0: nand-ecc-step-size: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand@0: nand-ecc-strength: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
