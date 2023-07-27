Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B1D27124
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 17:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690477665; x=1722013665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVhmgYvk7Yl+FZSQ8/gaoLaT3W9kTSDKWkXI/r0IFJ8=;
  b=Wh1/+up6tPqb3O7WoahKZtKV14na6i50eCf779nszB5HvuK3uwFj4p8R
   Xpx9XNOurEowZnnFEWK+hAGJO/Tx4D0zv9mbI6HVTypeBhZUH6NHqCWvS
   Af+2YFSVh/tKtGioryHoZqR+peVvwYLcW0tC67X+S0tMYETvmlatf1bLy
   lGv1GMdC0fxSqyZV2V6S/optluz8A0lYj5g0M/EEn5C9ujZkWmFeaQiru
   npEMx74xC718Q0/jX3GLyHMukUQqLeplq8cPOZzMdyB4yUjO+yd0683N3
   Apvs83iWZ1sSbLYn6kG8NUIKUQhJVpnx6mAcsCvg0M8tQ0SowfSKs1J1U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358396267"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="358396267"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 10:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762248099"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="762248099"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 10:07:32 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP4SZ-0002Rd-18;
	Thu, 27 Jul 2023 17:07:31 +0000
Date: Fri, 28 Jul 2023 01:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/rv/monitors/wip/wip.c:20:1: sparse: sparse: symbol
 'da_mon_wip' was not declared. Should it be static?
Message-ID: <202307280030.7EjUG9gR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a8db05b571ad5b8d5c8774a004c0424260a90bd
commit: 10bde81c74863472047f31304064018c40f488ee rv/monitor: Add the wip monitor
date:   12 months ago
config: i386-randconfig-i063-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280030.7EjUG9gR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280030.7EjUG9gR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280030.7EjUG9gR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/wip/wip.c: note: in included file:
   kernel/trace/rv/monitors/wip/wip.h:30:22: sparse: sparse: symbol 'automaton_wip' was not declared. Should it be static?

vim +/da_mon_wip +20 kernel/trace/rv/monitors/wip/wip.c

8812d21219b9c6 Daniel Bristot de Oliveira 2022-07-29  18  
8812d21219b9c6 Daniel Bristot de Oliveira 2022-07-29 @19  struct rv_monitor rv_wip;
8812d21219b9c6 Daniel Bristot de Oliveira 2022-07-29 @20  DECLARE_DA_MON_PER_CPU(wip, unsigned char);
8812d21219b9c6 Daniel Bristot de Oliveira 2022-07-29  21  

:::::: The code at line 20 was first introduced by commit
:::::: 8812d21219b9c649dd25eb93915e00939944aeb7 rv/monitor: Add the wip monitor skeleton created by dot2k

:::::: TO: Daniel Bristot de Oliveira <bristot@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
