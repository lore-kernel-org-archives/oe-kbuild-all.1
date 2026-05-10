Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6724378D7D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 15:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425490; cv=none; b=r6UaKY3IqtlsvU5svI0UP5Nwe+ARzX/4wxekNEvoI1LrLgobiiTDP33LHxw0j2xy8OqSU5c6/lmvSyRexKhy2xFop+0mTuyI/ZSz0lmPBi6mcfLwyKbtx9RzOo0xio3ilGScaZRF3ChqlG6osede+puulMMjlHTS26aMUzNh9Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425490; c=relaxed/simple;
	bh=/24kqQZt5fgex+1Al0GOrywPpLYgIIkB/qe/YkhQH74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oIGYQk0eSomLHvsT7xgVJIW+xbfcI3XzI15v5KjGtrR9ZmAL/h9Uw0bIm3cQnPZ/4ABkxpfXIo6m28sucUGk/8o6pwS/7Z545VK6cUztmYE573cvQuiJlaPnrT0r3LKWEOKrHJ5ehTW1lbrpUS705mfXkSfUfMWeVFNO8Huv5CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEC7XuMt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEC7XuMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778425488; x=1809961488;
  h=date:from:to:cc:subject:message-id;
  bh=/24kqQZt5fgex+1Al0GOrywPpLYgIIkB/qe/YkhQH74=;
  b=FEC7XuMtrp8NKOB5jmQoerWGagvZ27+VBLWNFiWNSrRfavBE/zxLwTbI
   b4X8xVfN1BPtjcza2lQKUFgrtSOqWm3vbYvRNPr2CQzVA57mfvYEBOQ+c
   XkOo5i+HSE2msOGkZ/EV8XoNd/igmWSUYR/Bym6msRbhGUT85mTrYuoPV
   1B7lMjFfHoqQAv3/OvUfkWkB7OMePSOGP7FiR8VW78bxTDWDGzTQcVvdX
   j4mLVdZv2eyo+GMxm7DvF5IVw7Jk+1z9lGCh3OGyT4zZE5GUMOodmUO17
   JbsUKIwYW86zYbL+/o8MJCi0oFdm08/prt4Q5gTs/0iAWXZORTZZSIniM
   A==;
X-CSE-ConnectionGUID: t14DmzGvTHWKgWuQFihKSQ==
X-CSE-MsgGUID: 4AztsbYHR/iVz8DGX67a6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90031483"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="90031483"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 08:04:47 -0700
X-CSE-ConnectionGUID: SZ+ocuklR26KwwMc+IbEYA==
X-CSE-MsgGUID: 6sM0OfkxQLKZmTwV4RryhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="242201645"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2026 08:04:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM5hz-000000007jt-2Ueh;
	Sun, 10 May 2026 15:04:43 +0000
Date: Sun, 10 May 2026 17:03:56 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/sched/sch_api.c:1887:23: warning: variable 's_ifindex'
 set but not used
Message-ID: <202605101642.e72sQP5k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-sched-propagate-tc_fill_tclass-error/20260429-013047
head:   a5f5c2e78a55b426002e6d55e33d1e953d765d30
commit: 911ca826d83a40fee2fd8e0b2540c88b67379478 net/sched: switch tc_dump_qdisc() to for_each_netdev_dump()
date:   12 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260510/202605101642.e72sQP5k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101642.e72sQP5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101642.e72sQP5k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/sch_api.c: In function 'tc_dump_qdisc':
>> net/sched/sch_api.c:1887:23: warning: variable 's_ifindex' set but not used [-Wunused-but-set-variable]
    1887 |         unsigned long s_ifindex;
         |                       ^~~~~~~~~


vim +/s_ifindex +1887 net/sched/sch_api.c

  1877	
  1878	static int tc_dump_qdisc(struct sk_buff *skb, struct netlink_callback *cb)
  1879	{
  1880		const struct nlmsghdr *nlh = cb->nlh;
  1881		struct net *net = sock_net(skb->sk);
  1882		struct nlattr *tca[TCA_MAX + 1];
  1883		struct {
  1884			unsigned long ifindex;
  1885			int q_idx;
  1886		} *ctx = (void *)cb->ctx;
> 1887		unsigned long s_ifindex;
  1888		struct net_device *dev;
  1889		int s_q_idx, q_idx;
  1890		int err;
  1891	
  1892		ASSERT_RTNL();
  1893	
  1894		err = nlmsg_parse_deprecated(nlh, sizeof(struct tcmsg), tca, TCA_MAX,
  1895					     rtm_tca_policy, cb->extack);
  1896		if (err < 0)
  1897			return err;
  1898	
  1899		s_ifindex = ctx->ifindex;
  1900		s_q_idx = ctx->q_idx;
  1901	
  1902		for_each_netdev_dump(net, dev, ctx->ifindex) {
  1903			struct netdev_queue *dev_queue;
  1904			struct Qdisc *q;
  1905	
  1906			q_idx = 0;
  1907	
  1908			netdev_lock_ops(dev);
  1909			q = rtnl_dereference(dev->qdisc);
  1910			err = tc_dump_qdisc_root(q, skb, cb, &q_idx, s_q_idx,
  1911						 true, tca[TCA_DUMP_INVISIBLE]);
  1912			if (err < 0)
  1913				goto error_unlock;
  1914	
  1915			dev_queue = dev_ingress_queue(dev);
  1916			if (dev_queue) {
  1917				q = rtnl_dereference(dev_queue->qdisc_sleeping);
  1918				err = tc_dump_qdisc_root(q, skb, cb, &q_idx, s_q_idx,
  1919							 false, tca[TCA_DUMP_INVISIBLE]);
  1920				if (err < 0)
  1921					goto error_unlock;
  1922			}
  1923			netdev_unlock_ops(dev);
  1924			s_q_idx = 0;
  1925		}
  1926		return skb->len;
  1927	
  1928	error_unlock:
  1929		netdev_unlock_ops(dev);
  1930		ctx->q_idx = q_idx;
  1931	
  1932		return err;
  1933	}
  1934	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
