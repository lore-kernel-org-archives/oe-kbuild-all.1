Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182901DDF5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 05:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709961737; cv=none; b=iGVvwlb1ISqZo/1YB6zpyTSCy9xRXDnMoXE2b/RcmlJsD6ZxoFBuDVQKf9nUkgOizSNmtfKTqq8oR9Fs8yFtsTt/wMdTKF4nQyGXyzrvM3FYUFg3Rs7eCD+uJI9B4Bufe79xtTU3Pniw6DvyyyqC4poaiwOZv3bAOVLCVlAz/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709961737; c=relaxed/simple;
	bh=AdZfqV31qQZEbil+o+EWtCJmGc9zhEWlEA05VoyLvxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijwvFJje6kLuBlvjDRZSz35URicUWnGIz71jRhvjCD02ct9cknwiZf6VjDF/o36EmGzBFpis5AG+eCETIm+ZDDbWX+6+hzs+2UDZJmFVWmehBMDYa0a5KuokK7O9I2JIPrJTYEo18IMJZYOoQ/p7N7AnsW7zjuakwJTu9NHEr8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgrQ6ZSr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgrQ6ZSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709961736; x=1741497736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AdZfqV31qQZEbil+o+EWtCJmGc9zhEWlEA05VoyLvxM=;
  b=jgrQ6ZSricypYbTTaxQI13rH5TxUcLr8C+EnArFifmrEsIUpCA5521/N
   uGxCJfRILIRY7IANr7866fIH+9GiCjO1A5qd7cPQtddqLxscdOeTPaOzo
   V/5QyyO8rttNNRz3kloOV2DD+Zbe+UInYJoqdEWeZhg83kjO6ofq2Fkit
   B2cRRoRTZAKh5oCX1mNiJG5aLsSbY2Gj65OimuGpDaUNMHaqOD6CjUK64
   Sc/4pAILRVVdXr1U6s3zwoZ4NTsoiSVJK3j3J2famfwQ4gfkhKfEPQPh1
   z8GIfOCZRUs6a/KALw0n6lN4cdSh9ZFDNjg1Ptmzos2KU+umvzkP4CbrL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="16124765"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="16124765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 21:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10577716"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2024 21:22:13 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rip9v-00070T-0s;
	Sat, 09 Mar 2024 05:22:11 +0000
Date: Sat, 9 Mar 2024 13:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/277 1/1] drivers/power/supply/macsmc_power.c:518:10:
 error: 'const struct power_supply_desc' has no member named
 'charge_behaviours'
Message-ID: <202403091352.p9tac8ZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/277
head:   aeba5500b9346eeb8a6aed58c087fdbd931c6532
commit: aeba5500b9346eeb8a6aed58c087fdbd931c6532 [1/1] power: supply: macsmc_power: Report available charge_behaviours
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240309/202403091352.p9tac8ZV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403091352.p9tac8ZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091352.p9tac8ZV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/power/supply/macsmc_power.c:518:10: error: 'const struct power_supply_desc' has no member named 'charge_behaviours'
     518 |         .charge_behaviours      = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
         |          ^~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6,
                    from arch/loongarch/include/asm/loongarch.h:8,
                    from arch/loongarch/include/asm/cpu-info.h:11,
                    from arch/loongarch/include/asm/cpu-features.h:13,
                    from arch/loongarch/include/asm/timex.h:13,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/power/supply/macsmc_power.c:8:
>> include/vdso/bits.h:7:33: warning: initialization of 'int (*)(struct power_supply *, enum power_supply_property,  union power_supply_propval *)' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/power/supply/macsmc_power.c:518:35: note: in expansion of macro 'BIT'
     518 |         .charge_behaviours      = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
         |                                   ^~~
   include/vdso/bits.h:7:33: note: (near initialization for 'macsmc_battery_desc.get_property')
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/power/supply/macsmc_power.c:518:35: note: in expansion of macro 'BIT'
     518 |         .charge_behaviours      = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
         |                                   ^~~
   include/vdso/bits.h:7:33: warning: initialized field overwritten [-Woverride-init]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/power/supply/macsmc_power.c:518:35: note: in expansion of macro 'BIT'
     518 |         .charge_behaviours      = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
         |                                   ^~~
   include/vdso/bits.h:7:33: note: (near initialization for 'macsmc_battery_desc.get_property')
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/power/supply/macsmc_power.c:518:35: note: in expansion of macro 'BIT'
     518 |         .charge_behaviours      = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
         |                                   ^~~
>> drivers/power/supply/macsmc_power.c:520:84: error: expected '}' before ';' token
     520 |                                 | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE);
         |                                                                                    ^
   drivers/power/supply/macsmc_power.c:510:61: note: to match this '{'
     510 | static const struct power_supply_desc macsmc_battery_desc = {
         |                                                             ^


vim +518 drivers/power/supply/macsmc_power.c

   509	
   510	static const struct power_supply_desc macsmc_battery_desc = {
   511		.name			= "macsmc-battery",
   512		.type			= POWER_SUPPLY_TYPE_BATTERY,
   513		.get_property		= macsmc_battery_get_property,
   514		.set_property		= macsmc_battery_set_property,
   515		.property_is_writeable	= macsmc_battery_property_is_writeable,
   516		.properties		= macsmc_battery_props,
   517		.num_properties		= ARRAY_SIZE(macsmc_battery_props),
 > 518		.charge_behaviours	= BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
   519					| BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE)
 > 520					| BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE);
   521	};
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
