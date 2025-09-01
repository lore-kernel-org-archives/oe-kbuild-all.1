Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1565121FF38
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756769395; cv=none; b=BQa0AQhf0OXEDdZeruYrxx7aCNyvcskzJHhnFYPxucym7gpS4OJoHSS6zSYWTQJO54tMLAeRnQDOoD/FDBj0L5jgspL7ssPyoeRvRyzYs368eOYR3Xmpds3y/4DBaBz1+VhjD9mAj+0y68yj8D2A7nejEYbkHa9tRsBJiAB6bhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756769395; c=relaxed/simple;
	bh=q0TBskrs7cpuzxsAPlbBWLjrZU4eRHjJCovlLRpnUnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYFB97jbzzWnfMoYH1DE93afNLB4fvIfDn2ra3iIixVZ/z5Z3VpGWzPBLUHMj724On6BwMGAgLNBDUXte+/iQSlBMVZ0gd2uCWBwinwp8cy9awTJYgJKjEqjUfZcVwkUrNKXMMhxDjqfuHU03gBw3V+dVKbrF75+qlFLjHbB6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvYvQWMa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvYvQWMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756769394; x=1788305394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q0TBskrs7cpuzxsAPlbBWLjrZU4eRHjJCovlLRpnUnU=;
  b=NvYvQWMaHyEY1loHdJ+QlOQDJ0NBQK7p0bT41px+9+4BXSpxqTR/dPfw
   xf4z4tfy4ZHQyQBLF3dr0v1xS2HzMUkrHQjPYKuxyQXg5SwtTsskGw9tl
   dSPFbZPXWMawp150Lna8ZQhEN1uDlL1s+u+JvkzAaAwRFU7B0ZcJxps7i
   +MDBD5H+1Wk14XWmqmTK1Pp5GGTYUFRuAxokVFxN4YuQVrQYOAAcyX5Jm
   NcKSjoR9w7PjuA4dMyAM1kVoNntNWN+hdIQobS5mKNOsBCYLzWpRkva1I
   2PcbbqOHqlW4QI7GO+L8GMVTPwtisB139Cp7u8oeiuFmQsPQbodNTP4c1
   w==;
X-CSE-ConnectionGUID: bxT/+0UESU+zemPwTNnvXw==
X-CSE-MsgGUID: NpA8ioMaSgm/U5IGcso90g==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58723616"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58723616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 16:29:54 -0700
X-CSE-ConnectionGUID: dEMvOR+8TqeXcoMwISR81A==
X-CSE-MsgGUID: Nqrf5k3dSxaNIhvproJRgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171090417"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Sep 2025 16:29:52 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utDy8-0001D2-1X;
	Mon, 01 Sep 2025 23:29:48 +0000
Date: Tue, 2 Sep 2025 07:27:28 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5184/5291]
 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: isp@32e10000
 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
Message-ID: <202509020737.MXLgn37j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33bcf93b9a6b028758105680f8b538a31bc563cf
commit: aea7f460aa02fb24517a9ef27e7594a4fcbc1604 [5184/5291] Merge branch 'next' of git://linuxtv.org/media-ci/media-pending.git
config: arm64-randconfig-052-20250901 (https://download.01.org/0day-ci/archive/20250902/202509020737.MXLgn37j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020737.MXLgn37j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020737.MXLgn37j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
