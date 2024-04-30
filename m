Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD5128833
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714471297; cv=none; b=IfkgPWnbsEyTohQojRy4GKfjASGMcUMEqGqJf9d2CzlstlHjZuM29Ud6ClQO2Pk0zJzHyGTtHuRf6Pj3gNggAXn0uhjSzIioggcWwUGF846FBEyWanifYi2wXXTgENcQixzvZa32aiZdYU4fGWtErRJAN0nAeVcCF03vcxxQoSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714471297; c=relaxed/simple;
	bh=JZ5rLtyKWX/b1ns6HVsS6w82/9YJ5fCjlyWkXPHR0ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=spNknWjTn4Hoe5RS14NMpwe4l58W01r5t1+O48Nq7E676GLn3N3Zb7HYZjfN1uNRbO5cWo58f/a0g/GAiGaYVm4FqOMA/Rw9/1ywb+53mT+dS8xNnbS7QiQZNsSRWIF3l2XPLyNhEf4MGRI01EpAiW8+EcWXP/L1LvBdiBK4Ws0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/QU4ViJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/QU4ViJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714471295; x=1746007295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZ5rLtyKWX/b1ns6HVsS6w82/9YJ5fCjlyWkXPHR0ec=;
  b=B/QU4ViJ8OgBY99GDiWQTTgdQ2lwpM/K965wXI09XiObMxz2nYnH9UZC
   Y0Pwb/hp+S4BoLFTseq/ZSBAdyTmtDJcTCT87ORlICMqWUBQQkvk8bVKl
   sVvmNqW8C8BJPPXUeAyD95DWvgGzaIrpsLTL4wDfzGTd61SbKw6FHF5gO
   EG7yi5ZE96qZxmRJJM9EEsdXrpHYA5xKy8aGzsY2OVQT6UMNxoOAedFYV
   zuHGsKpdtLESp53v599GeFYRu5yWO8b8gUo2v5gwaOo3kKk5fvFsXpQlo
   v6xmMFIxkwsIDxjVtM+/8VYQ7UdZIfkSSQqsa9IJkPIlGAeumcTePyxtO
   w==;
X-CSE-ConnectionGUID: kB5iFF8pTP24ledtvNxzVg==
X-CSE-MsgGUID: qPniwWRMT9S1JmfeNuxi4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="21318466"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="21318466"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 03:01:34 -0700
X-CSE-ConnectionGUID: Dm3XwOHdTMycFVrW+xNR9A==
X-CSE-MsgGUID: WEiHntqsRI2XL9kzih/9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="31127128"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2024 03:01:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1kIk-00080t-37;
	Tue, 30 Apr 2024 10:01:30 +0000
Date: Tue, 30 Apr 2024 18:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 8736/9709] drivers/hwmon/pmbus/xdp710.c:20:11:
 sparse: sparse: symbol 'micro_ohm_rsense' was not declared. Should it be
 static?
Message-ID: <202404301738.J71xGyaR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d04466706db5e241ee026f17b5f920e50dee26b5
commit: edf18a3ef6df1ad1be19143d0ee7d7324eb7b74e [8736/9709] hwmon: (pmbus) Add support for Infineon XDP710
config: arc-randconfig-r121-20240430 (https://download.01.org/0day-ci/archive/20240430/202404301738.J71xGyaR-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240430/202404301738.J71xGyaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301738.J71xGyaR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/xdp710.c:20:11: sparse: sparse: symbol 'micro_ohm_rsense' was not declared. Should it be static?

vim +/micro_ohm_rsense +20 drivers/hwmon/pmbus/xdp710.c

    15	
    16	/*
    17	 * The table to map configuration register values
    18	 * to sense resistor values
    19	 */
  > 20	const int micro_ohm_rsense[] = {
    21		200, 250, 300, 330, 400, 470, 500, 600,
    22		670, 700, 750, 800, 900, 1000, 1100, 1200,
    23		1250, 1300, 1400, 1500, 1600, 1700, 1800, 1900,
    24		2000, 2100, 2200, 2300, 2400, 2500, 2600, 2700,
    25		2800, 3000, 3100, 3200, 3300, 3400, 3500, 3600,
    26		3700, 3800, 3900, 4000, 4100, 4200, 4300, 4400,
    27		4500, 4600, 4700, 4800, 4900, 5000, 5500, 6000,
    28		6500, 7000, 7500, 8000, 8500, 9000, 9500, 10000
    29	};
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
