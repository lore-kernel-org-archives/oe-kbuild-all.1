Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA71C1F19
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738453648; cv=none; b=Wu/f8PNGpcVugSuk9aKn/y9XA9iB7Cnc/gM802RE7TMpMcBjIfu6MD0nQxkEYT3YwIRIdLsBxvZ9J9PrqJ5fjGU9V9qBQH9UEVnmtPfZEo88g6nLRFAKJ2SmOY3dkDgtoh4Z1FWch3gZzqjUA6kavlWJD/g7nNHKnqtaXUFKFsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738453648; c=relaxed/simple;
	bh=qpumrnEIDdgXYYvYflfERp21dUwMrjZ+JxW1nD1bMpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uh8Ct7Koc9aa4SjiBJZ1Zbibn7QKMOPJXk3+xPJ17CZs6fBRnikobu3niwknVqtHcYBO7eOm3nMzUCJ/DEesOeOZScAWniY2WaCl33Bk14klDSBVWDTswnmv917y1zepv9vcTl0g8Warq9jEEm/SAkUtEVpzoKhwzecnWnw3yRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFVCjiJm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFVCjiJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738453647; x=1769989647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpumrnEIDdgXYYvYflfERp21dUwMrjZ+JxW1nD1bMpI=;
  b=PFVCjiJm80UTR+c74TCDZbTIzyHPzRAW0wRIv840gaReWBBVluraAV++
   uKKE00B7LeiVbJYj89A57RGMsvzH8I3k/8vXaeKi2eDlwPWTzHhAJSkKL
   Skz9rCm1ecLgVn7LJ71riGBYuc6h8V4si7oDRjNt33KZ0oaCCIbL3bFvZ
   F51cjwWe0y84pcvN8qg4ElHdiC4kmtfMWuZecF8/VTAupWHOmQ+XiKImq
   QH9D8k7/bMIu3V2tRRJu9VMqiprNUvangvxobKLiAq5m3Y3QKrqfLk6Q4
   9O7FMi7VM0yrcipPqj0GxOTkpnVXLuFzj4NkpO16GivzOJtN6XKAHNIVo
   Q==;
X-CSE-ConnectionGUID: r8NWSdEMQVGxhuEu6vFEAg==
X-CSE-MsgGUID: JXEaZ0RhT8iVZH5gLEGRpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42905942"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="42905942"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 15:47:26 -0800
X-CSE-ConnectionGUID: piwQLhbPSGe0hOsN93H4vg==
X-CSE-MsgGUID: U7pxxUfkRf64vdtPPCJgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="114951405"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Feb 2025 15:47:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teNCs-000p1z-3D;
	Sat, 01 Feb 2025 23:47:22 +0000
Date: Sun, 2 Feb 2025 07:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-main 71/71]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pinctrl@1001f000:
 compatible: ['mediatek,mt7988-pinctrl', 'syscon'] is too long
Message-ID: <202502020730.dnmJaBIR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-main
head:   79e1c255f01348abdf52a6cb9c09fcbd8e92c8fb
commit: 79e1c255f01348abdf52a6cb9c09fcbd8e92c8fb [71/71] arm64: dts: add syscon fallback for ethernet-leds
config: arm64-randconfig-051-20250202 (https://download.01.org/0day-ci/archive/20250202/202502020730.dnmJaBIR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020730.dnmJaBIR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020730.dnmJaBIR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /cci: failed to match any schema with compatible: ['mediatek,mt7988-cci', 'mediatek,mt8183-cci']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: opp_table_cci: $nodename:0: 'opp_table_cci' does not match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: opp_table_cci: Unevaluated properties are not allowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pwm-fan: '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/phy-firmware@f000000: failed to match any schema with compatible: ['mediatek,2p5gphy-fw']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pinctrl@1001f000: compatible: ['mediatek,mt7988-pinctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pinctrl@1001f000: reg: [[0, 268562432, 0, 4096], [0, 297861120, 0, 4096], [0, 298844160, 0, 4096], [0, 298975232, 0, 4096], [0, 299892736, 0, 4096], [0, 300941312, 0, 4096], [0, 268480512, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /cci: failed to match any schema with compatible: ['mediatek,mt7988-cci', 'mediatek,mt8183-cci']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: opp_table_cci: $nodename:0: 'opp_table_cci' does not match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: opp_table_cci: Unevaluated properties are not allowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pwm-fan: '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/phy-firmware@f000000: failed to match any schema with compatible: ['mediatek,2p5gphy-fw']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pinctrl@1001f000: compatible: ['mediatek,mt7988-pinctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pinctrl@1001f000: reg: [[0, 268562432, 0, 4096], [0, 297861120, 0, 4096], [0, 298844160, 0, 4096], [0, 298975232, 0, 4096], [0, 299892736, 0, 4096], [0, 300941312, 0, 4096], [0, 268480512, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10060000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10060000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
