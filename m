Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA36FB0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735824999; cv=none; b=pcRw2pdFTLD35LZKJNnFUP62ri2tClxAUeRG4V/spUOhdlyX15FJqO41vKY+ACEVSmRSPI3L/XRahmuQozTmfRERH5WsF12NngKU+7ZZB4dNVbemJHqf/7wpGH12U7+NCIUV9hWEE6FFvpewUnQI/b7CmIiVEe35JPkh3JDR3d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735824999; c=relaxed/simple;
	bh=HS346cvJsT1YM+I7lRPcIcKrBV2EwiEr8a2OaCUZDJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LO3/j2flIA8HSw+kyoso3H9BS8N/2kjR8FA4mD75QmtRqeHJSwQj191WWifjlBhUklS9+r7U1xwrDU22aV4itkcit9E202LuOJeqVPVvaiSrbg1BDAlnNf1IZdgAokSXbKWgRe77ws34/RUL+HwStKT3Yd2MYZtUurdJcxe/gy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAjr8LCO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAjr8LCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735824998; x=1767360998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HS346cvJsT1YM+I7lRPcIcKrBV2EwiEr8a2OaCUZDJ8=;
  b=iAjr8LCOZyGfJLRBexDaoHx9nHxOFGVssIXjjFCDtaqFP2qtusj6ases
   BgWiKJcfEV8t85/VbK++9mOK1eW29INg0es5XiqWNiMlfaei7QyeBnUHs
   07fmu+2hioeI+5ZbvQaGnd1ZP023vo02p3nU6dFYLftUTE3IM/EoGWed2
   EqIDME7QXaZRC30FZ8ApGUBg05ap3fOxhmWB4R1icP9Y7O/UA7qtHCKI4
   xwBxj68yutpr+AWx668ty4xxIwF8dV+ypAMl01P0gMKFNvoUDSQ4JW2Ka
   mqFE9ExC44n4gH22drZzZu6UiJrQsSOH5OaelYjZdrD683LUpjsBrbTgi
   g==;
X-CSE-ConnectionGUID: F7YTN0RoTvaSjfVzuoNX6w==
X-CSE-MsgGUID: 9LtOITlmSmaWzDnJgDxWBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="39826964"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="39826964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 05:36:37 -0800
X-CSE-ConnectionGUID: tOEvnI4YQje2lmQZTj+ZhQ==
X-CSE-MsgGUID: dXiRsS3GRZOLIopbo8yQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105561088"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jan 2025 05:36:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTLNJ-0008Wj-1s;
	Thu, 02 Jan 2025 13:36:33 +0000
Date: Thu, 2 Jan 2025 21:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: drivers/base/power/runtime.c:327: warning: Excess function parameter
 'dev' description in '__rpm_callback'
Message-ID: <202501022150.vaVXWOxZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56e6a3499e14716b9a28a307bb6d18c10e95301e
commit: 92dcd3d31843fbe1a95d880dc912e1f6beac6632 um: Allow PM with suspend-to-idle
date:   4 years, 1 month ago
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20250102/202501022150.vaVXWOxZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022150.vaVXWOxZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501022150.vaVXWOxZ-lkp@intel.com/

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
