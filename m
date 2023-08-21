Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8065E23C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692629356; x=1724165356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bOAKnWDUnHysY75UBAXuwXwkQB8ucrM7TdGHStufYk8=;
  b=fUvnZJgacxxrbjbPREp0BbKHdmSIpCUUvyXXccrLS1EMVNO4Ru/zjVnR
   Jp0zrhalCKz3Rm74+tYdo5lIspA3+rIH1ofHzuWr/QujcKsGtd3MIjc5F
   +4BkK7lpb1DnqFr/KaOzzUhaX0HNqLZ1QjwDykRQYKktTyh4qGR+CPmfL
   6xXI5yYydlMSfrxNyrTmXhmTY6t202fGgOYmxo252mLZPuS78OcB1+0/0
   aKzSnRf4ZYFZMsO4+9jCDhVt/cFGXOVTwivqLDHOl/tcvYu5fQFLd7kT0
   bYBYdJTSsU4/NVTb7d2OY83BIQlzD1jM5Q1oNwpzdECOZybMfgQGp0Yvu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371038997"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="371038997"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 07:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="738915129"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="738915129"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2023 07:49:14 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY6Cc-0000bI-2C;
	Mon, 21 Aug 2023 14:48:38 +0000
Date: Mon, 21 Aug 2023 22:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 3/4]
 drivers/thermal/gov_power_allocator.c:66: warning: bad line:
                         are writable.
Message-ID: <202308212225.yVxKuVvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f0fefbe055362c9a8f29ddaadf584466477b8ea0
commit: a881d6f4e599f9daa852463165fa5bc25df63b6a [3/4] BACKPORT: FROMLIST: thermal/core/power_allocator: avoid thermal cdev can not be reset
config: x86_64-randconfig-071-20230821 (https://download.01.org/0day-ci/archive/20230821/202308212225.yVxKuVvg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212225.yVxKuVvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212225.yVxKuVvg-lkp@intel.com/

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
