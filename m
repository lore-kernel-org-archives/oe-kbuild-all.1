Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625977;
	b=eSF5AMAgef4ARMi+PpYJTrU0nYqFG0ekt7G2Hxi0fdeEzkEthGLvQyI9CvgPi9CxKa/U
	 GHIpa6LVhcgmRvgzUCdr8rK457TSR34h33bk945v2kKYcQHGWQwzT5qVY/WIcLeuudIBb
	 FrcSk43Ib4u96YafvuJ4VMymPQ9Of6S7QEknReEXvrKp3Sxjr6seMxhMFjF3yLBXqDys8
	 QkmIZNi6/skq70Fyy+IUbElD7FuSpyeFFFdvDgtAB6XrGKWTckyjXssNYhOdC23X2xLVP
	 jss1MpK3YJbhGqJCJJ8vxFVBO3bt37YzX6J4IPZG+NL2Drun/ClHBqrG0vdAVf/HhpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625977;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=056SZLyXW+Wmln3swOdBoJ0Tp/m8bWeu3gbsNUzUyrQ=;
	b=IdIihkvgprCcL5UkC8u99JjLiCC1wL0IZnBUEktOEtP2AGYXPrfoD3Y9064ZsuCj5GE5
	 88+wNhyzaEk/vQ5Veb1Xaw7yoVUZl7ymlCiWoFUS1JUedZcZCr6PyYwCsyrQQcxFCi/4P
	 lHR8LXIfxVdDC46EZ0tlTivOPOFSwfL+iIzWN9SNTVoit6QcqrkDazp/kyFzsjw8gQWDA
	 Oo82rY828X7+ebKx7I9hH+HHlqWTLDcR9/O5SCCt5phnreGJvPKZcPBmPkmwFdd8mdnKX
	 zLoR16w4MhzIpFHI7CZpYCX+B38ElL7GTPBaJo+Jeg+20tP4mKG4v9jY9Ek6dqSTcPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgNE0Zg8;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D3606A329
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 03:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45D3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgNE0Zg8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794625976; x=1826161976;
  h=date:from:to:cc:subject:message-id;
  bh=gam5xgqzCbHeFp48nlBWT8tpZ7EtBnuC36ZWS7ZCSt4=;
  b=KgNE0Zg86LEPEtNrqP9OHpx224xetPgN2rOzSSDiqSgBk/BlNBS/32ty
   JZPTrgSok77r69oFTDTLeRuN7d+DAU/cj081wXcS9WLbeRnbqfeTA67TS
   SiUj/g9DzX1y64Aluem4O4DM4PMp4CmWyOu2kZVvVSa5zc5Gx/Lr8Ivbu
   i6d2tY9j+uS8ND6dpoyEAExY+pWZDmeYBaxELigjaFielK+sdgLInmdDD
   ca8oJ9e3++Eq1Lamel+w5ohkayNPMW9HkLCejCdlvO2CUq+GqXPdb7hH0
   xlBRxcQBj6BcOqfFAvFNvVpIe4RpgRQ6Lb7HPNriNe9kDuYTqsSorsXMW
   Q==;
X-CSE-ConnectionGUID: Cer2YJe5RCeSCgT3gODeEw==
X-CSE-MsgGUID: yw+WN5XAR6C/rv/hsYTfNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3518341"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3518341"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 19:12:56 -0800
X-CSE-ConnectionGUID: FQzTou1GSaWK5gBrpA/snw==
X-CSE-MsgGUID: 6WyTGYvSRnaFRrKk9CAjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10854880"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 13 Nov 2026 19:12:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS4CB-000000014o7-1J39;
	Sat, 14 Nov 2026 03:12:51 +0000
Date: Sat, 14 Nov 2026 11:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-lts 6/6]
 drivers/md/dm-user.c:539:5: warning: no previous prototype for 'target_poll'
Message-ID: <202611141144.mQgtw8oh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Palmer,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-lts
head:   c73351b2e985e893999227194b401cb06613cd81
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [6/6] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261114/202611141144.mQgtw8oh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141144.mQgtw8oh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141144.mQgtw8oh-lkp@intel.com/

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
