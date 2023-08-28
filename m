Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6257ED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 05:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693201283; x=1724737283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MyY9Diz82jgUzRZbFdrFW7wMrmsC4P7WBAZs9OX/p0M=;
  b=bjWJgIKXm5YkAW4HdknGBNqVAuN05pGawfTqIyUSZ+9E8QWm7iGG5CX8
   1vAL4UeJcTTi1KYXS+kep5ORlkUdSk3zYvo5AE+7QfbprB3XXZNZpgWo8
   XSLtuIN8EDhw1wBNo0iSfqReCQBXwmsjU1iEquF8UCkUf/BLGmChHySxx
   KE/er2PfjgP/cJ9zRuM9DFpxqB4Bq8Ti9iHfMSpm/JOM7hSjsX5o7a/ri
   SYhaX/0WTs4QUi2/6npXvt8ijbmCgaHotUxC2wPrfNSH2A8/00AqgIeHW
   CN/3XaslCYJBgmq76DeMgcYyKk3/LFsWNO2Ph+NudQtyeUG5//6Nrbn5Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="373906097"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="373906097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 22:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="714993029"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="714993029"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Aug 2023 22:41:21 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaUzy-0007bf-2v;
	Mon, 28 Aug 2023 05:41:20 +0000
Date: Mon, 28 Aug 2023 13:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 3/4]
 drivers/thermal/gov_power_allocator.c:66: warning: bad line:
                         are writable.
Message-ID: <202308281325.eOENYaei-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   ae0fb8d614c267b5197bf7ac1dca4a6d85b52200
commit: a881d6f4e599f9daa852463165fa5bc25df63b6a [3/4] BACKPORT: FROMLIST: thermal/core/power_allocator: avoid thermal cdev can not be reset
config: i386-randconfig-003-20230828 (https://download.01.org/0day-ci/archive/20230828/202308281325.eOENYaei-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281325.eOENYaei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281325.eOENYaei-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/gov_power_allocator.c:66: warning: bad line:                         are writable.


vim +66 drivers/thermal/gov_power_allocator.c

    53	
    54	/**
    55	 * struct power_allocator_params - parameters for the power allocator governor
    56	 * @allocated_tzp:	whether we have allocated tzp for this thermal zone and
    57	 *			it needs to be freed on unbind
    58	 * @err_integral:	accumulated error in the PID controller.
    59	 * @prev_err:	error in the previous iteration of the PID controller.
    60	 *		Used to calculate the derivative term.
    61	 * @trip_switch_on:	first passive trip point of the thermal zone.  The
    62	 *			governor switches on when this trip point is crossed.
    63	 *			If the thermal zone only has one passive trip point,
    64	 *			@trip_switch_on should be INVALID_TRIP.
    65	 * @last_switch_on_temp:Record the last switch_on_temp only when trips
  > 66				are writable.
    67	 * @trip_max_desired_temperature:	last passive trip point of the thermal
    68	 *					zone.  The temperature we are
    69	 *					controlling for.
    70	 * @sustainable_power:	Sustainable power (heat) that this thermal zone can
    71	 *			dissipate
    72	 */
    73	struct power_allocator_params {
    74		bool allocated_tzp;
    75		s64 err_integral;
    76		s32 prev_err;
    77		int trip_switch_on;
    78	#ifdef CONFIG_THERMAL_WRITABLE_TRIPS
    79		int last_switch_on_temp;
    80	#endif
    81		int trip_max_desired_temperature;
    82		u32 sustainable_power;
    83	};
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
