Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1717166B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713374176; cv=none; b=BoV1I5siBXak4+6KFp2/Iqra8J0ibMGCrXWxSZdRHaInFjovwPxlo4mMnu2s4W7B9jedwbIuS/Jpn8kwa6QxQj5HkBLM6G4qcjamsQYTOi/qumeUzeiDOIkAm9u2XbB6+7Xvi1jtSfEBP4hhVPSPDbG1RaS4+I7ulBXPi8V0t18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713374176; c=relaxed/simple;
	bh=4K2NJFXecpFcwGyR32JfDxmEav1EHF00g4RUnxz1LtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbVU2gwJtC61b5rwEEHeWOgd+Fqi5i+k/UuiLXeR3zHeWWvWrmbnLOb+wEaCmjfWQ75Zywi978xm3ba51SavjEDhyH2dKUR6Ps4wjJT4kuIYtdZBCHqYPb8hK42+tF7beGW5dESF3bKogB0N+mSF7Hrrvr4y/EhgBY10RY8P2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7Ltl07Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7Ltl07Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713374174; x=1744910174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4K2NJFXecpFcwGyR32JfDxmEav1EHF00g4RUnxz1LtQ=;
  b=J7Ltl07YqsxS85C7A5jilw8zCTSh+ASRNocvV9HJprfiS+fSunXZNs3L
   3YlQeHNcfTGK+qOrpSOOUZYbqSbFOXI1D4X38sv/b1hnZLpsqmoa/mI92
   PCcCOHY/lSan2kc++DUMT59YRd5IEef+yDJbKRHXKELPUlVCB/3vlK1T6
   rgdhtbEvds+lSFRMyXUwSdJIKku+dAcHM+/sDJqdWNbDXASpsJp2g1A/F
   4JYCkP0hRa/1K+mpmMTNIoNaFSIKW5BVop44FqWGErYBnk8CuoMe+puyI
   Q61bebFio5KMqBp2eiQAPxgsnTvbI5qlEWanbM9ehsonszca+fJhNWU/q
   Q==;
X-CSE-ConnectionGUID: S7W5DMT8Tv6W/CIfalHTvw==
X-CSE-MsgGUID: fzmNaP5cSbGX5Bzg/RLxZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20305711"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="20305711"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:16:13 -0700
X-CSE-ConnectionGUID: cI+ZjpVtQmmFE/c9hqaJPw==
X-CSE-MsgGUID: 2kVgPDz+SN2Vt1Lt53VS8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="23283602"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2024 10:16:11 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx8tF-0006pc-0e;
	Wed, 17 Apr 2024 17:16:09 +0000
Date: Thu, 18 Apr 2024 01:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 3757/18115] htmldocs: Warning:
 MAINTAINERS.NXP references a file that doesn't exist:
 Documentation/devicetree/bindings/sound/fsl,dsp.txt
Message-ID: <202404180121.cFXiTbfp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 10a63df1c316c739c09b7a2b145c62c7db67d039 [3757/18115] LF-2358-1 script: add get_maintainer_nxp.sh and MAITAINERS.NXP
reproduce: (https://download.01.org/0day-ci/archive/20240418/202404180121.cFXiTbfp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180121.cFXiTbfp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da90*.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
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
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/fsl,imx-blk-ctrl.yaml
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/s32v234-mc_cgm.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/s32v234-mc_me.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/display/mxsfb.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/jdi,tx26d202vm0bwa.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/dma/fsl-edma-v3.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/dma/fsl-edma.txt
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
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/cdns-usb3.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/usb-xhci.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-xen.txt
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using sphinx_rtd_theme theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
