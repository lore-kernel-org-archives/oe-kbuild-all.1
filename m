Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929051FD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 03:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690255470; x=1721791470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wyVPSk8fLzxFK6LErov5vUShliBMupua0fSsMrF01iI=;
  b=MR30xs1FDmk2pWdXLUSV0ZapOBoox/rwz4IdgXPtxWbOPV4ZUqVb/oJA
   4Tl/+GOOEuBv4sfV/C5dDeKtiW42T3Jh+BilVE9q58Bff0fy2yc/2euoW
   44OHySEZHJcNYtT2Dgk5TOq90ebaPJzc16LUCqUzG868WnTykEkXkrCxe
   /qO5eEG+QXsk164iQoLKWNxNPcwKRMGmLoiR2ivCqhj2/BlPBCct14NGP
   8QzOn/VDzNojBmcM/YgDwLUeZpmcfsHrahJQw242pHGnQQN1Qn42Llq4n
   lw2kOOYcJ8Z965o1QrgaSZChQscjiRapjwKEAoqc/KYedhPN8zOmwNEpE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347213218"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="347213218"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 20:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="729175625"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="729175625"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jul 2023 20:24:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO8eB-000AGa-2p;
	Tue, 25 Jul 2023 03:23:45 +0000
Date: Tue, 25 Jul 2023 11:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] watchdog: Explicitly include correct DT includes
Message-ID: <202307251109.Bp8nss0Z-lkp@intel.com>
References: <20230724205503.767612-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724205503.767612-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on groeck-staging/hwmon-next linus/master v6.5-rc3 next-20230724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/watchdog-Explicitly-include-correct-DT-includes/20230725-045823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20230724205503.767612-1-robh%40kernel.org
patch subject: [PATCH v2] watchdog: Explicitly include correct DT includes
config: mips-randconfig-r022-20230724 (https://download.01.org/0day-ci/archive/20230725/202307251109.Bp8nss0Z-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251109.Bp8nss0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251109.Bp8nss0Z-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/watchdog/pic32-dmt.c:218:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
     218 |                 .of_match_table = of_match_ptr(pic32_dmt_of_ids),
         |                                   ^~~~~~~~~~~~
>> drivers/watchdog/pic32-dmt.c:218:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/watchdog/pic32-dmt.c:218:35: note: (near initialization for 'pic32_dmt_driver.driver.of_match_table')
>> drivers/watchdog/pic32-dmt.c:218:35: error: initializer element is not constant
   drivers/watchdog/pic32-dmt.c:218:35: note: (near initialization for 'pic32_dmt_driver.driver.of_match_table')
   cc1: some warnings being treated as errors


vim +/of_match_ptr +218 drivers/watchdog/pic32-dmt.c

b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26  213  
b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26  214  static struct platform_driver pic32_dmt_driver = {
b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26  215  	.probe		= pic32_dmt_probe,
b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26  216  	.driver		= {
b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26  217  		.name		= "pic32-dmt",
b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26 @218  		.of_match_table = of_match_ptr(pic32_dmt_of_ids),
b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26  219  	}
b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26  220  };
b0d8a082ce9c82 Purna Chandra Mandal 2016-02-26  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
