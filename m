Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F8C15B7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4BRUsLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585171; x=1733121171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZtjSneKdCTK/eqAdrA8g8emwm6AeO/SpUOtNppz5EY=;
  b=N4BRUsLxNwhHWAqyY9O7gBcToT0V3pU5Qm8oA1+PeZRCFFk0KyvXzTI7
   3c7ARbgPIpW+YhYUeNbJMRUDmn4PMBtYk9wWzQO800HqnD+M1SJmYOX9i
   z8eM+GfseIVwlhIh+5rU25QfKfToZx7Q3Gs1nR3xsY+TebYhdIJlRIiwU
   tq0mZYuI3gf6WwvnPYddGjmd/TFNyNd893hQ/FQG5A7x/dBxoSLvgvImg
   V0RY/LaoLp6RsBMkk+X4lVOyDhkzbgyYK7Zjk4tAU+HtYsOnhFCePYu1u
   0GFTN8pS9EbOAEl91NIyxqZFy2M9tYjeyQValkvLwRiDCoB1oaA0Q90si
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906503"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906503"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191155"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191155"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006LS-1K;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/acpi/sleep.c:1208: warning: Function parameter or member
 'stage' not described in 'acpi_hibernation_begin_old'
Message-ID: <202312031347.MCbdZh7n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rafael,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: bb1869012d7b78d1474808cb4c8bd8b272645876 ACPI: PM: Call pm_set_suspend_via_firmware() during hibernation
date:   4 years, 6 months ago
config: x86_64-randconfig-r015-20230805 (https://download.01.org/0day-ci/archive/20231203/202312031347.MCbdZh7n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312031347.MCbdZh7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312031347.MCbdZh7n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/sleep.c:424: warning: expecting prototype for acpi_pre_suspend(). Prototype was for acpi_pm_pre_suspend() instead
   drivers/acpi/sleep.c:516: warning: Function parameter or member 'acpi_state' not described in 'acpi_pm_start'
   drivers/acpi/sleep.c:555: warning: Function parameter or member 'pm_state' not described in 'acpi_suspend_begin'
   drivers/acpi/sleep.c:682: warning: Function parameter or member 'pm_state' not described in 'acpi_suspend_begin_old'
>> drivers/acpi/sleep.c:1208: warning: Function parameter or member 'stage' not described in 'acpi_hibernation_begin_old'


vim +1208 drivers/acpi/sleep.c

caea99ef339af8 drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-01-08  1200  
d8f3de0d2412bb drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-06-12  1201  /**
d8f3de0d2412bb drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-06-12  1202   *	acpi_hibernation_begin_old - Set the target system sleep state to
d8f3de0d2412bb drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-06-12  1203   *		ACPI_STATE_S4 and execute the _PTS control method.  This
d8f3de0d2412bb drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-06-12  1204   *		function is used if the pre-ACPI 2.0 suspend ordering has been
d8f3de0d2412bb drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-06-12  1205   *		requested.
d8f3de0d2412bb drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-06-12  1206   */
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1207  static int acpi_hibernation_begin_old(pm_message_t stage)
a634cc10164d1c drivers/acpi/sleep/main.c Rafael J. Wysocki 2007-07-19 @1208  {
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1209  	int error;
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1210  	/*
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1211  	 * The _TTS object should always be evaluated before the _PTS object.
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1212  	 * When the old_suspended_ordering is true, the _PTS object is
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1213  	 * evaluated in the acpi_sleep_prepare.
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1214  	 */
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1215  	acpi_sleep_tts_switch(ACPI_STATE_S4);
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1216  
e49f711cc8f3bf drivers/acpi/sleep/main.c Zhao Yakui        2008-08-12  1217  	error = acpi_sleep_prepare(ACPI_STATE_S4);
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1218  	if (error)
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1219  		return error;
a634cc10164d1c drivers/acpi/sleep/main.c Rafael J. Wysocki 2007-07-19  1220  
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1221  	if (!nvs_nosave) {
dd4c4f17d722ff drivers/acpi/sleep.c      Matthew Garrett   2010-05-28  1222  		error = suspend_nvs_alloc();
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1223  		if (error)
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1224  			return error;
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1225  	}
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1226  
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1227  	if (stage.event == PM_EVENT_HIBERNATE)
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1228  		pm_set_suspend_via_firmware();
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1229  
d8f3de0d2412bb drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-06-12  1230  	acpi_target_sleep_state = ACPI_STATE_S4;
ad07277e82deda drivers/acpi/sleep.c      Rafael J. Wysocki 2013-08-20  1231  	acpi_scan_lock_acquire();
bb1869012d7b78 drivers/acpi/sleep.c      Rafael J. Wysocki 2019-05-16  1232  	return 0;
3f4b0ef7f2899c drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-10-26  1233  }
3f4b0ef7f2899c drivers/acpi/sleep/main.c Rafael J. Wysocki 2008-10-26  1234  

:::::: The code at line 1208 was first introduced by commit
:::::: a634cc10164d1c229fbeca33923e6a0ed939e894 swsusp: introduce restore platform operations

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
