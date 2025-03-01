Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A91C3BF1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 19:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740859085; cv=none; b=J1Vxz/Dnegc8gr3S1EH/q7gaeC4i78/wPlGwRu2JZoRIHfXkZklDcqgAZbS9dst6XT0Zr/GEZn+WDPAfF+gHAAgl28tJ8xn2yXQjD3OwZTOHsmoBg44cce+4OkS/YUZyjj00XSuZAZqwaSybAsbLm1ZOfagom6OTc2Ayq1l9MNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740859085; c=relaxed/simple;
	bh=OkHqKoUEMSlHGFGlgnVu22ubpbaH43eVeaAsSDs7FsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dW6lxxLLYB+H3GAuBX09liuw3Z9TfGF0iaCVWszXzKL2dqrriBJhZsNlVxRjgCKvcXB4bVcG+js7fjDEmVZ8U+0H8JXYOkHJYc7gucxfwTS3CjNt3aGhbxFXKs5zftzksCrVOdoVPU6YNJY7vL998nXTLkQFtVDFAl2LDU4CwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TABFZfJb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TABFZfJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740859084; x=1772395084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OkHqKoUEMSlHGFGlgnVu22ubpbaH43eVeaAsSDs7FsM=;
  b=TABFZfJbsG0JnXlbq9+cmk0akG31ySRfPXSp62QX//c023TgM8G4hirX
   YOM2JxgyzdK760rxrwwQuVkSKxdgrYl8mKE5P0M4vQr4T1Rp0nqQqQnYE
   /kZ9mdlS+lxhOy74UuDAVGJm9neM6X80fQBJ4r5UASYIHOXFzED5hbnlU
   BymZ5L25JtPojzAMfEvEgVPXnLWtfV+LZvahjh2uuxZb0MhV4382T3aZK
   1sRxv7mLR8oacEV5O4xh0ke3WhYIgkhRYiQPpciiphTkNVe4WChJgLB/K
   1DxsTqKnaBVlt8PkHeev5OdRwLuyxxE/Iw+lpifaFnzC4wqkncPNeE1p4
   g==;
X-CSE-ConnectionGUID: drvmHtOBQlCY3UpZM3wLuQ==
X-CSE-MsgGUID: V+2lf5HBSxmUP6Sl6dF0ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52411191"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="52411191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:58:03 -0800
X-CSE-ConnectionGUID: GMv19CA2Qj209c3tU+Almw==
X-CSE-MsgGUID: 5+U+nWwqRjaqchWIRFdT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="140859470"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 11:58:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toSyF-000Ge0-2h;
	Sat, 01 Mar 2025 19:57:59 +0000
Date: Sun, 2 Mar 2025 03:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [linux-next:master 1573/7423]
 arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: nor@0,0: Unevaluated
 properties are not allowed ('partition@0', 'partition@200000',
 'partition@400000', 'partition@7fe000' were unexpected)
Message-ID: <202503020308.QOl15gfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 038e2ba01cf5ff94dc8f740328ec565d18bb764e [1573/7423] dt-bindings: mtd: physmap: Ensure all properties are defined
config: mips-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020308.QOl15gfK-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020308.QOl15gfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020308.QOl15gfK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: serial@1180000000c00: reg-shift: 3 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@0: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@4: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@5: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@6: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: nor@0,0: Unevaluated properties are not allowed ('partition@0', 'partition@200000', 'partition@400000', 'partition@7fe000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/led-display@4,0: failed to match any schema with compatible: ['avago,hdsp-253x']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/compact-flash@5,0: failed to match any schema with compatible: ['cavium,ebt3000-compact-flash']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/dma-engine@1180000000100: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/dma-engine@1180000000108: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/uctl@118006f000000: failed to match any schema with compatible: ['cavium,octeon-6335-uctl']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ehci@16f0000000000: $nodename:0: 'ehci@16f0000000000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ohci@16f0000000400: $nodename:0: 'ohci@16f0000000400' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
