Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B384A29
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 05:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680759161; x=1712295161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3VyLCJ4i8h2HPMiNEJY9Hg2UqWkGfXoquJBPdT1ThiM=;
  b=QIXG4A7gubzgXrFbheeWfF0tzcnOzb3nbL4xHj1IYAjwsSMvFPoDDZyo
   BBUsAKog9boXCzQdxfAaBdU4GIh7CyDaWchZWwGmtO5DxfwwMUyXLZoLE
   P5cKTFy6KoPSQzUeXcvh03D0mbwA8JD7vL5Ei1Ks0R5jt9CO5zuC61s79
   i5N49WqckNCpFk+Fo0uHonvv1kS6bV5yEjxWGRI1ISHZFmzZqmIeyozcS
   fcsYugrYPqS+td/9ZtgfSNvm9uwRlpR0MAacOwRmzHio0EoORbW35a32C
   N/BT4G8HKP7DbkRtVvVF5ubtMjCaOTTIbQefWK/k5I54Ymm+EYjhih09Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="323021849"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="323021849"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 22:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="933078574"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="933078574"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2023 22:32:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkIEg-000R5i-2O;
	Thu, 06 Apr 2023 05:32:38 +0000
Date: Thu, 6 Apr 2023 13:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net: dsa: replace
 NETDEV_PRE_CHANGE_HWTSTAMP notifier with a stub
Message-ID: <202304061324.mnmSnwNK-lkp@intel.com>
References: <20230405165115.3744445-1-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405165115.3744445-1-vladimir.oltean@nxp.com>

Hi Vladimir,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-dsa-replace-NETDEV_PRE_CHANGE_HWTSTAMP-notifier-with-a-stub/20230406-005302
patch link:    https://lore.kernel.org/r/20230405165115.3744445-1-vladimir.oltean%40nxp.com
patch subject: [RFC PATCH net-next] net: dsa: replace NETDEV_PRE_CHANGE_HWTSTAMP notifier with a stub
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230406/202304061324.mnmSnwNK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/4788a6c004ab7f7210b1d27777e733eab85db17e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vladimir-Oltean/net-dsa-replace-NETDEV_PRE_CHANGE_HWTSTAMP-notifier-with-a-stub/20230406-005302
        git checkout 4788a6c004ab7f7210b1d27777e733eab85db17e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs// net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061324.mnmSnwNK-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/dev_ioctl.c: In function 'dev_set_hwtstamp':
>> net/core/dev_ioctl.c:276:15: error: too many arguments to function 'dsa_master_hwtstamp_validate'
     276 |         err = dsa_master_hwtstamp_validate(dev, &kernel_cfg, &extack);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/core/dev_ioctl.c:10:
   include/net/dsa_stubs.h:43:19: note: declared here
      43 | static inline int dsa_master_hwtstamp_validate(struct net_device *dev,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dsa_master_hwtstamp_validate +276 net/core/dev_ioctl.c

   259	
   260	static int dev_set_hwtstamp(struct net_device *dev, struct ifreq *ifr)
   261	{
   262		struct kernel_hwtstamp_config kernel_cfg;
   263		struct netlink_ext_ack extack = {};
   264		struct hwtstamp_config cfg;
   265		int err;
   266	
   267		if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
   268			return -EFAULT;
   269	
   270		hwtstamp_config_to_kernel(&kernel_cfg, &cfg);
   271	
   272		err = net_hwtstamp_validate(&kernel_cfg);
   273		if (err)
   274			return err;
   275	
 > 276		err = dsa_master_hwtstamp_validate(dev, &kernel_cfg, &extack);
   277		if (err) {
   278			if (extack._msg)
   279				netdev_err(dev, "%s\n", extack._msg);
   280			return err;
   281		}
   282	
   283		return dev_eth_ioctl(dev, ifr, SIOCSHWTSTAMP);
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
