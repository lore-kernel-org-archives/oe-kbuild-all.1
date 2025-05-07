Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A03A218EA1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602016; cv=none; b=HKzx/X3YXPTr1Af0vy8cnOMVk+/xHmBYCZMRhBbFvwm1gc/tZ1UnXILMQl5h9HEiRY/FxydBKStk9k4hC0mzTRsZnlaMSeG3nMnr/1zclauDcjCSlpj3jcw3LPUZIYSNSsufaUxDIFOuGab0dYluNXJOjIULC82oFCJtW3SfzHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602016; c=relaxed/simple;
	bh=aFp3xn8vD5GRnmEeIdFnixJ5V2+j6rNa20IC+Xjzolg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7LIQ0TuU67BoFYMzDztAFMhIDPJSzoGmzjFG1Q1Ke77asE7a18hq/TaXGAfi78IezE7KEPwG3/FNHED47+F855clYdt+H54GFMOAPvtnsyruNPj5aSdfXC9W/+ja2oKiT3eSAzdP4pRsSAzrIvj2ZItLziE1vaxKzfl21zJkA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDphxJKy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDphxJKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746602014; x=1778138014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFp3xn8vD5GRnmEeIdFnixJ5V2+j6rNa20IC+Xjzolg=;
  b=JDphxJKyuQ8Jak148R8kT0bPeh/eHRfMFFNSwMWcn4SLOwZ1ZBzMgRCR
   ZpVDoFrx988CRV/1/0n1r7+ABdmmaJ0Iam2gtL4fclsbvLuRyonDAwUIX
   KUTXK1t9F/54EgdTjR5s0El0aaQn16F7+eIkuL1U3OCPqF/nQjkmVKAlR
   Dbu8Dj1Sje4uNkaR+HF3qH1Rs+sK4Uha1Tey0d0ULmjdftKSwNiquqdMo
   cUuO4TelSjjJVnnaR/ZQuf69pZNEIsz3DzxPlntTgsXFQWx1+lUgej6ea
   fJ97JEkIZlD7SuGHmWKwx2wtMssRqbWUOqUCOnNM7vppcGlbzDgvvkW5S
   w==;
X-CSE-ConnectionGUID: fRhOjwOISbK/3u4vjgfrYA==
X-CSE-MsgGUID: MlOUOiOxQEisopWvu2hlXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47562640"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="47562640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:13:33 -0700
X-CSE-ConnectionGUID: ZqkOuNl4SWCp5z7n8AtZNw==
X-CSE-MsgGUID: jzDSEschQRC+GinjOqBpOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140983396"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2025 00:13:32 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYyA-00008U-0B;
	Wed, 07 May 2025 07:13:30 +0000
Date: Wed, 7 May 2025 15:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: ec@0
 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required
 property
Message-ID: <202505071552.XagMzj6E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   30abd607a3ae1471331390c09e0379cac9b65ebf
commit: 2e12082bfc7fdf294a0bc13422c30fe845a98066 [1/1] CHROMIUM: arm64: dts: mt8186: Add voltorb board for mt8186
config: arm64-randconfig-2051-20250505 (https://download.01.org/0day-ci/archive/20250507/202505071552.XagMzj6E-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071552.XagMzj6E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071552.XagMzj6E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: rt5682s@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: rt5682s@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: rt5682s@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/spi@1100a000/spi@0: failed to match any schema with compatible: ['mediatek,spi-mt65xx-test']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/lvts@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/svs@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-svs']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: ec@0 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: ec@0 (google,cros-ec-spi): typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: typec (google,cros-ec-typec): connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: typec (google,cros-ec-typec): connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: connector@0 (usb-c-connector): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: connector@1 (usb-c-connector): ports: 'port@0' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: usb@11280000 (mediatek,mt8186-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: usb@11280000 (mediatek,mt8186-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: efuse@11cb0000 (mediatek,mt8186-efuse): Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: gpu@13040000 (mediatek,mt8186-mali): 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: gpu@13040000 (mediatek,mt8186-mali): sram-supply: False schema does not allow [[130]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: dpi@1400a000 (mediatek,mt8186-dpi): Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: dpi@1400a000 (mediatek,mt8186-dpi): pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: dpi@1400a000 (mediatek,mt8186-dpi): pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: clock-controller@15020000 (mediatek,mt8186-imgsys1): 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dtb: vcodec_dec@16000000 (mediatek,mt8186-vcodec-dec): 'vcodec_core@16025000' does not match any of the regexes: '^video-codec@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
