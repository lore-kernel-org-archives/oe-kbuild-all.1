Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C87142903
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 23:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733785659; cv=none; b=OalN9aIupgjSEXFdZtZIb7qygsw2mxwd0VciAPFGNweB/R4b3enUUMgcvipr9AMIi855Ay5QkYtOzToo1htujacnwsPYgamUnwKAiLrBhGfQzzIG7pXVBGH6Y5afPApLlOpjt+JXHSTB7POh2rlHcOqHwFbgk5LPURUwjay7GRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733785659; c=relaxed/simple;
	bh=YI8IStfm9/XL2pr/5dm6e0iuhG2TUvKIGeemD3T67Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C4AR1Fo6PPxd7S2r9G/gjzJfpO6VnkNZKzjK/cUuVDNYN2AQmIb9g56ggj3NAa7EQQSI+yhshhdJivHXwpDBs5fmhaffVj5HuebEf0ub20N6XJv6KOWe1QLUqW9iu10ChWBe5B74Tk674jiMHcf9Hx6I3ZsOyaW1VNuRM3uUsfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3MtEGcp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3MtEGcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733785657; x=1765321657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YI8IStfm9/XL2pr/5dm6e0iuhG2TUvKIGeemD3T67Ns=;
  b=P3MtEGcpHVJwuqTu57Vt3Daro5imDPJa6IzdYn5dgx2fC2xhVAq+KpRs
   hKUXTZNUqbeo8BkLW/A3V3SF2ez7uCihu1rKyNbe5qPkzYy60FKu5KkMR
   G3nGIeK/exEmoPm1Vb2rZgaDUdVfFYXA3BlWRPBSOg98wgyIWK0LRa9dJ
   +VO4FcGVEyzG7xkhgT7uY+quHpUZSUExpXxRGoT8DbTjD/r97xasbZWmo
   rxtop7kv4oWOolxED+z2corXfu+4Dpx3S/KxbYwIJjxNUtx/otomR2OAB
   Pu/t6C1yYZ06h5D6TAgeTu58wEN/zXp+AY9lOs4LgrnzSQzlMeNT51Yj4
   w==;
X-CSE-ConnectionGUID: PItKZgkJTmKRsZN34lg0xA==
X-CSE-MsgGUID: KhIxnRtOSsq7PTcwjxDneQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33842038"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="33842038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 15:07:37 -0800
X-CSE-ConnectionGUID: eNCDM9jhSoqzVSM1meUfgw==
X-CSE-MsgGUID: hZhAnYjrSoidX9bmOYMBHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="96011473"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Dec 2024 15:07:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKmqi-0004tl-31;
	Mon, 09 Dec 2024 23:07:32 +0000
Date: Tue, 10 Dec 2024 07:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2570/2570]
 drivers/net/dsa/mv88e6xxx/chip.c:2320:4: error: implicit declaration of
 function 'mv88e6xxx_g2_eeprom_wait'
Message-ID: <202412100719.EfO2Bdyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fabio,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fbaada49082c23aa4e4ed43386a1ad4a457a0354
commit: 02956abc74ede6549249eb21e5b319b92dd147f3 [2570/2570] net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
config: x86_64-randconfig-161-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100719.EfO2Bdyg-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100719.EfO2Bdyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100719.EfO2Bdyg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/dsa/mv88e6xxx/chip.c:15:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/dsa/mv88e6xxx/chip.c:32:
   In file included from include/net/dsa.h:22:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mv88e6xxx/chip.c:2320:4: error: implicit declaration of function 'mv88e6xxx_g2_eeprom_wait' [-Werror,-Wimplicit-function-declaration]
    2320 |                         mv88e6xxx_g2_eeprom_wait(chip);
         |                         ^
   drivers/net/dsa/mv88e6xxx/chip.c:2320:4: note: did you mean 'mv88e6xxx_g2_pvt_write'?
   drivers/net/dsa/mv88e6xxx/global2.h:457:19: note: 'mv88e6xxx_g2_pvt_write' declared here
     457 | static inline int mv88e6xxx_g2_pvt_write(struct mv88e6xxx_chip *chip,
         |                   ^
   3 warnings and 1 error generated.


vim +/mv88e6xxx_g2_eeprom_wait +2320 drivers/net/dsa/mv88e6xxx/chip.c

  2306	
  2307	static void mv88e6xxx_hardware_reset(struct mv88e6xxx_chip *chip)
  2308	{
  2309		struct gpio_desc *gpiod = chip->reset;
  2310	
  2311		/* If there is a GPIO connected to the reset pin, toggle it */
  2312		if (gpiod) {
  2313			/* If the switch has just been reset and not yet completed
  2314			 * loading EEPROM, the reset may interrupt the I2C transaction
  2315			 * mid-byte, causing the first EEPROM read after the reset
  2316			 * from the wrong location resulting in the switch booting
  2317			 * to wrong mode and inoperable.
  2318			 */
  2319			if (chip->info->ops->get_eeprom)
> 2320				mv88e6xxx_g2_eeprom_wait(chip);
  2321	
  2322			gpiod_set_value_cansleep(gpiod, 1);
  2323			usleep_range(10000, 20000);
  2324			gpiod_set_value_cansleep(gpiod, 0);
  2325			usleep_range(10000, 20000);
  2326	
  2327			if (chip->info->ops->get_eeprom)
  2328				mv88e6xxx_g2_eeprom_wait(chip);
  2329		}
  2330	}
  2331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
