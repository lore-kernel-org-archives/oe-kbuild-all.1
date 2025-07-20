Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D48B661
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 17:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753032672; cv=none; b=jpNP4CYvlpayc9D+xFj8RoaKd7Ybm7hZxki+mcWvGR6f13rys4hRr2FDJLU2jn0Fh1msw7YTnhGLljXUYVN5scC78VhVl77/l0aMMZPNQM/hmQ8tr6uPhgrHx2sxUhhL4+gVKb+ABfp8x3nUGplAD6x5FA7wu+Uea5gSgpe/xhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753032672; c=relaxed/simple;
	bh=JoJb1zxy2Wwp6cWc2t9BDmTu0YHdq0qOY1telWR6RUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLkxzJNNplgoaXNe4cjq9RamLMOEVQX9Is6skX//+9rQwp8jAXdZuGJFjxYckuoG7UFH42f3YLFnh8CgN8ech+o/oTU5xL0GxNQeoeGhO7Ek1jb3KzVi4igUZ3KytBn3fttLf3z4mJJ97c9PHPBBzqT88gve5jmuaX+SrrNolwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfrsSU2O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfrsSU2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753032671; x=1784568671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JoJb1zxy2Wwp6cWc2t9BDmTu0YHdq0qOY1telWR6RUo=;
  b=AfrsSU2Oqkg0VoeS26uoUkwEyUcFRCIVfZh+lQPLiV8QgF69NZIzCbRZ
   H8LzWAwSbmAEuLF/fWKQ+vCVXu481EuhxZTSw2EeSUdXWlLDcGTLYLYjg
   0sYjnr2xZf596QdAlQO1u22EdjgKtTYPvK+M0xzwKA1iFj/O3WyWfer4S
   QdU/Ro2n4Om5l1EexChL1xWdFfpuJYO4mCBfm3DZrsDDz0dFI52Im6BMy
   pUUrld5/BAmpZ4xhWL9VfU48TGw4AbOQ6F0DBjRaeG4hq5/lX5ZeEu1jX
   d4ssvPfqiE9R/lachIcCalLflecFGMsnmnFkfYohz+ijU1HHHIbyfn+Ej
   g==;
X-CSE-ConnectionGUID: kI2F1WtjQuedIiQHsW/8Pg==
X-CSE-MsgGUID: bK6/J3xTTaKIbEgQ7QmK/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="77789225"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="77789225"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 10:31:11 -0700
X-CSE-ConnectionGUID: U6X0k3V8TzOxFLmX+i4I8Q==
X-CSE-MsgGUID: L+LWw25vScixpiaT+rWW/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="158755825"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 20 Jul 2025 10:31:10 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udXsR-0001Hd-2f;
	Sun, 20 Jul 2025 17:31:07 +0000
Date: Sun, 20 Jul 2025 19:30:38 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1]
 fs/proc/stat.c:64:5: warning: no previous prototype for function
 'get_iowait_time'
Message-ID: <202507201918.9ajMUmgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   4d8e1d27db152f18e8e9064c37d1fa993f4d7e77
commit: 01b3b898ef05c1cdc6774d48c3620483e40cfc1f [0/1] ck: cpuacct: export cpuacct.proc_stat interface
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250720/202507201918.9ajMUmgO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201918.9ajMUmgO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201918.9ajMUmgO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/stat.c:64:5: warning: no previous prototype for function 'get_iowait_time' [-Wmissing-prototypes]
      64 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |     ^
   fs/proc/stat.c:64:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      64 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         | ^
         | static 
   1 warning generated.


vim +/get_iowait_time +64 fs/proc/stat.c

    63	
  > 64	u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
    65	{
    66		u64 iowait, iowait_usecs = -1ULL;
    67	
    68		if (cpu_online(cpu))
    69			iowait_usecs = get_cpu_iowait_time_us(cpu, NULL);
    70	
    71		if (iowait_usecs == -1ULL)
    72			/* !NO_HZ or cpu offline so we can rely on cpustat.iowait */
    73			iowait = kcs->cpustat[CPUTIME_IOWAIT];
    74		else
    75			iowait = iowait_usecs * NSEC_PER_USEC;
    76	
    77		return iowait;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
