Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AE6342538
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 22:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790461285; cv=none; b=IGi9MbsNcCM81hkZn923QDO2RdNhpJKpJh89lCd8weMN+VQF28z7ObrWcxKoJze6hYixou+U/t7LBK9vgJHuaCcldGIC3+I9saZkzeOWmOZopZqHACwoWqGxo1utrggUZBW4RU15B5NMz0N5EJjg5U7CJF1qSQEq3GkQ6qJ1pBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790461285; c=relaxed/simple;
	bh=zqKojjikWTRDQD+LuVHPU3l+AsUHLZLRRnf9WWrqjk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bjUT6yjgBHA68cKNWv+/29SAFbQdX8FDVE8noFkSRKnkI3yamFooNerokbqg7o68QBq8HAavgoTg3yUqrYiBrXnn8hFCVOiVxQNYj+RKDDxyi3fId2GH66CAwHjgBt7pIbvty5ZobQJmXkTgdXD827aMOttI5ZJhoVg+YMlhHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kC4zgi+4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kC4zgi+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790461283; x=1821997283;
  h=date:from:to:cc:subject:message-id;
  bh=zqKojjikWTRDQD+LuVHPU3l+AsUHLZLRRnf9WWrqjk8=;
  b=kC4zgi+4dZnc0H9njX1wlZddlhqmr4LJW/77a5eGOY/DTZbYLZ6E5luV
   jypOLyoBSqdM90srS9ep0l2t8F4RFw93fYmA//oh4/tGEGZd31Ntxx8OR
   xUj1ON0s3wyYzvUTXrY9OoZl2vdFW9qdE2sA0lxjPwtcliTaiNgNPDAlg
   Fy6TO4GsgPMVN+asibI21Z/8wOOWsFmKK3evdCsMMyOktW4UZjXZqEcOZ
   yPGpM64+ST1pQ5RsVa0Rr4fKDl3JbqtzQ4/sMB57t3bb12tgc6mUEiVm6
   sLq9OVEPx42vekEWBWO1BF8dprkgoA47Mm2IE4fnQsBW1Okg2SVjYf35m
   Q==;
X-CSE-ConnectionGUID: BIerZgNOQ/WURwGTTtbbxw==
X-CSE-MsgGUID: yuddOwPCSH+VAc0YG8/b0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101380113"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="101380113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 15:21:23 -0700
X-CSE-ConnectionGUID: HnYz9wgAROuhqv6dSrqG7g==
X-CSE-MsgGUID: Sbmkmzb/R3iCQhXyyeCtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="271154385"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 26 Sep 2026 15:21:19 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAalh-000000000E7-0775;
	Sat, 26 Sep 2026 22:21:17 +0000
Date: Sun, 27 Sep 2026 00:19:28 +0200
From: kernel test robot <lkp@intel.com>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 2479/10910]
 arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: linux,cma
 (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges',
 'reusable', 'size' were unexpected)
Message-ID: <202609262327.3In2nwKg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 153a8f4b71cee0e6ade27d7765de730af530653b [2479/10910] arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms
config: arm64-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20260926/202609262327.3In2nwKg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609262327.3In2nwKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609262327.3In2nwKg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: vdevbuffer@88020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: vdev0buffer@20820000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: vdev0buffer@82020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: vdev0buffer@84020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: vdevbuffer@a4020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: vdev0buffer@88020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: vdevbuffer@a4020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
