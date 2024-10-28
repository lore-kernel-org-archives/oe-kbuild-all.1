Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B3B154444
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 07:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099980; cv=none; b=Rd9UQOeXldseMYkq8ZOcNAoW5JcVt3TF9NYQfc//S5c5OLB0ijXeLnvRUkWQd6V3npGUUXJP6B02dpz7ldViEZcKClP8uX9HE9fdkC1h7p7XI1j+nLFqDHt11Eg0fdhwiaYf6I0xI5H2Z1EjFXt5hzwj1cvS6dM8AEa1dW5Tqg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099980; c=relaxed/simple;
	bh=ghbIUX6R0KnMDpiLUsNH2BLTjriaFtw5CgeuuF5flSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qMFLPvbQzdffScvoAxq4z0CIpkkzTCNDX2hps2yfVTsF0m6c8qe8jZCrlzH2V+cxTFa75kQHa4LHCw5LQhlQArd5t6c+q1JLbWHKaYeBDjaBa7qhNYMUSkeGuN7SnintDgGu0GiS5ccso7/c4XeL+8lKI2u3NNzKtS39Ib+R/Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1Iiog94; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1Iiog94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730099978; x=1761635978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghbIUX6R0KnMDpiLUsNH2BLTjriaFtw5CgeuuF5flSM=;
  b=K1Iiog947c3J1rGHRfk8JFW1dE0k5uaI2mB9Uem7ciXLlzCtdGsxkOWl
   1B+OQDf/BqaIVt5tQ1ieuyuBq+x/3j/cBptl86etjRac0qjV+aVacZ4fb
   nNasB3n3BcUF88zo4+H4fmK1haLUjsn58bfsNR/+rO3BX3GiIVspxDn6L
   YofFeCWCJOyJop1lbZDkPOyoUUmdlTvhuqVnFXBO5+SEE9/7Z+RvCBC3Q
   dlVXe96b40bPNXIDCWhM8ZT4m4xJyb/mpIYiL31lXeI8nN3mwYua7cHR0
   RxBWo+MBcGxr4WlKhwSi551dGOiwixMJYVVYxODdylqpRKBFK/mcvcKJA
   w==;
X-CSE-ConnectionGUID: 7PFMct2rTLOUydb9bCM5FA==
X-CSE-MsgGUID: PaCvyZmpSeCrLfOnh5wQpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29118989"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="29118989"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:19:37 -0700
X-CSE-ConnectionGUID: MnP1KFH3Q7OuxegbUDbZug==
X-CSE-MsgGUID: DCLbtH+ITe2zepWjuXeLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81443713"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2024 00:19:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5K2H-000c66-2a;
	Mon, 28 Oct 2024 07:19:33 +0000
Date: Mon, 28 Oct 2024 15:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 25/70]
 drivers/net/pcs/pcs-standalone.c:14:29: warning: 'phylink_pcs_phy_ops'
 defined but not used
Message-ID: <202410281545.d89Ebcas-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   edb2a7a8be4be71a6502d19afd5b069f6d9fbacc
commit: e463a192fd60cc4effbb14a09282fd8232bad3d9 [25/70] net: pcs: add helper module for standalone drivers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241028/202410281545.d89Ebcas-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281545.d89Ebcas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281545.d89Ebcas-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-standalone.c:14:29: warning: 'phylink_pcs_phy_ops' defined but not used [-Wunused-const-variable=]
      14 | static const struct phy_ops phylink_pcs_phy_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/phylink_pcs_phy_ops +14 drivers/net/pcs/pcs-standalone.c

    13	
  > 14	static const struct phy_ops phylink_pcs_phy_ops = {
    15		.owner = THIS_MODULE,
    16	};
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
