Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7531B4F09
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761340560; cv=none; b=h/51j10+s8lAZYv0ecfJIgHv36PGM+OmgCR9QTGUmLNyIkeq88xGfz8j05/1kGE1yRwAXOMC93hDZ/6wN2E2q8Mac+L4mTrRwmdhXtl5K5p10Iu1IWrrtejSOc9G2qh7s+EcAH+CYxdUUnTIJ9Lb1/+p1zR321VXknqMcOPL/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761340560; c=relaxed/simple;
	bh=XKUf6wdr2wdV3zubY7p9+PbQUnzFoi/OtamVrcrREXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2u1XWk2Yxxadp+XFy8sDRpqz+z5tgVm9j6rmVp+c7Pa3nZobLwvMy3nOSz8ehnLSJtkwTea1PFGhNYYh1iFXkBrOeQjaDQkdlmwi1/KlWFfzbJr+/54GWL0IDZvvy3fwtwOvP5UbKrGoukmbAOu3BFfL2Ft5mdmmkUgTowBV3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5zI27fa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5zI27fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761340558; x=1792876558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKUf6wdr2wdV3zubY7p9+PbQUnzFoi/OtamVrcrREXM=;
  b=h5zI27faIjDQ5p1/4J0v9IKy2kPdjP5ZpQFr5UoU3pThPt+TrmDEumXG
   t80Wm/YkFpD+gVcjH4Jl6WIzpW29hQQ561AB6Y3Uw4dK1MEirNNen/Hf6
   F9GAlRrY0+dg3P6yqz++9KtqdNkjnIE4eiUSUXuSdOOXVhpc9X9KSNQok
   A87MS9TCYebDVyJGh5/0Nc1nZs+3RlLQziSWEHPh4d7bWw3YI3Efq1X2s
   X49BbmHLfYOdBgJs7Y8p3FicE7L1uWLEKxlaepK5n7xBbh6zvv+PsZSeV
   HIjMUNLczjmcrLmOfW7NiGD+1sIBNAmButwXqhSFkc71flwkjeREjjt4Z
   Q==;
X-CSE-ConnectionGUID: D6h7ud02TSunQvA6geIqZA==
X-CSE-MsgGUID: Y43yWR47T5GZIHU+HTgOhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74201739"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="74201739"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 14:15:57 -0700
X-CSE-ConnectionGUID: EW4wLOo+SWadBpVuKlRjqg==
X-CSE-MsgGUID: RRWQ8C/VQx64DbPBNE8fRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="188587746"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2025 14:15:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCP8b-000Eth-2d;
	Fri, 24 Oct 2025 21:15:53 +0000
Date: Sat, 25 Oct 2025 05:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [linux-next:master 3847/4098]
 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: gpu@fd000000
 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510250550.66T4zLPd-lkp@intel.com>
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
config: arm64-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250550.66T4zLPd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250550.66T4zLPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250550.66T4zLPd-lkp@intel.com/

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
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
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
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
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
