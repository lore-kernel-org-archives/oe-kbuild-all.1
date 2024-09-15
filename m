Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A041C9ECC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726428186; cv=none; b=MaX9gz0+X15H3dIeWk5q8dQns8b9Fmuy4wgeR6h5C6yFaNUgZQ0WCHARz2JBagFATUi0CUMv7L/jPsr+STrQz+WcYdQy5DpifXxVv1e3iGAEq6huRJsLVq/cNduiL+/WtteTzOubOADy8fY4PloTJla4tiPsgxQf4IVSPWqS4BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726428186; c=relaxed/simple;
	bh=+kDJHFI2SVcVLrazvw3WQFapwoK5IG4nijsiH4UgZ5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFWKvKsv9cwhS9z9/u5IWZNEoN5h4BqcVRxf0tE5mnP2TGQNpWK/T57uC3BZHMHy/Puld1GK5G1qE1sZHFzgfBhIHnfUeLHZNwMHb/lnC1UkyHJ2lEIBUDUZYAVrBgPbUGZI1UNBYJXMS/ohkEhjOgNpAZ0/1lHrIVfAJic38fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bP3PvBA8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bP3PvBA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726428184; x=1757964184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kDJHFI2SVcVLrazvw3WQFapwoK5IG4nijsiH4UgZ5Q=;
  b=bP3PvBA8xe84SMVSy0tkdpLWVKLvTUGxxiBv6sVFYExY/nXj3cck5hmb
   4A7qTiVeYNG8NLhV4WtO8oaqcKmO6q8WWzrAqenlcAHFxASnVE5Kl3M/Z
   hqeXJhcx/lUMChSeppRFOMv/dpZcpgZMZlOzTWbAFWf+Ira5I1uKxMrrS
   tiK6geK4+N+0pL7zYv4Lmy202X0fgZV113P0gqtMEbcjEmAkhNP9z8FMs
   XNQwbkAmMXXbN0LAkNq5VRODR7qzb/1k7fwrlpf3IFKJ8udJawsPM0Np1
   XtBeb6HYtYfNC2tEhYAMZUwS8r0ye5RzN4XhiJVlCbt1keEIxXceFVG5d
   w==;
X-CSE-ConnectionGUID: M73/E1hoSy+V492vHdPqXw==
X-CSE-MsgGUID: mklnhbNPTLam+CnL3rxEWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25415386"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25415386"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 12:23:01 -0700
X-CSE-ConnectionGUID: GQCC8ND7Ri+q7n+vGmUzrQ==
X-CSE-MsgGUID: QJBGEi5MRUO3p+gciMdCFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="73508812"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2024 12:23:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spupm-0008yY-0G;
	Sun, 15 Sep 2024 19:22:58 +0000
Date: Mon, 16 Sep 2024 03:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 4481/23714] net/tipc/topsrv.c:374:30:
 sparse: sparse: cast from restricted __be32
Message-ID: <202409160357.101L4Sn7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: b8d954fb09872d1a3f0962b3590ecf87574ced1d [4481/23714] tipc: fix cancellation of topology subscriptions
config: x86_64-randconfig-122-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160357.101L4Sn7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160357.101L4Sn7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160357.101L4Sn7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/tipc/topsrv.c:374:30: sparse: sparse: cast from restricted __be32
>> net/tipc/topsrv.c:374:30: sparse: sparse: cast from restricted __be32
>> net/tipc/topsrv.c:374:30: sparse: sparse: cast from restricted __be32
>> net/tipc/topsrv.c:374:30: sparse: sparse: cast from restricted __be32
   In file included from include/linux/if_ether.h:23,
                    from include/uapi/linux/ethtool.h:19,
                    from include/linux/ethtool.h:18,
                    from include/linux/netdevice.h:41,
                    from net/tipc/core.h:52,
                    from net/tipc/topsrv.h:40,
                    from net/tipc/subscr.h:40,
                    from net/tipc/topsrv.c:37:
   In function '__skb_insert',
       inlined from '__skb_queue_before' at include/linux/skbuff.h:1832:2,
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1866:2,
       inlined from 'tipc_topsrv_kern_evt' at net/tipc/topsrv.c:618:2:
   include/linux/skbuff.h:1726:34: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds]
    1726 |         next->prev  = prev->next = newsk;
         |                       ~~~~~~~~~~~^~~~~~~
   net/tipc/topsrv.c: In function 'tipc_topsrv_kern_evt':
   net/tipc/topsrv.c:608:29: note: object 'evtq' of size 80
     608 |         struct sk_buff_head evtq;
         |                             ^~~~
   In function '__skb_insert',
       inlined from '__skb_queue_before' at include/linux/skbuff.h:1832:2,
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1866:2,
       inlined from 'tipc_topsrv_kern_evt' at net/tipc/topsrv.c:618:2:
   include/linux/skbuff.h:1726:21: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds]
    1726 |         next->prev  = prev->next = newsk;
         |         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   net/tipc/topsrv.c: In function 'tipc_topsrv_kern_evt':
   net/tipc/topsrv.c:608:29: note: object 'evtq' of size 80
     608 |         struct sk_buff_head evtq;
         |                             ^~~~
   net/tipc/topsrv.c:82: warning: Function parameter or member 'awork' not described in 'tipc_topsrv'
   net/tipc/topsrv.c:82: warning: Function parameter or member 'listener' not described in 'tipc_topsrv'
   net/tipc/topsrv.o: warning: objtool: tipc_conn_delete_sub()+0x15d: sibling call from callable instruction with modified stack frame
   net/tipc/topsrv.o: warning: objtool: tipc_topsrv_kern_evt()+0x192: sibling call from callable instruction with modified stack frame
   net/tipc/topsrv.o: warning: objtool: tipc_conn_rcv_sub()+0x1e9: sibling call from callable instruction with modified stack frame
   net/tipc/topsrv.o: warning: objtool: tipc_conn_send_to_sock()+0x2cc: sibling call from callable instruction with modified stack frame
   net/tipc/topsrv.o: warning: objtool: tipc_topsrv_queue_evt()+0x115: sibling call from callable instruction with modified stack frame
   net/tipc/topsrv.o: warning: objtool: tipc_topsrv_kern_subscr()+0x402: sibling call from callable instruction with modified stack frame
   net/tipc/topsrv.o: warning: objtool: tipc_topsrv_kern_unsubscr()+0x108: sibling call from callable instruction with modified stack frame
   net/tipc/topsrv.o: warning: objtool: tipc_topsrv_start()+0x51c: sibling call from callable instruction with modified stack frame
   net/tipc/topsrv.o: warning: objtool: tipc_topsrv_stop()+0x10e: sibling call from callable instruction with modified stack frame

vim +374 net/tipc/topsrv.c

   365	
   366	static int tipc_conn_rcv_sub(struct tipc_topsrv *srv,
   367				     struct tipc_conn *con,
   368				     struct tipc_subscr *s)
   369	{
   370		struct tipc_net *tn = tipc_net(srv->net);
   371		struct tipc_subscription *sub;
   372	
   373		if (tipc_sub_read(s, filter) & TIPC_SUB_CANCEL) {
 > 374			s->filter &= __constant_ntohl(~TIPC_SUB_CANCEL);
   375			tipc_conn_delete_sub(con, s);
   376			return 0;
   377		}
   378		if (atomic_read(&tn->subscription_count) >= TIPC_MAX_SUBSCR) {
   379			pr_warn("Subscription rejected, max (%u)\n", TIPC_MAX_SUBSCR);
   380			return -1;
   381		}
   382		sub = tipc_sub_subscribe(srv->net, s, con->conid);
   383		if (!sub)
   384			return -1;
   385		atomic_inc(&tn->subscription_count);
   386		spin_lock_bh(&con->sub_lock);
   387		list_add(&sub->sub_list, &con->sub_list);
   388		spin_unlock_bh(&con->sub_lock);
   389		return 0;
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
