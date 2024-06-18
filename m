Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E991741E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718743285; cv=none; b=p57ebcIyoKE43Q21SYuS9oPjlgSqwW/jtglk9Vm/oKNhX2soudFs0Op9yZ2bhtKxPyuN5HFHu0oRJ+ZY8NyE4GutYhoaRmVWHcVp5KbVd/HGS9t5rbWnqaafJH8LRIEvRhRB9nnFCx9X/+lxRklvAHP7KlUUq5LV90gce4Dqou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718743285; c=relaxed/simple;
	bh=5BEAbyszyrKS3pJHZigmyoShOGTRPMnWf0tcHt4Q2q0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lp32yq8ibl30lPCCDpZrBN9GeKu2tliai4RZG4bvWQSpE+AAu0AszAHhog1FDc56p+Xz+4czDbmKoxGReGFNBSlO7FJ1ClPve0oRj9I+j5Vhi8IFxp8ROey+zVvxoWPl5npx2som5Hs9IZGgdfvcG7N0cXmMvYo29+7YLAJsuOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcX55INv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcX55INv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718743283; x=1750279283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5BEAbyszyrKS3pJHZigmyoShOGTRPMnWf0tcHt4Q2q0=;
  b=CcX55INv/xCIlTGl1Aw8yu3S8j8RCKmiGCOqaCVqnLA8Sow3cNoL4/Dn
   kBVqWX/dWdbYEEeFMDVs8Va0VF5GlxejhgG6qYlrCXC4MlDypYsyMIncO
   6MdZVffSs2u2CXTppc6EzeAZSC4bTzHA5oCdc8iOd7klJR8e9Nu0J6jEY
   t2e/qItVbFiavEgNldx9tRPQOUfF+WPPoXQqsIQb17BO/deegcTW/Y4qN
   gOd+K5DAcNRgrHZ47GoiAw2BnLNSYFeHqnJ3zyx8r/Qs5mi58XSTSAyt8
   1tN3nbA+/3xC83K5GC1oSn2RYOwa1lLqljrwHq/gbjqRduOm+dcSw4No4
   w==;
X-CSE-ConnectionGUID: GE2IyX7/QhWb0Luj9IU7sg==
X-CSE-MsgGUID: WT94l8SAQ9mEwgfF660pVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15770730"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15770730"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 13:41:22 -0700
X-CSE-ConnectionGUID: b8AN/fX0S7Ke8AFr/umcFg==
X-CSE-MsgGUID: hx9u4RZSTAOCNIXVPBw5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="79143858"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2024 13:41:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJfdm-0005tu-1M;
	Tue, 18 Jun 2024 20:41:18 +0000
Date: Wed, 19 Jun 2024 04:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4994/6864]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/gpu@13000000: failed to
 match any schema with compatible: ['mediatek,mt8188-mali',
 'arm,mali-valhall-jm']
Message-ID: <202406190419.8e8c4kWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
commit: c05dd14a2c4bf9c6ba9814cf6a4fdd6a48f1060d [4994/6864] arm64: dts: mediatek: mt8188: Add support for Mali GPU on Panfrost
config: arm64-randconfig-051-20240618 (https://download.01.org/0day-ci/archive/20240619/202406190419.8e8c4kWk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190419.8e8c4kWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190419.8e8c4kWk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000: $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8188-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8188-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000: $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
