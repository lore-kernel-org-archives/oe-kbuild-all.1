Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F1612B83
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719091868; cv=none; b=WNYfekN57e+v5zalcv6xUcpVih3/7Cofl69+gCsuZYpGHFgsIaZMqj+5lovx/jQKLLP16e2QX4gS5f9BixFll5XD+p8uXcc/zfnfgdva23HfS1dg57k/q5bwwBq37yiYZbuf0W/6iZd8ztu9KHibsIlwH/oqK5q2bocO4A7CO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719091868; c=relaxed/simple;
	bh=2Vg3BqUSFb6qXq6bJmzWf48gKXFi6wCNzCGzQ/KIASo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fiyw/UOgJPvYpQh/I1mg+dzWRLBVrxbg9fSqqp8uuunUNyEyRJOSwlMwGwjokwL7xD65S0RIDnK3ge6YdEwJFLj/CSmKwBbk1NwK5bjaqqvHLzGvh9WdGign2A8finQcHCTKGqit21D7q0EClil4UzsKeQUyxJ+fbJqdCF75Ykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZldr1TO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZldr1TO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719091866; x=1750627866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Vg3BqUSFb6qXq6bJmzWf48gKXFi6wCNzCGzQ/KIASo=;
  b=OZldr1TOKsiWyJda+DH6DBERrJrYh6wtv6YEREp1VKPX7XtGMwCVXVY1
   A3XLzx54Kks/rOSkqraH1Ge0WzUq/PF7b2QGF2UtEMr/LuNAew5qhpAzp
   KSP/2NhgcXjYUEdnWu51dbubqF3kLaM1/f2Tt2+yARYnAZV+fPN1LgKQS
   OFQmVOLtw/cTSZTD/ZL3Gbh90AJJjnJsNy62PlfcPionZqD1BKsc2iwgV
   AbGW7xDl/5n6M0qpc3DryJgyg9ZEsPTi/sy4TsaemAW++5B2uQ3BrQuAW
   n3vu8eqx9DJgl0ukrI1YZLigD4DysJzYquQYoQGPfIbgiTtipwyf//nMU
   A==;
X-CSE-ConnectionGUID: fFjbZapRRmO9OqMsBOLesQ==
X-CSE-MsgGUID: 2R6gPGpOTxibOBvKxUlnUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="26784485"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="26784485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 14:31:05 -0700
X-CSE-ConnectionGUID: NHq5ttpxSw2Sntjn2o/nXA==
X-CSE-MsgGUID: AfbpFb4ZRpSe9WYL4CUBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="42727928"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jun 2024 14:31:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL8K6-000A0g-1X;
	Sat, 22 Jun 2024 21:31:02 +0000
Date: Sun, 23 Jun 2024 05:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 5986/9999]
 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406230559.zLZKlHx3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 0e469137cd784e952b10670400ce2b9143741fd2 [5986/9999] arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2N
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240623/202406230559.zLZKlHx3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406230559.zLZKlHx3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230559.zLZKlHx3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
