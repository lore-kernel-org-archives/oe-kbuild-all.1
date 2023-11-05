Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7741FD8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnImc/3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699167256; x=1730703256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AGFV7JSj+96fP0Wp//HYROH4LgPMzTCl6CUJnuxa3YM=;
  b=FnImc/3FhU12c0om0HQGgaAF4EdE69e03v9SdzFqTAQMngMc4TM5gWM4
   8Iw3I+tT5loSAGrz7OouIf0Xj2C4aCqIqJp7QKaO7ee7vYtZDlwhECFJw
   WVvUR8JJkDv9yh9vdU6d0zId7LCDjDcdQXIV4N/nEv7euAFueOtD8dXh0
   tDd5rIzeEC4d/5m7LYNXzgV+goK9qwGQ+zvEsP2sPuiu1ZRPHIGBqZI/k
   reCJ9tHbZFaI2Kenhlh/OCtMYpuIIRwdaapsHmk5zStE8XUhQBZmpdfIu
   z+c9UMS+ppbBE4qxxYNxLa2nI/YZe1Vh57T1VmWpNUAGB7xB/Z9JFM3AY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="10665642"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="10665642"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 23:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="885599600"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="885599600"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Nov 2023 23:54:14 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzX1Q-00058W-1W;
	Sun, 05 Nov 2023 06:54:12 +0000
Date: Sun, 5 Nov 2023 14:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2023-08 6922/11247]
 drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202311051433.bnHeXbKQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2023-08
head:   a9009a450f1a91d7e3fc35cedcd18f9fc9d9572e
commit: fe58c121167255eef7b234d6d1193281d2c8f5e6 [6922/11247] ANDROID: Allow the deferred-free library heap to be compiled into the GKI
config: x86_64-randconfig-122-20231103 (https://download.01.org/0day-ci/archive/20231105/202311051433.bnHeXbKQ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051433.bnHeXbKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051433.bnHeXbKQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
>> drivers/dma-buf/heaps/deferred-free-helper.c:22:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +21 drivers/dma-buf/heaps/deferred-free-helper.c

bb97bfd3d8e88c John Stultz 2020-12-09  18  
bb97bfd3d8e88c John Stultz 2020-12-09  19  static LIST_HEAD(free_list);
bb97bfd3d8e88c John Stultz 2020-12-09  20  static size_t list_nr_pages;
bb97bfd3d8e88c John Stultz 2020-12-09 @21  wait_queue_head_t freelist_waitqueue;
bb97bfd3d8e88c John Stultz 2020-12-09 @22  struct task_struct *freelist_task;
bb97bfd3d8e88c John Stultz 2020-12-09  23  static DEFINE_SPINLOCK(free_list_lock);
bb97bfd3d8e88c John Stultz 2020-12-09  24  

:::::: The code at line 21 was first introduced by commit
:::::: bb97bfd3d8e88ca18b975460a5a2217c9b45a1b0 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: T.J. Mercier <tjmercier@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
