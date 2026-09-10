Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F339AD2A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 20:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072663; cv=none; b=HYtd0h+c60gf8ZYbRRPJpWfjSOXXfkRlq4us5b/cnspmvo3RGKZR7eZ8NFdtlpTkZ4t30z9L07Tz8sBB+bWb78QFtzXlQT+Ngqij3UwGcAjW9r21nz+OVxku66DG0m8sJTrEW3W/OKoAgULdDxghanXmzt1JOW8aqbnqmofA5Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072663; c=relaxed/simple;
	bh=LYiQPUIDOR0DaQ2jKbF56lJzIT4y3IEs3CCXVly+uJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rHsAA66Woat767vWqnMEPHx8DYOCy3MFQIhtD05/1K9C+9GcAXOIazBiuxzTistZAZKTvK/sXaiWWaBMQgGvhwQYz0sLYtSzIaWP/8OAu1wfcG9NYlQ4ivMj0Mfotj1PfsMgQrYhR3kjBQqQa+AHy25kVJqSnaeK8jqCVIGYIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYw+vp4Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYw+vp4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789072661; x=1820608661;
  h=date:from:to:cc:subject:message-id;
  bh=LYiQPUIDOR0DaQ2jKbF56lJzIT4y3IEs3CCXVly+uJ0=;
  b=kYw+vp4Q4m3NpxOzUhX5/GptAzR1P6xVV0eigjwmUGq53W4xQ4ID56i/
   GODCClEwlJK9VskLuDAjwtNcpbkaFObqaStHZ89DJt5gw6aCSqIxB6bsI
   WCrJBCbHHz4CBOofmlQXa7Nfwr6VlQMGr6S+yCwBukguEKhzBslKIbKUW
   XqzbUmYhCMrQiGE/YHT/s5Wqw16cQSdS3yPVvnA3htMSlPxUUTl6bc37t
   vWhIPjH36yQTSSEjXAP3TFMEgT0XaUvy+RFmbD9lzka/SRbU88a13Icg8
   iUVpmVvR+idsh1HdF3o/Eh1IEZAvjl1pN9yaulVdUzgWq7I0EATkzM16B
   g==;
X-CSE-ConnectionGUID: hi0TfHEbT2CFSRqE6DP+hA==
X-CSE-MsgGUID: GmEz/dkVRxSiPnMSfDOEVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89374550"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89374550"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:37:41 -0700
X-CSE-ConnectionGUID: tDxSLhUvSU2y+KeJQ5yuGw==
X-CSE-MsgGUID: 0LSKHmlkSKqWBVTqqsyjtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="273675725"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2026 13:37:39 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4lWa-000000000Ul-38jy;
	Thu, 10 Sep 2026 20:37:36 +0000
Date: Thu, 10 Sep 2026 22:36:55 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 7/7]
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c2a00
 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
Message-ID: <202609102217.mI0VPv2Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   121ea1ece9487e8deae20bc5a48794afa81424c3
commit: 3e6cd0c43cdf678622c19210bd1a70b04c8a79af [7/7] arm64: dts: qcom: lemans: add mdss1 display device nodes
config: arm64-randconfig-2054-20260910 (https://download.01.org/0day-ci/archive/20260910/202609102217.mI0VPv2Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609102217.mI0VPv2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3e6cd0c43cdf ("arm64: dts: qcom: lemans: add mdss1 display device nodes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609102217.mI0VPv2Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[322, 11], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[322, 28], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[323, 11], [323, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[323, 28], [323, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[323, 11], [323, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[323, 28], [323, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5143.28-5206.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5227.28-5281.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[322, 11], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[322, 28], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[322, 11], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[322, 28], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[322, 11], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[322, 28], [322, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: phy@220c2a00 (qcom,sa8775p-edp-phy): clocks: [[316, 11], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: phy@220c5a00 (qcom,sa8775p-edp-phy): clocks: [[316, 28], [316, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[435, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
