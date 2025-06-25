Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DBC29E0EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849071; cv=none; b=X3x6K5GelJvPn9HdBOv5LTJpKQmRglRUVwFHzU4bpmvSE2tkAAx5AiIIaDYbGpc3bAU6J4A/Y1MvoauCuR1Hf0gHeK5eFGi7xjOGHfRcvc8h5veKeVeEbJuZqzW9m5Iqnx/+DTP8EtduqpE+rpIB2H0tMvHfozzUUv6GcX90eWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849071; c=relaxed/simple;
	bh=5aqxeCEv09k6j/uRqJK2OmiTwnwxtqq0M+T6jCPHUsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ng2wyKLB2kf/aZxrf+aqb7zeuR0nYxuEqsLz0B5euurW3gqGMSQfGztEK5OsQwdNIEuOz+hGazDItDDRmtaBrapuHiTm/3x7NqKZDg2MmzuNvGdqSLSlwLwR7KMaHkkOSQN7fgu5poExj3fdmXhfvEPpz8zxS+PL+ypuUGaYgWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XK2m29Mk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XK2m29Mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750849069; x=1782385069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5aqxeCEv09k6j/uRqJK2OmiTwnwxtqq0M+T6jCPHUsE=;
  b=XK2m29MkDn8NKqvhMHxSYNxAW7wCEoP9/U7WJJ+XEz2qxUPpNpmTcQ34
   1c6S0ReONcXfMFt+kxkNZWoG3aTjflgbKw6y6RViO4AVZ031Old8dId6y
   1I+E2cVEUsbc//EM1JKyrbYUjerbRCRiZOEwRf6/3EjVlrelZZeRQ13Er
   gponiX87EPeuvB6R83x0j0dqWKYs3++eXQXGZtAbTzN7o9w4Obs9+XOxU
   aVCoiMVX7oXQ14X3n5P0FYpvp71sySyMVqA73Xb7ATDQJMMICxvzKYxgj
   QTbXmTSYkIakrrU5RcYZHop7OPUhyQwvtZ8eaL9kAH6BV0u4TgfRik9RK
   Q==;
X-CSE-ConnectionGUID: G/w/wmYGRJWgzUVuU8nNKA==
X-CSE-MsgGUID: SSdaBaQgT0qb5sP16kisnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63375583"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="63375583"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:57:49 -0700
X-CSE-ConnectionGUID: ZQ8Zvg2HTXaT1sacqBsDXg==
X-CSE-MsgGUID: s/BmbexISnCFxK1ji5hN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152705548"
Received: from igk-lkp-server01.igk.intel.com (HELO c09d3523614d) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jun 2025 03:57:47 -0700
Received: from kbuild by c09d3523614d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUNp3-000035-0s;
	Wed, 25 Jun 2025 10:57:45 +0000
Date: Wed, 25 Jun 2025 18:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] kernel/power/swap.c:1573: warning:
 Excess function parameter 'exclusive' description in 'swsusp_close'
Message-ID: <202506251843.aEp7bQiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3160da23afe10e66040ac00ed17174cb467c79b3
commit: 35143f27ceecf215984b938d1fe192e0e66e41b2 [2195/2195] PM: hibernate: Drop unused snapshot_test argument
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250625/202506251843.aEp7bQiU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251843.aEp7bQiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251843.aEp7bQiU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/swap.c:544: warning: Function parameter or member 'handle' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:891: warning: Function parameter or member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:1062: warning: Function parameter or member 'handle' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'nr_to_read' not described in 'load_image'
>> kernel/power/swap.c:1573: warning: Excess function parameter 'exclusive' description in 'swsusp_close'


vim +1573 kernel/power/swap.c

61159a314bca64 Rafael J. Wysocki 2006-03-23  1566  
61159a314bca64 Rafael J. Wysocki 2006-03-23  1567  /**
61159a314bca64 Rafael J. Wysocki 2006-03-23  1568   * swsusp_close - close swap device.
40d84e198b0ae6 Chen Yu           2023-09-06  1569   * @exclusive: Close the resume device which is exclusively opened.
61159a314bca64 Rafael J. Wysocki 2006-03-23  1570   */
61159a314bca64 Rafael J. Wysocki 2006-03-23  1571  
35143f27ceecf2 Jan Kara          2023-11-30  1572  void swsusp_close(void)
61159a314bca64 Rafael J. Wysocki 2006-03-23 @1573  {
7f17d15e3e01ac Jan Kara          2023-11-30  1574  	if (IS_ERR(hib_resume_bdev_handle)) {
64ec72a1ece37d Joe Perches       2017-09-27  1575  		pr_debug("Image device not initialised\n");
61159a314bca64 Rafael J. Wysocki 2006-03-23  1576  		return;
61159a314bca64 Rafael J. Wysocki 2006-03-23  1577  	}
61159a314bca64 Rafael J. Wysocki 2006-03-23  1578  
7f17d15e3e01ac Jan Kara          2023-11-30  1579  	bdev_release(hib_resume_bdev_handle);
61159a314bca64 Rafael J. Wysocki 2006-03-23  1580  }
1b29c1643c0d82 Vivek Goyal       2007-05-02  1581  

:::::: The code at line 1573 was first introduced by commit
:::::: 61159a314bca6408320c3173c1282c64f5cdaa76 [PATCH] swsusp: separate swap-writing/reading code

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
