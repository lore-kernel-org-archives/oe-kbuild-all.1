Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECB99475
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 22:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718146455; cv=none; b=D8gMACkiz6ODUuUx7v1GTlOhFGpBu/GI5aJhKZJK3IF1vMZligNykYaJYHDPashk5LA1N/hJPtj/LGGjaayIlRxmF+dO+1SWvVGyWPmosTXz5KTq0OX9PQHLICFP7wOorPGuCadYwAgV9Oqo8zPXfor7UDCCedCPcLivv4S8eTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718146455; c=relaxed/simple;
	bh=COucfxd+jn/bM77YARwYEhVLhBxJj+SpmP8xC42RRz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDJe1ory8ClhzCLxnbC+TiihBJ0rcpL8XBCGhXIlczUwYEkFLme6z6PPZX1fGAKUIb4/9at7WACT6R4i2R96oFLZdayJuWi+kfqLsqOPelwnlxznRHrxxW2GeRh3BDAQGBMxl0VtyvkhWPtBp5HWkVNRILEx6H/RcvfKtxi8NBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEp5Px/7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEp5Px/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718146452; x=1749682452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COucfxd+jn/bM77YARwYEhVLhBxJj+SpmP8xC42RRz4=;
  b=hEp5Px/7Sm+r9co2C0C2rKF7R+MJTtQK0qCJOMrpNgyMWRCoB0x7Ko2W
   RJ4ZRAQXH0rDNzxf3+R7xfglX3mAfHVTCaCzz3DwXJUs6kkw2NpETYfeQ
   sRS0TnrymKBCNvmotgGrn1KKEljxBzdXABM/p93xzXwCrO8S+I7s5nu+I
   7scvzsK6pxgoYrmtMcOAgxH6VvYCAq5srHz+vv5Gtrdb8QcZ7aV5cDSvF
   l0F5Mmj9303jd7xRVySLU0jvUF6T8HbUOGCyC5vhfHK1ryUrABzJPXZIJ
   /RScSqCjMtv5r6f6cn9wPi8IImrhPhKj2NIGGu/P1QIgz9F7BK1DLvIBw
   A==;
X-CSE-ConnectionGUID: 9XL9/CPVRIGWlnG6khb/Mg==
X-CSE-MsgGUID: h1jhhUueRGe1N7o49HfjPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26304885"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="26304885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 15:54:12 -0700
X-CSE-ConnectionGUID: 1Vp3QufESkqHIhlKNY/2lg==
X-CSE-MsgGUID: xOPR+UuUQjWoKUVwp8sx/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="44537215"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2024 15:54:12 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHANV-0000yc-0Q;
	Tue, 11 Jun 2024 22:54:09 +0000
Date: Wed, 12 Jun 2024 06:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 672/30000]
 arch/arm64/boot/dts/hisilicon/hi3660-drm.dtsi:94.12-112.6: Warning
 (avoid_unnecessary_addr_size): /dsi@E8601000/panel@1: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406120626.dx4oqXKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   73b793dd7d4876d09ef0e420c145fab7782f199c
commit: 33d8879c11b47540bd77156f82ade1badf33b073 [672/30000] ANDROID: arm64: dts: hi3660: add display driver dts
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406120626.dx4oqXKa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120626.dx4oqXKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120626.dx4oqXKa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1142.30-1146.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1148.27-1152.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:59.13-64.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:345.31-349.5: Warning (simple_bus_reg): /soc/crg_rst_controller: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:377.20-381.5: Warning (simple_bus_reg): /soc/reset: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1131.17-1174.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi:299.10-333.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi:390.14-422.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi:12.21-14.5: Warning (simple_bus_reg): /soc/gpio-range: missing or empty reg/ranges property
>> arch/arm64/boot/dts/hisilicon/hi3660-drm.dtsi:94.12-112.6: Warning (avoid_unnecessary_addr_size): /dsi@E8601000/panel@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi:351.13-362.6: Warning (graph_child_address): /soc/funnel@ec031000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +94 arch/arm64/boot/dts/hisilicon/hi3660-drm.dtsi

  > 94				panel@1 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
