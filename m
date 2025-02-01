Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8BF1ADC7D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 18:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738433986; cv=none; b=Znfi9U8ABvJYZu2li7SI7Kx6N6jyfupOQODSkOgIGuwG/FJ6u7hiWbpH3Hxj+h1HWYMYG2Kw5FFq2B+0k8bYceWmPNDM6/ICBDhGCEb4FrkOVUkf6Wi60gN42UiRyMu0x6YL9kiY16huZLXkxepwSscH4EhpTajwtS3Jnr8UGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738433986; c=relaxed/simple;
	bh=cEsvlddOWOL3p2Igdlzu3Rr6UyTCPznBMLZs3l8bePc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8K8/+P72ypt+jLDO5Pave+lQXbdixVFc9MbxRxNbj/JRreYr+Z84O2ZZEY0FfWAyUktYOpTWsL1xAZPf77u74WUnIl0+CCpazt35QmOQLEnLdJ7d3lPmxdaXIYi5Qv52FgsC1QhFIX8Nd65WddewgBUI04F87Xt7ZSXGL53XuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtSMOlWR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtSMOlWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738433984; x=1769969984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEsvlddOWOL3p2Igdlzu3Rr6UyTCPznBMLZs3l8bePc=;
  b=XtSMOlWRXxpP/bvG70vibLD+09a592cyJ2odLczaM+jlk6wN0fW+UzWO
   tZAfqiO2gte+xWnzusVfs3nhzQ9wLcHbN0oVYccG+f3QQwqRf0Y6B+6gA
   Of+DuCKF0CTHgQ1yk2ZUE+5dBdjXCWCM94AUkohCz/YJSBYfJnPAcC3eB
   OvmaoZ/z9txehhy0Y9w/jPPkH26Ot2lUz8W475zxex/cpHdR94ryc23EY
   Nr1ZFoJ96tq+Tq8rTaV188mjJu+lm9ymXpY4Wmg4rP5YFb4rLIp6yZbfF
   sAsEMoEsMrAybeCdfUQMvZliUNGGt28qeSNofu9nd0ejdgPJ5cQkYzXrM
   w==;
X-CSE-ConnectionGUID: Q5UD2EHcTSm4JKNc2ltLYQ==
X-CSE-MsgGUID: 3niS2AteSDC7HGjBAkeZRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42632151"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="42632151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 10:19:43 -0800
X-CSE-ConnectionGUID: e/pBFCDxSZyF7A3jqen6JQ==
X-CSE-MsgGUID: TZAwp8mASS+taKofefEbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147110975"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Feb 2025 10:19:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teI5k-000oRj-1s;
	Sat, 01 Feb 2025 18:19:40 +0000
Date: Sun, 2 Feb 2025 02:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-epoll-wait 8/9] io_uring.c:undefined reference
 to `io_epoll_wait_remove_all'
Message-ID: <202502020227.V9uUvVq8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-epoll-wait
head:   edbffb871c292e33a1bb07bc0acfcbf0d36b88ff
commit: 9ffd1a7ad787d12758fe797d971dfb7a15284378 [8/9] io_uring/epoll: add support for IORING_OP_EPOLL_WAIT
config: csky-randconfig-001-20250202 (https://download.01.org/0day-ci/archive/20250202/202502020227.V9uUvVq8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020227.V9uUvVq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020227.V9uUvVq8-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: io_uring/io_uring.o: in function `io_uring_try_cancel_requests':
>> io_uring.c:(.text.unlikely+0x3380): undefined reference to `io_epoll_wait_remove_all'
>> csky-linux-ld: io_uring.c:(.text.unlikely+0x3470): undefined reference to `io_epoll_wait_remove_all'
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
