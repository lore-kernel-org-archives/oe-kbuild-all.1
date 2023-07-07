Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485623C7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 19:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688758872; x=1720294872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCcplMsi/8rRpcVmj6FSLI7d7Ka19d5vqdyybxKiClo=;
  b=P3h1gntvLQ6W6EDcLlh96jSbj6UK8OWxTK/oRB9o1AJ/uBIZM0Ooh6Ez
   4Td+/SE3dPR4zPzeVyu4mzkdb0Ax69tkMNK3aY+KD2M+rusRa1v1GmWnH
   N/kRbkpE4hq/ODG1LVogdR1RHZFWa9XGzKoHfvlmzaqkJ5dfZD32mBj1z
   qukl21pYTxL3b3raq+rWwD7MoE9kEfm6ZEhmp55TCgcuL0C57vcf3HXK0
   Q3FLdRI73VaUDHyUNmTTmqiZpd4HrJazzVGhV+i9sliBZtL9y2QNuifzg
   uLXsIQWHvoUc4sAPMynDkjFFOswze+gJT9nY6g1R+dTS/uiCWSWa3Y5SH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="344297025"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="344297025"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="790085275"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="790085275"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2023 12:41:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHrKG-0002Ek-0N;
	Fri, 07 Jul 2023 19:41:08 +0000
Date: Sat, 8 Jul 2023 03:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: arch/sh/boards/mach-hp6xx/hp6xx_apm.c:32:22: warning: variable
 'backup' set but not used
Message-ID: <202307080311.ZgsVj2PR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4f6b6c2b2f86b7878a770736bf478d8a263ff0bc
commit: 706afcea16cd83fecb7c2229ccc31bb237ffdbef sh: Fix -Wmissing-include-dirs warnings for various platforms
date:   2 days ago
config: sh-hp6xx_defconfig (https://download.01.org/0day-ci/archive/20230708/202307080311.ZgsVj2PR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080311.ZgsVj2PR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080311.ZgsVj2PR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/boards/mach-hp6xx/hp6xx_apm.c: In function 'hp6x0_apm_get_power_status':
>> arch/sh/boards/mach-hp6xx/hp6xx_apm.c:32:22: warning: variable 'backup' set but not used [-Wunused-but-set-variable]
      32 |         int battery, backup, charging, percentage;
         |                      ^~~~~~


vim +/backup +32 arch/sh/boards/mach-hp6xx/hp6xx_apm.c

dd4f99b42dcce8 arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2008-03-06  29  
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  30  static void hp6x0_apm_get_power_status(struct apm_power_info *info)
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  31  {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24 @32  	int battery, backup, charging, percentage;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  33  	u8 pgdr;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  34  
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  35  	battery		= adc_single(ADC_CHANNEL_BATTERY);
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  36  	backup		= adc_single(ADC_CHANNEL_BACKUP);
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  37  	charging	= adc_single(ADC_CHANNEL_CHARGE);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  38  
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  39  	percentage = 100 * (battery - HP680_BATTERY_MIN) /
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  40  			   (HP680_BATTERY_MAX - HP680_BATTERY_MIN);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  41  
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  42  	/* % of full battery */
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  43  	info->battery_life = percentage;
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  44  
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  45  	/* We want our estimates in minutes */
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  46  	info->units = 0;
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  47  
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  48  	/* Extremely(!!) rough estimate, we will replace this with a datalist later on */
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  49  	info->time = (2 * battery);
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  50  
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  51  	info->ac_line_status = (battery > HP680_BATTERY_AC_ON) ?
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  52  			 APM_AC_ONLINE : APM_AC_OFFLINE;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  53  
9d56dd3b083a3b arch/sh/boards/mach-hp6xx/hp6xx_apm.c Paul Mundt         2010-01-26  54  	pgdr = __raw_readb(PGDR);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  55  	if (pgdr & PGDR_MAIN_BATTERY_OUT) {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  56  		info->battery_status	= APM_BATTERY_STATUS_NOT_PRESENT;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  57  		info->battery_flag	= 0x80;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  58  	} else if (charging < 8) {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  59  		info->battery_status	= APM_BATTERY_STATUS_CHARGING;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  60  		info->battery_flag	= 0x08;
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04  61  		info->ac_line_status	= 0x01;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  62  	} else if (percentage <= APM_CRITICAL) {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  63  		info->battery_status	= APM_BATTERY_STATUS_CRITICAL;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  64  		info->battery_flag	= 0x04;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  65  	} else if (percentage <= APM_LOW) {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  66  		info->battery_status	= APM_BATTERY_STATUS_LOW;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  67  		info->battery_flag	= 0x02;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  68  	} else {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  69  		info->battery_status	= APM_BATTERY_STATUS_HIGH;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24  70  		info->battery_flag	= 0x01;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  71  	}
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  72  }
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  73  

:::::: The code at line 32 was first introduced by commit
:::::: 0a9b0db19262dbb09f3a34195e68cafd5dc3fa10 [APM] SH: Convert to use shared APM emulation.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
