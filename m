Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A73134A797
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552843; cv=none; b=OA5ccZ+juEUopjtFu4SnXh2rz70eQh2XUxpwlJQPZECV11dGrDSFtD2g59Oh04jXnvswsNT4qj+QYufSj2/p48V4PDuDpTrYua7EE3GTiwPUHqtySlureUa1kdefBHFyRz2M0F9x8Kk3hQQVUlU7qMTnSTZsKVjPgcQBiw/hULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552843; c=relaxed/simple;
	bh=nApmcVBY4IAKun2RZrcuZt8MVo+gAKSHO6uzQ0otgqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BwVZnmrFKChpVuWsc19q/kICgZTiMExr2jmTXORxDvDCKI1pLrjYZPZ9ocEL+i8QINX+HC57RLg2T6arKzaEw36uRg8Muc4RR8abyolFJNU78dxjisXhV6zWWUdRyBZ694OVIkhTpg8yKUK9Rmlpb4x1WrpWVh+zx6Wv/elrloI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zli7nZt4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zli7nZt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788552841; x=1820088841;
  h=date:from:to:cc:subject:message-id;
  bh=nApmcVBY4IAKun2RZrcuZt8MVo+gAKSHO6uzQ0otgqA=;
  b=Zli7nZt4N6mKKC+urvYkU/DifLbnjmkRLCRS7bOfHvU2Z/mVMU9aRxPn
   Z4h4Fg9XbiE2lApAHFpcoN89iXh2djtCKHZlHUNyPZdRCH8qI8W/AVLyD
   4ce9ttSrvKWCwSg+yVE2ISE7aVTTz8pcbSRxsiAGHVJ8jDD/WU785ANli
   Jb+wOgHT2m5y22ZLn1VQWKtOsICiVF6fjy/V5w+zQXW+4Pl6ttt01xBp+
   /Z8gDTG6iNlrHJE0MYeKIbU8rUJvs0kyff/xNNW9vIK+ly1p8nAXg8SGq
   o0n10P6Jk6kB9gQb5IpSHDnBhSOT0EyjxY4UCm4EF+9iINdgLNQawEGvh
   Q==;
X-CSE-ConnectionGUID: Xha4C2qGTW6iiR08MrsjXg==
X-CSE-MsgGUID: mD0NhyGpTciiHft7ZRd1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106576712"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="106576712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:13:59 -0700
X-CSE-ConnectionGUID: fWrsFqnpQi+cebK/+JH0dg==
X-CSE-MsgGUID: MEGwB+D2SgGvCeWmgA7diQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="266874094"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Sep 2026 13:13:58 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2aIN-00000000A8c-33mu;
	Fri, 04 Sep 2026 20:13:55 +0000
Date: Sat, 05 Sep 2026 04:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 1/1]
 drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol
 'regu_irqs' was not declared. Should it be static?
Message-ID: <202609050413.o5sRZIqY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   bab5f6aca819542b9dd13a70d3c62271e81b8e85
commit: 162e23657e5379f07c6404dbfbf4367cb438ea7d [1/1] regulator: pf0900: Add PMIC PF0900 support
config: x86_64-randconfig-r123-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050413.o5sRZIqY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050413.o5sRZIqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 162e23657e53 ("regulator: pf0900: Add PMIC PF0900 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050413.o5sRZIqY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol 'regu_irqs' was not declared. Should it be static?

vim +/regu_irqs +774 drivers/regulator/pf0900-regulator.c

   773	
 > 774	struct pf0900_regulator_irq regu_irqs[] = {
   775		PF0900_REGU_IRQ(PF0900_REG_SW_ILIM_INT, PF0900_SW, REGULATOR_ERROR_OVER_CURRENT_WARN),
   776		PF0900_REGU_IRQ(PF0900_REG_LDO_ILIM_INT, PF0900_LDO, REGULATOR_ERROR_OVER_CURRENT_WARN),
   777		PF0900_REGU_IRQ(PF0900_REG_SW_UV_INT, PF0900_SW, REGULATOR_ERROR_UNDER_VOLTAGE_WARN),
   778		PF0900_REGU_IRQ(PF0900_REG_LDO_UV_INT, PF0900_LDO, REGULATOR_ERROR_UNDER_VOLTAGE_WARN),
   779		PF0900_REGU_IRQ(PF0900_REG_SW_OV_INT, PF0900_SW, REGULATOR_ERROR_OVER_VOLTAGE_WARN),
   780		PF0900_REGU_IRQ(PF0900_REG_LDO_OV_INT, PF0900_LDO, REGULATOR_ERROR_OVER_VOLTAGE_WARN),
   781	};
   782	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
