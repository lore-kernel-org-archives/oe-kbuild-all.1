Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F0B1F4714
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737476424; cv=none; b=Ibj2c+hQ2YxTPSUv6MbMMCgLVpdTOeWszgkILPWtRvFFDeHxDe6AN6XbYYgrGpT7DjGLEeanW0bb8K6+exEFQ7pd2FWgbCar30PIggacqzH/yMPzow2trkF4JK4EtylMY+E4CKnzjXnkKJwB5xVsU3F0G+F8M8DKSn40ypW0g00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737476424; c=relaxed/simple;
	bh=e6GaFun8LgxgDqfsRGFXYOFbWAMAWygU6WXXz/m2AOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jyY+0e1rs+8zAjU+B64M9kNgvG4FeQQH9o/XyuWddCOSGYjxvTw67A8blLh4I9rvDhBxIopdPL8wJh3BZNkv0xomBEbeUdTejhGwHDny5oc7vug/65K78UXS6L1fBTqSzmDSjzngMb8qhMpMlNCtkufRxU9vL/L7HdF1h9TLxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbbGAWT9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbbGAWT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737476419; x=1769012419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6GaFun8LgxgDqfsRGFXYOFbWAMAWygU6WXXz/m2AOQ=;
  b=jbbGAWT9Jkt0MKLQM5USZa8AGCQyG8OWurMYa5wAgcVrfRkI9XWx4NpI
   5jLhbuHzNIBS8oscqZWRYuZJ7YznWP9yIzBz2SJBoYeDQ7VAPfNfIGI1t
   y4FeIXYCT4fTOTr4p2DNg9yBsmstNJGq6SnlahizaeKPk11duV6woTk1c
   3/Q20y11MPyYklZvCkvD+NY9DyXRhjeiW0leNVwuce3ND2SIcEfsk8ERl
   34Aytoy48ZwpiYq1lnMpsdYC4WWAb66NGGEMsbuRlj6I39AN7LULe+AAq
   zC7stJu0jDZKtjcQytJyMlzHQjqgCcu01Z6AkTjI6XKzjabYFlXCd1tKE
   w==;
X-CSE-ConnectionGUID: Qy1l5jW5SU+55QKZAamGlw==
X-CSE-MsgGUID: Nl5Rh9axTiCO9uTaoFOg7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37778690"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="37778690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 08:20:07 -0800
X-CSE-ConnectionGUID: wAtihhmERra14zkEcA9gzA==
X-CSE-MsgGUID: s/UWIml4SlK5q0Pln/r09A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="111850251"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2025 08:20:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taGyx-000YHY-3B;
	Tue, 21 Jan 2025 16:20:03 +0000
Date: Wed, 22 Jan 2025 00:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Amit Kucheria <amit.kucheria@linaro.org>
Subject: drivers/thermal/cpufreq_cooling.c:81: warning: Excess struct member
 'cdev' description in 'cpufreq_cooling_device'
Message-ID: <202501220046.h3PMBCti-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
commit: 23affa2e29c5faa8cb59778f71e3bce2c8b3aa5c thermal/drivers/cpu_cooling: Rename to cpufreq_cooling
date:   5 years ago
config: arm-randconfig-r006-20230802 (https://download.01.org/0day-ci/archive/20250122/202501220046.h3PMBCti-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220046.h3PMBCti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220046.h3PMBCti-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/cpufreq_cooling.c:81: warning: Excess struct member 'cdev' description in 'cpufreq_cooling_device'


vim +81 drivers/thermal/cpufreq_cooling.c

81ee14da1051ee drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  50  
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  51  /**
3b3c07485579b9 drivers/thermal/cpu_cooling.c Eduardo Valentin     2013-04-17  52   * struct cpufreq_cooling_device - data for cooling device with cpufreq
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  53   * @id: unique integer value corresponding to each cpufreq_cooling_device
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  54   *	registered.
d72b4015839cca drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  55   * @last_load: load measured by the latest call to cpufreq_get_requested_power()
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  56   * @cpufreq_state: integer value representing the current state of cpufreq
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  57   *	cooling	devices.
dcc6c7fdef9e70 drivers/thermal/cpu_cooling.c Viresh Kumar         2014-12-04  58   * @max_level: maximum cooling level. One less than total number of valid
dcc6c7fdef9e70 drivers/thermal/cpu_cooling.c Viresh Kumar         2014-12-04  59   *	cpufreq frequencies.
a4e893e802e6a8 drivers/thermal/cpu_cooling.c Quentin Perret       2019-10-30  60   * @em: Reference on the Energy Model of the device
d72b4015839cca drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  61   * @cdev: thermal_cooling_device pointer to keep track of the
d72b4015839cca drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  62   *	registered cooling device.
d72b4015839cca drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  63   * @policy: cpufreq policy.
fc4de356e033a4 drivers/thermal/cpu_cooling.c Javi Merino          2014-12-15  64   * @node: list_head to link all cpufreq_cooling_device together.
81ee14da1051ee drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  65   * @idle_time: idle time stats
7b4e7f07a2c6da drivers/thermal/cpu_cooling.c Amit Kucheria        2019-11-20  66   * @qos_req: PM QoS contraint to apply
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  67   *
beca6053fc21bb drivers/thermal/cpu_cooling.c Viresh Kumar         2014-12-04  68   * This structure is required for keeping information of each registered
beca6053fc21bb drivers/thermal/cpu_cooling.c Viresh Kumar         2014-12-04  69   * cpufreq_cooling_device.
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  70   */
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  71  struct cpufreq_cooling_device {
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  72  	int id;
d72b4015839cca drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  73  	u32 last_load;
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  74  	unsigned int cpufreq_state;
dcc6c7fdef9e70 drivers/thermal/cpu_cooling.c Viresh Kumar         2014-12-04  75  	unsigned int max_level;
a4e893e802e6a8 drivers/thermal/cpu_cooling.c Quentin Perret       2019-10-30  76  	struct em_perf_domain *em;
d72b4015839cca drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  77  	struct cpufreq_policy *policy;
2dcd851fe4b4fe drivers/thermal/cpu_cooling.c Yadwinder Singh Brar 2014-11-07  78  	struct list_head node;
81ee14da1051ee drivers/thermal/cpu_cooling.c Viresh Kumar         2017-04-25  79  	struct time_in_idle *idle_time;
3000ce3c52f8b8 drivers/thermal/cpu_cooling.c Rafael J. Wysocki    2019-10-16  80  	struct freq_qos_request qos_req;
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16 @81  };
023614183768a7 drivers/thermal/cpu_cooling.c Amit Daniel Kachhap  2012-08-16  82  

:::::: The code at line 81 was first introduced by commit
:::::: 023614183768a7ac62898bded5ec6c0c9fecbdd9 thermal: add generic cpufreq cooling implementation

:::::: TO: Amit Daniel Kachhap <amit.kachhap@linaro.org>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
