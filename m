Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC2718FC96
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718646820; cv=none; b=pLP39uBxU1e+RWM3DrlPJDFrNGjetrVv+Z4S9SxvaBq+HPTUVu3AihMSFzVl2Yz7pfxgxZ8aCy63E9wow3BgoNoucvtILTOO8+YMhfZB8wLYZUzyh5PW56SZhJya6rcpZzYX754pteFr0BEL7RA6eXAYIXN7MM574i5v57Vl3Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718646820; c=relaxed/simple;
	bh=21z+yJX9Awch+ig2npsLWEd4yKihFGLpjYFN62Zpsec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/4kDkOE3iX0ImCOCsN7ARD00lmj9Xc5qFigTqVD+KesjGRXy+f3+CFKOXQk9h5nQ/4N0C2pOu1jF7fQbqjuDyMKetuPQX7J3DWo4Xms3DgQq0eMSt5XS7qr7Ca7BW6iIkXL+HJPVVvGS7FohYaJ50fGb4Dkvs/A4TwKTs7+x3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpfZrEjo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpfZrEjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718646818; x=1750182818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21z+yJX9Awch+ig2npsLWEd4yKihFGLpjYFN62Zpsec=;
  b=ZpfZrEjoHzUnrR+iS+3sJ/7oaEBlOxa6S4qN3Kbc7aieLu8sr8mwHkyY
   5wC7IdYfoutChUDh6M9xzkx1HXEc6Wa5blw5l9AF6rSF/1fzWhmFeclR8
   KKEPlK9rXbs8J3lFX8wouOt4H6HwQV9rNCuYaZP/jr7+dPxXSa0P01GmW
   ZoYV2AvLsBc9yKWRz4PS0YRhcYeDfziffOEtCCupYgMYeBGBk4B6+4bSq
   s8btkZviAejMxsz4O9yXptmC3shJW7JgycJMu4WuflvZRO5umunMM7Szw
   E7nxMRslDG4T6seTBYea2AhdD71P4xum3l7B8698GC3aMv0l2Z4x8xjgd
   w==;
X-CSE-ConnectionGUID: vzjw3pGMQmuozSIoW/VPhw==
X-CSE-MsgGUID: r3vIfPd8S42WPumsZ2f91Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15256675"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15256675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:53:37 -0700
X-CSE-ConnectionGUID: licqy3GLS/Cc0klXvpqobA==
X-CSE-MsgGUID: LXVfzdzwR+6j9aSCIbu6Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="46388311"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2024 10:53:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJGXt-0004kb-04;
	Mon, 17 Jun 2024 17:53:33 +0000
Date: Tue, 18 Jun 2024 01:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 147/150]
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb:
 /bus@100000/video-encoder@4200000: failed to match any schema with
 compatible: ['img,vxe384']
Message-ID: <202406180125.BwtLcbRb-lkp@intel.com>
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
commit: 6b5073591fcfff7245ee9a2d504cd3b2e3a897e3 [147/150] arm64: dts: ti: Video Encoder/Decoder
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240618/202406180125.BwtLcbRb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180125.BwtLcbRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180125.BwtLcbRb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1896.21-1912.4: Warning (simple_bus_reg): /bus@100000/dsi@48000000: simple-bus unit address format error, expected "4800000"
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1963.20-1964.5: Warning (graph_child_address): /bus@100000/dss@4a00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: /bus@100000/video-encoder@4200000: failed to match any schema with compatible: ['img,vxe384']
>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: /bus@100000/video-decoder@4300000: failed to match any schema with compatible: ['img,d5500-vxd']
--
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1896.21-1912.4: Warning (simple_bus_reg): /bus@100000/dsi@48000000: simple-bus unit address format error, expected "4800000"
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:2322.34-2331.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/video-encoder@4200000: failed to match any schema with compatible: ['img,vxe384']
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/video-decoder@4300000: failed to match any schema with compatible: ['img,d5500-vxd']
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: pinctrl@a40000: 'mcu-cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1896.21-1912.4: Warning (simple_bus_reg): /bus@100000/dsi@48000000: simple-bus unit address format error, expected "4800000"
   arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: /bus@100000/video-encoder@4200000: failed to match any schema with compatible: ['img,vxe384']
>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: /bus@100000/video-decoder@4300000: failed to match any schema with compatible: ['img,d5500-vxd']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
