Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3315B42252E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 23:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790291643; cv=none; b=LHPDuv3gkt66teIAqqFbzxgCEF6a6PB4TtULTbjIC8hCKpN+ndd6szWFFv25O2XIB24O1LAjlddR/4TCtQiYn65AT+1h4Ekp8h8V9qZpcqlNqHMEP0H/r4Q2Ak6yGkVn82/ScaM7FRxdE0K3p+VmvrG91Ur6fH07JJJKfr6o8ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790291643; c=relaxed/simple;
	bh=KY4UFAuhyLitJZXUJx4kpuuDc9p+mvfSz82HT/oKFW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hgzc22r75RjfNK5T3/6IJHJWZDBgJV39r2fJjTKkbwYjX7lriwAiNCrGzWw4JDH3VFzNnHVDHQqsC8+MBGvbZmXzkQEN99sS2pZSdfLIoe/X4QcvmQw40eVbMlPKhxexGyD8CdpnIV4V8VRbH7MbaU86QQQr99ME3puaO5cz1Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wv+BRdXJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wv+BRdXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790291641; x=1821827641;
  h=date:from:to:cc:subject:message-id;
  bh=KY4UFAuhyLitJZXUJx4kpuuDc9p+mvfSz82HT/oKFW4=;
  b=Wv+BRdXJyaI/4Q2bW6uX3aZysXL5Khr3lQ5a135glv5VIADlj5YfQXth
   uNTTIVORDjeDYXBEMh/p+y1ZE4I9dDzP8LVe9oPMPEbLCz36qBr2qmJLN
   Rn3DM6k+c9OJodpkTftOwhc2F0U6u2AS4eIeTwknuuNqs7/Zvv/DE3vRq
   3x2tb6shhbLcBsRtjbdRqaohZFZWLmzluKTVxjv56T9CTjJdUQdRkHa4u
   q4/wu6gxQjQzEx8ovhquLwlNevHtG5fHXiAw63ZA3w5R0vQ3R7+pb8+GQ
   4nB3zN8tARQlKv4P0GOVV+09Vo0Q+ILX1RKPTPKgfbvEeoXOBEEt6VRSY
   A==;
X-CSE-ConnectionGUID: awoXyasiSpaSkwLn29dM+g==
X-CSE-MsgGUID: MhRmfOEkRm2Ci3035oWCTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="108569271"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="108569271"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 16:13:58 -0700
X-CSE-ConnectionGUID: TkAoNxpiR0yxPKZhumgCCg==
X-CSE-MsgGUID: sQccpvKXSGWYvnFmV374HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272003495"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2026 16:13:57 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9sdW-000000000TA-2Lgd;
	Thu, 24 Sep 2026 23:13:54 +0000
Date: Fri, 25 Sep 2026 01:13:47 +0200
From: kernel test robot <lkp@intel.com>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 2478/10113]
 arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: linux,cma
 (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges',
 'reusable', 'size' were unexpected)
Message-ID: <202609250114.PcO1Z3ZQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 153a8f4b71cee0e6ade27d7765de730af530653b [2478/10113] arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms
config: arm64-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250114.PcO1Z3ZQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250114.PcO1Z3ZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250114.PcO1Z3ZQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
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
