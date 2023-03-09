Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A727628
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 01:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678325227; x=1709861227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3xRHpK8v6zL+rzp531s3czjXME4dZ8RCCV8VqgczDDw=;
  b=KQfqUS7hWpImtX7G7xu1tm+yu8tHZkcHfO0swz3CGDAP8SBmVF/5Pjf3
   zPA6Ge2Yjtc6G+nQeUJvnouTT19Zx1JfOBDLjLldI11xXdFarAVaAiG6y
   x3T1sBwfRa70KRTlu0VIJg6OtkkzLC7Buo95erJighbmlSP6iWQFFQwjx
   7Kt2bGPH4rW08FcAunQ1Ys8Jx25cHVF0aByDP/XpSy8797y1yTRjtpr9t
   Ua5TCdKUqAqQN6gT0vHtiiDGB/AAuV3EUBItIXRDtx20Q979InBPQfY/0
   B1D2I5bVX0QtokUmElMznqXw88ou2xGKqUYn6YqJmTaP+eH7DFXZbameG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337852057"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="337852057"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 17:27:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709661061"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="709661061"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Mar 2023 17:27:05 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa53g-0002XV-2a;
	Thu, 09 Mar 2023 01:27:04 +0000
Date: Thu, 9 Mar 2023 09:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1980/7893]
 drivers/md/dm-user.c:525:6: warning: no previous prototype for
 'message_kill'
Message-ID: <202303090936.zS1JwxHj-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   073cb37443e368c020c8879075433a84a69c1ade
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1980/7893] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230309/202303090936.zS1JwxHj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout 83bf345abc0bc06b98e906bfbb120a52446e1c43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090936.zS1JwxHj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-user.c:525:6: warning: no previous prototype for 'message_kill' [-Wmissing-prototypes]
     525 | void message_kill(struct message *m, mempool_t *pool)
         |      ^~~~~~~~~~~~
   drivers/md/dm-user.c:539:5: warning: no previous prototype for 'target_poll' [-Wmissing-prototypes]
     539 | int target_poll(struct target *t)
         |     ^~~~~~~~~~~
   drivers/md/dm-user.c:544:6: warning: no previous prototype for 'target_release' [-Wmissing-prototypes]
     544 | void target_release(struct kref *ref)
         |      ^~~~~~~~~~~~~~
   drivers/md/dm-user.c:565:6: warning: no previous prototype for 'target_put' [-Wmissing-prototypes]
     565 | void target_put(struct target *t)
         |      ^~~~~~~~~~
>> drivers/md/dm-user.c:578:17: warning: no previous prototype for 'channel_alloc' [-Wmissing-prototypes]
     578 | struct channel *channel_alloc(struct target *t)
         |                 ^~~~~~~~~~~~~
   drivers/md/dm-user.c:596:6: warning: no previous prototype for 'channel_free' [-Wmissing-prototypes]
     596 | void channel_free(struct channel *c)
         |      ^~~~~~~~~~~~


vim +/message_kill +525 drivers/md/dm-user.c

   524	
 > 525	void message_kill(struct message *m, mempool_t *pool)
   526	{
   527		m->bio->bi_status = BLK_STS_IOERR;
   528		bio_endio(m->bio);
   529		bio_put(m->bio);
   530		mempool_free(m, pool);
   531	}
   532	
   533	/*
   534	 * Returns 0 when there is no work left to do.  This must be callable without
   535	 * holding the target lock, as it is part of the waitqueue's check expression.
   536	 * When called without the lock it may spuriously indicate there is remaining
   537	 * work, but when called with the lock it must be accurate.
   538	 */
   539	int target_poll(struct target *t)
   540	{
   541		return !list_empty(&t->to_user) || t->dm_destroyed;
   542	}
   543	
   544	void target_release(struct kref *ref)
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
   565	void target_put(struct target *t)
   566	{
   567		/*
   568		 * This both releases a reference to the target and the lock.  We leave
   569		 * it up to the caller to hold the lock, as they probably needed it for
   570		 * something else.
   571		 */
   572		lockdep_assert_held(&t->lock);
   573	
   574		if (!kref_put(&t->references, target_release))
   575			mutex_unlock(&t->lock);
   576	}
   577	
 > 578	struct channel *channel_alloc(struct target *t)
   579	{
   580		struct channel *c;
   581	
   582		lockdep_assert_held(&t->lock);
   583	
   584		c = kzalloc(sizeof(*c), GFP_KERNEL);
   585		if (c == NULL)
   586			return NULL;
   587	
   588		kref_get(&t->references);
   589		c->target = t;
   590		c->cur_from_user = &c->scratch_message_from_user;
   591		mutex_init(&c->lock);
   592		INIT_LIST_HEAD(&c->from_user);
   593		return c;
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
