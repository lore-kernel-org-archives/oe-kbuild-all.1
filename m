Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C6A310784
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780128171; cv=none; b=csWfWHhfDiHPIZ2lrDBO7AV8p7+cuuTtRAE4dvLrbEnRAuKEKewcQUKcurg3RBMOdCPCuJoPWSGsKMBOTj4aYPZ2bkIs7I/93AXOHE7VkPBwkdDoloPLQzKyMH3Ois2DHzR78BO6DcNSsYlwzLU4h5moXfufsdEauZMD8AMatvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780128171; c=relaxed/simple;
	bh=0458wowkGhum1KTmZSlegNli6fUs7yeAiEWwAeZ0otE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LTNP9GkYEeeGAy2Vh5ZbFDRAFISxukGWobnBf2sUiBkWqJiKafNrGQiS/QrNfCRPgzflAHBpp7kmk+9Vg4F3dnJWsF+sPC8prPPCYrXfMP4urTSOe5D6LPQTigwLMhw+27zO6pMINrbqQ+9+CiX5I/+UYWaaKwYoJWTFdGtqztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RD/+6/eb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RD/+6/eb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780128170; x=1811664170;
  h=date:from:to:cc:subject:message-id;
  bh=0458wowkGhum1KTmZSlegNli6fUs7yeAiEWwAeZ0otE=;
  b=RD/+6/ebOl34aK9l0JVBeNuaU3wbvt2JwIPKY49Ye+UPZsQBeNdAG68U
   TvRxLsstdqe6YIPA7QZmBucBqqhO3ih9O+ja3ZYT7zqzgvR+SMSkasemq
   v6Fzk8JmbX/VAIIZBr/EW1/+VDD32IYK+o4nM9A//wrquJZvQVO3n8OiS
   b7N94fjBR7udt7/Ux0eXU7FLwRbzHimyVv0FCLjirLRD5HDJH+4NdRT5A
   IV8+IVN+TfNrMocnHWF3coFHlTRshbLRdHz3QTr2Y517pRtuJLfDEpACO
   vvHDAjAx8soVvFgmxBAX+kOUueSh5HNFS0wgKL5tWd/GlNb+ITTWoWOCR
   Q==;
X-CSE-ConnectionGUID: rzrD1IFZSRCVfVljWt8YAw==
X-CSE-MsgGUID: Urclp0SbRquYc8Pwj1Cfaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84829596"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="84829596"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 01:02:48 -0700
X-CSE-ConnectionGUID: fK8miOV1TSOD7PJohmoklQ==
X-CSE-MsgGUID: qkqC/B5ZTjS7qORVcQ95EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="240047318"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 May 2026 01:02:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTEea-0000000015T-2eAI;
	Sat, 30 May 2026 08:02:44 +0000
Date: Sat, 30 May 2026 10:02:21 +0200
From: kernel test robot <lkp@intel.com>
To: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [linux-next:master 7314/9870]
 arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f
 (cirrus,cs2500): compatible:0: 'cirrus,cs2500' is not one of
 ['cirrus,cs2000-cp']
Message-ID: <202605300905.msiJHWF3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: a3dcb0a3204f75f6841d8f7d0dc232f51706dfb9 [7314/9870] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist
config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300905.msiJHWF3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300905.msiJHWF3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300905.msiJHWF3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f (cirrus,cs2500): compatible:0: 'cirrus,cs2500' is not one of ['cirrus,cs2000-cp']
   	from schema $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml
>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f (cirrus,cs2500): compatible: ['cirrus,cs2500', 'cirrus,cs2000-cp'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml
>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: /soc/i2c@e6510000/clock-controller@4f: failed to match any schema with compatible: ['cirrus,cs2500', 'cirrus,cs2000-cp']
   arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: mmc@ee100000 (renesas,sdhi-r8a779md): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,sdhi-r8a779md', 'renesas,rcar-gen3-sdhi'] is too long
   	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-r9a09g057', 'renesas,sdhi-sh73a0']
   	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r8a7778', 'renesas,sdhi-r8a7779']
   	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r8a7742', 'renesas,sdhi-r8a7743', 'renesas,sdhi-r8a7744', 'renesas,sdhi-r8a7745', 'renesas,sdhi-r8a77470', 'renesas,sdhi-r8a7790', 'renesas,sdhi-r8a7791', 'renesas,sdhi-r8a7792', 'renesas,sdhi-r8a7793', 'renesas,sdhi-r8a7794']
   	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r8a774a1', 'renesas,sdhi-r8a774b1', 'renesas,sdhi-r8a774c0', 'renesas,sdhi-r8a774e1', 'renesas,sdhi-r8a7795', 'renesas,sdhi-r8a7796', 'renesas,sdhi-r8a77961', 'renesas,sdhi-r8a77965', 'renesas,sdhi-r8a77970', 'renesas,sdhi-r8a77980', 'renesas,sdhi-r8a77990', 'renesas,sdhi-r8a77995']
   	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r8a779a0', 'renesas,sdhi-r8a779f0', 'renesas,sdhi-r8a779g0', 'renesas,sdhi-r8a779h0']
   	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r9a07g043', 'renesas,sdhi-r9a07g044', 'renesas,sdhi-r9a07g054', 'renesas,sdhi-r9a08g045', 'renesas,sdhi-r9a09g011']
   	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r9a09g047', 'renesas,sdhi-r9a09g056', 'renesas,sdhi-r9a09g077', 'renesas,sdhi-r9a09g087']
   	'renesas,rcar-gen1-sdhi' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
