Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAE3101D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571312; cv=none; b=ePazbNLgNOUKS/XSnF0U5Y5vRIKqI8Dq4QN82zAtn8DGMfJwVTtdy7APQ/CNCxWvDU9ztpkaLba7dnp/7VR3imWqWw68ixTrAjK+EKo+5l4fx/ICek3N4cb2mjbHGhnuHTGSVREwIX5IcCmfkWO3ISqAY5CfmGMIhVVRUe4NRo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571312; c=relaxed/simple;
	bh=7BZMSSwSFd9MSx9HmWSCFoegTuiyLTyQAO+rVkNBRoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5svS6tq2dWexCZ9cISOdaot8ZWlKiCULMswEN/OP+30FkMBmjQkuC2D36vrK52prmTBj9Yf2uiS9a06j7M8NFEvofSZI1iut5IrJkZBpA0rGOWK0hINYl1Js9i4jQ3LROV6tptPGnwt2h85hvGHSk4xyZA+z7f3/dkvDG94GkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zw6Pha4X; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zw6Pha4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571310; x=1797107310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7BZMSSwSFd9MSx9HmWSCFoegTuiyLTyQAO+rVkNBRoM=;
  b=Zw6Pha4XUXmD4EQjh6QaOi96Ee6Lv9F2NEBZx053CkAXvv6JjII8dTe6
   FZ49lbHMYC2eGr64eiUZs2dz/GRUs4NsDkX4LO0RDNBZnZ14vlyOC6CY5
   w3UBKCnO4jRq1R1FU82Qg8hkBVVRVWS22ax/dwLFCLbFu3WXixgP3fz0Q
   +ZFt2qmZPPboZCVDTMcdk/cbZ1xMsxz+GkxA9ejTSEaEdxN0wWZmjQHWj
   flQE8dcVP5Ehf5aPZ3oeJ44BjPz2R16TIJX97g/3PWCLPy5t8XWVamoJw
   jcQs4gE9EFZcy2jUzDZcYD600fpw1dQlpeWAPk1SwHpksH9Sj+F6268Dj
   A==;
X-CSE-ConnectionGUID: g2WN/7c6RDSm6gdeLFazEQ==
X-CSE-MsgGUID: z/VZ2eofS7+DiCyyO81bUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78284898"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78284898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:28:28 -0800
X-CSE-ConnectionGUID: 4Sfj0HCnTd+eEzTHfneNYw==
X-CSE-MsgGUID: ESoP8DHTRqWkQOe/rkl5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196250281"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 12:28:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9kW-000000006Zf-1plF;
	Fri, 12 Dec 2025 20:28:24 +0000
Date: Sat, 13 Dec 2025 04:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] drivers/crypto/ccp/hygon/vpsp.c:589:6:
 warning: no previous prototype for function
 'vpsp_set_default_vid_permission'
Message-ID: <202512130435.BO31TiNF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: e2861aaa47961017ada7f66de11104bbf3b85eb1 [3541/3541] crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-randconfig-101-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130435.BO31TiNF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130435.BO31TiNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130435.BO31TiNF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/vpsp.c:589:6: warning: no previous prototype for function 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     589 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^
   drivers/crypto/ccp/hygon/vpsp.c:589:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     589 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         | ^
         | static 
   drivers/crypto/ccp/hygon/vpsp.c:1055:5: warning: no previous prototype for function 'vpsp_do_cmd' [-Wmissing-prototypes]
    1055 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         |     ^
   drivers/crypto/ccp/hygon/vpsp.c:1055:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1055 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/vpsp_set_default_vid_permission +589 drivers/crypto/ccp/hygon/vpsp.c

   582	
   583	/**
   584	 * When 'allow_default_vid' is set to 1,
   585	 * QEMU is allowed to use 'vid 0' by default
   586	 * in the absence of a valid 'vid' setting.
   587	 */
   588	uint32_t allow_default_vid = 1;
 > 589	void vpsp_set_default_vid_permission(uint32_t is_allow)
   590	{
   591		allow_default_vid = is_allow;
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
