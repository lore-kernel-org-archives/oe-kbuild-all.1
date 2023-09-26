Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20260637
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 01:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695690163; x=1727226163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TsPd2QmK2niqJEMKjNprfsLihZh24jsh5hZqozhVEZU=;
  b=FAzp0cgQlc2gpDdEIol+P9Kb1G5Q8Ie94rx7Uk8S3kRUsDYRiT9kWJ+6
   nnlg2RcM6IW9fRSPoFGmFbem4O+DvA2QhQUYvK8p97rcKvbUqco1VR62O
   Y9N5pZdBTv4CH8c55bjZ9YN4rQVEsyW+a3AWnaXUbkqz9zh1YO8Ygx5NS
   fUT+jzFMaPvN/StlrYJ7nx6RTz3s2Wcgz49BthfK0kHCE5z/WjbjeWD13
   hEWXoJNlqbHHsH6CURILsKfj3BeojH1uvTH0WOMcIYvAsflEsc80gI6Jt
   0hZA8mhmjPyK2tOh6DI3DWOCLw0U6DpSSmiIa9UwO2izZsK5dC9L6j/Xr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445579886"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="445579886"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 18:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814267931"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="814267931"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2023 18:02:40 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkwTG-0002D1-38;
	Tue, 26 Sep 2023 01:02:38 +0000
Date: Tue, 26 Sep 2023 09:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sre-power-supply:psy-battery-cleanup 72/82]
 drivers/power/supply/ab8500_charger.c:1952:31: error: incompatible type for
 argument 1 of 'class_for_each_device'
Message-ID: <202309260840.RhikPOC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git psy-battery-cleanup
head:   7e5a5a9f81f57cdb12b9e334f1352bacbb4eaad8
commit: 59b7ed1c1fc6d17cb361ad3892fe0b8920b3da7d [72/82] power: supply: core: make power_supply_class const
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309260840.RhikPOC0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260840.RhikPOC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260840.RhikPOC0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/supply/ab8500_charger.c: In function 'ab8500_charger_check_vbat_work':
>> drivers/power/supply/ab8500_charger.c:1952:31: error: incompatible type for argument 1 of 'class_for_each_device'
    1952 |         class_for_each_device(power_supply_class, NULL,
         |                               ^~~~~~~~~~~~~~~~~~
         |                               |
         |                               struct class
   In file included from include/linux/device.h:31,
                    from drivers/power/supply/ab8500_charger.c:15:
   include/linux/device/class.h:97:47: note: expected 'const struct class *' but argument is of type 'struct class'
      97 | int class_for_each_device(const struct class *class, const struct device *start, void *data,
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~
--
   drivers/power/supply/ab8500_fg.c: In function 'ab8500_fg_external_power_changed':
>> drivers/power/supply/ab8500_fg.c:2410:31: error: incompatible type for argument 1 of 'class_for_each_device'
    2410 |         class_for_each_device(power_supply_class, NULL, psy,
         |                               ^~~~~~~~~~~~~~~~~~
         |                               |
         |                               struct class
   In file included from include/linux/device.h:31,
                    from drivers/power/supply/ab8500_fg.c:21:
   include/linux/device/class.h:97:47: note: expected 'const struct class *' but argument is of type 'struct class'
      97 | int class_for_each_device(const struct class *class, const struct device *start, void *data,
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~
--
   drivers/power/supply/ab8500_btemp.c: In function 'ab8500_btemp_external_power_changed':
>> drivers/power/supply/ab8500_btemp.c:627:31: error: incompatible type for argument 1 of 'class_for_each_device'
     627 |         class_for_each_device(power_supply_class, NULL, psy,
         |                               ^~~~~~~~~~~~~~~~~~
         |                               |
         |                               struct class
   In file included from include/linux/device.h:31,
                    from drivers/power/supply/ab8500_btemp.c:15:
   include/linux/device/class.h:97:47: note: expected 'const struct class *' but argument is of type 'struct class'
      97 | int class_for_each_device(const struct class *class, const struct device *start, void *data,
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~
--
   drivers/power/supply/ab8500_chargalg.c: In function 'ab8500_chargalg_algorithm':
>> drivers/power/supply/ab8500_chargalg.c:1234:31: error: incompatible type for argument 1 of 'class_for_each_device'
    1234 |         class_for_each_device(power_supply_class, NULL,
         |                               ^~~~~~~~~~~~~~~~~~
         |                               |
         |                               struct class
   In file included from include/linux/device.h:31,
                    from drivers/power/supply/ab8500_chargalg.c:17:
   include/linux/device/class.h:97:47: note: expected 'const struct class *' but argument is of type 'struct class'
      97 | int class_for_each_device(const struct class *class, const struct device *start, void *data,
         |                           ~~~~~~~~~~~~~~~~~~~~^~~~~


vim +/class_for_each_device +1952 drivers/power/supply/ab8500_charger.c

84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1936  
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1937  /**
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1938   * ab8500_charger_check_vbat_work() - keep vbus current within spec
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1939   * @work	pointer to the work_struct structure
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1940   *
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1941   * Due to a asic bug it is necessary to lower the input current to the vbus
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1942   * charger when charging with at some specific levels. This issue is only valid
03b33d4ac41e4d drivers/power/supply/ab8500_charger.c wangjianli          2022-10-22  1943   * for below a certain battery voltage. This function makes sure that
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1944   * the allowed current limit isn't exceeded.
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1945   */
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1946  static void ab8500_charger_check_vbat_work(struct work_struct *work)
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1947  {
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1948  	int t = 10;
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1949  	struct ab8500_charger *di = container_of(work,
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1950  		struct ab8500_charger, check_vbat_work.work);
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1951  
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29 @1952  	class_for_each_device(power_supply_class, NULL,
21ad180d0fdfb2 drivers/power/supply/ab8500_charger.c Linus Walleij       2022-01-29  1953  			      &di->usb_chg, ab8500_charger_get_ext_psy_data);
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1954  
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1955  	/* First run old_vbat is 0. */
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1956  	if (di->old_vbat == 0)
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1957  		di->old_vbat = di->vbat;
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1958  
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1959  	if (!((di->old_vbat <= VBAT_TRESH_IP_CUR_RED &&
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1960  		di->vbat <= VBAT_TRESH_IP_CUR_RED) ||
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1961  		(di->old_vbat > VBAT_TRESH_IP_CUR_RED &&
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1962  		di->vbat > VBAT_TRESH_IP_CUR_RED))) {
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1963  
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1964  		dev_dbg(di->dev, "Vbat did cross threshold, curr: %d, new: %d,"
83e5aa77d1120f drivers/power/supply/ab8500_charger.c Linus Walleij       2021-11-20  1965  			" old: %d\n", di->max_usb_in_curr.usb_type_max_ua,
f7470b5d246294 drivers/power/ab8500_charger.c        Lee Jones           2013-02-14  1966  			di->vbat, di->old_vbat);
f7470b5d246294 drivers/power/ab8500_charger.c        Lee Jones           2013-02-14  1967  		ab8500_charger_set_vbus_in_curr(di,
83e5aa77d1120f drivers/power/supply/ab8500_charger.c Linus Walleij       2021-11-20  1968  					di->max_usb_in_curr.usb_type_max_ua);
297d716f6260cc drivers/power/ab8500_charger.c        Krzysztof Kozlowski 2015-03-12  1969  		power_supply_changed(di->usb_chg.psy);
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1970  	}
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1971  
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1972  	di->old_vbat = di->vbat;
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1973  
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1974  	/*
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1975  	 * No need to check the battery voltage every second when not close to
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1976  	 * the threshold.
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1977  	 */
21ad180d0fdfb2 drivers/power/supply/ab8500_charger.c Linus Walleij       2022-01-29  1978  	if (di->vbat < (VBAT_TRESH_IP_CUR_RED + 100000) &&
21ad180d0fdfb2 drivers/power/supply/ab8500_charger.c Linus Walleij       2022-01-29  1979  		(di->vbat > (VBAT_TRESH_IP_CUR_RED - 100000)))
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1980  			t = 1;
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1981  
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1982  	queue_delayed_work(di->charger_wq, &di->check_vbat_work, t * HZ);
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1983  }
84edbeeab67c15 drivers/power/ab8500_charger.c        Arun Murthy         2012-02-29  1984  

:::::: The code at line 1952 was first introduced by commit
:::::: 84edbeeab67c1575067335179513150115da367b ab8500-charger: AB8500 charger driver

:::::: TO: Arun Murthy <arun.murthy@stericsson.com>
:::::: CC: Anton Vorontsov <anton.vorontsov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
