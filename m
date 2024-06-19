Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9A15588B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 03:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718766341; cv=none; b=nMEW281EMxTnpHKP+S9IdGklE6BfVczWo20U9L0nkN/zLFREu+j8NKLekWZPdKi5aPaQMW7uKnDNvbPZloGQVXsdilhelRN+XcHYnNCv+Qsn5W9SA862aciGpnmKJXvUQQ6P6zvG74OGYDIJ3aa7bfILlvQueJGvCSTd8JuTRu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718766341; c=relaxed/simple;
	bh=lytLsnJCEF9bT9br0xwdKz/SO/lr9xa+bBi6ToRosrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHYtYolqSgKMe/Kq3zoh8eJPtJNivu7wWQ+/P2335K7IU1aHcJ+S0TObGG818eYXqiF9mhOnZo8XErRiJmaqZqMhM2wXher09NDfM+kSW60gmEyofPL6xgljXoUM3ndIT8h+jeja+2RPAKRMtOmptg2c5IwCBM3zjbT6psocvLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCgX1u6+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCgX1u6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718766340; x=1750302340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lytLsnJCEF9bT9br0xwdKz/SO/lr9xa+bBi6ToRosrQ=;
  b=TCgX1u6+QVPP7yXem1WG+R+dbRCdW9b8mkduYFSsoVBpbClf0hVLOm7c
   9a2Lcx0OqJXeVB+xUJyyPgL8eLV1rOjHrK46Gr0w/R8BHBLeh8Io5AKeu
   QnfAfbKDQWdjHer4nG8SpBp2BsBRKdSz65qetaBfrPk6CN7ZOVfGX+4GL
   9wNvBSe4yxJDPED03XlCXJRtJFnK6VdD3jf6B4yXKs8RSJ/CXYm4uKoxl
   DaN1V3dYyTG8pmrghyIkRXA32Zk1AmDQmpg4iYGZUbxxYF6fmLregL3cq
   g9x59CDfEXbi8lIBJh+N6wlThwDA8zvMFj1lFdOIcIR1XWjCN5N/nH48a
   A==;
X-CSE-ConnectionGUID: MGKY0WmLRXeHUvPTCopx1w==
X-CSE-MsgGUID: i2MOj9IYShSoSYot8DjsQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15915554"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="15915554"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 20:05:39 -0700
X-CSE-ConnectionGUID: fYy1Q1CoQMiiGLeXv9mH/A==
X-CSE-MsgGUID: p6R4CAISTsS7o8aQLHyg3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46143808"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2024 20:05:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJldg-0006DK-0S;
	Wed, 19 Jun 2024 03:05:36 +0000
Date: Wed, 19 Jun 2024 11:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-bsp/v6.6.34-2024-06-17 40/132]
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000:
 'clock-names' is a required property
Message-ID: <202406191144.R8rzUVFA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.34-2024-06-17
head:   caf7f9c42b2dc056f352a35527e2efc1e4ffd4b6
commit: d93edb32c83e6adee60580eeddbd0471ba65bd7a [40/132] arm64: dts: renesas: r8a779g0: white-hawk: Enable PCIe Host ch0
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240619/202406191144.R8rzUVFA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191144.R8rzUVFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191144.R8rzUVFA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names:2: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names:3: 'dma' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names:4: 'app' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names: ['dbi', 'atu', 'dma', 'app', 'config'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: clocks: [[8, 1, 624]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: compatible:0: 'renesas,r8a779f0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: compatible: ['renesas,r8a779g0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: reg: [[0, 3864887296, 0, 12288], [0, 3864899584, 0, 8192], [0, 3864907776, 0, 4608], [0, 3864912384, 0, 3584], [0, 4002414592, 0, 4194304]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: reg-names:1: 'dbi2' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
