Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1997224882
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746741238; cv=none; b=p6iCn+Fgov7xxjZiQWxIxYCAHRbEfeI7B2daPZGBprli5a5NGHSR1Z7WMpAOWqknSriB203C2LXNX+o/jg3k6buF3x7jcruejmV2gxeX7Tc3TJKKKjODnQ+IyuZBqvMYRI1eVBXtP3KmdSLyh5glBwWsrpOosyh430h+RGgBSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746741238; c=relaxed/simple;
	bh=d1g9MJWMvbDxp/Bdib2UveuscknK3TAdlk5APqHctvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHt4u8hAHKFuJBCz6WVfI+8hb2zq7hE9RFNWb4/E3GSvumusLMom/WqGOnfgFvz/dtUj7gBeW+tpT/hA13MwuDgZUd4hZfBwFzV2vWbQ5o8J+xGSW0ByBtbdFj/uit9amMckQId756OVitWO4pV7xrZzjbDE9Olc6MK1UIrK0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1f/iVq8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1f/iVq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746741233; x=1778277233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d1g9MJWMvbDxp/Bdib2UveuscknK3TAdlk5APqHctvQ=;
  b=F1f/iVq8K4eFFc1zOq+aOrEOd1/WNNOjQgepVlOMkrWSOn0W43HYAYR8
   aaz0w2zImG1lCH+wfbDgKn957OhEmyh9cybT37K7pjh3LV7Z64OXNUHyj
   iw0d/Es2RSzZZEezBwDTLacayY9GxGews4oPcho1zwvDXsoytRczIVn9E
   quqR7QqrqUyu51Yt1o0pyeq1Cs8eAzDYUOJcoQ3kgrUtk77nJJMdkhv2y
   EtrmyqO/b7ACXcuXFtk00IwGIM++ERcj85yMjpDkYDm3Xp2HvQkZX5S6t
   lzRPrWIZQ+JVTRnHoasctwJTOFkwxNKsRBSmLxe8PDqLPkF7eobNE3ahj
   Q==;
X-CSE-ConnectionGUID: nG08O7kfRv+BpMnGRhEUpw==
X-CSE-MsgGUID: OLBjNr4UR+y2Xzwh68iwOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48465142"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48465142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 14:53:52 -0700
X-CSE-ConnectionGUID: FfuMon40SSOjhGyl6i1Suw==
X-CSE-MsgGUID: 01K4xAHgR8qNwZkLmnwx4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136430514"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2025 14:53:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD9Bc-000BPH-00;
	Thu, 08 May 2025 21:53:48 +0000
Date: Fri, 9 May 2025 05:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 7745/9729]
 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb:
 clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required
 property
Message-ID: <202505090537.ss8RbFln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 2ba124053687c933031a6dc5b2e16ceaca250934 [7745/9729] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250509/202505090537.ss8RbFln-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090537.ss8RbFln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090537.ss8RbFln-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts:48.9-58.5: Warning (graph_child_address): /connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts:361.14-467.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts:311.14-418.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts:277.14-364.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts:330.14-411.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:794.26-806.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/spba-bus@30800000/spi@30820000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts:309.14-416.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000 (fsl,imx8mq-nwl-dsi): ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000 (fsl,imx8mq-nwl-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
