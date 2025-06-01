Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A62DCBEC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 01:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748739909; cv=none; b=upaHJgBsyVPbU6OWwTBzC+z2BU9UDK8JCtNsqJrPaLrzI1v+OQpZhdHPOqvatCAgcFVBgRqBvUHiEynMyzx1DxSXjdYh/hgvFOoMlCYtgL9FXLqiLZQWImsn/M/rlj57cM/wr+A3xoFl5ub6Xk9BeSuoKwPo4kpHeCGJwH6JVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748739909; c=relaxed/simple;
	bh=jRLYHG80W9ufO+tMvYYU4tUiYXmfbvwHKhx8CPHotr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5r3rfnmHj2YtpteLzQfMtyL3sF1IjbKvX4crPpJTsd/YKknNMe3+0g9j1AZqy6GFpQVlo4Iyvpof6Ft7UKVblt7P06pv/lBCIbIBe4z9HWtFsevYvGnNjYesGIgaNsDP6k/v+Ew0bg4J+IM+ts8P0AJQB/3/Hlf2/+252jnjco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SE88MTXY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SE88MTXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748739907; x=1780275907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRLYHG80W9ufO+tMvYYU4tUiYXmfbvwHKhx8CPHotr4=;
  b=SE88MTXYLOsw3HYap7FLFM+XTF8bxx/9bJajNOB5mGft1ejC7JDV2+ep
   r4DvGDYbLqfq20JZ7jBQbTRZeHpV1/BqWxlJH9lai6gSpVhrrSCA11VUG
   1L+tmnl63AYjmW2kcRb7a8FqGVl3Hrw/xBEbJEP17PXDCL/WGTfqm0eei
   UKQi9HQG7RvV5EzMGEMU1KZ14WEHxiHDcRGG7pveN6ERFT5pk01i7t2Jt
   rkkukTbmZGxbED1wKqcd3wzIYvg4pS+JKNMrK93EIgpA31xvaBjLz3U/H
   xmvHawLp+HYGdy7GU18EzGeBY3NabhZqYV73Kh24XErVnX2IHQTK6PHQ2
   Q==;
X-CSE-ConnectionGUID: Io9dfix2SNi2gpdwxJr7WQ==
X-CSE-MsgGUID: evrtMuwNT0mrufV7ayqeaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50714250"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="50714250"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 18:05:05 -0700
X-CSE-ConnectionGUID: 5VN5+bTbQ5CCfOJ/8g91sQ==
X-CSE-MsgGUID: h09zLVe+TIyxK76oCIuuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="144678087"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 May 2025 18:05:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLX8I-000Yj0-0M;
	Sun, 01 Jun 2025 01:05:02 +0000
Date: Sun, 1 Jun 2025 09:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: esai@59010000
 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202506010852.irYrV3Hb-lkp@intel.com>
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
commit: adf7ea48ce05a6c5c44f0f9d3f81e83e5cb70c3e [2/2] ASoC: dt-bindings: fsl-esai: allow fsl,imx8qm-esai fallback to fsl,imx6ull-esai
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250601/202506010852.irYrV3Hb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010852.irYrV3Hb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010852.irYrV3Hb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: esai@59810000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: esai@59810000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: esai@59810000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: esai@59810000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: esai@59810000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: esai@59810000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: esai@59810000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: esai@59010000 (fsl,imx8qm-esai): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: usbphy@5b100000 (fsl,imx7ulp-usbphy): 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
