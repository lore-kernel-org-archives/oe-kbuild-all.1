Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A36B1B5EBC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737379338; cv=none; b=EF2yr710m3JF/lPp5d/tlP3acskEgUaH6h2eKDlwXMdtPBG9b40mMQGNM7nqEnIoPhTbZffMnXZwZwSEbAQMGGUGm9hHLbfS0pwm63sqewmcuiiWzcplCHQMTLaKxAWu8bsCgHjRFdPJoch+lrvtZulbaSB56MuH9wRtFRg+gjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737379338; c=relaxed/simple;
	bh=GTP9KZz+n+xJu6F6UU+mO/MuDMUyfX/gozwGZ0Pzr+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TuqrEWnXBVIBumNqlI5dsBkQolWZBLuBxgBR+5y9zMmNQlboq70YeBPRHo2Hfa2UMUBmBbBmY/UTr7HverYALF5uJ8zszQaB3RzYWU8Lvw5bRmfB3JOG+oXPLu4qZUDUoGH++b2naGFRW6G+/8cOUTVQG2uhthCvZxipw3fjsa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgM3Hbj5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgM3Hbj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737379336; x=1768915336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTP9KZz+n+xJu6F6UU+mO/MuDMUyfX/gozwGZ0Pzr+w=;
  b=NgM3Hbj5YrWdX/8/54PJs/MP3QpWqQNqWMKnNlfdWn6a3Sf73FDSVQfe
   HaNrviCJRNmgOoKgaOHOH/yfENsBrVKl1lYAerJFHy8EKYeFPUK4FDd5+
   LRPGtpGF43X4dDWVFU4SdiD9GsBBBJA/dRXpAUfiYbeD58XhjeGM85+ss
   XyfI97ETAslGekgrgl5dS+B62D9J3Xx4oQtGzqzhryVzZCigDZ3wgTEYc
   9PUCAmF/EyY3EvCxoYgfJnTPQosihvTj/10YX3eDiWK9oHYwr1n4OUS9v
   IcOfJy6NuiDncNHFgWUrSaz4v6Jt2Xv9pJNZFT94UvDIVQt2nc9qR3WD+
   w==;
X-CSE-ConnectionGUID: GZD3mKnYQCm03f3Q7Cc6yg==
X-CSE-MsgGUID: nVzPrkANRVi9yMpQ69N86w==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41699181"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="41699181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 05:22:13 -0800
X-CSE-ConnectionGUID: 6BN10VheQ6S8SMseI6Phwg==
X-CSE-MsgGUID: 3qRsKFYEQf6fdCHWkF9EGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="106641653"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jan 2025 05:22:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZrjG-000Wa3-2r;
	Mon, 20 Jan 2025 13:22:10 +0000
Date: Mon, 20 Jan 2025 21:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 333/333]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/pwm@16330000: failed to
 match any schema with compatible: ['mediatek,pwm']
Message-ID: <202501202133.LDirShI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   57406f61d18c1c4fd302b7f258dbf947062f55c9
commit: b30358af110519921ead8611c038f44a5fc63649 [333/333] CHROMIUM: arm64: dts: mt8196: add snfc
config: arm64-randconfig-052-20250120 (https://download.01.org/0day-ci/archive/20250120/202501202133.LDirShI9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501202133.LDirShI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501202133.LDirShI9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16310000: clock-names: ['source', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16320000: clocks: [[38, 32], [33, 56], [33, 54], [33, 52], [33, 58]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16320000: clock-names:1: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16320000: clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mmc@16320000: clock-names: ['source', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/pwm@16330000: failed to match any schema with compatible: ['mediatek,pwm']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: spi@16340000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8196-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8196-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8196-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: spi@16340000: clocks: [[38, 188], [33, 60], [33, 64], [33, 66], [33, 68], [33, 62]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: spi@16340000: clock-names: ['spi', 'sf', 'axi', 'axi_s', 'bclk', '27m'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: spi@16340000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16340000: failed to match any schema with compatible: ['mediatek,mt8196-nor', 'mediatek,mt8186-nor']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16640000: failed to match any schema with compatible: ['mediatek,mt8196-pericfg-ao', 'mediatek,mt8196-pericfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16640000: failed to match any schema with compatible: ['mediatek,mt8196-pericfg-ao', 'mediatek,mt8196-pericfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
