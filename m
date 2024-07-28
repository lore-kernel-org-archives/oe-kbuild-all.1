Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C1B374CC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722178452; cv=none; b=Ch23NbvYZXYPheUXcweLW0uQT7IN3BJfAnXHP0dlWRgUTHE8K0zoZOFjdCFb8Ob7FobTuXQ6IFf8DZckiqhAo91oC181g1DreW/FERNvWR2s0luB5Q6xHeroxvC2Bv5QLhdvjk0HWPNUDiAP2vfJvjLExXTjoh3+co2ZWYo4ePg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722178452; c=relaxed/simple;
	bh=7gM246ml+wleFJHuj7+6+9VaPs+PwlxrOlfqwluPZ+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IFdIoypKFE0c6EOoDg8g7yeqDv3lC3DswFyoe78h9RpDiRk/8FFbJ/PWDKbvEBr9q2qn9No5AMOfR2fL1LJutd0Yp0rrHFsgNJqvp5p82V5V4XUnmF5OZJvXLBAARSdimlM9eoRuL0DYQYC3KZTDSJFV96oHUxma+lgD/9awB9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UokhvR2g; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UokhvR2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722178451; x=1753714451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7gM246ml+wleFJHuj7+6+9VaPs+PwlxrOlfqwluPZ+g=;
  b=UokhvR2gOXrXijJH4ttYMllL5IpqDa2wotiMl51QBzGc6kb5AyjEe4Jt
   v/QNsVmf4OOVRl8vBlrhXeM0SeSkhyM+oiDmsmFZGWZB86LnigpjFt43G
   xqEWNmW4j3tEQZdMOiKDnh8i1NHoi0ME+iIRtjitdsO02/rA1HEAtmYJx
   LvOo69fBiDzlgpwuEHAJaYt7lOcT1xU5qkDK0Xdy5IFLD59PtHb87+MIo
   1hIdDN1nfzE0sBQA2V2HuoRMaRNUSWsqDhbUCw16oGdfwtkSD2mXldvql
   /tvTOn4Zy7qXA12CADqDVsH427RiwGELI2w6BeNzQArdPEEYQaJ5Co5VE
   g==;
X-CSE-ConnectionGUID: 2+fgk59zRiGHuiCs5Zn9WA==
X-CSE-MsgGUID: m7Q35LlbQRCq9PNOrj119Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23674738"
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="23674738"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 07:54:10 -0700
X-CSE-ConnectionGUID: 0VFU+mIcS0auCWa57RMfHQ==
X-CSE-MsgGUID: Mt3VqwALQEGVKYzSBBvoVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="53665117"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jul 2024 07:54:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sY5Hh-000qtO-0Z;
	Sun, 28 Jul 2024 14:54:05 +0000
Date: Sun, 28 Jul 2024 22:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 13644/13921]
 arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: sata@29000000:
 clock-names:2: 'core' was expected
Message-ID: <202407282202.ITbn6H83-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   668d33c9ff922c4590c58754ab064aaf53c387dd
commit: c84750d06ea88079e6ac7e1d16694ae4fe7820a9 [13644/13921] dt-bindings: ata: qcom,apq8064-ahci: add to dtschema
config: arm-randconfig-051-20240726 (https://download.01.org/0day-ci/archive/20240728/202407282202.ITbn6H83-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407282202.ITbn6H83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407282202.ITbn6H83-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: /soc/pinctrl@800000: failed to match any schema with compatible: ['qcom,apq8064-pinctrl']
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: syscon@1200000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: timer@200a000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: sps-sic-non-secure@12100000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: rpm@108000: 'clock-controller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: /soc/phy@1b400000: failed to match any schema with compatible: ['qcom,apq8064-sata-phy']
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: sata@29000000: clock-names:2: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: sata@29000000: clock-names:4: 'pmalive' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: syscon@5700000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
--
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: /soc/pinctrl@800000: failed to match any schema with compatible: ['qcom,apq8064-pinctrl']
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: syscon@1200000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: timer@200a000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: sps-sic-non-secure@12100000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: rpm@108000: 'clock-controller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: /soc/phy@1b400000: failed to match any schema with compatible: ['qcom,apq8064-sata-phy']
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: sata@29000000: clock-names:2: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: sata@29000000: clock-names:4: 'pmalive' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: syscon@5700000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
--
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: /soc/pinctrl@800000: failed to match any schema with compatible: ['qcom,apq8064-pinctrl']
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: syscon@1200000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: timer@200a000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: sps-sic-non-secure@12100000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: rpm@108000: 'clock-controller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: /soc/phy@1b400000: failed to match any schema with compatible: ['qcom,apq8064-sata-phy']
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: sata@29000000: clock-names:2: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: sata@29000000: clock-names:4: 'pmalive' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: syscon@5700000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
--
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: /soc/pinctrl@800000: failed to match any schema with compatible: ['qcom,apq8064-pinctrl']
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: syscon@1200000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: timer@200a000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: sps-sic-non-secure@12100000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: rpm@108000: 'clock-controller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: /soc/phy@1b400000: failed to match any schema with compatible: ['qcom,apq8064-sata-phy']
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: sata@29000000: clock-names:2: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: sata@29000000: clock-names:4: 'pmalive' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: syscon@5700000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
