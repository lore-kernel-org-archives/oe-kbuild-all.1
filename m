Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C72F213E6F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787982; cv=none; b=MdFijTGgbh78wi6QCZNtfwx7X3HYR6dYMEzguCHc5Og4f/ZagDULppPyfaDnOnwUg9JELNzqT5o6RqeyrCHE2Tg7QaUSQLBw3pDfmBh45TLIsnH+2VSr7SDDDK2SuKo0pjZ+KE3hMcN7gTpx6TbQ3LNkpkyrXWKaal7BnRFXIQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787982; c=relaxed/simple;
	bh=HSMkSPA2UiBu/29sJems0INs0VQikJMpuzl6RhDpEfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IzaS+2KGGuxSTbqWg95wvvycY06Eq/IieB/h8piGLkdn1LwpwPMlwIkGUVAvpGh7A6W2beCspqTR/cYXv6ETHCdwQjD2pLXyLqfhQYaC/qfTNfIVE7eScQX4FTevnP0lVgUfXz4lTAJTKtRDK+mo/PO4LHnW4da1dRhhqB7zbXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQd3Upjs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQd3Upjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738787980; x=1770323980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HSMkSPA2UiBu/29sJems0INs0VQikJMpuzl6RhDpEfg=;
  b=NQd3Upjs85n/QlbjNAf9LXbg+fVqzatxusPrBYTO7JKOiJ1IrwJbyKLf
   xVmFm8y8BhjzJ+CFcJcRMU5bm+U9gMUna+93EQzjymt2IKsHjna8tRefu
   ZYCnu0NTiKN7G5QkSJbJxb+ZwbYcCVRvmzqbu6pPVd2WXZu0OTcIGCQ3/
   MY7WjeFdyExyBNe+EXpgC31QTNWSTgZrAsjY4b3aAKYfO3UDxtXPHQXog
   ZD0IRRRJOV/w+Hqz3MTSMBVn6U3qOFrLmDjw9Qy5z5sR1G3hxooD1CkrI
   wlaxWJPBGBaE7Gte5ncA8ACtoDAPAvABMzkNybbL9kmrpaZdyQW/+gQxT
   w==;
X-CSE-ConnectionGUID: M8pnJamzRFi9/QDyKJlXAQ==
X-CSE-MsgGUID: pNrEmcO+Tq2F7fTcbjQpVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38604632"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="38604632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 12:39:39 -0800
X-CSE-ConnectionGUID: F6O7pROGRluLRCua7wj6hA==
X-CSE-MsgGUID: YEPNv6ouSayvQVSvOby+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="110987642"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 12:39:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfmBL-000w3S-14;
	Wed, 05 Feb 2025 20:39:35 +0000
Date: Thu, 6 Feb 2025 04:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32020000: 'power-domains'
 is a required property
Message-ID: <202502060411.7461Hm5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: fe693c3f6e9a12cf18316a0cbdbc652469558e18 [35/35] CHROMIUM: arm64: dts: mt8196: add display device node
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250206/202502060411.7461Hm5J-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060411.7461Hm5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060411.7461Hm5J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32000000: 'async', 'mm-hw-ccf-regmap' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32020000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32020000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32240000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32400000: 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32420000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32420000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32430000: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dvo0@324c0000: failed to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32820000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32820000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32860000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32870000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32880000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32890000: mediatek,larb:0: [90, 35] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32890000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@328a0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@328b0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@328c0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32990000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@329a0000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@329b0000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@329c0000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a60000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a70000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a80000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a90000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', 'mediatek,mt8196-ovlsys1_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', 'mediatek,mt8196-ovlsys1_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32c20000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32c20000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32c50000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32c60000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32c70000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32c80000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32c90000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32ca0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32cb0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: dma-controller@32cc0000: 'iommus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,exdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32d80000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32d90000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32da0000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32db0000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: outproc@32dc0000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,outproc.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e60000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e70000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e80000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e90000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3600d000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3600e000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
