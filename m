Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D4376E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714169477; cv=none; b=oaaowWZLSyazlNUjdR2/0a3GFc9cQ8Zq9e0X2wXYBL5X0cYYM8TBv2mzQqbEDMCgjRSy4cV1U/BUhoE3P4wwzCV6QAxuKeGAfBdmgpZFN/uxNM2Dzek7xsmc1yTiBug6kM9LPE0fYhlddSDleyWQCEoZwSbtMHwzTF2YDcqLbbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714169477; c=relaxed/simple;
	bh=SjlzorVNSFu3apvZBB2PH4vhXG9noNdaXgZ5QRitPjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q95dOWjTaWfEQWYdqts9ECNdhlNSleYbhcQ4KW1G9ERWCrr6QVl2Lrp/A2ILXf83eG5VOiVDjfoijUqSQYkfqUl1UW5YY0FsZXZzx0U6oy+qUQSoHocKexG4iBc3Bp37PcESajXhvTvo4RrWVXUf4RXTVwHEhRhXaGVoufwl0Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYOkf+le; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYOkf+le"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714169476; x=1745705476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SjlzorVNSFu3apvZBB2PH4vhXG9noNdaXgZ5QRitPjk=;
  b=TYOkf+lemN9PIqhLiyYXT2jcygCDS9OMXsQRMxYEjYQEo/Izfa5OIZQc
   hW93LQ2QR9JvYfL7qoBmkGMANYGMNYy4fFaPhyu0CMIiUI4WOMN9YZDx9
   NNBI0rModto6B1iMNHo19uwjSrcBsOPvh8Yvp5/6OXHdw3lGXrEpNa46u
   zxHUMh+EkdCd1qoG2U3sBzAbhF1DH8PY+FFL1325z2TucLTVqBlwBCgIf
   ZFWpZMzcLcf2QZ2WqODDyUEV76kMcDMyB3HmXM9gpi8CN/8fDo4Nv+oYu
   ULwimbTJJqaHmwysh0SxK3eYqQ4WDJnYk5IaAIjk1GWXN7tluOYKJCiz9
   g==;
X-CSE-ConnectionGUID: eCeoczw9QiWVEH3YrSXbLA==
X-CSE-MsgGUID: hWuKmjWbTp2+EGC9lfZg1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9793890"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9793890"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 15:11:13 -0700
X-CSE-ConnectionGUID: s/bp2+iZTb6aSs9z8gHEGQ==
X-CSE-MsgGUID: L114NSKMQqavaWmlfUHGmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25518468"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2024 15:11:13 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Tmg-0004Le-0O;
	Fri, 26 Apr 2024 22:11:10 +0000
Date: Sat, 27 Apr 2024 06:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3684/11728] htmldocs: Warning:
 MAINTAINERS.NXP references a file that doesn't exist:
 Documentation/devicetree/bindings/clock/fsl,imx-blk-ctrl.yaml
Message-ID: <202404270635.7smZp574-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 780df716b670aef787fc358eec71c28f4f15fc22 [3684/11728] LF-2358-1 script: add get_maintainer_nxp.sh and MAITAINERS.NXP
reproduce: (https://download.01.org/0day-ci/archive/20240427/202404270635.7smZp574-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270635.7smZp574-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-mipi-csi.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-isi.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-jpeg.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-media-dev.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-parallel-csi.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/fsl,imx-blk-ctrl.yaml
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/s32v234-mc_cgm.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/clock/s32v234-mc_me.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/display/mxsfb.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/jdi,tx26d202vm0bwa.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/dma/fsl-edma-v3.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/dma/fsl-edma.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-dcfg.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/arm/freescale/fsl,scu*
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/mfd/fsl,imx-mix.yaml
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/mlb/mxc_mlb.txt
--
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/soc/fsl/fsl,rpmsg.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/spi/spi-nxp-fspi.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/cdns-usb3.txt
>> Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/usb-xhci.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
   Warning: MAINTAINERS.NXP references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-xen.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
