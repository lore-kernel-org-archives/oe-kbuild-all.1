Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573E13BC03
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720888002; cv=none; b=P77R3p1Q4+wtQEVNA71xoZjAKZAwI84WrTS4y7jArg0QPWpAzQlaJ54rObKG6OVbtozOu9iLTRUgrC2wCnDjS5kvk+u2Hiea/Xc1SkMkOB+BpoIWDIqiwGd8ZfQdNoDHBjkIkTqw7EfFrPaG5CGeQ1haCtqRTYVqkhqLDruhNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720888002; c=relaxed/simple;
	bh=oA/1Gjc78TK5F18XYGjwwrM8uUP0sKvUDteqbea+z3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTrXWNheho1iRdOEb6/OmfO3RWmaAY9iFOKufgifpwHYdaoN0/oN4bYPMaXw1gC7mMoCg4eWbGBowNXWNZEO/g1+ZBnJ73ocjyBFwAuJ4U92CZDW5XaZwdWuxTXLz2k64dbnpru5dkGfXOZ57+ijjQL2TqMuP8DRG4WvHlvEFvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbpL7tSD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbpL7tSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720887998; x=1752423998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oA/1Gjc78TK5F18XYGjwwrM8uUP0sKvUDteqbea+z3c=;
  b=gbpL7tSDnzfNliVAKOjVWC7X7Gv86fFurEUjtlFJG9i83Uncb3ffB3xI
   wl/cqDqvt3dX7ZrbWzxsvXv7d530oc/lQillyCl4vQkVF9STKvcaOiMm0
   LEFJR8cozg4QZmtcNYTJA4tmA6nPCgjANOEMnx1Q8A80VVL4/ohTPi1Jx
   S6JP3tSfuF2sQCmn+ZX1snHnTPgJXCvqE9drLFBON0vRn7NSwrJTsbQL1
   ojSwf1F4XVgYIL208pRyXnoTObEB+dFztwSLDwRVGYU2NAaMB1V4jG6fZ
   lCkonJb4Ra41QkKbMZJYj4jRYrGEhVrh0YcwcYmLm7R65NVS5LxM9xuPo
   w==;
X-CSE-ConnectionGUID: SBEykS2RQwC+Tdit3k+dfg==
X-CSE-MsgGUID: 3hFU3DXbQj+vLK7lstBPwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18449668"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="18449668"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 09:26:37 -0700
X-CSE-ConnectionGUID: kIeVnx9BQ3enD7bO7NQBtg==
X-CSE-MsgGUID: 9RYj58UwTgyU0Mb54yhmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49586404"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jul 2024 09:26:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSfZw-000cV6-1P;
	Sat, 13 Jul 2024 16:26:32 +0000
Date: Sun, 14 Jul 2024 00:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 11301/12880] arch/powerpc/boot/dts/kmeter1.dtb:
 qe@100000: compatible: ['fsl,qe'] is too short
Message-ID: <202407140032.eJYKr1v6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: ecbfc6ff94a21a87bfff3d0f65351964e3380839 [11301/12880] dt-bindings: soc: fsl: cpm_qe: convert to yaml format
config: powerpc-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240714/202407140032.eJYKr1v6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140032.eJYKr1v6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140032.eJYKr1v6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8360-par_io']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400/gpio-controller@30: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400/gpio-controller@30: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
>> arch/powerpc/boot/dts/kmeter1.dtb: qe@100000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/kmeter1.dtb: qe@100000: interrupt-controller@80:interrupts: [[32, 8], [33, 8], [34, 8], [35, 8], [40, 8], [41, 8], [42, 8], [43, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/kmeter1.dtb: qe@100000: interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/kmeter1.dtb: qe@100000: $nodename:0: 'qe@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/kmeter1.dtb: qe@100000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/kmeter1.dtb: qe@100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'compatible', 'mdio@3320', 'ucc@2000', 'ucc@2400', 'ucc@2600', 'ucc@3000', 'ucc@3200', 'ucc@3400', 'ucc@3600' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/qe@100000/ucc@2000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/qe@100000/ucc@3000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/qe@100000/ucc@3200: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/qe@100000/ucc@2400: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/qe@100000/ucc@3400: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/qe@100000/ucc@2600: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/qe@100000/ucc@3600: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/qe@100000/mdio@3320: failed to match any schema with compatible: ['fsl,ucc-mdio']
>> arch/powerpc/boot/dts/kmeter1.dtb: interrupt-controller@80: interrupts: [[32, 8], [33, 8], [34, 8], [35, 8], [40, 8], [41, 8], [42, 8], [43, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
>> arch/powerpc/boot/dts/kmeter1.dtb: interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: localbus@e0005000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8360-localbus', 'fsl,pq2pro-localbus', 'simple-bus']
   arch/powerpc/boot/dts/kmeter1.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8360-localbus', 'fsl,pq2pro-localbus', 'simple-bus']
--
   arch/powerpc/boot/dts/mgcoge.dtb: flash@5,0: 'partition@app' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000: failed to match any schema with compatible: ['fsl,mpc8247-immr', 'fsl,pq2-soc', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000: failed to match any schema with compatible: ['fsl,mpc8247-immr', 'fsl,pq2-soc', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: cpm@119c0: $nodename:0: 'cpm@119c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: cpm@119c0: muram:ranges: [[0, 0, 65536]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0: failed to match any schema with compatible: ['fsl,mpc8247-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0: failed to match any schema with compatible: ['fsl,mpc8247-cpm', 'fsl,cpm2', 'simple-bus']
>> arch/powerpc/boot/dts/mgcoge.dtb: muram: compatible:0: 'fsl,qe-muram' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-muram.yaml#
>> arch/powerpc/boot/dts/mgcoge.dtb: muram: compatible: ['fsl,cpm-muram'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-muram.yaml#
>> arch/powerpc/boot/dts/mgcoge.dtb: muram: 'data@0' does not match any of the regexes: '^data\\-only@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-muram.yaml#
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8247-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8247-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/brg@119f0: failed to match any schema with compatible: ['fsl,mpc8247-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/serial@11a90: failed to match any schema with compatible: ['fsl,mpc8247-smc-uart', 'fsl,cpm2-smc-uart']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/serial@11a90: failed to match any schema with compatible: ['fsl,mpc8247-smc-uart', 'fsl,cpm2-smc-uart']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/ethernet@11a60: failed to match any schema with compatible: ['fsl,mpc8247-scc-enet', 'fsl,cpm2-scc-enet']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/ethernet@11a60: failed to match any schema with compatible: ['fsl,mpc8247-scc-enet', 'fsl,cpm2-scc-enet']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/i2c@11860: failed to match any schema with compatible: ['fsl,mpc8272-i2c', 'fsl,cpm2-i2c']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0/i2c@11860: failed to match any schema with compatible: ['fsl,mpc8272-i2c', 'fsl,cpm2-i2c']
--
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8323-qe-pario']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/par_io@1400/gpio-controller@1448: failed to match any schema with compatible: ['fsl,mpc8323-qe-pario-bank']
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: $nodename:0: 'qe@e0100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'mdio@3120', 'spi@4c0', 'spi@500', 'ucc@2200', 'ucc@3000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/spi@4c0: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: mmc-slot@0: $nodename:0: 'mmc-slot@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: mmc-slot@0: compatible:0: 'mmc-spi-slot' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: mmc-slot@0: compatible: ['fsl,mpc8323rdb-mmc-slot', 'mmc-spi-slot'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: mmc-slot@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/spi@4c0/mmc-slot@0: failed to match any schema with compatible: ['fsl,mpc8323rdb-mmc-slot', 'mmc-spi-slot']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/spi@500: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/ucc@3000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/ucc@2200: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/mdio@3120: failed to match any schema with compatible: ['fsl,ucc-mdio']
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8349-pci']
--
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.0']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1418: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1418: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1460: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1460: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: qe@100000: interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: qe@100000: $nodename:0: 'qe@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: qe@100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'device_type', 'mdio@2120', 'spi@4c0', 'spi@500', 'timer@440', 'ucc@2000', 'ucc@2400', 'ucc@2600', 'ucc@3000', 'ucc@3200', 'ucc@3400', 'usb@6c0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/timer@440: failed to match any schema with compatible: ['fsl,mpc8360-qe-gtm', 'fsl,qe-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/timer@440: failed to match any schema with compatible: ['fsl,mpc8360-qe-gtm', 'fsl,qe-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/timer@440: failed to match any schema with compatible: ['fsl,mpc8360-qe-gtm', 'fsl,qe-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/usb@6c0: failed to match any schema with compatible: ['fsl,mpc8360-qe-usb', 'fsl,mpc8323-qe-usb']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/usb@6c0: failed to match any schema with compatible: ['fsl,mpc8360-qe-usb', 'fsl,mpc8323-qe-usb']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/spi@4c0: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/spi@500: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/ucc@2000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/ucc@3000: failed to match any schema with compatible: ['ucc_geth']
--
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/mdio@2120/ethernet-phy@3: failed to match any schema with compatible: ['national,DP83848VV']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: ethernet-phy@4: compatible: 'oneOf' conditional failed, one must be fixed:
   	['broadcom,BCM5481UA2KMLG'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'broadcom,BCM5481UA2KMLG' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/mdio@2120/ethernet-phy@4: failed to match any schema with compatible: ['broadcom,BCM5481UA2KMLG']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/ucc@2400: failed to match any schema with compatible: ['ucc_uart']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/qe@100000/ucc@3400: failed to match any schema with compatible: ['ucc_uart']
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: localbus@e0005000: upm@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: localbus@e0005000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: localbus@e0005000: display@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8360-localbus', 'fsl,pq2pro-localbus', 'simple-bus']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8360-localbus', 'fsl,pq2pro-localbus', 'simple-bus']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /localbus@e0005000/upm@1,0: failed to match any schema with compatible: ['fsl,upm-nand']
--
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8568-guts', 'fsl,mpc8548-guts']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8568-guts', 'fsl,mpc8548-guts']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/global-utilities@e0000/power@70: failed to match any schema with compatible: ['fsl,mpc8568-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/global-utilities@e0000/power@70: failed to match any schema with compatible: ['fsl,mpc8568-pmc', 'fsl,mpc8548-pmc']
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: qe@e0080000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: qe@e0080000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: qe@e0080000: $nodename:0: 'qe@e0080000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: qe@e0080000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: qe@e0080000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'mdio@2120', 'sleep', 'spi@4c0', 'spi@500', 'ucc@2000', 'ucc@3000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /qe@e0080000/spi@4c0: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /qe@e0080000/spi@500: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /qe@e0080000/ucc@2000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /qe@e0080000/ucc@3000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /qe@e0080000/mdio@2120: failed to match any schema with compatible: ['fsl,ucc-mdio']
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /pci@e0008000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pcie@e000a000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pcie@e000a000: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /pcie@e000a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /rapidio@e00c00000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: leds: 'amber', 'green', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8569-guts', 'fsl,mpc8548-guts']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8569-guts', 'fsl,mpc8548-guts']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/global-utilities@e0000/power@70: failed to match any schema with compatible: ['fsl,mpc8569-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/global-utilities@e0000/power@70: failed to match any schema with compatible: ['fsl,mpc8569-pmc', 'fsl,mpc8548-pmc']
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000: $nodename:0: 'qe@e0080000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'mdio@2120', 'mdio@2320', 'mdio@3120', 'mdio@3320', 'mdio@3520', 'mdio@3720', 'sleep', 'spi@4c0', 'spi@500', 'timer@440', 'ucc@2000', 'ucc@2200', 'ucc@3000', 'ucc@3200', 'ucc@3400', 'ucc@3600', 'usb@6c0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/spi@4c0: failed to match any schema with compatible: ['fsl,mpc8569-qe-spi', 'fsl,spi']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/spi@4c0: failed to match any schema with compatible: ['fsl,mpc8569-qe-spi', 'fsl,spi']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/spi@500: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/usb@6c0: failed to match any schema with compatible: ['fsl,mpc8569-qe-usb', 'fsl,mpc8323-qe-usb']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/usb@6c0: failed to match any schema with compatible: ['fsl,mpc8569-qe-usb', 'fsl,mpc8323-qe-usb']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/ucc@2000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@2120: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@3520: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@3720: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/ucc@2200: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@2320: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/ucc@3000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@3120: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/ucc@3200: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@3320: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/ucc@3400: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/ucc@3600: failed to match any schema with compatible: ['ucc_geth']
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/timer@440: failed to match any schema with compatible: ['fsl,mpc8569-qe-gtm', 'fsl,qe-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/timer@440: failed to match any schema with compatible: ['fsl,mpc8569-qe-gtm', 'fsl,qe-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/timer@440: failed to match any schema with compatible: ['fsl,mpc8569-qe-gtm', 'fsl,qe-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pcie@e000a000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pcie@e000a000: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /pcie@e000a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /rapidio@e00c00000: failed to match any schema with compatible: ['fsl,srio']
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /pcie@ffe0a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: qe@ffe80000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: qe@ffe80000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: qe@ffe80000: $nodename:0: 'qe@ffe80000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: qe@ffe80000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /qe@ffe80000/ucc@2000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /qe@ffe80000/mdio@2120: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /qe@ffe80000/ucc@2400: failed to match any schema with compatible: ['ucc_geth']
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /pcie@ffe0a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: qe@ffe80000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: qe@ffe80000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: qe@ffe80000: $nodename:0: 'qe@ffe80000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: qe@ffe80000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: qe@ffe80000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'mdio@2120', 'ucc@2000', 'ucc@2200', 'ucc@2400', 'ucc@2600' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /qe@ffe80000/mdio@2120: failed to match any schema with compatible: ['fsl,ucc-mdio']
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /pcie@fffe0a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: qe@fffe80000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: qe@fffe80000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: qe@fffe80000: $nodename:0: 'qe@fffe80000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: qe@fffe80000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: qe@fffe80000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'mdio@2120', 'ucc@2000', 'ucc@2200', 'ucc@2400', 'ucc@2600' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /qe@fffe80000/mdio@2120: failed to match any schema with compatible: ['fsl,ucc-mdio']
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /pcie@ffe0a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: qe@ffe80000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: qe@ffe80000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: qe@ffe80000: $nodename:0: 'qe@ffe80000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: qe@ffe80000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /qe@ffe80000/ucc@2000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /qe@ffe80000/mdio@2120: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /qe@ffe80000/ucc@2400: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /qe@ffe80000/ucc@2600: failed to match any schema with compatible: ['ucc_uart']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /qe@ffe80000/ucc@2200: failed to match any schema with compatible: ['ucc_uart']
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /pcie@fffe0a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: qe@fffe80000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: qe@fffe80000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: qe@fffe80000: $nodename:0: 'qe@fffe80000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: qe@fffe80000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /qe@fffe80000/ucc@2600: failed to match any schema with compatible: ['ucc_uart']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /qe@fffe80000/ucc@2200: failed to match any schema with compatible: ['ucc_uart']
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /qe@fffe80000/mdio@2120: failed to match any schema with compatible: ['fsl,ucc-mdio']
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe0a000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe0a000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /pcie@ffe0a000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: qe@ffe80000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: qe@ffe80000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: qe@ffe80000: $nodename:0: 'qe@ffe80000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: qe@ffe80000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: qe@ffe80000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'mdio@2120', 'ucc@2000', 'ucc@2200', 'ucc@2400', 'ucc@2600' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /qe@ffe80000/ucc@2000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /qe@ffe80000/mdio@2120: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /qe@ffe80000/ucc@2400: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /qe@ffe80000/ucc@2600: failed to match any schema with compatible: ['ucc_uart']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /qe@ffe80000/ucc@2200: failed to match any schema with compatible: ['ucc_uart']
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pcie@ffe260000: pcie@0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pcie@ffe260000: pcie@0:interrupts:0: [22, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pcie@ffe260000: pcie@0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pcie@ffe260000: pcie@0:interrupts:0: [22, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /qe@ffe140000/ucc@2200: failed to match any schema with compatible: ['fsl,t1040-ucc-uart']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /qe@ffe140000/ucc@2200: failed to match any schema with compatible: ['fsl,t1040-ucc-uart']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /qe@ffe140000/ucc@2200: failed to match any schema with compatible: ['fsl,t1040-ucc-uart']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /qe@ffe140000/ucc@2200: failed to match any schema with compatible: ['fsl,t1040-ucc-uart']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /qe@ffe140000/ucc@2200: failed to match any schema with compatible: ['fsl,t1040-ucc-uart']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /qe@ffe140000/ucc@2200: failed to match any schema with compatible: ['fsl,t1040-ucc-uart']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /qe@ffe140000/ucc@2200: failed to match any schema with compatible: ['fsl,t1040-ucc-uart']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pcie@ffe270000: pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pcie@ffe270000: pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000: $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000: compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /qe@ffe140000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /qe@ffe140000/ucc@2200: failed to match any schema with compatible: ['fsl,t1040-ucc-uart']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: interrupt-controller@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
