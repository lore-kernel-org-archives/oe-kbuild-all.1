Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28FBA22
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683219591; x=1714755591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EVms2TPJaxfO9EtB9ldQlP4xh78WpZzhmJDfTsMUwl4=;
  b=O1O471pBXj/1b5UkEX53BOe0Gn5cQnOJVkXQqX5tg259EPt4GrBVXf60
   PECdZ2WgZesqaYOMzZosOdmO3l519NLWmn6sh4v0xeFTDdTwHh41qviNV
   ofhK6Ewzql1uZbqNp9YykT0emy71Zzh2OI6twF5iaziFdKo2Qgy3YSfRN
   VGQ9TWSn766dpvXn3KdyecWjtLIOmIttvgEbBT9gEzZ8K80u8o/jjQDdw
   Y90DfC6mVIvjdhg/S1UmX4cxBFv09eC1JP03sJjcZFuYbGakYXtiZEQox
   83FSbpDikTyYCIYxymcU4wD5NloYN0wIRs/b/E4iT9I8dhEaA7k42Pbu4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377063401"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="377063401"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 09:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="691218004"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="691218004"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 May 2023 09:59:48 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pucJ1-00003q-3D;
	Thu, 04 May 2023 16:59:47 +0000
Date: Fri, 5 May 2023 00:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 22/30] drivers/base/power/domain.c:624:20:
 error: 'pm_wq' undeclared
Message-ID: <202305050029.LFsl9VfH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Akhil,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   ced6f7ca0ea6c6edda442e36c0c41359b344a688
commit: a6a924969fad97eff8bda4460974c296a5f50515 [22/30] UPSTREAM: drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse
config: nds32-randconfig-r005-20230430 (https://download.01.org/0day-ci/archive/20230505/202305050029.LFsl9VfH-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout a6a924969fad97eff8bda4460974c296a5f50515
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash drivers/base/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050029.LFsl9VfH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/power/domain.c: In function 'genpd_queue_power_off_work':
>> drivers/base/power/domain.c:624:20: error: 'pm_wq' undeclared (first use in this function)
     624 |         queue_work(pm_wq, &genpd->power_off_work);
         |                    ^~~~~
   drivers/base/power/domain.c:624:20: note: each undeclared identifier is reported only once for each function it appears in
   drivers/base/power/domain.c: In function 'genpd_dev_pm_qos_notifier':
>> drivers/base/power/domain.c:815:39: error: 'struct dev_pm_info' has no member named 'ignore_children'
     815 |                 if (!dev || dev->power.ignore_children)
         |                                       ^
   drivers/base/power/domain.c: In function 'rtpm_status_str':
>> drivers/base/power/domain.c:3037:23: error: 'struct dev_pm_info' has no member named 'runtime_error'
    3037 |         if (dev->power.runtime_error)
         |                       ^
>> drivers/base/power/domain.c:3039:28: error: 'struct dev_pm_info' has no member named 'disable_depth'
    3039 |         else if (dev->power.disable_depth)
         |                            ^
>> drivers/base/power/domain.c:3041:28: error: 'struct dev_pm_info' has no member named 'runtime_status'
    3041 |         else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
         |                            ^
   drivers/base/power/domain.c:3042:45: error: 'struct dev_pm_info' has no member named 'runtime_status'
    3042 |                 p = status_lookup[dev->power.runtime_status];
         |                                             ^
--
   drivers/base/power/domain_governor.c: In function 'default_suspend_ok':
>> drivers/base/power/domain_governor.c:82:24: error: 'struct dev_pm_info' has no member named 'ignore_children'
      82 |         if (!dev->power.ignore_children)
         |                        ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
   Depends on [n]: PM [=n]
   Selected by [y]:
   - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=y] || QCOM_COMMAND_DB [=y]=n) && INPUT [=y]


vim +/pm_wq +624 drivers/base/power/domain.c

c8f0ea45169c57 Geert Uytterhoeven 2014-11-10  614  
29e47e2173349e Ulf Hansson        2015-09-02  615  /**
86e12eac1f7f84 Ulf Hansson        2016-12-08  616   * genpd_queue_power_off_work - Queue up the execution of genpd_power_off().
a3d09c73492e57 Moritz Fischer     2016-01-27  617   * @genpd: PM domain to power off.
29e47e2173349e Ulf Hansson        2015-09-02  618   *
86e12eac1f7f84 Ulf Hansson        2016-12-08  619   * Queue up the execution of genpd_power_off() unless it's already been done
29e47e2173349e Ulf Hansson        2015-09-02  620   * before.
29e47e2173349e Ulf Hansson        2015-09-02  621   */
29e47e2173349e Ulf Hansson        2015-09-02  622  static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
29e47e2173349e Ulf Hansson        2015-09-02  623  {
29e47e2173349e Ulf Hansson        2015-09-02 @624  	queue_work(pm_wq, &genpd->power_off_work);
29e47e2173349e Ulf Hansson        2015-09-02  625  }
29e47e2173349e Ulf Hansson        2015-09-02  626  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  627  /**
1f8728b7adc4c2 Ulf Hansson        2017-02-17  628   * genpd_power_off - Remove power from a given PM domain.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  629   * @genpd: PM domain to power down.
3c64649d1cf9f3 Ulf Hansson        2017-02-17  630   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
3c64649d1cf9f3 Ulf Hansson        2017-02-17  631   * RPM status of the releated device is in an intermediate state, not yet turned
3c64649d1cf9f3 Ulf Hansson        2017-02-17  632   * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
3c64649d1cf9f3 Ulf Hansson        2017-02-17  633   * be RPM_SUSPENDED, while it tries to power off the PM domain.
763663c9715f5f Yang Yingliang     2021-05-12  634   * @depth: nesting count for lockdep.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  635   *
1f8728b7adc4c2 Ulf Hansson        2017-02-17  636   * If all of the @genpd's devices have been suspended and all of its subdomains
1f8728b7adc4c2 Ulf Hansson        2017-02-17  637   * have been powered down, remove power from @genpd.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  638   */
2da835452a0875 Ulf Hansson        2017-02-17  639  static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
2da835452a0875 Ulf Hansson        2017-02-17  640  			   unsigned int depth)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  641  {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  642  	struct pm_domain_data *pdd;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  643  	struct gpd_link *link;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  644  	unsigned int not_suspended = 0;
f63816e43d9044 Ulf Hansson        2020-09-24  645  	int ret;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  646  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  647  	/*
1f8728b7adc4c2 Ulf Hansson        2017-02-17  648  	 * Do not try to power off the domain in the following situations:
1f8728b7adc4c2 Ulf Hansson        2017-02-17  649  	 * (1) The domain is already in the "power off" state.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  650  	 * (2) System suspend is in progress.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  651  	 */
41e2c8e0060db2 Ulf Hansson        2017-03-20  652  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  653  		return 0;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  654  
ffaa42e8a40b7f Ulf Hansson        2017-03-20  655  	/*
ffaa42e8a40b7f Ulf Hansson        2017-03-20  656  	 * Abort power off for the PM domain in the following situations:
ffaa42e8a40b7f Ulf Hansson        2017-03-20  657  	 * (1) The domain is configured as always on.
ffaa42e8a40b7f Ulf Hansson        2017-03-20  658  	 * (2) When the domain has a subdomain being powered on.
ffaa42e8a40b7f Ulf Hansson        2017-03-20  659  	 */
ed61e18a4b4e44 Leonard Crestez    2019-04-30  660  	if (genpd_is_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez    2019-04-30  661  			genpd_is_rpm_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez    2019-04-30  662  			atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  663  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  664  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  665  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  666  		enum pm_qos_flags_status stat;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  667  
20f97caf1120bd Rafael J. Wysocki  2017-10-13  668  		stat = dev_pm_qos_flags(pdd->dev, PM_QOS_FLAG_NO_POWER_OFF);
1f8728b7adc4c2 Ulf Hansson        2017-02-17  669  		if (stat > PM_QOS_FLAGS_NONE)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  670  			return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  671  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  672  		/*
1f8728b7adc4c2 Ulf Hansson        2017-02-17  673  		 * Do not allow PM domain to be powered off, when an IRQ safe
1f8728b7adc4c2 Ulf Hansson        2017-02-17  674  		 * device is part of a non-IRQ safe domain.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  675  		 */
1f8728b7adc4c2 Ulf Hansson        2017-02-17  676  		if (!pm_runtime_suspended(pdd->dev) ||
1f8728b7adc4c2 Ulf Hansson        2017-02-17  677  			irq_safe_dev_in_no_sleep_domain(pdd->dev, genpd))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  678  			not_suspended++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  679  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  680  
3c64649d1cf9f3 Ulf Hansson        2017-02-17  681  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  682  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  683  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  684  	if (genpd->gov && genpd->gov->power_down_ok) {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  685  		if (!genpd->gov->power_down_ok(&genpd->domain))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  686  			return -EAGAIN;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  687  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  688  
2c9b7f8772033c Ulf Hansson        2018-10-03  689  	/* Default to shallowest state. */
2c9b7f8772033c Ulf Hansson        2018-10-03  690  	if (!genpd->gov)
2c9b7f8772033c Ulf Hansson        2018-10-03  691  		genpd->state_idx = 0;
2c9b7f8772033c Ulf Hansson        2018-10-03  692  
f63816e43d9044 Ulf Hansson        2020-09-24  693  	/* Don't power off, if a child domain is waiting to power on. */
1f8728b7adc4c2 Ulf Hansson        2017-02-17  694  	if (atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  695  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  696  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  697  	ret = _genpd_power_off(genpd, true);
c6a113b52302ad Lina Iyer          2020-10-15  698  	if (ret) {
c6a113b52302ad Lina Iyer          2020-10-15  699  		genpd->states[genpd->state_idx].rejected++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  700  		return ret;
c6a113b52302ad Lina Iyer          2020-10-15  701  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  702  
49f618e1b669ef Ulf Hansson        2020-09-24  703  	genpd->status = GENPD_STATE_OFF;
afece3ab9a3640 Thara Gopinath     2017-07-14  704  	genpd_update_accounting(genpd);
c6a113b52302ad Lina Iyer          2020-10-15  705  	genpd->states[genpd->state_idx].usage++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  706  
8d87ae48ced2df Kees Cook          2020-07-08  707  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  708  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook          2020-07-08  709  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  710  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  711  		genpd_unlock(link->parent);
1f8728b7adc4c2 Ulf Hansson        2017-02-17  712  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  713  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  714  	return 0;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  715  }
1f8728b7adc4c2 Ulf Hansson        2017-02-17  716  
5248051b9afb66 Rafael J. Wysocki  2011-07-01  717  /**
8d87ae48ced2df Kees Cook          2020-07-08  718   * genpd_power_on - Restore power to a given PM domain and its parents.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  719   * @genpd: PM domain to power up.
0106ef5146f9e8 Marek Szyprowski   2016-01-20  720   * @depth: nesting count for lockdep.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  721   *
8d87ae48ced2df Kees Cook          2020-07-08  722   * Restore power to @genpd and all of its parents so that it is possible to
5248051b9afb66 Rafael J. Wysocki  2011-07-01  723   * resume a device belonging to it.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  724   */
86e12eac1f7f84 Ulf Hansson        2016-12-08  725  static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
5248051b9afb66 Rafael J. Wysocki  2011-07-01  726  {
5063ce1571b738 Rafael J. Wysocki  2011-08-08  727  	struct gpd_link *link;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  728  	int ret = 0;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  729  
41e2c8e0060db2 Ulf Hansson        2017-03-20  730  	if (genpd_status_on(genpd))
3f241775c30365 Rafael J. Wysocki  2011-08-08  731  		return 0;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  732  
5063ce1571b738 Rafael J. Wysocki  2011-08-08  733  	/*
5063ce1571b738 Rafael J. Wysocki  2011-08-08  734  	 * The list is guaranteed not to change while the loop below is being
8d87ae48ced2df Kees Cook          2020-07-08  735  	 * executed, unless one of the parents' .power_on() callbacks fiddles
5063ce1571b738 Rafael J. Wysocki  2011-08-08  736  	 * with it.
5063ce1571b738 Rafael J. Wysocki  2011-08-08  737  	 */
8d87ae48ced2df Kees Cook          2020-07-08  738  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  739  		struct generic_pm_domain *parent = link->parent;
0106ef5146f9e8 Marek Szyprowski   2016-01-20  740  
8d87ae48ced2df Kees Cook          2020-07-08  741  		genpd_sd_counter_inc(parent);
0106ef5146f9e8 Marek Szyprowski   2016-01-20  742  
8d87ae48ced2df Kees Cook          2020-07-08  743  		genpd_lock_nested(parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  744  		ret = genpd_power_on(parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  745  		genpd_unlock(parent);
5248051b9afb66 Rafael J. Wysocki  2011-07-01  746  
5063ce1571b738 Rafael J. Wysocki  2011-08-08  747  		if (ret) {
8d87ae48ced2df Kees Cook          2020-07-08  748  			genpd_sd_counter_dec(parent);
9e08cf42969709 Rafael J. Wysocki  2011-08-08  749  			goto err;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  750  		}
5063ce1571b738 Rafael J. Wysocki  2011-08-08  751  	}
5248051b9afb66 Rafael J. Wysocki  2011-07-01  752  
86e12eac1f7f84 Ulf Hansson        2016-12-08  753  	ret = _genpd_power_on(genpd, true);
9e08cf42969709 Rafael J. Wysocki  2011-08-08  754  	if (ret)
9e08cf42969709 Rafael J. Wysocki  2011-08-08  755  		goto err;
0140d8bd47f798 Rafael J. Wysocki  2011-12-01  756  
49f618e1b669ef Ulf Hansson        2020-09-24  757  	genpd->status = GENPD_STATE_ON;
afece3ab9a3640 Thara Gopinath     2017-07-14  758  	genpd_update_accounting(genpd);
afece3ab9a3640 Thara Gopinath     2017-07-14  759  
3f241775c30365 Rafael J. Wysocki  2011-08-08  760  	return 0;
9e08cf42969709 Rafael J. Wysocki  2011-08-08  761  
9e08cf42969709 Rafael J. Wysocki  2011-08-08  762   err:
29e47e2173349e Ulf Hansson        2015-09-02  763  	list_for_each_entry_continue_reverse(link,
8d87ae48ced2df Kees Cook          2020-07-08  764  					&genpd->child_links,
8d87ae48ced2df Kees Cook          2020-07-08  765  					child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  766  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook          2020-07-08  767  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  768  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  769  		genpd_unlock(link->parent);
29e47e2173349e Ulf Hansson        2015-09-02  770  	}
9e08cf42969709 Rafael J. Wysocki  2011-08-08  771  
3f241775c30365 Rafael J. Wysocki  2011-08-08  772  	return ret;
3f241775c30365 Rafael J. Wysocki  2011-08-08  773  }
3f241775c30365 Rafael J. Wysocki  2011-08-08  774  
ea71c59669f17d Ulf Hansson        2019-10-16  775  static int genpd_dev_pm_start(struct device *dev)
ea71c59669f17d Ulf Hansson        2019-10-16  776  {
ea71c59669f17d Ulf Hansson        2019-10-16  777  	struct generic_pm_domain *genpd = dev_to_genpd(dev);
ea71c59669f17d Ulf Hansson        2019-10-16  778  
ea71c59669f17d Ulf Hansson        2019-10-16  779  	return genpd_start_dev(genpd, dev);
ea71c59669f17d Ulf Hansson        2019-10-16  780  }
ea71c59669f17d Ulf Hansson        2019-10-16  781  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  782  static int genpd_dev_pm_qos_notifier(struct notifier_block *nb,
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  783  				     unsigned long val, void *ptr)
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  784  {
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  785  	struct generic_pm_domain_data *gpd_data;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  786  	struct device *dev;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  787  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  788  	gpd_data = container_of(nb, struct generic_pm_domain_data, nb);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  789  	dev = gpd_data->base.dev;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  790  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  791  	for (;;) {
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  792  		struct generic_pm_domain *genpd;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  793  		struct pm_domain_data *pdd;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  794  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  795  		spin_lock_irq(&dev->power.lock);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  796  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  797  		pdd = dev->power.subsys_data ?
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  798  				dev->power.subsys_data->domain_data : NULL;
b4883ca449473e Viresh Kumar       2017-05-16  799  		if (pdd) {
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  800  			to_gpd_data(pdd)->td.constraint_changed = true;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  801  			genpd = dev_to_genpd(dev);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  802  		} else {
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  803  			genpd = ERR_PTR(-ENODATA);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  804  		}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  805  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  806  		spin_unlock_irq(&dev->power.lock);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  807  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  808  		if (!IS_ERR(genpd)) {
35241d12f750d2 Lina Iyer          2016-10-14  809  			genpd_lock(genpd);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  810  			genpd->max_off_time_changed = true;
35241d12f750d2 Lina Iyer          2016-10-14  811  			genpd_unlock(genpd);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  812  		}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  813  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  814  		dev = dev->parent;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01 @815  		if (!dev || dev->power.ignore_children)
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  816  			break;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  817  	}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  818  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  819  	return NOTIFY_DONE;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  820  }
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  821  

:::::: The code at line 624 was first introduced by commit
:::::: 29e47e2173349ee06bd339f7753821c720d50923 PM / Domains: Try power off masters in error path of __pm_genpd_poweron()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
