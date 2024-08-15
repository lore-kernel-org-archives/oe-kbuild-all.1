Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43EA17578
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723691816; cv=none; b=al5UIBJC1wdU6QpQuEf/jwpcDev2vnUpt/1PgRZqDT+p8Nw8U69V+vZ83vBkeX/kWFTY/2j6zUAE6rgA+7IFVYRNmfJFmzhMMdjbu7uyiEiJcCbAuGTXwStnrqALYtka8cKW7LAJMzzJsS4XvLCU05DW5Jpq1pYidUybikOQ9io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723691816; c=relaxed/simple;
	bh=S7P1nmhJ+zfMt5BVdP9VdVqnKU1XqquBN81f5HkfXFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HV7/O9yS8MgHOjV+gOKtvcmoh7B3Rn2kjl3HSr56xxx/ZYir+UQZMBArVJHQI51hzGcDBa9rZVQgKNqFzLSAPXXYBvvPM8sJoI5Omj6XKNLG0bY3Mt0GxOBD09L3ZZ1+MJ8RZEwvDrepQE91vZS+4cYtIHbeUBclU1pkLiWyCTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MK/h/kmt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MK/h/kmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723691815; x=1755227815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S7P1nmhJ+zfMt5BVdP9VdVqnKU1XqquBN81f5HkfXFE=;
  b=MK/h/kmtNcWmEhD6bssQ3qaADDDnGhCxCbrD/OKL5Ud5abDfCIqCdt71
   AYqvW3Jooc49sdUANfetwrDGJbQUZe3xIJWHYmB0gRnTVxmrX911LCGP8
   rTZRzGr0cTcyyFQxNBZjx7ZnziKd7hir/42u0FiLS0GzNpGcStoiQmfWQ
   enYR5ffvbOQll5c7aVZ5WseLkfd2GYn9HTzcP5xSnckSasGZFOxa4n9Dk
   eMICKT9Jq4MnG0cadSre8KBs3ITebonKRwtSYPHwHirEE5/36fTkyWQlT
   Yuw8cgXkUEYKdy03eDyoA7zTbnYHO3AHol52FlTwKkSFR5n9vJJK9pENF
   g==;
X-CSE-ConnectionGUID: Jfa/LMhVTxqtMbaDIIGLYQ==
X-CSE-MsgGUID: heWsD05dQzGv9z/jEBq5Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24842284"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="24842284"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 20:16:54 -0700
X-CSE-ConnectionGUID: DRg+owf3RUqOi2CwjRtLEw==
X-CSE-MsgGUID: hlbRq4IsQG6wnmzL18Mk0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="82431022"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2024 20:16:50 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seQyo-000384-0P;
	Thu, 15 Aug 2024 03:16:50 +0000
Date: Thu, 15 Aug 2024 11:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 3896/4224]
 arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: soc: pmu: 'ranges' is a
 required property
Message-ID: <202408151113.3zLKRmVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   033a4691702cdca3a613256b0623b8eeacb4985e
commit: 71aa9fd7b5dee10a620f0938f3df8a8818a7f232 [3896/4224] arm: dts: realview: Add/drop missing/spurious unit-addreses
config: arm-randconfig-051-20240813 (https://download.01.org/0day-ci/archive/20240815/202408151113.3zLKRmVl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151113.3zLKRmVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151113.3zLKRmVl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: fpga: $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: soc: pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp.dtb: soc: cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: soc: cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: soc: pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: fpga: $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: soc: pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-ctrevb.dtb: soc: cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: fpga: $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: soc: pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: soc: cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: fpga: $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: soc: pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp.dtb: soc: cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: soc: cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: soc: pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
