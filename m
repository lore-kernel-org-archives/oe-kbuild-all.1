Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DF216FF27
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718201158; cv=none; b=rkj/HW82halOHGcoxmYWPU6d8U0drGHH2Q9YooMj9K++Qe5nwOctRoavXu/ssWlsE5Ku1njFzVGIq8VcIQ9lHNonifupcWjg7veQ8ERMNVMvVz5ihGqY1UNm7LONoXmVUk+FPlwUGQG9l5KkyeATZM5QhMgW0ijbYm6miDpTL/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718201158; c=relaxed/simple;
	bh=tQEQYVZJAE/R4Vu4e8nNRiltZrnMbIaFUwTYqtxZOs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1nKMXwVhq73B7e0fYE36eEmlUVmrfrJJynPrsmVcczO/UlcXxG4KLZWNfzZDuTbp09GmUHhDs67q02KYEFmbv+baCL9DhAuQgOJN7UbQMf4e7yK4sYEsVu6+6/nqRCUSpUUiQLXr4FhnbtjRRsvI2KlZr4J86P0Q7j2gXl9cSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SD79Rmln; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD79Rmln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718201155; x=1749737155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQEQYVZJAE/R4Vu4e8nNRiltZrnMbIaFUwTYqtxZOs0=;
  b=SD79Rmln/7yRDHin6Z5wNPZUunLl/RHUOQYbLDwn4KYjXYXJ96q7k15p
   8JfFqs/qpiwFS7wGiAfH2v98acMEhcC5288FnZwxFyeCf+EH1bD+e4eas
   8uIeuyCjIkBYxDXyfwaspszeYq0D0fL+IXFtci8rXuKXXoqxq+kdeojQj
   0VO/rMo37myogMeXnDGelH71ktwKMIBsMsN87/6/iNR2un+SdPm+Y9rAq
   2DjshGmMbq2PXNHGcjBkp1RUpYqMnrNJHVPRD1NH7V0/n0SVxVSy7494O
   Fhj3eYeSf9BDWFTTs8zh+t2oLPmbmgem7FguHCJs9iEmC5fh6WPDmtTTa
   g==;
X-CSE-ConnectionGUID: 5nTf8/nKTUuh+TeSEVaszw==
X-CSE-MsgGUID: 3n4yJMN3QNiNCwUT4UDGVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15091382"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="15091382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:05:55 -0700
X-CSE-ConnectionGUID: LzK0+oiHTi+qPime0ZEFsg==
X-CSE-MsgGUID: mrG6NthsRnSncB7axg1lPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44230687"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2024 07:05:52 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHObm-0001b6-1H;
	Wed, 12 Jun 2024 14:05:50 +0000
Date: Wed, 12 Jun 2024 22:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [brgl:gpio/for-next 13/23] arch/powerpc/boot/dts/mpc5121ads.dtb:
 gpio@1100: '#gpio-cells' is a required property
Message-ID: <202406122101.mhNQ9Vd0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   3ff1180a39fbc43ae69d4238e6922c57e3278910
commit: 77e1ea9e9913df8c23ac102c9c2b7c49a5d224da [13/23] dt-bindings: gpio: mpc8xxx: Convert to yaml format
config: powerpc-randconfig-051-20240612 (https://download.01.org/0day-ci/archive/20240612/202406122101.mhNQ9Vd0-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406122101.mhNQ9Vd0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122101.mhNQ9Vd0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020/board-control@2,0: failed to match any schema with compatible: ['fsl,mpc5121ads-cpld']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020/pic@2,a: failed to match any schema with compatible: ['fsl,mpc5121ads-cpld-pic']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000: failed to match any schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/wdt@900: failed to match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/rtc@a00: failed to match any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/reset@e00: failed to match any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/clock@f00: failed to match any schema with compatible: ['fsl,mpc5121-clock']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/pmc@1000: failed to match any schema with compatible: ['fsl,mpc5121-pmc']
>> arch/powerpc/boot/dts/mpc5121ads.dtb: gpio@1100: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/can@1300: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/can@1380: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/sdhc@1500: failed to match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: i2c@1700: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/i2c@1700/hwmon@4a: failed to match any schema with compatible: ['adi,ad7414']
   arch/powerpc/boot/dts/mpc5121ads.dtb: i2c@1720: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc5121ads.dtb: i2c@1740: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
--
   arch/powerpc/boot/dts/mpc5125twr.dtb: /: failed to match any schema with compatible: ['fsl,mpc5125ads', 'fsl,mpc5125']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /: failed to match any schema with compatible: ['fsl,mpc5125ads', 'fsl,mpc5125']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /sram@30000000: failed to match any schema with compatible: ['fsl,mpc5121-sram']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000: failed to match any schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/rtc@a00: failed to match any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/reset@e00: failed to match any schema with compatible: ['fsl,mpc5125-reset']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/clock@f00: failed to match any schema with compatible: ['fsl,mpc5121-clock']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/pmc@1000: failed to match any schema with compatible: ['fsl,mpc5121-pmc']
>> arch/powerpc/boot/dts/mpc5125twr.dtb: gpio@1100: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc5125twr.dtb: gpio@1180: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/can@1300: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/can@1380: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/sdhc@1500: failed to match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/mpc5125twr.dtb: i2c@1700: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc5125twr.dtb: i2c@1720: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/pdm360ng.dtb: mram1@2,10000: $nodename:0: 'mram1@2,10000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000: failed to match any schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/wdt@900: failed to match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/rtc@a00: failed to match any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/reset@e00: failed to match any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/clock@f00: failed to match any schema with compatible: ['fsl,mpc5121-clock']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/pmc@1000: failed to match any schema with compatible: ['fsl,mpc5121-pmc']
>> arch/powerpc/boot/dts/pdm360ng.dtb: gpio@1100: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/can@1300: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/can@1380: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/sdhc@1500: failed to match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/pdm360ng.dtb: i2c@1700: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: i2c@1740: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/i2ccontrol@1760: failed to match any schema with compatible: ['fsl,mpc5121-i2c-ctrl']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/axe@2000: failed to match any schema with compatible: ['fsl,mpc5121-axe']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: serial@11c600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/crypto@300000: failed to match any schema with compatible: ['fsl,sec-v4.2', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/crypto@300000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/crypto@300000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/crypto@300000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/crypto@300000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/crypto@300000/rtic@6000: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic', 'fsl,sec-v4.0-rtic']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: flash@0: Unevaluated properties are not allowed ('partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@18000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@18000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: flash@0: Unevaluated properties are not allowed ('partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@18000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@18000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@c300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@c300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@c300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@f000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@f000: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@f000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8572-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@c300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@c300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@c300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@f000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@f000: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@f000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8572-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
--
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@c300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@c300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@c300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@f000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@f000: '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@f000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8572-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: crypto@300000: 'fsl,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: sec_mon@314000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.0-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/crypto@300000: failed to match any schema with compatible: ['fsl,sec-v4.2', 'fsl,sec-v4.0']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: crypto@300000: 'fsl,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: sec_mon@314000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.0-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@131000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: gpio@132000: compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
