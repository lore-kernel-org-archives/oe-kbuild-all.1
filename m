Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB690139D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858062; cv=none; b=WOjgbHjL9VceZaO712uKg3zwvBQ6kdh9bxCkBZ/fgPYxvSL2Q5o+n1kzRpKvAMobXW+QqNYBFYBna6DabztoLZ/GFJperE1oEzvdDwsUYcS8ygiBG1XnLN9PtFZArrGMorZl/3Os3lPnJg6Ph4tnyIcPpNIINpSGV41xs47Vyzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858062; c=relaxed/simple;
	bh=bCG9LncC3f39S84nzAf89WU9pesbUKJkqzbfMW8N2VE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gbmocc2TdsjkDAuYuwn1SxqUQnALJHWXfyavKZkM3ifx3EG9RsRP5ZYtC57cGmnusIO9BRiG4dzj6188W7WzaUgHFB61Xurk96l5afR/Rm4zCAJlkvW+6YyxN4jF/REIHlpxsHA4VHI7VkiGpFagAGpzop19LW5O7RKfkScm6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yd2aC5YB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yd2aC5YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756858057; x=1788394057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bCG9LncC3f39S84nzAf89WU9pesbUKJkqzbfMW8N2VE=;
  b=Yd2aC5YBKmtnjo0+sbnzBQssgM10iQ+2bhROmeHYhDO6Bu/E2JQrJZXS
   wyho9XBY6wj27Dv9x0v5osSpZOPZrZZq7ZgkfDMBynuOz6QsiRzwvHfly
   dmvfFaqCSaahLozooi36vmHcWnXvZ84og4nKQc0SSklB7j4oxWb2BQthc
   oG7wkiZygsMa4mhMDjwXyB1ERy9PIUOqGun5ALWbj3K9q2Sk7doQSJsmJ
   2cwYQj5KsvOBm+h/6WrjNR3fj8PdUXpXbVbf49qtcbvnRwv3MJvEgFith
   SCbLGaFVoxavj1PIEE9jiUqRulMV9MqQgDZ1b7NB/ehQRd04ucaxQd3LW
   A==;
X-CSE-ConnectionGUID: +HR7ovNCQRCJ/Q2utKc1TQ==
X-CSE-MsgGUID: OtKR4HHfSAeQ53OSM0hO6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58190958"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="58190958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 17:07:36 -0700
X-CSE-ConnectionGUID: QkxmF8QJSmioXzdauYKOVw==
X-CSE-MsgGUID: uAOpO49OQ7+I07mGzmb7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171582503"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 02 Sep 2025 17:07:35 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utb2C-0003N5-1o;
	Wed, 03 Sep 2025 00:07:32 +0000
Date: Wed, 3 Sep 2025 02:07:20 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: dma-controller0@14001000
 (mediatek,mt8183-mdp3-rdma): iommus:0: [96, 6] is too long
Message-ID: <202509030202.FfsCB8s3-lkp@intel.com>
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
config: arm64-randconfig-2051-20250830 (https://download.01.org/0day-ci/archive/20250903/202509030202.FfsCB8s3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 19464d951a93f48fad7332d59ec1e2f1d853c777)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030202.FfsCB8s3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030202.FfsCB8s3-lkp@intel.com/

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
