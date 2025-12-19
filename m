Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BD42D0620
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 08:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766132590; cv=none; b=VPz6YVF2vvxEz1EiD38Kk65aZNIAeJ/XZdTFk9j6UidyYoQbR/CdlbU5siRfpkJhhp7IDFwwkUKZTLzOa75ARGBLkGX7qTuaDlb/GkZXb5rJVF9NxhpqjHJqX59L3Y1ubf1jd3Bte9X6EdFXK+Im4VYsPW+ff/ZgR4ALeirgejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766132590; c=relaxed/simple;
	bh=RXu3TbOJCNeWgsBi/Y/WMGJK3dt/Ke4lE8Au3w+Hrpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L82N+WcKIvcZTUQTOh0DumtiufKfW2ofvBzewWk+LBoKG7EUchrhwUCZfdZ7s9pBdL79KBRvsQqFVYyy0rsTrWSa5hty09OSzIbcivxZ4jbNjyj4xtMeq4hO87JaOa337Z34w4auBf6lM1fUFMwt/qONi8ACQw69CnVixWNLrJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlT0nz1M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlT0nz1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766132587; x=1797668587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXu3TbOJCNeWgsBi/Y/WMGJK3dt/Ke4lE8Au3w+Hrpk=;
  b=MlT0nz1M8XTqhRSe3Uy0Afwd4Nzt6Rim4gr3mJCF76EuK4P8gJaH4PUE
   D+Vl8WZJRX0eGErO3z+M9BRtl2DClGhjH9/5dQ5y3QOJWb4BOasNBhwfq
   2+HIvu33vXE5LcAHgOGVw8ahjBovFpq00aUJn53r/KAQ8c4xyYq2WCN6p
   MJDRZn1beniHv/p1wKL0reXC+bVrcEcl7hF5CP31p5oXgKNsBrLE+tdho
   DFUWigcec1jYaRBsgwUBoNuhehwuxEM4MHLCdRUeKpPNw2pBVHJ4j7d78
   juT3/PLYMxKhWR4qQN4p/ZG3OnTRG0Fjn0mtT0h9deAW3KomHo6L6xp0b
   g==;
X-CSE-ConnectionGUID: agF632uvTpW/hzAgnxAAsA==
X-CSE-MsgGUID: 2H8/Dg8KTjaPKPhDiGZzUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68028318"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68028318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 00:23:05 -0800
X-CSE-ConnectionGUID: n+2jI92pQ/e/5Q77r978/g==
X-CSE-MsgGUID: 1UEms6uzTmutPLIW9GtkdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203896620"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Dec 2025 00:23:05 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWVlO-000000003GT-09u9;
	Fri, 19 Dec 2025 08:23:02 +0000
Date: Fri, 19 Dec 2025 16:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 drivers/md/dm-user.c:539:5: warning: no previous prototype for 'target_poll'
Message-ID: <202512191649.Fg238iSL-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [0/4] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512191649.Fg238iSL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191649.Fg238iSL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191649.Fg238iSL-lkp@intel.com/

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
>> drivers/md/dm-user.c:565:6: warning: no previous prototype for 'target_put' [-Wmissing-prototypes]
     565 | void target_put(struct target *t)
         |      ^~~~~~~~~~
   drivers/md/dm-user.c:578:17: warning: no previous prototype for 'channel_alloc' [-Wmissing-prototypes]
     578 | struct channel *channel_alloc(struct target *t)
         |                 ^~~~~~~~~~~~~
>> drivers/md/dm-user.c:596:6: warning: no previous prototype for 'channel_free' [-Wmissing-prototypes]
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
 > 565	void target_put(struct target *t)
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
   578	struct channel *channel_alloc(struct target *t)
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
 > 596	void channel_free(struct channel *c)
   597	{
   598		struct list_head *cur;
   599	
   600		lockdep_assert_held(&c->lock);
   601	
   602		/*
   603		 * There may be outstanding BIOs that have been given to userspace but
   604		 * have not yet been completed.  The channel has been shut down so
   605		 * there's no way to process the rest of those messages, so we just go
   606		 * ahead and error out the BIOs.  Hopefully whatever's on the other end
   607		 * can handle the errors.  One could imagine splitting the BIOs and
   608		 * completing as much as we got, but that seems like overkill here.
   609		 *
   610		 * Our only other options would be to let the BIO hang around (which
   611		 * seems way worse) or to resubmit it to userspace in the hope there's
   612		 * another channel.  I don't really like the idea of submitting a
   613		 * message twice.
   614		 */
   615		if (c->cur_to_user != NULL)
   616			message_kill(c->cur_to_user, &c->target->message_pool);
   617		if (c->cur_from_user != &c->scratch_message_from_user)
   618			message_kill(c->cur_from_user, &c->target->message_pool);
   619		list_for_each (cur, &c->from_user)
   620			message_kill(list_entry(cur, struct message, to_user),
   621				     &c->target->message_pool);
   622	
   623		mutex_lock(&c->target->lock);
   624		target_put(c->target);
   625		mutex_unlock(&c->lock);
   626		mutex_destroy(&c->lock);
   627		kfree(c);
   628	}
   629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
