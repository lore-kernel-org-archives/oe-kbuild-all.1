Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867580B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632958; cv=none; b=NSo31hPljhF2BxacGQrGQPtdrgqTfLVcBMpCj9ZZzeBCUZfEMEkwslxVRB1S34gafE+fc+gOM/Fh0mjoU4tMcGdmE5vJtd8yAYMseJjQdQlqe+fp/lEOjT/B4GOUUJ7WlyoVVuL2OSetqaBZSNnnkw/Op7yUgSTmWH7FmahvUF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632958; c=relaxed/simple;
	bh=+fPAE3ToH7q8aVivpQM09UZTnwpD6Cm2Sa4yiVOICk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GTnGR9mzpA+sLy8pUJIeksEu96h2nhUxeYQU0W7omVT+qqgQRpGi5MvlMlP9Y2t0HFnqJg63TzOK0Qvs1EtmIUX3tQDySg4TmQdJeC4j9oAWPZwDbb8paZFAS7iSsGRA8GT6WhwPeJfhdBVWPoq0c8oih4gWgNUC4MPX3PLF1Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Drw0CKo7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Drw0CKo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744632957; x=1776168957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+fPAE3ToH7q8aVivpQM09UZTnwpD6Cm2Sa4yiVOICk8=;
  b=Drw0CKo7pyGkxaTE0cS5xbm0eiWlmZz8XnvJOVFkWlZpPxp44o0aqTa7
   bCl89zkh2MVc3dePlPs8AVmaZaCqiDPwFIgz+TI/dXhE+UH0x3oUha0Lt
   SmgBi5AfuC84kt2w7zCbP+Kmh1R+sGwYApvRK0CM7JtN+G9bZF/QO1aXP
   egv3kXw3nlG6oA3Zykomn6Ky/OEgrD4Z7DhU3uZ+mnie3uomlR2/7IDfS
   K0OHrAx95SaM7g0MrZnkGxOqiXQh7vmfrueJQNguTGR5+ckw9qwWG+/wi
   EsWL+kIEyR9zpV47UUqWAzg8S1aYmA7CEqa4RoGcdZYh8Hfx2C4rQSGv2
   g==;
X-CSE-ConnectionGUID: i/46mFtAR8W2JNmqdFNeqw==
X-CSE-MsgGUID: j0QF3rELRn+QlX6ajisbbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="33712261"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="33712261"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:15:56 -0700
X-CSE-ConnectionGUID: CzyiZ20ZRn6sP4ugp11UZQ==
X-CSE-MsgGUID: jvekf+EoRO+jGpsxZsQYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134961434"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Apr 2025 05:15:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4IjA-000EA0-05;
	Mon, 14 Apr 2025 12:15:52 +0000
Date: Mon, 14 Apr 2025 20:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6650/6651]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pcie@0,0: 'device_type' is a
 required property
Message-ID: <202504142049.ugow68az-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: 36d17b79f989e71285cfa500eeba43bd454fdd5b [6650/6651] dts: mt7622: split PCIe node into slots
config: arm64-randconfig-051-20250413 (https://download.01.org/0day-ci/archive/20250414/202504142049.ugow68az-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504142049.ugow68az-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504142049.ugow68az-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller (mediatek,mt7622-audio): clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [37, 8], [37, 9], [37, 10], [37, 11], [37, 4], [37, 5], [37, 6], [37, 7], [37, 14], [37, 15], [37, 39], [37, 40], [37, 0], [37, 46], [37, 17], [37, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7622-pciesys'] is too short
   	'mediatek,mt7629-pciesys' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /pcie@1a143000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /pcie@1a145000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
--
   	'google,tomato' was expected
   	'google,tomato-rev3' was expected
   	'google,dojo-sku5' was expected
   	'mediatek,mt8195' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8370' was expected
   	'mediatek,mt8390' was expected
   	'mediatek,mt8395' was expected
   	'mediatek,mt8516' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /: failed to match any schema with compatible: ['mt7622-adtran-smartrg-841-t6', 'mediatek,mt7622']
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: / (mt7622-adtran-smartrg-841-t6): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: / (mt7622-adtran-smartrg-841-t6): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pwrap@10001000 (mediatek,mt7622-pwrap): 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /pwrap@10001000/regulators: failed to match any schema with compatible: ['mediatek,mt6380-regulator']
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7622-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): pcie0-pins:mux:groups:1: 'pcie0_2_waken' is not one of ['pcie0_0_waken', 'pcie0_1_waken', 'pcie1_0_waken', 'pcie0_0_clkreq', 'pcie0_1_clkreq', 'pcie1_0_clkreq', 'pcie0_pad_perst', 'pcie1_pad_perst', 'pcie_pereset', 'pcie_wake', 'pcie_clkreq']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): pcie0-pins:mux:groups:2: 'pcie0_2_clkreq' is not one of ['pcie0_0_waken', 'pcie0_1_waken', 'pcie1_0_waken', 'pcie0_0_clkreq', 'pcie0_1_clkreq', 'pcie1_0_clkreq', 'pcie0_pad_perst', 'pcie1_pad_perst', 'pcie_pereset', 'pcie_wake', 'pcie_clkreq']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): pcie1-pins:mux:groups:1: 'pcie1_1_waken' is not one of ['pcie0_0_waken', 'pcie0_1_waken', 'pcie1_0_waken', 'pcie0_0_clkreq', 'pcie0_1_clkreq', 'pcie1_0_clkreq', 'pcie0_pad_perst', 'pcie1_pad_perst', 'pcie_pereset', 'pcie_wake', 'pcie_clkreq']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): pcie1-pins:mux:groups:2: 'pcie1_1_clkreq' is not one of ['pcie0_0_waken', 'pcie0_1_waken', 'pcie1_0_waken', 'pcie0_0_clkreq', 'pcie0_1_clkreq', 'pcie1_0_clkreq', 'pcie0_pad_perst', 'pcie1_pad_perst', 'pcie_pereset', 'pcie_wake', 'pcie_clkreq']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg: [[0, 270602240, 0, 4096], [0, 268455936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg-names:0: 'eint' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg-names: ['base', 'eint'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: cci@10390000 (arm,cci-400): slave-if@5000:compatible: ['arm,cci-400-ctrl-if', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,cci-400.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /serial@11005000/bluetooth: failed to match any schema with compatible: ['mediatek,mt7915-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /i2c@11007000/system-leds@30: failed to match any schema with compatible: ['srg,sysled']
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller:clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller:clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [31, 8], [31, 9], [31, 10], [31, 11], [31, 4], [31, 5], [31, 6], [31, 7], [31, 14], [31, 15], [31, 39], [31, 40], [31, 0], [31, 46], [31, 17], [31, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: audio-controller (mediatek,mt7622-audio): clock-names: ['infra_sys_audio_clk', 'top_audio_mux1_sel', 'top_audio_mux2_sel', 'top_audio_a1sys_hp', 'top_audio_a2sys_hp', 'i2s0_src_sel', 'i2s1_src_sel', 'i2s2_src_sel', 'i2s3_src_sel', 'i2s0_src_div', 'i2s1_src_div', 'i2s2_src_div', 'i2s3_src_div', 'i2s0_mclk_en', 'i2s1_mclk_en', 'i2s2_mclk_en', 'i2s3_mclk_en', 'i2so0_hop_ck', 'i2so1_hop_ck', 'i2so2_hop_ck', 'i2so3_hop_ck', 'i2si0_hop_ck', 'i2si1_hop_ck', 'i2si2_hop_ck', 'i2si3_hop_ck', 'asrc0_out_ck', 'asrc1_out_ck', 'asrc2_out_ck', 'asrc3_out_ck', 'audio_afe_pd', 'audio_afe_conn_pd', 'audio_a1sys_pd', 'audio_a2sys_pd'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: audio-controller (mediatek,mt7622-audio): clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [31, 8], [31, 9], [31, 10], [31, 11], [31, 4], [31, 5], [31, 6], [31, 7], [31, 14], [31, 15], [31, 39], [31, 40], [31, 0], [31, 46], [31, 17], [31, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /mmc@11230000/card@0/block/partitions/block-partition-mfginfo/nvmem-layout: failed to match any schema with compatible: ['adtran,mfginfo']
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7622-pciesys'] is too short
   	'mediatek,mt7629-pciesys' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /pcie@1a143000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /pcie@1a145000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@0:nvmem-cell-names:0: 'mac-address' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@0: Unevaluated properties are not allowed ('label', 'nvmem-cell-names', 'nvmem-cells', 'phy-connection-type', 'phy-handle', 'phy-mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@1:nvmem-cell-names:0: 'mac-address' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: ethernet@1b100000 (mediatek,mt7622-eth): mac@1: Unevaluated properties are not allowed ('label', 'nvmem-cell-names', 'nvmem-cells', 'phy-handle', 'phy-mode', 'rx-internal-delay-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: gpio-keys (gpio-keys): 'reset', 'wps' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: gpio-leds (gpio-leds): 'wifi2g', 'wifi5g-1', 'wifi5g-2', 'wps' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-smartrg-SDG-841-t6.dtb: /bootdata: failed to match any schema with compatible: ['bootdata']
--
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): clocks: [[2, 2], [18, 80], [18, 81], [18, 107], [18, 108], [18, 89], [18, 90], [18, 91], [18, 92], [18, 95], [18, 96], [18, 97], [18, 98], [18, 103], [18, 104], [18, 105], [18, 106], [38, 8], [38, 9], [38, 10], [38, 11], [38, 4], [38, 5], [38, 6], [38, 7], [38, 14], [38, 15], [38, 39], [38, 40], [38, 0], [38, 46], [38, 17], [38, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7622-pciesys'] is too short
   	'mediatek,mt7629-pciesys' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pcie@1a143000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /pcie@1a145000: failed to match any schema with compatible: ['mediatek,mt7622-pcie']
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: switch@1f (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
