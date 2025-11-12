Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE69E56A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 00:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762906031; cv=none; b=QWvqqA7Z3H0waJplAeEbRJkGb3anqDB7Mv8pDTAidgWNX9TUlbdbFRD/URYiarGUoEY/KXFDBV3dx9oNEXSdWyAzyt/7gKvm/8MYyII8/55xcvbmG+8AHaOQC1aeoMbgVyloZshq9pgZtineXvtdJEUWuMN2O7Gbqj+5iIYZCdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762906031; c=relaxed/simple;
	bh=pMk5SiC1oO6shQSWQbpbUmgjsgqxWVPj8OTbQp79hUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RzegTyUKgfs7qZOBqbTmUZ5+h4u15jAurk5ilQBYwCLj2dlJpYLPAVbHl0AzTuucGxMXBpuvTjPH7SrvO9i9jvRZt95JLw7fxCM1Jpf7J+5ZyfPUDgsnzZY+T4X9UeNfgjYN+GFmVjSQ7LcbabdZeqw9uW9f1Xd6Gw/nr/fShmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BR76S/LM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BR76S/LM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762906028; x=1794442028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMk5SiC1oO6shQSWQbpbUmgjsgqxWVPj8OTbQp79hUw=;
  b=BR76S/LM7EFaAlRUsYmAygf/EVu5K50uBcpGoIrAnOIReJkAJUWrrToH
   i80QNl2tJfO7FZql6XVrsLhrvXsjP4WCPRKNRk4UUGf7vAeHKxTG0550s
   DbSv3FQmvJTI6EjQAin15fMZ+eF0knjGaGF62lRWVWGry4Wg+tWgU3tcp
   TyHWNnRknKr/kS11aBahJct61jDfUT169uCIb3mNT9PUntTSP3Wf8okf1
   TPkwTq362IQ1Ya5FpCzFHWY33uPbl1kTtKwLp9wtkZIBdPhvWXyGKqs/f
   D6RrUPkiegJMJKzzh6MSJQtM86vNOQFyb82ZrBjXbsb63jvut7YZ240mn
   A==;
X-CSE-ConnectionGUID: oQLJ7tcCRzWgH81Xxr9EdQ==
X-CSE-MsgGUID: I0QwZgsJSn6mbh0Y6D47Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64873547"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="64873547"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:07:08 -0800
X-CSE-ConnectionGUID: Y3iDcgOUTVCIlkU4xxhOyA==
X-CSE-MsgGUID: PdeHz/KeQjK00rIen3qCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="219801404"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2025 16:07:06 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vIyO8-000000004Ei-3JIr;
	Wed, 12 Nov 2025 00:07:04 +0000
Date: Wed, 12 Nov 2025 01:06:46 +0100
From: kernel test robot <lkp@intel.com>
To: Anh Nguyen <anh.nguyen.pv@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk 14/29]
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: /soc/gsx@fd000000:
 failed to match any schema with compatible: ['renesas,gsx']
Message-ID: <202511120128.QuAK1BUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk
head:   14a3f460905b5d9be43ad2bab030625085a52423
commit: 3fceb9e9ebae37175df935cd4d9688c3ee6b3a0d [14/29] arm64: dts: renesas: r8a779g0: Add new gsx node for V4H SoC
config: arm64-randconfig-2051-20251110 (https://download.01.org/0day-ci/archive/20251112/202511120128.QuAK1BUc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120128.QuAK1BUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120128.QuAK1BUc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1384.12-1394.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1413.12-1423.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1442.12-1452.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1471.12-1481.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1500.12-1510.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1529.12-1539.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1558.12-1568.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1587.12-1597.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2327.12-2337.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1384.12-1394.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1413.12-1423.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1442.12-1452.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1471.12-1481.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1500.12-1510.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1529.12-1539.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1558.12-1568.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1587.12-1597.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2327.12-2337.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1384.12-1394.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1413.12-1423.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1442.12-1452.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1471.12-1481.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1500.12-1510.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1529.12-1539.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1558.12-1568.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1587.12-1597.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2327.12-2337.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1384.12-1394.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1413.12-1423.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1442.12-1452.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1471.12-1481.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1500.12-1510.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1529.12-1539.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1558.12-1568.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1587.12-1597.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2327.12-2337.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1384.12-1394.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1413.12-1423.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1442.12-1452.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1471.12-1481.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1500.12-1510.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1529.12-1539.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1558.12-1568.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1587.12-1597.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2327.12-2337.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: panel@0 (raspberrypi,dsi-5inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: panel@0 (raspberrypi,dsi-5inch): compatible:0: 'raspberrypi,dsi-5inch' is not one of ['ampire,am8001280g', 'bananapi,lhr050h41', 'bestar,bsd1218-a101kl68', 'feixin,k101-im2byl02', 'raspberrypi,dsi-7inch', 'startek,kd050hdfia020', 'tdo,tl050hdv35', 'wanchanglong,w552946aba']
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: /soc/dsi@fed80000/panel@0: failed to match any schema with compatible: ['raspberrypi,dsi-5inch', 'ilitek,ili9881c']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: panel@0 (raspberrypi,dsi-7inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: /soc/gsx@fd000000: failed to match any schema with compatible: ['renesas,gsx']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
