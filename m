Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE377499
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8lL+O7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698997393; x=1730533393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JM/XSNWPqAt2NdYz9Hrm5zafdpzjnnUpchnkmNJ+rtg=;
  b=j8lL+O7PpZ7WFW1nB+77ZhQJHSuHCIyNLrHrcedfGyNWFx6YTpA3QePc
   F0oGbiHm0kRDknNwE1q2OIMNGP/4ju/CKpDfWozGl73UfVQyqibA9MRCN
   LKe7xtA63UuA9XSKMeedHe+okCld6Ttw+f+TEtSSRazuEGph1qhhPktfC
   uoVi94n6gdQnGYXvREuNPFCUt1CQ6kNDWoXYlVCWgV4FO2hpH4gg817uE
   wqnDx/GAiccFlA5C8qA28rqUm10RkjA9jCWSXA8iDNT6y6ZDemanZMJga
   /WPd7gyQTTpZQXAy/NfRx6g8TMECHMLLO520cTw7UzYLaaV1WPy3J8V2W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="392777061"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="392777061"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 00:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008734284"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1008734284"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Nov 2023 00:43:05 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyopb-0002LU-0I;
	Fri, 03 Nov 2023 07:43:03 +0000
Date: Fri, 3 Nov 2023 15:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1587/30000]
 drivers/md/dm-user.c:539:5: warning: no previous prototype for 'target_poll'
Message-ID: <202311031534.p92hN9Hw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Palmer,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2fea3eca9608d8c14fb6963bfe830dfa5985d7de
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1587/30000] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231103/202311031534.p92hN9Hw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031534.p92hN9Hw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031534.p92hN9Hw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-user.c:525:6: warning: no previous prototype for 'message_kill' [-Wmissing-prototypes]
     525 | void message_kill(struct message *m, mempool_t *pool)
         |      ^~~~~~~~~~~~
>> drivers/md/dm-user.c:539:5: warning: no previous prototype for 'target_poll' [-Wmissing-prototypes]
     539 | int target_poll(struct target *t)
         |     ^~~~~~~~~~~
>> drivers/md/dm-user.c:544:6: warning: no previous prototype for 'target_release' [-Wmissing-prototypes]
     544 | void target_release(struct kref *ref)
         |      ^~~~~~~~~~~~~~
   drivers/md/dm-user.c:565:6: warning: no previous prototype for 'target_put' [-Wmissing-prototypes]
     565 | void target_put(struct target *t)
         |      ^~~~~~~~~~
   drivers/md/dm-user.c:578:17: warning: no previous prototype for 'channel_alloc' [-Wmissing-prototypes]
     578 | struct channel *channel_alloc(struct target *t)
         |                 ^~~~~~~~~~~~~
   drivers/md/dm-user.c:596:6: warning: no previous prototype for 'channel_free' [-Wmissing-prototypes]
     596 | void channel_free(struct channel *c)
         |      ^~~~~~~~~~~~


vim +/target_poll +539 drivers/md/dm-user.c

   532	
   533	/*
   534	 * Returns 0 when there is no work left to do.  This must be callable without
   535	 * holding the target lock, as it is part of the waitqueue's check expression.
   536	 * When called without the lock it may spuriously indicate there is remaining
   537	 * work, but when called with the lock it must be accurate.
   538	 */
 > 539	int target_poll(struct target *t)
   540	{
   541		return !list_empty(&t->to_user) || t->dm_destroyed;
   542	}
   543	
 > 544	void target_release(struct kref *ref)
   545	{
   546		struct target *t = container_of(ref, struct target, references);
   547		struct list_head *cur;
   548	
   549		/*
   550		 * There may be outstanding BIOs that have not yet been given to
   551		 * userspace.  At this point there's nothing we can do about them, as
   552		 * there are and will never be any channels.
   553		 */
   554		list_for_each (cur, &t->to_user) {
   555			message_kill(list_entry(cur, struct message, to_user),
   556				     &t->message_pool);
   557		}
   558	
   559		mempool_exit(&t->message_pool);
   560		mutex_unlock(&t->lock);
   561		mutex_destroy(&t->lock);
   562		kfree(t);
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
