Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE4F360
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735225051; cv=none; b=TUfowqxthjs6/xTHecgtWyrDugw+WMUQWArM78IvxYbVsXsfERkxJPItXsLLUeXJyGb8yvBvL2AigtYNeFHgqtPHVcaOj2HefgXlIhtxpfxHrPYelUJE5ykZLfLP6ab4JaxIMGUUXxxA4531vjtMErOjcMa2rPejnbgiidtjuj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735225051; c=relaxed/simple;
	bh=FV7IOvHDpNn+DgGtHsOk+pmKpWIT3fqzLW1CrNKuZbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Woa7mq4kH7T8tnfH3Hk3UL+Wz27F2alSZyWqh4Gnw589VYH8EPgKPO4yFIpfrvyk/khAiM0sQDsNkhwLHMXa/hvdfl7fJUl6pu1nNPjxMKpIYA53nh9BR8D/ylucq2QSmhglX0h613TkJtMiW0MTBubheD9kO12YJmyhbTfPFfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZAvmdmc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZAvmdmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735225050; x=1766761050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FV7IOvHDpNn+DgGtHsOk+pmKpWIT3fqzLW1CrNKuZbs=;
  b=eZAvmdmc9OXJfIAVLVc3yTagp3xL4XW7ko5Sw19VktrggHkXM8ZOmlf9
   d12CyvOSJrLpWltBGK8L8C0vrOkNCC9NitR7bOL6MGYM9kiHglLtZ4UFj
   4Fi4awLvNqr73kYRJBYJjh+GLZe4Y/Vv/ZRqy/Fe6SPC3cjASNUOQhPKh
   BAkjA/M4aqSSbXHjyi2QRDm8F3Fzrwdww9iW9o+cGrqQ49GNPyPRYVFbS
   06PIv3VoJH34fryaE41LPASz4tEEh7rBbiIfE7fKw9of25162sT9hzQdt
   VwnSXzqUo0HLMq+i96BFatiyE4YPiJUlvh1JMq386eHM3aUmN5EkjmLQL
   A==;
X-CSE-ConnectionGUID: dBI3veWiT++PWBrDIQm1uw==
X-CSE-MsgGUID: PQzMOp5rR6WuaVMVn9b8rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35781026"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="35781026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 06:57:29 -0800
X-CSE-ConnectionGUID: jAMzR7K5T4KBp92Y6NCl+w==
X-CSE-MsgGUID: HrT/ZSn+RlWSujEBdmIF4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="99768973"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Dec 2024 06:57:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQpIj-0002dr-2S;
	Thu, 26 Dec 2024 14:57:25 +0000
Date: Thu, 26 Dec 2024 22:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dtb:
 /soc/gpu@13000000/power_model@0: failed to match any schema with compatible:
 ['arm,mali-simple-power-model']
Message-ID: <202412262242.s4bKDj5L-lkp@intel.com>
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
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241226/202412262242.s4bKDj5L-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412262242.s4bKDj5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412262242.s4bKDj5L-lkp@intel.com/

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
