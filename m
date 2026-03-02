Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B93164D6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 06:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772433004; cv=none; b=SKula1sj++5vuktApHY0mNrAKryKgizz7rpjio8RdX8Y3SvP74KhrCQeL/EkCGhKdAWd9kSVT8pZGk23oe5ID3GO343715y2xfpg2/n+MMSmu3hP7oV9PSDIvU+YJmZZwH8zt9AcpLIzeZqTV2J0uCgxKTBejD8olG4pEzySWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772433004; c=relaxed/simple;
	bh=wFvxACPpVlh40S629/b/hc/YxkaQx4s0siNmiGg2+tM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cr7EAo5kHpEG+7kjB/7OGhOMzKTE9vq/iqgDgEuO8pcRKX7qMogLaNZ44u2+cYDN1om1L/+jM/+3w+th4f4dxHchUv8iQoNiTkrGefEkP2ziAyivUlViHnxXJ2DUrIsuC6bwGJlf1f0uiyIZvWXWxGAqWmlL0XaFj4l9lL1Ez9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGgnVSQY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGgnVSQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772433003; x=1803969003;
  h=date:from:to:cc:subject:message-id;
  bh=wFvxACPpVlh40S629/b/hc/YxkaQx4s0siNmiGg2+tM=;
  b=WGgnVSQYohnd3auX7Rr1IAMeX08d9tAOz8dAIzbCnTjT/oKbVWDkVLyu
   v7elvPCEvaPy/Bq83T6O1WyGrIKMAwAULAUy1WnGTH29MlzZuj84CnBR+
   u8WVuuJlyRW779LCN9RExwE7S3n+YpVHRygkaSQbFxQLWFEuCljQdjTZx
   dLuXv+61XTqz3+NoLFhvaykZ+sKH6dMUt0E5hTiFAdr2s1ZQFvuNFKMfc
   Xz/9at20KNglWpjbnb2l+hwgILwc17UUw5YNL121yLt8KT52nIfnDZsKK
   WufvrT1buxAtWkVYnQg5yTM+m4zMIho2lg2Vbunee+qRbEtd/8EKZArwb
   A==;
X-CSE-ConnectionGUID: mTvmFPmLQ5607/UlQESRAQ==
X-CSE-MsgGUID: SfchZZMRS3irJNXfyy5ZRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="98902927"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="98902927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 22:30:02 -0800
X-CSE-ConnectionGUID: clX9V226SQKSxtv1paSt8A==
X-CSE-MsgGUID: dZIvSpuUQiGo86rmD+pS+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="216041266"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 Mar 2026 22:30:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwwn0-0000000017V-1VEb;
	Mon, 02 Mar 2026 06:29:58 +0000
Date: Mon, 02 Mar 2026 07:29:46 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910):
 'interrupt-controller' is a required property
Message-ID: <202603020702.6v3FuG88-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   781b2c569af65bdd28b176733884d86c455b912e
commit: 006aa8f57f55dd5bf68c4ada1e0d3f4e59027d71 [3/3] mfd: dt-bindings: Convert TPS65910 to DT schema
config: arm-randconfig-2051-20260226 (https://download.01.org/0day-ci/archive/20260302/202603020702.6v3FuG88-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603020702.6v3FuG88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603020702.6v3FuG88-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/dss_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/core_l4_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
