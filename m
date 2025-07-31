Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABE32D0C82
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970097; cv=none; b=GRa6gKSbE3jJiPPPZoPEi5w70RXJAYgu/nWt+BpQP9x0HtBSWUt1B7K/1jvMRnTmFEvlzc9vRk4RUt7fSwjIVT/OY9rw0a8l4v86+7u5sMl92LtPdktzX/nz8uwKKAvODmqJMTJvzJxE5IzCH3Bppww8IiAGRdpFToCHYGTsO0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970097; c=relaxed/simple;
	bh=rDozVTGKM8lTXpDMFMz5OxDk46iG4pqu3eCVSgMxTVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JSGWIU4nSC2raC+X6mqFbXUkdE2PMyRuKLPXHbqcWRuWvoByi5ctsbMGxLSp+eG57bnDs93nnSXw+PFYfwaDdMHnz2wigWof4fX2OHo3zoyds7s6h5YvQzvP2n7p6IhrPpEnYJ1mZgt3+5UgafR4KY9ZdGGzYPLb6TUfM8t4L1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPXw9R0R; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPXw9R0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753970096; x=1785506096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rDozVTGKM8lTXpDMFMz5OxDk46iG4pqu3eCVSgMxTVs=;
  b=OPXw9R0Rra9yWIWS6lrbRC9W3T+vUySaMt2y0+xV753K8wI9W1XiNpYj
   TSn3TkQ+6uOXTH/0oIeiztRUd1+7UWaIz8jlrIQWgWCArGF0eBzLo7sOX
   9zsVZSrvWba9ngIXluijFJwrYZjOGnkZd0mTFQE/oMQQWdfQzyF/ctOu/
   veJKTHyKnmaJocdUU3xf08v9I5alQnXCJky/lZp77lo+rtkBJYz9sT65v
   eHlM4xIjRqixO+BA0veNILbsRPN9FXeCw3Q7DkmFajoKUmHIFaPvmdxab
   TLyC+tdoZcJ56r/pz3kjp8bunE4+XwSZPcEQH0+3CVOrB1OCLpvqe3NcH
   Q==;
X-CSE-ConnectionGUID: 96jyU/T3QvSB14EaYnF/Ng==
X-CSE-MsgGUID: j1KYgNldRbeGT5dw9Co8nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="43899220"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="43899220"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 06:54:55 -0700
X-CSE-ConnectionGUID: xJT00+jJTsW472QsVsnKUg==
X-CSE-MsgGUID: z8xy7Z+SSuK9Mwcq/zTZhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="163288106"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Jul 2025 06:54:54 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhTkB-0003oe-1y;
	Thu, 31 Jul 2025 13:54:51 +0000
Date: Thu, 31 Jul 2025 21:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 55/61]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: mac@1
 (mediatek,eth-mac): 'nvmem-cells' is a dependency of 'nvmem-cell-names'
Message-ID: <202507312132.cMFxzMNt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   91e226e3ba3199526769b10b2f2eccd21872c876
commit: 218279ca6aaf8b7c19ded7eb1ce3b0406e5c2c18 [55/61] dts64: misc changes
config: arm64-randconfig-051-20250731 (https://download.01.org/0day-ci/archive/20250731/202507312132.cMFxzMNt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507312132.cMFxzMNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507312132.cMFxzMNt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: spi_nand@0 (spi-nand): Unevaluated properties are not allowed ('partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: mt7996@0,0:compatible: ['mediatek,mt76'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: mt7996@0,0 (mediatek,mt76): Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: mac@1 (mediatek,eth-mac): 'nvmem-cells' is a dependency of 'nvmem-cell-names'
   	from schema $id: http://devicetree.org/schemas/nvmem/nvmem-consumer.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pwm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: gpio-keys (gpio-keys): 'reset', 'wps' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
