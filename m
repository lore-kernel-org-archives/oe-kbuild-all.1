Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE654A23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 00:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726618913; cv=none; b=hDTtaK51AEdJ7Whu9K7KTa45yLVeBWd+xcToGCuhjYadtK8w+hXaG280jiiCA3aUlT20XoW8yBy5rQS7viYD8pWmWRQIXY9vrEn+DetuRJdQEa9GVufShnr6ADns85/ufActo5x+G4RKCbmmiPgYqRcF/C6uhFNP2ZE7f3LeMI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726618913; c=relaxed/simple;
	bh=3qkPZvbYoMFIVUdyLRd65VLY0hirhPAwK2ewAHuwan4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=naJvq4gWm1FnZhqXLpiOM4/qEJIB1hlnKmaag2v1gfHTG5OcVoqC9Xse7JdN0wHAJP7HS6Lnz7GO2mnAP+eP2kxZYsmIQsqAQXi1Jse3Fgf13zVO99Vbz11r+KgNXSvvxM+BGzUWkQamnsW7UhyqJ/4JAPXaQAOVifY3bVgfE/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AU+BZUBK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AU+BZUBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726618910; x=1758154910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qkPZvbYoMFIVUdyLRd65VLY0hirhPAwK2ewAHuwan4=;
  b=AU+BZUBKWajJArAuLZkAqafj2Wosw5/bp8ouMfZYCINdrIShP+HaOhHQ
   KNYHqs3IlyIkvm8UUw0u0QAGmsWkpm1M4ZaKUtEbkWSnjzVfsIbFQeWVk
   aRFuUjGRGfwyYQKZSVE9PD11usX14RpKPoyDBcpjjltgIcgU7MTffjiv6
   b2MgDNwAx6b4/mTGG51Xb3guFJocB8L07SAItzeTpX6CT2bKeCG8bpkG+
   CSDl3th3yyQhdYTVNV3WGlkDltzhQ6iicOZ2XwlSqyHuEU5V0ktX5dw0E
   /HnhMbEK+cwHJ0ii4ZiVvBt5wlggt9MrcC283mWyY2ZMK9KCsozbPXxTD
   Q==;
X-CSE-ConnectionGUID: cRYhnLwiQtmutkWZia24nQ==
X-CSE-MsgGUID: uXKJBMplT16jtbQiEwg2tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25607279"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25607279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 17:21:49 -0700
X-CSE-ConnectionGUID: I8rMtGQvRR+aBPYIVoY+/w==
X-CSE-MsgGUID: 3atA1kkqSP2Blu2QBqHnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69223361"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Sep 2024 17:21:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqiS2-000BjG-18;
	Wed, 18 Sep 2024 00:21:46 +0000
Date: Wed, 18 Sep 2024 08:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3684/14977] htmldocs: Warning:
 MAINTAINERS.NXP references a file that doesn't exist:
 Documentation/devicetree/bindings/sound/fsl,dsp.txt
Message-ID: <202409180832.AuEj2iDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   3516b574d9cb19c39dc921a07a37c8a2fcaf0009
commit: 780df716b670aef787fc358eec71c28f4f15fc22 [3684/14977] LF-2358-1 script: add get_maintainer_nxp.sh and MAITAINERS.NXP
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409180832.AuEj2iDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180832.AuEj2iDC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,dsp.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/imx-audio-si476x.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/imx-audio-cdnhdmi.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,rpmsg-i2s.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/imx-audio-rpmsg.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,spdif.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/net/can/fsl-flexcan.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-mipi-csi.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-isi.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-jpeg.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-media-dev.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-parallel-csi.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/fsl,imx-blk-ctrl.yaml
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/s32v234-mc_cgm.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/s32v234-mc_me.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/display/mxsfb.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/jdi,tx26d202vm0bwa.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/dma/fsl-edma-v3.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/dma/fsl-edma.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-dcfg.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/arm/freescale/fsl,scu*
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/mfd/fsl,imx-mix.yaml
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/mlb/mxc_mlb.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/net/fsl-fec.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/net/fsl_ppfe/pfe.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/regulator/pfuze100.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/soc/fsl/fsl,rpmsg.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/spi/spi-nxp-fspi.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/cdns-usb3.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/usb-xhci.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/typec-switch-gpio.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
