Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08E31B8EB3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725042210; cv=none; b=Ce7sG1R7CQIix0D2KkKrkqHf1qgG72zWkGFn3u2/hXSMcF/UfHOu40NURc/kqYDieAX8nZeOXZBSx/DrQN1i5dntc6P3zwL4m+Sa3+zZIV8uwlNVdHW7YAl34W8sumsbU4oZ/jhw3+t3YlTXjf+o65AdqQO+jE8+e3Od07LPlZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725042210; c=relaxed/simple;
	bh=0IMjd9AVYbS2XhMeFU1dMDxjDRwiz1/Iy4dYwy3Qj/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ayun6m6oLIzEsXKKTRT61fe5g/KYjlPRejPBbX8p0G2OV+L0OKjCLzD7GPyGrXj1SGe1zNxkSRiElEpKkBVGEjh3fjyVDoUEcEj1yNEgQFR9fdGLbdfxd5LcOcSHzaDIVBcL1KweyuNfaPgHpWHXQRB23SGqYuOXmUj75NKWc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVfST5N4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVfST5N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725042209; x=1756578209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IMjd9AVYbS2XhMeFU1dMDxjDRwiz1/Iy4dYwy3Qj/s=;
  b=fVfST5N4ZGvScDBkTSwQr/1hL6gw+zpIcr9dJ695Kuc/QpR0FmiOJcYh
   pdTMBRHAoRZdLaFc694h8CQeludVnvFj456KThbppI8OCnUmojdD+wKCR
   FRltjh/SRlmJnEH4CaDHYhYudXspJZqzRhSfsc6AKykK8C1ifhVmWf2xz
   trdJIigr/AFnRmXBFgVkr/zd8l2ixFDO4X0aM2H6abJ2Npp2bMj8JIGK0
   9rj4Zm0QnS5O8jzS/Y0WZwTuHjb349WTOzDnvbM65FGj4Y/DL8bOaGSeV
   Rhwy1/+qptPfLDAhbuUMUaR1EQEKhtqjmRu3M6Iobc1e81BuWbSXmae8c
   A==;
X-CSE-ConnectionGUID: 2UZLh/oWRZCyeKqUutKTWQ==
X-CSE-MsgGUID: i2E1M0UuTYaxZZOb+vGP6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23559827"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23559827"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 11:23:29 -0700
X-CSE-ConnectionGUID: Sr5CiSyXQfq9/cWoltAZcw==
X-CSE-MsgGUID: FiIZmFkyQ96ZAx5gYcoujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="94705993"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Aug 2024 11:23:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk6HM-0001qo-2L;
	Fri, 30 Aug 2024 18:23:24 +0000
Date: Sat, 31 Aug 2024 02:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 7676/8126]
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: video-codec@fdb50000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408310237.k67m7tQn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: db1dcbe5f752d423421f77d54d246398b196f670 [7676/8126] arm64: dts: rockchip: add NanoPC-T6 LTS
config: arm64-randconfig-051-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310237.k67m7tQn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310237.k67m7tQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310237.k67m7tQn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: regulator@42: Unevaluated properties are not allowed ('rockchip,suspend-voltage-selector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: codec@1b: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5616.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: sound: 'simple-audio-card,hp-pin-name' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: vcc3v3-sd-s0-regulator: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
