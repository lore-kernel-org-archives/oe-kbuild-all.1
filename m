Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08813B794
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 21:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715375974; cv=none; b=fyFSfaA3COzyrX/Um3PoDRGTu+evDqJnR/nlN74X2lUKoRSNzDUWjYrYoHjlva6y5VOFc8tbg4Nh+yKRCz08K6ivl2jVj0hkp9V+YGmjrA6CYaLDt+5O+ozSJrryupHZrfHy+iPRnk/trpqZbbkz/6qXSQjOBZdcsRSIiCa0kNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715375974; c=relaxed/simple;
	bh=zsJRubd9FnyC9MaRxFpP8wWQ0mNwRvE6nzqK8nHx33A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8iOiP89LX/Rdp8FEN0tpLrr1GW1URbc8NKgCXYgoPvsJDArESspGYX1UC25HxIg2z+vdHc3l6OHDeC/fhZF3kzoeK8MdzlJfjCFc58YTyKuOpAzPrzp8KWg2SvF+Gsdhu/j0JjXHyw7b4TDS2KueXymp2MUEFjPrj9kDEC5Z28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoJFAcqc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoJFAcqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715375973; x=1746911973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zsJRubd9FnyC9MaRxFpP8wWQ0mNwRvE6nzqK8nHx33A=;
  b=hoJFAcqcmbTHMmxjTsstj37Jct7FXum0qRwUjresjfiV2LKCGdQqCuVT
   YI3VOMx+BPRph0QTmDZuZ8vw6OgOXbAScj8g7+xPsmnmS4tD2RZl4MNjW
   AkZUp3dnkJYVQu5Tz0/ril8bd5YmQ4T0KvgCReH7rgx70bbQa88sXiiKD
   nOSUAoFhmAPPFaNFGyrtFrhMMAZEHMEYqApSkB0NwYDSBCTqgti4wQ3/l
   4C6pX1QyZRPYYF9t8GJaGsxcZ6D9O0VNGvsYx0a+oxsqOAP2dXMzXhJS+
   nh2Y8avaJNJM9YWcqNtM04KVmSS4ut9UnqngCUjfLm/2bPpExFB0GO81/
   A==;
X-CSE-ConnectionGUID: UzAw1zmRS4qx4m7fyWM/eg==
X-CSE-MsgGUID: cEsbFSnKTP2llQ764MepQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28891348"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="28891348"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 14:19:32 -0700
X-CSE-ConnectionGUID: t4iOtrxYShOmKhs8OCsWCQ==
X-CSE-MsgGUID: IfxawT2CTT2nH5+rrwX7MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29754077"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 May 2024 14:19:31 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5XeL-0006Zl-0H;
	Fri, 10 May 2024 21:19:29 +0000
Date: Sat, 11 May 2024 05:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:net-accept-more 3/6] net/iucv/af_iucv.c:798:36:
 warning: 'struct proto_accept_args' declared inside parameter list will not
 be visible outside of this definition or declaration
Message-ID: <202405110525.AW10NtbB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git net-accept-more
head:   f91ebed7e4fc8fa21387924ecd9b6312908b3472
commit: a4b393e6ca8160d2ce71924c22f0cdf47108b1fd [3/6] net: change proto and proto_ops accept type
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240511/202405110525.AW10NtbB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110525.AW10NtbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110525.AW10NtbB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/iucv/af_iucv.c:798:36: warning: 'struct proto_accept_args' declared inside parameter list will not be visible outside of this definition or declaration
     798 |                             struct proto_accept_args *arg)
         |                                    ^~~~~~~~~~~~~~~~~
   net/iucv/af_iucv.c: In function 'iucv_sock_accept':
   net/iucv/af_iucv.c:812:38: error: invalid use of undefined type 'struct proto_accept_args'
     812 |         timeo = sock_rcvtimeo(sk, arg->flags & O_NONBLOCK);
         |                                      ^~
   net/iucv/af_iucv.c: At top level:
   net/iucv/af_iucv.c:2210:27: error: initialization of 'int (*)(struct socket *, struct socket *, struct proto_accept_arg *)' from incompatible pointer type 'int (*)(struct socket *, struct socket *, struct proto_accept_args *)' [-Werror=incompatible-pointer-types]
    2210 |         .accept         = iucv_sock_accept,
         |                           ^~~~~~~~~~~~~~~~
   net/iucv/af_iucv.c:2210:27: note: (near initialization for 'iucv_sock_ops.accept')
   cc1: some warnings being treated as errors


vim +798 net/iucv/af_iucv.c

   795	
   796	/* Accept a pending connection */
   797	static int iucv_sock_accept(struct socket *sock, struct socket *newsock,
 > 798				    struct proto_accept_args *arg)
   799	{
   800		DECLARE_WAITQUEUE(wait, current);
   801		struct sock *sk = sock->sk, *nsk;
   802		long timeo;
   803		int err = 0;
   804	
   805		lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
   806	
   807		if (sk->sk_state != IUCV_LISTEN) {
   808			err = -EBADFD;
   809			goto done;
   810		}
   811	
   812		timeo = sock_rcvtimeo(sk, arg->flags & O_NONBLOCK);
   813	
   814		/* Wait for an incoming connection */
   815		add_wait_queue_exclusive(sk_sleep(sk), &wait);
   816		while (!(nsk = iucv_accept_dequeue(sk, newsock))) {
   817			set_current_state(TASK_INTERRUPTIBLE);
   818			if (!timeo) {
   819				err = -EAGAIN;
   820				break;
   821			}
   822	
   823			release_sock(sk);
   824			timeo = schedule_timeout(timeo);
   825			lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
   826	
   827			if (sk->sk_state != IUCV_LISTEN) {
   828				err = -EBADFD;
   829				break;
   830			}
   831	
   832			if (signal_pending(current)) {
   833				err = sock_intr_errno(timeo);
   834				break;
   835			}
   836		}
   837	
   838		set_current_state(TASK_RUNNING);
   839		remove_wait_queue(sk_sleep(sk), &wait);
   840	
   841		if (err)
   842			goto done;
   843	
   844		newsock->state = SS_CONNECTED;
   845	
   846	done:
   847		release_sock(sk);
   848		return err;
   849	}
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
