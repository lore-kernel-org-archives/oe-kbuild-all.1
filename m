Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31811EB36
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705495806; cv=none; b=qS+l54tgj+ExsJffylAgZPrAtyNCbE7MQ9cuGmGlqj56UC9c2OK4fZAgC0guZ06bqK9KyOGkLnApIZvdd9YGRUgqZWM21IJicYV7a/HEr6By+RUzzLHwSRYCiadICR0g26avqLhyu5RJAU0Ikkkoy4inoJ9DDd9uOV5/EU9vHMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705495806; c=relaxed/simple;
	bh=gWmplqSPgqzv1AUnSJP6ov5oKuGh+kndFSOLa0+h9yY=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=gO/UZZxmfSIBpSCAeaalGcipgUBmeVxUMbbeaKzClQHSJelAfTH2+vOA6SQ+u/Ei2YWNZUogR5oTuPkCe84Es6j/4diJdapVT3GPRfiWqdg2yjPtgmRxGM5r0AbIrO4mKJR1M3I4zNu9W19wNYdMENIyqQNx//cE4LP9OeDQ0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYVv6bC5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYVv6bC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705495805; x=1737031805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWmplqSPgqzv1AUnSJP6ov5oKuGh+kndFSOLa0+h9yY=;
  b=YYVv6bC5h6U67VQll2pSyaROsXbWmQyec85t8zlHmXxp0HgC726eps5i
   zzEF1OYnwTVJAA0HPItPVOA9WOwhCOz8z/TzYcESlCO/U2E6uokPWEkVb
   KSRiXffcNWZ+jQjfZRbzhdAd5m+CBE0S1icIwr0opzL0AD/uDytCdSd4m
   0s36qBlXYbpm0avcZurR6uIasWS3GdPm+DFx0n5rVVK7ZNiQe7tlLHImL
   RSyp6Ew11FqXCpP8L8d4isaFDndPr6NVv18DumQC5SNjSnNkcNlUepLx4
   6jMKKogS3rVQrg14+tcvbZ8R3imU86sXAr2HSKvHVKF7qN7NpfKbNYeVY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6913585"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6913585"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 04:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="22348"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jan 2024 04:50:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ5Mm-00020N-07;
	Wed, 17 Jan 2024 12:50:00 +0000
Date: Wed, 17 Jan 2024 20:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>
Subject: [bpf-next:master 32/36] net/core/filter.c:11842:48: warning: 'struct
 bpf_tcp_req_attrs' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202401172023.YWRhXvC2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   be7c19de9ecf4d93a9908003a1a3b8f1e8f8a672
commit: b9c3eca5c086eb65f20ad92fe3aa3d556f23103b [32/36] bpf: tcp: Support arbitrary SYN Cookie.
config: i386-buildonly-randconfig-003-20240117 (https://download.01.org/0day-ci/archive/20240117/202401172023.YWRhXvC2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401172023.YWRhXvC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401172023.YWRhXvC2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/filter.c:11842:48: warning: 'struct bpf_tcp_req_attrs' declared inside parameter list will not be visible outside of this definition or declaration
   11842 |                                         struct bpf_tcp_req_attrs *attrs, int attrs__sz)
         |                                                ^~~~~~~~~~~~~~~~~


vim +11842 net/core/filter.c

 11840	
 11841	__bpf_kfunc int bpf_sk_assign_tcp_reqsk(struct sk_buff *skb, struct sock *sk,
 11842						struct bpf_tcp_req_attrs *attrs, int attrs__sz)
 11843	{
 11844	#if IS_ENABLED(CONFIG_SYN_COOKIES)
 11845		const struct request_sock_ops *ops;
 11846		struct inet_request_sock *ireq;
 11847		struct tcp_request_sock *treq;
 11848		struct request_sock *req;
 11849		struct net *net;
 11850		__u16 min_mss;
 11851		u32 tsoff = 0;
 11852	
 11853		if (attrs__sz != sizeof(*attrs) ||
 11854		    attrs->reserved[0] || attrs->reserved[1] || attrs->reserved[2])
 11855			return -EINVAL;
 11856	
 11857		if (!skb_at_tc_ingress(skb))
 11858			return -EINVAL;
 11859	
 11860		net = dev_net(skb->dev);
 11861		if (net != sock_net(sk))
 11862			return -ENETUNREACH;
 11863	
 11864		switch (skb->protocol) {
 11865		case htons(ETH_P_IP):
 11866			ops = &tcp_request_sock_ops;
 11867			min_mss = 536;
 11868			break;
 11869	#if IS_BUILTIN(CONFIG_IPV6)
 11870		case htons(ETH_P_IPV6):
 11871			ops = &tcp6_request_sock_ops;
 11872			min_mss = IPV6_MIN_MTU - 60;
 11873			break;
 11874	#endif
 11875		default:
 11876			return -EINVAL;
 11877		}
 11878	
 11879		if (sk->sk_type != SOCK_STREAM || sk->sk_state != TCP_LISTEN ||
 11880		    sk_is_mptcp(sk))
 11881			return -EINVAL;
 11882	
 11883		if (attrs->mss < min_mss)
 11884			return -EINVAL;
 11885	
 11886		if (attrs->wscale_ok) {
 11887			if (!READ_ONCE(net->ipv4.sysctl_tcp_window_scaling))
 11888				return -EINVAL;
 11889	
 11890			if (attrs->snd_wscale > TCP_MAX_WSCALE ||
 11891			    attrs->rcv_wscale > TCP_MAX_WSCALE)
 11892				return -EINVAL;
 11893		}
 11894	
 11895		if (attrs->sack_ok && !READ_ONCE(net->ipv4.sysctl_tcp_sack))
 11896			return -EINVAL;
 11897	
 11898		if (attrs->tstamp_ok) {
 11899			if (!READ_ONCE(net->ipv4.sysctl_tcp_timestamps))
 11900				return -EINVAL;
 11901	
 11902			tsoff = attrs->rcv_tsecr - tcp_ns_to_ts(attrs->usec_ts_ok, tcp_clock_ns());
 11903		}
 11904	
 11905		req = inet_reqsk_alloc(ops, sk, false);
 11906		if (!req)
 11907			return -ENOMEM;
 11908	
 11909		ireq = inet_rsk(req);
 11910		treq = tcp_rsk(req);
 11911	
 11912		req->rsk_listener = sk;
 11913		req->syncookie = 1;
 11914		req->mss = attrs->mss;
 11915		req->ts_recent = attrs->rcv_tsval;
 11916	
 11917		ireq->snd_wscale = attrs->snd_wscale;
 11918		ireq->rcv_wscale = attrs->rcv_wscale;
 11919		ireq->tstamp_ok	= !!attrs->tstamp_ok;
 11920		ireq->sack_ok = !!attrs->sack_ok;
 11921		ireq->wscale_ok = !!attrs->wscale_ok;
 11922		ireq->ecn_ok = !!attrs->ecn_ok;
 11923	
 11924		treq->req_usec_ts = !!attrs->usec_ts_ok;
 11925		treq->ts_off = tsoff;
 11926	
 11927		skb_orphan(skb);
 11928		skb->sk = req_to_sk(req);
 11929		skb->destructor = sock_pfree;
 11930	
 11931		return 0;
 11932	#else
 11933		return -EOPNOTSUPP;
 11934	#endif
 11935	}
 11936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
