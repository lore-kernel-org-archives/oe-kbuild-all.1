Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2858D38F82
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735040993; cv=none; b=J8NNdG89IG90VjsrdfdqvfbgfDKolVP3G2S4hx1JqsmFTKwJZ3/WU0kp3OtCjD7F7Z97o9djPUPrIV565rjUe7epmCTNv4roktBiFV0OHWU1a1ki49PiqFoDc9qrEtOlJDw7OfFQEhkeKNQKO1Sg+R/Y0E2GhWQ/bq93PhJLrGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735040993; c=relaxed/simple;
	bh=JH1tOUcJqzAwi0d15vycJPkATVI3cMd7eGb1lzCb3tU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgdMJfULL1BxL2XoRBaQQ3IAB+Sl7OzqM4iaHnwI/HmL3Sy6DY0SpATe9lod44fWIrxT4u7/Ltf7kZgnI1PxEEeACgF4LtmyqxtEg90mlN4zcEOUgIfN1xm6O2DQJW7peLlMMa/dAXl1QIREP7WdHgm1VxnvWvpo+WjBvK6zIek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwoRaLoA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwoRaLoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735040991; x=1766576991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JH1tOUcJqzAwi0d15vycJPkATVI3cMd7eGb1lzCb3tU=;
  b=PwoRaLoACEU64m72BzEI8z3dGvclJBlH2hxjNTCHA86sgUM5dMh7Higr
   TukhnAanl6xpeMFPy2jv57QkKvV0mA5aibQimGuulTlETy7z4EM1YNHtv
   ficrL5+K1rrq8zoLptTeiQaodOxcoE7FpbAIAjDBvU4lvfZjFm4RZ+TO9
   p2l26F436ATbcL4lnG32B230ZB9SdigOZyI1Qvu6PFngFSKfA2V1N7ll+
   XaIKamfSuiDSt36QIWdJicKmD3i1vObxGq0M7J+HYcLjN/QGRaJWUw76N
   7p2fbCdJ9QpNTzybCVGCFGQCU96YqRF8Zz/UzvgokmuFm95l1bMLPffRJ
   Q==;
X-CSE-ConnectionGUID: 4UxcTjbdS4++pMprkdiWmA==
X-CSE-MsgGUID: sY6BGr0zQNGq6Es4JtIw3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46000652"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="46000652"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 03:49:50 -0800
X-CSE-ConnectionGUID: Ss5OayHwQwu41LtmPinZDg==
X-CSE-MsgGUID: +j1+yJiDS/uHlzE0FBis1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103564846"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Dec 2024 03:49:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ3Q3-00014W-0w;
	Tue, 24 Dec 2024 11:49:47 +0000
Date: Tue, 24 Dec 2024 19:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb:
 /soc/gpu@13000000/power_model@0: failed to match any schema with compatible:
 ['arm,mali-simple-power-model']
Message-ID: <202412241957.xyS7MHms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   811e48e07be5a00b2472cecba280dd56c8c200ef
commit: e04f14bb4607c986e2d2919e776673bdbbbbff62 [4/4] CHROMIUM: arm64: dts: mediatek: mt8183: Add Mali power models
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241224/202412241957.xyS7MHms-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412241957.xyS7MHms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241957.xyS7MHms-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/spi@11234000/flash@0: failed to match any schema with compatible: ['winbond,w25q64jwm', 'jedec,spi-nor']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: i2c@11d21000: Unevaluated properties are not allowed ('clock-stretch-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: gpu@13000000: 'power_model@0', 'power_model@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/gpu@13000000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: /soc/gpu@13000000/power_model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#
--
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/spi@11234000/flash@0: failed to match any schema with compatible: ['winbond,w25q64jwm', 'jedec,spi-nor']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: i2c@11d21000: Unevaluated properties are not allowed ('clock-stretch-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: gpu@13000000: 'power_model@0', 'power_model@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/gpu@13000000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: /soc/gpu@13000000/power_model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
