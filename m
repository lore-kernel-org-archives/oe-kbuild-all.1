Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D179663B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 16:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772947; x=1723308947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXiLmv153Fp6YqnsKo7nuPexc+FBUZRBj725D1Yl88s=;
  b=IXzwNT5B0jnwA1Oc90pXibYd8EiTdLsV85mm/QjKBtJAJ5/07Dd+2d8+
   7N1osPsqB8rOGlfkjTOpgpaoz3IdOpOXkpRzhtkGES54SSvBfxEAdcQia
   /F67H3/8HhduwwhfYMsI17j25kPvQmgAeIIyJ+iM+MdcyDcgSY3l9YmGG
   FeOSPv0wMufAm84+2ND91AAD8Zur3cacPIHjZthMbiEvP9V9mwJ1zRElt
   FOIAYdVRIFPdQntjFNbTUW07+b/+Z6cCSol0nM6T5ZVv5XOW9crZdlF4X
   4/lZee4eGWmjyrqnxhE2aJecMCwzDGepThsktZVZJuvIQ+nxPhSDE1wSi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="435608659"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="435608659"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 09:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979287990"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="979287990"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2023 09:55:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUVQP-0007tF-0n;
	Fri, 11 Aug 2023 16:55:45 +0000
Date: Sat, 12 Aug 2023 00:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:warnings-2 5/9] drivers/opp/debugfs.c:43:42:
 warning: '%.62s' directive argument is null
Message-ID: <202308120043.oZBsNtYV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git warnings-2
head:   5ddc13aed5c9ee03dd6bad7254a5918e6f36f1fa
commit: 707697efa19c54618ea9271158661fa31b4d7461 [5/9] extrawarn: enable format and stringop overflow warnings in W=1
config: um-randconfig-r031-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120043.oZBsNtYV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120043.oZBsNtYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120043.oZBsNtYV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/opp/debugfs.c: In function 'bw_name_read':
>> drivers/opp/debugfs.c:43:42: warning: '%.62s' directive argument is null [-Wformat-overflow=]
      43 |         i = scnprintf(buf, sizeof(buf), "%.62s\n", icc_get_name(path));
         |                                          ^~~~~


vim +43 drivers/opp/debugfs.c

deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar 2015-11-11  35  
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  36  static ssize_t bw_name_read(struct file *fp, char __user *userbuf,
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  37  			    size_t count, loff_t *ppos)
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  38  {
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  39  	struct icc_path *path = fp->private_data;
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  40  	char buf[64];
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  41  	int i;
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  42  
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18 @43  	i = scnprintf(buf, sizeof(buf), "%.62s\n", icc_get_name(path));
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  44  
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  45  	return simple_read_from_buffer(userbuf, count, ppos, buf, i);
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  46  }
0430b1d5704b0f drivers/opp/debugfs.c            Viresh Kumar 2020-05-18  47  

:::::: The code at line 43 was first introduced by commit
:::::: 0430b1d5704b0f0f1d237236dde9c143f8669e49 opp: Expose bandwidth information via debugfs

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
