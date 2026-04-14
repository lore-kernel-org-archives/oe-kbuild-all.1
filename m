Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0154534EF08
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170744; cv=none; b=QiVuCvF2/Edvy55Jly37OIVJxvwAAJvDZQC8e6ju1IRTdgPHFOaa7yfsGClxe70U3/e5SfY46AO//ZqkBtE5OpKzkhdE1yLe5kYLrMiHjuQ2tFmpjQw5J02dZxpjiSFyOf8bY+IJI9rJBmSTmGzyoj02oT0sJG0Q2R9+GvE9pks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170744; c=relaxed/simple;
	bh=jYE11sUOvkAJT3+qkWzrARVxcmpvi5Fcl9LBkh2dMYY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t1qUY9m9+ovLPQbevCY3ia4QXHL9Vn600qnWJgOw7tmptWhB9INsfqYPOFUw8CCFediZjDMGDYxljxZvFnSKHnIC1GIOQMa1lWHCc/rjNwUDn3NnSEfZvceS8Dmgjw05O1zgjVpLg1PkbCNvVQLy91kXSVcbVS1DdECFzNhIMLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2LyASvh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2LyASvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776170742; x=1807706742;
  h=date:from:to:cc:subject:message-id;
  bh=jYE11sUOvkAJT3+qkWzrARVxcmpvi5Fcl9LBkh2dMYY=;
  b=k2LyASvh+0nlU/ekdAmgE65vaDSE2P/LA603zjKt1SP5860P83Uecx9K
   B3CZaeSlL9sVYZCHnqNN7MxHKinokyACv90AmMhXjsab+1NaBix2vyWkj
   d/585jdEcmxY6tmGr/ZzlllT1fpVGl/4+4iLx1QTCkxpYzx+EiA9r5jOq
   ig3JiaSEZmIQLblt6EUMpookRuzxVXn2iU52z7/aY8ggQ5FIob39Q/Eqk
   hhxXQfs0kIQYfTHH213CMh7HGRw5uKFtY507xEKVFtSJpTb16qruOAp51
   8479Yf9a71/nwOt1Gct+mMYRG6Dki87D44SHebMlRdnYoLu+NYHpSzwUL
   Q==;
X-CSE-ConnectionGUID: c5tbnhvgSFO6UPwUIOzriw==
X-CSE-MsgGUID: 67Avjy/JQWyz48BqUIVhrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="80719372"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="80719372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:45:42 -0700
X-CSE-ConnectionGUID: J2tR675+TzaZxKdFhN4JeA==
X-CSE-MsgGUID: GJXjQOj2RMm2PvP4dzH4Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230015522"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2026 05:45:40 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCd97-000000001S1-399l;
	Tue, 14 Apr 2026 12:45:37 +0000
Date: Tue, 14 Apr 2026 20:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 23/25]
 drivers/thermal/devfreq_cooling.c:457:57: error: passing argument 4 of
 'thermal_of_cooling_device_register' from incompatible pointer type
Message-ID: <202604142003.1zr830Gz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: c045fc07fa888c25f248b661a8fdda955528baf2 [23/25] thermal/of: Introduce cooling device of_index
config: riscv-randconfig-002-20260414 (https://download.01.org/0day-ci/archive/20260414/202604142003.1zr830Gz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142003.1zr830Gz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142003.1zr830Gz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/devfreq_cooling.c: In function 'of_devfreq_cooling_register_power':
>> drivers/thermal/devfreq_cooling.c:457:57: error: passing argument 4 of 'thermal_of_cooling_device_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
     cdev = thermal_of_cooling_device_register(np, 0, name, dfc, ops);
                                                            ^~~
   In file included from include/linux/devfreq_cooling.h:14,
                    from drivers/thermal/devfreq_cooling.c:14:
   include/linux/thermal.h:231:49: note: expected 'const struct thermal_cooling_device_ops *' but argument is of type 'struct devfreq_cooling_device *'
           const struct thermal_cooling_device_ops *ops)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/thermal/devfreq_cooling.c:457:9: error: too many arguments to function 'thermal_of_cooling_device_register'
     cdev = thermal_of_cooling_device_register(np, 0, name, dfc, ops);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/devfreq_cooling.h:14,
                    from drivers/thermal/devfreq_cooling.c:14:
   include/linux/thermal.h:229:1: note: declared here
    thermal_of_cooling_device_register(struct device_node *np,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c: In function 'etnaviv_gpu_bind':
>> drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1795:28: error: passing argument 4 of 'thermal_of_cooling_device_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
        (char *)dev_name(dev), gpu, &cooling_ops);
                               ^~~
   In file included from drivers/gpu/drm/etnaviv/etnaviv_gpu.c:17:
   include/linux/thermal.h:231:49: note: expected 'const struct thermal_cooling_device_ops *' but argument is of type 'struct etnaviv_gpu *'
           const struct thermal_cooling_device_ops *ops)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1794:18: error: too many arguments to function 'thermal_of_cooling_device_register'
      gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/etnaviv/etnaviv_gpu.c:17:
   include/linux/thermal.h:229:1: note: declared here
    thermal_of_cooling_device_register(struct device_node *np,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/thermal_of_cooling_device_register +457 drivers/thermal/devfreq_cooling.c

   376	
   377	/**
   378	 * of_devfreq_cooling_register_power() - Register devfreq cooling device,
   379	 *                                      with OF and power information.
   380	 * @np:	Pointer to OF device_node.
   381	 * @df:	Pointer to devfreq device.
   382	 * @dfc_power:	Pointer to devfreq_cooling_power.
   383	 *
   384	 * Register a devfreq cooling device.  The available OPPs must be
   385	 * registered on the device.
   386	 *
   387	 * If @dfc_power is provided, the cooling device is registered with the
   388	 * power extensions.  For the power extensions to work correctly,
   389	 * devfreq should use the simple_ondemand governor, other governors
   390	 * are not currently supported.
   391	 */
   392	struct thermal_cooling_device *
   393	of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
   394					  struct devfreq_cooling_power *dfc_power)
   395	{
   396		struct thermal_cooling_device *cdev;
   397		struct device *dev = df->dev.parent;
   398		struct devfreq_cooling_device *dfc;
   399		struct em_perf_domain *em;
   400		struct thermal_cooling_device_ops *ops;
   401		char *name;
   402		int err, num_opps;
   403	
   404	
   405		dfc = kzalloc_obj(*dfc);
   406		if (!dfc)
   407			return ERR_PTR(-ENOMEM);
   408	
   409		dfc->devfreq = df;
   410	
   411		ops = &dfc->cooling_ops;
   412		ops->get_max_state = devfreq_cooling_get_max_state;
   413		ops->get_cur_state = devfreq_cooling_get_cur_state;
   414		ops->set_cur_state = devfreq_cooling_set_cur_state;
   415	
   416		em = em_pd_get(dev);
   417		if (em && !em_is_artificial(em)) {
   418			dfc->em_pd = em;
   419			ops->get_requested_power =
   420				devfreq_cooling_get_requested_power;
   421			ops->state2power = devfreq_cooling_state2power;
   422			ops->power2state = devfreq_cooling_power2state;
   423	
   424			dfc->power_ops = dfc_power;
   425	
   426			num_opps = em_pd_nr_perf_states(dfc->em_pd);
   427		} else {
   428			/* Backward compatibility for drivers which do not use IPA */
   429			dev_dbg(dev, "missing proper EM for cooling device\n");
   430	
   431			num_opps = dev_pm_opp_get_opp_count(dev);
   432	
   433			err = devfreq_cooling_gen_tables(dfc, num_opps);
   434			if (err)
   435				goto free_dfc;
   436		}
   437	
   438		if (num_opps <= 0) {
   439			err = -EINVAL;
   440			goto free_dfc;
   441		}
   442	
   443		/* max_state is an index, not a counter */
   444		dfc->max_state = num_opps - 1;
   445	
   446		err = dev_pm_qos_add_request(dev, &dfc->req_max_freq,
   447					     DEV_PM_QOS_MAX_FREQUENCY,
   448					     PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
   449		if (err < 0)
   450			goto free_table;
   451	
   452		err = -ENOMEM;
   453		name = kasprintf(GFP_KERNEL, "devfreq-%s", dev_name(dev));
   454		if (!name)
   455			goto remove_qos_req;
   456	
 > 457		cdev = thermal_of_cooling_device_register(np, 0, name, dfc, ops);
   458		kfree(name);
   459	
   460		if (IS_ERR(cdev)) {
   461			err = PTR_ERR(cdev);
   462			dev_err(dev,
   463				"Failed to register devfreq cooling device (%d)\n",
   464				err);
   465			goto remove_qos_req;
   466		}
   467	
   468		dfc->cdev = cdev;
   469	
   470		return cdev;
   471	
   472	remove_qos_req:
   473		dev_pm_qos_remove_request(&dfc->req_max_freq);
   474	free_table:
   475		kfree(dfc->freq_table);
   476	free_dfc:
   477		kfree(dfc);
   478	
   479		return ERR_PTR(err);
   480	}
   481	EXPORT_SYMBOL_GPL(of_devfreq_cooling_register_power);
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
