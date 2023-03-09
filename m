Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9C944D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678362326; x=1709898326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IJBUHluiD9xAyzjbFJfHVvyD/VXxIi5tVeFMgU76yik=;
  b=T/wid+iCtp6m7FjFghuzGd6BgVt/ZR7ty3VhD4kP8TcwEvb8R/S9rxfr
   S96x8LRLh/rbZ3xIPvu3ZVu/3JRWCajoSsU7Q9aTXrkKP7fbx19e6xzqU
   mfic9+JuL40n0dTIxHO8o643prTAcgqhicoIazTUrhjbr4GOdEsY4EiRN
   0So212TYGT3RSw/pclyUjEFQw6FqC2a3/wMm7R67nQUOCDIbgtIhIbzmN
   80Yz0fi1UPi4K3jyJVbWH66Wlu57XOlpl/N93nI2qOCpR0AOi6XgjLnF8
   lXLV6rk+DVBXFny6KzLaaFqIwp6YYOfujxOdL2swZqU80Aus8L01I7Csk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335127261"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="335127261"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 03:45:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851485141"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="851485141"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Mar 2023 03:45:23 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paEi2-0002uv-1b;
	Thu, 09 Mar 2023 11:45:22 +0000
Date: Thu, 9 Mar 2023 19:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: constify struct hwmon_chip_info info member harder
Message-ID: <202303091901.0BoQeZI2-lkp@intel.com>
References: <20230309082841.400118-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309082841.400118-1-jani.nikula@intel.com>

Hi Jani,

I love your patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/hwmon-constify-struct-hwmon_chip_info-info-member-harder/20230309-163328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230309082841.400118-1-jani.nikula%40intel.com
patch subject: [PATCH] hwmon: constify struct hwmon_chip_info info member harder
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230309/202303091901.0BoQeZI2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/1ec9eaf0281f0a40044492700b7cdfe99d35d35e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/hwmon-constify-struct-hwmon_chip_info-info-member-harder/20230309-163328
        git checkout 1ec9eaf0281f0a40044492700b7cdfe99d35d35e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091901.0BoQeZI2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/hwmon.c: In function 'hwmon_thermal_set_trips':
>> drivers/hwmon/hwmon.c:177:50: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     177 |         const struct hwmon_channel_info **info = chip->info;
         |                                                  ^~~~
   drivers/hwmon/hwmon.c: In function 'hwmon_thermal_register_sensors':
   drivers/hwmon/hwmon.c:256:50: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     256 |         const struct hwmon_channel_info **info = chip->info;
         |                                                  ^~~~


vim +/const +177 drivers/hwmon/hwmon.c

d560168b5d0fb4a Guenter Roeck   2015-08-26  171  
e5181331359d931 Daniel Lezcano  2022-08-05  172  static int hwmon_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  173  {
e5181331359d931 Daniel Lezcano  2022-08-05  174  	struct hwmon_thermal_data *tdata = tz->devdata;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  175  	struct hwmon_device *hwdev = to_hwmon_device(tdata->dev);
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  176  	const struct hwmon_chip_info *chip = hwdev->chip;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23 @177  	const struct hwmon_channel_info **info = chip->info;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  178  	unsigned int i;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  179  	int err;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  180  
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  181  	if (!chip->ops->write)
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  182  		return 0;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  183  
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  184  	for (i = 0; info[i] && info[i]->type != hwmon_temp; i++)
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  185  		continue;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  186  
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  187  	if (!info[i])
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  188  		return 0;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  189  
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  190  	if (info[i]->config[tdata->index] & HWMON_T_MIN) {
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  191  		err = chip->ops->write(tdata->dev, hwmon_temp,
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  192  				       hwmon_temp_min, tdata->index, low);
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  193  		if (err && err != -EOPNOTSUPP)
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  194  			return err;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  195  	}
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  196  
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  197  	if (info[i]->config[tdata->index] & HWMON_T_MAX) {
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  198  		err = chip->ops->write(tdata->dev, hwmon_temp,
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  199  				       hwmon_temp_max, tdata->index, high);
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  200  		if (err && err != -EOPNOTSUPP)
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  201  			return err;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  202  	}
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  203  
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  204  	return 0;
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  205  }
a5f6c0f85a09f46 Dmitry Osipenko 2021-06-23  206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
