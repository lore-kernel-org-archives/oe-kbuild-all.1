Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ADA13C3CD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734861289; cv=none; b=HSn7FQOcGaNw91IHiCeti3FdYac9X6Ai5HWs2nKSzUGE+nzH0UcNn48FuddMfg1Q/zmQ0wh/4LQT3rukYUm+SHTb6cYpYusGukwn32KRmDNrvLWAw+Gb+jYCq492riRCiVR5CoPyaoGkNnC78F/mQkbnk+7h5BFXWCUfPzLvmj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734861289; c=relaxed/simple;
	bh=fzrKyHYMYt/oFP0yYNCwlUiDq+uQoe6gVCkmfJ32jmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZVDr06NBX3be2RaReutIojezUmxKv7JcIh1bwOEpYiEDvcNRs0wQbFMUfhpA+tOAP/QaWj2YEpQyzAwT4dTi6mGcPY1XmMxHUvnjj6nKIjEFSnzBr0xeEE0FqHeDe20ARiWM5ybq9jK0FCyXP2z/vPcnJRzP/a5TTmfqBN7tGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgjaH8gK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgjaH8gK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734861288; x=1766397288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fzrKyHYMYt/oFP0yYNCwlUiDq+uQoe6gVCkmfJ32jmM=;
  b=SgjaH8gKCBLzrF0n1AF/yiDT+ocDX1rb4WvG7eNTm1vulVzc5qd2l0Rw
   jrl5FQHLF9BMeST6vk0nhU4CAQgVi+HeoG2LjOWztwtVuIE5xQWDpzjyC
   zp15F1yf2PvIYEHA1Fy/jce96p3Kx8oTcmIZRXlKy8nceSEJ5encrEyuO
   xcI3D/AiBOapcj/FXnYqk++ABkIwyrdxIXMGOpsa6iBSK84r8wKs8UbEp
   jLV4rtnL1guYxJiltFU1TVZ5SXG4jkat7Z9FY2Ks6sOGeRU0cyn+ZUo9s
   VESRPY8A8tN8uZc0Xz+yP6K4mzr4iIAMDZFJCVOzakWt0Dlbo/dFPE54L
   A==;
X-CSE-ConnectionGUID: 12Bdfta2QEy40YUX65p9Pw==
X-CSE-MsgGUID: d+cH17KXTEiPA620ZRZ3ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34631893"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="34631893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 01:54:47 -0800
X-CSE-ConnectionGUID: jnj7Rc1xQeqfwzM02XbDcQ==
X-CSE-MsgGUID: 7Jprl3qHQ22HWgpP9xlVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98782920"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2024 01:54:47 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPIfb-0002pN-2t;
	Sun, 22 Dec 2024 09:54:43 +0000
Date: Sun, 22 Dec 2024 17:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 446/540]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb:
 /soc/gpu@13000000/power_model@0: failed to match any schema with compatible:
 ['arm,mali-simple-power-model']
Message-ID: <202412221722.QIIFwcs4-lkp@intel.com>
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
commit: e04f14bb4607c986e2d2919e776673bdbbbbff62 [446/540] CHROMIUM: arm64: dts: mediatek: mt8183: Add Mali power models
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241222/202412221722.QIIFwcs4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221722.QIIFwcs4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221722.QIIFwcs4-lkp@intel.com/

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
