Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037812E7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732330920; cv=none; b=N9+A2GMr3QzZ5Fwsl3UlJTybOhrn9Nma0CIHlWvmdLvGaqMrSRu3b3a5ecRxw9faH0UMZ6TS3jAlFBoyz286zjCjJblmb5eZq/UeqcSsHsqlw8kTlHZShKsVH85GUZvkmdtArDUo264N22q4L4x8XYuhYr1s9M9+Q7+XxnwBgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732330920; c=relaxed/simple;
	bh=o0F9vTP/PcL+rVQ5jaoHk998j2/9LfgdjH6VbZDDOKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KEkMLOQNlQ5IRsHLSCgUZ6KHYahmjVYS36CVU/VcB3+5LmbzV/EZn7Dj5pjl0fD21fFj2mppfGg+nrJmBRJC9ghLJ/vy0NIgEhvF8jpbJHqlcjo7OHmHl917FGTUe7AqTCKc+5MOQ96iC2nJrHbSoaQmaV83SMK9V+GfHS9th8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXOQiD7m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXOQiD7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732330917; x=1763866917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o0F9vTP/PcL+rVQ5jaoHk998j2/9LfgdjH6VbZDDOKQ=;
  b=eXOQiD7mCrLX7AHf5nE86SSt59sWZqtQQnQbwc7oS49mJYaCumTU6R1B
   NvKyZ54HhCOeqjpsbDZ+SX8gR2MI44gU8bRa6AQm6eck0wCz+w7NHm78Y
   GItA4AXKDU4cTmGz+2CAUVnxqX8lrVUzusM1YrBsbc8NZR6xNedfpUG5v
   f3YiANJIZrWY02+MFo/sIeINnT7t107L/mad1htalOvx6jn5U29DcZEUb
   sJVU71mvwmMITjXtZJ5Tjjv0jlymWB1KZ2MrOxq/ngc3JzGvC4hyUhzPi
   6jRgA24LUlYMyX6X2n2x1cBHwuDF4Jqdrtqj/QPklwxpPUiYryX/J4/5I
   g==;
X-CSE-ConnectionGUID: Eg+woZT7T4u/jziC0NI0ig==
X-CSE-MsgGUID: IpuvQsH6T0iBtCPtP9obRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36159326"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="36159326"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 19:01:57 -0800
X-CSE-ConnectionGUID: MuYVN4QOSSyDraRcAIHzyA==
X-CSE-MsgGUID: zIAs4Fk3QdCrEx7a/oasQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90380872"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Nov 2024 19:01:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEgPB-0004N9-2v;
	Sat, 23 Nov 2024 03:01:53 +0000
Date: Sat, 23 Nov 2024 11:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 13/26] drivers/pmdomain/core.c:850:
 warning: Function parameter or struct member 'one_dev_probing' not described
 in 'genpd_power_off'
Message-ID: <202411231004.GZclYJqN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   a0ecc3ac56bd0ef35d7835eeaa9fc5c0541edc5f
commit: 9ef67b15606eccc091054c129c064983aeb5770b [13/26] PM: domains: Add a flag to defer power-off until all consumers probe
config: i386-buildonly-randconfig-003-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231004.GZclYJqN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231004.GZclYJqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231004.GZclYJqN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:850: warning: Function parameter or struct member 'one_dev_probing' not described in 'genpd_power_off'


vim +850 drivers/pmdomain/core.c

9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  835  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  836  /**
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  837   * genpd_power_off - Remove power from a given PM domain.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  838   * @genpd: PM domain to power down.
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  839   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  840   * RPM status of the releated device is in an intermediate state, not yet turned
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  841   * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  842   * be RPM_SUSPENDED, while it tries to power off the PM domain.
763663c9715f5f drivers/base/power/domain.c Yang Yingliang  2021-05-12  843   * @depth: nesting count for lockdep.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  844   *
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  845   * If all of the @genpd's devices have been suspended and all of its subdomains
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  846   * have been powered down, remove power from @genpd.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  847   */
2da835452a0875 drivers/base/power/domain.c Ulf Hansson     2017-02-17  848  static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  849  			   bool one_dev_probing, unsigned int depth)
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17 @850  {
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  851  	struct pm_domain_data *pdd;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  852  	struct gpd_link *link;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  853  	unsigned int not_suspended = 0;
f63816e43d9044 drivers/base/power/domain.c Ulf Hansson     2020-09-24  854  	int ret;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  855  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  856  	/*
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  857  	 * Do not try to power off the domain in the following situations:
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  858  	 * (1) The domain is already in the "power off" state.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  859  	 * (2) System suspend is in progress.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  860  	 */
41e2c8e0060db2 drivers/base/power/domain.c Ulf Hansson     2017-03-20  861  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  862  		return 0;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  863  
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  864  	/*
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  865  	 * Abort power off for the PM domain in the following situations:
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  866  	 * (1) The domain is configured as always on.
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  867  	 * (2) When the domain has a subdomain being powered on.
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  868  	 */
ed61e18a4b4e44 drivers/base/power/domain.c Leonard Crestez 2019-04-30  869  	if (genpd_is_always_on(genpd) ||
ed61e18a4b4e44 drivers/base/power/domain.c Leonard Crestez 2019-04-30  870  			genpd_is_rpm_always_on(genpd) ||
ed61e18a4b4e44 drivers/base/power/domain.c Leonard Crestez 2019-04-30  871  			atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  872  		return -EBUSY;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  873  
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  874  	/*
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  875  	 * The children must be in their deepest (powered-off) states to allow
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  876  	 * the parent to be powered off. Note that, there's no need for
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  877  	 * additional locking, as powering on a child, requires the parent's
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  878  	 * lock to be acquired first.
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  879  	 */
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  880  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  881  		struct generic_pm_domain *child = link->child;
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  882  		if (child->state_idx < child->state_count - 1)
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  883  			return -EBUSY;
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  884  	}
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  885  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  886  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  887  		/*
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  888  		 * Do not allow PM domain to be powered off, when an IRQ safe
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  889  		 * device is part of a non-IRQ safe domain.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  890  		 */
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  891  		if (!pm_runtime_suspended(pdd->dev) ||
7a02444b8fc25a drivers/base/power/domain.c Ulf Hansson     2022-05-11  892  			irq_safe_dev_in_sleep_domain(pdd->dev, genpd))
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  893  			not_suspended++;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  894  	}
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  895  
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  896  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  897  		return -EBUSY;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  898  
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  899  	/*
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  900  	 * Do not allow PM domain to be powered off if it is marked
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  901  	 * as GENPD_FLAG_DEFER_OFF and there are consumer devices
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  902  	 * which have not probed yet.
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  903  	 */
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  904  	if (genpd_must_defer(genpd, one_dev_probing))
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  905  		return -EBUSY;
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  906  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  907  	if (genpd->gov && genpd->gov->power_down_ok) {
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  908  		if (!genpd->gov->power_down_ok(&genpd->domain))
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  909  			return -EAGAIN;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  910  	}
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  911  
2c9b7f8772033c drivers/base/power/domain.c Ulf Hansson     2018-10-03  912  	/* Default to shallowest state. */
2c9b7f8772033c drivers/base/power/domain.c Ulf Hansson     2018-10-03  913  	if (!genpd->gov)
2c9b7f8772033c drivers/base/power/domain.c Ulf Hansson     2018-10-03  914  		genpd->state_idx = 0;
2c9b7f8772033c drivers/base/power/domain.c Ulf Hansson     2018-10-03  915  
f63816e43d9044 drivers/base/power/domain.c Ulf Hansson     2020-09-24  916  	/* Don't power off, if a child domain is waiting to power on. */
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  917  	if (atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  918  		return -EBUSY;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  919  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  920  	ret = _genpd_power_off(genpd, true);
c6a113b52302ad drivers/base/power/domain.c Lina Iyer       2020-10-15  921  	if (ret) {
c6a113b52302ad drivers/base/power/domain.c Lina Iyer       2020-10-15  922  		genpd->states[genpd->state_idx].rejected++;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  923  		return ret;
c6a113b52302ad drivers/base/power/domain.c Lina Iyer       2020-10-15  924  	}
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  925  
49f618e1b669ef drivers/base/power/domain.c Ulf Hansson     2020-09-24  926  	genpd->status = GENPD_STATE_OFF;
afece3ab9a3640 drivers/base/power/domain.c Thara Gopinath  2017-07-14  927  	genpd_update_accounting(genpd);
c6a113b52302ad drivers/base/power/domain.c Lina Iyer       2020-10-15  928  	genpd->states[genpd->state_idx].usage++;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  929  
8d87ae48ced2df drivers/base/power/domain.c Kees Cook       2020-07-08  930  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df drivers/base/power/domain.c Kees Cook       2020-07-08  931  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df drivers/base/power/domain.c Kees Cook       2020-07-08  932  		genpd_lock_nested(link->parent, depth + 1);
9ef67b15606ecc drivers/pmdomain/core.c     Hector Martin   2023-04-24  933  		genpd_power_off(link->parent, false, false, depth + 1);
8d87ae48ced2df drivers/base/power/domain.c Kees Cook       2020-07-08  934  		genpd_unlock(link->parent);
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  935  	}
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  936  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  937  	return 0;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  938  }
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  939  

:::::: The code at line 850 was first introduced by commit
:::::: 1f8728b7adc4c2b351cda886a6916087595c9125 PM / Domains: Move genpd_power_off() above genpd_power_on()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
