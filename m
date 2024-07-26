Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5A2C684
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 22:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722031271; cv=none; b=tfACbO4uAi0ANz9WudX/Do6d9cK2jUWg96184VgPWrRRqoHnDH67tIbpZkV4nXfoZwcTW0vmEH2g8f5ykbCVAWgR20pG8FAV7zZxcgplhxi1KsQCHmvDkRVuttHFJpoy2RllTbKc5crrwBxC++WwTvh83EjoZsn6k/+5TpbtFGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722031271; c=relaxed/simple;
	bh=NkFunmS6D+NjLXfc5iX2tg90Z3oMbvOxRT/+GRR+FSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UOGA+vD+4QDk05HsB0r2QFmUktEmdh6s5VTBxFtCk1CqwnGuKea9zqVfYxFPCY/tNO+zYWJZv3/AHNAoATOQph6EGxXPX71/glBKLCkncXYj6ZTp53zxpgqg9SA+RX/Fg8PA1HtPcdkECxBZNJp8R0J2jCg/DuyBXww9tky2EUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9wmJXEW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9wmJXEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722031270; x=1753567270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NkFunmS6D+NjLXfc5iX2tg90Z3oMbvOxRT/+GRR+FSg=;
  b=a9wmJXEW8JULrw+Xqt7ljFtDumHDYwycgoDQAn/ONIXm8ltSVWhxZ+Lv
   hOTDnXIn5h4yRv9/XkhupPIaeerDC4CSiCGiA2TKY8szs6DXfWv2dKejP
   gcr+zudzky6MoHtdIYzVdEf1s7kM00Sj/52GxF4GaOLJ21dJ4QsWfl1Ur
   1UrqREIsyIU56NWlaKP0p3gaLbdREe5zBcP8bKBhLPBd+GG3Go4SrmKt8
   c9zPvD2GIKBo7O5fmO3J2KwrkrBBB2S2gMpMpvxlkKPcSZtXRgLwSYooG
   kxJ3/PZkZMBMiql6iaK7zoNyXj+FruhB1C40DGNYUEZ9P9VmZ3fqf7qn3
   w==;
X-CSE-ConnectionGUID: B/SDGo5QQtGLwzx6TPtmQg==
X-CSE-MsgGUID: bvbFN+x5SHWTuj7FqTyeMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="30452533"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="30452533"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 15:01:09 -0700
X-CSE-ConnectionGUID: oLrttyyeRPuaymgHLCuvxg==
X-CSE-MsgGUID: BRw8AqRZQyGa7vMCU764NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="58171429"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Jul 2024 15:01:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXSzp-000pQk-12;
	Fri, 26 Jul 2024 22:01:05 +0000
Date: Sat, 27 Jul 2024 06:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 13643/13921]
 arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: sata@29000000: clock-names:0:
 'slave_iface' was expected
Message-ID: <202407270547.03GsBp5q-lkp@intel.com>
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
commit: b835b773dbf1b1e8651b6974d5e56731e191c918 [13643/13921] dt-bindings: ata: qcom,ipq806x-ahci: use dtschema
config: arm-randconfig-051-20240726 (https://download.01.org/0day-ci/archive/20240727/202407270547.03GsBp5q-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407270547.03GsBp5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407270547.03GsBp5q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: rpm@108000: 'clock-controller', 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: /soc/pinmux@800000: failed to match any schema with compatible: ['qcom,ipq8064-pinctrl']
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: syscon@3000000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: syscon@1bb00000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: sata@29000000: clock-names:0: 'slave_iface' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: leds: led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'usbdev' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'usbdev' does not match '^cpu[0-9]*$'
   	'usbdev' does not match '^hci[0-9]+-power$'
   	'usbdev' does not match '^mmc[0-9]+$'
   	'usbdev' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: leds: led-0: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: usb@110f8800: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: amba: $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: syscon@1bb00000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: sata@29000000: clock-names:0: 'slave_iface' was expected
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
