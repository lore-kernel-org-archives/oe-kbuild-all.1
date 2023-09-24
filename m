Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C85D279
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695571231; x=1727107231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DTdNAsH14imhg9HpE3s6RQBYUygBehPXxKu0eaurBT8=;
  b=BigdgP3mfhiVsawSOVE6bN5IuSSNem63nHr+EsU+DTpp4t2m8Q4PJ2dD
   2WnI3psTAVeXlU5IerM8ozCgSSSCrx3c2dfozdn+0eOQxNbjp7BDo2oLv
   JoyqMw9STT0aJVrRXw4MbcDERoo+/LRZEbh3rZMmfFd+5SWvjy4zpwgGA
   /Yr9tUnPDaTvrf0vgKJPEBTTO40ED1tuGMRM8bDQeMSM3+qaeXopziGj7
   h8Kvk0e3ngquFXIYUFnleCcTH6VZuQU0NDo2xY4GM7s6zFUIhsS42aoVt
   h6nS+8Qp9koAgFwr8xFB78x/2KFD4vFtpzMd0EZwc1jmyqg70WZZyuKqn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378379832"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="378379832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 09:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838340440"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="838340440"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2023 09:00:29 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkRX1-00003b-2h;
	Sun, 24 Sep 2023 16:00:27 +0000
Date: Mon, 25 Sep 2023 00:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.14 4/5] net/dccp/ipv4.c:251:10: warning:
 'return' with a value, in function returning void
Message-ID: <202309242339.Vek77u77-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.14
head:   3363b76b7e01bc38781d3957d6f465a5f489976d
commit: 40248ab9c9a57e66f5b3ca3683ac2f2345314d7f [4/5] dccp: fix dccp_v4_err()/dccp_v6_err() again
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230924/202309242339.Vek77u77-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309242339.Vek77u77-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309242339.Vek77u77-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/dccp/ipv4.c: In function 'dccp_v4_err':
>> net/dccp/ipv4.c:251:10: warning: 'return' with a value, in function returning void
      return -EINVAL;
             ^
   net/dccp/ipv4.c:236:13: note: declared here
    static void dccp_v4_err(struct sk_buff *skb, u32 info)
                ^~~~~~~~~~~
--
   net/dccp/ipv6.c: In function 'dccp_v6_err':
>> net/dccp/ipv6.c:84:10: warning: 'return' with a value, in function returning void
      return -EINVAL;
             ^
   net/dccp/ipv6.c:71:13: note: declared here
    static void dccp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
                ^~~~~~~~~~~


vim +/return +251 net/dccp/ipv4.c

   223	
   224	/*
   225	 * This routine is called by the ICMP module when it gets some sort of error
   226	 * condition. If err < 0 then the socket should be closed and the error
   227	 * returned to the user. If err > 0 it's just the icmp type << 8 | icmp code.
   228	 * After adjustment header points to the first 8 bytes of the tcp header. We
   229	 * need to find the appropriate port.
   230	 *
   231	 * The locking strategy used here is very "optimistic". When someone else
   232	 * accesses the socket the ICMP is just dropped and for some paths there is no
   233	 * check at all. A more general error queue to queue errors for later handling
   234	 * is probably better.
   235	 */
   236	static void dccp_v4_err(struct sk_buff *skb, u32 info)
   237	{
   238		const struct iphdr *iph = (struct iphdr *)skb->data;
   239		const u8 offset = iph->ihl << 2;
   240		const struct dccp_hdr *dh;
   241		struct dccp_sock *dp;
   242		struct inet_sock *inet;
   243		const int type = icmp_hdr(skb)->type;
   244		const int code = icmp_hdr(skb)->code;
   245		struct sock *sk;
   246		__u64 seq;
   247		int err;
   248		struct net *net = dev_net(skb->dev);
   249	
   250		if (!pskb_may_pull(skb, offset + sizeof(*dh)))
 > 251			return -EINVAL;
   252		dh = (struct dccp_hdr *)(skb->data + offset);
   253		if (!pskb_may_pull(skb, offset + __dccp_basic_hdr_len(dh)))
   254			return;
   255		iph = (struct iphdr *)skb->data;
   256		dh = (struct dccp_hdr *)(skb->data + offset);
   257	
   258		sk = __inet_lookup_established(net, &dccp_hashinfo,
   259					       iph->daddr, dh->dccph_dport,
   260					       iph->saddr, ntohs(dh->dccph_sport),
   261					       inet_iif(skb), 0);
   262		if (!sk) {
   263			__ICMP_INC_STATS(net, ICMP_MIB_INERRORS);
   264			return;
   265		}
   266	
   267		if (sk->sk_state == DCCP_TIME_WAIT) {
   268			inet_twsk_put(inet_twsk(sk));
   269			return;
   270		}
   271		seq = dccp_hdr_seq(dh);
   272		if (sk->sk_state == DCCP_NEW_SYN_RECV)
   273			return dccp_req_err(sk, seq);
   274	
   275		bh_lock_sock(sk);
   276		/* If too many ICMPs get dropped on busy
   277		 * servers this needs to be solved differently.
   278		 */
   279		if (sock_owned_by_user(sk))
   280			__NET_INC_STATS(net, LINUX_MIB_LOCKDROPPEDICMPS);
   281	
   282		if (sk->sk_state == DCCP_CLOSED)
   283			goto out;
   284	
   285		dp = dccp_sk(sk);
   286		if ((1 << sk->sk_state) & ~(DCCPF_REQUESTING | DCCPF_LISTEN) &&
   287		    !between48(seq, dp->dccps_awl, dp->dccps_awh)) {
   288			__NET_INC_STATS(net, LINUX_MIB_OUTOFWINDOWICMPS);
   289			goto out;
   290		}
   291	
   292		switch (type) {
   293		case ICMP_REDIRECT:
   294			if (!sock_owned_by_user(sk))
   295				dccp_do_redirect(skb, sk);
   296			goto out;
   297		case ICMP_SOURCE_QUENCH:
   298			/* Just silently ignore these. */
   299			goto out;
   300		case ICMP_PARAMETERPROB:
   301			err = EPROTO;
   302			break;
   303		case ICMP_DEST_UNREACH:
   304			if (code > NR_ICMP_UNREACH)
   305				goto out;
   306	
   307			if (code == ICMP_FRAG_NEEDED) { /* PMTU discovery (RFC1191) */
   308				if (!sock_owned_by_user(sk))
   309					dccp_do_pmtu_discovery(sk, iph, info);
   310				goto out;
   311			}
   312	
   313			err = icmp_err_convert[code].errno;
   314			break;
   315		case ICMP_TIME_EXCEEDED:
   316			err = EHOSTUNREACH;
   317			break;
   318		default:
   319			goto out;
   320		}
   321	
   322		switch (sk->sk_state) {
   323		case DCCP_REQUESTING:
   324		case DCCP_RESPOND:
   325			if (!sock_owned_by_user(sk)) {
   326				__DCCP_INC_STATS(DCCP_MIB_ATTEMPTFAILS);
   327				sk->sk_err = err;
   328	
   329				sk->sk_error_report(sk);
   330	
   331				dccp_done(sk);
   332			} else
   333				sk->sk_err_soft = err;
   334			goto out;
   335		}
   336	
   337		/* If we've already connected we will keep trying
   338		 * until we time out, or the user gives up.
   339		 *
   340		 * rfc1122 4.2.3.9 allows to consider as hard errors
   341		 * only PROTO_UNREACH and PORT_UNREACH (well, FRAG_FAILED too,
   342		 * but it is obsoleted by pmtu discovery).
   343		 *
   344		 * Note, that in modern internet, where routing is unreliable
   345		 * and in each dark corner broken firewalls sit, sending random
   346		 * errors ordered by their masters even this two messages finally lose
   347		 * their original sense (even Linux sends invalid PORT_UNREACHs)
   348		 *
   349		 * Now we are in compliance with RFCs.
   350		 *							--ANK (980905)
   351		 */
   352	
   353		inet = inet_sk(sk);
   354		if (!sock_owned_by_user(sk) && inet->recverr) {
   355			sk->sk_err = err;
   356			sk->sk_error_report(sk);
   357		} else /* Only an error on timeout */
   358			sk->sk_err_soft = err;
   359	out:
   360		bh_unlock_sock(sk);
   361		sock_put(sk);
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
