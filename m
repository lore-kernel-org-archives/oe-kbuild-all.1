Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8BCA73
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692867884; x=1724403884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XUTsBKXlxmdKg9tWwomX5qAw9oR15sox9aTNwPm8dzU=;
  b=R6ywdGx5XNhope1TO8Z6RM+VrrH6l1aN7u2mrhdcjd1zx8zhv7Icz7Kl
   t+wYy74oENIKOF1J1OfUTjFT9SfDRQ6NQA7IK/jULcF1gp/I2c4+c1jJN
   SJGo+TrnuPsd9fwrC1Yy6fHgLeH3Vg/eQNGq65AF+DlSw6CBqtpIVlwEe
   KrXF+E2J9BKlVoYaWDITN70AUopU/AarFtsqDDC6pKH63vRqOP0KCf7ii
   j3zdOi+XfIPQgh4YQlmcQaBHtfLMA/Amh0366RFO8I6k8Pusqv85lscr+
   iu6qNyBlnJzbvXqwCgfQXiCL881wn2elpqlYzBmCYM8Txco0EcWHL+lF8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="371793821"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="371793821"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766468508"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="766468508"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2023 02:04:31 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ6GU-0001tf-1R;
	Thu, 24 Aug 2023 09:04:30 +0000
Date: Thu, 24 Aug 2023 17:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/netfilter/xt_quota2.c:172:30: warning: 'q2_counter_fops' defined
 but not used
Message-ID: <202308241633.wcpo2Klt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 1fddb786f92f19613702d7c063c62996dfbc1ddf ANDROID: netfilter: xt_quota2: add quota2 from xtables-addons
date:   2 years, 8 months ago
config: xtensa-randconfig-r033-20230824 (https://download.01.org/0day-ci/archive/20230824/202308241633.wcpo2Klt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241633.wcpo2Klt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241633.wcpo2Klt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/xt_quota2.c:172:30: warning: 'q2_counter_fops' defined but not used [-Wunused-const-variable=]
     172 | static const struct proc_ops q2_counter_fops = {
         |                              ^~~~~~~~~~~~~~~


vim +/q2_counter_fops +172 net/netfilter/xt_quota2.c

   171	
 > 172	static const struct proc_ops q2_counter_fops = {
   173		.proc_read	= quota_proc_read,
   174		.proc_write	= quota_proc_write,
   175		.proc_lseek	= default_llseek,
   176	};
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
