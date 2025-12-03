Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2B2459F7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 04:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764735741; cv=none; b=ugbF0rNtjDwRa62tzMrGVKu4sso7yRaPwQDMat5Xt0M9FiK14F4hSo7wCxh9z/A+mxMziDVsFxNQwAy07LzhI0EO+tssIy473ErtPtrBYGMA0owNmB6W+eRpgXlxIw3pPG+xiSvZpSS0nwp6Lw+iKlQ1MBZvgu5XvwB4aWRcTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764735741; c=relaxed/simple;
	bh=kVjlgG/OUU9yG09uqEXaQcWVnBlDANQlgXdHsczOBtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxkSvsS6mra461LB+oqjUKZ5m+hk3WKDVBU3mS9PgeThQBO2pSAccn7t4hAGgfPuCSQ0aaayNwjL8xLEnwNyxjPKyqcH/WAdq1tc7YR8Tvsgv4mDqUGpEw+7EsnpIHm4torWxR9xdD/6wiHpE/J1ZFJNDm2+e6KMUnzBqZxEDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxPu8GU1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxPu8GU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764735740; x=1796271740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kVjlgG/OUU9yG09uqEXaQcWVnBlDANQlgXdHsczOBtk=;
  b=WxPu8GU1kAsUhdLQFFZ9xBlIuDwVF9J653q3vBMj98X4gah835XAYO4l
   0xm+omwxhK8oYn5FmaFJYAbV63uAch78Fwiw1A9q7H6lOybehqhSSM3Uh
   I44Rcc++lF5aAAts0WK7Ps0PtJ+I0MmQI6wNAMdWyFYEjs9Vg7ixfpiCK
   b9t79a+/zQtKnXpx6kEhYS8EUYdWS037ij0BU/QnuYsga3w14bmWOERim
   KjKyZS+eQjw7ECEq04Y/ivv7gYpxM9pMLhMegUqHE0mFsgu/My8gd1aof
   izuk+czWbb7gaDF3QnTAMsCUtDzUQx7eCu07cvOLnhfVyZToURqBdH2Ly
   g==;
X-CSE-ConnectionGUID: AkkoZt3hSL+bpwvDKT3xMQ==
X-CSE-MsgGUID: Dv1IQDwiTvuAmblMoKu1AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92197910"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="92197910"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:22:14 -0800
X-CSE-ConnectionGUID: 4FJaqYEdQw6rfQnFY8SdtA==
X-CSE-MsgGUID: woq5v479QeSFgYKM9lPwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="198733782"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 20:22:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQeNV-00000000AYf-4B1I;
	Wed, 03 Dec 2025 04:22:10 +0000
Date: Wed, 3 Dec 2025 12:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 19/25] drivers/pinctrl/pinconf-generic.c:214:16:
 warning: variable 'test' set but not used
Message-ID: <202512031219.VifBoeD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   adc6515a5eb0c69fae2b21414dfa290e4d215a5d
commit: e296cfc3eca606df4cfa8d797221de7652929ebc [19/25] pinctrl: pinconf-generic: perform basic checks on pincfg properties
config: x86_64-buildonly-randconfig-004-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031219.VifBoeD6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031219.VifBoeD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031219.VifBoeD6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinconf-generic.c: In function 'parse_dt_cfg':
>> drivers/pinctrl/pinconf-generic.c:214:16: warning: variable 'test' set but not used [-Wunused-but-set-variable]
     214 |         int i, test;
         |                ^~~~


vim +/test +214 drivers/pinctrl/pinconf-generic.c

   194	
   195	/**
   196	 * parse_dt_cfg() - Parse DT pinconf parameters
   197	 * @np:	DT node
   198	 * @params:	Array of describing generic parameters
   199	 * @count:	Number of entries in @params
   200	 * @cfg:	Array of parsed config options
   201	 * @ncfg:	Number of entries in @cfg
   202	 *
   203	 * Parse the config options described in @params from @np and puts the result
   204	 * in @cfg. @cfg does not need to be empty, entries are added beginning at
   205	 * @ncfg. @ncfg is updated to reflect the number of entries after parsing. @cfg
   206	 * needs to have enough memory allocated to hold all possible entries.
   207	 */
   208	static int parse_dt_cfg(struct device_node *np,
   209				 const struct pinconf_generic_params *params,
   210				 unsigned int count, unsigned long *cfg,
   211				 unsigned int *ncfg)
   212	{
   213		unsigned long *properties;
 > 214		int i, test;
   215	
   216		properties = bitmap_zalloc(count, GFP_KERNEL);
   217	
   218		for (i = 0; i < count; i++) {
   219			u32 val;
   220			int ret;
   221			const struct pinconf_generic_params *par = &params[i];
   222	
   223			ret = of_property_read_u32(np, par->property, &val);
   224	
   225			/* property not found */
   226			if (ret == -EINVAL)
   227				continue;
   228	
   229			/* if param is greater than count, these are custom properties */
   230			if (par->param <= count) {
   231				ret = test_and_set_bit(par->param, properties);
   232				if (ret) {
   233					pr_err("%s: conflicting setting detected for %s\n",
   234					       np->name, par->property);
   235					bitmap_free(properties);
   236					return -EINVAL;
   237				}
   238			}
   239	
   240			/* use default value, when no value is specified */
   241			if (ret)
   242				val = par->default_value;
   243	
   244			pr_debug("found %s with value %u\n", par->property, val);
   245			cfg[*ncfg] = pinconf_to_config_packed(par->param, val);
   246			(*ncfg)++;
   247		}
   248	
   249		if (test_bit(PIN_CONFIG_DRIVE_STRENGTH, properties) &&
   250				test_bit(PIN_CONFIG_DRIVE_STRENGTH_UA, properties))
   251			pr_err("%s: cannot have multiple drive strength properties\n",
   252			       np->name);
   253	
   254		test = test_bit(PIN_CONFIG_BIAS_BUS_HOLD, properties) +
   255			test_bit(PIN_CONFIG_BIAS_DISABLE, properties) +
   256			test_bit(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, properties) +
   257			test_bit(PIN_CONFIG_BIAS_PULL_UP, properties) +
   258			test_bit(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, properties) +
   259			test_bit(PIN_CONFIG_BIAS_PULL_DOWN, properties);
   260		if (i > 1)
   261			pr_err("%s: cannot have multiple bias configurations\n",
   262			       np->name);
   263	
   264		test = test_bit(PIN_CONFIG_DRIVE_OPEN_DRAIN, properties) +
   265			test_bit(PIN_CONFIG_DRIVE_OPEN_SOURCE, properties) +
   266			test_bit(PIN_CONFIG_DRIVE_PUSH_PULL, properties);
   267		if (i > 1)
   268			pr_err("%s: cannot have multiple drive configurations\n",
   269			       np->name);
   270	
   271		bitmap_free(properties);
   272		return 0;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
