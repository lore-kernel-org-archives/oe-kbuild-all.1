Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1340F24A076
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 04:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782449696; cv=none; b=EH5nAKPRidpDG+uvDSafSjmiqITw5ctDxc4UNt02/gyHP8B44CU75DbSgZZswbl1+ARICrefUlbYONIlO6fUVR+OJcjM7tNl13wH6A5Gg2ijVJRT9fixvSOr6gP+4N50tSirazq6VsPMWvClQ882zT60ISCQbtqxyllUKhvO/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782449696; c=relaxed/simple;
	bh=EYNgah+8jzjI+97rx5hGC/zgz6n+OUyTYOAy0DvF6QA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K5E6WrNsQ6MMslFT8T7wVNMGXLzRaOMP9JXMtEc3OySD7E1VkQ6XbzheXQ3TedKfDXEU4BWscGj37tKAGbUGxI/w8PW4dtecxCjLx2w8xTQZxMVJG5pWxlyVK+Zey3NDrRGuAzPnS1IWE4le/dSp0CyZdpFhQg1GAXemnEXnA+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcGqx1Zd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcGqx1Zd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782449695; x=1813985695;
  h=date:from:to:cc:subject:message-id;
  bh=EYNgah+8jzjI+97rx5hGC/zgz6n+OUyTYOAy0DvF6QA=;
  b=HcGqx1Zdb8kasPPz4S9XuUr2IYzAKnUcjn1xo71WshhvJWqwFbc3euJ2
   Rh8AfakFCwM5d15tLftHI90nfV4yatmtJz8yDS/U7OtoolO3mXzFPeF3X
   /Wt24N59165hnCNKXNpsJ3VeNvpULx+gp+67iuX4xTyQlsgTNjhIxVvoJ
   oeDStETDacKpK1OiOzv17LDGKQjJc2soVVjthn9nYMkoVdfc8zvXDEyjp
   b8uJHbeLYvwHtbYQ0yW0ilbE8ea/7k3yBb5WYut5dpPoOLevPjSG9P15V
   cMckSAJx/VQ0ibSzkqRlSU3bJ8DakvvAnI9OqbiLMN5CJmcS83fd+IbFA
   w==;
X-CSE-ConnectionGUID: xNEGJzJZSG+m4ZahZvY8ag==
X-CSE-MsgGUID: 6uZtp8mHTXuwNYs4YFH0hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100675467"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="100675467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 21:54:55 -0700
X-CSE-ConnectionGUID: FPfGSAryR06wIxu4OovFIA==
X-CSE-MsgGUID: tBUEk9srSB+n98Q344cTCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="251894020"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Jun 2026 21:54:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcyaY-000000004mP-47Iy;
	Fri, 26 Jun 2026 04:54:50 +0000
Date: Fri, 26 Jun 2026 12:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 796/796] setup.c:undefined
 reference to `topology_apply_cmdline_limits_early'
Message-ID: <202606261230.YrEy6CwW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   75d0cdf05de8774a2ab140c00b39423d1262b965
commit: 6b66d9b27695b15e9226171e6cd8849a336ba7b5 [796/796] x86/cpu/topology: Rework possible CPU management
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260626/202606261230.YrEy6CwW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606261230.YrEy6CwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606261230.YrEy6CwW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x7dc): undefined reference to `topology_apply_cmdline_limits_early'
>> ld: setup.c:(.init.text+0x7ec): undefined reference to `topology_init_possible_cpus'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
