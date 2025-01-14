Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5A3596E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736874445; cv=none; b=NFD32ub9rLuASlvMXsqhH2U5njCLPEkiA6QF7Ng3V3UUCtJfwTygLDNjuFnkjdYZXHvnAmAGWzHACdOfAhm0XOfdCcrPDHyjft9xl4qDwFPdAvFDgHZdQweUYPkGcIOpuvHzfpcrNBoy5XTrFK4VeOnINLP9HMKjqvYvxMCegO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736874445; c=relaxed/simple;
	bh=6Pe2gGG6m/2TUuV43iyR4FxC74hd9zTXZcpFobIi2Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lB1wB6Xe4qvRfbqp5ydft+bmJ2l5vribFp44E19nCHSvqPSR1QDrLHmo2Txed5E5lRcyBiGIBIghFIFckEevJdYaRRwnh7M4u9T5m+Io0qBy5sl6aXJaQtzFgj1lS2NJy4JoPuOxQ7cAyzHhKEujNJ6dw2K/3uY5k0hs9WLvh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=av76HWqc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="av76HWqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736874444; x=1768410444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Pe2gGG6m/2TUuV43iyR4FxC74hd9zTXZcpFobIi2Fg=;
  b=av76HWqc8BW2rEc8vYiKyvbUMyoo+BiIwZbGQJLhopsxhDt+BkbVDmSH
   Y7RD+ABrxNT4kh+7hYswrVDKqCA+S4xcG9trx4OYrCi10mlctYtZY4eSE
   Y6+nWzJXZghpK+U+ZCXgJC8z0BlRGmkPgR9vtUxnVyKLgF5beixsSUD8E
   SU8TbNdH6hyiM4J36WiMct5M/Dq0zboTWJXae97omPo7A+F2vqRsWVnkt
   3aaTIfS0jEjUQGZV4n7NaK/egGkZEUyleGLItbQp1fLgpViAfR3daO/Wi
   25FGJWlrWSBVe8Y/4RoEkusjZFamCpvQYMCA00twQwCHlNt7QsT+KZe7r
   w==;
X-CSE-ConnectionGUID: eZc6pxvVTNazXZhNJBqmuA==
X-CSE-MsgGUID: 1MV7V1TlSoOA7yTXd3WQAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="24783237"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="24783237"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 09:07:23 -0800
X-CSE-ConnectionGUID: xkKl72pCTbSoyrRMSVVC3g==
X-CSE-MsgGUID: Vs01o4IiTOWdKqOb54YBfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105376997"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jan 2025 09:07:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXkNr-000Omt-1G;
	Tue, 14 Jan 2025 17:07:19 +0000
Date: Wed, 15 Jan 2025 01:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/thermal/thermal_debugfs.c:252:59: warning: '%d' directive
 output may be truncated writing between 1 and 5 bytes into a region of size
 between 3 and 8
Message-ID: <202501150128.ffBzZab7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c45323b7560ec87c37c729b703c86ee65f136d75
commit: 755113d7678681a137c330f7997ceb680adb644e thermal/debugfs: Add thermal cooling device debugfs information
date:   1 year ago
config: arm-randconfig-002-20240719 (https://download.01.org/0day-ci/archive/20250115/202501150128.ffBzZab7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150128.ffBzZab7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150128.ffBzZab7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/thermal_debugfs.c:103:6: warning: no previous prototype for 'thermal_debug_init' [-Wmissing-prototypes]
     103 | void thermal_debug_init(void)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:329:6: warning: no previous prototype for 'thermal_debug_cdev_state_update' [-Wmissing-prototypes]
     329 | void thermal_debug_cdev_state_update(const struct thermal_cooling_device *cdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:389:6: warning: no previous prototype for 'thermal_debug_cdev_add' [-Wmissing-prototypes]
     389 | void thermal_debug_cdev_add(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:431:6: warning: no previous prototype for 'thermal_debug_cdev_remove' [-Wmissing-prototypes]
     431 | void thermal_debug_cdev_remove(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c: In function 'cdev_tt_seq_show':
>> drivers/thermal/thermal_debugfs.c:252:59: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 8 [-Wformat-truncation=]
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                                                           ^~
   drivers/thermal/thermal_debugfs.c:252:54: note: directive argument in the range [0, 65535]
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                                                      ^~~~~~~~
   drivers/thermal/thermal_debugfs.c:252:17: note: 'snprintf' output between 5 and 14 bytes into a destination of size 11
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     253 |                          entry->id >> 16, entry->id & 0xFFFF);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +252 drivers/thermal/thermal_debugfs.c

   233	
   234	static int cdev_tt_seq_show(struct seq_file *s, void *v)
   235	{
   236		struct thermal_debugfs *thermal_dbg = s->private;
   237		struct cdev_debugfs *cdev_dbg = &thermal_dbg->cdev_dbg;
   238		struct list_head *transitions = cdev_dbg->transitions;
   239		struct cdev_record *entry;
   240		int i = *(loff_t *)v;
   241	
   242		if (!i)
   243			seq_puts(s, "Transition\tOccurences\n");
   244	
   245		list_for_each_entry(entry, &transitions[i], node) {
   246			/*
   247			 * Assuming maximum cdev states is 1024, the longer
   248			 * string for a transition would be "1024->1024\0"
   249			 */
   250			char buffer[11];
   251	
 > 252			snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
   253				 entry->id >> 16, entry->id & 0xFFFF);
   254	
   255			seq_printf(s, "%-10s\t%-10llu\n", buffer, entry->count);
   256		}
   257	
   258		return 0;
   259	}
   260	
   261	static const struct seq_operations tt_sops = {
   262		.start = cdev_seq_start,
   263		.next = cdev_seq_next,
   264		.stop = cdev_seq_stop,
   265		.show = cdev_tt_seq_show,
   266	};
   267	
   268	DEFINE_SEQ_ATTRIBUTE(tt);
   269	
   270	static int cdev_dt_seq_show(struct seq_file *s, void *v)
   271	{
   272		struct thermal_debugfs *thermal_dbg = s->private;
   273		struct cdev_debugfs *cdev_dbg = &thermal_dbg->cdev_dbg;
   274		struct list_head *durations = cdev_dbg->durations;
   275		struct cdev_record *entry;
   276		int i = *(loff_t *)v;
   277	
   278		if (!i)
   279			seq_puts(s, "State\tResidency\n");
   280	
   281		list_for_each_entry(entry, &durations[i], node) {
   282			s64 duration = ktime_to_ms(entry->residency);
   283	
   284			if (entry->id == cdev_dbg->current_state)
   285				duration += ktime_ms_delta(ktime_get(),
   286							   cdev_dbg->timestamp);
   287	
   288			seq_printf(s, "%-5d\t%-10llu\n", entry->id, duration);
   289		}
   290	
   291		return 0;
   292	}
   293	
   294	static const struct seq_operations dt_sops = {
   295		.start = cdev_seq_start,
   296		.next = cdev_seq_next,
   297		.stop = cdev_seq_stop,
   298		.show = cdev_dt_seq_show,
   299	};
   300	
   301	DEFINE_SEQ_ATTRIBUTE(dt);
   302	
   303	static int cdev_clear_set(void *data, u64 val)
   304	{
   305		struct thermal_debugfs *thermal_dbg = data;
   306	
   307		if (!val)
   308			return -EINVAL;
   309	
   310		mutex_lock(&thermal_dbg->lock);
   311	
   312		thermal_debugfs_cdev_clear(&thermal_dbg->cdev_dbg);
   313	
   314		mutex_unlock(&thermal_dbg->lock);
   315	
   316		return 0;
   317	}
   318	
   319	DEFINE_DEBUGFS_ATTRIBUTE(cdev_clear_fops, NULL, cdev_clear_set, "%llu\n");
   320	
   321	/**
   322	 * thermal_debug_cdev_state_update - Update a cooling device state change
   323	 *
   324	 * Computes a transition and the duration of the previous state residency.
   325	 *
   326	 * @cdev : a pointer to a cooling device
   327	 * @new_state: an integer corresponding to the new cooling device state
   328	 */
   329	void thermal_debug_cdev_state_update(const struct thermal_cooling_device *cdev,
   330					     int new_state)
   331	{
   332		struct thermal_debugfs *thermal_dbg = cdev->debugfs;
   333		struct cdev_debugfs *cdev_dbg;
   334		struct cdev_record *cdev_record;
   335		int transition, old_state;
   336	
   337		if (!thermal_dbg || (thermal_dbg->cdev_dbg.current_state == new_state))
   338			return;
   339	
   340		mutex_lock(&thermal_dbg->lock);
   341	
   342		cdev_dbg = &thermal_dbg->cdev_dbg;
   343	
   344		old_state = cdev_dbg->current_state;
   345	
   346		/*
   347		 * Get the old state information in the durations list. If
   348		 * this one does not exist, a new allocated one will be
   349		 * returned. Recompute the total duration in the old state and
   350		 * get a new timestamp for the new state.
   351		 */
   352		cdev_record = thermal_debugfs_cdev_record_get(thermal_dbg,
   353							      cdev_dbg->durations,
   354							      old_state);
   355		if (cdev_record) {
   356			ktime_t now = ktime_get();
   357			ktime_t delta = ktime_sub(now, cdev_dbg->timestamp);
   358			cdev_record->residency = ktime_add(cdev_record->residency, delta);
   359			cdev_dbg->timestamp = now;
   360		}
   361	
   362		cdev_dbg->current_state = new_state;
   363		transition = (old_state << 16) | new_state;
   364	
   365		/*
   366		 * Get the transition in the transitions list. If this one
   367		 * does not exist, a new allocated one will be returned.
   368		 * Increment the occurrence of this transition which is stored
   369		 * in the value field.
   370		 */
   371		cdev_record = thermal_debugfs_cdev_record_get(thermal_dbg,
   372							      cdev_dbg->transitions,
   373							      transition);
   374		if (cdev_record)
   375			cdev_record->count++;
   376	
   377		cdev_dbg->total++;
   378	
   379		mutex_unlock(&thermal_dbg->lock);
   380	}
   381	
   382	/**
   383	 * thermal_debug_cdev_add - Add a cooling device debugfs entry
   384	 *
   385	 * Allocates a cooling device object for debug, initializes the
   386	 * statistics and create the entries in sysfs.
   387	 * @cdev: a pointer to a cooling device
   388	 */
 > 389	void thermal_debug_cdev_add(struct thermal_cooling_device *cdev)
   390	{
   391		struct thermal_debugfs *thermal_dbg;
   392		struct cdev_debugfs *cdev_dbg;
   393		int i;
   394	
   395		thermal_dbg = thermal_debugfs_add_id(d_cdev, cdev->id);
   396		if (!thermal_dbg)
   397			return;
   398	
   399		cdev_dbg = &thermal_dbg->cdev_dbg;
   400	
   401		for (i = 0; i < CDEVSTATS_HASH_SIZE; i++) {
   402			INIT_LIST_HEAD(&cdev_dbg->transitions[i]);
   403			INIT_LIST_HEAD(&cdev_dbg->durations[i]);
   404		}
   405	
   406		cdev_dbg->current_state = 0;
   407		cdev_dbg->timestamp = ktime_get();
   408	
   409		debugfs_create_file("trans_table", 0400, thermal_dbg->d_top,
   410				    thermal_dbg, &tt_fops);
   411	
   412		debugfs_create_file("time_in_state_ms", 0400, thermal_dbg->d_top,
   413				    thermal_dbg, &dt_fops);
   414	
   415		debugfs_create_file("clear", 0200, thermal_dbg->d_top,
   416				    thermal_dbg, &cdev_clear_fops);
   417	
   418		debugfs_create_u32("total_trans", 0400, thermal_dbg->d_top,
   419				   &cdev_dbg->total);
   420	
   421		cdev->debugfs = thermal_dbg;
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
