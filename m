Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079D1FA1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 05:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692682642; x=1724218642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DRglu7gEzjQEdng5Oh3FCAu9jhvUccn8ja2amyuXcdU=;
  b=Fkny6Jf2wRvrDCpIUZHlRYzUrR/vR3g3+s+hQfHDNWSghAWGg5yEaimH
   vEOXUNemfgr8PzVe2N2sQA8NDhzz686UzH5mHf3gsQOO0yf68M/etJFXf
   HDYqWQMfQjdF4FDoFHDNPGSDNBFFGbmGi28Dpv5j9gcV/KB1gvuT5lls7
   d4LaUP+z9285FdJge83vnKtTc17Rvt/HUROw1SFAU01lu41f4gqEnKv3f
   vBnQYzD+Nm5YQerFZFCZhzFftPUOScQVK3d0iET3DVAcCnrffaaggEKxh
   TBLiF8Zmkk7OH/ugNeIWnhZSsH2rhHXxDo0SM1c1ZQoj8PHMMYgNoDhep
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372676363"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="372676363"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 22:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765616556"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="765616556"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 22:37:20 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYK3v-0001P9-1j;
	Tue, 22 Aug 2023 05:36:35 +0000
Date: Tue, 22 Aug 2023 13:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] fs/fuse/dev.c:213: warning:
 Function parameter or member 'sync' not described in
 'fuse_dev_wake_and_unlock'
Message-ID: <202308221307.W36QDdqS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3ca64f2c1d4a9c43702fb81c557480d6e43870f2
commit: 5de2ef69b64779f8103678858543491982c15453 [1/1] FROMLIST: fuse: give wakeup hints to the scheduler
config: i386-randconfig-063-20230821 (https://download.01.org/0day-ci/archive/20230822/202308221307.W36QDdqS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221307.W36QDdqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221307.W36QDdqS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/dev.c:213: warning: Function parameter or member 'fiq' not described in 'fuse_dev_wake_and_unlock'
>> fs/fuse/dev.c:213: warning: Function parameter or member 'sync' not described in 'fuse_dev_wake_and_unlock'
   fs/fuse/dev.c:213: warning: expecting prototype for A new request is available, wake fiq(). Prototype was for fuse_dev_wake_and_unlock() instead


vim +213 fs/fuse/dev.c

be2ff42c5d6ebc Kirill Tkhai    2018-09-11  207  
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  208  /**
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  209   * A new request is available, wake fiq->waitq
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  210   */
5de2ef69b64779 Pradeep P V K   2021-12-06  211  static void fuse_dev_wake_and_unlock(struct fuse_iqueue *fiq, bool sync)
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  212  __releases(fiq->lock)
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18 @213  {
5de2ef69b64779 Pradeep P V K   2021-12-06  214  	if (sync)
5de2ef69b64779 Pradeep P V K   2021-12-06  215  		wake_up_sync(&fiq->waitq);
5de2ef69b64779 Pradeep P V K   2021-12-06  216  	else
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  217  		wake_up(&fiq->waitq);
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  218  	kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  219  	spin_unlock(&fiq->lock);
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  220  }
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  221  

:::::: The code at line 213 was first introduced by commit
:::::: ae3aad77f46fbba56eff7141b2fc49870b60827e fuse: add fuse_iqueue_ops callbacks

:::::: TO: Stefan Hajnoczi <stefanha@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
