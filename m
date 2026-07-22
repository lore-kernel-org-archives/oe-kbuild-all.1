Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDB738F926
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 02:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688620; cv=none; b=PgDSpCtoIr0f1K2E3Mb8eUUpTCEQ0d9kO1XAsnWOds3NKzHH2eRVH5GaAKK8+UTWuqlk1mf4j52WeaRTVaSJIva3WLolmrzjLLW58JphZdnDXIuJcia70O+sX1usqLGE+y8ttKp4bhwJ0vUGf36NNpGgmco+3dmbl0cDgUoCr80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688620; c=relaxed/simple;
	bh=4yYBTNDapK3M1BUlyZ7DfrO9xYHshLWerdpi9Qt4xFU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ORQxaZI6x2IKej6W7ZP0d8KjkjF+H9mR88JE/Juw2hStcglSLTU/x6thkyCrSo6GAfOGsoks7nKJgUYrgze0gVf671z9+yFwMyvzp0OW3TOQeiDPfDqVL3ojDa68dRshWXAUQ+72pDvjeOOHCZH/KAK2bLLDOvMOD12yLT2AEgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BX2HP0BS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BX2HP0BS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784688618; x=1816224618;
  h=date:from:to:cc:subject:message-id;
  bh=4yYBTNDapK3M1BUlyZ7DfrO9xYHshLWerdpi9Qt4xFU=;
  b=BX2HP0BSe5NgZXXAo9K3O5mXBQtn7afyb0iBXE0gvZofVm4fvWC3uooK
   Ef6e60SKpbPLCwVI9V/ftFVtWzvj01KRoglnphRi95F73ezhzKO1JHq3c
   ovBWJcC5BuXR+EE6rCMqhD4ZcNWKCP5PTq8UEF2/UcqcldsQpG0vPjhmF
   aw254ya9Ur/4ad0rD6vjFAWDOal1d16K0M+3Pr3UAh4thowkPwPRhdvHY
   m88xMwenPVPQJz4HK4jmCl7IbFMuOmmQ3gzc86YbHBecL4ty3uZUKaSGD
   B28kNI7agxj3vTpHLtcWEvVIn793fOyTcg6OIQ4J+SWXMnnJ8kGfI4b0G
   w==;
X-CSE-ConnectionGUID: eEj38z8ZTzyoZJildaa2Zg==
X-CSE-MsgGUID: PCNT2xoLSHK1RZ6FTU7JkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85354032"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85354032"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 19:50:12 -0700
X-CSE-ConnectionGUID: G0ehGUjXSvyE25EsRdNQbw==
X-CSE-MsgGUID: FBfQc4nZRVyVMSxcCv8AMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="296180167"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Jul 2026 19:50:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmN27-00000000YM1-1iro;
	Wed, 22 Jul 2026 02:50:07 +0000
Date: Wed, 22 Jul 2026 10:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 6914/8209]
 drivers/watchdog/watchdog_core.c:283:65: warning: '%d' directive output may
 be truncated writing between 1 and 10 bytes into a region of size 8
Message-ID: <202607221029.3DpWtIFm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: e9f47fe866d6b0aa026fe99df94f8cc2fadc2638 [6914/8209] watchdog: take all OF aliases into account when assigning id
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260722/202607221029.3DpWtIFm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607221029.3DpWtIFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607221029.3DpWtIFm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/watchdog_core.c: In function '___watchdog_register_device':
>> drivers/watchdog/watchdog_core.c:283:65: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
     283 |                         snprintf(alias, sizeof(alias), "watchdog%d", id);
         |                                                                 ^~
   drivers/watchdog/watchdog_core.c:283:56: note: directive argument in the range [0, 2147483647]
     283 |                         snprintf(alias, sizeof(alias), "watchdog%d", id);
         |                                                        ^~~~~~~~~~~~
   drivers/watchdog/watchdog_core.c:283:25: note: 'snprintf' output between 10 and 19 bytes into a destination of size 16
     283 |                         snprintf(alias, sizeof(alias), "watchdog%d", id);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +283 drivers/watchdog/watchdog_core.c

   240	
   241	static int ___watchdog_register_device(struct watchdog_device *wdd)
   242	{
   243		int ret, min_id, id = -1;
   244		struct device_node *np;
   245		char alias[16];
   246	
   247		if (wdd == NULL || wdd->info == NULL || wdd->ops == NULL)
   248			return -EINVAL;
   249	
   250		/* Mandatory operations need to be supported */
   251		if (!wdd->ops->start || (!wdd->ops->stop && !wdd->max_hw_heartbeat_ms))
   252			return -EINVAL;
   253	
   254		watchdog_check_min_max_timeout(wdd);
   255	
   256		/*
   257		 * Note: now that all watchdog_device data has been verified, we
   258		 * will not check this anymore in other functions. If data gets
   259		 * corrupted in a later stage then we expect a kernel panic!
   260		 */
   261	
   262		/* Use alias for watchdog id if possible */
   263		if (wdd->parent) {
   264			ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
   265			if (ret >= 0)
   266				id = ida_alloc_range(&watchdog_ida, ret, ret,
   267						     GFP_KERNEL);
   268		}
   269	
   270		/*
   271		 * Find an id which is not pre-assigned via a DT alias to some
   272		 * other, possibly not yet probed, watchdog device.
   273		 */
   274		if (id < 0) {
   275			np = of_find_node_by_path("/aliases");
   276	
   277			for (min_id = 0; ; min_id = id + 1) {
   278				id = ida_alloc_range(&watchdog_ida, min_id, MAX_DOGS - 1,
   279						     GFP_KERNEL);
   280				if (!np || id < 0)
   281					break;
   282	
 > 283				snprintf(alias, sizeof(alias), "watchdog%d", id);
   284				if (!of_get_property(np, alias, NULL))
   285					break;
   286				ida_free(&watchdog_ida, id);
   287			}
   288			of_node_put(np);
   289		}
   290	
   291		if (id < 0)
   292			return id;
   293		wdd->id = id;
   294	
   295		ret = watchdog_dev_register(wdd);
   296		if (ret) {
   297			ida_free(&watchdog_ida, id);
   298			if (!(id == 0 && ret == -EBUSY))
   299				return ret;
   300	
   301			/* Retry in case a legacy watchdog module exists */
   302			id = ida_alloc_range(&watchdog_ida, 1, MAX_DOGS - 1,
   303					     GFP_KERNEL);
   304			if (id < 0)
   305				return id;
   306			wdd->id = id;
   307	
   308			ret = watchdog_dev_register(wdd);
   309			if (ret) {
   310				ida_free(&watchdog_ida, id);
   311				return ret;
   312			}
   313		}
   314	
   315		/* Module parameter to force watchdog policy on reboot. */
   316		if (stop_on_reboot != -1) {
   317			if (stop_on_reboot)
   318				set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
   319			else
   320				clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
   321		}
   322	
   323		if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
   324			if (!wdd->ops->stop)
   325				pr_warn("watchdog%d: stop_on_reboot not supported\n", wdd->id);
   326			else {
   327				wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
   328	
   329				ret = register_reboot_notifier(&wdd->reboot_nb);
   330				if (ret) {
   331					pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
   332						wdd->id, ret);
   333					watchdog_dev_unregister(wdd);
   334					ida_free(&watchdog_ida, id);
   335					return ret;
   336				}
   337			}
   338		}
   339	
   340		if (wdd->ops->restart) {
   341			wdd->restart_nb.notifier_call = watchdog_restart_notifier;
   342	
   343			ret = register_restart_handler(&wdd->restart_nb);
   344			if (ret)
   345				pr_warn("watchdog%d: Cannot register restart handler (%d)\n",
   346					wdd->id, ret);
   347		}
   348	
   349		if (test_bit(WDOG_NO_PING_ON_SUSPEND, &wdd->status)) {
   350			wdd->pm_nb.notifier_call = watchdog_pm_notifier;
   351	
   352			ret = register_pm_notifier(&wdd->pm_nb);
   353			if (ret)
   354				pr_warn("watchdog%d: Cannot register pm handler (%d)\n",
   355					wdd->id, ret);
   356		}
   357	
   358		return 0;
   359	}
   360	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
