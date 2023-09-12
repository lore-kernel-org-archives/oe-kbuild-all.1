Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC8E54B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694507025; x=1726043025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4j6A7ccMz/vbGE7lr/HzVMphEjkDOOfrobsy/0nMyo=;
  b=ldyL7BuKJfxFgomJ/w/yLXY8Pqmd2HT+ZFhY2p/kOU8DXUncmoJoJJUc
   t3yKk5DRCA5/P9leQZ/+FdlNQX9Uu1NVwqauS3/RJi9nQtgR8c2fwfxyW
   5usNc9cum77SvvdgMMUA4mv2OH+r2W2w+UAdGaOCdyNz07EY2aertS8jn
   E68gCHB7dTLOvGGWNlOHKb4oU8kyN/ddPaYhUwbYYzT7J3E+azi5r5Gxg
   MLhL0rrh/W0abDGChBqaYmgYD539uwXmgmS5RXQPTQ7FO6QxZ3QxIBI4L
   6zvrU2SypCvcctScAsP6CaXVkylntLSYMyRzc4gHjSeoofzfvMZSeci50
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="357744867"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="357744867"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 01:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886864658"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="886864658"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2023 01:23:17 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfyfi-00008R-2p;
	Tue, 12 Sep 2023 08:23:17 +0000
Date: Tue, 12 Sep 2023 16:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 23/494]
 drivers/thermal/thermal_core.c:1249:17: sparse: sparse: incorrect type in
 assignment (different modifiers)
Message-ID: <202309121610.5bYazbCW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ahmad,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   7254b2033d5397a7407e6c77a6fbe3f731453f44
commit: 30f165a1bb5c37953a569af791f7e5f5ca26ce60 [23/494] thermal: core: constify params in thermal_zone_device_register
config: i386-randconfig-062-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121610.5bYazbCW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121610.5bYazbCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121610.5bYazbCW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_core.c:1249:17: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct thermal_zone_params *tzp @@     got struct thermal_zone_params const *tzp @@
   drivers/thermal/thermal_core.c:1249:17: sparse:     expected struct thermal_zone_params *tzp
   drivers/thermal/thermal_core.c:1249:17: sparse:     got struct thermal_zone_params const *tzp

vim +1249 drivers/thermal/thermal_core.c

e5f2cda61d068e1 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1152  
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1153  /**
fae11de507f0e42 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1154   * thermal_zone_device_register_with_trips() - register a new thermal zone device
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1155   * @type:	the thermal zone device type
fae11de507f0e42 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1156   * @trips:	a pointer to an array of thermal trips
e5bfcd30f88fdb0 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1157   * @num_trips:	the number of trip points the thermal zone support
c56f5c0342dfee1 drivers/thermal/thermal_sys.c  Durgadoss R         2012-07-25  1158   * @mask:	a bit string indicating the writeablility of trip points
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1159   * @devdata:	private device data
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1160   * @ops:	standard thermal zone device callbacks
50125a9b27dd09e drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1161   * @tzp:	thermal zone platform parameters
b1569e99c795bf8 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1162   * @passive_delay: number of milliseconds to wait between polls when
b1569e99c795bf8 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1163   *		   performing passive cooling
b1569e99c795bf8 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1164   * @polling_delay: number of milliseconds to wait between polls when checking
b1569e99c795bf8 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1165   *		   whether trip points have been crossed (0 for interrupt
b1569e99c795bf8 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1166   *		   driven systems)
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1167   *
a00e55f9c8c06e2 drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1168   * This interface function adds a new thermal zone device (sensor) to
a00e55f9c8c06e2 drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1169   * /sys/class/thermal folder as thermal_zone[0-*]. It tries to bind all the
a00e55f9c8c06e2 drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1170   * thermal cooling devices registered at the same time.
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1171   * thermal_zone_device_unregister() must be called when the device is no
1b7ddb840c39084 drivers/thermal/thermal_sys.c  Zhang Rui           2012-06-27  1172   * longer needed. The passive cooling depends on the .get_trend() return value.
a00e55f9c8c06e2 drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1173   *
a00e55f9c8c06e2 drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1174   * Return: a pointer to the created struct thermal_zone_device or an
a00e55f9c8c06e2 drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1175   * in case of error, an ERR_PTR. Caller must check return value with
a00e55f9c8c06e2 drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1176   * IS_ERR*() helpers.
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1177   */
eb7be329bd93b7a drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1178  struct thermal_zone_device *
fae11de507f0e42 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1179  thermal_zone_device_register_with_trips(const char *type, struct thermal_trip *trips, int num_trips, int mask,
eb7be329bd93b7a drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1180  					void *devdata, struct thermal_zone_device_ops *ops,
30f165a1bb5c379 drivers/thermal/thermal_core.c Ahmad Fatoum        2023-07-08  1181  					const struct thermal_zone_params *tzp, int passive_delay,
eb7be329bd93b7a drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1182  					int polling_delay)
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1183  {
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1184  	struct thermal_zone_device *tz;
03a971a28998860 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1185  	enum thermal_trip_type trip_type;
81ad4276b505e98 drivers/thermal/thermal_core.c Zhang Rui           2016-03-18  1186  	int trip_temp;
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1187  	int id;
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1188  	int result;
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1189  	int count;
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1190  	struct thermal_governor *governor;
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1191  
67eed44b8a8ae7c drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1192  	if (!type || strlen(type) == 0) {
3f95ac324535eaf drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1193  		pr_err("No thermal zone type defined\n");
54fa38cc2eda435 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1194  		return ERR_PTR(-EINVAL);
67eed44b8a8ae7c drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1195  	}
54fa38cc2eda435 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1196  
c71d8035f1b77dc drivers/thermal/thermal_core.c Lad Prabhakar       2022-09-09  1197  	if (strlen(type) >= THERMAL_NAME_LENGTH) {
3f95ac324535eaf drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1198  		pr_err("Thermal zone name (%s) too long, should be under %d chars\n",
67eed44b8a8ae7c drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1199  		       type, THERMAL_NAME_LENGTH);
3e6fda5c1159823 drivers/thermal/thermal.c      Thomas Sujith       2008-02-15  1200  		return ERR_PTR(-EINVAL);
67eed44b8a8ae7c drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1201  	}
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1202  
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1203  	/*
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1204  	 * Max trip count can't exceed 31 as the "mask >> num_trips" condition.
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1205  	 * For example, shifting by 32 will result in compiler warning:
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1206  	 * warning: right shift count >= width of type [-Wshift-count- overflow]
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1207  	 *
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1208  	 * Also "mask >> num_trips" will always be true with 32 bit shift.
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1209  	 * E.g. mask = 0x80000000 for trip id 31 to be RW. Then
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1210  	 * mask >> 32 = 0x80000000
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1211  	 * This will result in failure for the below condition.
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1212  	 *
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1213  	 * Check will be true when the bit 31 of the mask is set.
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1214  	 * 32 bit shift will cause overflow of 4 byte integer.
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1215  	 */
82b1ec794d70147 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1216  	if (num_trips > (BITS_PER_TYPE(int) - 1) || num_trips < 0 || mask >> num_trips) {
3f95ac324535eaf drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1217  		pr_err("Incorrect number of thermal trips\n");
3e6fda5c1159823 drivers/thermal/thermal.c      Thomas Sujith       2008-02-15  1218  		return ERR_PTR(-EINVAL);
67eed44b8a8ae7c drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1219  	}
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1220  
67eed44b8a8ae7c drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1221  	if (!ops) {
3f95ac324535eaf drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1222  		pr_err("Thermal zone device ops not defined\n");
3e6fda5c1159823 drivers/thermal/thermal.c      Thomas Sujith       2008-02-15  1223  		return ERR_PTR(-EINVAL);
67eed44b8a8ae7c drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1224  	}
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1225  
e5bfcd30f88fdb0 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1226  	if (num_trips > 0 && (!ops->get_trip_type || !ops->get_trip_temp))
6b2aa51d698492e drivers/thermal/thermal_sys.c  Eduardo Valentin    2013-01-02  1227  		return ERR_PTR(-EINVAL);
6b2aa51d698492e drivers/thermal/thermal_sys.c  Eduardo Valentin    2013-01-02  1228  
95e3ed1513494aa drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1229  	tz = kzalloc(sizeof(*tz), GFP_KERNEL);
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1230  	if (!tz)
3e6fda5c1159823 drivers/thermal/thermal.c      Thomas Sujith       2008-02-15  1231  		return ERR_PTR(-ENOMEM);
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1232  
2d374139d5b0b59 drivers/thermal/thermal_sys.c  Zhang Rui           2012-06-27  1233  	INIT_LIST_HEAD(&tz->thermal_instances);
b31ef8285b19ec5 drivers/thermal/thermal_core.c Matthew Wilcox      2016-12-21  1234  	ida_init(&tz->ida);
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1235  	mutex_init(&tz->lock);
5a5b7d8d5416849 drivers/thermal/thermal_core.c keliu               2022-05-27  1236  	id = ida_alloc(&thermal_tz_ida, GFP_KERNEL);
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1237  	if (id < 0) {
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1238  		result = id;
9d9ca1f9f04cf1d drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1239  		goto free_tz;
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1240  	}
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1241  
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1242  	tz->id = id;
1e6c8fb8b8d3e91 drivers/thermal/thermal_core.c Wolfram Sang        2022-08-18  1243  	strscpy(tz->type, type, sizeof(tz->type));
d7203eedf4f68e9 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-10  1244  
d7203eedf4f68e9 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-10  1245  	if (!ops->critical)
d7203eedf4f68e9 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-10  1246  		ops->critical = thermal_zone_device_critical;
d7203eedf4f68e9 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-10  1247  
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1248  	tz->ops = ops;
50125a9b27dd09e drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18 @1249  	tz->tzp = tzp;
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1250  	tz->device.class = &thermal_class;
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1251  	tz->devdata = devdata;
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1252  	tz->trips = trips;
e5bfcd30f88fdb0 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1253  	tz->num_trips = num_trips;
1c600861fa6fd88 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1254  
17d399cd9c89369 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-16  1255  	thermal_set_delay_jiffies(&tz->passive_delay_jiffies, passive_delay);
17d399cd9c89369 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-16  1256  	thermal_set_delay_jiffies(&tz->polling_delay_jiffies, polling_delay);
17d399cd9c89369 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-16  1257  
4d0fe7490d7f4d6 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1258  	/* sys I/F */
1c600861fa6fd88 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1259  	/* Add nodes that are always present via .groups */
4d0fe7490d7f4d6 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1260  	result = thermal_zone_create_device_groups(tz, mask);
4d0fe7490d7f4d6 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1261  	if (result)
9d9ca1f9f04cf1d drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1262  		goto remove_id;
4d0fe7490d7f4d6 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1263  
4511f7166a2deb5 drivers/thermal/thermal_core.c Chen Yu             2015-10-30  1264  	/* A new thermal zone needs to be updated anyway. */
4511f7166a2deb5 drivers/thermal/thermal_core.c Chen Yu             2015-10-30  1265  	atomic_set(&tz->need_update, 1);
b1569e99c795bf8 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1266  
e0d8b51bbe84d6a drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1267  	result = dev_set_name(&tz->device, "thermal_zone%d", tz->id);
e0d8b51bbe84d6a drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1268  	if (result) {
e0d8b51bbe84d6a drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1269  		thermal_zone_destroy_device_groups(tz);
e0d8b51bbe84d6a drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1270  		goto remove_id;
e0d8b51bbe84d6a drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1271  	}
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1272  	result = device_register(&tz->device);
9d9ca1f9f04cf1d drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1273  	if (result)
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1274  		goto release_device;
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1275  
e5bfcd30f88fdb0 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1276  	for (count = 0; count < num_trips; count++) {
37b2539e63d6570 drivers/thermal/thermal_core.c Bernard Zhao        2020-10-26  1277  		if (tz->ops->get_trip_type(tz, count, &trip_type) ||
37b2539e63d6570 drivers/thermal/thermal_core.c Bernard Zhao        2020-10-26  1278  		    tz->ops->get_trip_temp(tz, count, &trip_temp) ||
37b2539e63d6570 drivers/thermal/thermal_core.c Bernard Zhao        2020-10-26  1279  		    !trip_temp)
81ad4276b505e98 drivers/thermal/thermal_core.c Zhang Rui           2016-03-18  1280  			set_bit(count, &tz->trips_disabled);
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1281  	}
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1282  
a4a15485fbba44d drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1283  	/* Update 'this' zone's governor information */
a4a15485fbba44d drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1284  	mutex_lock(&thermal_governor_lock);
a4a15485fbba44d drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1285  
a4a15485fbba44d drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1286  	if (tz->tzp)
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1287  		governor = __find_governor(tz->tzp->governor_name);
a4a15485fbba44d drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1288  	else
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1289  		governor = def_governor;
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1290  
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1291  	result = thermal_set_governor(tz, governor);
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1292  	if (result) {
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1293  		mutex_unlock(&thermal_governor_lock);
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1294  		goto unregister;
e33df1d2f3a0141 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1295  	}
a4a15485fbba44d drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1296  
a4a15485fbba44d drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1297  	mutex_unlock(&thermal_governor_lock);
a4a15485fbba44d drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1298  
ccba4ffd9eff612 drivers/thermal/thermal_core.c Eduardo Valentin    2013-08-15  1299  	if (!tz->tzp || !tz->tzp->no_hwmon) {
e68b16abd91dca9 drivers/thermal/thermal.c      Zhang Rui           2008-04-21  1300  		result = thermal_add_hwmon_sysfs(tz);
e68b16abd91dca9 drivers/thermal/thermal.c      Zhang Rui           2008-04-21  1301  		if (result)
e68b16abd91dca9 drivers/thermal/thermal.c      Zhang Rui           2008-04-21  1302  			goto unregister;
ccba4ffd9eff612 drivers/thermal/thermal_core.c Eduardo Valentin    2013-08-15  1303  	}
e68b16abd91dca9 drivers/thermal/thermal.c      Zhang Rui           2008-04-21  1304  
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1305  	mutex_lock(&thermal_list_lock);
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1306  	list_add_tail(&tz->node, &thermal_tz_list);
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1307  	mutex_unlock(&thermal_list_lock);
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1308  
7e8ee1e9d7561fe drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1309  	/* Bind cooling devices for this zone */
7e8ee1e9d7561fe drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1310  	bind_tz(tz);
7e8ee1e9d7561fe drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1311  
b659a30d7bdd5d9 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1312  	INIT_DELAYED_WORK(&tz->poll_queue, thermal_zone_device_check);
b1569e99c795bf8 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1313  
d0df264fbd3c531 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-22  1314  	thermal_zone_device_init(tz);
4511f7166a2deb5 drivers/thermal/thermal_core.c Chen Yu             2015-10-30  1315  	/* Update the new thermal zone and mark it as already updated. */
4511f7166a2deb5 drivers/thermal/thermal_core.c Chen Yu             2015-10-30  1316  	if (atomic_cmpxchg(&tz->need_update, 1, 0))
0e70f466fb910ae drivers/thermal/thermal_core.c Srinivas Pandruvada 2016-08-26  1317  		thermal_zone_device_update(tz, THERMAL_EVENT_UNSPECIFIED);
b1569e99c795bf8 drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1318  
55cdf0a283b8760 drivers/thermal/thermal_core.c Daniel Lezcano      2020-07-06  1319  	thermal_notify_tz_create(tz->id, tz->type);
55cdf0a283b8760 drivers/thermal/thermal_core.c Daniel Lezcano      2020-07-06  1320  
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1321  	return tz;
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1322  
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1323  unregister:
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1324  	device_del(&tz->device);
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1325  release_device:
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1326  	put_device(&tz->device);
adc8749b150c51e drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1327  	tz = NULL;
9d9ca1f9f04cf1d drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1328  remove_id:
5a5b7d8d5416849 drivers/thermal/thermal_core.c keliu               2022-05-27  1329  	ida_free(&thermal_tz_ida, id);
9d9ca1f9f04cf1d drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1330  free_tz:
9d9ca1f9f04cf1d drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1331  	kfree(tz);
9d9ca1f9f04cf1d drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1332  	return ERR_PTR(result);
203d3d4aa482339 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1333  }
a921be53b46c393 drivers/thermal/thermal_core.c Daniel Lezcano      2022-08-10  1334  EXPORT_SYMBOL_GPL(thermal_zone_device_register_with_trips);
fae11de507f0e42 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1335  

:::::: The code at line 1249 was first introduced by commit
:::::: 50125a9b27dd09e9afdc1b8712ba0b3859886c68 Thermal: Pass zone parameters as argument to tzd_register

:::::: TO: Durgadoss R <durgadoss.r@intel.com>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
