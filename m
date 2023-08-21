Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006712B84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 21:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692655056; x=1724191056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KurqtGvG1RLLdaby8sE94uNPQFACSdkTRi+TLKYGxv0=;
  b=UfpsSVlJJ8yzjpAJFKVABkv0n+DHk8oFA19anC2StF3PqfYIdWVXTlaR
   CACHMJ8BhHjf3IvdwLwM1YzUUt8/D7cwju5kb+sxV2C11yHyprnswDgOf
   yQmD71aPiPcmwIPOAST9/AUhlkmw0UOQyk7jWO6jgCggjsReHPn1spBSY
   Znpt05/GAHe9PYH91Tzji2c2fudLDoKmxLTRDIZTi0KycF4RI9cxK83h1
   Q4r9gftcAGGUv7FAdYQsSdlZGlHOkAQSDyoJL7gRXgtkcfNewutXxRLPu
   9JlvHSFqo7gl+e4HzIJf9mvq1FE+QzWpTB2aoLPYe3k4iaJfdNrOZo+n7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358696488"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="358696488"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 14:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712918941"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="712918941"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 14:57:35 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYCty-0000z2-0z;
	Mon, 21 Aug 2023 21:57:34 +0000
Date: Tue, 22 Aug 2023 05:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202308220539.quOFMSwZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Isaac,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3ca64f2c1d4a9c43702fb81c557480d6e43870f2
commit: 811cea558ee8a321fdfa5051549ebf76b4f6cacb [2/2] ANDROID: Allow the deferred-free library heap to be compiled into the GKI
config: i386-randconfig-061-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220539.quOFMSwZ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220539.quOFMSwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220539.quOFMSwZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
>> drivers/dma-buf/heaps/deferred-free-helper.c:22:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +21 drivers/dma-buf/heaps/deferred-free-helper.c

18b754f7ce7e6b John Stultz 2020-12-09  18  
18b754f7ce7e6b John Stultz 2020-12-09  19  static LIST_HEAD(free_list);
18b754f7ce7e6b John Stultz 2020-12-09  20  static size_t list_nr_pages;
18b754f7ce7e6b John Stultz 2020-12-09 @21  wait_queue_head_t freelist_waitqueue;
18b754f7ce7e6b John Stultz 2020-12-09 @22  struct task_struct *freelist_task;
18b754f7ce7e6b John Stultz 2020-12-09  23  static DEFINE_SPINLOCK(free_list_lock);
18b754f7ce7e6b John Stultz 2020-12-09  24  

:::::: The code at line 21 was first introduced by commit
:::::: 18b754f7ce7e6b09a08af9cfdbfcefeee9e54e08 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Alistair Delva <adelva@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
