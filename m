Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB0C28EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732844728; cv=none; b=eM9FXvb6WFpeB0yNM1K7q83ND7bISONOh4VjSiFLu++m9xS6+Wc2eYs/VUTncirX1xsVgOz0YSXA7GIeW8wIYNeoEdiHBjlL9A7OFO747xJdRk1xic/0DwdI8tF+sF7w9uqUVRYKu4RtqszCU5Zqsk2dDt5tHhdlDtFOaHYNjrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732844728; c=relaxed/simple;
	bh=t0ToZtK0pbyVuFkBNZJXNuGat4xpTyzXn2MXtGmi1dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrbZej//BPKAxq0iQtv6f+xNNUnNHYY5DzcuW6qnossMa6R2u9KQAd3dkWBqm/3CLS/d0MNiqmL/BydYeINdnNS0KIn2nBFZlnl5wA4JLtHpzuHTrQMusbqj2XhtZifuk8oWSeQf/Pyz2xXDy/eJxa4EWhZaSOlut2thcbX6o9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrvolqHf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrvolqHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732844722; x=1764380722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t0ToZtK0pbyVuFkBNZJXNuGat4xpTyzXn2MXtGmi1dk=;
  b=RrvolqHfxYq294LI1cnR5UV2M+dS1nvhKEFBWhFgAFWBRMtRZdFa0IiQ
   Tolsw6SGexc4uCISUBdtvQAxEpI6HTcLcOTmuHWGhR/TMqATOnd4Jk2bV
   RbVkOPGDm8gaPtuVbDCwrtyaZU10iumJZqRWZiOn4ZdY5zTfA0Zpd/NBJ
   VmDX6CHFYv/GsGp9iWndUHo3ofvhs8mpKJ7LxQ58C4ybe4q3SALnVImMX
   3DGBBG2WDCB45k2VEo7ag1HI036g9QCxYTJTOBkywSgHUrqPpf6rL/p7i
   K27SyQsCZW1fWG3mPLulpqx3kXOVKyPjCc5owsktMy0/mRhC3cAdcQ/4r
   w==;
X-CSE-ConnectionGUID: EAR68GAhTfqa7cA0mRg/sg==
X-CSE-MsgGUID: Fj6k9JC9TtekOSC5ANCD5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33020123"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33020123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 17:45:21 -0800
X-CSE-ConnectionGUID: 2bdVBmEMTKyjgA59vUEvhw==
X-CSE-MsgGUID: TMxY7CvARaaG8GE1ZB+jjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92742379"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2024 17:45:19 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGq4L-000AEP-0Z;
	Fri, 29 Nov 2024 01:45:17 +0000
Date: Fri, 29 Nov 2024 09:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 60/74]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10001000: '#reset-cells'
 does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202411290941.6PHvZs0v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Julien,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b9d1e518fec7694ac7dafa74cc58c82b0e2939e4
commit: e89d4de87aeada1814cc01188585a25af3cb9411 [60/74] UPSTREAM: dt-bindings: thermal: mediatek: Fix thermal zone definitions for MT8188
config: arm64-randconfig-051-20241126 (https://download.01.org/0day-ci/archive/20241129/202411290941.6PHvZs0v-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290941.6PHvZs0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290941.6PHvZs0v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: jpeg-encoder@1a030000: iommus: [[101, 679], [101, 680], [101, 681], [101, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: jpeg-decoder@1a040000: iommus: [[101, 685], [101, 686], [101, 690], [101, 691], [101, 692], [101, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/i2c@11e00000/tpm@50: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: jpeg-encoder@1a030000: iommus: [[141, 679], [141, 680], [141, 681], [141, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: jpeg-decoder@1a040000: iommus: [[141, 685], [141, 686], [141, 690], [141, 691], [141, 692], [141, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/i2c@11e00000/tpm@50: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: jpeg-encoder@1a030000: iommus: [[141, 679], [141, 680], [141, 681], [141, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: jpeg-decoder@1a040000: iommus: [[141, 685], [141, 686], [141, 690], [141, 691], [141, 692], [141, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/i2c@11e00000/tpm@50: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-encoder@1a030000: iommus: [[141, 679], [141, 680], [141, 681], [141, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-decoder@1a040000: iommus: [[141, 685], [141, 686], [141, 690], [141, 691], [141, 692], [141, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/i2c@11e00000/tpm@50: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: jpeg-encoder@1a030000: iommus: [[141, 679], [141, 680], [141, 681], [141, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: jpeg-decoder@1a040000: iommus: [[141, 685], [141, 686], [141, 690], [141, 691], [141, 692], [141, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: compatible: ['ti,tas2563', 'ti,tas2781'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: Unevaluated properties are not allowed ('compatible', 'reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/i2c@11e00000/tpm@50: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: jpeg-encoder@1a030000: iommus: [[139, 679], [139, 680], [139, 681], [139, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: jpeg-decoder@1a040000: iommus: [[139, 685], [139, 686], [139, 690], [139, 691], [139, 692], [139, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: compatible: ['ti,tas2563', 'ti,tas2781'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: Unevaluated properties are not allowed ('compatible', 'reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/i2c@11e00000/tpm@50: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: jpeg-encoder@1a030000: iommus: [[139, 679], [139, 680], [139, 681], [139, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: jpeg-decoder@1a040000: iommus: [[139, 685], [139, 686], [139, 690], [139, 691], [139, 692], [139, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: compatible: ['ti,tas2563', 'ti,tas2781'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: Unevaluated properties are not allowed ('compatible', 'reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/i2c@11e00000/tpm@50: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: jpeg-encoder@1a030000: iommus: [[139, 679], [139, 680], [139, 681], [139, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: jpeg-decoder@1a040000: iommus: [[139, 685], [139, 686], [139, 690], [139, 691], [139, 692], [139, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: sound: Unevaluated properties are not allowed ('mediatek,adsp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@10001000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8188-pericfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8188-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pwrap@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-pwrap', 'mediatek,mt8195-pwrap', 'syscon'] is too long
   	'mediatek,mt8188-pwrap' is not one of ['mediatek,mt8186-pwrap', 'mediatek,mt8195-pwrap']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: compatible: ['ti,tas2563', 'ti,tas2781'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: Unevaluated properties are not allowed ('compatible', 'reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dsi-phy@11c80000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/dsi-phy@11c80000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dsi-phy@11c90000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx'] is too long
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt7623-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt6795-mipi-tx']
   	'mediatek,mt8188-mipi-tx' is not one of ['mediatek,mt8365-mipi-tx']
   	'mediatek,mt2701-mipi-tx' was expected
   	'mediatek,mt8173-mipi-tx' was expected
   	'mediatek,mt8183-mipi-tx' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/dsi-phy@11c90000: failed to match any schema with compatible: ['mediatek,mt8188-mipi-tx', 'mediatek,mt8183-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/i2c@11e00000/tpm@50: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: gpu@13000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8188-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8188-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@14000000: compatible: ['mediatek,mt8188-vppsys0', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@14f00000: compatible: ['mediatek,mt8188-vppsys1', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: jpeg-encoder@1a030000: iommus: [[139, 679], [139, 680], [139, 681], [139, 684]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: jpeg-decoder@1a040000: iommus: [[139, 685], [139, 686], [139, 690], [139, 691], [139, 692], [139, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: gamma@1c006000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma']
   	'mediatek,mt8188-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dp-intf@1c015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rdma@1c104000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rdma@1c105000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rdma@1c106000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rdma@1c107000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rdma@1c108000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rdma@1c109000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rdma@1c10a000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: rdma@1c10b000: '#dma-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
