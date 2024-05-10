Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730C213BAFB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 21:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715375976; cv=none; b=YX7BRNca2RpaR8EfKi1hp0pg+rx2511T3QgagRau+wXzOsNJE6KbjQQnKdQS7s1q8hgNSLpNOpIOqg6arfG3ELgbmSDacP5D84alG0ukfJZRS7CfkHKmNm9Km6MPjDMawNngsM2+UDLy9P0hpJwKbfap/9ZX2ywm1nbWWgh59Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715375976; c=relaxed/simple;
	bh=bJjDMb0uAgDYQc/6Jb3UcUQNjUKG3UtMUrmBeILd38A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNWpVNxVDrj/hl5UwCkbPdkBSqsZttdmmst/l8PMipt9jPT7FbOW/+j9T5Xv93IPSyddqsfI7cd/S/iZNFI4MJ/UOtik+AZ4uHYSOpmlRBGkbf7kgDWOQ29S9jfxrfp0KLEAbUNKRgd6zE9At5q0uiOP/XOE2Q4PWY3qg9IXbnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNk12StW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNk12StW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715375975; x=1746911975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJjDMb0uAgDYQc/6Jb3UcUQNjUKG3UtMUrmBeILd38A=;
  b=DNk12StWqh71nl8E6wXbrFfkBAXB9axQawXoZObZO7lxk0qiUsArxohz
   4neJ3vmQxQH64p342Besoh2MJNfRHxPc1oAWZXt+j5VQrkGMMMn6u3wIj
   jBfzZALmdbq0romyIm07R7vvZRdJqM1SHJcH0wycS8ehFCbKnXgdJdREV
   Hr3cnEdpFTOrUp0wJMZSHv4ssCN7RlXCpLmb/1DTGpWcUsrTkgdD2VOOj
   jORCa7QqLML/BTjbR4b8Q779w5MzjCzK2OWN3uzVGCk8+IAoiOm3XRWaJ
   Cj1fDcLbnOtimRacRy84dqHGDYjT5oY2kNBK1NJks916dk1QC4Mt1hUNJ
   g==;
X-CSE-ConnectionGUID: 2/G2MmeTRaGPIsKZ9Dl8Lg==
X-CSE-MsgGUID: jCoKYDHwSgC6TZVo5z2pWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28891346"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="28891346"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 14:19:32 -0700
X-CSE-ConnectionGUID: XDXtB6hBRRGC+RQgmbFrRg==
X-CSE-MsgGUID: kGHTsfMwSFuNL8jwUdO/hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29754076"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 May 2024 14:19:31 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5XeL-0006Zj-0C;
	Fri, 10 May 2024 21:19:29 +0000
Date: Sat, 11 May 2024 05:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:net-accept-more 3/6] net/tipc/socket.c:2718: warning:
 Excess function parameter 'args' description in 'tipc_accept'
Message-ID: <202405110537.v42FdTY2-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240511/202405110537.v42FdTY2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110537.v42FdTY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110537.v42FdTY2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/tipc/socket.c:2718: warning: Function parameter or struct member 'arg' not described in 'tipc_accept'
>> net/tipc/socket.c:2718: warning: Excess function parameter 'args' description in 'tipc_accept'


vim +2718 net/tipc/socket.c

6398e23cdb1d80 Ying Xue                 2014-01-17  2707  
b97bf3fd8f6a16 Per Liden                2006-01-02  2708  /**
247f0f3c3176c5 Ying Xue                 2014-02-18  2709   * tipc_accept - wait for connection request
b97bf3fd8f6a16 Per Liden                2006-01-02  2710   * @sock: listening socket
d8141208b032ea Andrew Lunn              2020-07-13  2711   * @new_sock: new socket that is to be connected
a4b393e6ca8160 Jens Axboe               2024-05-09  2712   * @args: arguments for accept
b97bf3fd8f6a16 Per Liden                2006-01-02  2713   *
637b77fdca5c5e Randy Dunlap             2020-11-29  2714   * Return: 0 on success, errno otherwise
b97bf3fd8f6a16 Per Liden                2006-01-02  2715   */
a4b393e6ca8160 Jens Axboe               2024-05-09  2716  static int tipc_accept(struct socket *sock, struct socket *new_sock,
a4b393e6ca8160 Jens Axboe               2024-05-09  2717  		       struct proto_accept_arg *arg)
b97bf3fd8f6a16 Per Liden                2006-01-02 @2718  {
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2719  	struct sock *new_sk, *sk = sock->sk;
301bae56f21295 Jon Paul Maloy           2014-08-22  2720  	struct tipc_sock *new_tsock;
f8dd60de194817 Xin Long                 2021-07-22  2721  	struct msghdr m = {NULL,};
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2722  	struct tipc_msg *msg;
f8dd60de194817 Xin Long                 2021-07-22  2723  	struct sk_buff *buf;
6398e23cdb1d80 Ying Xue                 2014-01-17  2724  	long timeo;
0c3141e910eaaa Allan Stephens           2008-04-15  2725  	int res;
b97bf3fd8f6a16 Per Liden                2006-01-02  2726  
0c3141e910eaaa Allan Stephens           2008-04-15  2727  	lock_sock(sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2728  
0c288c86928e50 Parthasarathy Bhuvaragan 2016-11-01  2729  	if (sk->sk_state != TIPC_LISTEN) {
0c3141e910eaaa Allan Stephens           2008-04-15  2730  		res = -EINVAL;
0c3141e910eaaa Allan Stephens           2008-04-15  2731  		goto exit;
0c3141e910eaaa Allan Stephens           2008-04-15  2732  	}
a4b393e6ca8160 Jens Axboe               2024-05-09  2733  	timeo = sock_rcvtimeo(sk, arg->flags & O_NONBLOCK);
6398e23cdb1d80 Ying Xue                 2014-01-17  2734  	res = tipc_wait_for_accept(sock, timeo);
0c3141e910eaaa Allan Stephens           2008-04-15  2735  	if (res)
b97bf3fd8f6a16 Per Liden                2006-01-02  2736  		goto exit;
b97bf3fd8f6a16 Per Liden                2006-01-02  2737  
0c3141e910eaaa Allan Stephens           2008-04-15  2738  	buf = skb_peek(&sk->sk_receive_queue);
0c3141e910eaaa Allan Stephens           2008-04-15  2739  
a4b393e6ca8160 Jens Axboe               2024-05-09  2740  	res = tipc_sk_create(sock_net(sock->sk), new_sock, 0, arg->kern);
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2741  	if (res)
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2742  		goto exit;
fdd75ea8df370f Stephen Smalley          2015-07-07  2743  	security_sk_clone(sock->sk, new_sock->sk);
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2744  
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2745  	new_sk = new_sock->sk;
301bae56f21295 Jon Paul Maloy           2014-08-22  2746  	new_tsock = tipc_sk(new_sk);
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2747  	msg = buf_msg(buf);
0c3141e910eaaa Allan Stephens           2008-04-15  2748  
258f8667a29d72 Ying Xue                 2012-12-03  2749  	/* we lock on new_sk; but lockdep sees the lock on sk */
258f8667a29d72 Ying Xue                 2012-12-03  2750  	lock_sock_nested(new_sk, SINGLE_DEPTH_NESTING);
0c3141e910eaaa Allan Stephens           2008-04-15  2751  
0c3141e910eaaa Allan Stephens           2008-04-15  2752  	/*
0c3141e910eaaa Allan Stephens           2008-04-15  2753  	 * Reject any stray messages received by new socket
0c3141e910eaaa Allan Stephens           2008-04-15  2754  	 * before the socket lock was taken (very, very unlikely)
0c3141e910eaaa Allan Stephens           2008-04-15  2755  	 */
49afb806cb650d Tuong Lien               2020-01-08  2756  	tsk_rej_rx_queue(new_sk, TIPC_ERR_NO_PORT);
0c3141e910eaaa Allan Stephens           2008-04-15  2757  
0c3141e910eaaa Allan Stephens           2008-04-15  2758  	/* Connect new socket to it's peer */
301bae56f21295 Jon Paul Maloy           2014-08-22  2759  	tipc_sk_finish_conn(new_tsock, msg_origport(msg), msg_orignode(msg));
b97bf3fd8f6a16 Per Liden                2006-01-02  2760  
095ae612530c94 Christoph Hellwig        2020-05-28  2761  	tsk_set_importance(new_sk, msg_importance(msg));
b97bf3fd8f6a16 Per Liden                2006-01-02  2762  	if (msg_named(msg)) {
14623e005a1e74 Jon Maloy                2021-06-02  2763  		new_tsock->conn_addrtype = TIPC_SERVICE_ADDR;
14623e005a1e74 Jon Maloy                2021-06-02  2764  		msg_set_nametype(&new_tsock->phdr, msg_nametype(msg));
14623e005a1e74 Jon Maloy                2021-06-02  2765  		msg_set_nameinst(&new_tsock->phdr, msg_nameinst(msg));
b97bf3fd8f6a16 Per Liden                2006-01-02  2766  	}
b97bf3fd8f6a16 Per Liden                2006-01-02  2767  
b97bf3fd8f6a16 Per Liden                2006-01-02  2768  	/*
f8dd60de194817 Xin Long                 2021-07-22  2769  	 * Respond to 'SYN-' by discarding it & returning 'ACK'.
f8dd60de194817 Xin Long                 2021-07-22  2770  	 * Respond to 'SYN+' by queuing it on new socket & returning 'ACK'.
b97bf3fd8f6a16 Per Liden                2006-01-02  2771  	 */
b97bf3fd8f6a16 Per Liden                2006-01-02  2772  	if (!msg_data_sz(msg)) {
2e84c60b77e4dd Jon Paul Maloy           2014-08-22  2773  		tsk_advance_rx_queue(sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2774  	} else {
0c3141e910eaaa Allan Stephens           2008-04-15  2775  		__skb_dequeue(&sk->sk_receive_queue);
0c3141e910eaaa Allan Stephens           2008-04-15  2776  		__skb_queue_head(&new_sk->sk_receive_queue, buf);
aba79f332f46ca Ying Xue                 2013-01-20  2777  		skb_set_owner_r(buf, new_sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2778  	}
11a4d6f67cf558 Tung Nguyen              2023-02-14  2779  	iov_iter_kvec(&m.msg_iter, ITER_SOURCE, NULL, 0, 0);
f8dd60de194817 Xin Long                 2021-07-22  2780  	__tipc_sendstream(new_sock, &m, 0);
0c3141e910eaaa Allan Stephens           2008-04-15  2781  	release_sock(new_sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2782  exit:
0c3141e910eaaa Allan Stephens           2008-04-15  2783  	release_sock(sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2784  	return res;
b97bf3fd8f6a16 Per Liden                2006-01-02  2785  }
b97bf3fd8f6a16 Per Liden                2006-01-02  2786  

:::::: The code at line 2718 was first introduced by commit
:::::: b97bf3fd8f6a16966d4f18983b2c40993ff937d4 [TIPC] Initial merge

:::::: TO: Per Liden <per.liden@nospam.ericsson.com>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
