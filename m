Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31255A31
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 04:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680064900; x=1711600900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBUem085M06AR+e3nStYlkAiYSthfF7+oSwG8ps65L4=;
  b=Iz+lE3oy627mFqV3zvbS7JBDVteA4Oa03fWp2pps+eu4Ef04GMxy9eq4
   n4UZCH5f5t39bitzmy1soWVbkTjhVNlazCF7Qh2+tqcRPx3lW+hjXEZQ3
   yxU5Z6qOAcX1YwvUXA16NFbKDp/4A2/z+cgE5ir817I0TK6X+Z2MWXLye
   ox+VArYrMTxo69aC0kknWnLdtKKqFj4ZWAJMxwBiG0TpHTQPujpQFWohu
   hhYHkE5Ph/1OItyiqWrNJJqqOGRPXk7p9UZm8O2cawz80kreDmvsI9mWc
   c5ZW7S5jzsrHS9/T/6fANpGR9iBc7EGxUVnRNu/3zLn5fciRHOw4dDsmJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338276992"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="338276992"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 21:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="661459672"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="661459672"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Mar 2023 21:41:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phNcv-000JEV-0o;
	Wed, 29 Mar 2023 04:41:37 +0000
Date: Wed, 29 Mar 2023 12:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1980/7896]
 drivers/md/dm-user.c:525:6: warning: no previous prototype for
 'message_kill'
Message-ID: <202303291226.KhRn9b4X-lkp@intel.com>
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
head:   993014e4433829d09f2664c6d8576041bf9914ea
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1980/7896] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230329/202303291226.KhRn9b4X-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303291226.KhRn9b4X-lkp@intel.com/

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
 > 539	int target_poll(struct target *t)
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
