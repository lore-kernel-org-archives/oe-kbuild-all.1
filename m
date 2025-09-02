Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1170EEC0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756837638; cv=none; b=tZ0o8Fn2y+4NWcuAvkePAxaNSLNxT3a3gtIYZ6RWbcHknKubZchiK3RIXN52Q2RAW59gbzO4C/RHIC8BssCv8/1u5FPWzBnsNQYp1P8ma8shDMfv0m4IFIS0WS1AEx+KMPaexENDoeDFSLkpK59HT2aSdL8V2TKRcRuV+9o85O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756837638; c=relaxed/simple;
	bh=fEGbspAxwThU9ttYUK9WEbVOdsdnmmtYqnLDpZ9X2h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQOXJprmVXcuRkrO1PonVVcja6EW0IJQuYp07se6XjQoddoqbbAX7300QdQi3RVwCbo77sQsJR3PepC30HCjYl7KqJEY4ImPBOVoiHhtIdVXUB97AdPDhAR9ixmkOpvnBMBjcNyZprSRXby455TOaxoDQ8hxn7052bdxgI09Y3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RDIR0SeZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDIR0SeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756837636; x=1788373636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fEGbspAxwThU9ttYUK9WEbVOdsdnmmtYqnLDpZ9X2h4=;
  b=RDIR0SeZ2PMmkWEWIXnW7kAsoEE6GCecnmVZZIJmUZT2+gBeVVbrAKvo
   nipnQDEqEMHOSDYbvRblUlfmyHraTIBlgZaGz/0D1cahtnOYb+Yran5FJ
   SXkyPv9JdO5Btczjsj7tPAXxSr01goiSH1j6I8199tPvzQN+EGEf/fp8n
   dA8DGEAhVA2ssXbs+zuRyiPuX/ElpQXKqQLrG2XgG7DIgrIear9rTy50U
   CvKZwRxQeEHvmQ9i543guSg25yB5Q2aU5ym0GSsaMpUPG6Kt+zKjnIsye
   zzVbkuHtQzG3HqwMiYnYU4L/zkPZJzkXcnzSnyW2GEGLVujKZlwZ8T3go
   Q==;
X-CSE-ConnectionGUID: 3ACs5PnYSuK8bt70IZ5Q+g==
X-CSE-MsgGUID: tYj1ShggTC+T68NW4Qf8oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69390047"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="69390047"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 11:27:16 -0700
X-CSE-ConnectionGUID: HDepdGhJSdCA00a4v456sw==
X-CSE-MsgGUID: 87tixR7XRK+TIUto8DWPVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="170631511"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 11:27:15 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utViq-0003L1-0u;
	Tue, 02 Sep 2025 18:27:12 +0000
Date: Tue, 2 Sep 2025 20:27:09 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2] Warning: Duplicate
 compatible "mediatek,mt8183-mdp3-ccorr" found in schemas matching "$id":
Message-ID: <202509022043.pgPhcL0b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   36837d71a847eda589e01964f2ef6de2263373a7
commit: a03ab1b3bbbc3d6674d3a7523b2e4364840630a7 [2/2] FROMLIST: dt-bindings: mediatek: Add Mediatek MDP3 dt-bindings
config: arm-randconfig-2051-20250830 (https://download.01.org/0day-ci/archive/20250902/202509022043.pgPhcL0b-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 19464d951a93f48fad7332d59ec1e2f1d853c777)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509022043.pgPhcL0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509022043.pgPhcL0b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   /usr/local/lib/python3.13/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.13/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   /usr/local/lib/python3.13/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.13/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml: voltage-ranges: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml: voltage-ranges: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml: input-debounce: multiple incompatible types: uint32
   Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml: input-debounce: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: snps,priority: multiple incompatible types: uint32
   Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml: snps,priority: multiple incompatible types: uint32-array
   Warning: Duplicate compatible "nvidia,tegra186-ccplex-cluster" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpu/nvidia,tegra186-ccplex-cluster.yaml#
   	http://devicetree.org/schemas/arm/tegra/nvidia,tegra-ccplex-cluster.yaml#
>> Warning: Duplicate compatible "mediatek,mt8183-mdp3-ccorr" found in schemas matching "$id":
   	http://devicetree.org/schemas/soc/mediatek/mediatek,ccorr.yaml#
   	http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> Warning: Duplicate compatible "mediatek,mt8183-mdp3-wdma" found in schemas matching "$id":
   	http://devicetree.org/schemas/soc/mediatek/mediatek,wdma.yaml#
   	http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> Warning: Duplicate compatible "mediatek,mt8183-mdp3-wrot" found in schemas matching "$id":
   	http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   	http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> Warning: Duplicate compatible "mediatek,mt8183-mdp3-rdma" found in schemas matching "$id":
   	http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
   	http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> Warning: Duplicate compatible "mediatek,mt8183-mdp3-rsz" found in schemas matching "$id":
   	http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   	http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
   Warning: Duplicate compatible "isil,isl1208" found in schemas matching "$id":
   	http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
   	http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   Warning: Duplicate compatible "isil,isl1218" found in schemas matching "$id":
   	http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
   	http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   Warning: Duplicate compatible "pericom,pt7c4338" found in schemas matching "$id":
   	http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   	http://devicetree.org/schemas/rtc/rtc-ds1307.yaml#
   Warning: Duplicate compatible "epson,rx8025" found in schemas matching "$id":
   	http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   	http://devicetree.org/schemas/rtc/rtc-ds1307.yaml#
   Warning: Duplicate compatible "maxim,max1237" found in schemas matching "$id":
   	http://devicetree.org/schemas/trivial-devices.yaml#
   	http://devicetree.org/schemas/iio/adc/maxim,max1238.yaml#
   Warning: Duplicate compatible "adi,ad5692r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5311r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5696" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5338r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5691r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5671r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5693" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5696r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5675r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5694r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5695r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5694" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "adi,ad5693r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   Warning: Duplicate compatible "mediatek,mt6795-infracfg" found in schemas matching "$id":
   	http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#
   	http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
   Warning: Duplicate compatible "mediatek,mt6795-pericfg" found in schemas matching "$id":
   	http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml#
   	http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
   Warning: Duplicate compatible "mediatek,mt6795-topckgen" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/mediatek,topckgen.yaml#
   	http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
   Warning: Duplicate compatible "mediatek,mt6795-apmixedsys" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
   	http://devicetree.org/schemas/clock/mediatek,apmixedsys.yaml#
   Warning: Duplicate compatible "ti,tmp275" found in schemas matching "$id":
   	http://devicetree.org/schemas/trivial-devices.yaml#
   	http://devicetree.org/schemas/hwmon/lm75.yaml#
   Warning: Duplicate compatible "dallas,ds1775" found in schemas matching "$id":
   	http://devicetree.org/schemas/trivial-devices.yaml#
   	http://devicetree.org/schemas/hwmon/lm75.yaml#
   Warning: Duplicate compatible "dallas,ds75" found in schemas matching "$id":
   	http://devicetree.org/schemas/trivial-devices.yaml#
   	http://devicetree.org/schemas/hwmon/lm75.yaml#
   Warning: Duplicate compatible "maxim,max6625" found in schemas matching "$id":
   	http://devicetree.org/schemas/trivial-devices.yaml#
   	http://devicetree.org/schemas/hwmon/lm75.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
