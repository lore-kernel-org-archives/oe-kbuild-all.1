Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EDD1F176
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718644596; cv=none; b=WAJr9sclLS0MoTYaQC1AhG19XfyRkBI/HPEir/xjwGJ6p3i9PvFwgF2FH7YeOAP8XCxtYWvRm4HgVYpgY32JTQ5gBu4N5T8O5GCjxVKoSobU4kuQpOLyFg19e2udg8d7cpwA5m7a1i0V3YS+tYx3aAtU9aUDPljnbgE1Exx6qgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718644596; c=relaxed/simple;
	bh=SWscKbbxyXkQ64P7RkWJkZfmP/UdI1i/9o5fMyJdTR8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bO0GR32MLhfz1Rozz+OAnMAYSmZSvDJZaUOzv2Rx6rkLB2lHIf7DscftJLq55qgrMkgwKONH7hnfXX8cPL0ZHgLMrB83iqD1YI19gbTGsbAF5y5mnDBBApW411A3o0ByWfrvlDwN3BTX3aN/f6PyUczKR35EUGuThMRzxZGeppM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlvUcXAh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlvUcXAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718644594; x=1750180594;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SWscKbbxyXkQ64P7RkWJkZfmP/UdI1i/9o5fMyJdTR8=;
  b=RlvUcXAhsUfEaaPOxVIpvhQJAy2eMdnW2CHDPBS4SBtP7vLsvcGEpOZ0
   X+0eSGqK0ZV6hZ/YmRYcnuFAq2qu+R/zakbFKkHOA8StomEhnRNU8suzT
   c0QM6ccgg1uZiMcTprKbh204HnBT08lEvdDQwNDshtizjY4QkwTm3ldA+
   OcIfDEWDBrQuDZXgPuxhoHn/saYzUQBrj4FdvnC55eEuAs90344hh0Uac
   IXuZ2uZ47YTd3k84DQqH7s5LQnh8Dn/iQa7xpXB0gh4XD2wfMmoyeAHQE
   +1yT1flus+L43HQ/L2wh4tqsb9JFCXeP5J/s0lSfB+0KfGUq3/FNzFoEd
   Q==;
X-CSE-ConnectionGUID: dMByAw28QPmggqnSVhB0VA==
X-CSE-MsgGUID: vj6iZVysTMabqEqGIjnyOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26878675"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="26878675"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:16:34 -0700
X-CSE-ConnectionGUID: sG6/zhLoR3uf6abgh0VlCw==
X-CSE-MsgGUID: MsIq/sH3RQC5bwVGa9zMng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="41341656"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2024 10:16:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJFy2-0004iP-1a;
	Mon, 17 Jun 2024 17:16:30 +0000
Date: Tue, 18 Jun 2024 01:16:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 49/137]
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0:
 pinctrl-names:1: 'wakeup' was expected
Message-ID: <202406180124.OwfRPzFB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   28ca41014f923e6e0e314492899b7cda49439c39
commit: 426ed3f5b3b21fbfee391953c3e9cf3d9dc4831f [49/137] dt-bindings: serial: 8250_omap: Add wakeup pinctrl state
config: arm-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240618/202406180124.OwfRPzFB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180124.OwfRPzFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180124.OwfRPzFB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am3352-uart', 'ti,omap3-uart'] is too long
   	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
   	'ti,am654-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am3352-uart', 'ti,omap3-uart'] is too long
   	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
   	'ti,am654-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0: pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: serial@0: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: i2c@0: 'scl-gpios', 'sda-gpios' do not match any of the regexes: '@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/i2c/ti,omap4-i2c.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@100000: $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: segment@100000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
