Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E123183B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757200333; cv=none; b=nPyuhxvk2W/Tp6zLyhcBTactVwiOS/E0ZJQRAOUadS+m4MrVA84njQbpKhldAF8R3fle6GNNB8XlaswgdUPF3s0zmBsM1RXVlxYnXcYABozJM8t0Pi2B6HXVF0lA8m39picGEvHEzSkwm2V9g07J2nB+h5ZgD0Fn2/1TTbN4d1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757200333; c=relaxed/simple;
	bh=l/rv9GcwTySlTLQkSfRN260v/fkrQxUP2NGmU068VPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tm9nciF+qQA1e4WY+JqlVWQ3EXqcV1Wa4dR8sSYbQPPaqLykTrsjPNtdYhkMyma74x/ypv7VIe/+cq61XhrvN4XQ4H6kulzwvwFOuh6beYUETLigz07Qv6WExdMfCuEZe8V9UXTAXGW6HBcWAgd3cZI2qjBun2N+nv4PHYMK5/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itgH4QBl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itgH4QBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757200329; x=1788736329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/rv9GcwTySlTLQkSfRN260v/fkrQxUP2NGmU068VPk=;
  b=itgH4QBlk6+ZPpzPsDTzWy+IqMh5uq7FuSEJpIrXEFokMYEKNM292e7j
   k/f9Uu8Rlq7EEvfVEV9nl3+6pYh50CbbKF28cus6dpMEEET97l/LMu7E8
   1SAHmVlOvp1PUPi146xKYnyRD5Ea4nQOjBZ9idVCepPScFs6Br4zXFpZL
   TR3JcZxVzwr1YeJZsRWtPZdSS76k8aO8UbnQB1tUXMP0+l/NZVvXWWnlC
   B2vjdcS6bIHcPhL8nBcDnuCZDIV2JfL5dBqVOHZ9SKqm6bK/HUaYupAf4
   QmaKG+mo0HL8VOgQtBwgLKiQJHKujuYgWvI6UJXr/jOL2eGhu+6MIti+x
   w==;
X-CSE-ConnectionGUID: CgU9/HvdQB+Ygs/WyG8Hpg==
X-CSE-MsgGUID: Blu/ZzBIQBKWB9z1RTdxTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="59652335"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="59652335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 16:12:08 -0700
X-CSE-ConnectionGUID: HGssg/d6TDi+G5cMEdMy5A==
X-CSE-MsgGUID: apE8C3xHT7CAynkwkuOT7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172903846"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2025 16:12:06 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv24h-0004FD-3B;
	Sat, 06 Sep 2025 23:12:03 +0000
Date: Sun, 7 Sep 2025 01:11:42 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller0@14001000
 (mediatek,mt8183-mdp3-rdma): iommus:0: [96, 6] is too long
Message-ID: <202509070122.PeCECmHx-lkp@intel.com>
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
config: arm64-randconfig-2051-20250830 (https://download.01.org/0day-ci/archive/20250907/202509070122.PeCECmHx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 19464d951a93f48fad7332d59ec1e2f1d853c777)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070122.PeCECmHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070122.PeCECmHx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [96, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [96, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [120, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [120, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [120, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [120, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: da7219@1a (dlg,da7219): da7219_aad:dlg,jack-det-rate:0: '32ms_64ms' is not one of ['32_64', '64_128', '128_256', '256_512']
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: da7219@1a (dlg,da7219): interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [122, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [122, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: da7219@1a (dlg,da7219): da7219_aad:dlg,jack-det-rate:0: '32ms_64ms' is not one of ['32_64', '64_128', '128_256', '256_512']
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: da7219@1a (dlg,da7219): interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [122, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [122, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: da7219@1a (dlg,da7219): da7219_aad:dlg,jack-det-rate:0: '32ms_64ms' is not one of ['32_64', '64_128', '128_256', '256_512']
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: da7219@1a (dlg,da7219): interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [122, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [122, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [120, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [120, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: da7219@1a (dlg,da7219): da7219_aad:dlg,jack-det-rate:0: '32ms_64ms' is not one of ['32_64', '64_128', '128_256', '256_512']
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: da7219@1a (dlg,da7219): interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [122, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [122, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [120, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [120, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [120, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [120, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [120, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [120, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [120, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [120, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: da7219@1a (dlg,da7219): da7219_aad:dlg,jack-det-rate:0: '32ms_64ms' is not one of ['32_64', '64_128', '128_256', '256_512']
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: da7219@1a (dlg,da7219): interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [122, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [122, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [120, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [120, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: da7219@1a (dlg,da7219): da7219_aad:dlg,jack-det-rate:0: '32ms_64ms' is not one of ['32_64', '64_128', '128_256', '256_512']
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: da7219@1a (dlg,da7219): interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [115, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [115, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [112, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [112, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [112, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [112, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [112, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [112, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [112, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [112, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [112, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [112, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [112, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [112, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [112, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [112, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dsi@14014000 (mediatek,mt8183-dsi): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: dsi@14014000 (mediatek,mt8183-dsi): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pwm@1100e000 (mediatek,mt8183-disp-pwm): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@13000000: failed to match any schema with compatible: ['mediatek,mt8183-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): iommus:0: [91, 6] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dma-controller0@14001000 (mediatek,mt8183-mdp3-rdma): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: mdp3-rsz0@14003000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: mdp3-rsz1@14004000 (mediatek,mt8183-mdp3-rsz): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): '#dma-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): iommus:0: [91, 7] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dma-controller@14005000 (mediatek,mt8183-mdp3-wrot): 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8183-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: thermal-zones: 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
