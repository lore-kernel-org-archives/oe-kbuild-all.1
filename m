Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F81DFF0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 03:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737515000; cv=none; b=ri5TIEjjHA85iQ5LUM1EyAF530OW7eiF952g5c0aWRIPBVCgS6QLij7HSYDIOP3+gqaq4oG3PWAAoIjDsB1+dFWJy2FjubB66/i0r2nBIiUEOpSFwN/M5qb4qmLBMI/Eibi5MEhDX3DhoNsThkgA/9ihO6wbwMTAJy1e1kTsqmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737515000; c=relaxed/simple;
	bh=XFQdGBAIrzG7fy5fEM7Jz7oYc8ENq6Q0Zf93Fv2oFNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BApuqH2jcOiCekbNsMNht54zZhmTPCpsd+/5CDk+IRyHlhCa+Mwr7y1njaDD3mJtqKNMh2q03FQTYUFi0LboGx6KebXfAbJLeUAiZzx+PHifxf+VcRQv8a+OQXFjDxyVJANFyYT97H8UINhXlWlPiy4EtZpJF1AbLV5y42VsqTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7CWDSpY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7CWDSpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737514998; x=1769050998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFQdGBAIrzG7fy5fEM7Jz7oYc8ENq6Q0Zf93Fv2oFNc=;
  b=H7CWDSpYEca0DRQ+fHP6E3Ccc7NfUWsbX++X3CBrG5kMocoI8IBa/M1g
   lruj1cXe+M8M1Xv6zkuWCJth+cjPv2rj6aV0V7WFL+VwvwDcncePt45xe
   kPTNOH/rdr7vO6ySbCrJCKGplHtDVoeZQIFjbBcfXTh7XAVEjGdZ/07jj
   jqZ5lkjT70H5lMRV1dfBnWFEO8/TYh3QIxEBydVcTNyHI81OMmFo6aq6H
   Os3RgqdpdxxdUEjDPmpqUJ1pvGxxJvVQu2CuC6p1zyXScuVv1foHgKKR4
   Bqet/NOh4FPlv3EOc8vOYHdA0HCj/HHL9Ab852j4uSK4Xt/c0ZYxZV1zf
   w==;
X-CSE-ConnectionGUID: egunO9SwRD+m07ijdgw/0w==
X-CSE-MsgGUID: UBvmQgykRwCiR7mYUSEivg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41716980"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="41716980"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 19:03:17 -0800
X-CSE-ConnectionGUID: cr/+M/1dSuysb71TU/FFCw==
X-CSE-MsgGUID: oRT5jpTFT/+4I8azNW/RkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="106788916"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jan 2025 19:03:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taR1O-000ZMw-0h;
	Wed, 22 Jan 2025 03:03:14 +0000
Date: Wed, 22 Jan 2025 11:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 333/333]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@102f3000: failed to
 match any schema with compatible: ['mediatek,mt8196-devapc']
Message-ID: <202501221052.vcTIV0Ic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c5e3ae83915369906e21e74bf1f59bc74a3d1877
commit: b9408b7224ce87406fde0268c848531e50dcc7dc [333/333] CHROMIUM: arm64: dts: mt8196: add node for dapc
config: arm64-randconfig-052-20250120 (https://download.01.org/0day-ci/archive/20250122/202501221052.vcTIV0Ic-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221052.vcTIV0Ic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221052.vcTIV0Ic-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: performance-controller@c2c0f20: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8196-cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8196-cksys-gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/pinctrl@1002d000: failed to match any schema with compatible: ['mediatek,mt8196-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@102f3000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@10613000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@10693000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@120a0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
--
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13bb0000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@13c30000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-n', 'mediatek,mt8196-imp_iic_wrap_n', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@13c30000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-n', 'mediatek,mt8196-imp_iic_wrap_n', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@140a0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@140c0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@140e0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14126000: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14126000: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14130000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14131000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/infracfg@14136000: failed to match any schema with compatible: ['mediatek,infracfg']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@142f4000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14400000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14401000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14500000: failed to match any schema with compatible: ['mediatek,mt8196-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14800000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/serial@16030000: failed to match any schema with compatible: ['mediatek,mt6985-uart']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16110000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16130000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16150000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16170000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16190000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16970000: clock-names:4: 'ahb_apb' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@180f3000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@1a019000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1a110000: failed to match any schema with compatible: ['mediatek,mt8196-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@1c004000: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c00d000: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2712-wdt', 'mediatek,mt6589-wdt', 'mediatek,mt6735-wdt', 'mediatek,mt6795-wdt', 'mediatek,mt7986-wdt', 'mediatek,mt8183-wdt', 'mediatek,mt8186-wdt', 'mediatek,mt8188-wdt', 'mediatek,mt8192-wdt', 'mediatek,mt8195-wdt']
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,mt6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-wdt', 'mediatek,mt7623-wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', 'mediatek,mt8365-wdt', 'mediatek,mt8516-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/watchdog@1c010000: failed to match any schema with compatible: ['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@1c032000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30020000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30021000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@30040000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'mboxes', 'mediatek,gce-events' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@30800000: compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32000000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32240000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32400000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a60000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
--
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@48600000: compatible: ['mediatek,mt8196-gpu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@48600000: failed to match any schema with compatible: ['mediatek,mt8196-gpu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810000: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-ctrl', 'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810000: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-ctrl', 'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b890000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b8b0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
