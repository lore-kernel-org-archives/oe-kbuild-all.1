Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C630FA6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696366837; x=1727902837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8n9Y8ISxCi7m1OoS5LWOMDIYCZN19CSE+A69yor0el4=;
  b=H+UzxbQh7xmeVU73/GxTA9CNNkNuszTmAvfvWgwKQz+MW2fw1zkYQXGd
   Eun16AuGDPBiAsHpjkiCmEksay89FnVFxo1axVhZUZxKfpnw0n5cYy/bS
   VTOLZ1RXTvvbGI1xMQHTovGP2v4z4RCdWhlw2hmTBDH0JJWmXdEDb18nK
   ra9d5BmTeGgAd9XgmGeQAsDav9SZOuJSFQeYzxqQLe97CO9oWf61kA/R7
   nl56yBSa3TGHFoVbvsEQe1FLh4ii+IrWB+wvgK96aH8fHZLelBSuloCJL
   jqxHlW5ijEGVUHMXvVnAfoO/C2Wn3aKWb2gwz0duy+qKpLRuCPkqqbfBE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362338125"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="362338125"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 14:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="924795718"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="924795718"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Oct 2023 14:00:34 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnmVM-00099X-0g;
	Tue, 03 Oct 2023 21:00:32 +0000
Date: Wed, 4 Oct 2023 04:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 222/222] kernel/sched/fair.c:133:36:
 warning: 'sysctl_sched_min_load_balance_interval' defined but not used
Message-ID: <202310040402.7pDkRqdX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   c4311a5b0c2891e81b571b13586bb8c1dda55117
commit: c4311a5b0c2891e81b571b13586bb8c1dda55117 [222/222] CHROMIUM: sched/fair: Make minimum load balance interval a tunable
config: csky-randconfig-001-20231004 (https://download.01.org/0day-ci/archive/20231004/202310040402.7pDkRqdX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040402.7pDkRqdX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040402.7pDkRqdX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:133:36: warning: 'sysctl_sched_min_load_balance_interval' defined but not used [-Wunused-variable]
     133 | static unsigned long __read_mostly sysctl_sched_min_load_balance_interval = 1UL;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sysctl_sched_min_load_balance_interval +133 kernel/sched/fair.c

   128	
   129	/*
   130	 * The minimum load balance interval in jiffies that must pass before a
   131	 * a periodic or nohz-idle balance happens.
   132	 */
 > 133	static unsigned long __read_mostly sysctl_sched_min_load_balance_interval = 1UL;
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
