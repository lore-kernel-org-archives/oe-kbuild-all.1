Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD028DB9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 19:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695153190; x=1726689190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=geHwA3OeDB3eBBn9jJ8anp9OdK21qswmKQE2nVcMoVw=;
  b=dLzXvkmw6FsSp96zPC5trSPXVUJro+4L7rNI0leU03Q3CYSq901U4V36
   XDBelfEscXrfFsSL2ZzAFE7xfDhmxj80bkH329JrtGBrxHhoPh1d72IT1
   rZzJHF0MvJJt5wtg0ajHluQEERKQcJIUbPcn7dUIG/CGfEE9RaGmh8Npo
   3bk49F9wxIiKcqxTJmBtFAzYzPKuzo+irVn9suWpcyhvXbzKXVJv71Wil
   Y/SxKIZOciPyXgouI6/kvdgw54wziRiH/iwEIuzHqw4WBgnEff6tAiFAu
   ptf73Z6nKgJ13XGMLAB3/OxS9zb7abN4A6lRhQ1aFjL19km7k4FmBwlZ2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410969237"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="410969237"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 12:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077112204"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="1077112204"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Sep 2023 12:53:07 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qigmP-0007rA-06;
	Tue, 19 Sep 2023 19:53:05 +0000
Date: Wed, 20 Sep 2023 03:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>, broonie@kernel.org,
	zev@bewilderbeest.net, Liam Girdwood <lgirdwood@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: userspace-consumer: Retrieve supplies from DT
Message-ID: <202309200316.ACh8kKEW-lkp@intel.com>
References: <20230919061755.3412016-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919061755.3412016-1-naresh.solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 451e85e29c9d6f20639d4cfcff4b9dea280178cc]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-userspace-consumer-Retrieve-supplies-from-DT/20230919-141840
base:   451e85e29c9d6f20639d4cfcff4b9dea280178cc
patch link:    https://lore.kernel.org/r/20230919061755.3412016-1-naresh.solanki%409elements.com
patch subject: [PATCH] regulator: userspace-consumer: Retrieve supplies from DT
config: i386-randconfig-014-20230919 (https://download.01.org/0day-ci/archive/20230920/202309200316.ACh8kKEW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200316.ACh8kKEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200316.ACh8kKEW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/userspace-consumer.c: In function 'get_num_supplies':
>> drivers/regulator/userspace-consumer.c:126:9: error: implicit declaration of function 'for_each_property_of_node'; did you mean 'for_each_child_of_node'? [-Werror=implicit-function-declaration]
     126 |         for_each_property_of_node(pdev->dev.of_node, prop) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         for_each_child_of_node
>> drivers/regulator/userspace-consumer.c:126:59: error: expected ';' before '{' token
     126 |         for_each_property_of_node(pdev->dev.of_node, prop) {
         |                                                           ^~
         |                                                           ;
   drivers/regulator/userspace-consumer.c:124:13: warning: unused variable 'num_supplies' [-Wunused-variable]
     124 |         int num_supplies = 0;
         |             ^~~~~~~~~~~~
   drivers/regulator/userspace-consumer.c:136:1: error: no return statement in function returning non-void [-Werror=return-type]
     136 | }
         | ^
   drivers/regulator/userspace-consumer.c: In function 'regulator_userspace_consumer_probe':
   drivers/regulator/userspace-consumer.c:162:67: error: expected ';' before '{' token
     162 |                 for_each_property_of_node(pdev->dev.of_node, prop) {
         |                                                                   ^~
         |                                                                   ;
   cc1: some warnings being treated as errors


vim +126 drivers/regulator/userspace-consumer.c

   120	
   121	static int get_num_supplies(struct platform_device *pdev)
   122	{
   123		struct  property *prop;
   124		int num_supplies = 0;
   125	
 > 126		for_each_property_of_node(pdev->dev.of_node, prop) {
   127			const char *prop_name = prop->name;
   128			int len = strlen(prop_name);
   129	
   130			if (len > SUPPLY_SUFFIX_LEN &&
   131			    strcmp(prop_name + len - SUPPLY_SUFFIX_LEN, SUPPLY_SUFFIX) == 0) {
   132				num_supplies++;
   133			}
   134		}
   135		return num_supplies;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
