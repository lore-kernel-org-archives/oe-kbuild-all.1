Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0688A14A98
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grTeM9XR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699709588; x=1731245588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oyjkhv8/ALUnfKY3TDcEOZyPyAE7sPn7xKkUNZb1iyE=;
  b=grTeM9XRUy/bpATHWVHoC4630Am6Ji3fnGM9Gr6SXP2po0mhHhWbm/F4
   K76Un4T7tHaWs/Jc15x8x+lDAfvtnQFctTZSvWyITkAv9ZNDJ0X8KX8Ku
   zfRi3MWNJswmT9zfVqFYfvpvf/RNDhxF4pCakfNoMcKsW3K2LyqLwuZDr
   Kk3IsziPXIKj9B04w68r1yPVKcps25zb49Ewc40DN3F12LBckaIxAqyq4
   Azk9DMHY+scE9BDE+tKLGzpIXnVY9GEL4SSXeLBFO3ZTiVR0k+gv0xlDu
   gKagf9pgL/kKssYHpfsEAN6O4tjvV+XyZ/d7OV6BuXH3UuZEsZ+L/5VAE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="456771926"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="456771926"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 05:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="887550869"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="887550869"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Nov 2023 05:33:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1o6h-000ATe-2B;
	Sat, 11 Nov 2023 13:33:03 +0000
Date: Sat, 11 Nov 2023 21:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 8602/24081]
 include/trace/hooks/timekeeping.h:14:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202311112157.q1yQnX1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d8156345d8c56a2b082c1877eaee48a22c33014f
commit: 5168caa32a196470b560403662a31cf20837626d [8602/24081] ANDROID: Add vendor hook for tk_based_time_sync
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231111/202311112157.q1yQnX1i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311112157.q1yQnX1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112157.q1yQnX1i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/time/timekeeping.c: note: in included file:
>> include/trace/hooks/timekeeping.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/timekeeping.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/timekeeping.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +14 include/trace/hooks/timekeeping.h

    12	
    13	struct timekeeper;
  > 14	DECLARE_RESTRICTED_HOOK(android_rvh_tk_based_time_sync,
    15		TP_PROTO(struct timekeeper *tk),
    16		TP_ARGS(tk), 1);
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
