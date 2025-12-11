Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F32F7ADF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448279; cv=none; b=S8RJNGr4zHdrAGZC+46i2ksZgFv+xjd+zgtXJ21cG0UT4AG7wg2kFNM1E9IArvwJCf6c/Rs7H0skmGiGePkfmSU9V7IqVgWKAId5GpYlJ0flzZaDOR95tp1T5JHwmwsU3lye1vK9Pll8ZhpkQ+iz7UIcihsnv8oRforfaTR4qQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448279; c=relaxed/simple;
	bh=vbmXBSfjhkxrItqljjv8oX9L8itLfkBe4r7FL9Cv3Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQtHIqMCaK+EtIjJzY9bSCGsE2627o+Z9TpnMsOSzkGjxEd+ZLWUzHJ6tnDyCnV1zzbGz17H9QjWSTtcqAZIGQ3jRiNA4Bt3wXcKx9f4UBd8XfWBjpS5FOiKIBJBb/LbqldEPK96KGPp0cZITkGq+uylDxi8Uf7+/ovYbBXUFxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNTT5+v0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNTT5+v0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765448277; x=1796984277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vbmXBSfjhkxrItqljjv8oX9L8itLfkBe4r7FL9Cv3Sk=;
  b=eNTT5+v0YptA/6BFkR+dkxs+yuQ3Ej8usmpaCPxGrqejs6biUvGna3+T
   /IgCsLilRfReGHv/HMfmvFX5KcnzzpFIkRaLt/tBUlTqLZuJtButs1q3S
   vdsRbDHVkkzslvjJ4E9gIiNaT62vm8SAgQ9DFT4/VtVAwM6iz74YL+bWi
   977r9YcfBj0m36pgElR05UssAaSN90jtX8s58NMAEqobmRqtjRGM7DMku
   DXLsivmJMesjhNtftOIxgW7pnuz+0LWEuof3NxI6lQl7RIuJKhM5g5ed6
   e0d/+w8asFTlPLjh6JLhW392/22c6YBcCvb+z3lMKA7F8w2gJfnUZ7A+6
   w==;
X-CSE-ConnectionGUID: ltm3wTc3TN+d0T3qCm/hSg==
X-CSE-MsgGUID: dLl6rpQZTHub78BUoaN2zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71293470"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71293470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 02:17:55 -0800
X-CSE-ConnectionGUID: QxZvTSpZQwacmC0jeYU7+A==
X-CSE-MsgGUID: nAYa2pBcT6+U8XlY0kYGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="200926633"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 02:17:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTdk7-000000004Vr-1xr5;
	Thu, 11 Dec 2025 10:17:51 +0000
Date: Thu, 11 Dec 2025 18:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3540/3540] kernel/sched/debug.c:102:12: warning:
 no previous prototype for 'is_prefer_numa'
Message-ID: <202512111810.cbJGbotT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 0f22304e62d360fce47988586d599e33895ccb01 [3540/3540] sched: Support NUMA parallel scheduling for multiple processes
config: x86_64-randconfig-161-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111810.cbJGbotT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111810.cbJGbotT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111810.cbJGbotT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:73:
>> kernel/sched/debug.c:102:12: warning: no previous prototype for 'is_prefer_numa' [-Wmissing-prototypes]
     102 | int __weak is_prefer_numa(void)
         |            ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/is_prefer_numa +102 kernel/sched/debug.c

   101	
 > 102	int __weak is_prefer_numa(void)
   103	{
   104		return 0;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
