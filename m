Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6CC4B8277
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948921; cv=none; b=FpVdNTCbGhIlrNmW0Z3DAkIpmDB9k+XYjEkcgYDQw9BNy0xYWeNWeQ5aCZNBw+4Sfk+3VnEooyoKPfuU3CoIXJI1gFn7c1PtNW0KyZoQmv4ZyO9YuQ3WjK5ql2o2/DTmQCl+SOZhhNNay5clIT+sCoSKA/N4yFGM3gPwHqoUocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948921; c=relaxed/simple;
	bh=pleMdvmgnVpbEVVcJJrZrDze1MoSs7BEPclNt/0bQIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BPSN+T0vEvSG3wCoxu1UlrwKjkfEurF23lLhdRq9L3lTbKJ2qCKuDJ+ZeI0BGmKlYx7PR1O8MRCAb3RV2G1rnZkbdMyzbw8epf8DDUF2lKaoURSwgHdWeT6NmMHCSa6Mcl3eQCv5fh34EkLcs6UMn/RNzN2v8jf7qagCirOVHNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfOubq4x; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SfOubq4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790948917; x=1822484917;
  h=date:from:to:cc:subject:message-id;
  bh=pleMdvmgnVpbEVVcJJrZrDze1MoSs7BEPclNt/0bQIY=;
  b=SfOubq4xfQEBWYcur4ld09XkRmCPSeYrbQm9dG5ATgRwF3PlZYhiUq+Q
   xf6PiIwsDNSjTjTlZLgo8Z4VVevIQY+rnp0/d1EDlC5pCGmUFasU6M+yB
   KkuwO+5YkM2NxBPhpmOVOObTG9gXzVjvFkJav6xZjNHLXjI4YNYCHOJoY
   ejZ4aue2fOgTnnP6bCyScUxqYqFuNf9AA8qimDK4NOGhFhM2HafNj96pP
   G2kGYZHodE1AYFkR2ktRqaZ/0bjTMbWofU4DGGXsi+MIQbzlEpXbhRqE0
   tWxQPdpAa35V6rMZ/ARraFPC8pcDIxUWkXaCmU5V52PhF0IPK6mz+eExo
   Q==;
X-CSE-ConnectionGUID: zymBz8A7R1aEohGLkgRUvQ==
X-CSE-MsgGUID: B7ugkn+eTWmv4zvu01biig==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="103086434"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="103086434"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:48:29 -0700
X-CSE-ConnectionGUID: YxoCztvhQ+SJezYkZpmQ9w==
X-CSE-MsgGUID: Cy1TX1yKTFCZnQrFk7XSNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279529312"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2026 06:48:27 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCdcf-000000000Yj-1maM;
	Fri, 02 Oct 2026 13:48:25 +0000
Date: Fri, 02 Oct 2026 15:47:25 +0200
From: kernel test robot <lkp@intel.com>
To: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Cc: oe-kbuild-all@lists.linux.dev,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 11703/13246]
 arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb:
 system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is
 too short
Message-ID: <202610021532.JJJUVqD9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: 0f72e965efec4cda7c3b1ac76edfab53f27ed9a7 [11703/13246] arm64: dts: marvell: Add Sophos XGS 107w NPU board
config: arm64-randconfig-2402-20261001 (https://download.01.org/0day-ci/archive/20261002/202610021532.JJJUVqD9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021532.JJJUVqD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021532.JJJUVqD9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:236.24-255.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
