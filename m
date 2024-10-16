Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AEE139D1B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 01:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729042629; cv=none; b=TcRxFK27VvYOR44R84GGcH2YQf6LVJlsXnYqSCKww8pIiDpUWPrZh1wU6dyTwyU5n7poQ5ZKHZ8ZCrcIHr+35dGJF6HBCJjibSpoXabEj74FGXoN5PRbxOxvuqcTOLv9HzSCPM1wSmip/85OoQTynbLOvZWpyVsNPvaGtn0nMaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729042629; c=relaxed/simple;
	bh=B+4c+zRx9oI2OosKzLBxQXE1doGvC4Xxrd85w17E9oM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2uwXPl5+48VXd36iHb6sESEInb66MPtUyblnIOQQL1eieqk/r0qwICVIN4q651HALOexnO3OzcCEnjayO2r/G1diWHQw2ZNdab1dqZB63BwXJvryfG0uctePmn87N8qKV64FnI6cJ15FhbLZaMQxTiLYT/yhSQlKABztxj+/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoNINxu7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoNINxu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729042627; x=1760578627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B+4c+zRx9oI2OosKzLBxQXE1doGvC4Xxrd85w17E9oM=;
  b=RoNINxu7fULR0MsUrkrDOdSNLJRMVBpPFMscPkLhTABHjUySwe03mQS3
   3zp/fXq7Ff+lp2w7EcGPxVxqS1bd3g8ugbvLgHKSpp+hA7EXs5eqYo7HU
   IctZrJksLy0lFnoufr7szadqGWvVNA/h50CT2l/AdNQHsP68dObX0t2zF
   I4/ibqyYn/1bIInddvJO9J768CPS9QL2lym9rgbQQt/kIXCxUziIM0GcT
   TDzLE3r7kXCHxuGLv6CW+/4lZPxIIGWTumkK9EUvFBmOUf4RPTGylC2b+
   lbBS3OF5SEgMHCq8OD9Ji0XOhKoNmyHiPlYNMuhVHh2WcCQE2rzx3lscb
   Q==;
X-CSE-ConnectionGUID: FmSnhwWbS0iGTSeU8oodXw==
X-CSE-MsgGUID: MauCI8PrR8q0gi16beLTVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32162877"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32162877"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 18:37:06 -0700
X-CSE-ConnectionGUID: 2etnER1oTLeCZKzCAecIRw==
X-CSE-MsgGUID: vo9mPeIwRjeYf6giTzcWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78910944"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2024 18:37:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0syD-000K8d-2d;
	Wed, 16 Oct 2024 01:37:01 +0000
Date: Wed, 16 Oct 2024 09:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Shao <fshao@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [linux-next:master 3879/4439]
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pinctrl@10005000:
 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
Message-ID: <202410160906.ckDFQWGk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
commit: 355508880d41cfa5b0643515f27b6da490a1345e [3879/4439] arm64: dts: mediatek: mt8188: Add PCIe nodes
config: arm64-randconfig-051-20241015 (https://download.01.org/0day-ci/archive/20241016/202410160906.ckDFQWGk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160906.ckDFQWGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160906.ckDFQWGk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1442.35-1447.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1449.35-1454.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
   	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/keys: failed to match any schema with compatible: ['mediatek,mt6359-keys']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: spmi@10027000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi'] is too long
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
