Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E54191484
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734126376; cv=none; b=anzPPVT+louVZ2YP2YPKGj+7J6I8gv2osRb9w2M4J6Xld9ZgBcBSsrSRFgUaN89gwpl+ZSwkMaA03wTkSLvyZA+aBEH0NUFPoDixcmIL1eZYZWmyyYK6iWbJ4ASpewWE655ARoto4cJQM9vh5IzjuzYIlQoSibW1iV6f/QAG1NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734126376; c=relaxed/simple;
	bh=nQldk8wtzbFUaQ74ZYIKRUUKYgwUbyzWQ8dH8+8/bIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=duAANSiDGWlCQJvwIS5iYQlXbMRdNNpm24XEDEohNrV9BecSlBixQ8GrS8I6h9eq2EwGBEAdcEh1AGUlOVAX4A6YH24CfG3wdp0O+LCSZfUvME2Y93hm+JytA5X1EKhdJcwRUCch5H9jFeJnPoVk0DMTTSK8DYqNYMCvaQPe+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6AT60iC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6AT60iC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734126375; x=1765662375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQldk8wtzbFUaQ74ZYIKRUUKYgwUbyzWQ8dH8+8/bIY=;
  b=g6AT60iCwQkwcC57cibyoqFBo/XXCAgZ3mZw1gDWs1uG36z65vIMhrCc
   OWYnP87wwF8AzhYL20dsBITr0hvXQzd9f8NNUbmdf6wlsdmcxa0Ves3er
   ZOEls1wJADFu2EPQzkmjuNaS3MbFkpPZKGEqQCfWT1GEVHOHiQFc6VeFu
   s/Oy84mgON8CEO4kuKtArDYiTTykJT91oLof4jMUwkmF5mofaWRQNUiqh
   hfWYhiwuNOusi8p1VzwQWX12cKamPW2R/yr3w7E3LXW0oDJoQULigHlje
   dgCZKem82OFcVb3fdxDLTnGvRCC7ULmujfMhxtodp5dr+zZW/ZFDh9r9C
   g==;
X-CSE-ConnectionGUID: ZaTiCVdnRGacTHo4n/Gv8Q==
X-CSE-MsgGUID: MeOanyG0TbqyOHkvNkiEvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34321689"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="34321689"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 13:46:12 -0800
X-CSE-ConnectionGUID: 8R4QSL1BTz+iANRJvM/loA==
X-CSE-MsgGUID: T6vXPUL3TFyg8g3NvKYspA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="97059896"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2024 13:46:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMDU7-000CTB-01;
	Fri, 13 Dec 2024 21:46:07 +0000
Date: Sat, 14 Dec 2024 05:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Schocher <hs@denx.de>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 1940/3764]
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
 /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema
 with compatible: ['ti,tlc59108']
Message-ID: <202412140525.pLh8UgfS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4176cf5c5651c33769de83bb61b0287f4ec7719f
commit: eead8f3536d5cdb0b300a473ca800249bbcd8329 [1940/3764] arm64: dts: imx8mp: add aristainetos3 board support
config: arm64-randconfig-051-20241212 (https://download.01.org/0day-ci/archive/20241214/202412140525.pLh8UgfS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140525.pLh8UgfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140525.pLh8UgfS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /: failed to match any schema with compatible: ['abb,imx8mp-aristanetos3-proton2s', 'abb,imx8mp-aristanetos3-som', 'fsl,imx8mp']
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /: failed to match any schema with compatible: ['abb,imx8mp-aristanetos3-proton2s', 'abb,imx8mp-aristanetos3-som', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
