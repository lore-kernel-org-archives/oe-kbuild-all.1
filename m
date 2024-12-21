Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA01A1C32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 18:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734805533; cv=none; b=HCu7W9//V6hC8oDZDenn/T/vOQnqGvqskWbBBZ1DalXBcMt1z2kQm+hgbnIZ1Zv46U10t1+MooyM5rnYvYeWjDFmMw0nsYTKOFD1Sjq4956z/E7oTagC2QeWVSKKMOaQOp3lZYuJl113nqU2RQ5lzatk+pnf3hdTjstOvHFRrnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734805533; c=relaxed/simple;
	bh=3sq85SY6cUojT7cDTA3QFyrumCbKyrYejnjNNI/XwZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eMmMmFyK4+1yyTlYjfWlKIOSt1xHGbQtgN0F8qyz2AJECWYD9nHPFzFj16RL7TrA9fRCo3AjudY/yO5wsIFh5BjRM+7rcCnhzvvh2t8qAOMbhiHCr6DS1Bgt0AzCHzrBi8JWjITWl+eaDxasAmPWpYFtdH8Pfvzglm9NZrDyHlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6Mv5/QK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6Mv5/QK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734805532; x=1766341532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sq85SY6cUojT7cDTA3QFyrumCbKyrYejnjNNI/XwZ4=;
  b=g6Mv5/QKapYtRVS1RFvPFrFop2zLHWNHijJ9I21CoKTNub3OqASnoEo6
   LGwpXHD6fTB+e4g5XiLyQWoCSEjkhiigGRRaPF8Z7G25GqTrFBajX7gti
   mr5i1j/UcFnMUREMNRZ565vhNje9olH04Bn/zpPITkaU66UKAJqwJl824
   fkPsgk0fkVwFlAP3oCx5LmvZ/JiTfAzspZp6mQ3tK+Q7TplRpZ4+ghEa+
   5z7kmxK35nlkRjvH5dmIdp14YeC3ILy6aRKeNlsdWehVgcRnsyHRo30AT
   vn7ODR0rpTux6BDDC9GRZSt21fZQTkbN+odLSNWOyrxZHwQa8b26sa0qB
   g==;
X-CSE-ConnectionGUID: m96Uia6vSwqaTU8kKQPwoA==
X-CSE-MsgGUID: uDWOXF9mRUWmgBwEni7kpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39109474"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39109474"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:25:31 -0800
X-CSE-ConnectionGUID: ZVid1wclRKKbagFucmQ6Qg==
X-CSE-MsgGUID: Ir69oiqcTxyB3UWB1DaKTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103431928"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Dec 2024 10:25:30 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4AJ-0002OH-2B;
	Sat, 21 Dec 2024 18:25:27 +0000
Date: Sun, 22 Dec 2024 02:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 435/540]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c:
 Unevaluated properties are not allowed ('hpd-gpios', 'interrupts',
 'no-laneswap', 'port' were unexpected)
Message-ID: <202412220224.eDqw0StX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   76e007709ba23b69273c6c8ed1a893c1ec7b7df7
commit: a5f8fb56761362c50e56e27932041138cff8d5d2 [435/540] CHROMIUM: arm64: dts: mt8183: Add kakadu rev1
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241222/202412220224.eDqw0StX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220224.eDqw0StX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220224.eDqw0StX-lkp@intel.com/

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
