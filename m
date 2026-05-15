Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08A23536B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 04:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778818556; cv=none; b=VV/V3gYlBnFO5PKj8THY1nPUis7fW2y6ogPoLKLunUKsB8SThLAialaN8PVaaAENBqr4keOWQhZI7vlv3SVdOjoo2boRJ7FcJczZT/18SEfZ7QXR6Ch21EAdf1qDGDZmCaTX6zg2oDe68GqYwVLNb5g2m9iwee2NkZKjxTS7+Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778818556; c=relaxed/simple;
	bh=2KwrSu0zBGuD9Md5B6rmglMdUiYqqa/bD7bbvqmMGYI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UfG5NGWEZyDGowELpVjPMXVKjVTBBzqbP9b1PfFUTLsDgHFcSWzFqA8iaUK2+HvINsf9/LOxaNGlvfAmNxMMkELuXVQw8OEybYzCOrjdi5AINmlXHIU17WK5SFlCL0UQQUIy/FLGATlGZoUmFn8n9GSD81igvALC2EggKsIK+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivc/Lj5C; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivc/Lj5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778818552; x=1810354552;
  h=date:from:to:cc:subject:message-id;
  bh=2KwrSu0zBGuD9Md5B6rmglMdUiYqqa/bD7bbvqmMGYI=;
  b=ivc/Lj5CJ/0d26ygoC7mMzMoQF/Q1L1+YPtNNWHpIdD1kFj4I8s671uL
   65Qz1YZUDHXvRgR7zXcTnZN4SNidsN3Ue1MIGghRwG+O6MTxC5UZGdrjI
   bCg6InQwTZNBvgvX/DChU7pMR1lHXPkj01wTTZwqVq9iW+nmA+R0rHkLU
   vGkvczt5ZBlLUQKtneUv2v/NYwCpCH4VfnxpiMG30+asuU/kjswsAWkUz
   XCkyXRnacGfUmYsu6lypA9hntP1bkcDOJ4dCm6C02QiOKPTXV0vV6DJZN
   /HrY9C9O8g+tMfeBC03OguYA6uYFLlvCqKvumY7mhy4HQTdWG+OcceCnT
   g==;
X-CSE-ConnectionGUID: LwKumvsJSOyyNGc+Quvmvw==
X-CSE-MsgGUID: t45F6elmTXyRgAhyejWNRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79629050"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79629050"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 21:15:51 -0700
X-CSE-ConnectionGUID: l1pt3ZR6QmG2aiWK7xsWHQ==
X-CSE-MsgGUID: c8b3YQtoQpyXhDEQt0aOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="243556346"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2026 21:15:49 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNjx5-000000000nn-1Uyw;
	Fri, 15 May 2026 04:15:17 +0000
Date: Fri, 15 May 2026 12:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 147/154] ld.lld: error:
 duplicate symbol: custome_cfg
Message-ID: <202605151215.mFS2pCPM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   767536110bfe28c94ae2e150c083d29f827655cf
commit: 1a140ff79b8bf1a9f5ddb079b6e2b404929f0a36 [147/154] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: powerpc-randconfig-001-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151215.mFS2pCPM-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151215.mFS2pCPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151215.mFS2pCPM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: custome_cfg
   >>> defined at as21xxx.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xxx.o:(custome_cfg) in archive vmlinux.a
   >>> defined at as21xxx.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xxx.o:(.data+0x4) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_cl45_read
   >>> defined at as21xxx.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xxx.o:(aeon_cl45_read) in archive vmlinux.a
   >>> defined at as21xxx.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xxx.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_sds_restart_an
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_sds_restart_an) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0x480) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_ipc_set_tx_power_lvl
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_ipc_set_tx_power_lvl) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0x500) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_ipc_sync_parity
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_ipc_sync_parity) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0x1300) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_sds2nd_enable
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_sds2nd_enable) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0xA40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_sds2nd_eq_cfg
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_sds2nd_eq_cfg) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0xAC0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_sds2nd_mode_cfg
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_sds2nd_mode_cfg) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0xB40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_normal_retrain_cfg
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_normal_retrain_cfg) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0xBC0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_ipc_auto_link_ena
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_ipc_auto_link_ena) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0xC40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: aeon_ipc_auto_link_cfg
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:(aeon_ipc_auto_link_cfg) in archive vmlinux.a
   >>> defined at as21xx_api.c
   >>>            drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o:(.text+0xCC0) in archive vmlinux.a
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
