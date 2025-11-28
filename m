Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C52D7DF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326397; cv=none; b=nvF6AFWmfCpsEBrneiXxgQx8rpcsA6jbwV0wXqX9eBNvDYQ/xRZRIb+727XKJKrK4jrlY/0YdqGD/2UI8zWsVex5aYpB5H1PR/XvcNQlY+C48rRXU+qiAtZcuetlX3aPFFgpng1ll9xfgK/L9XdtJXPaLOYOJkNYsBnXiNUa+0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326397; c=relaxed/simple;
	bh=ZxjuzstLLOuNVRMF+5/tPCKW1UdLtVNQZ4/xfjWj4TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFUH6STOZJBGzLPKHNcRURfQUwcoypUdl4seYvpv4cmzNdeHHV9+DxixTLS4ziBn+2iMxk7SHqSD8drCNsFZjRTpHDHkPj5Qk7YKOTq70AYTMU915emL4iLNk8neWJvntI4dHGjoJNXZmjuAajat94zi8HMC3uHu6F0slzHP9lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0Iqd0un; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0Iqd0un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764326395; x=1795862395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZxjuzstLLOuNVRMF+5/tPCKW1UdLtVNQZ4/xfjWj4TQ=;
  b=l0Iqd0unjQX0K9K7KI7DZaKJMmxm4D4nNzvmA3ldnKa49/9FyZzC4kEI
   Htk8TbzMBP5eHjnnABc8IK16SYeTKZMYV4vjzGGiivvrvbZH6X6365cDo
   uYR33E9SI5ggChZdBL3QQOBzFm/Z7x8yJS2zooCTCxXqU8Q3ixilMAS+9
   OLrs4WqLM0b3W2WW5FrtWetB6vCRaVuhVqG+BUZ+VpdWlYPStoZSYGeo4
   SQCWaaZWSN5GGrYhkPlBOwKnVCm2CMtFdhkk0d2gi57l8qow9EA/l7I18
   mSmmlSWUFTn9xB3zrEJU1v3/W585fR3tSsr8QtS4kkDRRjy/rlTW9YCnz
   w==;
X-CSE-ConnectionGUID: Pew6+rBZRdmrkv9jy2hNQA==
X-CSE-MsgGUID: eRd66wk7SPm3Q4fceMB/xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66395085"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66395085"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:39:54 -0800
X-CSE-ConnectionGUID: mNUH2fWQRZO2v+F8J27k7g==
X-CSE-MsgGUID: vMxO0DVOSQ2kRYjvJpHUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193871780"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2025 02:39:53 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOvtH-0000000020X-1Xxw;
	Fri, 28 Nov 2025 10:39:51 +0000
Date: Fri, 28 Nov 2025 11:39:34 +0100
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-lts/v6.18-rc7-2025-11-27-x5h-ironhide 48/52]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: serial@e6540000
 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks'
 was unexpected)
Message-ID: <202511281104.AZwQEIZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc7-2025-11-27-x5h-ironhide
head:   c6bf655ed9499a1f0626cdfcf010e375aab6440c
commit: 4432dcb404e2630b3fdd971e0f513732d0753647 [48/52] HACK: scif: abuse to test spinlocks
config: arm64-randconfig-2051-20251127 (https://download.01.org/0day-ci/archive/20251128/202511281104.AZwQEIZc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281104.AZwQEIZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281104.AZwQEIZc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1395.12-1405.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1424.12-1434.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1453.12-1463.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1482.12-1492.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1511.12-1521.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1540.12-1550.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1569.12-1579.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1598.12-1608.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2329.12-2339.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
--
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mailbox (renesas,rcar-gen5-mfis-scp-mailbox): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/renesas,rcar-gen5-mfis-mailbox.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: panel@0 (raspberrypi,dsi-5inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: panel@0 (raspberrypi,dsi-5inch): compatible:0: 'raspberrypi,dsi-5inch' is not one of ['ampire,am8001280g', 'bananapi,lhr050h41', 'bestar,bsd1218-a101kl68', 'feixin,k101-im2byl02', 'raspberrypi,dsi-7inch', 'startek,kd050hdfia020', 'tdo,tl050hdv35', 'wanchanglong,w552946aba']
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: /soc/dsi@fed80000/panel@0: failed to match any schema with compatible: ['raspberrypi,dsi-5inch', 'ilitek,ili9881c']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: serial@e6540000 (renesas,hscif-r8a779g0): Unevaluated properties are not allowed ('hwlocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: panel@0 (raspberrypi,dsi-7inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
