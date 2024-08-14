Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB6111A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 02:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723604112; cv=none; b=pfetztKMCQNv62vGZcX+1LoDIsS95jhtFpXVUph2qhe5Drl3D/BjhUboeAz/NUGk3h+JR3psWGO8wukrg5r/2lbxJd3ZmdwEtKxqdBl47kzJBjtmumKfER/5sePk4qyzXDRjlwoPEkqLxEZ+Oljb+9mVC5nxJHS9nuShZhNs9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723604112; c=relaxed/simple;
	bh=LdSDm2qpnkYraee0XF/OkV3Dj1QKNRLGexRgSyXIXEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fji5IE/L/pTCvrts+GfLxfZmtRMsPNtpWYXHMz8+CwAWjSjZ2wLCoegtb7mUrxpD0njbgeWbBXifv3399YfUsLYq9n8iKWoubOhwCGXhPBxXlPpaMDCht24Z6PWn38dh8XWUXaDZdJ/avZc9wD9ZlPVqbrMyHCeCjOa5o6NopJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYqXQ9ko; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYqXQ9ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723604111; x=1755140111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LdSDm2qpnkYraee0XF/OkV3Dj1QKNRLGexRgSyXIXEc=;
  b=OYqXQ9kowO8OONTTnJceATAhnwQvFfXsz5HLq4Mra4vV/xAxoQN1iJ1U
   Gc6+7ZwRBNqNzlpFz0E+xB37O8b/HI6Oi+JtbT/EA+c3LSEVE1xhzjawh
   /s0VXV6GazjoQbq7voMq4LvWq9s7z720QolJWoE4SWNTap9VvgpmMLCTl
   X1uiYu3Npfku4/9z4q6XP0hOnSHEHmKdv4QaIFZoiOd3L6NaydFlEKaYC
   Y9E5blW3zFYtpzBO2SGlMHjdhzFx8/BUyk4ywtjc56ROl1VpKoz9TGIhu
   dfULsz9f/Sx+4YNd/SwGOh9uuvF+Ntnj/g7vY2QMDwQlpU1qhqETo/O10
   g==;
X-CSE-ConnectionGUID: 7bNb3qHNSwyrLGVmCBzhWQ==
X-CSE-MsgGUID: He/TfiUeTquk8jr+AAEhbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21440396"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="21440396"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 19:55:09 -0700
X-CSE-ConnectionGUID: uOCPIUg2SMyfuRljXs7oOg==
X-CSE-MsgGUID: HiHaPtvTTgKjhXLyQFR2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="96387473"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2024 19:55:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se4AD-00012E-0b;
	Wed, 14 Aug 2024 02:55:05 +0000
Date: Wed, 14 Aug 2024 10:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 7/46]
 drivers/firmware/psci/psci_checker.c:401:48: warning: too many arguments for
 format
Message-ID: <202408141012.KhvKaxoh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   c61d91d0986f5e0053b7b6ab6edcf67d85b8b52b
commit: 1e17d54446b96380fb5c0c22e6a29ec2706b7ce4 [7/46] kthread: allow vararg kthread_{create,run}_on_cpu()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240814/202408141012.KhvKaxoh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141012.KhvKaxoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141012.KhvKaxoh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/psci/psci_checker.c:15:
   drivers/firmware/psci/psci_checker.c: In function 'suspend_tests':
>> drivers/firmware/psci/psci_checker.c:401:48: warning: too many arguments for format [-Wformat-extra-args]
     401 |                                                "psci_suspend_test");
         |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:36:54: note: in definition of macro 'kthread_create_on_cpu'
      36 |         __kthread_create_on_cpu(threadfn, data, cpu, namefmt,              \
         |                                                      ^~~~~~~


vim +401 drivers/firmware/psci/psci_checker.c

ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  366  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  367  static int suspend_tests(void)
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  368  {
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  369  	int i, cpu, err = 0;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  370  	struct task_struct **threads;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  371  	int nb_threads = 0;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  372  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  373  	threads = kmalloc_array(nb_available_cpus, sizeof(*threads),
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  374  				GFP_KERNEL);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  375  	if (!threads)
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  376  		return -ENOMEM;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  377  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  378  	/*
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  379  	 * Stop cpuidle to prevent the idle tasks from entering a deep sleep
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  380  	 * mode, as it might interfere with the suspend threads on other CPUs.
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  381  	 * This does not prevent the suspend threads from using cpuidle (only
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  382  	 * the idle tasks check this status). Take the idle lock so that
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  383  	 * the cpuidle driver and device look-up can be carried out safely.
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  384  	 */
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  385  	cpuidle_pause_and_lock();
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  386  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  387  	for_each_online_cpu(cpu) {
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  388  		struct task_struct *thread;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  389  		/* Check that cpuidle is available on that CPU. */
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  390  		struct cpuidle_device *dev = per_cpu(cpuidle_devices, cpu);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  391  		struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  392  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  393  		if (!dev || !drv) {
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  394  			pr_warn("cpuidle not available on CPU %d, ignoring\n",
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  395  				cpu);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  396  			continue;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  397  		}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  398  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  399  		thread = kthread_create_on_cpu(suspend_test_thread,
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  400  					       (void *)(long)cpu, cpu,
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08 @401  					       "psci_suspend_test");
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  402  		if (IS_ERR(thread))
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  403  			pr_err("Failed to create kthread on CPU %d\n", cpu);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  404  		else
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  405  			threads[nb_threads++] = thread;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  406  	}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  407  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  408  	if (nb_threads < 1) {
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  409  		err = -ENODEV;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  410  		goto out;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  411  	}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  412  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  413  	atomic_set(&nb_active_threads, nb_threads);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  414  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  415  	/*
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  416  	 * Wake up the suspend threads. To avoid the main thread being preempted
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  417  	 * before all the threads have been unparked, the suspend threads will
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  418  	 * wait for the completion of suspend_threads_started.
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  419  	 */
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  420  	for (i = 0; i < nb_threads; ++i)
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  421  		wake_up_process(threads[i]);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  422  	complete_all(&suspend_threads_started);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  423  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  424  	wait_for_completion(&suspend_threads_done);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  425  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  426  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  427  	/* Stop and destroy all threads, get return status. */
92e074acf6f769 drivers/firmware/psci/psci_checker.c Jean-Philippe Brucker 2019-06-10  428  	for (i = 0; i < nb_threads; ++i) {
92e074acf6f769 drivers/firmware/psci/psci_checker.c Jean-Philippe Brucker 2019-06-10  429  		err += kthread_park(threads[i]);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  430  		err += kthread_stop(threads[i]);
92e074acf6f769 drivers/firmware/psci/psci_checker.c Jean-Philippe Brucker 2019-06-10  431  	}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  432   out:
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  433  	cpuidle_resume_and_unlock();
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  434  	kfree(threads);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  435  	return err;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  436  }
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  437  

:::::: The code at line 401 was first introduced by commit
:::::: ea8b1c4a6019fb96ca8301f0b3ffcb13fb1cd0ae drivers: psci: PSCI checker module

:::::: TO: Kevin Brodsky <kevin.brodsky@arm.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
