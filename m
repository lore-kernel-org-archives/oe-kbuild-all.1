Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F00713D29A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 20:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734380496; cv=none; b=bfwJmg8wxAKlaBzUqIzZ2tuYpUVdzXGX+zFm4VZ+aq7EGP1Bw3w0YgbEnsS3AUA2HthXr2IfQNOTKS1/rPzOUPZlKcg1UFytfrlKMf4tbw1Nuf2N+blZDG4WIS1aPaWTpL5IBPRxwVaPrUzk6cRaBgVspwYy7ZG+uHYGkCD8s1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734380496; c=relaxed/simple;
	bh=AmEuW6LFuxJ73uUBWMKT38BsL2oFMfBWnFdEqZcLU18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kwb0yJ0d4gSnEhJtCIBu9aTbcIrmUCugkIk2iah+xr85zJuU4uRGoLqjkpptonj8GDjvzY4BcdOLUed8IguivCPJGS8MxUzySzFPAFjmoK0M3DD3J99aWb1/B06q3MOze1XFpWUh6rd98RMn47MZXJNF5EO0jAwWVH2bvK2AAi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDpmuJx8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDpmuJx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734380493; x=1765916493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AmEuW6LFuxJ73uUBWMKT38BsL2oFMfBWnFdEqZcLU18=;
  b=oDpmuJx8pShFGLhft5KgWUgyI78Uu4GQZxWgWWIpwfT3hUVE2yALYBJ1
   z6IsshSKVEBst+6rUw4GDPa+CHErNJoky5zqp0oZtYMzdN+ZezO+3UjaH
   aOXQz+8CfcfdUsaYHWidsTT9VRjLqwUcQosKcy3RdfJMufb39Nj/Gfhll
   7VtO2DwPStTLqZfIfYNsNqyCThaKZvlljlRjOsAOQcwffXRLqNKET9jQp
   iiPLT2AqWelh6pbyB/dRXNVfmEdx1+fjJwEGJUemwe5CoMyMqKHl4KKsx
   uTeTfFZUDr3A1Vg/8ydFyb80VXrAFAJfe/v1vfMI+IpetfX+nKJuRoSEL
   Q==;
X-CSE-ConnectionGUID: oGabKxWQRC6JLKRXMe7iWA==
X-CSE-MsgGUID: CmZwuVA9SmqNC2JVps0bsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34940805"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="34940805"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 12:21:31 -0800
X-CSE-ConnectionGUID: 4UA5/ZnrSjm/0BnSTEL4wQ==
X-CSE-MsgGUID: Q2u1QdPOTvan+Dgnzfo1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97876747"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Dec 2024 12:21:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNHaq-000ESO-1E;
	Mon, 16 Dec 2024 20:21:28 +0000
Date: Tue, 17 Dec 2024 04:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: Fabio Estevam <festevam@denx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 3411/4379]
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0:
 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05',
 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha',
 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenso...
Message-ID: <202412170435.LI159ez1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e25c8d66f6786300b680866c0e0139981273feba
commit: 1c64605fd976cd2c7e4f30d826818a8c27924c32 [3411/4379] dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9
config: arm64-randconfig-051-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170435.LI159ez1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170435.LI159ez1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170435.LI159ez1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1682.12-1692.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1710.12-1720.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1738.12-1748.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1766.12-1776.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
