Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8621379
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 01:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692236034; x=1723772034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzqbhQ0FJ6KQ4HwzdMkJ/ZMcgacF6SDKQ58kLCGrpLQ=;
  b=iOIVwy3Vlkzrspok5s0REz7JTbFgewlEIxRedUlZA2bN5ocnG1mMF/8U
   blu8EV5vHMuREXbVXdRJcdfZDIBe+xhuJxqO0oGqZlm3KVhbewQi94tqN
   hJ9HmWftlxAqLcPXt2X+yhso+F9dt3iVVSXtPrkdXkWxTRCup/b4NhyCf
   PCH0cAtbKQ6fx+r04x4HbtQfGkO2t5XXZVF6AJ6P9DgcvdsTLXjWHcX1P
   UX5jIv9d+4BEzZ/qB3y8ZcVyo/69UorvebQMgyXrGGuCC8d/kEyBmU8cW
   GAN1c9aVyb+8QCvI51WknWmXZSv1JFjCN9z3tKxqJntoDFsJS3Z/BveQt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357654102"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="357654102"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 18:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980943204"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="980943204"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2023 18:33:53 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWRtX-0000hp-2z;
	Thu, 17 Aug 2023 01:33:51 +0000
Date: Thu, 17 Aug 2023 09:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 2/4] kernel/sys.c:2402:12: warning: no
 previous declaration for 'arch_prctl_mem_model_get'
Message-ID: <202308170903.HXulDPgs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   6a8bd3529f0e9a26ebabd614ab6582cda3337142
commit: 086564cd01bf3c74974064629a57c8576f8e1af3 [2/4] prctl: Introduce PR_{SET,GET}_MEM_MODEL
config: i386-randconfig-r025-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170903.HXulDPgs-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170903.HXulDPgs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170903.HXulDPgs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sys.c:2402:12: warning: no previous declaration for 'arch_prctl_mem_model_get' [-Wmissing-declarations]
    int __weak arch_prctl_mem_model_get(struct task_struct *t)
               ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2407:12: warning: no previous declaration for 'arch_prctl_mem_model_set' [-Wmissing-declarations]
    int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
               ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_prctl_mem_model_get +2402 kernel/sys.c

  2401	
> 2402	int __weak arch_prctl_mem_model_get(struct task_struct *t)
  2403	{
  2404		return -EINVAL;
  2405	}
  2406	
> 2407	int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
  2408	{
  2409		return -EINVAL;
  2410	}
  2411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
