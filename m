Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9F21FBCAE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358106; cv=none; b=I4cDF+kJT1C8Jf+RmJ6Ex9gkiu5q860tPtZd6qi70aMymuO7XeazqSs1H3HN1fIBT+YCGLnRT+pIR/0rjqtSb3fCUQn9EPkCxxrtFm/6WHx+ALU+H+QSRAsYNUYEdSj/6irA4Mg7jq3C5glZYebStYlnuXPiULykAf4csFZ8rWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358106; c=relaxed/simple;
	bh=R4KS/0swVDC75hYQ1Qbd3k0J8EtLHn72ukDNSFJczlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mB915NJHdLBp4Pxmsx7UEtr1uvqUyYWOmyjR9ofhwVKkKABG22B2K9MCGSZoYmxW4n7gUuLbD/G3Q4qQnCtUpOWzjfHe/uHX0DDpak2a0nTD08BCzvLlENNInuzMysiq3b171rtp5xQsYPXv1xR3zwWMi+QpOjalUgliFf/FqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rt/qWx6c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rt/qWx6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739358105; x=1770894105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4KS/0swVDC75hYQ1Qbd3k0J8EtLHn72ukDNSFJczlQ=;
  b=Rt/qWx6c5YewvREEkiDPgF0pg8bUULLekljmtlmJGGQt6k3XzKDdtIYH
   mmMPkGMR7JgaSs5KzCxmdz8j5mMUKiyuJ9ZtxzG0amTixa9cg+bTYqew4
   eRDbtHYsdW2q52CyUC/nHfd1bEnxO9bYVg3mJd4KURlp4rh8jGPWQjAoF
   kPpitcIT5f8oQgZLT5XUugLUo7AixsEhdEMZIjpi4dWh8Sb0l298YvKWR
   NJnBfIrDUQVyE7kvlIWI1L+To5UWj+SNkrdI4uUT1xT0XhJ2zDz1mYb0E
   23UkqH8UcafU842tjoNT4Io6RTeLqDKmd8Bge4+ShteVqAttVdRvH+79v
   A==;
X-CSE-ConnectionGUID: j4/XPefMRSO48TXiVraZFA==
X-CSE-MsgGUID: a1d7UzedQu27WQD/enOvxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51440410"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51440410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:01:44 -0800
X-CSE-ConnectionGUID: LmuB3CRSSU+RT1gtpVDeEg==
X-CSE-MsgGUID: q4o/oEZoQXmkmbJT916SmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113285905"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Feb 2025 03:01:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiAUt-0015XZ-2V;
	Wed, 12 Feb 2025 11:01:39 +0000
Date: Wed, 12 Feb 2025 19:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb:
 usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq',
 'ss_phy_irq'] is too short
Message-ID: <202502121821.OTd7CeOp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   ca2bd4512047d5e578de55a198ff889c4f4e4ada
commit: 5ed4030743416109df5fdb3a03a7865440949301 [2/2] arm64: dts: qcom: msm8994: Describe USB interrupts
config: arm64-randconfig-051-20250211 (https://download.01.org/0day-ci/archive/20250212/202502121821.OTd7CeOp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121821.OTd7CeOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121821.OTd7CeOp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8994.dtsi:639.28-655.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@f9928000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['ad,ad7147_captouch']
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/spi@f9966000/ice5lp2k@0: failed to match any schema with compatible: ['lattice,ice40-fpga-mgr']
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['ad,ad7147_captouch']
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/spi@f9966000/ice5lp2k@0: failed to match any schema with compatible: ['lattice,ice40-fpga-mgr']
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/msm8994.dtsi:639.28-655.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@f9928000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
