Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9238101F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690228148; x=1721764148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2Lz4tR8enmXsuW1I8MwOBRmd3eWxNpY4p1ulJniDYU=;
  b=D23cN1fROD5mk+6DYiX3sxVV66nUlnQU9jAzptWYccKAoMOl1Jxna8nO
   nRi6SZcfumqSv6ZPOlMugmjcRPshfHmEK3Wt0UWdkflKmMUrOCwkKqn8w
   wRU5oMkCWzNJFqZG6YwnNejzqyf3FkIbiubLjxqmat308FhIeDg4rnce0
   1J3hy0tydvozDolsC7XcehlXsNNrrUkaVDjqolkuPYFAgMG/Mg/bC6d1o
   n3+/sfc/2wHGZeS1Gos5LgDL/j2bAROTJy806sftgSp1K9Q+Fo53EhVGR
   cMLkaQhPidTzKRPgZ/OchqgRVzxArsPnmGtPcHf3aKaW4g9fq7RjS63Oi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367562699"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="367562699"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 12:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="760918335"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="760918335"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Jul 2023 12:49:06 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO1YI-0009zc-14;
	Mon, 24 Jul 2023 19:49:06 +0000
Date: Tue, 25 Jul 2023 03:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:ffa_notify 15/16]
 drivers/firmware/arm_ffa/test_driver.c:28:6: warning: no previous prototype
 for 'test_ffa_notif_cb'
Message-ID: <202307250326.Fka0amUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git ffa_notify
head:   50176e212a1e52a7fc37c2ea8f7e0d5937c62955
commit: 8fb5efdabdb94f98ab0fa1e1c5d34bb158953a03 [15/16] firmware: arm_ffa: Add test driver
config: arm64-randconfig-r031-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250326.Fka0amUp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250326.Fka0amUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250326.Fka0amUp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_ffa/test_driver.c:28:6: warning: no previous prototype for 'test_ffa_notif_cb' [-Wmissing-prototypes]
      28 | void test_ffa_notif_cb(u16 partition_id, int notification_id, void *data)
         |      ^~~~~~~~~~~~~~~~~


vim +/test_ffa_notif_cb +28 drivers/firmware/arm_ffa/test_driver.c

    26	
    27	
  > 28	void test_ffa_notif_cb(u16 partition_id, int notification_id, void *data)
    29	{
    30		pr_info("%x %x %p\n", partition_id, notification_id, data);
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
