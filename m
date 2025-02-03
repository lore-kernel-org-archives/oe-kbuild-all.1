Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6888B1E7C19
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 23:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738625743; cv=none; b=f1ZMnQ7B5XHrcF0yHPnLhQ6LrTHIhOIpXxi8W3D4EwRAW+QFfkPPUYv8fPEtHwR1ZJVqFyWFRUp4fUWLoOy6v4kUx6RtzNEO9clKjuup/Xye8owXm3KA1Sz/xKkgZACRkCW1oyAVwvUhElJTIOrMIYDJ3gum6+zVEpRPkq6oYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738625743; c=relaxed/simple;
	bh=5gICo96UxhPsmEA5DFrk5W3S7kG9KiB2a5cBdpsjKnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWbEqWaA519VJcPyBhA8IzBPvVkmPqSll8+RDyKjaJF1WxBTjloMSeXf5MOMr6T+mYGyR8mNnQpNsybq1blryk7P0X/WvxbmTicC1Dl7wuFvbFw0O0Y2w1e9JeS6kBlzm+LbbG9v+HBIieP2di3hPVyIZMbPrRRnM7H6yBenm74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=le7DMlNm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="le7DMlNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738625742; x=1770161742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gICo96UxhPsmEA5DFrk5W3S7kG9KiB2a5cBdpsjKnE=;
  b=le7DMlNmNhGFb2Ya5UCrb8iG21fXv0R8oYTpVNV7kCt9wOkG9H9RAawt
   uut92k2E1L0GHs1h7sN/Mme2eYRcpdYETiPNbPI/fugP4XIYaFnAwV/aG
   Yy41HyO5vbIoUsUsWPMCGP1issUZZz7pSXA1Uq8Ghi7/9bNbGiO/6ig61
   Dlqn6f1lh+kMBNwSmxnFYgC9vZE46jhOF6DnN8ZBfGqW3SHJihg4d113h
   I5AiRQifWpDU0AUVTs9jgbnJJE7iMATeLHBYdAKhpXALSWHUMz0qSZpvE
   J35FnzN3dn/5Z1J3OXv/JL/jt7kHI4AjDdJXni9F9aKRaEccfDpHU6EBJ
   Q==;
X-CSE-ConnectionGUID: K6ZvpDc9RpSD3FV30KTf2A==
X-CSE-MsgGUID: qGWTV3XTRtOK1YIRIjU4NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50131263"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="50131263"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 15:35:41 -0800
X-CSE-ConnectionGUID: rzL2RbThQqOyQk2oQVKPvQ==
X-CSE-MsgGUID: 5FDzB7dcTHuPTbSVtcoJSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111265632"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2025 15:35:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf5yb-000rgl-0g;
	Mon, 03 Feb 2025 23:35:37 +0000
Date: Tue, 4 Feb 2025 07:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000: failed to
 match any schema with compatible: ['mediatek,mt8196-spmi']
Message-ID: <202502040734.vWNE0MYZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6175b263c04ce3f5cf949719af87547964ae77fd
commit: 20943b200aa83bffe9cfc3637024785802e306b0 [35/35] CHROMIUM: arm64: dts: mt8196: Add spmi/pmic device node
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040734.vWNE0MYZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040734.vWNE0MYZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040734.vWNE0MYZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000: failed to match any schema with compatible: ['mediatek,mt8196-spmi']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@6: failed to match any schema with compatible: ['mediatek,mt6316']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@6/mt6316-6-regulator: failed to match any schema with compatible: ['mediatek,mt6316-6-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@7: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@7/mt6316-7-regulator: failed to match any schema with compatible: ['mediatek,mt6316-7-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@8: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@8/mt6316-8-regulator: failed to match any schema with compatible: ['mediatek,mt6316-8-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@15: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@15/mt6316-15-regulator: failed to match any schema with compatible: ['mediatek,mt6316-15-regulator']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/pmic@4: failed to match any schema with compatible: ['mediatek,mt6363']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/pmic@4/mt6363-auxadc: failed to match any schema with compatible: ['mediatek,mt6363-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/pmic@4/mt6363-efuse: failed to match any schema with compatible: ['mediatek,mt6363-efuse']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/pmic@4/mt6363-consys: failed to match any schema with compatible: ['mediatek,mt6363-consys']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/pmic@4/mt6363keys: failed to match any schema with compatible: ['mediatek,mt6363-keys']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/pmic@4/mt6363-pinctrl: failed to match any schema with compatible: ['mediatek,mt6363-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/pmic@4/regulators: failed to match any schema with compatible: ['mediatek,mt6363-regulator']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/pmic@4/pmic-lvsys-notify: failed to match any schema with compatible: ['mediatek,mt6363-lvsys-notify']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5: failed to match any schema with compatible: ['mediatek,mt6373']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/mt6373-auxadc: failed to match any schema with compatible: ['mediatek,mt6373-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/mt6373-efuse: failed to match any schema with compatible: ['mediatek,mt6373-efuse']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/mt6373-consys: failed to match any schema with compatible: ['mediatek,mt6373-consys']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/mt6373-pinctrl: failed to match any schema with compatible: ['mediatek,mt6373-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/regulators: failed to match any schema with compatible: ['mediatek,mt6373-regulator']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6685_mfd: failed to match any schema with compatible: ['mediatek,mt6685']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6685_mfd/mt6685-clkbuf: failed to match any schema with compatible: ['mediatek,mt6685-clkbuf']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc: failed to match any schema with compatible: ['mediatek,mt6685-rtc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@1c032000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30020000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30021000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@30040000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
