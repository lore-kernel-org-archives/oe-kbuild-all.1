Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EBA274FE9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 04:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773031112; cv=none; b=FKydQK5uUB0SupZGDWBC++IOsRZzX76sA6v9wYPBiGg4A6i5efYp4syY8T0/3ICgRImP3V+AMsoY5vAl2UQB8cb4OLMmhuOAjLzcPhsHX3wylEnwPdTNbdvxGWl6H+bqX9d6czOup5VlBXA0nGSUCVZkPJgsJH3ys4cQ5/VDNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773031112; c=relaxed/simple;
	bh=oPV4gXjbBeCVvPiIEk1vnpHGtaCQI121D/qEj8AFJj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NwnKCS3Q5d7Cbj1Il1rE14YqUt+7PJe4Y5nSEVM9NGUht/ScfBWJ/+XjpeaXXluKCWSlfpWpS3b5CdKpk+HZ8Z52CgRkls0XnmlMF8fAr31uw45wFDwZPWWNKCP4EgJn7BI1ytUmzqafuLS82JvAUQ/b5mfWImTgllwLqgo9Dc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CugLtvp/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CugLtvp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773031112; x=1804567112;
  h=date:from:to:cc:subject:message-id;
  bh=oPV4gXjbBeCVvPiIEk1vnpHGtaCQI121D/qEj8AFJj8=;
  b=CugLtvp/KY7pjjE2HkIiCg0Dh6ldqzRsrDUykUBKSIESOSWsP044X/Fy
   jXWGOg8tC1f0su0LKRG5EE9Rwr+szysXtS1COcjtqmbApXq8jmJcleHgt
   6dVRVaEtJpmt/+0COFrsUgUWMWgcMvhSulakiFTvntev2PtUZn8Uf+RQi
   0n8ulDz3Wl+zkZIfML3yb/Homhm93+16n8U8V63VADDOXD5VP6e8Jx1DA
   c86uq2leAyopL0zsOAABT69+lh0k1gzAbnPM9wU7xqsvLKIuTvV8xrb3T
   u/PX4wqxE0f3JLXll436aIqKGnidK9vpxOdt23BqIHEcwHRvsQHUGWNk+
   Q==;
X-CSE-ConnectionGUID: trB79Qb9Q1us2NiqgeN/lw==
X-CSE-MsgGUID: TpDSCuO6Ql6lA75ScSbR/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84374424"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84374424"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 21:38:29 -0700
X-CSE-ConnectionGUID: dQ9QuliMTPS549e0u1tWSw==
X-CSE-MsgGUID: P6IXWCKhTS+lAdGi/ftX5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="217260020"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2026 21:38:26 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzSNs-000000002oX-1hyV;
	Mon, 09 Mar 2026 04:38:24 +0000
Date: Mon, 09 Mar 2026 05:37:24 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /
 (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed,
 one must be fixed:
Message-ID: <202603090504.TdRBSz7T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: f267ced2bcb0c9d5f489a75328eb64f8f0af8c40 [3/3] arm64: dts: freescale: moduline-display: fix compatible
config: arm64-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260309/202603090504.TdRBSz7T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090504.TdRBSz7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090504.TdRBSz7T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   	['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp'] is too long
   	['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   		'fsl,imx8dxp' was expected
   		'fsl,imx8qxp' was expected
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   		'fsl,imx8qxp' was expected
   		'fsl,imx8dxp' was expected
   	'gocontroll,moduline-display-106' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gocontroll,moduline-display-106' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gocontroll,moduline-display-106' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gocontroll,moduline-display-106' is not one of ['eukrea,mbimxsd25-baseboard']
--
   	'tq,imx6dl-tqma6dl-b' was expected
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp']
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   	['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp'] is too long
   	['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   		'fsl,imx8dxp' was expected
   		'fsl,imx8qxp' was expected
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   		'fsl,imx8qxp' was expected
   		'fsl,imx8dxp' was expected
   	'gocontroll,moduline-display-106' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gocontroll,moduline-display-106' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gocontroll,moduline-display-106' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gocontroll,moduline-display-106' is not one of ['eukrea,mbimxsd25-baseboard']
--
   	'tq,imx6dl-tqma6dl-b' was expected
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp']
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   	['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp'] is too long
   	['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
   		'fsl,imx8dxp' was expected
   		'fsl,imx8qxp' was expected
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: / (gocontroll,moduline-display-106): compatible: 'oneOf' conditional failed, one must be fixed:
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'gocontroll,moduline-display-106' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   		'fsl,imx8qxp' was expected
   		'fsl,imx8dxp' was expected
   	'gocontroll,moduline-display-106' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gocontroll,moduline-display-106' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gocontroll,moduline-display-106' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gocontroll,moduline-display-106' is not one of ['eukrea,mbimxsd25-baseboard']
--
   	'tq,imx6dl-tqma6dl-b' was expected
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display-106', 'karo,tx8p-ml81', 'fsl,imx8mp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
