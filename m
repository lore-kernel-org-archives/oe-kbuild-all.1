Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4E87F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5HPAE2/"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696487853; x=1728023853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KvcH2S/UODOLpya33YrWtuTX8xVSz+nQFy3Spb7OItg=;
  b=Z5HPAE2/6cS5l9EW1QUhi/1DcUOX5MvMMfSEzGg2TzztXPAe7n6+qZBk
   yDLT1M+mrooaBkahepFtBS19YCdTcu8M80YWU5ZkWP9AJkrZtmZ8JIQ9/
   n56ql3B/Te1ODitjq44sL5cn2HGnLBrdi1JrnlUP+6esUKFDu2mdL3AXR
   9dt5MSOsKz302E9uOyUfGV3odLt34DQXKJvbwmuQ2p29P8Zx+AwYKhLAe
   hFtxaWB+A1COMV0KivM0p47zJS+fjtDxc7eC6ng1xeE9lPXV1LaiZ3H+k
   0A0BvtvbPGF5LHzvHpoAObm7aOIsPsDwlWECgCzoulXrliiH0gzX0Gg1E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373769852"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="373769852"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 23:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="781118012"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="781118012"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Oct 2023 23:37:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoHzG-000L8C-03;
	Thu, 05 Oct 2023 06:37:30 +0000
Date: Thu, 5 Oct 2023 14:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-2e 37/37] lib/dynamic_debug.c:117:6: sparse: sparse:
 symbol 'ddebug_clear_prefix_cache' was not declared. Should it be static?
Message-ID: <202310051421.cS4sVNN1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-2e
head:   e29a79ca0888609c7442791bd8108f8323eded5f
commit: e29a79ca0888609c7442791bd8108f8323eded5f [37/37] dyndbg: cache the dynamic prefixes per callsite
config: i386-randconfig-061-20231004 (https://download.01.org/0day-ci/archive/20231005/202310051421.cS4sVNN1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051421.cS4sVNN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051421.cS4sVNN1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:117:6: sparse: sparse: symbol 'ddebug_clear_prefix_cache' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
