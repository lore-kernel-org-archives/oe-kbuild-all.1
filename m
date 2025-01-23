Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE890200B8C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737615611; cv=none; b=V0fhmOtmUPUUFYB+v//e74+VKb9NmBKBYY2ialVt5pfqyVXWdT4Y+c+A57ik5r9pvUw0C64ouxxxIGtuJ2o9GV0UesdwlJkkdSytL/aaPcApMiIa18wSJZmUJ2sTfjiZtDXlU/t2k/3ET6EtyfRKude38JfE5AdCbKTYvNhr7xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737615611; c=relaxed/simple;
	bh=kS4RzeOpRXl6IG+eqBVepRaT+klnaSo0/a4onyerHaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q3cN8pj7Af+M+cnidk2EajHYgbMxIx40EGPs+LWRsZbFXELF4OuTQ5iuvOHiO9fUzu83vF16PJ8lDpwRSO83Q30SBumM7Jd50JlbTWRU8kAZ6AwcmXLrg2WmprTnTWQfmK3CIVw/n18w/3kSU+sG19Q7awFBMbykge5oiKzRwjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A12RKg7a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A12RKg7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737615609; x=1769151609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kS4RzeOpRXl6IG+eqBVepRaT+klnaSo0/a4onyerHaA=;
  b=A12RKg7aeOAYicZQK2yNS/5/CBmPWCRS/8p66OsSX02Mayh1oXmOoiNy
   U3PzNjFS23RV0ntnWDQIbkoB5VOSzDdk7EbwTx8P0u0ScRw1uOBFKGIXj
   xGAp5nzoUIQpQlWdJjfHR/j/exOv8dmg7gY3nPRk2pEYb7erBa5dUnzGX
   9t4/vtLq9AnnKyjdfkDdPeV75ynJfw0uhHBXUe1cgRdrxkrjierkUXDbV
   z3p87IbFewYZW8pZhKLNK84LvUAVgBJb4yVM4snSDEE1Iv9/OT69sibD3
   DtZmIziqjIPz9QbvzFADA542L3QknpE2BddrFI+8EKNGD+RAzepDwWoQg
   Q==;
X-CSE-ConnectionGUID: EzvZyXUiRj+Az3y8RdTu9A==
X-CSE-MsgGUID: 50f6k37RTHa7RaOc7ZJpAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="63450311"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="63450311"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:00:08 -0800
X-CSE-ConnectionGUID: WSC3ra2tSzGFjx+kP5enmw==
X-CSE-MsgGUID: t7l2Fz9ySI+SMoSbDFSSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112343451"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 23:00:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tarC7-000arG-2u;
	Thu, 23 Jan 2025 07:00:03 +0000
Date: Thu, 23 Jan 2025 14:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/base/power/runtime.c:362: warning: Excess function parameter
 'dev' description in '__rpm_callback'
Message-ID: <202501231452.84vwjQqo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21266b8df5224c4f677acf9f353eecc9094731f0
commit: 7be6a87c2473957090995b7eb541e31d57a2c801 sparc: allow PM configs for sparc32 COMPILE_TEST
date:   1 year, 11 months ago
config: sparc-randconfig-r032-20230416 (https://download.01.org/0day-ci/archive/20250123/202501231452.84vwjQqo-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231452.84vwjQqo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231452.84vwjQqo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/runtime.c:362: warning: Excess function parameter 'dev' description in '__rpm_callback'


vim +362 drivers/base/power/runtime.c

21d5c57b372616 Rafael J. Wysocki 2016-10-30  354  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  355  /**
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  356   * __rpm_callback - Run a given runtime PM callback for a given device.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  357   * @cb: Runtime PM callback to run.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  358   * @dev: Device to run the callback for.
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  359   */
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  360  static int __rpm_callback(int (*cb)(struct device *), struct device *dev)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  361  	__releases(&dev->power.lock) __acquires(&dev->power.lock)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27 @362  {
63d00be69348fd Ulf Hansson       2021-06-08  363  	int retval = 0, idx;
0cab893f409c53 Rafael J. Wysocki 2021-03-19  364  	bool use_links = dev->power.links_count > 0;
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  365  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  366  	if (dev->power.irq_safe) {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  367  		spin_unlock(&dev->power.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  368  	} else {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  369  		spin_unlock_irq(&dev->power.lock);
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  370  
0cab893f409c53 Rafael J. Wysocki 2021-03-19  371  		/*
0cab893f409c53 Rafael J. Wysocki 2021-03-19  372  		 * Resume suppliers if necessary.
0cab893f409c53 Rafael J. Wysocki 2021-03-19  373  		 *
0cab893f409c53 Rafael J. Wysocki 2021-03-19  374  		 * The device's runtime PM status cannot change until this
0cab893f409c53 Rafael J. Wysocki 2021-03-19  375  		 * routine returns, so it is safe to read the status outside of
0cab893f409c53 Rafael J. Wysocki 2021-03-19  376  		 * the lock.
0cab893f409c53 Rafael J. Wysocki 2021-03-19  377  		 */
0cab893f409c53 Rafael J. Wysocki 2021-03-19  378  		if (use_links && dev->power.runtime_status == RPM_RESUMING) {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  379  			idx = device_links_read_lock();
21d5c57b372616 Rafael J. Wysocki 2016-10-30  380  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  381  			retval = rpm_get_suppliers(dev);
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  382  			if (retval) {
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  383  				rpm_put_suppliers(dev);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  384  				goto fail;
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  385  			}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  386  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  387  			device_links_read_unlock(idx);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  388  		}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  389  	}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  390  
63d00be69348fd Ulf Hansson       2021-06-08  391  	if (cb)
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  392  		retval = cb(dev);
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  393  
21d5c57b372616 Rafael J. Wysocki 2016-10-30  394  	if (dev->power.irq_safe) {
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  395  		spin_lock(&dev->power.lock);
0cab893f409c53 Rafael J. Wysocki 2021-03-19  396  	} else {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  397  		/*
0cab893f409c53 Rafael J. Wysocki 2021-03-19  398  		 * If the device is suspending and the callback has returned
0cab893f409c53 Rafael J. Wysocki 2021-03-19  399  		 * success, drop the usage counters of the suppliers that have
0cab893f409c53 Rafael J. Wysocki 2021-03-19  400  		 * been reference counted on its resume.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  401  		 *
0cab893f409c53 Rafael J. Wysocki 2021-03-19  402  		 * Do that if resume fails too.
21d5c57b372616 Rafael J. Wysocki 2016-10-30  403  		 */
dbfa44782787dc Rafael J. Wysocki 2022-12-05  404  		if (use_links &&
dbfa44782787dc Rafael J. Wysocki 2022-12-05  405  		    ((dev->power.runtime_status == RPM_SUSPENDING && !retval) ||
dbfa44782787dc Rafael J. Wysocki 2022-12-05  406  		    (dev->power.runtime_status == RPM_RESUMING && retval))) {
21d5c57b372616 Rafael J. Wysocki 2016-10-30  407  			idx = device_links_read_lock();
21d5c57b372616 Rafael J. Wysocki 2016-10-30  408  
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  409  			__rpm_put_suppliers(dev, false);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  410  
5244f5e2d80125 Rafael J. Wysocki 2021-03-19  411  fail:
21d5c57b372616 Rafael J. Wysocki 2016-10-30  412  			device_links_read_unlock(idx);
0cab893f409c53 Rafael J. Wysocki 2021-03-19  413  		}
21d5c57b372616 Rafael J. Wysocki 2016-10-30  414  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  415  		spin_lock_irq(&dev->power.lock);
21d5c57b372616 Rafael J. Wysocki 2016-10-30  416  	}
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  417  
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  418  	return retval;
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  419  }
ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  420  

:::::: The code at line 362 was first introduced by commit
:::::: ad3c36a534bc7b945d7bffdda1c62e13bf93489a PM / Runtime: Don't run callbacks under lock for power.irq_safe set

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
