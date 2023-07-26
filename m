Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEEEBE7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 15:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690383763; x=1721919763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDhr/qYQxvJqSnn5mnvpuX8xC61PZTnPHm46DXmKQcA=;
  b=jNIooWqkrMPodhK9dBAAqrvx7h/Wl8/rd6iRzVTY9GtLuQi1qvo59+PM
   YI/hEiMyKKa4xEUHYpBtnEUT0HotGkvnavbxDanoKmnc3Q1c9zQQFMIzM
   0u/0JTp8LXwCv3HwojzMa675Nfeq98bL9Zzi+/tCTcjVSvIf01qXBdyEm
   MxyDamgE+RTWUcSrrVBJS/n/iTL6Wi78kPGbB1nLbaRuyCrL5Xw8hOJmN
   u0CcpB7NsFDHzt74gh22hF5AkcTmAiwRjOxUyf2A2+OOsdaLxVFCYZX7z
   AfkQh4ThMKBcwSwj6ySYTWOuHTqTihScevacMqZ+UMI6YBCDPBicu9oWp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398972400"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="398972400"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 08:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="729889005"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="729889005"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 08:01:26 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOg0z-00012R-2b;
	Wed, 26 Jul 2023 15:01:25 +0000
Date: Wed, 26 Jul 2023 23:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 14396/28537]
 drivers/dma-buf/heaps/deferred-free-helper.c:23:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202307262224.BUTxZ1yV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   ba2c000ce64e01b59ef4c79ff5ff2ff12352e500
commit: e3919bfeb0066ab9b5f9765e5610b95672990e64 [14396/28537] ANDROID: dma-buf: system_heap: Add deferred freeing to the system heap
config: arm-randconfig-r092-20230726 (https://download.01.org/0day-ci/archive/20230726/202307262224.BUTxZ1yV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307262224.BUTxZ1yV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307262224.BUTxZ1yV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:23:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
>> drivers/dma-buf/heaps/deferred-free-helper.c:24:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +23 drivers/dma-buf/heaps/deferred-free-helper.c

bd1639945c3029 John Stultz 2020-12-09  20  
bd1639945c3029 John Stultz 2020-12-09  21  static LIST_HEAD(free_list);
bd1639945c3029 John Stultz 2020-12-09  22  static size_t list_nr_pages;
bd1639945c3029 John Stultz 2020-12-09 @23  wait_queue_head_t freelist_waitqueue;
bd1639945c3029 John Stultz 2020-12-09 @24  struct task_struct *freelist_task;
bd1639945c3029 John Stultz 2020-12-09  25  static DEFINE_SPINLOCK(free_list_lock);
bd1639945c3029 John Stultz 2020-12-09  26  

:::::: The code at line 23 was first introduced by commit
:::::: bd1639945c30298e4bea2b611d6b0cd08d3cdd98 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
