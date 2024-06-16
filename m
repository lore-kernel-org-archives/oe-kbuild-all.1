Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB73D6B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718522213; cv=none; b=TkoMzlEug6oB+1A3y87jJqR6YeM3UZN7lXuU7wjyOS3cIzim06UXsLleyNIDR6si1Lk7rqcdxoS61UziLwREDl2D/83BF11OCAdsAj8bew9fmvHbdXJVjjKX3/DoaKwIcs4lw1m0X2+a+0qDKV6KSooSdttpwbHIyCbKQbN0KmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718522213; c=relaxed/simple;
	bh=YMXgrQFOGRFNPtmJcgKgJ6z5DFIXLWQNxQPtQESdiSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsZHfNz4vXG10zTqBLm/Atkx/En4OnDiZNycfcrAj3xy8fKPir4Kw28gN3Yyo2pnvzsm+ZOORaaJxOoCaODDykP2gQMo6fID78Yg1q0bqMUErby48upz/9RN+5T3HP2iEziKAvXJwpn2X8UFP6TxiHNqWcbkG5nv6Xm9kHrg5Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWvARvql; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWvARvql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718522212; x=1750058212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YMXgrQFOGRFNPtmJcgKgJ6z5DFIXLWQNxQPtQESdiSs=;
  b=RWvARvqlQoSp1+hHLXHxmw+h9V/OLX/GNELlv2MqPpB6asctEQ2DRTrU
   hIm9LAUIr7yqcmA0t5fefNReB61xIPIv8qB82c3a86GgwZw0cfhd6XvpA
   5JrXY4EumMdY8Var4aknrhS8R9MbbVAMcJe5CyZ/Ksd7eKbQH33+vaPOm
   AYeM3OkCwd2G5z4Lc0nu8ddOI6Ly90+67KP9tWHb0m3hXIp+AcCXiMsBq
   4xMIudMqA3cu/cxeQ950GuUXxwfWzTPpTN+iIbOr4FwufTuE+naODwpvZ
   NpSAx6YW5nSSTiGMj43FAwsWtzMQBQreewtLecxDAREQ2AD7eJH6UTT52
   g==;
X-CSE-ConnectionGUID: qUx6gQlwTkWweHQIaqdf+w==
X-CSE-MsgGUID: zl3SewNzRRiU6mVBeKzFoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15208240"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15208240"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 00:16:51 -0700
X-CSE-ConnectionGUID: Equ1GKbCSK+OSJ/Jkw8EEg==
X-CSE-MsgGUID: Z1x3OCeHQzm+9MzcxF2qoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40839756"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jun 2024 00:16:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIk86-0001zp-33;
	Sun, 16 Jun 2024 07:16:46 +0000
Date: Sun, 16 Jun 2024 15:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 39/67]
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: pinctrl@11c000:
 'dp0-pins-default', 'main-i2c4-pins-default' do not match any of the
 regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
Message-ID: <202406161530.ENVOsRqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   8086474caf5dc2570a947669acf226d319cd0651
commit: 5763cc02b9687b2724c2ddd3060bf2cdc136caf5 [39/67] arm64: dts: ti: k3-j721s2-common-proc-board: add DP0 to j721s2 evm
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240616/202406161530.ENVOsRqk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161530.ENVOsRqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161530.ENVOsRqk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: pinctrl@11c000: 'dp0-pins-default', 'main-i2c4-pins-default' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
