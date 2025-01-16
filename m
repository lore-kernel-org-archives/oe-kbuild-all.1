Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72B18FC8F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 21:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062824; cv=none; b=ScVoW5iqsAKbpnEXRSJqjt0iLmFar86ghfDv87HFumDuEOgo7fa31JiDzz8EAu0zG7WsuZBcilJyEFIFKRKvgHxfzJLpbnq7Aur7dZ2rqOa8nnxsfa2yFONrpG0fEVOO5MF/WLyGYyKq0P5NEgxSzrzv/h10pDp8E6LXW1e6L04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062824; c=relaxed/simple;
	bh=93oEH8Pqq0gVb+Uk3KB/z14fVhdzTWsatr2gYVHK6WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ONbuP1joetDoPbh5hVziGNm+3YMgzbAft+Es/c/OPBwK34+UZdREJIWui0XCp+3J+fqrjjR8supXZzb3LzAyPsGV99Sj522h2SfDLVn33teG75/8Gp+f1DZW51HelMvJK/G2zoSZpaG0rRqlrrtc+2zFHQMic8Lm/RQxGuo847c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQU6fA7V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQU6fA7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737062822; x=1768598822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=93oEH8Pqq0gVb+Uk3KB/z14fVhdzTWsatr2gYVHK6WQ=;
  b=iQU6fA7VmlKddB4bTHrgg4xXBpjWhsctselez0hbv9vqCQdn/8bplN35
   0W8FgmnD6S8ALvBM9lIvF0FZgUEw8tErRPfJOa6813ncTFqGEsrtbhQ+A
   01X/dPDobeLthN2nDN8MxOBwM4X0BcabG92pbKKXX+k5SI4Ysx4vgQQFJ
   ruMTfU+hx9X1LJ/UmiX9j/js7oUYDffNGyBdHlqkmm2l+cRamkqRt06Mn
   Uiz5HP7tbd2NQjRraivi3bqh2+2uvdsJKlD5db+tECwmpy57a694W6ayW
   +f0G5q2052AIpCTJc0/o1B2FUP9H65EwP3LkvFmHlBWJtaEzZb7Lu4QLx
   w==;
X-CSE-ConnectionGUID: am3O7kPaQE6KIru7ZG60Aw==
X-CSE-MsgGUID: fSWzyydAS5akGMGJy8Ka7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="47964708"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="47964708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 13:27:01 -0800
X-CSE-ConnectionGUID: 6raT0pPmTre4Fsm8CODajg==
X-CSE-MsgGUID: uSzYTcYqRNKgXhybaKhJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="106159823"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2025 13:26:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYXOD-000SPR-1C;
	Thu, 16 Jan 2025 21:26:57 +0000
Date: Fri, 17 Jan 2025 05:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: drivers/base/power/runtime.c:327: warning: Excess function parameter
 'dev' description in '__rpm_callback'
Message-ID: <202501170517.Yh3M5gyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce69b4019001407f9cd738dd2ba217b3a8ab831b
commit: 92dcd3d31843fbe1a95d880dc912e1f6beac6632 um: Allow PM with suspend-to-idle
date:   4 years, 1 month ago
config: um-randconfig-r052-20240430 (https://download.01.org/0day-ci/archive/20250117/202501170517.Yh3M5gyd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501170517.Yh3M5gyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501170517.Yh3M5gyd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/runtime.c:327: warning: Excess function parameter 'dev' description in '__rpm_callback'
   drivers/base/power/runtime.c:926: warning: Function parameter or struct member 'timer' not described in 'pm_suspend_timer_fn'
   drivers/base/power/runtime.c:926: warning: Excess function parameter 'data' description in 'pm_suspend_timer_fn'


vim +327 drivers/base/power/runtime.c

21d5c57b372616 Rafael J. Wysocki 2016-10-30  319  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  320  /**
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  321   * __rpm_callback - Run a given runtime PM callback for a given device.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  322   * @cb: Runtime PM callback to run.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  323   * @dev: Device to run the callback for.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  324   */
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  325  static int __rpm_callback(int (*cb)(struct device *), struct device *dev)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  326  	__releases(&dev->power.lock) __acquires(&dev->power.lock)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27 @327  {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  328  	int retval, idx;
baa8809f60971d Rafael J. Wysocki 2016-10-30  329  	bool use_links = dev->power.links_count > 0;
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  330  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  331  	if (dev->power.irq_safe) {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  332  		spin_unlock(&dev->power.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  333  	} else {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  334  		spin_unlock_irq(&dev->power.lock);
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  335  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  336  		/*
21d5c57b372616 Rafael J. Wysocki 2016-10-30  337  		 * Resume suppliers if necessary.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  338  		 *
21d5c57b372616 Rafael J. Wysocki 2016-10-30  339  		 * The device's runtime PM status cannot change until this
21d5c57b372616 Rafael J. Wysocki 2016-10-30  340  		 * routine returns, so it is safe to read the status outside of
21d5c57b372616 Rafael J. Wysocki 2016-10-30  341  		 * the lock.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  342  		 */
baa8809f60971d Rafael J. Wysocki 2016-10-30  343  		if (use_links && dev->power.runtime_status == RPM_RESUMING) {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  344  			idx = device_links_read_lock();
21d5c57b372616 Rafael J. Wysocki 2016-10-30  345  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  346  			retval = rpm_get_suppliers(dev);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  347  			if (retval)
21d5c57b372616 Rafael J. Wysocki 2016-10-30  348  				goto fail;
21d5c57b372616 Rafael J. Wysocki 2016-10-30  349  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  350  			device_links_read_unlock(idx);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  351  		}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  352  	}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  353  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  354  	retval = cb(dev);
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  355  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  356  	if (dev->power.irq_safe) {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  357  		spin_lock(&dev->power.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  358  	} else {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  359  		/*
21d5c57b372616 Rafael J. Wysocki 2016-10-30  360  		 * If the device is suspending and the callback has returned
21d5c57b372616 Rafael J. Wysocki 2016-10-30  361  		 * success, drop the usage counters of the suppliers that have
21d5c57b372616 Rafael J. Wysocki 2016-10-30  362  		 * been reference counted on its resume.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  363  		 *
21d5c57b372616 Rafael J. Wysocki 2016-10-30  364  		 * Do that if resume fails too.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  365  		 */
baa8809f60971d Rafael J. Wysocki 2016-10-30  366  		if (use_links
baa8809f60971d Rafael J. Wysocki 2016-10-30  367  		    && ((dev->power.runtime_status == RPM_SUSPENDING && !retval)
baa8809f60971d Rafael J. Wysocki 2016-10-30  368  		    || (dev->power.runtime_status == RPM_RESUMING && retval))) {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  369  			idx = device_links_read_lock();
21d5c57b372616 Rafael J. Wysocki 2016-10-30  370  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  371   fail:
21d5c57b372616 Rafael J. Wysocki 2016-10-30  372  			rpm_put_suppliers(dev);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  373  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  374  			device_links_read_unlock(idx);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  375  		}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  376  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  377  		spin_lock_irq(&dev->power.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  378  	}
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  379  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  380  	return retval;
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  381  }
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  382  

:::::: The code at line 327 was first introduced by commit
:::::: ad3c36a534bc7b945d7bffdda1c62e13bf93489a PM / Runtime: Don't run callbacks under lock for power.irq_safe set

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
