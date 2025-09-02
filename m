Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A52E2DF4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756784032; cv=none; b=Ue2SWF8HwA8bqHYZhLZw38i9/7RMLWg6e0BI5rNynIe6h+hv6eobB05bUiwj1iNosSY/OdjLXMqnPxzC5ejOgvIUkqjqpLZ6PKt6xAdWnw4S1TSCC3zxg07TscZtSKQ2evPL3SjtiN3edqB4vi2BfyYZZZt0hVN4aGWOWbK+/DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756784032; c=relaxed/simple;
	bh=7aG5dd7vBxHtR1VnQFl+cvEwUcslEmHfxyCZhQkWsCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eqWexi5lQH1fivbkOcQNUUH172Wr05RzcmkFyTU8co+i9D5ljbbxYZkMjLPnLE5nVt9uCSO4VW5B5eSncD/F1tz5Qki5+ecwP50pcrrbU9oY+RuQm8LcDf+e4j5QhD0Av6dr2XaDxAZ5MYL3VDD/ErjUbBTxHge4TfbwsENEktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aExPzElj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aExPzElj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756784029; x=1788320029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aG5dd7vBxHtR1VnQFl+cvEwUcslEmHfxyCZhQkWsCo=;
  b=aExPzEljFp4KI/yf4fDIAutWhzULZeE6jr/8K/5FrHAMUocQNObduePW
   V7pr1DylxmEM07b4Z4VQq4R92vMlcP+nQC4sABVCxi8/pZOP57g7rkB8O
   tmw5GGfQSELqGm3oK91Z0vB3ELXCLby7IsounrOTYb1GxZtYCgEmSyFGU
   IeP3qoOatvFjHf3P8ei0BZjJVZNedhJSRYyP1k7jaTG1Ij7TvPcbVJrup
   zgorYSjHdSLMarSKdUtOt1z31zq5z9/cQ4KjEzxD1KYZRiZCHm3ga2lQw
   5Odgz6NUw8R/sSBr4kA+YQZxGkK3gTmzDARp1/VO/PQTK4pwz71UEwwoI
   A==;
X-CSE-ConnectionGUID: ACmVvGyRSqWnVrRI9F6kZQ==
X-CSE-MsgGUID: wIHmTmbTQpqxoeQKSMAd4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58959688"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58959688"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 20:33:48 -0700
X-CSE-ConnectionGUID: xw/TlXVrT66yUAuyaoklyg==
X-CSE-MsgGUID: zIW5LF84R9+gr/f38WyWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170420667"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2025 20:33:46 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utHmB-0001Od-0q;
	Tue, 02 Sep 2025 03:33:43 +0000
Date: Tue, 2 Sep 2025 11:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4756/5291]
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
 isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too
 short
Message-ID: <202509021101.Bz8COtDw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33bcf93b9a6b028758105680f8b538a31bc563cf
commit: acfaba169385bfa243a10a027f8272a974b2288a [4756/5291] dt-bindings: media: rkisp1: Require pclk clock on i.MX8MP variant
config: arm64-randconfig-052-20250831 (https://download.01.org/0day-ci/archive/20250902/202509021101.Bz8COtDw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021101.Bz8COtDw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021101.Bz8COtDw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
