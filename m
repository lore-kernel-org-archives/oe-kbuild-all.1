Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A023161330
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715344210; cv=none; b=hGl+yU7XKjjj07ScY16IZuSWHHvKPKTqknwqqQbRl4G4/qXK1lG4fUDspJhiL4CYUuL/qC0oZN9DoPjNSOZkblNJaJX13bIzcqJfImGStQsRtjRZ8do5v/8gdTnRWLhObPva8WkdsTOUmRxi7ugJ3c01cLLnyBMPkplkZp8iIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715344210; c=relaxed/simple;
	bh=AP/qMJsYVY7spXtXCwbUIm39ypHPdtqo7x79OU6Ahy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ofuj2UFuXTeHHqSCHNOSofZtbO97upjCCs30XNxTwi8OVyyUaupgIKGQfIeuz5n+DIwUqB66/OuLYIZO+GZ+D0JA8j/qgR7ewNg7eHvv1bl2bodfUpQcdYPQKz9eZ7WTgEJd7kch7YTOm+XaFAHyUJeUssBVgNCM3esB6kMNSNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChTxGbn5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChTxGbn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715344208; x=1746880208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AP/qMJsYVY7spXtXCwbUIm39ypHPdtqo7x79OU6Ahy4=;
  b=ChTxGbn5OzmKYQnH2730ZHeIFU6nE4i7Q1qvvOi8jAI0GsR8MCPj1O16
   niESrJFfAjlmBvhm7/gELpciyyC8s2uDJhQZ0VdGdDWRI0eM8jpvlUpWC
   0P7QbmQNLQN9RzfdRKF2idGke3+r/5o//6xI0zwvD8mvU72HEOWBQQHql
   av1RIbygbP7jrEX/u+XNyz6I5v+90sAnNPXurYNIBEJpya/pMgPMdNbvx
   4tveHrNBLiwMePredVQ4Cm4L9MlHISn4BaTl2l3HuIEaXaSmaqF91udCp
   lhRz9cki7uwMWsaRFwEFrxxeWQJ0iXbo0+JcjJvQAYeOAFFAQioagMZnC
   g==;
X-CSE-ConnectionGUID: x4wPRnWkTAeazehcpTM0qg==
X-CSE-MsgGUID: cl8ENVUDSLmFdmOMIRYpJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28832839"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="28832839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 05:30:08 -0700
X-CSE-ConnectionGUID: yjaXh8DsSOu4gQwjBpDJRg==
X-CSE-MsgGUID: IQjVCHWFQRKIhQBSfNBNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="60771039"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 May 2024 05:30:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5PO0-00068V-2X;
	Fri, 10 May 2024 12:30:04 +0000
Date: Fri, 10 May 2024 20:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:net-accept-more 3/6] net/tipc/socket.c:2719: warning:
 Function parameter or struct member 'arg' not described in 'tipc_accept'
Message-ID: <202405102016.FpxHgryj-lkp@intel.com>
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
head:   3b4f987e70b3ba8a6da0a425daf61c9cac61f55d
commit: 11129a54ba83064e7ba3157cb5d12febfdf813df [3/6] net: change proto and proto_ops accept type
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240510/202405102016.FpxHgryj-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405102016.FpxHgryj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102016.FpxHgryj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/tipc/socket.c:2719: warning: Function parameter or struct member 'arg' not described in 'tipc_accept'
>> net/tipc/socket.c:2719: warning: Excess function parameter 'flags' description in 'tipc_accept'
>> net/tipc/socket.c:2719: warning: Excess function parameter 'kern' description in 'tipc_accept'


vim +2719 net/tipc/socket.c

6398e23cdb1d80 Ying Xue                 2014-01-17  2707  
b97bf3fd8f6a16 Per Liden                2006-01-02  2708  /**
247f0f3c3176c5 Ying Xue                 2014-02-18  2709   * tipc_accept - wait for connection request
b97bf3fd8f6a16 Per Liden                2006-01-02  2710   * @sock: listening socket
d8141208b032ea Andrew Lunn              2020-07-13  2711   * @new_sock: new socket that is to be connected
b97bf3fd8f6a16 Per Liden                2006-01-02  2712   * @flags: file-related flags associated with socket
f172f4b81aea89 Randy Dunlap             2020-11-29  2713   * @kern: caused by kernel or by userspace?
b97bf3fd8f6a16 Per Liden                2006-01-02  2714   *
637b77fdca5c5e Randy Dunlap             2020-11-29  2715   * Return: 0 on success, errno otherwise
b97bf3fd8f6a16 Per Liden                2006-01-02  2716   */
11129a54ba8306 Jens Axboe               2024-05-09  2717  static int tipc_accept(struct socket *sock, struct socket *new_sock,
11129a54ba8306 Jens Axboe               2024-05-09  2718  		       struct proto_accept_arg *arg)
b97bf3fd8f6a16 Per Liden                2006-01-02 @2719  {
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2720  	struct sock *new_sk, *sk = sock->sk;
301bae56f21295 Jon Paul Maloy           2014-08-22  2721  	struct tipc_sock *new_tsock;
f8dd60de194817 Xin Long                 2021-07-22  2722  	struct msghdr m = {NULL,};
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2723  	struct tipc_msg *msg;
f8dd60de194817 Xin Long                 2021-07-22  2724  	struct sk_buff *buf;
6398e23cdb1d80 Ying Xue                 2014-01-17  2725  	long timeo;
0c3141e910eaaa Allan Stephens           2008-04-15  2726  	int res;
b97bf3fd8f6a16 Per Liden                2006-01-02  2727  
0c3141e910eaaa Allan Stephens           2008-04-15  2728  	lock_sock(sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2729  
0c288c86928e50 Parthasarathy Bhuvaragan 2016-11-01  2730  	if (sk->sk_state != TIPC_LISTEN) {
0c3141e910eaaa Allan Stephens           2008-04-15  2731  		res = -EINVAL;
0c3141e910eaaa Allan Stephens           2008-04-15  2732  		goto exit;
0c3141e910eaaa Allan Stephens           2008-04-15  2733  	}
11129a54ba8306 Jens Axboe               2024-05-09  2734  	timeo = sock_rcvtimeo(sk, arg->flags & O_NONBLOCK);
6398e23cdb1d80 Ying Xue                 2014-01-17  2735  	res = tipc_wait_for_accept(sock, timeo);
0c3141e910eaaa Allan Stephens           2008-04-15  2736  	if (res)
b97bf3fd8f6a16 Per Liden                2006-01-02  2737  		goto exit;
b97bf3fd8f6a16 Per Liden                2006-01-02  2738  
0c3141e910eaaa Allan Stephens           2008-04-15  2739  	buf = skb_peek(&sk->sk_receive_queue);
0c3141e910eaaa Allan Stephens           2008-04-15  2740  
11129a54ba8306 Jens Axboe               2024-05-09  2741  	res = tipc_sk_create(sock_net(sock->sk), new_sock, 0, arg->kern);
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2742  	if (res)
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2743  		goto exit;
fdd75ea8df370f Stephen Smalley          2015-07-07  2744  	security_sk_clone(sock->sk, new_sock->sk);
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2745  
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2746  	new_sk = new_sock->sk;
301bae56f21295 Jon Paul Maloy           2014-08-22  2747  	new_tsock = tipc_sk(new_sk);
0fef8f205f6f4c Paul Gortmaker           2012-12-04  2748  	msg = buf_msg(buf);
0c3141e910eaaa Allan Stephens           2008-04-15  2749  
258f8667a29d72 Ying Xue                 2012-12-03  2750  	/* we lock on new_sk; but lockdep sees the lock on sk */
258f8667a29d72 Ying Xue                 2012-12-03  2751  	lock_sock_nested(new_sk, SINGLE_DEPTH_NESTING);
0c3141e910eaaa Allan Stephens           2008-04-15  2752  
0c3141e910eaaa Allan Stephens           2008-04-15  2753  	/*
0c3141e910eaaa Allan Stephens           2008-04-15  2754  	 * Reject any stray messages received by new socket
0c3141e910eaaa Allan Stephens           2008-04-15  2755  	 * before the socket lock was taken (very, very unlikely)
0c3141e910eaaa Allan Stephens           2008-04-15  2756  	 */
49afb806cb650d Tuong Lien               2020-01-08  2757  	tsk_rej_rx_queue(new_sk, TIPC_ERR_NO_PORT);
0c3141e910eaaa Allan Stephens           2008-04-15  2758  
0c3141e910eaaa Allan Stephens           2008-04-15  2759  	/* Connect new socket to it's peer */
301bae56f21295 Jon Paul Maloy           2014-08-22  2760  	tipc_sk_finish_conn(new_tsock, msg_origport(msg), msg_orignode(msg));
b97bf3fd8f6a16 Per Liden                2006-01-02  2761  
095ae612530c94 Christoph Hellwig        2020-05-28  2762  	tsk_set_importance(new_sk, msg_importance(msg));
b97bf3fd8f6a16 Per Liden                2006-01-02  2763  	if (msg_named(msg)) {
14623e005a1e74 Jon Maloy                2021-06-02  2764  		new_tsock->conn_addrtype = TIPC_SERVICE_ADDR;
14623e005a1e74 Jon Maloy                2021-06-02  2765  		msg_set_nametype(&new_tsock->phdr, msg_nametype(msg));
14623e005a1e74 Jon Maloy                2021-06-02  2766  		msg_set_nameinst(&new_tsock->phdr, msg_nameinst(msg));
b97bf3fd8f6a16 Per Liden                2006-01-02  2767  	}
b97bf3fd8f6a16 Per Liden                2006-01-02  2768  
b97bf3fd8f6a16 Per Liden                2006-01-02  2769  	/*
f8dd60de194817 Xin Long                 2021-07-22  2770  	 * Respond to 'SYN-' by discarding it & returning 'ACK'.
f8dd60de194817 Xin Long                 2021-07-22  2771  	 * Respond to 'SYN+' by queuing it on new socket & returning 'ACK'.
b97bf3fd8f6a16 Per Liden                2006-01-02  2772  	 */
b97bf3fd8f6a16 Per Liden                2006-01-02  2773  	if (!msg_data_sz(msg)) {
2e84c60b77e4dd Jon Paul Maloy           2014-08-22  2774  		tsk_advance_rx_queue(sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2775  	} else {
0c3141e910eaaa Allan Stephens           2008-04-15  2776  		__skb_dequeue(&sk->sk_receive_queue);
0c3141e910eaaa Allan Stephens           2008-04-15  2777  		__skb_queue_head(&new_sk->sk_receive_queue, buf);
aba79f332f46ca Ying Xue                 2013-01-20  2778  		skb_set_owner_r(buf, new_sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2779  	}
11a4d6f67cf558 Tung Nguyen              2023-02-14  2780  	iov_iter_kvec(&m.msg_iter, ITER_SOURCE, NULL, 0, 0);
f8dd60de194817 Xin Long                 2021-07-22  2781  	__tipc_sendstream(new_sock, &m, 0);
0c3141e910eaaa Allan Stephens           2008-04-15  2782  	release_sock(new_sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2783  exit:
0c3141e910eaaa Allan Stephens           2008-04-15  2784  	release_sock(sk);
b97bf3fd8f6a16 Per Liden                2006-01-02  2785  	return res;
b97bf3fd8f6a16 Per Liden                2006-01-02  2786  }
b97bf3fd8f6a16 Per Liden                2006-01-02  2787  

:::::: The code at line 2719 was first introduced by commit
:::::: b97bf3fd8f6a16966d4f18983b2c40993ff937d4 [TIPC] Initial merge

:::::: TO: Per Liden <per.liden@nospam.ericsson.com>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
