Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F24AEBDA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286110; cv=none; b=bGsPRwiiBA+qiTwjhDJWvqlKcioTmci8mXIKld9uD2ml3OE1Clpk150bwtILld2OuPVKPQh1Ogg9k1yWSHfRhCQIhj1Mknhs3mCnof5R+ngbyHala5QrhKguniQt5oaq5zV14lqCpUZcoZ/logpaKf8PnaCK+Q/W+6bHPkkuyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286110; c=relaxed/simple;
	bh=MLTBAcz1FUC0g0N2xJe+NllFO5M51/i0hB1XgAlm1Ew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RYqzYoAaYdVr160GKV5KRmepEvkNTsWoyn8oSo9CBeMs6faQQ3glf60Nny2K/P3SeyZbjI20bz9KX6yaq1fxhZYM8a6TpwwiD2uQv6JLI3Epr5kvO8DXApe6LXrx9p03OhFkyYr2n17wXwPgIcuK2/aULDdiZQcGpAlT6ACUtiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVgwfl5C; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVgwfl5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790286109; x=1821822109;
  h=date:from:to:cc:subject:message-id;
  bh=MLTBAcz1FUC0g0N2xJe+NllFO5M51/i0hB1XgAlm1Ew=;
  b=kVgwfl5CUH537JcVpE8AhrR8mGfJCFcMCgjHwpKiAWDkvEwSdeWC/iv+
   6knWLtVk0It/Pq3DTFsJQC3nVb6q2l87ZlORwb0aAxazXFDW9UVtkmc5J
   /I6JobpS6PMt9/zQh4c/35O/aRIRsHW25JrwVAQl7dZ/73bIbA21RLK6G
   QtqEcpr2Wlrl/GnlCEUH6TgLa5yNYtJRhDDPKx7tB5qHJjkd0PbysgGo7
   +avtzj1Jj5E9xxEGTRqKvkFAEWDRvUWKnYj4DCra9iooKyh5OpjfbSEWR
   qrkNNuaxACZjXSL4xgRuXl7/XzWW++m4/zSajNcwn2xNXgRriXNrzFIBv
   A==;
X-CSE-ConnectionGUID: RCJQzZgIRxaDCRXOGgJpKA==
X-CSE-MsgGUID: mTqsJFRnQLWBUZewB0aYvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90199411"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90199411"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:41:48 -0700
X-CSE-ConnectionGUID: dAJJ5M2MRsCB42sNhd9tkg==
X-CSE-MsgGUID: I2KlZhDaT8ujY6x6C4NK9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277908911"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2026 14:41:45 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9rCJ-000000000RS-2796;
	Thu, 24 Sep 2026 21:41:43 +0000
Date: Thu, 24 Sep 2026 23:40:56 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 2/2]
 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb:
 ele-reserved@a4120000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
Message-ID: <202609242348.OpqIEhSw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   24f47124488eac6ebd0804f4dcf7d19139c7d140
commit: e71db39f0c7c0157177be12de7ae2d2495184da1 [2/2] arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA
config: arm64-randconfig-2401-20260923 (https://download.01.org/0day-ci/archive/20260924/202609242348.OpqIEhSw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609242348.OpqIEhSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e71db39f0c7c ("arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609242348.OpqIEhSw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /: failed to match any schema with compatible: ['tq,imx91-tqma9131-mba91xxca', 'tq,imx91-tqma9131', 'fsl,imx91']
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /: failed to match any schema with compatible: ['tq,imx91-tqma9131-mba91xxca', 'tq,imx91-tqma9131', 'fsl,imx91']
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /: failed to match any schema with compatible: ['tq,imx91-tqma9131-mba91xxca', 'tq,imx91-tqma9131', 'fsl,imx91']
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: /soc@0/system-controller@4ac10000: failed to match any schema with compatible: ['fsl,imx91-media-blk-ctrl', 'syscon']
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: ele-reserved@a4120000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
