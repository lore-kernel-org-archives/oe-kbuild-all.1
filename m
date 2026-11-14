Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640134;
	b=3S401XfdOa4ly7qjpTsvr0Ir8uLF9WC3iph//emP8DODiVFjSjO2FY8gJfrR4ov6LYQ1
	 x7izi23TLe/6TIWfGSmqpWZ3KPaOL0qvtXXK+gnsdfWo3dCFnS1mr18o/uAZoa2ApIly+
	 0OhrSK+1vDsvbsPLwvspNOm5PuQb8ydUcqBwbmUzNW9KZaPOcyosq+5c7L5kbFIjwiv+U
	 QhWrricUBz9a8jp8eThaRsMj7VBXOTOtC30VgHVkhBtJdBSw3lfzYrSCfVuWtUOTMvW2E
	 oYm+z0douziXcX81IuN06JmN71ToNUOtGpF8rDKQTWOSjZHpSxpmwg24t5rdRlJXUPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640134;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CuAvqo4rgzCNpEcgLWv8+iQTo6i+av9Bteipq5E+qK8=;
	b=T3aYM0RFh+JfS/paSUviOJ3GZzCvmBX+YQ8WKMCAAFGd2LVqHY3BMMcu4x9VFmb++2pF
	 K9sb8P9cqi5Oohj/BNYFA9U2ZbFEekaMSPsLB5uR/gy6Mj700yZ9mFPR/oesQEWlRIiNv
	 DFfVcgQ+ZeJED/Z1RvzP+tJC60AaxLbybwEn5xjQoSp7j5GCxhHqwQqKZj6ovnSpTcMxh
	 EUXx/wNGy4kI7JAAhfp62k7dIbbTHHd1WJUU2lb12BE6VP8HQY2XkhAh8IDpHz3rY4lT2
	 EZ5m7xIR49lccNdKK0kqLYb7wIwmQhMYNoSzFxiCpBX223z6Rwq/ie2+97ZvwMHkSUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HQFzXhDh;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21D606A327
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 07:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE21D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HQFzXhDh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794640133; x=1826176133;
  h=date:from:to:cc:subject:message-id;
  bh=uptZck+Z0W7vLkUS3FWwRs4NypN79NcVaWqEttq6+es=;
  b=HQFzXhDhwCfL04QvhhKDv3krxRH8erwX1tHIsRhJNGPb2N0YcYyKQFaC
   kzUGcOfPe99JlqBdgMBLSQV0Wrq8PneHdu7w8Ry0OsVb2vFIM7AODvk+y
   CskVkf57x4veW+A5jtuRHmOlF5obJClraVm0SVG1pUAvVInes1uz0B/rS
   BVIvRPFjmFy9YRmzU2HHni/WtdFUlt0pCFbBN4KAMg7uaDXZdeebmL6Vp
   LQOka9a/1kOynYKHrhYaHsakbojgYg3ynxzaXduMlSX0BxxXQoYB5PCcC
   0DLRQ0E5QNNlGs6PhblsA5YGSo/gIE/sPOUXi0ojMSysj2KL4Tsgw8O91
   g==;
X-CSE-ConnectionGUID: GxA2I7nqRX+bR07nJMX/1w==
X-CSE-MsgGUID: iXdN29DPRQuBBRWUyQ1w/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3353014"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3353014"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 23:08:53 -0800
X-CSE-ConnectionGUID: XcmqwzsMQxuCVcJDHZU9eg==
X-CSE-MsgGUID: HQ1JiN6JTu6cGwK07G7iYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9444468"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 23:08:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS7sW-00000001536-1MRX;
	Sat, 14 Nov 2026 07:08:48 +0000
Date: Sat, 14 Nov 2026 15:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-lts 6/6]
 drivers/base/power/domain_governor.c:259: warning: Function parameter or
 member 'now' not described in '_default_power_down_ok'
Message-ID: <202611141445.oOrHlncb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-lts
head:   c73351b2e985e893999227194b401cb06613cd81
commit: 283e3271641ff0fd3067020f483db5b3857eca37 [6/6] FROMLIST: PM / Domains: use device's next wakeup to determine domain idle state
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261114/202611141445.oOrHlncb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141445.oOrHlncb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141445.oOrHlncb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain_governor.c:259: warning: Function parameter or member 'now' not described in '_default_power_down_ok'
   drivers/base/power/domain_governor.c:402: warning: cannot understand function prototype: 'struct dev_power_governor pm_domain_always_on_gov = '


vim +259 drivers/base/power/domain_governor.c

221e9b58380abd Rafael J. Wysocki   2011-12-01  251  
268cd2ed3d4413 Krzysztof Kozlowski 2017-06-28  252  /**
283e3271641ff0 Lina Iyer           2020-06-26  253   * _default_power_down_ok - Default generic PM domain power off governor routine.
268cd2ed3d4413 Krzysztof Kozlowski 2017-06-28  254   * @pd: PM domain to check.
268cd2ed3d4413 Krzysztof Kozlowski 2017-06-28  255   *
268cd2ed3d4413 Krzysztof Kozlowski 2017-06-28  256   * This routine must be executed under the PM domain's lock.
268cd2ed3d4413 Krzysztof Kozlowski 2017-06-28  257   */
283e3271641ff0 Lina Iyer           2020-06-26  258  static bool _default_power_down_ok(struct dev_pm_domain *pd, ktime_t now)
fc5cbf0c94b6f7 Axel Haslam         2016-02-15 @259  {
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  260  	struct generic_pm_domain *genpd = pd_to_genpd(pd);
283e3271641ff0 Lina Iyer           2020-06-26  261  	int state_idx = genpd->state_count - 1;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  262  	struct gpd_link *link;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  263  
283e3271641ff0 Lina Iyer           2020-06-26  264  	/*
283e3271641ff0 Lina Iyer           2020-06-26  265  	 * Find the next wakeup from devices that can determine their own wakeup
283e3271641ff0 Lina Iyer           2020-06-26  266  	 * to find when the domain would wakeup and do it for every device down
283e3271641ff0 Lina Iyer           2020-06-26  267  	 * the hierarchy. It is not worth while to sleep if the state's residency
283e3271641ff0 Lina Iyer           2020-06-26  268  	 * cannot be met.
283e3271641ff0 Lina Iyer           2020-06-26  269  	 */
283e3271641ff0 Lina Iyer           2020-06-26  270  	update_domain_next_wakeup(genpd, now);
283e3271641ff0 Lina Iyer           2020-06-26  271  	if (genpd->next_wakeup != KTIME_MAX) {
283e3271641ff0 Lina Iyer           2020-06-26  272  		/* Let's find out the deepest domain idle state, the devices prefer */
283e3271641ff0 Lina Iyer           2020-06-26  273  		while (state_idx >= 0) {
283e3271641ff0 Lina Iyer           2020-06-26  274  			if (next_wakeup_allows_state(genpd, state_idx, now)) {
283e3271641ff0 Lina Iyer           2020-06-26  275  				genpd->max_off_time_changed = true;
283e3271641ff0 Lina Iyer           2020-06-26  276  				break;
283e3271641ff0 Lina Iyer           2020-06-26  277  			}
283e3271641ff0 Lina Iyer           2020-06-26  278  			state_idx--;
283e3271641ff0 Lina Iyer           2020-06-26  279  		}
283e3271641ff0 Lina Iyer           2020-06-26  280  
283e3271641ff0 Lina Iyer           2020-06-26  281  		if (state_idx < 0) {
283e3271641ff0 Lina Iyer           2020-06-26  282  			state_idx = 0;
283e3271641ff0 Lina Iyer           2020-06-26  283  			genpd->cached_power_down_ok = false;
283e3271641ff0 Lina Iyer           2020-06-26  284  			goto done;
283e3271641ff0 Lina Iyer           2020-06-26  285  		}
283e3271641ff0 Lina Iyer           2020-06-26  286  	}
283e3271641ff0 Lina Iyer           2020-06-26  287  
e94999688e3aa3 Ulf Hansson         2019-04-11  288  	if (!genpd->max_off_time_changed) {
e94999688e3aa3 Ulf Hansson         2019-04-11  289  		genpd->state_idx = genpd->cached_power_down_state_idx;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  290  		return genpd->cached_power_down_ok;
e94999688e3aa3 Ulf Hansson         2019-04-11  291  	}
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  292  
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  293  	/*
8d87ae48ced2df Kees Cook           2020-07-08  294  	 * We have to invalidate the cached results for the parents, so
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  295  	 * use the observation that default_power_down_ok() is not
8d87ae48ced2df Kees Cook           2020-07-08  296  	 * going to be called for any parent until this instance
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  297  	 * returns.
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  298  	 */
8d87ae48ced2df Kees Cook           2020-07-08  299  	list_for_each_entry(link, &genpd->child_links, child_node)
8d87ae48ced2df Kees Cook           2020-07-08  300  		link->parent->max_off_time_changed = true;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  301  
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  302  	genpd->max_off_time_ns = -1;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  303  	genpd->max_off_time_changed = false;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  304  	genpd->cached_power_down_ok = true;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  305  
283e3271641ff0 Lina Iyer           2020-06-26  306  	/*
283e3271641ff0 Lina Iyer           2020-06-26  307  	 * Find a state to power down to, starting from the state
283e3271641ff0 Lina Iyer           2020-06-26  308  	 * determined by the next wakeup.
283e3271641ff0 Lina Iyer           2020-06-26  309  	 */
283e3271641ff0 Lina Iyer           2020-06-26  310  	while (!__default_power_down_ok(pd, state_idx)) {
283e3271641ff0 Lina Iyer           2020-06-26  311  		if (state_idx == 0) {
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  312  			genpd->cached_power_down_ok = false;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  313  			break;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  314  		}
283e3271641ff0 Lina Iyer           2020-06-26  315  		state_idx--;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  316  	}
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  317  
283e3271641ff0 Lina Iyer           2020-06-26  318  done:
283e3271641ff0 Lina Iyer           2020-06-26  319  	genpd->state_idx = state_idx;
e94999688e3aa3 Ulf Hansson         2019-04-11  320  	genpd->cached_power_down_state_idx = genpd->state_idx;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  321  	return genpd->cached_power_down_ok;
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  322  }
fc5cbf0c94b6f7 Axel Haslam         2016-02-15  323  

:::::: The code at line 259 was first introduced by commit
:::::: fc5cbf0c94b6f7fd62fdddff892207290510945d PM / Domains: Support for multiple states

:::::: TO: Axel Haslam <ahaslam+renesas@baylibre.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
