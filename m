Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0807B4A3844
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344705; cv=none; b=ZymGLgVMLosv7JQCzUoqciKtSTm3gscRNLX+fKSMcIeQCazVp9463uKyTnPqKQyjyU7kPzM9X8/u9GmR50UcMzaJpIXo8DPqGPXE/j7NJPrKTrccD0KWFDW38OOsIgy8+kkUQnzu6Gn5IbOv6wfJIAxqANHQ0O2B84RxqryKZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344705; c=relaxed/simple;
	bh=cIbS5Uyfv4Jjk4raAONSQKSKDocvmobXfXEuFDnkGJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uVWW13SnKcYuCF/dJ1goyjqMrXFttdA/rSqyKiTQ4rrBuuj3Tket4+9vFpZxyWfQnT1qFXE+TSIdpDgiw7dn5o2d1LVtAIKn6FI6b1RwCoNTc8RzmMP2u80/e+zQG0CVa2E4jNryYPt4nnTYPnBjPYieXcMqcnn9+cmkyaCaZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LY8ayc5L; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LY8ayc5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790344703; x=1821880703;
  h=date:from:to:cc:subject:message-id;
  bh=cIbS5Uyfv4Jjk4raAONSQKSKDocvmobXfXEuFDnkGJU=;
  b=LY8ayc5Lmtf0nLrtJdl12pQonyhtRcOT1xdNr325ebPsXwM4Lyewa58J
   lWsgP9ak/W+snWUoZMmXbYutikqGJwbigevGTnk0gFGPZ7d21ZS9JWrF2
   eHMoHuScCKEnW2oiq+LxNzIF7dLWiqH4X0tW8JubCvJ7BpPoNTR9tl7J/
   CejcLJKBheRuFHfsaIFnmkn56zqI1DValgex/Cv8nEvd0xNFZocksF1Zm
   EFbEL/J1JluW841szpVA7hVR99jopF830ozv3g7l20yvK1pQvBu+uvQi9
   pgEoQiJueWrr04IOPsVfn8t6oK0f5Pq+oFVwBD7dP1YWA409GU5AutxtQ
   A==;
X-CSE-ConnectionGUID: g4n/evxER/C4Ftik7t8C7w==
X-CSE-MsgGUID: RTjY3r02T1C8b9j4zzzFBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="100463314"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="100463314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 06:58:22 -0700
X-CSE-ConnectionGUID: h5zk2tFxTrKvcyxLZTDF9g==
X-CSE-MsgGUID: kAS3VC9xTmGu8o5LoYUZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272478852"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2026 06:58:21 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA6RP-00000000KiU-00Jh;
	Fri, 25 Sep 2026 13:58:19 +0000
Date: Fri, 25 Sep 2026 21:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:dmabuf-size-ceiling-v7.3-rc3 28/29]
 include/linux/sunrpc/xdrgen/_defs.h:13:9: warning: "TRUE" redefined
Message-ID: <202609252129.XKayNOvc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git dmabuf-size-ceiling-v7.3-rc3
head:   837ed875be1a747823a663f160a8122b60c0c88a
commit: c5e054ccaedf0778bd70baf19cc9200fe5a7acc1 [28/29] drm/amdkfd: port AMD Infinity Storage file I/O from the amdgpu driver
config: x86_64-randconfig-1006-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252129.XKayNOvc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252129.XKayNOvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252129.XKayNOvc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sunrpc/xdrgen/nfs4_1.h:10,
                    from include/linux/nfs4.h:20,
                    from include/linux/nfs_fs.h:41,
                    from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c:57:
>> include/linux/sunrpc/xdrgen/_defs.h:13:9: warning: "TRUE" redefined
      13 | #define TRUE    (true)
         |         ^~~~
   In file included from include/acpi/acpi.h:24,
                    from include/linux/acpi.h:27,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras_eeprom.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gfx.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../include/kgd_kfd_interface.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:47,
                    from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c:32:
   include/acpi/actypes.h:412:9: note: this is the location of the previous definition
     412 | #define TRUE                            (1 == 1)
         |         ^~~~
>> include/linux/sunrpc/xdrgen/_defs.h:14:9: warning: "FALSE" redefined
      14 | #define FALSE   (false)
         |         ^~~~~
   include/acpi/actypes.h:407:9: note: this is the location of the previous definition
     407 | #define FALSE                           (1 == 0)
         |         ^~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c: In function 'kfd_ais_init_attr':
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c:387:36: warning: '%s' directive output truncated writing between 6 and 7 bytes into a region of size between 0 and 2 [-Wformat-truncation=]
     387 |                 "%04x:%02x:%02x.%d:%s", pci_domain_nr(pdev->bus), pdev->bus->number,
         |                                    ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c:386:9: note: 'snprintf' output between 20 and 25 bytes into a destination of size 15
     386 |         snprintf(filename, MAX_SYSFS_FILENAME_LEN,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     387 |                 "%04x:%02x:%02x.%d:%s", pci_domain_nr(pdev->bus), pdev->bus->number,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     388 |                 PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn), suffix);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/TRUE +13 include/linux/sunrpc/xdrgen/_defs.h

4b132aacb0768ac Chuck Lever 2024-09-13  12  
4b132aacb0768ac Chuck Lever 2024-09-13 @13  #define TRUE	(true)
4b132aacb0768ac Chuck Lever 2024-09-13 @14  #define FALSE	(false)
4b132aacb0768ac Chuck Lever 2024-09-13  15  

:::::: The code at line 13 was first introduced by commit
:::::: 4b132aacb0768ac1e652cf517097ea6f237214b9 tools: Add xdrgen

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
