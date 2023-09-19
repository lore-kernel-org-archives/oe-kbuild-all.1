Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3EC37CB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695138691; x=1726674691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZEsqVicoBTqU5ZL8zjCDbAACxgSal00DMWcaQoZYMmI=;
  b=MJMWMq/Ub1cz3exhnnYhEMF+DMDwcLyYBcqw4ke0Gp8VtHny040ixz0s
   Yf7M7Iz+Ts0n6drGyYmsxkRuAxXJ4XWH35CPFO39vL/Oq6w4UsQxVvwN9
   zCWpJYWJznHCYElqdICKJ0tN4AGiWGnIP2BpTAbnhhTjVlF2lj0KH6b9g
   kkJMUBM3IVLGz91GQ6LZntoCwWwV/5XknaDF/mXwE/UePNP4gLFpKCC8/
   XVezM0ZXURlGPxD3JesKzOb6ONVTtE70RwWEnwC8Mld5A5F6XP2dBgzrF
   1yZD5ZJ4342NXB5gDrSmuWJ8P6bPmphleylCYr/c8//959HSCzSd7JNte
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377291646"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="377291646"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 08:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836481883"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="836481883"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2023 08:51:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qid0W-0007a4-2v;
	Tue, 19 Sep 2023 15:51:24 +0000
Date: Tue, 19 Sep 2023 23:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>, broonie@kernel.org,
	zev@bewilderbeest.net, Liam Girdwood <lgirdwood@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: userspace-consumer: Retrieve supplies from DT
Message-ID: <202309192318.EFnp91Rd-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 451e85e29c9d6f20639d4cfcff4b9dea280178cc]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-userspace-consumer-Retrieve-supplies-from-DT/20230919-141840
base:   451e85e29c9d6f20639d4cfcff4b9dea280178cc
patch link:    https://lore.kernel.org/r/20230919061755.3412016-1-naresh.solanki%409elements.com
patch subject: [PATCH] regulator: userspace-consumer: Retrieve supplies from DT
config: i386-randconfig-014-20230919 (https://download.01.org/0day-ci/archive/20230919/202309192318.EFnp91Rd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192318.EFnp91Rd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192318.EFnp91Rd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/regulator/userspace-consumer.c: In function 'get_num_supplies':
   drivers/regulator/userspace-consumer.c:126:9: error: implicit declaration of function 'for_each_property_of_node'; did you mean 'for_each_child_of_node'? [-Werror=implicit-function-declaration]
     126 |         for_each_property_of_node(pdev->dev.of_node, prop) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         for_each_child_of_node
   drivers/regulator/userspace-consumer.c:126:59: error: expected ';' before '{' token
     126 |         for_each_property_of_node(pdev->dev.of_node, prop) {
         |                                                           ^~
         |                                                           ;
>> drivers/regulator/userspace-consumer.c:124:13: warning: unused variable 'num_supplies' [-Wunused-variable]
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


vim +/num_supplies +124 drivers/regulator/userspace-consumer.c

   120	
   121	static int get_num_supplies(struct platform_device *pdev)
   122	{
   123		struct  property *prop;
 > 124		int num_supplies = 0;
   125	
   126		for_each_property_of_node(pdev->dev.of_node, prop) {
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
