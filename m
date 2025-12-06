Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9F0178372
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765008364; cv=none; b=s1jif2kw2a+4gzglh0vLSvaMhc1iQ4NxX7utxzo+Zn33ct5H680VA6FQG45xrlX4h+4uzRBv2BcyEwSOzD/o2Wr2DWbCCsXk+0TwlA88V9pEwAjtQXbszSpM2DjziR+5DmIgkmCoA5V/4EwH7xVmOAMzhHs4FdJoDDJ4jBBdrDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765008364; c=relaxed/simple;
	bh=5/4jziU7MUqEkNDMW8kGesO8i4akxEqYHNEQGz35cVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YNzILb5xxsXISaKoRZTVuixjUOnY+/i8G6E2RE5GMOxQMo4MP9FLkE5JN9BdSKzGoLEWLRmOG43U9l0ovDdGUbhuScOGQTkFSuM/XzEbc7QrSKQmpGI6iGsZYXI41do/vvZInODawYb8bRYm8MHfJ/xu2utFaQBztnBf2RGo4BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAVpRmhs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAVpRmhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765008361; x=1796544361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5/4jziU7MUqEkNDMW8kGesO8i4akxEqYHNEQGz35cVo=;
  b=mAVpRmhsrpGbBYPopYpKiHxmq2LBS2D+idlpQZv00GBJLbbG8z4SUdw6
   C+n3tfkbfDaOAMCJtghIYlXV6PiTWMqw5FF5qZEHBnZhV+ZmmMr/NUnUS
   W6c9ePRTOogSBtd4s4J+71vF+xOB3tcjcD53+6XY23v1dVVu5yvHKJLHy
   lxinrEsuDiTzKzI0A+uP2umZT7gYMguWnbsMcEKXAfBKT+4XtFc5w59XH
   iJgBqTqddC3VV1SmqtNJQhAL4wSUMEBK4UUmiFydM2CitXai68uH97vG3
   L5x/a++HxlrkwppmAv2nKyPNRO07JcjiF36awVnfjv0mRHHYVCfeAcb4D
   Q==;
X-CSE-ConnectionGUID: cnAJPhcoRgCuDuiedRd8aw==
X-CSE-MsgGUID: /aa8IpWxTx+a3g72kypezg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78146346"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78146346"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 00:05:59 -0800
X-CSE-ConnectionGUID: xB61rqPoQO22CkvBPFdCIw==
X-CSE-MsgGUID: /LDE2vBWRiC6y0rTQqxxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="232859520"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2025 00:05:58 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRnIi-0000000014T-1K3S;
	Sat, 06 Dec 2025 08:05:56 +0000
Date: Sat, 6 Dec 2025 09:05:18 +0100
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 9327/13567]
 arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0 (lg,ld070wx3-sl01):
 'power-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202512060940.3Yxlu9aa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6987d58a9cbc5bd57c983baa514474a86c945d56
commit: 88a18859791e7217c6ddf849bbf62484b9250bd2 [9327/13567] dt-bindings: display: panel: properly document LG LD070WX3 panel
config: arm-randconfig-2054-20251204 (https://download.01.org/0day-ci/archive/20251206/202512060940.3Yxlu9aa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2222cfe7e11ff3e0434bc696856629199ef0da7c)
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060940.3Yxlu9aa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060940.3Yxlu9aa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:764.15-774.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0 (lg,ld070wx3-sl01): 'power-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0 (lg,ld070wx3-sl01): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0 (lg,ld070wx3-sl01): 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: dma@6000a000 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
