Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959262163B2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 00:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761438098; cv=none; b=PowpK1/eHzxOyvHqPVyNtHozUXy8Lnt++OWv87FFiBm4/npnX7KcCeniFpWe5RfrcEH3uh9xhy2rG+AHoSUFLZBxm3H6kETK4oFil8jkBCN60VrhMASDrnezJxhFJ2N4EJc4Es2jCwkzdZ/DD1r0TrR/xJ1nzq91jU2iiFhuXKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761438098; c=relaxed/simple;
	bh=+lhdCwUE8XlJCUC7jZvYKiPGPtQb+QlXJPEdd1uN3oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ACuiYF59jp6x1xvbOxPkrRuFbnORcY6ikym0Qjp8qIE7AZYfl1z7+23fsTUSPVPMkYYSk8w4F1hv8E3laaNZUMOU77oJ3+cFOg6B9+MaVa+7lnU3WTsOQgCEd+kQSrYnzHnPuk6kOhBbGZVlAMH3ZtovcUCB63S+6tvpJpvdGY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmYbh42s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmYbh42s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761438096; x=1792974096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lhdCwUE8XlJCUC7jZvYKiPGPtQb+QlXJPEdd1uN3oo=;
  b=hmYbh42sTbJ3sjFjgVBjrtxEze0FFKhSAPQwhEwBKdMrBSeyEVN4ol8G
   1yavTwiwqQJHmIT5SkDp9OO++7eLyRs36OWvhj7EQ/rWgK4CTL5BQPv03
   r8S6uTiV6mgKZWqBrerPRPsKUsCmgZyk+wcky9E/L3PQNqPN0+CS2LrLa
   sJtbTGpznM1AmLieFyaGF5/QbI2pDx+OmgGM5nVgm+y5PaG8Bd/my/25g
   F2ChLd1jhXKUDZgrAuNW4wc1J3EA8qob9UCEaRBBBlLCa1ihGtyNOb2yR
   OYLddR0NXtAOLSf805auP6D9V7UH88/wwdLxZdNHWxGlwPVlxJ0oxPFl1
   A==;
X-CSE-ConnectionGUID: Pr7zBdEJR4aq6vSwH9x33w==
X-CSE-MsgGUID: 0wJKSQV6Rd2aaRYdzWTO5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63474230"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63474230"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 17:21:35 -0700
X-CSE-ConnectionGUID: wXLHONImRq+HcHVMHE8b9Q==
X-CSE-MsgGUID: EbdyunM6QtuZe+xDjMvfBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="183901299"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Oct 2025 17:21:33 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vCoVn-000000000Cr-0reN;
	Sun, 26 Oct 2025 00:21:31 +0000
Date: Sun, 26 Oct 2025 02:21:14 +0200
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [linux-next:master 3847/4098]
 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: gpu@fd000000
 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510260252.rSGM4zpe-lkp@intel.com>
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
commit: 08b1e69d08203e31c1c8819203040516683e40a4 [3847/4098] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
config: arm64-randconfig-2053-20251025 (https://download.01.org/0day-ci/archive/20251026/202510260252.rSGM4zpe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dfbe84da278126ac8017618af885ffc8581a728)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260252.rSGM4zpe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260252.rSGM4zpe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
