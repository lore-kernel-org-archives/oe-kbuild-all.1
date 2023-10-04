Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9B91D54A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696443119; x=1727979119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n4HyfSA5w24SFcZe2aU+tZ+XRrIqdPWBEKVvtjaa8iQ=;
  b=L/TtXsfo8CsHHDkD5Dnx7qQLWCfmCUGOLmxdnRY5PXgIgD8GKR5JiO/Q
   6EGe32aHwwRmhoyOKVZrqBq91zDujW+w+Ao7DxXJh1ws6xIKWb0+526IR
   NkB3OySSTGXsCjjAgYHbWy9WTU5Jn2RFQsfvC/zFs7+aQHioOC9xvJBlO
   YA5yIhhjdffDlqvByVxty48mK88SxipCTRGPODVr3nO2s0SrGLcfRlamk
   ON2Ru6PmVBXITJWjMy64gMBJoi8sC//Nl7OPdLW+d8nRrXXGYE/EgSPcD
   UzI39vK5ImpBluUKpV/qPy2OpchcvZSIEWNVl4Kvst/PX6S5lZsVbGXY4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383162306"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="383162306"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 11:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="895085121"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="895085121"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2023 11:10:29 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo6Li-000KU6-09;
	Wed, 04 Oct 2023 18:11:54 +0000
Date: Thu, 5 Oct 2023 02:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>, broonie@kernel.org,
	zev@bewilderbeest.net, Liam Girdwood <lgirdwood@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] regulator: userspace-consumer: Retrieve supplies
 from DT
Message-ID: <202310050133.mv0eecfC-lkp@intel.com>
References: <20231004121010.1192344-2-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004121010.1192344-2-naresh.solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on f9a1d31874c383f58bb4f89bfe79b764682cd026]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-userspace-consumer-Retrieve-supplies-from-DT/20231004-201151
base:   f9a1d31874c383f58bb4f89bfe79b764682cd026
patch link:    https://lore.kernel.org/r/20231004121010.1192344-2-naresh.solanki%409elements.com
patch subject: [PATCH v2 2/3] regulator: userspace-consumer: Retrieve supplies from DT
config: i386-buildonly-randconfig-003-20231004 (https://download.01.org/0day-ci/archive/20231005/202310050133.mv0eecfC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050133.mv0eecfC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050133.mv0eecfC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/regulator/userspace-consumer.c: In function 'get_num_supplies':
>> drivers/regulator/userspace-consumer.c:139:9: error: implicit declaration of function 'for_each_property_of_node'; did you mean 'for_each_child_of_node'? [-Werror=implicit-function-declaration]
     139 |         for_each_property_of_node(pdev->dev.of_node, prop) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         for_each_child_of_node
>> drivers/regulator/userspace-consumer.c:139:59: error: expected ';' before '{' token
     139 |         for_each_property_of_node(pdev->dev.of_node, prop) {
         |                                                           ^~
         |                                                           ;
   drivers/regulator/userspace-consumer.c:137:13: warning: unused variable 'num_supplies' [-Wunused-variable]
     137 |         int num_supplies = 0;
         |             ^~~~~~~~~~~~
   drivers/regulator/userspace-consumer.c:144:1: error: no return statement in function returning non-void [-Werror=return-type]
     144 | }
         | ^
   drivers/regulator/userspace-consumer.c: In function 'regulator_userspace_consumer_probe':
   drivers/regulator/userspace-consumer.c:170:67: error: expected ';' before '{' token
     170 |                 for_each_property_of_node(pdev->dev.of_node, prop) {
         |                                                                   ^~
         |                                                                   ;
   drivers/regulator/userspace-consumer.c: At top level:
>> drivers/regulator/userspace-consumer.c:121:15: warning: 'prop_supply_name' defined but not used [-Wunused-function]
     121 | static size_t prop_supply_name(char *prop_name)
         |               ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +139 drivers/regulator/userspace-consumer.c

   120	
 > 121	static size_t prop_supply_name(char *prop_name)
   122	{
   123		int len = strlen(prop_name);
   124	
   125		if (len <= SUPPLY_SUFFIX_LEN)
   126			return 0;
   127	
   128		if (strcmp(prop_name + len - SUPPLY_SUFFIX_LEN, SUPPLY_SUFFIX) == 0)
   129			return len - SUPPLY_SUFFIX_LEN;
   130	
   131		return 0;
   132	}
   133	
   134	static int get_num_supplies(struct platform_device *pdev)
   135	{
   136		struct  property *prop;
   137		int num_supplies = 0;
   138	
 > 139		for_each_property_of_node(pdev->dev.of_node, prop) {
   140			if (prop_supply_name(prop->name))
   141				num_supplies++;
   142		}
   143		return num_supplies;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
