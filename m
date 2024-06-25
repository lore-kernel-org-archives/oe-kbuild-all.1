Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CFE13C9A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 04:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719290776; cv=none; b=HVHmFGlCqN9j/W+t0T2NdGBlMXc52pFlZm5s0q7WukxawTAh38eBCI40bvw3hfJx/EKn24KRLcbwbZPGBJGLFYGREt6B4ty1YtRY17WAnYRSFFysDLc+QVzceXgn9HIFq5HfwOkCWrNHtAU6PQNVOJLOgR3+8CKhvoO0KVPi4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719290776; c=relaxed/simple;
	bh=dVkP+PN9YR9cIQ16YPyP9lBir5P8xWsf/oialT62At4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkivnVpUAC8S+i5mwxHRGjwmAvDsfezZkEigsLCh2NJUzyS88xQ/sX/SoLhQvMwQcx1qR16DHW/Uie6AZ4sYb048CAcshhtNsqWlQ/e72WG/wqWQd2FYGkPcXRYAxhZOLoSDWD3vYAri7go9vNH4FTQyQ3gT0dqMqs1AAO9PZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4QqwZY4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4QqwZY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719290773; x=1750826773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVkP+PN9YR9cIQ16YPyP9lBir5P8xWsf/oialT62At4=;
  b=b4QqwZY4Ayu43ndVyboILyxLhDNXM+R7A3T0XWRbIzaBC6jOSCpj+s/t
   Mz5zA8eeWl6qbPUZfU8bAnjZiQd/0rkaNb9ComryphwP14Jp9CDvCNaRt
   Sek5vr5afTDlcRqH8ghMw0GKSFpejvdPGdszVBvNQqB77zbw/s8JKZr/R
   JbRBdGepZ7SbjK4hoOsKQeBa/BjXgKGDgMdm5bhTAunYAF6dudoLZOSnq
   we/ra7qKp4VTQP9Rwvj34qtUahhb/lfWB6e5GawedVXMdQcIVpZC8meUl
   lftz4iwsUoyq5wSKszxYVPuuyLQcRr4lqcVdpwQCs4e0KpO9icjIeNMmM
   g==;
X-CSE-ConnectionGUID: 9tdjExGIQNCQr4IpIrrIVg==
X-CSE-MsgGUID: oNQ9a2AyR0WXiFWKvWFrjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33744667"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="33744667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 21:46:10 -0700
X-CSE-ConnectionGUID: 1hDTMsv0SluqGtsvt37Slg==
X-CSE-MsgGUID: CAmTf9OVTR2aefvMxAMCSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43386496"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jun 2024 21:46:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLy4E-000E4U-1T;
	Tue, 25 Jun 2024 04:46:06 +0000
Date: Tue, 25 Jun 2024 12:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [robh:for-next 25/25]
 arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb:
 interrupt-controller@20a00: '#size-cells' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202406251241.lpFyrbXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   e83445ff82c319cbfac7f4de5f36746b14b28766
commit: e83445ff82c319cbfac7f4de5f36746b14b28766 [25/25] dt-bindings: interrupt-controller: convert marvell,mpic binding to YAML
config: arm-randconfig-051-20240625 (https://download.01.org/0day-ci/archive/20240625/202406251241.lpFyrbXC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406251241.lpFyrbXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406251241.lpFyrbXC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-c200-v2.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-db.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-db.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-db.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: internal-regs: gpio_leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/i2c@11000/g762@3e: failed to match any schema with compatible: ['gmt,g762']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn102.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/i2c@11000/g762@3e: failed to match any schema with compatible: ['gmt,g762']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-netgear-rn104.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: internal-regs: gpio-fan: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: internal-regs: gpio-keys: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: internal-regs: gpio_leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-rd.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-rd.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-2bay.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/devbus-bootcs: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/devbus-cs0: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/devbus-cs1: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: internal-regs: $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: s35390a@30: $nodename:0: 's35390a@30' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-370-timer']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
--
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: interrupt-controller@d000: #size-cells:0:0: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: interrupt-controller@d000: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6925-pinctrl']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-390-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-390-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-390-gating-clock']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-390-core-clock']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
>> arch/arm/boot/dts/marvell/armada-395-gp.dtb: interrupt-controller@20a00: '#size-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: interrupt-controller@20a00: '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-380-timer', 'marvell,armada-xp-timer']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/timer@20300: failed to match any schema with compatible: ['marvell,armada-380-timer', 'marvell,armada-xp-timer']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/mpcore-soc-ctrl@20d20: failed to match any schema with compatible: ['marvell,armada-380-mpcore-soc-ctrl']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/coherency-fabric@21010: failed to match any schema with compatible: ['marvell,armada-380-coherency-fabric']
   arch/arm/boot/dts/marvell/armada-395-gp.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-390-pmsu', 'marvell,armada-380-pmsu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
