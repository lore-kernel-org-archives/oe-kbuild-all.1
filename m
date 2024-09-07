Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EED35280
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 05:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725685463; cv=none; b=AAxbRupUsy4Cl9lWzbiOyRc1EquZZzETx6XCe70b6eopayN0tRrwCH2uOPuFOwMYaZJS7udS7CsFTBetsKtCmVi40NwlZZ7dlfd3rZdzPvGQxygM/l1VBsD/QumxLe9NSWQAeuWCEFGAWN5fsXpDKI5eknFu8Uy6e/YjfvjJlss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725685463; c=relaxed/simple;
	bh=ex5vjlP5elty+NBVZ56o09wVqIq6A3ZWWfny5sBr+n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBmkM/LiK+0QckeFblH4HaEOQruBTS++1BEbNOfUCf1qroIq8rktxdwRP8t/tmp9FCg3Q2gWq+3Qgf5xKQlHG6MAkpengh9iqR3lDVCYtGEt6V2i1JupqFUg3hiTyZF2rNKtQx4mQKJGrIIEYgH3ztvHj2n9Ge+2ePLhhpXjvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPdYu5T8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPdYu5T8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725685460; x=1757221460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ex5vjlP5elty+NBVZ56o09wVqIq6A3ZWWfny5sBr+n8=;
  b=XPdYu5T8KpPwsBCQYYITQvpinkJv4raVmf8stDRFW0H5qz8LaQfm1NhA
   BKBqgye1qK+6G5hgzKbZzBU7/8iKfmNlVd6DM7gGgXVdXtJyYgLptu9v7
   Rq3JrnoAWf7F+PwO1xtR3WBryAZ+UMIPijVK+XO29nrdEGv8ouZLBUtyo
   bGjra4aHVCx4GPvHlTiSmQimELMy7qJ8+Jk+goe3fO+dDoYzq5qRCDJvG
   WOpXMJuBGFkyeAUZgfHYd11DrgOah0JvPXwtPMY3aottw+XOpSo0N7+CO
   ISF6IT/aCA71RlzJjIF3xYDjZqz52O3wlfyKBoWPQ2zWLm4c6AW1Q1cE6
   w==;
X-CSE-ConnectionGUID: nn6+0QyTSEWIHqTHxF+T1Q==
X-CSE-MsgGUID: PJ6LPV99SQWJIZbd1KM40Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35594595"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="35594595"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 22:04:20 -0700
X-CSE-ConnectionGUID: HSUxUQ/sT8uUHDpzsp+uHQ==
X-CSE-MsgGUID: Xea6znuRSvWoy3ov02ppaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70271947"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Sep 2024 22:04:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smncO-000C8U-2r;
	Sat, 07 Sep 2024 05:04:16 +0000
Date: Sat, 7 Sep 2024 13:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/6] thermal/netlink: Add the commands and the events
 for the thresholds
Message-ID: <202409071208.lqchxayq-lkp@intel.com>
References: <20240906073631.1655552-4-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906073631.1655552-4-daniel.lezcano@linaro.org>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on next-20240906]
[cannot apply to linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-core-Add-user-thresholds-support/20240906-153941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20240906073631.1655552-4-daniel.lezcano%40linaro.org
patch subject: [PATCH v3 3/6] thermal/netlink: Add the commands and the events for the thresholds
config: x86_64-buildonly-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071208.lqchxayq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071208.lqchxayq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071208.lqchxayq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/thermal_thresholds.c: In function 'thermal_thresholds_flush':
>> drivers/thermal/thermal_thresholds.c:35:9: error: implicit declaration of function 'thermal_notify_threshold_flush'; did you mean 'thermal_thresholds_flush'? [-Werror=implicit-function-declaration]
      35 |         thermal_notify_threshold_flush(tz, pid);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         thermal_thresholds_flush
   drivers/thermal/thermal_thresholds.c: In function 'thermal_thresholds_handle':
>> drivers/thermal/thermal_thresholds.c:151:25: error: implicit declaration of function 'thermal_notify_threshold_up'; did you mean 'thermal_notify_tz_trip_up'? [-Werror=implicit-function-declaration]
     151 |                         thermal_notify_threshold_up(tz);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         thermal_notify_tz_trip_up
>> drivers/thermal/thermal_thresholds.c:155:25: error: implicit declaration of function 'thermal_notify_threshold_down'; did you mean 'thermal_notify_tz_trip_down'? [-Werror=implicit-function-declaration]
     155 |                         thermal_notify_threshold_down(tz);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         thermal_notify_tz_trip_down
   drivers/thermal/thermal_thresholds.c: In function 'thermal_thresholds_add':
>> drivers/thermal/thermal_thresholds.c:186:9: error: implicit declaration of function 'thermal_notify_threshold_add'; did you mean 'thermal_thresholds_add'? [-Werror=implicit-function-declaration]
     186 |         thermal_notify_threshold_add(tz, temperature, direction, pid);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         thermal_thresholds_add
   drivers/thermal/thermal_thresholds.c: In function 'thermal_thresholds_delete':
>> drivers/thermal/thermal_thresholds.c:212:9: error: implicit declaration of function 'thermal_notify_threshold_delete'; did you mean 'thermal_thresholds_delete'? [-Werror=implicit-function-declaration]
     212 |         thermal_notify_threshold_delete(tz, temperature, direction, pid);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         thermal_thresholds_delete
   cc1: some warnings being treated as errors


vim +35 drivers/thermal/thermal_thresholds.c

    22	
    23	void thermal_thresholds_flush(struct thermal_zone_device *tz, pid_t pid)
    24	{
    25		struct list_head *thresholds = &tz->user_thresholds;
    26		struct user_threshold *entry, *tmp;
    27	
    28		lockdep_assert_held(&tz->lock);
    29	
    30		list_for_each_entry_safe(entry, tmp, thresholds, list_node) {
    31			list_del(&entry->list_node);
    32			kfree(entry);
    33		}
    34	
  > 35		thermal_notify_threshold_flush(tz, pid);
    36	
    37		__thermal_zone_device_update(tz, THERMAL_TZ_FLUSH_THRESHOLDS);
    38	}
    39	
    40	void thermal_thresholds_exit(struct thermal_zone_device *tz)
    41	{
    42		thermal_thresholds_flush(tz, 0);
    43	}
    44	
    45	static int __thermal_thresholds_cmp(void *data,
    46					    const struct list_head *l1,
    47					    const struct list_head *l2)
    48	{
    49		struct user_threshold *t1 = container_of(l1, struct user_threshold, list_node);
    50		struct user_threshold *t2 = container_of(l2, struct user_threshold, list_node);
    51	
    52		return t1->temperature - t2->temperature;
    53	}
    54	
    55	static struct user_threshold *__thermal_thresholds_find(const struct list_head *thresholds,
    56								int temperature)
    57	{
    58		struct user_threshold *t;
    59	
    60		list_for_each_entry(t, thresholds, list_node)
    61			if (t->temperature == temperature)
    62				return t;
    63	
    64		return NULL;
    65	}
    66	
    67	static bool __thermal_threshold_is_crossed(struct user_threshold *threshold, int temperature,
    68						   int last_temperature, int direction,
    69						   int *low, int *high)
    70	{
    71	
    72		if (temperature >= threshold->temperature) {
    73			if (threshold->temperature > *low &&
    74			    THERMAL_THRESHOLD_WAY_DOWN & threshold->direction)
    75				*low = threshold->temperature;
    76	
    77			if (last_temperature < threshold->temperature &&
    78			    threshold->direction & direction)
    79				return true;
    80		} else {
    81			if (threshold->temperature < *high && THERMAL_THRESHOLD_WAY_UP
    82			    & threshold->direction)
    83				*high = threshold->temperature;
    84	
    85			if (last_temperature >= threshold->temperature &&
    86			    threshold->direction & direction)
    87				return true;
    88		}
    89	
    90		return false;
    91	}
    92	
    93	static bool thermal_thresholds_handle_raising(struct list_head *thresholds, int temperature,
    94						      int last_temperature, int *low, int *high)
    95	{
    96		struct user_threshold *t;
    97	
    98		list_for_each_entry(t, thresholds, list_node) {
    99			if (__thermal_threshold_is_crossed(t, temperature, last_temperature,
   100							   THERMAL_THRESHOLD_WAY_UP, low, high))
   101				return true;
   102		}
   103	
   104		return false;
   105	}
   106	
   107	static bool thermal_thresholds_handle_dropping(struct list_head *thresholds, int temperature,
   108						       int last_temperature, int *low, int *high)
   109	{
   110		struct user_threshold *t;
   111	
   112		list_for_each_entry_reverse(t, thresholds, list_node) {
   113			if (__thermal_threshold_is_crossed(t, temperature, last_temperature,
   114							   THERMAL_THRESHOLD_WAY_DOWN, low, high))
   115				return true;
   116		}
   117	
   118		return false;
   119	}
   120	
   121	void thermal_thresholds_handle(struct thermal_zone_device *tz, int *low, int *high)
   122	{
   123		struct list_head *thresholds = &tz->user_thresholds;
   124	
   125		int temperature = tz->temperature;
   126		int last_temperature = tz->last_temperature;
   127	
   128		lockdep_assert_held(&tz->lock);
   129	
   130		/*
   131		 * We need a second update in order to detect a threshold being crossed
   132		 */
   133		if (last_temperature == THERMAL_TEMP_INVALID)
   134			return;
   135	
   136		/*
   137		 * The temperature is stable, so obviously we can not have
   138		 * crossed a threshold.
   139		 */
   140		if (last_temperature == temperature)
   141			return;
   142	
   143		/*
   144		 * Since last update the temperature:
   145		 * - increased : thresholds are crossed the way up
   146		 * - decreased : thresholds are crossed the way down
   147		 */
   148		if (temperature > last_temperature) {
   149			if (thermal_thresholds_handle_raising(thresholds, temperature,
   150							      last_temperature, low, high))
 > 151				thermal_notify_threshold_up(tz);
   152		} else {
   153			if (thermal_thresholds_handle_dropping(thresholds, temperature,
   154							       last_temperature, low, high))
 > 155				thermal_notify_threshold_down(tz);
   156		}
   157	}
   158	
   159	int thermal_thresholds_add(struct thermal_zone_device *tz,
   160				   int temperature, int direction, pid_t pid)
   161	{
   162		struct list_head *thresholds = &tz->user_thresholds;
   163		struct user_threshold *t;
   164	
   165		lockdep_assert_held(&tz->lock);
   166	
   167		t = __thermal_thresholds_find(thresholds, temperature);
   168		if (t) {
   169			if (t->direction == direction)
   170				return -EEXIST;
   171	
   172			t->direction |= direction;
   173		} else {
   174	
   175			t = kmalloc(sizeof(*t), GFP_KERNEL);
   176			if (!t)
   177				return -ENOMEM;
   178	
   179			INIT_LIST_HEAD(&t->list_node);
   180			t->temperature = temperature;
   181			t->direction = direction;
   182			list_add(&t->list_node, thresholds);
   183			list_sort(NULL, thresholds, __thermal_thresholds_cmp);
   184		}
   185	
 > 186		thermal_notify_threshold_add(tz, temperature, direction, pid);
   187	
   188		__thermal_zone_device_update(tz, THERMAL_TZ_ADD_THRESHOLD);
   189	
   190		return 0;
   191	}
   192	
   193	int thermal_thresholds_delete(struct thermal_zone_device *tz,
   194				      int temperature, int direction, pid_t pid)
   195	{
   196		struct list_head *thresholds = &tz->user_thresholds;
   197		struct user_threshold *t;
   198	
   199		lockdep_assert_held(&tz->lock);
   200	
   201		t = __thermal_thresholds_find(thresholds, temperature);
   202		if (!t)
   203			return -ENOENT;
   204	
   205		if (t->direction == direction) {
   206			list_del(&t->list_node);
   207			kfree(t);
   208		} else {
   209			t->direction &= ~direction;
   210		}
   211	
 > 212		thermal_notify_threshold_delete(tz, temperature, direction, pid);
   213	
   214		__thermal_zone_device_update(tz, THERMAL_TZ_DEL_THRESHOLD);
   215		
   216		return 0;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
