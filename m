Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4220E3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723801308; cv=none; b=nJVx2vmjnhyE+bO/aSQxcOVEpu/w/+rOLsEe0gYlZ1fVALy4XI+D9NCkHTBc95uv+YImuPTMpVE/A8yAh85OPfiz6I0cklToWgaxdsCYcZk4xvwDoTnC9/ePHq9DFkMAzcyPCys4BWDdmSnBH+E2Rv3tbck1AEu7UglL3kmX7yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723801308; c=relaxed/simple;
	bh=LEh7y3RvrmBIl8/0m9ELyzWGFozQkcrmoxXQ2U5LcA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ga3oNXd+SDTq7rOWB8RJNqshbGonkikzn1ODsBKYWbCeSCZBF7fDY4vVIJVZlF+/04HvWQh7YkQt3JaufxG8DyQIpY8e3+jIXNV2IMGwb8pCWxOLfwtFmtlWKoy6jHsWwsez1UrhrdCdrlg/rZvwPqfjfCoe1UcGY60RwumV8cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRGyI0kg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRGyI0kg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723801305; x=1755337305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEh7y3RvrmBIl8/0m9ELyzWGFozQkcrmoxXQ2U5LcA8=;
  b=fRGyI0kgKmf2LsmJ+Gn0ZNfI74QlDazgKqDeGYHbv/u7irS3FlUgJe86
   RYuOJh85fJWmAW2ysQO/yFPBU7Kv2pFzKGnMWtkjKqhATy4WIH1Fb+Hq8
   e+NLD57xcxX/OLim525s53rqu4DKVDkIKwGDcxEJfVyLy1wuVNL1+qb7p
   XuNt4JYmsCYER4jvjygZ5yZR+e5PODQNuu5JkQ1c/BVnw7leEUs1ps4MO
   9LvHS69jy6Y4XrDQE8/ojubGtU8lcXb+oBIZoWcM1a19OgGyhNLqPPD+x
   0KNzZ4rtOT63Ss9mmi4pWmJg3D5B3mgXoWqewUjzdduOMwIWOM4fBw4U2
   Q==;
X-CSE-ConnectionGUID: i0ATX5FnTLaV/agMecpvWg==
X-CSE-MsgGUID: OGQ1dBxRSzulcK6GLLKoyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21727188"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21727188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 02:41:44 -0700
X-CSE-ConnectionGUID: YBZxFFFSTrqsrlkQeU19Pw==
X-CSE-MsgGUID: VilkLnf1QEenNUrWwm3DhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="64033868"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Aug 2024 02:41:43 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1setSm-0006EI-1E;
	Fri, 16 Aug 2024 09:41:40 +0000
Date: Fri, 16 Aug 2024 17:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4883/5190]
 arch/powerpc/boot/dts/adder875-redboot.dtb: mdio@e00: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202408161702.Gm2RMC6h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   367b5c3d53e57d51a5878816804652963da90950
commit: ca35f2837927d73441cfb51174b824ae82a15f93 [4883/5190] dt-bindings: soc: fsl: cpm_qe: convert network.txt to yaml
config: powerpc-randconfig-051-20240816 (https://download.01.org/0day-ci/archive/20240816/202408161702.Gm2RMC6h-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408161702.Gm2RMC6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408161702.Gm2RMC6h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/adder875-redboot.dts:78.12-91.5: Warning (unique_unit_address_if_enabled): /soc@fa200000/mdio@e00: duplicate unit-address (also used in node /soc@fa200000/ethernet@e00)
   arch/powerpc/boot/dts/adder875-redboot.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 16777216]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/adder875-redboot.dtb: /: failed to match any schema with compatible: ['analogue-and-micro,adder875']
   arch/powerpc/boot/dts/adder875-redboot.dtb: localbus@fa200100: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/adder875-redboot.dtb: /localbus@fa200100: failed to match any schema with compatible: ['fsl,mpc885-localbus', 'fsl,pq1-localbus', 'simple-bus']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /localbus@fa200100: failed to match any schema with compatible: ['fsl,mpc885-localbus', 'fsl,pq1-localbus', 'simple-bus']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000: failed to match any schema with compatible: ['fsl,mpc875-immr', 'fsl,pq1-soc', 'simple-bus']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000: failed to match any schema with compatible: ['fsl,mpc875-immr', 'fsl,pq1-soc', 'simple-bus']
>> arch/powerpc/boot/dts/adder875-redboot.dtb: mdio@e00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc875-fec-mdio', 'fsl,pq1-fec-mdio'] is too long
   	['fsl,mpc875-fec-mdio', 'fsl,pq1-fec-mdio'] is too short
   	'fsl,mpc875-fec-mdio' is not one of ['fsl,pq1-fec-mdio', 'fsl,cpm2-mdio-bitbang']
   	'fsl,mpc8272ads-mdio-bitbang' was expected
   	'fsl,mpc8272-mdio-bitbang' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
>> arch/powerpc/boot/dts/adder875-redboot.dtb: mdio@e00: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000/mdio@e00: failed to match any schema with compatible: ['fsl,mpc875-fec-mdio', 'fsl,pq1-fec-mdio']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc875-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc875-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000/ethernet@1e00: failed to match any schema with compatible: ['fsl,mpc875-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000/ethernet@1e00: failed to match any schema with compatible: ['fsl,mpc875-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000/interrupt-controller@0: failed to match any schema with compatible: ['fsl,mpc875-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/adder875-redboot.dtb: /soc@fa200000/interrupt-controller@0: failed to match any schema with compatible: ['fsl,mpc875-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/adder875-redboot.dtb: cpm@9c0: $nodename:0: 'cpm@9c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/powerpc/boot/dts/adder875-uboot.dts:77.12-90.5: Warning (unique_unit_address_if_enabled): /soc@ff000000/mdio@e00: duplicate unit-address (also used in node /soc@ff000000/ethernet@e00)
   arch/powerpc/boot/dts/adder875-uboot.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 16777216]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/adder875-uboot.dtb: /: failed to match any schema with compatible: ['analogue-and-micro,adder875']
   arch/powerpc/boot/dts/adder875-uboot.dtb: localbus@ff000100: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/adder875-uboot.dtb: /localbus@ff000100: failed to match any schema with compatible: ['fsl,mpc885-localbus', 'fsl,pq1-localbus', 'simple-bus']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /localbus@ff000100: failed to match any schema with compatible: ['fsl,mpc885-localbus', 'fsl,pq1-localbus', 'simple-bus']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000: failed to match any schema with compatible: ['fsl,mpc875-immr', 'fsl,pq1-soc', 'simple-bus']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000: failed to match any schema with compatible: ['fsl,mpc875-immr', 'fsl,pq1-soc', 'simple-bus']
>> arch/powerpc/boot/dts/adder875-uboot.dtb: mdio@e00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc875-fec-mdio', 'fsl,pq1-fec-mdio'] is too long
   	['fsl,mpc875-fec-mdio', 'fsl,pq1-fec-mdio'] is too short
   	'fsl,mpc875-fec-mdio' is not one of ['fsl,pq1-fec-mdio', 'fsl,cpm2-mdio-bitbang']
   	'fsl,mpc8272ads-mdio-bitbang' was expected
   	'fsl,mpc8272-mdio-bitbang' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
>> arch/powerpc/boot/dts/adder875-uboot.dtb: mdio@e00: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000/mdio@e00: failed to match any schema with compatible: ['fsl,mpc875-fec-mdio', 'fsl,pq1-fec-mdio']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc875-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc875-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000/ethernet@1e00: failed to match any schema with compatible: ['fsl,mpc875-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000/ethernet@1e00: failed to match any schema with compatible: ['fsl,mpc875-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000/interrupt-controller@0: failed to match any schema with compatible: ['fsl,mpc875-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/adder875-uboot.dtb: /soc@ff000000/interrupt-controller@0: failed to match any schema with compatible: ['fsl,mpc875-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/adder875-uboot.dtb: cpm@9c0: $nodename:0: 'cpm@9c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0: failed to match any schema with compatible: ['fsl,mpc8248-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0: failed to match any schema with compatible: ['fsl,mpc8248-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8248-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8248-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8248-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/serial@11a80: failed to match any schema with compatible: ['fsl,mpc8248-smc-uart', 'fsl,cpm2-smc-uart']
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/serial@11a80: failed to match any schema with compatible: ['fsl,mpc8248-smc-uart', 'fsl,cpm2-smc-uart']
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/serial@11a00: failed to match any schema with compatible: ['fsl,mpc8248-scc-uart', 'fsl,cpm2-scc-uart']
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/serial@11a00: failed to match any schema with compatible: ['fsl,mpc8248-scc-uart', 'fsl,cpm2-scc-uart']
>> arch/powerpc/boot/dts/ep8248e.dtb: ethernet@11300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8248-fcc-enet', 'fsl,cpm2-fcc-enet'] is too long
   	'fsl,mpc8248-fcc-enet' is not one of ['fsl,cpm1-scc-enet', 'fsl,cpm2-scc-enet', 'fsl,cpm1-fec-enet', 'fsl,cpm2-fcc-enet', 'fsl,qe-enet']
   	'fsl,mpc8248-fcc-enet' is not one of ['fsl,mpc8272-fcc-enet']
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
>> arch/powerpc/boot/dts/ep8248e.dtb: ethernet@11300: Unevaluated properties are not allowed ('compatible', 'device_type', 'linux,network-index' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/ethernet@11300: failed to match any schema with compatible: ['fsl,mpc8248-fcc-enet', 'fsl,cpm2-fcc-enet']
   arch/powerpc/boot/dts/ep8248e.dtb: ethernet@11320: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8248-fcc-enet', 'fsl,cpm2-fcc-enet'] is too long
   	'fsl,mpc8248-fcc-enet' is not one of ['fsl,cpm1-scc-enet', 'fsl,cpm2-scc-enet', 'fsl,cpm1-fec-enet', 'fsl,cpm2-fcc-enet', 'fsl,qe-enet']
   	'fsl,mpc8248-fcc-enet' is not one of ['fsl,mpc8272-fcc-enet']
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/ep8248e.dtb: ethernet@11320: Unevaluated properties are not allowed ('compatible', 'device_type', 'linux,network-index' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/ep8248e.dtb: /soc@f0000000/cpm@119c0/ethernet@11320: failed to match any schema with compatible: ['fsl,mpc8248-fcc-enet', 'fsl,cpm2-fcc-enet']
--
   arch/powerpc/boot/dts/ep88xc.dts:122.13-131.5: Warning (interrupt_provider): /soc@fa200000/pcmcia@80: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/ep88xc.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/ep88xc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/ep88xc.dtb: /: failed to match any schema with compatible: ['fsl,ep88xc']
   arch/powerpc/boot/dts/ep88xc.dtb: /localbus@fa200100: failed to match any schema with compatible: ['fsl,mpc885-localbus', 'fsl,pq1-localbus']
   arch/powerpc/boot/dts/ep88xc.dtb: /localbus@fa200100: failed to match any schema with compatible: ['fsl,mpc885-localbus', 'fsl,pq1-localbus']
   arch/powerpc/boot/dts/ep88xc.dtb: /localbus@fa200100/board-control@3,400000: failed to match any schema with compatible: ['fsl,ep88xc-bcsr']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000: failed to match any schema with compatible: ['fsl,mpc885', 'fsl,pq1-soc']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000: failed to match any schema with compatible: ['fsl,mpc885', 'fsl,pq1-soc']
>> arch/powerpc/boot/dts/ep88xc.dtb: mdio@e00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc885-fec-mdio', 'fsl,pq1-fec-mdio'] is too long
   	['fsl,mpc885-fec-mdio', 'fsl,pq1-fec-mdio'] is too short
   	'fsl,mpc885-fec-mdio' is not one of ['fsl,pq1-fec-mdio', 'fsl,cpm2-mdio-bitbang']
   	'fsl,mpc8272ads-mdio-bitbang' was expected
   	'fsl,mpc8272-mdio-bitbang' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
>> arch/powerpc/boot/dts/ep88xc.dtb: mdio@e00: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/mdio@e00: failed to match any schema with compatible: ['fsl,mpc885-fec-mdio', 'fsl,pq1-fec-mdio']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc885-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc885-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/ethernet@1e00: failed to match any schema with compatible: ['fsl,mpc885-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/ethernet@1e00: failed to match any schema with compatible: ['fsl,mpc885-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/interrupt-controller@0: failed to match any schema with compatible: ['fsl,mpc885-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/interrupt-controller@0: failed to match any schema with compatible: ['fsl,mpc885-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/pcmcia@80: failed to match any schema with compatible: ['fsl,pq-pcmcia']
   arch/powerpc/boot/dts/ep88xc.dtb: /soc@fa200000/cpm@9c0: failed to match any schema with compatible: ['fsl,mpc885-cpm', 'fsl,cpm1']
--
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8560-cpm', 'fsl,cpm2']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8560-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8560-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/serial@91a00: failed to match any schema with compatible: ['fsl,mpc8560-scc-uart', 'fsl,cpm2-scc-uart']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/serial@91a00: failed to match any schema with compatible: ['fsl,mpc8560-scc-uart', 'fsl,cpm2-scc-uart']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/serial@91a20: failed to match any schema with compatible: ['fsl,mpc8560-scc-uart', 'fsl,cpm2-scc-uart']
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/serial@91a20: failed to match any schema with compatible: ['fsl,mpc8560-scc-uart', 'fsl,cpm2-scc-uart']
>> arch/powerpc/boot/dts/ksi8560.dtb: ethernet@91300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8560-fcc-enet', 'fsl,cpm2-fcc-enet'] is too long
   	'fsl,mpc8560-fcc-enet' is not one of ['fsl,cpm1-scc-enet', 'fsl,cpm2-scc-enet', 'fsl,cpm1-fec-enet', 'fsl,cpm2-fcc-enet', 'fsl,qe-enet']
   	'fsl,mpc8560-fcc-enet' is not one of ['fsl,mpc8272-fcc-enet']
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
>> arch/powerpc/boot/dts/ksi8560.dtb: ethernet@91300: Unevaluated properties are not allowed ('compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/ksi8560.dtb: /soc@fdf00000/cpm@919c0/ethernet@91300: failed to match any schema with compatible: ['fsl,mpc8560-fcc-enet', 'fsl,cpm2-fcc-enet']
   arch/powerpc/boot/dts/ksi8560.dtb: localbus@fdf05000: cpld@4,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/ksi8560.dtb: localbus@fdf05000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/ksi8560.dtb: /localbus@fdf05000: failed to match any schema with compatible: ['fsl,mpc8560-localbus', 'simple-bus']
   arch/powerpc/boot/dts/ksi8560.dtb: /localbus@fdf05000/cpld@4,0: failed to match any schema with compatible: ['emerson,KSI8560-cpld']
--
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-muram.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: muram: compatible: ['fsl,cpm-muram'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-muram.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: muram: 'data@0' does not match any of the regexes: '^data\\-only@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-muram.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8247-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8247-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8247-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/serial@11a90: failed to match any schema with compatible: ['fsl,mpc8247-smc-uart', 'fsl,cpm2-smc-uart']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/serial@11a90: failed to match any schema with compatible: ['fsl,mpc8247-smc-uart', 'fsl,cpm2-smc-uart']
>> arch/powerpc/boot/dts/mgcoge.dtb: ethernet@11a60: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8247-scc-enet', 'fsl,cpm2-scc-enet'] is too long
   	'fsl,mpc8247-scc-enet' is not one of ['fsl,cpm1-scc-enet', 'fsl,cpm2-scc-enet', 'fsl,cpm1-fec-enet', 'fsl,cpm2-fcc-enet', 'fsl,qe-enet']
   	'fsl,mpc8247-scc-enet' is not one of ['fsl,mpc8272-fcc-enet']
   	'fsl,cpm2-fcc-enet' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
>> arch/powerpc/boot/dts/mgcoge.dtb: ethernet@11a60: Unevaluated properties are not allowed ('compatible', 'device_type', 'linux,network-index' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/ethernet@11a60: failed to match any schema with compatible: ['fsl,mpc8247-scc-enet', 'fsl,cpm2-scc-enet']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/i2c@11860: failed to match any schema with compatible: ['fsl,mpc8272-i2c', 'fsl,cpm2-i2c']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/i2c@11860: failed to match any schema with compatible: ['fsl,mpc8272-i2c', 'fsl,cpm2-i2c']
>> arch/powerpc/boot/dts/mgcoge.dtb: ethernet@11300: Unevaluated properties are not allowed ('device_type', 'linux,network-index' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: ethernet@11320: Unevaluated properties are not allowed ('device_type', 'linux,network-index' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/usb@11b60: failed to match any schema with compatible: ['fsl,mpc8272-cpm-usb']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/spi@11aa0: failed to match any schema with compatible: ['fsl,spi', 'fsl,cpm2-spi']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/spi@11aa0: failed to match any schema with compatible: ['fsl,spi', 'fsl,cpm2-spi']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/gpio-controller@10d60: failed to match any schema with compatible: ['fsl,cpm2-pario-bank']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/gpio-controller@10d40: failed to match any schema with compatible: ['fsl,cpm2-pario-bank']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/interrupt-controller@10c00: failed to match any schema with compatible: ['fsl,mpc8247-pic', 'fsl,pq2-pic']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/interrupt-controller@10c00: failed to match any schema with compatible: ['fsl,mpc8247-pic', 'fsl,pq2-pic']
--
   arch/powerpc/boot/dts/mpc866ads.dts:36.9-39.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc866ads.dts:66.12-74.5: Warning (unique_unit_address_if_enabled): /soc@ff000000/mdio@e00: duplicate unit-address (also used in node /soc@ff000000/ethernet@e00)
   arch/powerpc/boot/dts/mpc866ads.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 8388608]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc866ads.dtb: /: failed to match any schema with compatible: ['fsl,mpc866ads']
   arch/powerpc/boot/dts/mpc866ads.dtb: /localbus@ff000100: failed to match any schema with compatible: ['fsl,mpc866-localbus', 'fsl,pq1-localbus']
   arch/powerpc/boot/dts/mpc866ads.dtb: /localbus@ff000100: failed to match any schema with compatible: ['fsl,mpc866-localbus', 'fsl,pq1-localbus']
   arch/powerpc/boot/dts/mpc866ads.dtb: /localbus@ff000100/board-control@1,0: failed to match any schema with compatible: ['fsl,mpc866ads-bcsr']
>> arch/powerpc/boot/dts/mpc866ads.dtb: mdio@e00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc866-fec-mdio', 'fsl,pq1-fec-mdio'] is too long
   	['fsl,mpc866-fec-mdio', 'fsl,pq1-fec-mdio'] is too short
   	'fsl,mpc866-fec-mdio' is not one of ['fsl,pq1-fec-mdio', 'fsl,cpm2-mdio-bitbang']
   	'fsl,mpc8272ads-mdio-bitbang' was expected
   	'fsl,mpc8272-mdio-bitbang' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
>> arch/powerpc/boot/dts/mpc866ads.dtb: mdio@e00: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/mdio@e00: failed to match any schema with compatible: ['fsl,mpc866-fec-mdio', 'fsl,pq1-fec-mdio']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc866-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc866-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/pic@0: failed to match any schema with compatible: ['fsl,mpc866-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/pic@0: failed to match any schema with compatible: ['fsl,mpc866-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0: failed to match any schema with compatible: ['fsl,mpc866-cpm', 'fsl,cpm1']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0: failed to match any schema with compatible: ['fsl,mpc866-cpm', 'fsl,cpm1']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc866-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc866-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc866-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/pic@930: failed to match any schema with compatible: ['fsl,mpc866-cpm-pic', 'fsl,cpm1-pic']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/pic@930: failed to match any schema with compatible: ['fsl,mpc866-cpm-pic', 'fsl,cpm1-pic']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/serial@a80: failed to match any schema with compatible: ['fsl,mpc866-smc-uart', 'fsl,cpm1-smc-uart']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/serial@a80: failed to match any schema with compatible: ['fsl,mpc866-smc-uart', 'fsl,cpm1-smc-uart']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/serial@a90: failed to match any schema with compatible: ['fsl,mpc866-smc-uart', 'fsl,cpm1-smc-uart']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/serial@a90: failed to match any schema with compatible: ['fsl,mpc866-smc-uart', 'fsl,cpm1-smc-uart']
>> arch/powerpc/boot/dts/mpc866ads.dtb: ethernet@a00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc866-scc-enet', 'fsl,cpm1-scc-enet'] is too long
   	'fsl,mpc866-scc-enet' is not one of ['fsl,cpm1-scc-enet', 'fsl,cpm2-scc-enet', 'fsl,cpm1-fec-enet', 'fsl,cpm2-fcc-enet', 'fsl,qe-enet']
   	'fsl,mpc866-scc-enet' is not one of ['fsl,mpc8272-fcc-enet']
   	'fsl,cpm2-fcc-enet' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
>> arch/powerpc/boot/dts/mpc866ads.dtb: ethernet@a00: Unevaluated properties are not allowed ('compatible', 'device_type', 'linux,network-index' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/ethernet@a00: failed to match any schema with compatible: ['fsl,mpc866-scc-enet', 'fsl,cpm1-scc-enet']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/i2c@860: failed to match any schema with compatible: ['fsl,mpc866-i2c', 'fsl,cpm1-i2c']
   arch/powerpc/boot/dts/mpc866ads.dtb: /soc@ff000000/cpm@9c0/i2c@860: failed to match any schema with compatible: ['fsl,mpc866-i2c', 'fsl,cpm1-i2c']
--
   arch/powerpc/boot/dts/mpc885ads.dts:127.13-136.5: Warning (interrupt_provider): /soc@ff000000/pcmcia@80: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/mpc885ads.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/mpc885ads.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc885ads.dtb: /: failed to match any schema with compatible: ['fsl,mpc885ads']
   arch/powerpc/boot/dts/mpc885ads.dtb: /localbus@ff000100: failed to match any schema with compatible: ['fsl,mpc885-localbus', 'fsl,pq1-localbus']
   arch/powerpc/boot/dts/mpc885ads.dtb: /localbus@ff000100: failed to match any schema with compatible: ['fsl,mpc885-localbus', 'fsl,pq1-localbus']
   arch/powerpc/boot/dts/mpc885ads.dtb: /localbus@ff000100/board-control@1,0: failed to match any schema with compatible: ['fsl,mpc885ads-bcsr']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000: failed to match any schema with compatible: ['fsl,mpc885', 'fsl,pq1-soc']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000: failed to match any schema with compatible: ['fsl,mpc885', 'fsl,pq1-soc']
>> arch/powerpc/boot/dts/mpc885ads.dtb: mdio@e00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc885-fec-mdio', 'fsl,pq1-fec-mdio'] is too long
   	['fsl,mpc885-fec-mdio', 'fsl,pq1-fec-mdio'] is too short
   	'fsl,mpc885-fec-mdio' is not one of ['fsl,pq1-fec-mdio', 'fsl,cpm2-mdio-bitbang']
   	'fsl,mpc8272ads-mdio-bitbang' was expected
   	'fsl,mpc8272-mdio-bitbang' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
>> arch/powerpc/boot/dts/mpc885ads.dtb: mdio@e00: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/mdio@e00: failed to match any schema with compatible: ['fsl,mpc885-fec-mdio', 'fsl,pq1-fec-mdio']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc885-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc885-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/ethernet@1e00: failed to match any schema with compatible: ['fsl,mpc885-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/ethernet@1e00: failed to match any schema with compatible: ['fsl,mpc885-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/interrupt-controller@0: failed to match any schema with compatible: ['fsl,mpc885-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/interrupt-controller@0: failed to match any schema with compatible: ['fsl,mpc885-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/pcmcia@80: failed to match any schema with compatible: ['fsl,pq-pcmcia']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0: failed to match any schema with compatible: ['fsl,mpc885-cpm', 'fsl,cpm1']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0: failed to match any schema with compatible: ['fsl,mpc885-cpm', 'fsl,cpm1']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc885-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc885-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc885-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/interrupt-controller@930: failed to match any schema with compatible: ['fsl,mpc885-cpm-pic', 'fsl,cpm1-pic']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/interrupt-controller@930: failed to match any schema with compatible: ['fsl,mpc885-cpm-pic', 'fsl,cpm1-pic']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/serial@a80: failed to match any schema with compatible: ['fsl,mpc885-smc-uart', 'fsl,cpm1-smc-uart']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/serial@a80: failed to match any schema with compatible: ['fsl,mpc885-smc-uart', 'fsl,cpm1-smc-uart']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/serial@a90: failed to match any schema with compatible: ['fsl,mpc885-smc-uart', 'fsl,cpm1-smc-uart']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/serial@a90: failed to match any schema with compatible: ['fsl,mpc885-smc-uart', 'fsl,cpm1-smc-uart']
>> arch/powerpc/boot/dts/mpc885ads.dtb: ethernet@a40: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc885-scc-enet', 'fsl,cpm1-scc-enet'] is too long
   	'fsl,mpc885-scc-enet' is not one of ['fsl,cpm1-scc-enet', 'fsl,cpm2-scc-enet', 'fsl,cpm1-fec-enet', 'fsl,cpm2-fcc-enet', 'fsl,qe-enet']
   	'fsl,mpc885-scc-enet' is not one of ['fsl,mpc8272-fcc-enet']
   	'fsl,cpm2-fcc-enet' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
>> arch/powerpc/boot/dts/mpc885ads.dtb: ethernet@a40: Unevaluated properties are not allowed ('compatible', 'device_type', 'linux,network-index' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/ethernet@a40: failed to match any schema with compatible: ['fsl,mpc885-scc-enet', 'fsl,cpm1-scc-enet']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/i2c@860: failed to match any schema with compatible: ['fsl,mpc885-i2c', 'fsl,cpm1-i2c']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/cpm@9c0/i2c@860: failed to match any schema with compatible: ['fsl,mpc885-i2c', 'fsl,cpm1-i2c']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/crypto@20000: failed to match any schema with compatible: ['fsl,sec1.2', 'fsl,sec1.0']
   arch/powerpc/boot/dts/mpc885ads.dtb: /soc@ff000000/crypto@20000: failed to match any schema with compatible: ['fsl,sec1.2', 'fsl,sec1.0']
--
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8560-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8560-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8560-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/serial@91a00: failed to match any schema with compatible: ['fsl,mpc8560-scc-uart', 'fsl,cpm2-scc-uart']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/serial@91a00: failed to match any schema with compatible: ['fsl,mpc8560-scc-uart', 'fsl,cpm2-scc-uart']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/serial@91a20: failed to match any schema with compatible: ['fsl,mpc8560-scc-uart', 'fsl,cpm2-scc-uart']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/serial@91a20: failed to match any schema with compatible: ['fsl,mpc8560-scc-uart', 'fsl,cpm2-scc-uart']
>> arch/powerpc/boot/dts/tqm8560.dtb: ethernet@91340: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8560-fcc-enet', 'fsl,cpm2-fcc-enet'] is too long
   	'fsl,mpc8560-fcc-enet' is not one of ['fsl,cpm1-scc-enet', 'fsl,cpm2-scc-enet', 'fsl,cpm1-fec-enet', 'fsl,cpm2-fcc-enet', 'fsl,qe-enet']
   	'fsl,mpc8560-fcc-enet' is not one of ['fsl,mpc8272-fcc-enet']
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
>> arch/powerpc/boot/dts/tqm8560.dtb: ethernet@91340: Unevaluated properties are not allowed ('compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/ethernet@91340: failed to match any schema with compatible: ['fsl,mpc8560-fcc-enet', 'fsl,cpm2-fcc-enet']
   arch/powerpc/boot/dts/tqm8560.dtb: localbus@e0005000: can0@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8560.dtb: localbus@e0005000: can1@2,100: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8560.dtb: localbus@e0005000: flash@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/tqm8560.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8560-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8560.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8560-localbus', 'fsl,pq3-localbus', 'simple-bus']
--
   arch/powerpc/boot/dts/tqm8xx.dts:43.9-46.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/tqm8xx.dts:99.18-107.5: Warning (unique_unit_address_if_enabled): /soc@fff00000/mdio@e00: duplicate unit-address (also used in node /soc@fff00000/ethernet@e00)
   arch/powerpc/boot/dts/tqm8xx.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 33554432]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/tqm8xx.dtb: /: failed to match any schema with compatible: ['tqc,tqm8xx']
   arch/powerpc/boot/dts/tqm8xx.dtb: /localbus@fff00100: failed to match any schema with compatible: ['fsl,mpc860-localbus', 'fsl,pq1-localbus']
   arch/powerpc/boot/dts/tqm8xx.dtb: /localbus@fff00100: failed to match any schema with compatible: ['fsl,mpc860-localbus', 'fsl,pq1-localbus']
   arch/powerpc/boot/dts/tqm8xx.dtb: /localbus@fff00100/can@3,0: failed to match any schema with compatible: ['intc,82527']
   arch/powerpc/boot/dts/tqm8xx.dtb: /localbus@fff00100/can@3,100: failed to match any schema with compatible: ['intc,82527']
>> arch/powerpc/boot/dts/tqm8xx.dtb: mdio@e00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc866-fec-mdio', 'fsl,pq1-fec-mdio'] is too long
   	['fsl,mpc866-fec-mdio', 'fsl,pq1-fec-mdio'] is too short
   	'fsl,mpc866-fec-mdio' is not one of ['fsl,pq1-fec-mdio', 'fsl,cpm2-mdio-bitbang']
   	'fsl,mpc8272ads-mdio-bitbang' was expected
   	'fsl,mpc8272-mdio-bitbang' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
>> arch/powerpc/boot/dts/tqm8xx.dtb: mdio@e00: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-mdio.yaml#
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/mdio@e00: failed to match any schema with compatible: ['fsl,mpc866-fec-mdio', 'fsl,pq1-fec-mdio']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc866-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/ethernet@e00: failed to match any schema with compatible: ['fsl,mpc866-fec-enet', 'fsl,pq1-fec-enet']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/pic@0: failed to match any schema with compatible: ['fsl,mpc860-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/pic@0: failed to match any schema with compatible: ['fsl,mpc860-pic', 'fsl,pq1-pic']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0: failed to match any schema with compatible: ['fsl,mpc860-cpm', 'fsl,cpm1']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0: failed to match any schema with compatible: ['fsl,mpc860-cpm', 'fsl,cpm1']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc860-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc860-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0/brg@9f0: failed to match any schema with compatible: ['fsl,mpc860-brg', 'fsl,cpm1-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0/pic@930: failed to match any schema with compatible: ['fsl,mpc860-cpm-pic', 'fsl,cpm1-pic']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0/pic@930: failed to match any schema with compatible: ['fsl,mpc860-cpm-pic', 'fsl,cpm1-pic']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0/serial@a80: failed to match any schema with compatible: ['fsl,mpc860-smc-uart', 'fsl,cpm1-smc-uart']
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0/serial@a80: failed to match any schema with compatible: ['fsl,mpc860-smc-uart', 'fsl,cpm1-smc-uart']
>> arch/powerpc/boot/dts/tqm8xx.dtb: ethernet@a00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc860-scc-enet', 'fsl,cpm1-scc-enet'] is too long
   	'fsl,mpc860-scc-enet' is not one of ['fsl,cpm1-scc-enet', 'fsl,cpm2-scc-enet', 'fsl,cpm1-fec-enet', 'fsl,cpm2-fcc-enet', 'fsl,qe-enet']
   	'fsl,mpc860-scc-enet' is not one of ['fsl,mpc8272-fcc-enet']
   	'fsl,cpm2-fcc-enet' was expected
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
>> arch/powerpc/boot/dts/tqm8xx.dtb: ethernet@a00: Unevaluated properties are not allowed ('compatible', 'device_type', 'linux,network-index' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,cpm-enet.yaml#
   arch/powerpc/boot/dts/tqm8xx.dtb: /soc@fff00000/cpm@9c0/ethernet@a00: failed to match any schema with compatible: ['fsl,mpc860-scc-enet', 'fsl,cpm1-scc-enet']
--
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: ucc@2000: 'device_type', 'fsl,hdlc-bus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,ucc-hdlc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
