Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997257C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 01:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690247231; x=1721783231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dv2JI4jVzPejf9p638CyWBMdfZ8bP5+hiJ3RIPrZn30=;
  b=PMwpykgYp+BR4/vHdJJeWafDR/nOelb6wBMAaJi79HC5oaLIKiqj/frR
   s2qPyVdnDVFxGz02Xfw8LooGRr6Lyn0kj1AhSJHIYNHTjrwY2p4Am7HZU
   pdYVZpLV5tGa6NtKDTyA/3jNLJksNOb6xc6cD37qb5x1e517nKG53WEYJ
   Zuix2POzBkBoDp1RstaUr2+krBWCZS01Uob4kmL+VmmsImCY9ZseRH+/q
   FaUFprQ8A4S/+sEwPj9krFRVZHC6nQwQKqDsfrhpF9fOyKiEWjXW/W9Eq
   XcqBiUNX9h7KugMadXgHONyu6ZONE7fp0TRlm38BYDAFR2O4IJUTM/n6X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431389254"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="431389254"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 18:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="761018921"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="761018921"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Jul 2023 18:07:09 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO6W5-000A9O-0l;
	Tue, 25 Jul 2023 01:07:09 +0000
Date: Tue, 25 Jul 2023 09:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] watchdog: Explicitly include correct DT includes
Message-ID: <202307250826.SP0DQLaA-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on groeck-staging/hwmon-next linus/master v6.5-rc3 next-20230724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/watchdog-Explicitly-include-correct-DT-includes/20230725-045823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20230724205503.767612-1-robh%40kernel.org
patch subject: [PATCH v2] watchdog: Explicitly include correct DT includes
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230725/202307250826.SP0DQLaA-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250826.SP0DQLaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250826.SP0DQLaA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/pic32-wdt.c:220:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
     220 |                 .of_match_table = of_match_ptr(pic32_wdt_dt_ids),
         |                                   ^~~~~~~~~~~~
>> drivers/watchdog/pic32-wdt.c:220:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/watchdog/pic32-wdt.c:220:35: note: (near initialization for 'pic32_wdt_driver.driver.of_match_table')
   drivers/watchdog/pic32-wdt.c:220:35: error: initializer element is not constant
   drivers/watchdog/pic32-wdt.c:220:35: note: (near initialization for 'pic32_wdt_driver.driver.of_match_table')
   cc1: some warnings being treated as errors
--
   drivers/watchdog/pic32-dmt.c:218:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
     218 |                 .of_match_table = of_match_ptr(pic32_dmt_of_ids),
         |                                   ^~~~~~~~~~~~
>> drivers/watchdog/pic32-dmt.c:218:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/watchdog/pic32-dmt.c:218:35: note: (near initialization for 'pic32_dmt_driver.driver.of_match_table')
   drivers/watchdog/pic32-dmt.c:218:35: error: initializer element is not constant
   drivers/watchdog/pic32-dmt.c:218:35: note: (near initialization for 'pic32_dmt_driver.driver.of_match_table')
   cc1: some warnings being treated as errors


vim +220 drivers/watchdog/pic32-wdt.c

8f91fc56bc439a Joshua Henderson 2016-02-26  215  
8f91fc56bc439a Joshua Henderson 2016-02-26  216  static struct platform_driver pic32_wdt_driver = {
8f91fc56bc439a Joshua Henderson 2016-02-26  217  	.probe		= pic32_wdt_drv_probe,
8f91fc56bc439a Joshua Henderson 2016-02-26  218  	.driver		= {
8f91fc56bc439a Joshua Henderson 2016-02-26  219  		.name		= "pic32-wdt",
8f91fc56bc439a Joshua Henderson 2016-02-26 @220  		.of_match_table = of_match_ptr(pic32_wdt_dt_ids),
8f91fc56bc439a Joshua Henderson 2016-02-26  221  	}
8f91fc56bc439a Joshua Henderson 2016-02-26  222  };
8f91fc56bc439a Joshua Henderson 2016-02-26  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
