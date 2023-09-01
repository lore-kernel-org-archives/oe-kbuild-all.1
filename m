Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551C2184
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 02:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693535601; x=1725071601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f/y2zK21f9B0KaL1TQtDKJMxkGVExRwCE/uX17Ov1cE=;
  b=erc6Jr7wrV5xM0+9jo4T7Yd1VceAMg7ZlBGlfXW6uaWXKqb0ya21g5EK
   DIVKNuNbNUHYkaFPUViAz5Hc3JrrfnXdaqoH4AgkQUdACq1hOQ5kCKKLs
   Ie99ttTfpwJealBTEYdTx9jvUxqCoJOspVaJ7fPuECik44VUqB5YKfl0t
   xA/dBupqmXr/TGqB5wXwOhZgDxNIaZqqGNNnnnniZ38RiI9Les/p7NsOA
   jlez81mwwjFy3wbU9pUMJP5vmJmhN8FOCWw7lDWEKnSsC/MVH2W2QtVjX
   FdgHP6xTJFuiSzXWTVjmWlTyIGjCCh8LnLmupdtACwLl9javGzOOOgnTK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375022264"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="375022264"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 19:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863385707"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="863385707"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 19:33:18 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbtyG-0000mV-1i;
	Fri, 01 Sep 2023 02:33:16 +0000
Date: Fri, 1 Sep 2023 10:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] regulator: userspace-consumer: Add regulator event
 support
Message-ID: <202309011007.XMgtARDc-lkp@intel.com>
References: <20230831121412.2359239-2-Naresh.Solanki@9elements.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831121412.2359239-2-Naresh.Solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 35d0d2350d774fecf596cfb2fb050559fe5e1850]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-userspace-consumer-Add-regulator-event-support/20230831-201619
base:   35d0d2350d774fecf596cfb2fb050559fe5e1850
patch link:    https://lore.kernel.org/r/20230831121412.2359239-2-Naresh.Solanki%409elements.com
patch subject: [PATCH 2/3] regulator: userspace-consumer: Add regulator event support
config: openrisc-randconfig-r016-20230901 (https://download.01.org/0day-ci/archive/20230901/202309011007.XMgtARDc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011007.XMgtARDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011007.XMgtARDc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/userspace-consumer.c: In function 'regulator_userspace_notify':
>> drivers/regulator/userspace-consumer.c:146:47: error: initialization of 'const char * const*' from incompatible pointer type 'char *' [-Werror=incompatible-pointer-types]
     146 |         static const char * const *envp[] = { "NAME=events", NULL };
         |                                               ^~~~~~~~~~~~~
   drivers/regulator/userspace-consumer.c:146:47: note: (near initialization for 'envp[0]')
>> drivers/regulator/userspace-consumer.c:153:53: error: passing argument 3 of 'kobject_uevent_env' from incompatible pointer type [-Werror=incompatible-pointer-types]
     153 |         kobject_uevent_env(data->kobj, KOBJ_CHANGE, envp);
         |                                                     ^~~~
         |                                                     |
         |                                                     const char * const**
   In file included from include/linux/module.h:21,
                    from drivers/regulator/userspace-consumer.c:16:
   include/linux/kobject.h:214:31: note: expected 'char **' but argument is of type 'const char * const**'
     214 |                         char *envp[]);
         |                         ~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +146 drivers/regulator/userspace-consumer.c

   139	
   140	static int regulator_userspace_notify(struct notifier_block *nb,
   141					      unsigned long event,
   142					      void *ignored)
   143	{
   144		struct userspace_consumer_data *data =
   145			container_of(nb, struct userspace_consumer_data, nb);
 > 146		static const char * const *envp[] = { "NAME=events", NULL };
   147	
   148		spin_lock(&events_lock);
   149		data->events |= event;
   150		spin_unlock(&events_lock);
   151	
   152		sysfs_notify(data->kobj, NULL, dev_attr_events.attr.name);
 > 153		kobject_uevent_env(data->kobj, KOBJ_CHANGE, envp);
   154	
   155		return NOTIFY_OK;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
