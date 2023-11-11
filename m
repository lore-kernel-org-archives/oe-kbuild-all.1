Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AD363AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBDRPjB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699675604; x=1731211604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLbkW7U3NusAJccBj5JQlc5x5tb1svvTwaCmTyvbLrk=;
  b=TBDRPjB1LlKR13wsIyhFkDEQXkPHxL39mwAGcGHacSvG1wa9aAL22Axx
   fBu56mE282Kg2JUmFzBnUSZ2syXPzR7oxTjkX3S92/QEF9nsY2Lpuc46k
   Kge4OR6yz5MWgKXkh/dZPnZyMl+uv30d5C2LK3N+s2zii2CvD292zcm/n
   SlVqtVBb5Vco+LBypkgjXg10kIRHZGPk0m1U409GehhvTA6xqB9VXSkGL
   chzJ3qAkDLl5OtawUZG4QzN0Wbxpg65WHLNaIZDBNH0JXKMSDNpUujit/
   bU+5nfkLZ5HJ6X/+1SVcv/baX3jZ+PZx6t4sHKLERBlx4CSMAUwZxtH33
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="11806636"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="11806636"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 20:06:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767460205"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="767460205"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2023 20:06:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1fGa-000ACQ-2r;
	Sat, 11 Nov 2023 04:06:40 +0000
Date: Sat, 11 Nov 2023 12:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7 208/336]
 drivers/rtc/rtc-sc27xx.c:97:31: warning: left shift of negative value
Message-ID: <202311111141.hvHVyK2w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7
head:   a4b755e29c5eea2a696d7ec17a623dcb675a9897
commit: 11d4b1a0517e9ce64436fa4019bafaf2895ca282 [208/336] [SUBMITTED 20230811] extrawarn: don't turn off -Wshift-negative-value for gcc-9
config: i386-buildonly-randconfig-004-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111141.hvHVyK2w-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111141.hvHVyK2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111141.hvHVyK2w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-sc27xx.c: In function 'sprd_rtc_set_time':
>> drivers/rtc/rtc-sc27xx.c:97:31: warning: left shift of negative value [-Wshift-negative-value]
      97 |  (~SPRD_RTC_POWER_RESET_VALUE << SPRD_RTC_POWER_STS_SHIFT)
         |                               ^~
   drivers/rtc/rtc-sc27xx.c:373:8: note: in expansion of macro 'SPRD_RTC_POWER_STS_VALID'
     373 |        SPRD_RTC_POWER_STS_VALID);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~


vim +97 drivers/rtc/rtc-sc27xx.c

a0defd7cfc2804 Baolin Wang 2018-05-31  91  
a0defd7cfc2804 Baolin Wang 2018-05-31  92  /* power control/status definition */
a0defd7cfc2804 Baolin Wang 2018-05-31  93  #define SPRD_RTC_POWER_RESET_VALUE	0x96
a0defd7cfc2804 Baolin Wang 2018-05-31  94  #define SPRD_RTC_POWER_STS_CLEAR	GENMASK(7, 0)
a0defd7cfc2804 Baolin Wang 2018-05-31  95  #define SPRD_RTC_POWER_STS_SHIFT	8
a0defd7cfc2804 Baolin Wang 2018-05-31  96  #define SPRD_RTC_POWER_STS_VALID	\
a0defd7cfc2804 Baolin Wang 2018-05-31 @97  	(~SPRD_RTC_POWER_RESET_VALUE << SPRD_RTC_POWER_STS_SHIFT)
495bbde523969c Baolin Wang 2017-11-09  98  

:::::: The code at line 97 was first introduced by commit
:::::: a0defd7cfc2804796144545e00aaf74a486adbe7 rtc: sprd: Add new RTC power down check method

:::::: TO: Baolin Wang <baolin.wang@linaro.org>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
