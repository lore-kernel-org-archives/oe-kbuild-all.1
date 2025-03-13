Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE32269D15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881485; cv=none; b=bspSSRnUCNbLPE75063Up0EIYyDetcUV8Hx3f8bJFJZiGlRrUZZO5EBjR28qMl3eVSGt5rnndbopmUXWD9DqXAuHUKF2d0JQtjTD8mvzia4aBcaxVjX4UbPby6nFQtoUoPRfU6mT0CCsIWJpipuTExNxfSLUUFk3VxgBeusNzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881485; c=relaxed/simple;
	bh=UWI2mZUoYrZ2Ib9+3PEl6csbO+83Wp58PPTRnIWYATc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LCFVzS48EZAxBit5Fi70a7puvKvf7tdliNwquK63Jw0dQfnI7AsXKWYyL3xL26IWvau9JGs7O0lqL80gI5yhRXBXV0BbvkvNwvaZvc+MnzM+rm9GG2ZFKhgOZkSUxij3TWBchH8nrSRA07EGDi5rcGUaeHpf5f5w92hxjRIG3bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLzIwphs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLzIwphs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741881483; x=1773417483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWI2mZUoYrZ2Ib9+3PEl6csbO+83Wp58PPTRnIWYATc=;
  b=VLzIwphskt4Hi7M7lJMilVdG3lp/eugb0Wr6adcPTCS/tfGLfPr8hK/M
   d5zrPQ8BZEGxL/dkrRdOiy5HqbanbqR9NQGleEnGQLqhAgHxjzDOD8OJF
   imD1eiqC2kLSwOZ9ltWNxWzA6Cr5tzeGbS59gx08nfWlzhuS7wrkOzU/G
   Fysg3oM86HDIzMMGo0Yww1b6fNQhYl71l/Bio9SSdVfZUjX0F2J/ByFS2
   feESozd+QLzcJhzPcZ/J+8jxFwpE9kQefei3HVZW+BewIBddA1z9NgS3q
   2nb6j/wTqfilQKgil+T8sA1tvrXSp+/I1vP7c5mdoHFTVh1yXYuy/XKpo
   w==;
X-CSE-ConnectionGUID: Qw4rtHUBTP+Y2tpsmvsDyA==
X-CSE-MsgGUID: kCa6cgh3TMmc3RZ9HFDC2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42257597"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="42257597"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 08:58:02 -0700
X-CSE-ConnectionGUID: XRQ0ffdnR+Oyb8LcL8bGvQ==
X-CSE-MsgGUID: jDjG5yutTdu3raUH5mCO4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="151854557"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Mar 2025 08:58:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tskwY-0009cI-12;
	Thu, 13 Mar 2025 15:57:58 +0000
Date: Thu, 13 Mar 2025 23:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/1]
 arch/arm64/boot/dts/mediatek/mt8173-evb.dtb:
 /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with
 compatible: ['mediatek,mt6397-regulator']
Message-ID: <202503132316.LKaAuYUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   2661fce760b4ab8bbe86b9b6e95f999ad83115e1
commit: ac8ab6287a3b8769241d32a2ef0859c2a54aacbf [1/1] arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
config: arm64-randconfig-052-20250310 (https://download.01.org/0day-ci/archive/20250313/202503132316.LKaAuYUD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503132316.LKaAuYUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503132316.LKaAuYUD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/syscfg_pctl_a@10005000: failed to match any schema with compatible: ['mediatek,mt8173-pctl-a-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000: 'disp_pwm0_pins', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_iddig_pull_up', 'xxx' do not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt8173-pwrap']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/mt6397: failed to match any schema with compatible: ['mediatek,mt6397']
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8173-thermal']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: syscon@14000000: 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
