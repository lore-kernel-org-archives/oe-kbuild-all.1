Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C060146A7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732778468; cv=none; b=r+xrbs7f+dMtbmt2MN8ux0esI2lXOkKZ1qu6qgGjptLTraqAyscoQ9I0jZTvshM9MK/HpTAFZe3mTBqXBlvULoguwH5Apo55mVKIdDzPxODQb3e++O8rIQfyHDCIBgaaq1NZ7fmcXhb8n97mx/46jqO69Mj4o+/xCODycNtSCOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732778468; c=relaxed/simple;
	bh=dK4zynxy2e1WUcOdz8w89NUDGrGPihu9QdfhayEQL7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tytEC9UxfqhoGxM2DdCDsUyLeBW2M+MxZPezDoItwZnBvHVmJ36H3GPiebKcxh805NeEcLJdRjL1rFKJKIBsln6docLOIzVfrrf2HpPIim2S6E4n10XIuDacBIoWRheWs1bWnf60DdxTF1uOGTpAef18/b57AiyI4Gr+U/xbRZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6mAKkdU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6mAKkdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732778466; x=1764314466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dK4zynxy2e1WUcOdz8w89NUDGrGPihu9QdfhayEQL7Y=;
  b=S6mAKkdUI+vCqcHRb0jVlbk0rCw8rRbM56c9L4MkBe6Y+iCcdld6gH6l
   YWb5tM5ZuHGJrt/bbzLGnGdQcQP3Wxo56sY44kVnsRvQSF6xVnad5Vr8N
   arnvaj9nncGdLIBa7gcnblk0ODePtQYqYI0ACaF+HwLj757x5dI0SyyJv
   BW+PipYLqWr7wYfMfUNJzeZC1jBTe3vE5tomvw1DEbvu1IMD8aY9BT56e
   YVyVxGB/dipcQdZVOmyuSIQTdSBst696b7POjVuWo9/ZnUo55s8HJCqTp
   VJgwLKLwUQyH3oO9E79NIinMxFMqDtFZWN+igiMqqnZlvWncPaQC0ajdI
   Q==;
X-CSE-ConnectionGUID: vN9U5I8RQzy1QoguBOK5TQ==
X-CSE-MsgGUID: lWk0SMaNRii4AMOJe5LcXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32935838"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="32935838"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 23:21:04 -0800
X-CSE-ConnectionGUID: 6u3XpkBwR1eb1u4FUQ6tLw==
X-CSE-MsgGUID: YVLozrvzQXGhw6tchsoiqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="97241974"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Nov 2024 23:21:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGYpg-0009EN-1n;
	Thu, 28 Nov 2024 07:21:00 +0000
Date: Thu, 28 Nov 2024 15:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 2/28]
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0:
 'vccd-supply' is a required property
Message-ID: <202411281535.rU82qpsN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   5e3570027ec2c687f49db5f977cb080954ea1ff5
commit: 3cc2728ebee5d430fc6b4de7f787c4b8af2baa49 [2/28] CHROMIUM: dt-bindings: input: Add Himax HX83102J touchscreen
config: arm64-randconfig-051-20241127 (https://download.01.org/0day-ci/archive/20241128/202411281535.rU82qpsN-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281535.rU82qpsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281535.rU82qpsN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
