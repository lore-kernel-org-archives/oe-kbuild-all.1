Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5213B3E5A2B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 02:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093673; cv=none; b=ZUZPa/kqCu7CC/EK3CEJTgAYhEBYH8gV3cDBNWr62uXRdsB0qzyoVoHJAbP+VdyCQPL/vvNAiYcUztfOdt3q5gOURAsXyKyInb63f51R9ces3j64+LJQJeh61gG6wvyP8pRMHWAAk4oTYU/D/Bt8BDvTRorxnsVa+vhFUIqK0no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093673; c=relaxed/simple;
	bh=GPNHH+rBVZ5DcyzKFFmtlzYmqRwdlTRSOew7Dn/nZ6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hs9qIb+2Q5hyrtXb3ZvWJYopvq73+mgTUXdby3Q29rr75GQMNGkMtQPYT8i5IjlFDQil8TxcBsvgIKTIYYy5dCzSwfti684ScRc5wcM/bkowyjFPpiy2HvUCHW1/j6MIx2nZ+Qzebh2XjLcuwHyOU/HCADnfF7ZMtaDRw4nL1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhIp/PAj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhIp/PAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789093671; x=1820629671;
  h=date:from:to:cc:subject:message-id;
  bh=GPNHH+rBVZ5DcyzKFFmtlzYmqRwdlTRSOew7Dn/nZ6k=;
  b=ZhIp/PAjHpXmFGx0bT6eCcvfaQOB8tSQEd7xKZ7o0DkPXWWhwulgbYbd
   73I/Z2k4RToCGAa+rALeXIYRSmBknTq0yCXWSHUSpk1ZqVkE0gPnMGmVt
   8SsrNkHH9GmP0LzqcA0VmqmNoaBK+gSQ3Mh+sAE3crnpmKIV5zE2KhHnn
   dqjPLOBtFEkhkktcEg1t4yE0lHK0W3f2+vNfRt6LqeJAjALGm+qL8NiS7
   8QvuMBPjDS9dSbiE23d7fmGY8Zys6BJIZSGrq9lasj5mHMplXMr2N1M5h
   gxgApPEFv0dwKo2mdueQWkMYsWSniTr7lQI9c4JyAKPdxHPT+IGElNMRt
   g==;
X-CSE-ConnectionGUID: plLIfhUtTF6vP5wcWs6nyA==
X-CSE-MsgGUID: ++w2cHSlQ4GpUryS5pZVCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92066521"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="92066521"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 19:27:51 -0700
X-CSE-ConnectionGUID: yXybC5T/QdeQ29r2fF573g==
X-CSE-MsgGUID: Ben3na+GSFOQ82QqrTCXIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="273735945"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2026 19:27:49 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4qzT-000000000b1-1sxs;
	Fri, 11 Sep 2026 02:27:47 +0000
Date: Fri, 11 Sep 2026 04:27:30 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 2/2]
 arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds):
 compatible:0: 'panel-lvds' is not one of ['admatec,9904379',
 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'han...
Message-ID: <202609110457.mT8y9NOD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   970175856dfcf73ea364900557b6ad669018a4f1
commit: f315e030a202012a551eb648fa10cd90bd925b20 [2/2] dt-bindings: panel: lvds: Append ampire,amp19201200b5tzqw-t03 in panel-lvds
config: arm64-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260911/202609110457.mT8y9NOD-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110457.mT8y9NOD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f315e030a202 ("dt-bindings: panel: lvds: Append ampire,amp19201200b5tzqw-t03 in panel-lvds")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110457.mT8y9NOD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): Unevaluated properties are not allowed ('backlight', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1689.12-1699.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1717.12-1727.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1745.12-1755.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1773.12-1783.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): Unevaluated properties are not allowed ('backlight', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
