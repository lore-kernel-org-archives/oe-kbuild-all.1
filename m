Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3A3188CB1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 18:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729277162; cv=none; b=VyCrIaGeHcHOwTTobYsBBqvd6bXYv31tjt9gOevBaLBEbDKq7YjIahRxRIIuxD61j0dyYRaR8SVKfq1qzLKgCknRjlhvcCWeLo2Hx8JHm5WTPVSDxQcQUUwpLJcOGYtYDp470yAHXzvUCeJA66iBBCg6TvuZwx4kVaUw6ZtTizg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729277162; c=relaxed/simple;
	bh=W9Uh+757+kRCK1dnK86s48iLgsrnUuMUtqoXsADUgYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Um/tVzYVQ+o13qW4uuxcFFnJWhAuB9t8pxDqvLP7aw9OGdzj8X+ZwY+xFBvN5Uk8A7le2Gkp3AAcd7vatUwKdhlPhBygrhN54MB2jx5QK2hAcNpv2qxrT0MtI6fJBwPj5J7MDi2CKeI+5D1KbZqHxcjtNj/H1mtj5eB5yzDfw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUHVBCFx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUHVBCFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729277160; x=1760813160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9Uh+757+kRCK1dnK86s48iLgsrnUuMUtqoXsADUgYU=;
  b=DUHVBCFxGy8WudLhXsH++UVSuXW6SiAxrvaDKgPeJ5415Ip9aoOHfb21
   Vm4Wt+O40xlKRWinslMoixsPTlXlOzGHfLvng7GGtpWEBuXJD4Cb/fOkJ
   IbeSYPDs8T7X4wMyyQxgPNAxQybPVQZGfhIDygWZgOdygsGCA4zQErOb5
   7Sf9YcMANIQrzxiEw+57NMGL5bERAHy57h3e087C1Hzs/loAu8V9wVsrh
   z40hXY0aWcgtWpKJPfHbd9nnw/XZUPs7KZn3rKuFvsqDtZpdfw7l60ewp
   WrlzmoIJtdEup1Li7Ic833yF1fIU40iaD9ML8Osrc5q7IZseY2cqURYh1
   w==;
X-CSE-ConnectionGUID: 71Gk8wzAR5O4diyjIqDwyA==
X-CSE-MsgGUID: 6nwt+L18QHqnW4n0jwPKzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40182398"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="40182398"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 11:45:59 -0700
X-CSE-ConnectionGUID: 6Mu8z398QUOimFuIjumTtQ==
X-CSE-MsgGUID: p+htdPPZS+uo2vzkOSrJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="83571246"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2024 11:45:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1rz1-000OBn-1x;
	Fri, 18 Oct 2024 18:45:55 +0000
Date: Sat, 19 Oct 2024 02:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [linux-next:master 5228/5686]
 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds:
 compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2',
 'hydis,hv070wx2-1e0', 'tbs,a711-pa...
Message-ID: <202410190235.VogdBzI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: adca46171ff7b3613cd7975f81870ae9025a34cf [5228/5686] arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board
config: arm64-randconfig-052-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190235.VogdBzI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190235.VogdBzI8-lkp@intel.com/

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
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
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
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: panel-lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
