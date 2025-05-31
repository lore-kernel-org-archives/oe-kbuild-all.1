Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411393D6F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 03:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748663792; cv=none; b=acHhQVtOMfX6PWclQQpeLHdnLXlKIcVqUTpd6zluBGoIXTSY+VP/UOgFe3ZyifDAicEKGPqtJZCx48H+A6prjv77dEB5qhx2ecyzPAEfYzAXOXPHwnLwTJMb4AMMhXTV+eOmLWjc3/UGfqpELU4nQGrDUoVeTr50AgleJkC0Drg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748663792; c=relaxed/simple;
	bh=e3CCAoNJtLj4WITKHhQwaJEamNGzz9HNhk9Gdgulay8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SqiBfERzYh+X9NofCZ0Qowlni2H6vj/4OhxzoAnbpJrFQoGXTWHg9pZfRozaBgIXY9Ul6J6kR48MR963OMTXd0PttY3jvzLUWvR2Yppar5kUSvXdLjiubCkZwjVtxouhLZPS4wur6Zcfx1kksufqlsR/P+btyk1sgB1iVsOtH7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKwhE3iV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKwhE3iV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748663790; x=1780199790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3CCAoNJtLj4WITKHhQwaJEamNGzz9HNhk9Gdgulay8=;
  b=CKwhE3iVQxCmx0he8B6xBJRc0JZI8XToFmRulzfHXa3XPZyCX11azo3k
   PUZyCGH6o0lPvBnSBgqAHeueRguZLaUndI0MG2m+0Jt/GRWHEnGfWDSPo
   wWuR2aIeBnh4UoqXRlUjhwfEayHc4MfEKhdLFiCbyu2V2LXYhlkq0+SNe
   r9OxFejbUIg3VCnjw/lKiBbOQVPICvM6g4ALXXtqaUXgmmG9gmoyNLbPf
   K+kMkwWfX6OM3rGlkFiErMFQkFzP+3zl9Wle7maQfAdLIbKiuNaO4XeFX
   fgViamnVSJzhVaXC/eRa/XAKfii49elJEoztqeG89aAe6Li23AamDaSHV
   w==;
X-CSE-ConnectionGUID: aSmyisTPS2e44u5T2FTMgA==
X-CSE-MsgGUID: 3gCmdNEvRq67w8RLtNt1fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61383504"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="61383504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 20:56:30 -0700
X-CSE-ConnectionGUID: dmj8sTyERmGGpJPvkwBYnw==
X-CSE-MsgGUID: OyrNyPqbRmCXidFfO01oKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="143958452"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 May 2025 20:56:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLDKc-000YAy-1G;
	Sat, 31 May 2025 03:56:26 +0000
Date: Sat, 31 May 2025 11:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds
 (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379',
 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha',
 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0',...
Message-ID: <202505311103.h1TSBSIr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: adca46171ff7b3613cd7975f81870ae9025a34cf [2/2] arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250531/202505311103.h1TSBSIr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311103.h1TSBSIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311103.h1TSBSIr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'tq,imx6dl-tqma6dl-b' was expected
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-nonwifi-ivy', 'toradex,verdin-imx8mm-nonwifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   	'tq,imx6dl-tqma6dl-b' was expected
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx8mm-wifi-ivy', 'toradex,verdin-imx8mm-wifi', 'toradex,verdin-imx8mm', 'fsl,imx8mm']
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
