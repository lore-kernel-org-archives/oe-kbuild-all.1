Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E3F1BE251
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558671; cv=none; b=cLm93XxSH8xjAQo94r2oyWmIv9LEnv4oDt7lEUQsxkfjB809S4TQbpB0S0M0mTrq7diUsbzO5RdHSFkgb6V9zsnk7ldPFqWR2DitHv24sJcMcpauhpZpAFfqPnmhkK+Zy7f+vkmsdDsgFwRWGQncLDdj9sJk81ZgsSQ0bCbfDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558671; c=relaxed/simple;
	bh=qskQ9Pc2rAvU/5fzY5fLriiftxdikhuBE+wSE0DnDJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbWH76am0Bc881MyJGDm0GyHqEhs9GPaZ2TbYP/MfWa1lAv3eu/t9wRRvJDqpLHEsCFdunmpIaF2wDMsBUdb1g5n6aWdHFdHCO5FUamPctVDXnw0HGyVw5NWOkvg+nKGs94ZqPwGLtcv+xgDFZlLTdBlHCM2S6KbEJzFtgM8XpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkLM8x8h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkLM8x8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728558669; x=1760094669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qskQ9Pc2rAvU/5fzY5fLriiftxdikhuBE+wSE0DnDJc=;
  b=KkLM8x8h8TL6DAWTMbu99oBKnGLoJQW1wsj2K7mkjVVoOYRf7QN8G+mW
   WYL15rP0mljuJ6QERbV32aPnprTbw2Vf5MlLTKwcRDV5Y586kthr4dAX8
   6U9HobgsbCyfbX9xdvK05hANn6aqFOH2h2aKzhjrqNbAZquKwbBwWlqmL
   UztcShrlGYfPwOeaeQ+qHMj7OqRq1PFuEaQRWnQ/M/W1oZANuqKccDN/l
   +ix8P4tzjQ7YZyMlWUY6sw3ZzmQneqCD5gv6P0DJsYueDng7wBsmq8GJB
   47BuXcYKhvzCkn13mnfB8RLVIBUcuUueEBD0YZSL/YMic/HxiHsK7QL6V
   Q==;
X-CSE-ConnectionGUID: bXyML5GSR8aQvLiXJSDFbg==
X-CSE-MsgGUID: 2hfwnqDmTUO2VFYa2bp+0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28023856"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="28023856"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 04:11:09 -0700
X-CSE-ConnectionGUID: Ux7Zj7l+ScWmOgsXtbRddQ==
X-CSE-MsgGUID: BMfx20IHRdGXHpJrwgnTfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76469547"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Oct 2024 04:11:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syr4T-000AgD-0g;
	Thu, 10 Oct 2024 11:11:05 +0000
Date: Thu, 10 Oct 2024 19:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 2957/3639]
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0:
 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2',
 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a...
Message-ID: <202410101917.TVYgF8rx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
commit: 15bda06bc93fca828e5f11ca6b773fed19e45b8e [2957/3639] dt-bindings: display: panel-lvds: Add compatible for Jenson BL-JT60050-01A
config: arm64-randconfig-052-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101917.TVYgF8rx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101917.TVYgF8rx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101917.TVYgF8rx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
