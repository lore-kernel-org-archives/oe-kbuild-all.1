Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9C33BB4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 19:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761421175; cv=none; b=WsuNVggAl0cDg1kxfzOkzcnACVf5HGdA/pyernWOA5fyZi2MwHW3JlvR0lv/u4O2TXSj1zdQH2y1Yz41ITDtzW/qMbG0cpzlGD9zu10c6ZDCFA+pykF5bcKUBTvpYWzijvBDBRKYWI5vUDDXJltz1LE9jytqlEt36q1n3+tGbkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761421175; c=relaxed/simple;
	bh=Jf2HFJCP8XJFl2xMkUEn8It6hcdSO6ASJOC+rvVg+TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRnp8CGTUFxVHzkflynAjHYB6I5emJ+uXPr8vMxaa/f92JhGHXVW3Ae4Kp9WR7pORV+B4KHyKr7vsLCwyuBFmYSyLmdtguJAQ6+6utVe/STMR+yaLosF8YHPBTGeFDvVZYee26wdgM6IKY/2UGfKtdVnlNY5EuOzBihhVnfBdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMEWp4Vp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMEWp4Vp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761421173; x=1792957173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jf2HFJCP8XJFl2xMkUEn8It6hcdSO6ASJOC+rvVg+TA=;
  b=FMEWp4Vp75OO+E3cYATvOkETb5rE394pkn6J8oe2KjICw0BZ/zG5MGgO
   ALLYV+yLLHNbNnnEoBMQXDDRDGFYbXV/G/O/lLOYH9QTlROZ39m2dQLuF
   iASh09EQfp+DldGYxq/K4r4gh/qZj/9PqLdmITCrM18Db51Acqm6VISHE
   bpahxDM9mCWcFiHSY8jAfFDxrO8ZYj9Vtfhd+NLva1IWNhqrD2BmPzt0T
   7hBhiUdmoxKaNmCRt70RY1dGJomJ/f/nxv2cO98o88fsIJYy9fLInx4At
   Toik67Y2lMEvum7nUbYVNg8LoUzPTDGeNWiFPdQ5lVcIYb0Wtv/tsHcYJ
   Q==;
X-CSE-ConnectionGUID: pw0bUQGORKebbx2MY5ds4g==
X-CSE-MsgGUID: d5XoYwReR8+hEhIw/ZDtbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63463854"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63463854"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 12:39:32 -0700
X-CSE-ConnectionGUID: dankz6uJSleJfeQkhq4A4Q==
X-CSE-MsgGUID: 1tWXzVGVR5equ3z5ziKRHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="183914129"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2025 12:39:31 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vCk6q-000000000AL-3XeJ;
	Sat, 25 Oct 2025 19:39:28 +0000
Date: Sat, 25 Oct 2025 21:39:19 +0200
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [linux-next:master 3845/4098]
 arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: gpu@fd000000
 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510252157.YMgMOhP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   72fb0170ef1f45addf726319c52a0562b6913707
commit: 0eb6f5143b1daede692ee143df604197f9922164 [3845/4098] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
config: arm64-randconfig-2053-20251025 (https://download.01.org/0day-ci/archive/20251025/202510252157.YMgMOhP5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dfbe84da278126ac8017618af885ffc8581a728)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510252157.YMgMOhP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510252157.YMgMOhP5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
