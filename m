Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0036D371887
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789194494; cv=none; b=KnvPpJOjqNUhOZFhrtmfVn2ePTQol19whXiRfkArrSPpm//mmQkQ+FoBuo4J9VGctDY48887KvdwjcQQBAim1lgnBmh4pVeTbQtB3OMVeVv7WG2aLMUfFjFUtA6mSCckGEs/LLoDrzqmzbA7WleNiCsNg9qHyl+87zCMQnnopRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789194494; c=relaxed/simple;
	bh=/guenIbC2PYGEikCxP6P+sAq98qofSla5galUsrVtBw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Eaxw3tOzmhqa2W48VjFWPsGm/e3VnJkv5pHgqq8Y251LFvKYFGV6GqDd3HadZWf9TC35Idqrb1l1//1XDvWMW++Kz+3ELyltYYaSia09lfHtrp9Be8LHmAD7SAxAyTd/524BvX9qay6cgXgFygXl/tu5XxLCCFugySLICkdtsw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4TFX12R; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4TFX12R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789194492; x=1820730492;
  h=date:from:to:cc:subject:message-id;
  bh=/guenIbC2PYGEikCxP6P+sAq98qofSla5galUsrVtBw=;
  b=M4TFX12RvEEMUdQgIXOVDSiCc9/HSIy+/AajY352OGB6dMIVDmf5Jpfs
   vAnzZNj59913Gqx+ntN6N/ykhv404NTkaepJ8OJhdo1JgdmiXo780WvfN
   qjVTIZwNLI2/gaXa+zSuPztPjSfogEZSu++/+2iXCljshDF9jBe0CJCiH
   vvD5JWv5xQwp9FC64rk04XxgAXKaTN1e23TqINtWjEA4lQkvtzxZgk5Be
   d+hrJwLBc38XOk8Of4Jn7uDbnk5Hn25rTa7398wf8kWhg54C5CNdVDWKF
   CMEN+dSwPAzMstFwmgdtEbdCmoix8ngHyYeN+kXYl9SJz8SRoDUfuVGfK
   A==;
X-CSE-ConnectionGUID: 1sZU1X7NTYmBYt91zVKRgQ==
X-CSE-MsgGUID: qhGz58sXQtCf5mfqkVvaog==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89579851"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89579851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 23:28:11 -0700
X-CSE-ConnectionGUID: uWosn+aYSTeV3RRVbOBBbQ==
X-CSE-MsgGUID: AcKXXjxOTlm/inMi/V3E9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="272632032"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Sep 2026 23:28:10 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5HDb-000000000zX-3180;
	Sat, 12 Sep 2026 06:28:07 +0000
Date: Sat, 12 Sep 2026 08:27:56 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 2/2]
 arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds):
 compatible:0: 'panel-lvds' is not one of ['admatec,9904379',
 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'han...
Message-ID: <202609120856.iEICODlP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   970175856dfcf73ea364900557b6ad669018a4f1
commit: f315e030a202012a551eb648fa10cd90bd925b20 [2/2] dt-bindings: panel: lvds: Append ampire,amp19201200b5tzqw-t03 in panel-lvds
config: arm64-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260912/202609120856.iEICODlP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120856.iEICODlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f315e030a202 ("dt-bindings: panel: lvds: Append ampire,amp19201200b5tzqw-t03 in panel-lvds")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120856.iEICODlP-lkp@intel.com/

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
