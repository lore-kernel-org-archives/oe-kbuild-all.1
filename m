Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2645125D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692655607; x=1724191607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Wey9wyUQNQm+YSFMbenaxE5gS61mD4Y5GHG7eRa574=;
  b=FOk5lREWfMN5JBiMvHmfJTEgMa68Stnx/mURQ/v0HKzKLnkOSDmRrna3
   pzm/MFKTUNgfmoAom8mVc+vwwyuyRwPTjVTixnaYpyz4UU3nVEZsCxjyE
   QwGgY+WOTkh6CN9hMzH2hR37x0LeyCTsMlAxMZZZ1b7dPNygFYULSMpeQ
   x4HvlCh4ciUXUY21PkfBTDJo4ETIkZ9VVgdZcWPMhIQZ4kintKuQxkXcR
   POnbhom3n92AWqNW44GbfUHfkjH/dFjwnbuNwsn/7uiy1NouLLu8lEJ7z
   NPktL5XSaoWi1iOtRBrxOOM0PcMIbwO+Y0lufULu21/tVPxLgvDIm/m52
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="363880356"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="363880356"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 15:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765529002"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="765529002"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 15:06:34 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYD1Y-0000zU-2V;
	Mon, 21 Aug 2023 22:06:03 +0000
Date: Tue, 22 Aug 2023 06:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 8/9] core.c:(.rodata.cst4+0x7e4):
 undefined reference to `approximate_util_avg'
Message-ID: <202308220550.iAUBHYL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux remove-margins
head:   c33dc1443a3c5aebf846a5b6ea54b0cc8a2dc90f
commit: 9961717b792caabfaec35da613dcf4e0ba708b2a [8/9] sched: cpufreq: Remove magic 1.25 headroom from apply_dvfs_headroom()
config: parisc-randconfig-r012-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220550.iAUBHYL4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220550.iAUBHYL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220550.iAUBHYL4-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/core.o: in function `.LC2089':
>> core.c:(.rodata.cst4+0x7e4): undefined reference to `approximate_util_avg'
   hppa-linux-ld: kernel/sched/fair.o: in function `.LC224':
   fair.c:(.rodata.cst4+0xd4): undefined reference to `approximate_util_avg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
