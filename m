Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2023156C6A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772579666; cv=none; b=TSdVUlAke1DbtEEhST/VHGOvXC+dHguZphgxaQYAagaXz4EhMfDee3aWs3cuuNb9hAEfiM1LU/92XikVdp8/0BGgzHJbwJfMVhayHlggwCMMbNAMIG5sngN+lJIhMF2nk7Aa0jFZPGsYAFvQZttvlBnaTGKWhp2RVnm3JwwfbJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772579666; c=relaxed/simple;
	bh=yATibUvX58TBQeddcr3mpMWXvuORF9Oi15ii6jyxgds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AG11XaGaxFTvlJmjJCajq2r1ZXsUtz785Djb5U2jhSYtnP6rO/kr5zVD4HzA1hGpFJ92KXWyWdBKDQdHGXVR7A8IHbHiKLDCi1kskJSKMKYMv1JutoAmTC2HALz8K3Ugr8C0RO4KRjjQniwwZH5vekzNcJbAW4Rh5NLTLSU3LN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTGZO66G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTGZO66G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772579665; x=1804115665;
  h=date:from:to:cc:subject:message-id;
  bh=yATibUvX58TBQeddcr3mpMWXvuORF9Oi15ii6jyxgds=;
  b=WTGZO66G0IPw2nlJt8s901tZOGAQjr/iPzov6Rnhf4vxPVaYXG14HrFc
   5xVOzDRYUQO88YTXBbviMuJ5giyp7n8CAvskEwMSjTCpeAjughcME6fId
   OoAiAIZ36UAMQdLdCEH8Y7a7+WfI3hN2eSO1SiaktJUQkIg+lgD/i8RTv
   FsVIzVPTPgCCweMsJGf2YYmGCizIZUUsx/hPw03i2EpIv6hhAwWQWzVaA
   VhPieBy3XPON+/GzmzCTK9irOjEv3RZ8F1HcvRldqdZzY1CeeZPHZRtpQ
   heWpFGNIORNC4T6+DXJHrmqbtbsSQh/so7zO8ksSIkJ4vl6yMPK9azalA
   Q==;
X-CSE-ConnectionGUID: 4BE+sZGEQx+mFeCH/EvOWw==
X-CSE-MsgGUID: UPbZX95iTcOr74lKb1myJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99107322"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="99107322"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 15:14:24 -0800
X-CSE-ConnectionGUID: xHNR49F1R1G/ELl0vBQCKQ==
X-CSE-MsgGUID: 4JH9crKFQAqhUkbnFpxUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="218107026"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 03 Mar 2026 15:14:23 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxYwW-000000001Zd-2uNl;
	Tue, 03 Mar 2026 23:14:20 +0000
Date: Wed, 04 Mar 2026 00:13:43 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: dialog@48 (dlg,da9053-aa):
 compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
Message-ID: <202603040057.RD7PX0JQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   d8f2eda3a65a34273481d9d2a5b573235ffe1485
commit: d2b240f9a180ebd63477d0534633f22e16fe41ad [1/1] dt-bindings: mfd: Convert dlg,da9052-i2c.txt to yaml format
config: arm-randconfig-2051-20260227 (https://download.01.org/0day-ci/archive/20260304/202603040057.RD7PX0JQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040057.RD7PX0JQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040057.RD7PX0JQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
>> arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: panel (sii,43wvf1g): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: panel (sii,43wvf1g): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml
--
   arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
>> arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: nand-controller@63fdb000 (fsl,imx53-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: nand-controller@63fdb000 (fsl,imx53-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
--
>> arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
