Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8211156D4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2KhdbFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699267353; x=1730803353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVoA6M9tV7b7+GwVri+O7UGSZ8BdQ6m2m/IBtofKr6w=;
  b=K2KhdbFGQbtObCjA/HqO1mN1m+tRTTzKBZC50oVLLLPtOQYnsXxEjTBr
   p4zTPHqqKJPhf8YKXN81v/pt8X39jNoBo/LEod3Q/fr0qn6qnUiDwk5U3
   Y/vR5tlcfypMDP0LBuA4tfTt9MzbBTgnjoOSvqsRi8et+5T7WC1tiM3de
   phRAV9jfK8n4Q+eNwUYYtsISJjfaW59vTzM2ntvf4SycQKzm5ZFHfTXTn
   dQaUYwwbrBvuM2XthoZT1Xp3LV7a448FfIFcZxh8WL09s4+2a1QRP6FAI
   +vgnCrmAOQfcN/wBKboiRrmnnviG3bnun/B+EmhnPAF+w8S37AvQuykPP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="368584134"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="368584134"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="885860713"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="885860713"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Nov 2023 02:42:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzx3q-0006LI-0Z;
	Mon, 06 Nov 2023 10:42:26 +0000
Date: Mon, 6 Nov 2023 18:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/opp/debugfs.c:48:54: warning: '%d' directive output may be
 truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <202311061847.BOtfUmbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 46f48aca2e5aef3f430e95d1a5fb68227ec8ec85 OPP: Fix missing debugfs supply directory for OPPs
date:   4 years, 11 months ago
config: x86_64-randconfig-r025-20230725 (https://download.01.org/0day-ci/archive/20231106/202311061847.BOtfUmbQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061847.BOtfUmbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061847.BOtfUmbQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/opp/debugfs.c: In function 'opp_debug_create_one':
>> drivers/opp/debugfs.c:48:54: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
      48 |                 snprintf(name, sizeof(name), "supply-%d", i);
         |                                                      ^~
   In function 'opp_debug_create_supplies',
       inlined from 'opp_debug_create_one' at drivers/opp/debugfs.c:119:7:
   drivers/opp/debugfs.c:48:46: note: directive argument in the range [-2147483644, 2147483646]
      48 |                 snprintf(name, sizeof(name), "supply-%d", i);
         |                                              ^~~~~~~~~~~
   drivers/opp/debugfs.c:48:17: note: 'snprintf' output between 9 and 19 bytes into a destination of size 15
      48 |                 snprintf(name, sizeof(name), "supply-%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +48 drivers/opp/debugfs.c

deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar 2015-11-11  37  
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  38  static bool opp_debug_create_supplies(struct dev_pm_opp *opp,
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  39  				      struct opp_table *opp_table,
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  40  				      struct dentry *pdentry)
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  41  {
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  42  	struct dentry *d;
1fae788ed640e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2017-05-23  43  	int i;
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  44  
1fae788ed640e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2017-05-23  45  	for (i = 0; i < opp_table->regulator_count; i++) {
d741029a239040 drivers/opp/debugfs.c            Arvind Yadav 2017-09-21  46  		char name[15];
d741029a239040 drivers/opp/debugfs.c            Arvind Yadav 2017-09-21  47  
d741029a239040 drivers/opp/debugfs.c            Arvind Yadav 2017-09-21 @48  		snprintf(name, sizeof(name), "supply-%d", i);
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  49  
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  50  		/* Create per-opp directory */
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  51  		d = debugfs_create_dir(name, pdentry);
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  52  
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  53  		if (!d)
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  54  			return false;
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  55  
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  56  		if (!debugfs_create_ulong("u_volt_target", S_IRUGO, d,
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  57  					  &opp->supplies[i].u_volt))
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  58  			return false;
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  59  
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  60  		if (!debugfs_create_ulong("u_volt_min", S_IRUGO, d,
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  61  					  &opp->supplies[i].u_volt_min))
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  62  			return false;
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  63  
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  64  		if (!debugfs_create_ulong("u_volt_max", S_IRUGO, d,
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  65  					  &opp->supplies[i].u_volt_max))
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  66  			return false;
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  67  
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  68  		if (!debugfs_create_ulong("u_amp", S_IRUGO, d,
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  69  					  &opp->supplies[i].u_amp))
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  70  			return false;
1fae788ed640e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2017-05-23  71  	}
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  72  
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  73  	return true;
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  74  }
dfbe4678d709e2 drivers/base/power/opp/debugfs.c Viresh Kumar 2016-12-01  75  

:::::: The code at line 48 was first introduced by commit
:::::: d741029a2390406d4d94279ae5b346831a9e61e6 PM / OPP: Use snprintf() to avoid kasprintf() and kfree()

:::::: TO: Arvind Yadav <arvind.yadav.cs@gmail.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
