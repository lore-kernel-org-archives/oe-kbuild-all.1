Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFCE2F2604
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766219019; cv=none; b=N2liFW72tQMaZOWfXzErJb8MyAFLDBYkIeuFBVA2Z0JJ3qiLGUefchOh9E35KSMgc+JnRstaeCaWnotbvf9zFpBArbgDFBGuznZdgq/rgjmVBoj8ApClqcIcIef46jBkWxoxdQYd5BZLNvCu5uvr3hUmPO/oPeDx9FDIj7pgdtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766219019; c=relaxed/simple;
	bh=XPp42IKUugUxqTmQwmsw6D7kWHTN7YXWdJf/cvvVKH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SfJC/IVX4iKUIJJ2/JnHCsTavAZiU01OFdKQJxmmE/eTtMW95d08YSoX/XcgymI81qXZmi39M4CHJ5oXtklNCpIImIa8BSq2cvdJt5e+Fpx8chV//0tef6FeJFaDCtu67F4loQNPfKcAxTyB32TpZHaMHDkXujAgfKz6mWpu/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIF0tv84; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIF0tv84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766219018; x=1797755018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPp42IKUugUxqTmQwmsw6D7kWHTN7YXWdJf/cvvVKH4=;
  b=KIF0tv848Hce48LU8SfmUfrUeWspwN2aH5duww1KNvwJeDRBNb2VZ8vI
   BfeoBwrPvbPwzfO8AsJvoPrG3HM5Q1aZ1yrVGtBcjnLKV0cm887EBjTsh
   sJZBnbCzOlA4Tf1HDRUvXzVcofAk5MgkkxqRmUZj1zni5ilpE9Ibu/z2X
   K/y6T//eiHpSpJc9W/PJgo3ASrZOdJchbqxpdx+GI0rRSa0xFUq2UU2MJ
   A57pA3p64GIw69DFrfNFD5XDS1THWKE5c0iQAzIkRXLxSVUft0LdGQ/FK
   8g29Jbr0dLoSQ6+jpTzZSsVIMscutLAy0lLHsn9JCnhUDMUsNquslegvw
   A==;
X-CSE-ConnectionGUID: P/8CWzJXQzelZKOh6QeZww==
X-CSE-MsgGUID: qahVlB90QA65ou19NrEpRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68102828"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68102828"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 00:23:37 -0800
X-CSE-ConnectionGUID: h7N5j0USTaeZqSceu3iPng==
X-CSE-MsgGUID: hakuYotsRpifSHToK+h+sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198318239"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2025 00:23:35 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWsFQ-000000004Wi-46DD;
	Sat, 20 Dec 2025 08:23:32 +0000
Date: Sat, 20 Dec 2025 09:22:55 +0100
From: kernel test robot <lkp@intel.com>
To: Mateusz Koza <mateusz.koza@grinn-global.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb:
 pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match
 any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202512200925.B2JS6oPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: f4d1eace54f7b12369935a698af29bca7cf3db49 arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700
date:   10 weeks ago
config: arm64-randconfig-2052-20251219 (https://download.01.org/0day-ci/archive/20251220/202512200925.B2JS6oPJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200925.B2JS6oPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200925.B2JS6oPJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@0 (mediatek,mt8188-xhci): hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
