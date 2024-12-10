Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE613A8F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733829781; cv=none; b=kfdERXmTdjnMTg8RpUG8uc0IFcvAiENzFrdXOtHpCOCuShoho9x2GyOvdsEIYylz1OM2pNpq1z8BB5HZ8zbugzcMEQPgGeoMmz2Eh1nt+Udj5NBz9RvfyhhBY8rEdgkjDU+vAFZsZ2AwK9B075XJXcBQuTK/BmwI3wMZ7hfbz7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733829781; c=relaxed/simple;
	bh=oZCOTfNSmM+5KGAw6oJkXueJe+BSswSKQpTLH7MGZjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEi+U2K7CXS7tC2agRLNRg0FPW0x3+LSPsJ6JHnZIejEZEfQ4696E2+qhPBGTaGijqRSI5AAQjkt9b/lQYEYu70vlGhVT9S0dkM5u4qLzNRPi4odslYoZnJC8yddeMxvuVfT+eCCY7y6sbEpHRNvjzQ8BSnemHTbTiBwNgC97iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2joa4vl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2joa4vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733829779; x=1765365779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oZCOTfNSmM+5KGAw6oJkXueJe+BSswSKQpTLH7MGZjw=;
  b=P2joa4vl/49/8DzaeZ/ZeKwfKDzQcjDDZFUxdSJW7WZGs+VmjeHP1lE0
   oEIHrUTj4eqMRlVwm3jfwistoOegwsq3ewFM/qxkO4wOmx+FF0Ncw4JOm
   K8GFqiKe7jkP3+erBvIJ1lwdw5pSfkB8+vO3gbe/zVZFDEa30Q5DykIKm
   wIXml4prvQHjMP+zU1tlfw3q4HKl5oJf28o73ZzTi4f3B04pwfrU7aPUS
   SXnw9+dww3nXmC7JUBmCwJPDLo3UkjPFZtjtsg+gEukcfEBGS706Yb6FV
   BR7w1n5vP7OgvOWxr6+ZgwHvJ+tmzNaHzajgejvt0+guXu4rSw2XRZCfj
   g==;
X-CSE-ConnectionGUID: MdfWnQMSR56FAPYlipeWaA==
X-CSE-MsgGUID: nHZrXjFNS+KmEuvlBQqYIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="38094527"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="38094527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:22:58 -0800
X-CSE-ConnectionGUID: oFjODxDmS1GLOju5ZsELaQ==
X-CSE-MsgGUID: qgWpZASDSyylDIQ5mp+fxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100189822"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2024 03:22:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKyKN-0005Sv-0S;
	Tue, 10 Dec 2024 11:22:55 +0000
Date: Tue, 10 Dec 2024 19:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 04/14] power: supply: ab8500: use
 power_supply_for_each_psy()
Message-ID: <202412101826.pTkgu0Ol-lkp@intel.com>
References: <20241208-power-supply-dev_to_psy-v1-4-f95de9117558@weissschuh.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241208-power-supply-dev_to_psy-v1-4-f95de9117558@weissschuh.net>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 39f3bd9c9a27d526858da153090376decdf7bfea]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/power-supply-mm8013-use-accessor-for-driver-data/20241208-210605
base:   39f3bd9c9a27d526858da153090376decdf7bfea
patch link:    https://lore.kernel.org/r/20241208-power-supply-dev_to_psy-v1-4-f95de9117558%40weissschuh.net
patch subject: [PATCH 04/14] power: supply: ab8500: use power_supply_for_each_psy()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20241210/202412101826.pTkgu0Ol-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101826.pTkgu0Ol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101826.pTkgu0Ol-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/supply/ab8500_btemp.c:543:49: warning: 'struct power_supply_ext' declared inside parameter list will not be visible outside of this definition or declaration
     543 | static int ab8500_btemp_get_ext_psy_data(struct power_supply_ext *ext, void *data)
         |                                                 ^~~~~~~~~~~~~~~~
   drivers/power/supply/ab8500_btemp.c: In function 'ab8500_btemp_get_ext_psy_data':
>> drivers/power/supply/ab8500_btemp.c:546:54: error: invalid use of undefined type 'struct power_supply_ext'
     546 |         const char **supplicants = (const char **)ext->supplied_to;
         |                                                      ^~
   drivers/power/supply/ab8500_btemp.c:558:42: error: invalid use of undefined type 'struct power_supply_ext'
     558 |         j = match_string(supplicants, ext->num_supplicants, psy->desc->name);
         |                                          ^~
   drivers/power/supply/ab8500_btemp.c:563:28: error: invalid use of undefined type 'struct power_supply_ext'
     563 |         for (j = 0; j < ext->desc->num_properties; j++) {
         |                            ^~
   drivers/power/supply/ab8500_btemp.c:565:27: error: invalid use of undefined type 'struct power_supply_ext'
     565 |                 prop = ext->desc->properties[j];
         |                           ^~
>> drivers/power/supply/ab8500_btemp.c:567:47: error: passing argument 1 of 'power_supply_get_property' from incompatible pointer type [-Wincompatible-pointer-types]
     567 |                 if (power_supply_get_property(ext, prop, &ret))
         |                                               ^~~
         |                                               |
         |                                               struct power_supply_ext *
   In file included from drivers/power/supply/ab8500_btemp.c:21:
   include/linux/power_supply.h:855:59: note: expected 'struct power_supply *' but argument is of type 'struct power_supply_ext *'
     855 | extern int power_supply_get_property(struct power_supply *psy,
         |                                      ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/power/supply/ab8500_btemp.c:572:36: error: invalid use of undefined type 'struct power_supply_ext'
     572 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_btemp.c: In function 'ab8500_btemp_external_power_changed':
>> drivers/power/supply/ab8500_btemp.c:619:40: error: passing argument 2 of 'power_supply_for_each_psy' from incompatible pointer type [-Wincompatible-pointer-types]
     619 |         power_supply_for_each_psy(psy, ab8500_btemp_get_ext_psy_data);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        |
         |                                        int (*)(struct power_supply_ext *, void *)
   include/linux/power_supply.h:885:56: note: expected 'int (*)(struct power_supply *, void *)' but argument is of type 'int (*)(struct power_supply_ext *, void *)'
     885 | extern int power_supply_for_each_psy(void *data, int (*fn)(struct power_supply *psy, void *data));
         |                                                  ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/power/supply/ab8500_chargalg.c:847:52: warning: 'struct power_supply_ext' declared inside parameter list will not be visible outside of this definition or declaration
     847 | static int ab8500_chargalg_get_ext_psy_data(struct power_supply_ext *ext, void *data)
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/power/supply/ab8500_chargalg.c: In function 'ab8500_chargalg_get_ext_psy_data':
>> drivers/power/supply/ab8500_chargalg.c:850:54: error: invalid use of undefined type 'struct power_supply_ext'
     850 |         const char **supplicants = (const char **)ext->supplied_to;
         |                                                      ^~
   drivers/power/supply/ab8500_chargalg.c:859:42: error: invalid use of undefined type 'struct power_supply_ext'
     859 |         j = match_string(supplicants, ext->num_supplicants, psy->desc->name);
         |                                          ^~
>> drivers/power/supply/ab8500_chargalg.c:868:40: error: passing argument 1 of 'power_supply_get_property' from incompatible pointer type [-Wincompatible-pointer-types]
     868 |         if (!power_supply_get_property(ext, POWER_SUPPLY_PROP_CAPACITY, &ret)) {
         |                                        ^~~
         |                                        |
         |                                        struct power_supply_ext *
   In file included from drivers/power/supply/ab8500_chargalg.c:24:
   include/linux/power_supply.h:855:59: note: expected 'struct power_supply *' but argument is of type 'struct power_supply_ext *'
     855 | extern int power_supply_get_property(struct power_supply *psy,
         |                                      ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/power/supply/ab8500_chargalg.c:874:28: error: invalid use of undefined type 'struct power_supply_ext'
     874 |         for (j = 0; j < ext->desc->num_properties; j++) {
         |                            ^~
   drivers/power/supply/ab8500_chargalg.c:876:27: error: invalid use of undefined type 'struct power_supply_ext'
     876 |                 prop = ext->desc->properties[j];
         |                           ^~
   drivers/power/supply/ab8500_chargalg.c:882:28: error: invalid use of undefined type 'struct power_supply_ext'
     882 |                         ext->desc->type == POWER_SUPPLY_TYPE_MAINS)
         |                            ^~
   In file included from drivers/power/supply/ab8500_chargalg.c:35:
>> drivers/power/supply/ab8500_chargalg.c:883:59: error: passing argument 1 of 'power_supply_get_drvdata' from incompatible pointer type [-Wincompatible-pointer-types]
     883 |                         di->ac_chg = psy_to_ux500_charger(ext);
         |                                                           ^~~
         |                                                           |
         |                                                           struct power_supply_ext *
   drivers/power/supply/ab8500-chargalg.h:18:58: note: in definition of macro 'psy_to_ux500_charger'
      18 | #define psy_to_ux500_charger(x) power_supply_get_drvdata(x)
         |                                                          ^
   include/linux/power_supply.h:883:60: note: expected 'struct power_supply *' but argument is of type 'struct power_supply_ext *'
     883 | extern void *power_supply_get_drvdata(struct power_supply *psy);
         |                                       ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/power/supply/ab8500_chargalg.c:885:28: error: invalid use of undefined type 'struct power_supply_ext'
     885 |                         ext->desc->type == POWER_SUPPLY_TYPE_USB)
         |                            ^~
   drivers/power/supply/ab8500_chargalg.c:886:60: error: passing argument 1 of 'power_supply_get_drvdata' from incompatible pointer type [-Wincompatible-pointer-types]
     886 |                         di->usb_chg = psy_to_ux500_charger(ext);
         |                                                            ^~~
         |                                                            |
         |                                                            struct power_supply_ext *
   drivers/power/supply/ab8500-chargalg.h:18:58: note: in definition of macro 'psy_to_ux500_charger'
      18 | #define psy_to_ux500_charger(x) power_supply_get_drvdata(x)
         |                                                          ^
   include/linux/power_supply.h:883:60: note: expected 'struct power_supply *' but argument is of type 'struct power_supply_ext *'
     883 | extern void *power_supply_get_drvdata(struct power_supply *psy);
         |                                       ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/power/supply/ab8500_chargalg.c:888:47: error: passing argument 1 of 'power_supply_get_property' from incompatible pointer type [-Wincompatible-pointer-types]
     888 |                 if (power_supply_get_property(ext, prop, &ret))
         |                                               ^~~
         |                                               |
         |                                               struct power_supply_ext *
   include/linux/power_supply.h:855:59: note: expected 'struct power_supply *' but argument is of type 'struct power_supply_ext *'
     855 | extern int power_supply_get_property(struct power_supply *psy,
         |                                      ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/power/supply/ab8500_chargalg.c:892:36: error: invalid use of undefined type 'struct power_supply_ext'
     892 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_chargalg.c:939:36: error: invalid use of undefined type 'struct power_supply_ext'
     939 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_chargalg.c:984:36: error: invalid use of undefined type 'struct power_supply_ext'
     984 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_chargalg.c:1068:36: error: invalid use of undefined type 'struct power_supply_ext'
    1068 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_chargalg.c:1084:36: error: invalid use of undefined type 'struct power_supply_ext'
    1084 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_chargalg.c:1109:36: error: invalid use of undefined type 'struct power_supply_ext'
    1109 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_chargalg.c:1127:36: error: invalid use of undefined type 'struct power_supply_ext'
    1127 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_chargalg.c:1143:36: error: invalid use of undefined type 'struct power_supply_ext'
    1143 |                         switch (ext->desc->type) {
         |                                    ^~
   drivers/power/supply/ab8500_chargalg.c: In function 'ab8500_chargalg_algorithm':
>> drivers/power/supply/ab8500_chargalg.c:1233:53: error: passing argument 2 of 'power_supply_for_each_psy' from incompatible pointer type [-Wincompatible-pointer-types]
    1233 |         power_supply_for_each_psy(di->chargalg_psy, ab8500_chargalg_get_ext_psy_data);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     int (*)(struct power_supply_ext *, void *)
   include/linux/power_supply.h:885:56: note: expected 'int (*)(struct power_supply *, void *)' but argument is of type 'int (*)(struct power_supply_ext *, void *)'
     885 | extern int power_supply_for_each_psy(void *data, int (*fn)(struct power_supply *psy, void *data));
         |                                                  ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +546 drivers/power/supply/ab8500_btemp.c

1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  542  
3fb873c78321abf drivers/power/supply/ab8500_btemp.c Thomas Weiﬂschuh    2024-12-08  543  static int ab8500_btemp_get_ext_psy_data(struct power_supply_ext *ext, void *data)
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  544  {
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  545  	struct power_supply *psy;
ea32cea140f644a drivers/power/ab8500_btemp.c        Andy Shevchenko     2016-03-17 @546  	const char **supplicants = (const char **)ext->supplied_to;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  547  	struct ab8500_btemp *di;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  548  	union power_supply_propval ret;
ea32cea140f644a drivers/power/ab8500_btemp.c        Andy Shevchenko     2016-03-17  549  	int j;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  550  
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  551  	psy = (struct power_supply *)data;
297d716f6260cc9 drivers/power/ab8500_btemp.c        Krzysztof Kozlowski 2015-03-12  552  	di = power_supply_get_drvdata(psy);
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  553  
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  554  	/*
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  555  	 * For all psy where the name of your driver
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  556  	 * appears in any supplied_to
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  557  	 */
ea32cea140f644a drivers/power/ab8500_btemp.c        Andy Shevchenko     2016-03-17  558  	j = match_string(supplicants, ext->num_supplicants, psy->desc->name);
ea32cea140f644a drivers/power/ab8500_btemp.c        Andy Shevchenko     2016-03-17  559  	if (j < 0)
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  560  		return 0;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  561  
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  562  	/* Go through all properties for the psy */
297d716f6260cc9 drivers/power/ab8500_btemp.c        Krzysztof Kozlowski 2015-03-12  563  	for (j = 0; j < ext->desc->num_properties; j++) {
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  564  		enum power_supply_property prop;
297d716f6260cc9 drivers/power/ab8500_btemp.c        Krzysztof Kozlowski 2015-03-12  565  		prop = ext->desc->properties[j];
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  566  
15077fc1f784881 drivers/power/ab8500_btemp.c        Krzysztof Kozlowski 2015-03-12 @567  		if (power_supply_get_property(ext, prop, &ret))
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  568  			continue;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  569  
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  570  		switch (prop) {
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  571  		case POWER_SUPPLY_PROP_PRESENT:
297d716f6260cc9 drivers/power/ab8500_btemp.c        Krzysztof Kozlowski 2015-03-12  572  			switch (ext->desc->type) {
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  573  			case POWER_SUPPLY_TYPE_MAINS:
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  574  				/* AC disconnected */
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  575  				if (!ret.intval && di->events.ac_conn) {
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  576  					di->events.ac_conn = false;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  577  				}
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  578  				/* AC connected */
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  579  				else if (ret.intval && !di->events.ac_conn) {
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  580  					di->events.ac_conn = true;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  581  					if (!di->events.usb_conn)
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  582  						ab8500_btemp_periodic(di, true);
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  583  				}
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  584  				break;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  585  			case POWER_SUPPLY_TYPE_USB:
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  586  				/* USB disconnected */
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  587  				if (!ret.intval && di->events.usb_conn) {
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  588  					di->events.usb_conn = false;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  589  				}
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  590  				/* USB connected */
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  591  				else if (ret.intval && !di->events.usb_conn) {
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  592  					di->events.usb_conn = true;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  593  					if (!di->events.ac_conn)
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  594  						ab8500_btemp_periodic(di, true);
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  595  				}
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  596  				break;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  597  			default:
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  598  				break;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  599  			}
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  600  			break;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  601  		default:
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  602  			break;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  603  		}
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  604  	}
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  605  	return 0;
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  606  }
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  607  
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  608  /**
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  609   * ab8500_btemp_external_power_changed() - callback for power supply changes
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  610   * @psy:       pointer to the structure power_supply
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  611   *
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  612   * This function is pointing to the function pointer external_power_changed
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  613   * of the structure power_supply.
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  614   * This function gets executed when there is a change in the external power
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  615   * supply to the btemp.
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  616   */
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  617  static void ab8500_btemp_external_power_changed(struct power_supply *psy)
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  618  {
3fb873c78321abf drivers/power/supply/ab8500_btemp.c Thomas Weiﬂschuh    2024-12-08 @619  	power_supply_for_each_psy(psy, ab8500_btemp_get_ext_psy_data);
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  620  }
1f855824757efab drivers/power/ab8500_btemp.c        Arun Murthy         2012-02-29  621  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
