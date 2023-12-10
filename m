Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41551170D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiCUH3jW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702216654; x=1733752654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hYH2S6OcLbU1V+FG5XnC0iCh0FXcaHtqRy3t1y3lPjs=;
  b=iiCUH3jWS/4CzFyJKjeCHs7BMH/+H8O4BGyGeYdrqTQ7/QjvjHfebfLh
   EtAKMb3kNRL1710CUoqsxG5Fuo4UuwiHseQedcDKsXDuM7lWi1gBnY0cK
   QrgBmARjGvTqdkiMZQ4X6Rp3SvdibT/42//1DUtoUZxxPMI+6I0rX50el
   OV/Tulh6cdrDreJx3WZX0u4CJMBOZWw56f4logIWZs8QspL/OnHtdQYhW
   xNx4VtsZ4ahE0MUUcwhyLQJA6UzBo+6KrKkwifKUn4rK9SnkpvR5ca+11
   ZfMgvltom3qaNyPQ/rO9scaDBTTXzvMhOdI7rl23UGn8ZaZHjg4oCT6ZU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379555459"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="379555459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 05:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="801674662"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="801674662"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2023 05:57:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCKIj-000GuA-03;
	Sun, 10 Dec 2023 13:57:15 +0000
Date: Sun, 10 Dec 2023 21:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 4653/6165] kernel/watchdog.c:798:12: warning:
 'proc_soft_watchdog' defined but not used
Message-ID: <202312102146.ss7blmxP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
commit: 8dd5ad307974d01065aba1d2d27f6d9d2d6d6661 [4653/6165] watchdog/core: remove sysctl handlers from public header
config: powerpc64-randconfig-002-20231113 (https://download.01.org/0day-ci/archive/20231210/202312102146.ss7blmxP-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102146.ss7blmxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102146.ss7blmxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog.c:798:12: warning: 'proc_soft_watchdog' defined but not used [-Wunused-function]
     798 | static int proc_soft_watchdog(struct ctl_table *table, int write,
         |            ^~~~~~~~~~~~~~~~~~


vim +/proc_soft_watchdog +798 kernel/watchdog.c

   794	
   795	/*
   796	 * /proc/sys/kernel/soft_watchdog
   797	 */
 > 798	static int proc_soft_watchdog(struct ctl_table *table, int write,
   799				void *buffer, size_t *lenp, loff_t *ppos)
   800	{
   801		return proc_watchdog_common(WATCHDOG_SOFTOCKUP_ENABLED,
   802					    table, write, buffer, lenp, ppos);
   803	}
   804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
