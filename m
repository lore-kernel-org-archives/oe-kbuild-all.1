Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B81397E6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 20:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714894; cv=none; b=nSJe/7a1+uAD3qPY/Iw85XT6GFu/rlmIqU+NU97gTfk3HHPi2CYXXAMaYjRM92TJzWAy97t+G/9whRqe0yI2Wn1JU8cBUfGHWxqxkd2JvQzLmDL4vZPWKOzsmOqD90sKZu/aBLAXzXd4t8Im/QNmdBcbpAgV41p7FHrxD7ljT0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714894; c=relaxed/simple;
	bh=8KfA09nQRnhE3xpxp+eh1RN2vj+PMXyTg0NsacGvJ2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vA0w4Gf/mDM02wGs19kSST+glAQ+p+MmpCBeolSzCM/U/elUdJ4wAeMtuRW0mEG5dkrypsPy58Ua/Qr7E6aSz8OEdwrlUV3rb8d4DLmY8uNpXhK6GUCh2UcuychkJbcb7iEVSF3w7D8rgz/o04hoDlSNTXybcNHL0VQRPoZp2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1gdKJ2a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1gdKJ2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783714891; x=1815250891;
  h=date:from:to:cc:subject:message-id;
  bh=8KfA09nQRnhE3xpxp+eh1RN2vj+PMXyTg0NsacGvJ2s=;
  b=B1gdKJ2aeMSah4sgwP27qOn6J3nbcjIG7Fn0MmcOCiuN7E1sM2tMIsLs
   56tGluqG7JUS5P38NJXgTeOFkn0bT87cHmMaNaT2iinzgr+f5gh/hfKaX
   TqdKDKH9Ex7hh7VmmZPhum1Jwer/Kj+lTeFKxJVMAEFm7G4PnyzpkepCh
   qWruvjdXD6g7xDEos73k5n5FmcaiDtoKDnlwxTnP1K1jFUUNAg/Ys9VZm
   LVWQN87PvLDPr/CqL4L78DearBrad5ITDpHVM2+kCuIZEFCVDJyScnxs8
   IShTIGKE9c1Fv+nsAZ8/lBtA9882wHdywAvxgAtzF0v12bm1JABwx3RwT
   Q==;
X-CSE-ConnectionGUID: GGM++5ZcS7Kg7jL3GdE6CA==
X-CSE-MsgGUID: /nMxuo2GSCS5+C6HqOG2rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109963982"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109963982"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 13:21:28 -0700
X-CSE-ConnectionGUID: cJ8tj0ObSpmulSDJMNYMgg==
X-CSE-MsgGUID: artSavK/TRquR+t+jIt24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250554151"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jul 2026 13:21:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiHiu-00000000JK1-1hrX;
	Fri, 10 Jul 2026 20:21:24 +0000
Date: Sat, 11 Jul 2026 04:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-01 1/1]
 drivers/pmdomain/apple/pmgr-pwrstate.c:180:32: sparse: sparse: symbol
 'apple_pmgr_reset_ops' was not declared. Should it be static?
Message-ID: <202607110337.csfZr2Sv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ulf,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-01
head:   438a142b9dc1da06a555c9853456f23e76cfb744
commit: e2ad626f8f409899baf1bf192d0533a851128b19 [1/1] pmdomain: Rename the genpd subsystem to pmdomain
config: arm64-randconfig-r113-20260708 (https://download.01.org/0day-ci/archive/20260711/202607110337.csfZr2Sv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110337.csfZr2Sv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e2ad626f8f40 ("pmdomain: Rename the genpd subsystem to pmdomain")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110337.csfZr2Sv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pmdomain/apple/pmgr-pwrstate.c:180:32: sparse: sparse: symbol 'apple_pmgr_reset_ops' was not declared. Should it be static?

vim +/apple_pmgr_reset_ops +180 drivers/pmdomain/apple/pmgr-pwrstate.c

6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  179  
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24 @180  const struct reset_control_ops apple_pmgr_reset_ops = {
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  181  	.assert		= apple_pmgr_reset_assert,
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  182  	.deassert	= apple_pmgr_reset_deassert,
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  183  	.reset		= apple_pmgr_reset_reset,
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  184  	.status		= apple_pmgr_reset_status,
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  185  };
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  186  

:::::: The code at line 180 was first introduced by commit
:::::: 6df9d38f9146e83b473f0c9e57fb5fdf3fcc93e2 soc: apple: Add driver for Apple PMGR power state controls

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
