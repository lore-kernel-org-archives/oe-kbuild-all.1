Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45A3C0B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 22:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674945900; x=1706481900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXSObq0ywNgkfsIP3EXcTV2QG0Czw0QAa+mdG7r5X30=;
  b=TjGLs4F5zLhkT+Sb9WIrDCdSNb9x/frzMtE4bRKhW4j+/K0VWWPwrnBB
   XnWtst5rTMnA9hkVzNKHhXyzjyGQ0I/+yrtdaZNQCOFghorSw6oKVBipP
   9z5FlZEQ/CmRTMJJdm25tiNqW/LmO/NEk6vbhpIsswZuj9mpW/2Sz71Bv
   Ht6UqyTCpGryym0fbfEOJF05StpDt2sdClqc/5c/ImqCMWgWoWBTQ+j7S
   R1tUuUuGEt5kTP3SXVj/FoBKafrX6ts6cTskXluiqUqxUqxpZ8h+0SwEw
   1ClvHZPvpmE+1HUgoH2E/q9DZ+8SwE9xcCtyfa1ZtpAYTHMnyj03WA1jQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="310965397"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="310965397"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 14:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="694107769"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="694107769"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Jan 2023 14:44:57 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLtwO-0001Bs-1y;
	Sat, 28 Jan 2023 22:44:56 +0000
Date: Sun, 29 Jan 2023 06:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [sunxi:sunxi/drivers-for-6.3 3/3]
 drivers/base/power/domain.c:631:20: error: 'pm_wq' undeclared
Message-ID: <202301290616.vJKgeSm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Samuel,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/drivers-for-6.3
head:   0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d
commit: 0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d [3/3] soc: sunxi: Add Allwinner D1 PPU driver
config: xtensa-randconfig-r003-20230129 (https://download.01.org/0day-ci/archive/20230129/202301290616.vJKgeSm4-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?id=0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d
        git remote add sunxi https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git
        git fetch --no-tags sunxi sunxi/drivers-for-6.3
        git checkout 0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/base/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/base/power/domain.c: In function 'genpd_queue_power_off_work':
>> drivers/base/power/domain.c:631:20: error: 'pm_wq' undeclared (first use in this function)
     631 |         queue_work(pm_wq, &genpd->power_off_work);
         |                    ^~~~~
   drivers/base/power/domain.c:631:20: note: each undeclared identifier is reported only once for each function it appears in
   drivers/base/power/domain.c: In function 'genpd_dev_pm_qos_notifier':
>> drivers/base/power/domain.c:830:39: error: 'struct dev_pm_info' has no member named 'ignore_children'
     830 |                 if (!dev || dev->power.ignore_children)
         |                                       ^
   drivers/base/power/domain.c: In function 'rtpm_status_str':
>> drivers/base/power/domain.c:3067:23: error: 'struct dev_pm_info' has no member named 'runtime_error'
    3067 |         if (dev->power.runtime_error)
         |                       ^
>> drivers/base/power/domain.c:3069:28: error: 'struct dev_pm_info' has no member named 'disable_depth'
    3069 |         else if (dev->power.disable_depth)
         |                            ^
>> drivers/base/power/domain.c:3071:28: error: 'struct dev_pm_info' has no member named 'runtime_status'
    3071 |         else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
         |                            ^
   drivers/base/power/domain.c:3072:45: error: 'struct dev_pm_info' has no member named 'runtime_status'
    3072 |                 p = status_lookup[dev->power.runtime_status];
         |                                             ^
--
   drivers/base/power/domain_governor.c: In function 'default_suspend_ok':
>> drivers/base/power/domain_governor.c:85:24: error: 'struct dev_pm_info' has no member named 'ignore_children'
      85 |         if (!dev->power.ignore_children)
         |                        ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
   Depends on [n]: PM [=n]
   Selected by [y]:
   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])


vim +/pm_wq +631 drivers/base/power/domain.c

c8f0ea45169c57 Geert Uytterhoeven 2014-11-10  621  
29e47e2173349e Ulf Hansson        2015-09-02  622  /**
86e12eac1f7f84 Ulf Hansson        2016-12-08  623   * genpd_queue_power_off_work - Queue up the execution of genpd_power_off().
a3d09c73492e57 Moritz Fischer     2016-01-27  624   * @genpd: PM domain to power off.
29e47e2173349e Ulf Hansson        2015-09-02  625   *
86e12eac1f7f84 Ulf Hansson        2016-12-08  626   * Queue up the execution of genpd_power_off() unless it's already been done
29e47e2173349e Ulf Hansson        2015-09-02  627   * before.
29e47e2173349e Ulf Hansson        2015-09-02  628   */
29e47e2173349e Ulf Hansson        2015-09-02  629  static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
29e47e2173349e Ulf Hansson        2015-09-02  630  {
29e47e2173349e Ulf Hansson        2015-09-02 @631  	queue_work(pm_wq, &genpd->power_off_work);
29e47e2173349e Ulf Hansson        2015-09-02  632  }
29e47e2173349e Ulf Hansson        2015-09-02  633  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  634  /**
1f8728b7adc4c2 Ulf Hansson        2017-02-17  635   * genpd_power_off - Remove power from a given PM domain.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  636   * @genpd: PM domain to power down.
3c64649d1cf9f3 Ulf Hansson        2017-02-17  637   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
3c64649d1cf9f3 Ulf Hansson        2017-02-17  638   * RPM status of the releated device is in an intermediate state, not yet turned
3c64649d1cf9f3 Ulf Hansson        2017-02-17  639   * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
3c64649d1cf9f3 Ulf Hansson        2017-02-17  640   * be RPM_SUSPENDED, while it tries to power off the PM domain.
763663c9715f5f Yang Yingliang     2021-05-12  641   * @depth: nesting count for lockdep.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  642   *
1f8728b7adc4c2 Ulf Hansson        2017-02-17  643   * If all of the @genpd's devices have been suspended and all of its subdomains
1f8728b7adc4c2 Ulf Hansson        2017-02-17  644   * have been powered down, remove power from @genpd.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  645   */
2da835452a0875 Ulf Hansson        2017-02-17  646  static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
2da835452a0875 Ulf Hansson        2017-02-17  647  			   unsigned int depth)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  648  {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  649  	struct pm_domain_data *pdd;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  650  	struct gpd_link *link;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  651  	unsigned int not_suspended = 0;
f63816e43d9044 Ulf Hansson        2020-09-24  652  	int ret;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  653  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  654  	/*
1f8728b7adc4c2 Ulf Hansson        2017-02-17  655  	 * Do not try to power off the domain in the following situations:
1f8728b7adc4c2 Ulf Hansson        2017-02-17  656  	 * (1) The domain is already in the "power off" state.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  657  	 * (2) System suspend is in progress.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  658  	 */
41e2c8e0060db2 Ulf Hansson        2017-03-20  659  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  660  		return 0;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  661  
ffaa42e8a40b7f Ulf Hansson        2017-03-20  662  	/*
ffaa42e8a40b7f Ulf Hansson        2017-03-20  663  	 * Abort power off for the PM domain in the following situations:
ffaa42e8a40b7f Ulf Hansson        2017-03-20  664  	 * (1) The domain is configured as always on.
ffaa42e8a40b7f Ulf Hansson        2017-03-20  665  	 * (2) When the domain has a subdomain being powered on.
ffaa42e8a40b7f Ulf Hansson        2017-03-20  666  	 */
ed61e18a4b4e44 Leonard Crestez    2019-04-30  667  	if (genpd_is_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez    2019-04-30  668  			genpd_is_rpm_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez    2019-04-30  669  			atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  670  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  671  
e7d90cfac5510f Ulf Hansson        2022-02-17  672  	/*
e7d90cfac5510f Ulf Hansson        2022-02-17  673  	 * The children must be in their deepest (powered-off) states to allow
e7d90cfac5510f Ulf Hansson        2022-02-17  674  	 * the parent to be powered off. Note that, there's no need for
e7d90cfac5510f Ulf Hansson        2022-02-17  675  	 * additional locking, as powering on a child, requires the parent's
e7d90cfac5510f Ulf Hansson        2022-02-17  676  	 * lock to be acquired first.
e7d90cfac5510f Ulf Hansson        2022-02-17  677  	 */
e7d90cfac5510f Ulf Hansson        2022-02-17  678  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
e7d90cfac5510f Ulf Hansson        2022-02-17  679  		struct generic_pm_domain *child = link->child;
e7d90cfac5510f Ulf Hansson        2022-02-17  680  		if (child->state_idx < child->state_count - 1)
e7d90cfac5510f Ulf Hansson        2022-02-17  681  			return -EBUSY;
e7d90cfac5510f Ulf Hansson        2022-02-17  682  	}
e7d90cfac5510f Ulf Hansson        2022-02-17  683  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  684  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  685  		/*
1f8728b7adc4c2 Ulf Hansson        2017-02-17  686  		 * Do not allow PM domain to be powered off, when an IRQ safe
1f8728b7adc4c2 Ulf Hansson        2017-02-17  687  		 * device is part of a non-IRQ safe domain.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  688  		 */
1f8728b7adc4c2 Ulf Hansson        2017-02-17  689  		if (!pm_runtime_suspended(pdd->dev) ||
7a02444b8fc25a Ulf Hansson        2022-05-11  690  			irq_safe_dev_in_sleep_domain(pdd->dev, genpd))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  691  			not_suspended++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  692  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  693  
3c64649d1cf9f3 Ulf Hansson        2017-02-17  694  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  695  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  696  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  697  	if (genpd->gov && genpd->gov->power_down_ok) {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  698  		if (!genpd->gov->power_down_ok(&genpd->domain))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  699  			return -EAGAIN;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  700  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  701  
2c9b7f8772033c Ulf Hansson        2018-10-03  702  	/* Default to shallowest state. */
2c9b7f8772033c Ulf Hansson        2018-10-03  703  	if (!genpd->gov)
2c9b7f8772033c Ulf Hansson        2018-10-03  704  		genpd->state_idx = 0;
2c9b7f8772033c Ulf Hansson        2018-10-03  705  
f63816e43d9044 Ulf Hansson        2020-09-24  706  	/* Don't power off, if a child domain is waiting to power on. */
1f8728b7adc4c2 Ulf Hansson        2017-02-17  707  	if (atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  708  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  709  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  710  	ret = _genpd_power_off(genpd, true);
c6a113b52302ad Lina Iyer          2020-10-15  711  	if (ret) {
c6a113b52302ad Lina Iyer          2020-10-15  712  		genpd->states[genpd->state_idx].rejected++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  713  		return ret;
c6a113b52302ad Lina Iyer          2020-10-15  714  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  715  
49f618e1b669ef Ulf Hansson        2020-09-24  716  	genpd->status = GENPD_STATE_OFF;
afece3ab9a3640 Thara Gopinath     2017-07-14  717  	genpd_update_accounting(genpd);
c6a113b52302ad Lina Iyer          2020-10-15  718  	genpd->states[genpd->state_idx].usage++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  719  
8d87ae48ced2df Kees Cook          2020-07-08  720  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  721  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook          2020-07-08  722  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  723  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  724  		genpd_unlock(link->parent);
1f8728b7adc4c2 Ulf Hansson        2017-02-17  725  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  726  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  727  	return 0;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  728  }
1f8728b7adc4c2 Ulf Hansson        2017-02-17  729  
5248051b9afb66 Rafael J. Wysocki  2011-07-01  730  /**
8d87ae48ced2df Kees Cook          2020-07-08  731   * genpd_power_on - Restore power to a given PM domain and its parents.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  732   * @genpd: PM domain to power up.
0106ef5146f9e8 Marek Szyprowski   2016-01-20  733   * @depth: nesting count for lockdep.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  734   *
8d87ae48ced2df Kees Cook          2020-07-08  735   * Restore power to @genpd and all of its parents so that it is possible to
5248051b9afb66 Rafael J. Wysocki  2011-07-01  736   * resume a device belonging to it.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  737   */
86e12eac1f7f84 Ulf Hansson        2016-12-08  738  static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
5248051b9afb66 Rafael J. Wysocki  2011-07-01  739  {
5063ce1571b738 Rafael J. Wysocki  2011-08-08  740  	struct gpd_link *link;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  741  	int ret = 0;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  742  
41e2c8e0060db2 Ulf Hansson        2017-03-20  743  	if (genpd_status_on(genpd))
3f241775c30365 Rafael J. Wysocki  2011-08-08  744  		return 0;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  745  
5063ce1571b738 Rafael J. Wysocki  2011-08-08  746  	/*
5063ce1571b738 Rafael J. Wysocki  2011-08-08  747  	 * The list is guaranteed not to change while the loop below is being
8d87ae48ced2df Kees Cook          2020-07-08  748  	 * executed, unless one of the parents' .power_on() callbacks fiddles
5063ce1571b738 Rafael J. Wysocki  2011-08-08  749  	 * with it.
5063ce1571b738 Rafael J. Wysocki  2011-08-08  750  	 */
8d87ae48ced2df Kees Cook          2020-07-08  751  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  752  		struct generic_pm_domain *parent = link->parent;
0106ef5146f9e8 Marek Szyprowski   2016-01-20  753  
8d87ae48ced2df Kees Cook          2020-07-08  754  		genpd_sd_counter_inc(parent);
0106ef5146f9e8 Marek Szyprowski   2016-01-20  755  
8d87ae48ced2df Kees Cook          2020-07-08  756  		genpd_lock_nested(parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  757  		ret = genpd_power_on(parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  758  		genpd_unlock(parent);
5248051b9afb66 Rafael J. Wysocki  2011-07-01  759  
5063ce1571b738 Rafael J. Wysocki  2011-08-08  760  		if (ret) {
8d87ae48ced2df Kees Cook          2020-07-08  761  			genpd_sd_counter_dec(parent);
9e08cf42969709 Rafael J. Wysocki  2011-08-08  762  			goto err;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  763  		}
5063ce1571b738 Rafael J. Wysocki  2011-08-08  764  	}
5248051b9afb66 Rafael J. Wysocki  2011-07-01  765  
86e12eac1f7f84 Ulf Hansson        2016-12-08  766  	ret = _genpd_power_on(genpd, true);
9e08cf42969709 Rafael J. Wysocki  2011-08-08  767  	if (ret)
9e08cf42969709 Rafael J. Wysocki  2011-08-08  768  		goto err;
0140d8bd47f798 Rafael J. Wysocki  2011-12-01  769  
49f618e1b669ef Ulf Hansson        2020-09-24  770  	genpd->status = GENPD_STATE_ON;
afece3ab9a3640 Thara Gopinath     2017-07-14  771  	genpd_update_accounting(genpd);
afece3ab9a3640 Thara Gopinath     2017-07-14  772  
3f241775c30365 Rafael J. Wysocki  2011-08-08  773  	return 0;
9e08cf42969709 Rafael J. Wysocki  2011-08-08  774  
9e08cf42969709 Rafael J. Wysocki  2011-08-08  775   err:
29e47e2173349e Ulf Hansson        2015-09-02  776  	list_for_each_entry_continue_reverse(link,
8d87ae48ced2df Kees Cook          2020-07-08  777  					&genpd->child_links,
8d87ae48ced2df Kees Cook          2020-07-08  778  					child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  779  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook          2020-07-08  780  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  781  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  782  		genpd_unlock(link->parent);
29e47e2173349e Ulf Hansson        2015-09-02  783  	}
9e08cf42969709 Rafael J. Wysocki  2011-08-08  784  
3f241775c30365 Rafael J. Wysocki  2011-08-08  785  	return ret;
3f241775c30365 Rafael J. Wysocki  2011-08-08  786  }
3f241775c30365 Rafael J. Wysocki  2011-08-08  787  
ea71c59669f17d Ulf Hansson        2019-10-16  788  static int genpd_dev_pm_start(struct device *dev)
ea71c59669f17d Ulf Hansson        2019-10-16  789  {
ea71c59669f17d Ulf Hansson        2019-10-16  790  	struct generic_pm_domain *genpd = dev_to_genpd(dev);
ea71c59669f17d Ulf Hansson        2019-10-16  791  
ea71c59669f17d Ulf Hansson        2019-10-16  792  	return genpd_start_dev(genpd, dev);
ea71c59669f17d Ulf Hansson        2019-10-16  793  }
ea71c59669f17d Ulf Hansson        2019-10-16  794  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  795  static int genpd_dev_pm_qos_notifier(struct notifier_block *nb,
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  796  				     unsigned long val, void *ptr)
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  797  {
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  798  	struct generic_pm_domain_data *gpd_data;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  799  	struct device *dev;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  800  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  801  	gpd_data = container_of(nb, struct generic_pm_domain_data, nb);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  802  	dev = gpd_data->base.dev;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  803  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  804  	for (;;) {
f38d1a6d002526 Ulf Hansson        2022-05-11  805  		struct generic_pm_domain *genpd = ERR_PTR(-ENODATA);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  806  		struct pm_domain_data *pdd;
66d29d802ef3bf Ulf Hansson        2022-05-11  807  		struct gpd_timing_data *td;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  808  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  809  		spin_lock_irq(&dev->power.lock);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  810  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  811  		pdd = dev->power.subsys_data ?
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  812  				dev->power.subsys_data->domain_data : NULL;
b4883ca449473e Viresh Kumar       2017-05-16  813  		if (pdd) {
66d29d802ef3bf Ulf Hansson        2022-05-11  814  			td = to_gpd_data(pdd)->td;
f38d1a6d002526 Ulf Hansson        2022-05-11  815  			if (td) {
66d29d802ef3bf Ulf Hansson        2022-05-11  816  				td->constraint_changed = true;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  817  				genpd = dev_to_genpd(dev);
f38d1a6d002526 Ulf Hansson        2022-05-11  818  			}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  819  		}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  820  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  821  		spin_unlock_irq(&dev->power.lock);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  822  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  823  		if (!IS_ERR(genpd)) {
35241d12f750d2 Lina Iyer          2016-10-14  824  			genpd_lock(genpd);
f38d1a6d002526 Ulf Hansson        2022-05-11  825  			genpd->gd->max_off_time_changed = true;
35241d12f750d2 Lina Iyer          2016-10-14  826  			genpd_unlock(genpd);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  827  		}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  828  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  829  		dev = dev->parent;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01 @830  		if (!dev || dev->power.ignore_children)
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  831  			break;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  832  	}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  833  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  834  	return NOTIFY_DONE;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  835  }
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  836  

:::::: The code at line 631 was first introduced by commit
:::::: 29e47e2173349ee06bd339f7753821c720d50923 PM / Domains: Try power off masters in error path of __pm_genpd_poweron()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
