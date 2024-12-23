Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CB31B0F27
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734972970; cv=none; b=qH0yhoOYHh3VZlIFB3xxeZgs/Y2cyBcbsAhSvzhm4HEE/9IjtcuFChAi8xQ9rZyoqaKNx51OnI/s+7RFsqtczDx7T5iqFOuBRgyMWcjhezRx2SLAFdYqdDLdMeQfnoNPq3DuUBdXQ/0Vs5iYphw3eCC3WhglF/FdMxTuVSrf5Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734972970; c=relaxed/simple;
	bh=z6+yF0fw6jvRFr4JTxerhB9C/QK2WIApd9vbzuXeSGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFKvzh18GH5yTGRKYP0+m4O8XF6UVwIeqFzPNXRqyIFUn1tKwJRZT48X80JfSuxorWlSrfM2AiuOqdU5MTt7ooJ2bLLvFk31GpltguYNnKd2d05mkHj1vkTiiKB7kexaj5LsUEW6dTQyJhni206+jvDg/TMD/tq5htLN/mdlOBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/ovblQ/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/ovblQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734972968; x=1766508968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z6+yF0fw6jvRFr4JTxerhB9C/QK2WIApd9vbzuXeSGE=;
  b=Y/ovblQ/14u538TKZkNwKOGiFqczdcgxmXi56Qkby9L3KIbqw5RX8E6J
   0P8h4DGeGaky1Sx4Cyk3p7lXnBxrLCBscILXyT/VDbfjqDgJQxcWwlcs1
   rBGIiH52eUZYGC6+uC1/9pmaWEjiKYQzsNfVOTSrEhsXbM7hPThdciY2G
   imRf2uCLtiKY4YWpc0bBVfjP8c5KKhvyCbxcTY42KVC+CcZcARLNyWtSy
   gayk7px8mI5BRSiKaAR2P9vS5Aszaiae0NwJuJOgMbF8JS+6eEhypTEk7
   r+nJppBh6WXHtmvwhg07Sv8UX9tajqBb7610p6Qxh9lgBcyH297R0bpKP
   Q==;
X-CSE-ConnectionGUID: 9ugfV9GtTT2436cfXtX9UQ==
X-CSE-MsgGUID: KER2p+bSTkiZG6f4CfTaHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="34715903"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="34715903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 08:56:07 -0800
X-CSE-ConnectionGUID: sLi+TnIjQt+tXaTpb/LUhw==
X-CSE-MsgGUID: thXISVnORQuESsXMILwnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100098446"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2024 08:56:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPliu-0000UV-0X;
	Mon, 23 Dec 2024 16:56:04 +0000
Date: Tue, 24 Dec 2024 00:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c:
 Unevaluated properties are not allowed ('hpd-gpios', 'interrupts',
 'no-laneswap', 'port' were unexpected)
Message-ID: <202412240059.7TYOSPlM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   8decd833dcf6e8e368c99562c3437b9113fcffad
commit: a5f8fb56761362c50e56e27932041138cff8d5d2 [4/4] CHROMIUM: arm64: dts: mt8183: Add kakadu rev1
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241224/202412240059.7TYOSPlM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240059.7TYOSPlM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240059.7TYOSPlM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
