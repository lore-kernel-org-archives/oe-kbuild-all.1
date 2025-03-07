Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D7C217728
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741349209; cv=none; b=k+01ZR3ITeCMWuB/ECq66/6o9Z5FP+g7pAoBRU1LxGbzg6C+s0itDksjtXgomAYvbkAM6y3gSReVDQuT+kbuROc88kxPlUgSJ+ee8fFJsriMoux66w9sYdDmWGLH5dASd9nB8VcULKgw364B+MOlyOP4ICDoCdVjfVpOdly4VGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741349209; c=relaxed/simple;
	bh=0oCBY5oAdsrz42TahdnVY9YCT9v2i6ORNNeF6JnAjL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4CCDEyPnXlTZvyzFcysHlHPeqk74F5mGzYUfG+5T4+54uZXE1DGu7Et2DmhSBeG9q9tJqv4LOe2E4t6e2xMK9z+pLB1PnmE4n3D0B0I4P52mEoU41n046s6vpHdPBFpSF43OUm6QW41ithuWVvuCrtAvQaiEGhmilIQKJV/LvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3yNU9Bj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3yNU9Bj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741349208; x=1772885208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0oCBY5oAdsrz42TahdnVY9YCT9v2i6ORNNeF6JnAjL8=;
  b=N3yNU9BjwaIKKyhNGZGBSrmrNw8Km6dgyo529HLVOwQZJrOcueAt/1AH
   1uTuKQr9lTso7BF8kTXFVQ25EPLpbKo5jZECRGXRZGGl6Zz3a3p8TtIY5
   KrcVIabn5WFrxrCRs/aGXWtJWAqftZj0oTcieHnXNNso/cibtjsCF7QE3
   aGlmfHcqGCuwYbSwYn9oQY2w7MNj/29mlxOMn0V4MsjBF+TmXT88UXxE0
   0xRvyFBDW+Jp4LA+jEu9zAV32lLcgFy7GoPzZ9fOAn0yvKE5sSQ9PIuuQ
   8KGfSoNsOcjIC8waOTMjX+gODXU/JrE8ROHU/vfi27zdD6CLm3EjtK9c0
   Q==;
X-CSE-ConnectionGUID: 6GFLonDbRnKliF1e3xHLaw==
X-CSE-MsgGUID: 0Kker7dLT9Cp+QeRJrb/VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42250759"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42250759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 04:06:46 -0800
X-CSE-ConnectionGUID: KtmD0P0MTa2KelLn40kh0A==
X-CSE-MsgGUID: JwY2VsbOSjagGaejtsTFOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119476460"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2025 04:06:46 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqWTS-0000R0-0w;
	Fri, 07 Mar 2025 12:06:42 +0000
Date: Fri, 7 Mar 2025 20:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Subject: [linux-next:master 8651/9212]
 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb:
 pinctrl@f4000: 'cam0-reset-pins-default', 'cam1-reset-pins-default',
 'cam2-reset-pins-default', 'cam3-reset-pins-default' do not match any of the
 regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl...
Message-ID: <202503072048.TTUCYDBb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: c24ccb1cd77fb44087b2f7008d99626796b33ca4 [8651/9212] arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
config: arm64-randconfig-051-20250306 (https://download.01.org/0day-ci/archive/20250307/202503072048.TTUCYDBb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072048.TTUCYDBb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072048.TTUCYDBb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: pinctrl@f4000: 'cam0-reset-pins-default', 'cam1-reset-pins-default', 'cam2-reset-pins-default', 'cam3-reset-pins-default' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: i2c-mux@70: Unevaluated properties are not allowed ('i2c-alias-pool' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VDDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VDDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: i2c-mux@71: Unevaluated properties are not allowed ('i2c-alias-pool' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VDDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'VDDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: sensor@10: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
