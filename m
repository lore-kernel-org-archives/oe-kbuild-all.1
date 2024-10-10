Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E318786C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 05:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728537532; cv=none; b=NeH0aTF7jX1i2a8zfuJFX3as1aPZCcDuP3v1icp+qVzfQB9sB6kSmFO76/XFyHEd/M8lXhvJJx9v7Oq7HjdVSACDyNpEFd/yC7KbAK8C6oPztHzi83oUerQhNi7jO8mjSwjlBWIR3VUhm1CO/DB6OtHwkt0JDGXMHYxK3eQYBIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728537532; c=relaxed/simple;
	bh=N0IQQ/Lj7wB2rT/3dgExK/ld5aEoJeEM5l+iTR4SOhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jw6bpSMCUwa/vM2p41LOEuWhYZ/wKlRYxMcI2qYHNyTzG7X554okC7gosoZZdYsI/Rg6SC5TzT8ZhCCHR3qqbux3UOgfpLc2Y/a/CqGJYwk1uy/WPEmtl6fiIPXfqYElayGAWiFrL02gzO/3+irvaOqCBRDH8cYqz3g52AwFImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeXIgoZn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeXIgoZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728537530; x=1760073530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N0IQQ/Lj7wB2rT/3dgExK/ld5aEoJeEM5l+iTR4SOhA=;
  b=AeXIgoZnpHsLG0wl7Kxt7DBrQJP0c3GMOtWgrpRFxL+186a6MOHlj9ca
   Dxh8w9eKZoBnxQIXsL+z0Iw3IIH6Av+8pspzT/SThlrCIb04sRxAJ6jna
   7fDyB/LY/lQl2UujoqiISUe1vfdb0xbFZm0Tea8pso1GF9Lwe9TLwcS/p
   R6BNogMAPfTQujM2Sq+BO9XEKTVvhO8So3RijOf2IgW/TkuHDbo2LnDBn
   vEiC2nUapNdZ3If5mI9fSUTyXlLLJSFnELvhaAvmvQT6WImwUuBjSxYmt
   LK0RBKMC5OsY8BSQeDgS52ipDccS0r+foZUcz5yb+El6YBc27dSwJqssl
   Q==;
X-CSE-ConnectionGUID: j7K4EWWWQ6iJTWQHSKWGvg==
X-CSE-MsgGUID: iTVohGDkQjC+iN7ZUYvKVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28031913"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="28031913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 22:18:49 -0700
X-CSE-ConnectionGUID: cvsqvtk5SBa51nWDP6UdTQ==
X-CSE-MsgGUID: /S747k/iQ2my5Lj+K7p9ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76131361"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2024 22:18:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sylZW-000ADN-0c;
	Thu, 10 Oct 2024 05:18:46 +0000
Date: Thu, 10 Oct 2024 13:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Shao <fshao@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [linux-next:master 3040/3432]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: t-phy@11c20700: 'power-domains'
 does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$',
 'pinctrl-[0-9]+'
Message-ID: <202410101327.mA8yYsP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b6270c3bca987530eafc6a15f9d54ecd0033e0e3
commit: ad5c0159313715dbcbad9f44cc788165699736e5 [3040/3432] arm64: dts: mediatek: mt8188: Add PCIe nodes
config: arm64-randconfig-051-20241009 (https://download.01.org/0day-ci/archive/20241010/202410101327.mA8yYsP1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101327.mA8yYsP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101327.mA8yYsP1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
--
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt6873-spmi', 'mediatek,mt8195-spmi']
   	'mediatek,mt8188-spmi' is not one of ['mediatek,mt8186-spmi']
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: spmi@10027000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/spmi@10027000: failed to match any schema with compatible: ['mediatek,mt8188-spmi', 'mediatek,mt8195-spmi']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: t-phy@11c20700: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
