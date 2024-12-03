Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74241632E4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733216657; cv=none; b=OsaC07C8IYnyIBDzj2SQ19CUL96CYyWNq88hjHGyxvnLOD133xzN8KUH90wRJVMajJ8XYs+ic9PgL0kx8Onsw931Xitl/ZOZAdARwzNoB1QI/+wc10l2cfpMvMbJDP1rIP08UlaMu9EmTu1rRK5GVu2VI+H8qBoMDYKo1h+zH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733216657; c=relaxed/simple;
	bh=PKogFheRZ5x5MHjI6FGkRxA0qHArkmk+xgeA1ujDnE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3tlXfqAaVowQFeGJJmDOzGz4C5rRbnfHehT7hsbiPRN9FL02xABQqh90Gxln4B8veMBJGpQ/boGK15d3OnHVO6vRXizBkDJBW4aWKujXqpOO8KwqPfdoXLnty/bH6d71sIpiNqU3TVQCbR7dx0wY4Sp8bB6OlT6qcfKn/v98MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2+d67a5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2+d67a5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733216656; x=1764752656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PKogFheRZ5x5MHjI6FGkRxA0qHArkmk+xgeA1ujDnE0=;
  b=g2+d67a5UUPbTnZqOufCsxY7BOBahqLDCTGXw1fCyY7b/KQJqpvl+nv8
   ae+Kb2TaHHoaoaUK/Y8vONfTYIa3r7sInKZqYhCKxT4y70SYZtac0dGj0
   7un1BCx+vgRwMV0ScPNMm/ULKbWH9KTsuk9wBVPzuTQKfLmZPOjy5W0sy
   lQhc1puaqTjyF5So2jmAbvvkNcFBKbfjejkIrygDoM9SLhpYbNHK/y6yF
   rPsEGMOoRzlCIVht27GH3Cu1uxmFOw93EbVrAMqWdZkn7OczXFd0JNHON
   iRUlor8Jz23yr06BQkbmg/kUu4Had0m1pVGRaKz98sxGg9mP2HHq1eGKs
   Q==;
X-CSE-ConnectionGUID: SGOcwkOHSN6t1t136Sw+eA==
X-CSE-MsgGUID: rBTlbfZqSiaCDCb5hqiwYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44446766"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44446766"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 01:04:15 -0800
X-CSE-ConnectionGUID: +80FZccWR6u6RxWNJAFpPg==
X-CSE-MsgGUID: F/lELXC9QkG1UU21CLgkKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93775029"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 01:04:14 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIOpH-0000RP-2d;
	Tue, 03 Dec 2024 09:04:11 +0000
Date: Tue, 3 Dec 2024 17:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516] fs/proc/base.c:1454:6: warning: no
 previous prototype for 'pbha_bit0_hide_file'
Message-ID: <202412031640.QjUBley5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f86196bf02fd9bea8511335c45bf10b6b0a3ea13
commit: bea38841945a52bd03004240eb0da6a5115bae21 [2516/2516] arm64: mm: Hide pbha_bit0 in procfs if pbha is not enabled
config: arm64-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031640.QjUBley5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031640.QjUBley5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031640.QjUBley5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/base.c:1454:6: warning: no previous prototype for 'pbha_bit0_hide_file' [-Wmissing-prototypes]
    1454 | bool pbha_bit0_hide_file(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && ARM64 [=y] && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/pbha_bit0_hide_file +1454 fs/proc/base.c

  1453	
> 1454	bool pbha_bit0_hide_file(const char *name)
  1455	{
  1456		if (!system_support_pbha_bit0() && !strncmp("pbha_bit0", name, 9))
  1457			return true;
  1458	
  1459		return false;
  1460	}
  1461	#else
  1462	static bool pbha_bit0_hide_file(const char *name) { return false; }
  1463	#endif
  1464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
