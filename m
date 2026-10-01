Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489654E01F6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 22:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895530; cv=none; b=JV8F0j8EQH2y347Ww9XiRQQGRUaJEVHKg2ao3Gb8R2ldZncdjU+hTGV8m/LbcoBUEqv+0rsrVXY1AtttXhxtZBrUULwl+ddIS0/OiSdSZ6QhLesgSF/LS+8Fo3uSy7283uemJdKOB79bq3Pvqz14NSeVq8+pzTse1FeSOc4qIOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895530; c=relaxed/simple;
	bh=XnPoCk+EvYE7Q4ezNE3J2oA4TqiOPmpFlwpZIpyBmTs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bRF6m1vheYSf23S3rxc3bLJ1hdmqh6MkE+MEdoMRSrlhJZL4lJEMCrpkKCFNijVeX/4edEu8TFX4Q0FqHMHgnJOiKwQMQ0IrF3e0bxqPpkBkOj9VsPtpEBhwW1HG7Fz9pyZj8Nz9aBW1Zj3c9p8soQTEcDwb2DN0nIYIUBR+HFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bi4ViTEh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi4ViTEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790895523; x=1822431523;
  h=date:from:to:cc:subject:message-id;
  bh=XnPoCk+EvYE7Q4ezNE3J2oA4TqiOPmpFlwpZIpyBmTs=;
  b=bi4ViTEhGhR8th8WZxRjWBLlK1F39Fbw0UiYmXjflRSivs9PsZGFh4lL
   R8lCzoHKQq8/XDY9LeobsfVkN5rgpkSSQ94BjSXX4jKyRr604gLGzlcO5
   Nc2wQbmY7FSINdNJ1zo6HckLmYwxr234A4WYKYSbGrNyRo/MXIR1MzwEs
   VtRznAY6UTKvb9kJpWgHhcuGsGEMNwTgoq8RzE5g+G10C/h8ROwkdVZ7y
   YpJ99forSN+5q7fLCTPXuDYIB3UqEkHve26S9KpAF8dXIy4DprfTMUwss
   Mi7b06mjcUe1JbGoWivdQCZ7NTypXjA6gy8JgQxL89pvUevXTakWCZIbq
   g==;
X-CSE-ConnectionGUID: rS406thmTpOgvJ8S4i67bQ==
X-CSE-MsgGUID: 6jAvkrvmTiS3E5nxsr2zmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90526835"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90526835"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:58:40 -0700
X-CSE-ConnectionGUID: fm09dY/LTraPK1bJpTrRug==
X-CSE-MsgGUID: TfEAI4PWQsWiBAW4iivf6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275305167"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2026 15:58:38 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCPjY-000000000GR-3cXc;
	Thu, 01 Oct 2026 22:58:36 +0000
Date: Fri, 02 Oct 2026 00:58:28 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12980/13246]
 arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /: failed to match any schema
 with compatible: ['cavium,octeon-3860']
Message-ID: <202610020012.mIrqtS8Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: bfe97f12a0a64c3682be21a02404238e3b91e945 [12980/13246] MIPS: octeon: Add detection of UBNT Edgeroute Lite devices
config: mips-randconfig-2401-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020012.mIrqtS8Z-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020012.mIrqtS8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020012.mIrqtS8Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:12.8-231.4: Warning (unit_address_vs_reg): /soc@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:128.23-144.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:145.23-161.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@4: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:162.23-178.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@5: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:179.23-196.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@6: node has a unit name, but no reg or ranges property
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /: failed to match any schema with compatible: ['cavium,octeon-3860']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/interrupt-controller@1070000000000: failed to match any schema with compatible: ['cavium,octeon-3860-ciu']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/mdio@1180000001800: failed to match any schema with compatible: ['cavium,octeon-3860-mdio']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/pip@11800a0000000: failed to match any schema with compatible: ['cavium,octeon-3860-pip']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/pip@11800a0000000/interface@0: failed to match any schema with compatible: ['cavium,octeon-3860-pip-interface']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@0: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@1: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@2: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/pip@11800a0000000/interface@1: failed to match any schema with compatible: ['cavium,octeon-3860-pip-interface']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/i2c@1180000001000: failed to match any schema with compatible: ['cavium,octeon-3860-twsi']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: serial@1180000000800 (cavium,octeon-3860-uart): reg-shift: 3 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/bootbus@1180000000000: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@0: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\x14' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x00<' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x00<' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00-' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00#' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x00-' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x00#' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@4: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@5: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x01,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x00}' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00\x96' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x00\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x00\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@6: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x06' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x01,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x01\x0e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00\x96' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x00F' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/dma-engine@1180000000100: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/dma-engine@1180000000108: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/usbn@1180068000000: failed to match any schema with compatible: ['cavium,octeon-5750-usbn']
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: usbn@1180068000000 (cavium,octeon-5750-usbn): refclk-type: b'crystal\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/ubnt_e100.dtb: /soc@0/usbn@1180068000000/usbc@16f0010000000: failed to match any schema with compatible: ['cavium,octeon-5750-usbc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
