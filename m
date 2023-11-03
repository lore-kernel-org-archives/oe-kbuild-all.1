Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7C1D6AC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KB9AyEmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699044420; x=1730580420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0Q937Xw1Z+308iw//Wq0swjX8ZmHzc7fv2QmnJZd2g=;
  b=KB9AyEmS5XppYAwBv0HMdMaB5jQkcydHItcFldDHnr8gJbiyqrrXVPxN
   FC6zMawr3WUv/LELKLdThHijGdGg5ALyxABDvyHgXt49lfAZRsCb1fx2x
   zjcwfe/QBXRzg0cBI6bJvIsjo2mYam5D6syJbUx1rnYjIOAji91oaHWSn
   wDiM3NAtj/15KA8lYopfGWQQOkmc/syro0uqnZDm/0redB6lFhfZQqjYV
   iiqbsCazoOYkt0FgHXEqwgdIUJSTayVORZZqEYMXvJ/bxjIbsbjvU0jq+
   jhVzixZTr+K7goapy6JMcPvHVWhCHU3m2IJ7W9hpnaDPCLD/1t3B+pddz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="475253841"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="475253841"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 13:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="790866232"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="790866232"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2023 13:46:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz14A-0002vX-0T;
	Fri, 03 Nov 2023 20:46:54 +0000
Date: Sat, 4 Nov 2023 04:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 16/22] mm/swapfile.c:102:26: warning:
 no previous prototype for function 'swap_type_to_swap_info'
Message-ID: <202311040403.Vs8dXP6G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   422887ef073ab9748ddbdf4ffe3009e040f93c4c
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [16/22] ANDROID: mm: export swap_type_to_swap_info
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231104/202311040403.Vs8dXP6G-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040403.Vs8dXP6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040403.Vs8dXP6G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
   struct swap_info_struct *swap_type_to_swap_info(int type)
                            ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct swap_info_struct *swap_type_to_swap_info(int type)
   ^
   static 
   1 warning generated.


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
