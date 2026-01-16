Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49143002DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573640; cv=none; b=s1/WkWbEnXUEq4Zc6ESY89J+f2hPHzVvtZFAFFZeDcAYngtTTtfqnD9vDUd9ILfxilpgxZ+ToAd2mFjFJ6Kxwc4EtjejbjdAfvzTrfShsfbLXq6YmF8rwLUCaJfwE3kPl6vvjVmGyKXVknPohw/ZqukmVz6xbxNDAvfYDNOyRP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573640; c=relaxed/simple;
	bh=Mr9BfPMXlT0bThSl1d6AlRASLG1IXBPu8SRRfpYM6jA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UXisveP2kLhz9Eco98npeHT4EeZArE4OPSc53KG94pSYxtoL3v5278ALmSQ6yHZkCxHc62MKLy1MVMYfr6HN5ybZ+ku7nisKTsh9gsMemaZEnX8izFRTy9vvjz/h3XGnpXtpmdgvyaAA9ghsYP3agZ5I7p31/RSvGV6CACLMMps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZhVCxbo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZhVCxbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768573638; x=1800109638;
  h=date:from:to:cc:subject:message-id;
  bh=Mr9BfPMXlT0bThSl1d6AlRASLG1IXBPu8SRRfpYM6jA=;
  b=kZhVCxbowo6a2K1jW7gg2vFc9ez9tZ3830nvrwNy8PjMqoM/ka62dZ/d
   tpsDgKeR6sgXRtu0JBkBFCSkoE/g5HOyjfez6Ifto1kWnzz3Jz0TiEzs3
   0rgSvbS9sLjx99+VqczOry8hUv+/7ldsUhDSJp2n+VJPweEHDCCjqSie0
   KK7x2ZgJog8sfbH/QbqH0geZkg+hvMYkYYPUnVxAs0sX8zNQmCs4gY9L4
   fXcdz/JMtVt2etKFdeyDsQFO733wjee48RDw7QQuMdR4Zzo8f3ZnR8ktq
   jEDFO/dWwXdPUlQoTPlcwW9/Z+1TFuntbrqCOr4N3jn0G1nT6vkPkNN1W
   A==;
X-CSE-ConnectionGUID: OBRqmNoxSHOHLVOFwkaVDg==
X-CSE-MsgGUID: Rx7r+kvsS4isbKxAoYgFzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69089754"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69089754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 06:27:17 -0800
X-CSE-ConnectionGUID: DL8hY/wgR1q1u5GXNaqzKA==
X-CSE-MsgGUID: n+DKTn7eRVeW07AMqpmQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="228267948"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jan 2026 06:27:15 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgknB-000000001pV-3S9W;
	Fri, 16 Jan 2026 14:27:13 +0000
Date: Fri, 16 Jan 2026 15:26:32 +0100
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6255/6849]
 arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: /soc/syscon@10006000: failed to
 match any schema with compatible: ['mediatek,mt6795-scpsys', 'syscon',
 'simple-mfd']
Message-ID: <202601161502.E6kxSygd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: aec5445dd7c8c6c84d46f2dbf07967ac54393595 [6255/6849] arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
config: arm64-randconfig-2055-20260115 (https://download.01.org/0day-ci/archive/20260116/202601161502.E6kxSygd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161502.E6kxSygd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161502.E6kxSygd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt6795-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: syscon@14000000 (mediatek,mt6795-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
--
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt6795-scpsys', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): 'mt6332-led' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6331-regulator'] is too short
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6366-regulator']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): 'ldo-vio28' does not match any of the regexes: '^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$', '^ldo-(avdd32aud|vauxa32)$', '^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$', '^ldo-vcam(a|af|d|io)$', '^ldo-vgp[1234]$', '^ldo-vtcxo[12]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@14000000 (mediatek,mt6795-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
