Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3D13209
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 04:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718166870; cv=none; b=qHZk6JUnofJFmt5YnORII9UZPdJX/hEQ+8gR9ufi+4PSCy/BkXdNwsgicy6ArOciv1dG50zjdTKciTTHpWCJ3ac/AYv1GSmqdSB+EJkR1Uu7lOTU6MO3yU9CyrhbemO6c2Hn9aVQTWoK29SrWnGC3M5wo5sDZS+JE+BhgoWEF4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718166870; c=relaxed/simple;
	bh=sDmYBWNPS/VI66Kx4clxbIMLQJGzJLyalxzKZnPBp8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O263IQIwClS4W/7rcnqFH4lEM57FWXT4wMlxV/6dmLPWQDMGmKAL3m09DGU6cOQxE/ZBwHXjCD7VPkjwruR2RlkpsXgaFcQstqwxosJGPLaFG8sHP0y2QDdrh/NOEgFhR2V+/WzaldfVYCECChKaZZbdYO0QTNtsHDpL5MiDW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5LX3I5A; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5LX3I5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718166869; x=1749702869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDmYBWNPS/VI66Kx4clxbIMLQJGzJLyalxzKZnPBp8A=;
  b=O5LX3I5AXkDqSx2zf5jsAinFfAhnWXSkwi+Kc5raX9lPgYkVgxT6Aalb
   ooxH5HVb3o7xmCuWcBnU+ycHEW6CpaU8Pyo+z0JIyjLEEaU/1mklHg4+5
   AEoWp8Mg3lNmmRpzXeBAK2nnkeTJ5La+ipljgytgf5FgILxisT7Fls17V
   dBXd8JekL3eduQjWIqAvbIBmn44wCfXUXC0N5zKPyafXvFqIlEsIIWPSy
   e31VNBu1RoSzohf9uVep6zQtEurynpKeLACq1lJU/PxVkMPmDPNGCpImX
   6FoxElX8NbXu47aCG8ieglXvvvALPxFVeb6yabI/DcUI/aLOPc47cADc7
   A==;
X-CSE-ConnectionGUID: YeX1BVbaS7KHzAIi0M+vXQ==
X-CSE-MsgGUID: 2Y/6Thv4Qgyff3ZbAAdOEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="17836468"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="17836468"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 21:34:28 -0700
X-CSE-ConnectionGUID: LxGyXPPwSRCCWkv21Id8Fg==
X-CSE-MsgGUID: A4g0wzqlT6OfbubkJx+dVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="44790224"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2024 21:34:28 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHFgm-0001CW-2Q;
	Wed, 12 Jun 2024 04:34:24 +0000
Date: Wed, 12 Jun 2024 12:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pci-regs 2/2]
 drivers/pci/controller/pcie-microchip-host.c:1204:1: error: function
 definition is not allowed here
Message-ID: <202406121241.AUKk5pyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pci-regs
head:   18208f6cde334a1011ed8e9c94b7aeb2b18582bf
commit: 18208f6cde334a1011ed8e9c94b7aeb2b18582bf [2/2] PCI: microchip: rework reg region handing to support using either instance 1 or 2
config: arm64-randconfig-004-20240612 (https://download.01.org/0day-ci/archive/20240612/202406121241.AUKk5pyk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121241.AUKk5pyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121241.AUKk5pyk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/pcie-microchip-host.c:18:
   In file included from include/linux/pci-ecam.h:8:
   In file included from include/linux/pci.h:1652:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/pci/controller/pcie-microchip-host.c:1204:1: error: function definition is not allowed here
    1204 | builtin_platform_driver(mc_pcie_driver);
         | ^
   include/linux/platform_device.h:313:2: note: expanded from macro 'builtin_platform_driver'
     313 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^
   include/linux/device/driver.h:285:41: note: expanded from macro 'builtin_driver'
     285 | static int __init __driver##_init(void) \
         |                                         ^
>> drivers/pci/controller/pcie-microchip-host.c:1204:1: error: function definition is not allowed here
   include/linux/platform_device.h:313:2: note: expanded from macro 'builtin_platform_driver'
     313 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^
   include/linux/device/driver.h:288:3: note: expanded from macro 'builtin_driver'
     288 | } \
         |   ^
   include/linux/module.h:122:30: note: expanded from macro '\
   device_initcall'
     122 | #define device_initcall(fn)             module_init(fn)
         |                                         ^
   include/linux/module.h:132:2: note: expanded from macro 'module_init'
     132 |         { return initfn; }                                      \
         |         ^
>> drivers/pci/controller/pcie-microchip-host.c:1207:64: error: expected '}'
    1207 | MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
         |                                                                ^
   drivers/pci/controller/pcie-microchip-host.c:1120:1: note: to match this '{'
    1120 | {
         | ^
   1 warning and 3 errors generated.


vim +1204 drivers/pci/controller/pcie-microchip-host.c

6f15a9c9f94133 Daire McNamara 2021-01-25  1203  
6f15a9c9f94133 Daire McNamara 2021-01-25 @1204  builtin_platform_driver(mc_pcie_driver);
2e245bc8a2abf6 Daire McNamara 2023-07-28  1205  MODULE_LICENSE("GPL");
6f15a9c9f94133 Daire McNamara 2021-01-25  1206  MODULE_DESCRIPTION("Microchip PCIe host controller driver");
6f15a9c9f94133 Daire McNamara 2021-01-25 @1207  MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");

:::::: The code at line 1204 was first introduced by commit
:::::: 6f15a9c9f94133bee0d861a4bf25e10aaa95219d PCI: microchip: Add Microchip PolarFire PCIe controller driver

:::::: TO: Daire McNamara <daire.mcnamara@microchip.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
