Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802884207A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 23:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204647; cv=none; b=DBK9S4vt0s+hBYmVddBg5SKBTPDRbc+i3vYXbc1/v5zKIy5V5CM8IwJ5Wh2LHjV+FQ9roU2/1GcUgfKt1GRKpbge0cBdfda/m2Adp7N3tWq5l9ibF8fynlDAaNXm/G3b/k4FJkmIcK/AwPADNFYBql2Uj5UuNEVAJQHFLdfc/hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204647; c=relaxed/simple;
	bh=m3ogVZWTZ327narc+lAtzj7WnvpVfOx1DHtHVJf3icA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YaX+Q2xG4PutFJej7ZIoypLCXHI0UJeLl2RtMwYRjiMJtQP5koVenmjzc+R/QUOae3Mo03PbBzlHa9GLx3Z5bFZdeRhqtEqWLyrCf4hhEAdMlU8Aenqg8XkkdgocuOd8VqRfoaJE9inIROFjfcC6IqutZaj/pop1wZHv2+Gl7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2iLPc8B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2iLPc8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736204645; x=1767740645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3ogVZWTZ327narc+lAtzj7WnvpVfOx1DHtHVJf3icA=;
  b=T2iLPc8BzMM9ZfaV5u1RJMz/u5nTkHswQYPDxtIVnj1OnwuRiNHY+xBc
   gOWwKpAqgnQqk3Ei2uBPTf9+h/RKMpPfsBh/iu+Hhf4xzc4ElULaePoiU
   T0cyMucRfV7dKWpAMnz78ki/vbJbP5I5YiFuCBRoZ4p3pAcBIDjKs1bg9
   GZ+gwY33yvZ9jxUqhlVEQV4Vj0VFfF58c2+a/ljZdtm4wEpu7tikSyp5T
   ouxFnUSbQX/Ohj4EWM6/kG4L3F+flWALCuh7mWtCTUxk5GIUIuBtZY4R3
   CS6NQzbp77qA7e2vffiv16CYWSuWKQiR1KVI46PelNcxrsMaRrfMANUBD
   Q==;
X-CSE-ConnectionGUID: 5Mi+1ojQTTCbdAGWq5X0bg==
X-CSE-MsgGUID: kFu0znP5STOC9icB2FTOYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36064142"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="36064142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 15:04:04 -0800
X-CSE-ConnectionGUID: 8NB4FpelRjqtbCo0XCCCkA==
X-CSE-MsgGUID: ZSTFgaIgSTmSpQL482AjPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139928173"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Jan 2025 15:04:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUw8e-000E0R-0T;
	Mon, 06 Jan 2025 23:04:00 +0000
Date: Tue, 7 Jan 2025 07:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] net/core/dev.c:4186:19: error:
 'netdev_xmit_skip_txqueue' undeclared here (not in a function); did you mean
 'netdev_cap_txqueue'?
Message-ID: <202501070636.6Tprbdfu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: fe7b450226f1062ff7123939ea7ca9d7e30de61a [1347/1347] bpf: Add fd-based tcx multi-prog infra with link support
config: x86_64-randconfig-161-20250106 (https://download.01.org/0day-ci/archive/20250107/202501070636.6Tprbdfu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070636.6Tprbdfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070636.6Tprbdfu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:8,
                    from net/core/dev.c:71:
>> net/core/dev.c:4186:19: error: 'netdev_xmit_skip_txqueue' undeclared here (not in a function); did you mean 'netdev_cap_txqueue'?
    4186 | EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:100:23: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   net/core/dev.c:4186:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    4186 | EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14:
   net/core/dev.c: In function '__dev_queue_xmit':
   net/core/dev.c:4377:37: error: 'egress_needed_key' undeclared (first use in this function); did you mean 'netstamp_needed_key'?
    4377 |         if (static_branch_unlikely(&egress_needed_key)) {
         |                                     ^~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:496:50: note: in definition of macro 'static_branch_unlikely'
     496 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   net/core/dev.c:4377:37: note: each undeclared identifier is reported only once for each function it appears in
    4377 |         if (static_branch_unlikely(&egress_needed_key)) {
         |                                     ^~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:496:50: note: in definition of macro 'static_branch_unlikely'
     496 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
>> net/core/dev.c:4378:17: error: called object 'netdev_xmit_skip_txqueue' is not a function or function pointer
    4378 |                 netdev_xmit_skip_txqueue(false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4186:19: note: declared here
    4186 | EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:100:28: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   net/core/dev.c:4186:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    4186 | EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
         | ^~~~~~~~~~~~~~~~~
   net/core/dev.c:4383:21: error: implicit declaration of function 'netdev_xmit_txqueue_skipped' [-Werror=implicit-function-declaration]
    4383 |                 if (netdev_xmit_txqueue_skipped())
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4384:31: error: implicit declaration of function 'netdev_tx_queue_mapping'; did you mean 'sk_tx_queue_mapping'? [-Werror=implicit-function-declaration]
    4384 |                         txq = netdev_tx_queue_mapping(dev, skb);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                               sk_tx_queue_mapping
   net/core/dev.c:4384:29: warning: assignment to 'struct netdev_queue *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4384 |                         txq = netdev_tx_queue_mapping(dev, skb);
         |                             ^
   cc1: some warnings being treated as errors


vim +4186 net/core/dev.c

8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4180  
fe7b450226f106 Daniel Borkmann        2023-07-19  4181  static __always_inline struct sk_buff *
fe7b450226f106 Daniel Borkmann        2023-07-19  4182  sch_handle_egress(struct sk_buff *skb, int *ret, struct net_device *dev)
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4183  {
fe7b450226f106 Daniel Borkmann        2023-07-19  4184  	return skb;
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4185  }
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16 @4186  EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
fe7b450226f106 Daniel Borkmann        2023-07-19  4187  #endif /* CONFIG_NET_XGRESS */
1f211a1b929c80 Daniel Borkmann        2016-01-07  4188  
638b2a699fd3ec Jiri Pirko             2015-05-12  4189  #ifdef CONFIG_XPS
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4190  static int __get_xps_queue_idx(struct net_device *dev, struct sk_buff *skb,
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4191  			       struct xps_dev_maps *dev_maps, unsigned int tci)
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4192  {
255c04a87f4381 Antoine Tenart         2021-03-18  4193  	int tc = netdev_get_prio_tc_map(dev, skb->priority);
638b2a699fd3ec Jiri Pirko             2015-05-12  4194  	struct xps_map *map;
638b2a699fd3ec Jiri Pirko             2015-05-12  4195  	int queue_index = -1;
638b2a699fd3ec Jiri Pirko             2015-05-12  4196  
5478fcd0f48322 Antoine Tenart         2021-03-18  4197  	if (tc >= dev_maps->num_tc || tci >= dev_maps->nr_ids)
255c04a87f4381 Antoine Tenart         2021-03-18  4198  		return queue_index;
255c04a87f4381 Antoine Tenart         2021-03-18  4199  
255c04a87f4381 Antoine Tenart         2021-03-18  4200  	tci *= dev_maps->num_tc;
255c04a87f4381 Antoine Tenart         2021-03-18  4201  	tci += tc;
184c449f91fef5 Alexander Duyck        2016-10-28  4202  
80d19669ecd344 Amritha Nambiar        2018-06-29  4203  	map = rcu_dereference(dev_maps->attr_map[tci]);
638b2a699fd3ec Jiri Pirko             2015-05-12  4204  	if (map) {
638b2a699fd3ec Jiri Pirko             2015-05-12  4205  		if (map->len == 1)
638b2a699fd3ec Jiri Pirko             2015-05-12  4206  			queue_index = map->queues[0];
638b2a699fd3ec Jiri Pirko             2015-05-12  4207  		else
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4208  			queue_index = map->queues[reciprocal_scale(
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4209  						skb_get_hash(skb), map->len)];
638b2a699fd3ec Jiri Pirko             2015-05-12  4210  		if (unlikely(queue_index >= dev->real_num_tx_queues))
638b2a699fd3ec Jiri Pirko             2015-05-12  4211  			queue_index = -1;
638b2a699fd3ec Jiri Pirko             2015-05-12  4212  	}
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4213  	return queue_index;
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4214  }
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4215  #endif
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4216  
eadec877ce9ca4 Alexander Duyck        2018-07-09  4217  static int get_xps_queue(struct net_device *dev, struct net_device *sb_dev,
eadec877ce9ca4 Alexander Duyck        2018-07-09  4218  			 struct sk_buff *skb)
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4219  {
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4220  #ifdef CONFIG_XPS
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4221  	struct xps_dev_maps *dev_maps;
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4222  	struct sock *sk = skb->sk;
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4223  	int queue_index = -1;
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4224  
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4225  	if (!static_key_false(&xps_needed))
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4226  		return -1;
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4227  
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4228  	rcu_read_lock();
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4229  	if (!static_key_false(&xps_rxqs_needed))
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4230  		goto get_cpus_map;
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4231  
044ab86d431b59 Antoine Tenart         2021-03-18  4232  	dev_maps = rcu_dereference(sb_dev->xps_maps[XPS_RXQS]);
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4233  	if (dev_maps) {
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4234  		int tci = sk_rx_queue_get(sk);
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4235  
5478fcd0f48322 Antoine Tenart         2021-03-18  4236  		if (tci >= 0)
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4237  			queue_index = __get_xps_queue_idx(dev, skb, dev_maps,
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4238  							  tci);
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4239  	}
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4240  
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4241  get_cpus_map:
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4242  	if (queue_index < 0) {
044ab86d431b59 Antoine Tenart         2021-03-18  4243  		dev_maps = rcu_dereference(sb_dev->xps_maps[XPS_CPUS]);
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4244  		if (dev_maps) {
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4245  			unsigned int tci = skb->sender_cpu - 1;
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4246  
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4247  			queue_index = __get_xps_queue_idx(dev, skb, dev_maps,
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4248  							  tci);
fc9bab24e9c654 Amritha Nambiar        2018-06-29  4249  		}
638b2a699fd3ec Jiri Pirko             2015-05-12  4250  	}
638b2a699fd3ec Jiri Pirko             2015-05-12  4251  	rcu_read_unlock();
638b2a699fd3ec Jiri Pirko             2015-05-12  4252  
638b2a699fd3ec Jiri Pirko             2015-05-12  4253  	return queue_index;
638b2a699fd3ec Jiri Pirko             2015-05-12  4254  #else
638b2a699fd3ec Jiri Pirko             2015-05-12  4255  	return -1;
638b2a699fd3ec Jiri Pirko             2015-05-12  4256  #endif
638b2a699fd3ec Jiri Pirko             2015-05-12  4257  }
638b2a699fd3ec Jiri Pirko             2015-05-12  4258  
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4259  u16 dev_pick_tx_zero(struct net_device *dev, struct sk_buff *skb,
a350eccee5830d Paolo Abeni            2019-03-20  4260  		     struct net_device *sb_dev)
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4261  {
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4262  	return 0;
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4263  }
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4264  EXPORT_SYMBOL(dev_pick_tx_zero);
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4265  
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4266  u16 dev_pick_tx_cpu_id(struct net_device *dev, struct sk_buff *skb,
a350eccee5830d Paolo Abeni            2019-03-20  4267  		       struct net_device *sb_dev)
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4268  {
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4269  	return (u16)raw_smp_processor_id() % dev->real_num_tx_queues;
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4270  }
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4271  EXPORT_SYMBOL(dev_pick_tx_cpu_id);
a4ea8a3dacc312 Alexander Duyck        2018-07-09  4272  
b71b5837f8711d Paolo Abeni            2019-03-20  4273  u16 netdev_pick_tx(struct net_device *dev, struct sk_buff *skb,
eadec877ce9ca4 Alexander Duyck        2018-07-09  4274  		     struct net_device *sb_dev)
638b2a699fd3ec Jiri Pirko             2015-05-12  4275  {
638b2a699fd3ec Jiri Pirko             2015-05-12  4276  	struct sock *sk = skb->sk;
638b2a699fd3ec Jiri Pirko             2015-05-12  4277  	int queue_index = sk_tx_queue_get(sk);
638b2a699fd3ec Jiri Pirko             2015-05-12  4278  
eadec877ce9ca4 Alexander Duyck        2018-07-09  4279  	sb_dev = sb_dev ? : dev;
eadec877ce9ca4 Alexander Duyck        2018-07-09  4280  
638b2a699fd3ec Jiri Pirko             2015-05-12  4281  	if (queue_index < 0 || skb->ooo_okay ||
638b2a699fd3ec Jiri Pirko             2015-05-12  4282  	    queue_index >= dev->real_num_tx_queues) {
eadec877ce9ca4 Alexander Duyck        2018-07-09  4283  		int new_index = get_xps_queue(dev, sb_dev, skb);
f4563a75fb93d6 tcharding              2017-02-09  4284  
638b2a699fd3ec Jiri Pirko             2015-05-12  4285  		if (new_index < 0)
eadec877ce9ca4 Alexander Duyck        2018-07-09  4286  			new_index = skb_tx_hash(dev, sb_dev, skb);
638b2a699fd3ec Jiri Pirko             2015-05-12  4287  
638b2a699fd3ec Jiri Pirko             2015-05-12  4288  		if (queue_index != new_index && sk &&
004a5d0140ce1d Eric Dumazet           2015-10-04  4289  		    sk_fullsock(sk) &&
638b2a699fd3ec Jiri Pirko             2015-05-12  4290  		    rcu_access_pointer(sk->sk_dst_cache))
638b2a699fd3ec Jiri Pirko             2015-05-12  4291  			sk_tx_queue_set(sk, new_index);
638b2a699fd3ec Jiri Pirko             2015-05-12  4292  
638b2a699fd3ec Jiri Pirko             2015-05-12  4293  		queue_index = new_index;
638b2a699fd3ec Jiri Pirko             2015-05-12  4294  	}
638b2a699fd3ec Jiri Pirko             2015-05-12  4295  
638b2a699fd3ec Jiri Pirko             2015-05-12  4296  	return queue_index;
638b2a699fd3ec Jiri Pirko             2015-05-12  4297  }
b71b5837f8711d Paolo Abeni            2019-03-20  4298  EXPORT_SYMBOL(netdev_pick_tx);
638b2a699fd3ec Jiri Pirko             2015-05-12  4299  
4bd97d51a5e602 Paolo Abeni            2019-03-20  4300  struct netdev_queue *netdev_core_pick_tx(struct net_device *dev,
638b2a699fd3ec Jiri Pirko             2015-05-12  4301  					 struct sk_buff *skb,
eadec877ce9ca4 Alexander Duyck        2018-07-09  4302  					 struct net_device *sb_dev)
638b2a699fd3ec Jiri Pirko             2015-05-12  4303  {
638b2a699fd3ec Jiri Pirko             2015-05-12  4304  	int queue_index = 0;
638b2a699fd3ec Jiri Pirko             2015-05-12  4305  
638b2a699fd3ec Jiri Pirko             2015-05-12  4306  #ifdef CONFIG_XPS
52bd2d62ce6758 Eric Dumazet           2015-11-18  4307  	u32 sender_cpu = skb->sender_cpu - 1;
52bd2d62ce6758 Eric Dumazet           2015-11-18  4308  
52bd2d62ce6758 Eric Dumazet           2015-11-18  4309  	if (sender_cpu >= (u32)NR_CPUS)
638b2a699fd3ec Jiri Pirko             2015-05-12  4310  		skb->sender_cpu = raw_smp_processor_id() + 1;
638b2a699fd3ec Jiri Pirko             2015-05-12  4311  #endif
638b2a699fd3ec Jiri Pirko             2015-05-12  4312  
638b2a699fd3ec Jiri Pirko             2015-05-12  4313  	if (dev->real_num_tx_queues != 1) {
638b2a699fd3ec Jiri Pirko             2015-05-12  4314  		const struct net_device_ops *ops = dev->netdev_ops;
f4563a75fb93d6 tcharding              2017-02-09  4315  
638b2a699fd3ec Jiri Pirko             2015-05-12  4316  		if (ops->ndo_select_queue)
a350eccee5830d Paolo Abeni            2019-03-20  4317  			queue_index = ops->ndo_select_queue(dev, skb, sb_dev);
638b2a699fd3ec Jiri Pirko             2015-05-12  4318  		else
4bd97d51a5e602 Paolo Abeni            2019-03-20  4319  			queue_index = netdev_pick_tx(dev, skb, sb_dev);
638b2a699fd3ec Jiri Pirko             2015-05-12  4320  
638b2a699fd3ec Jiri Pirko             2015-05-12  4321  		queue_index = netdev_cap_txqueue(dev, queue_index);
638b2a699fd3ec Jiri Pirko             2015-05-12  4322  	}
638b2a699fd3ec Jiri Pirko             2015-05-12  4323  
638b2a699fd3ec Jiri Pirko             2015-05-12  4324  	skb_set_queue_mapping(skb, queue_index);
638b2a699fd3ec Jiri Pirko             2015-05-12  4325  	return netdev_get_tx_queue(dev, queue_index);
638b2a699fd3ec Jiri Pirko             2015-05-12  4326  }
638b2a699fd3ec Jiri Pirko             2015-05-12  4327  
d29f749e252bcd Dave Jones             2008-07-22  4328  /**
9d08dd3d320fab Jason Wang             2014-01-20  4329   *	__dev_queue_xmit - transmit a buffer
d29f749e252bcd Dave Jones             2008-07-22  4330   *	@skb: buffer to transmit
eadec877ce9ca4 Alexander Duyck        2018-07-09  4331   *	@sb_dev: suboordinate device used for L2 forwarding offload
d29f749e252bcd Dave Jones             2008-07-22  4332   *
d29f749e252bcd Dave Jones             2008-07-22  4333   *	Queue a buffer for transmission to a network device. The caller must
d29f749e252bcd Dave Jones             2008-07-22  4334   *	have set the device and priority and built the buffer before calling
d29f749e252bcd Dave Jones             2008-07-22  4335   *	this function. The function can be called from an interrupt.
d29f749e252bcd Dave Jones             2008-07-22  4336   *
d29f749e252bcd Dave Jones             2008-07-22  4337   *	A negative errno code is returned on a failure. A success does not
d29f749e252bcd Dave Jones             2008-07-22  4338   *	guarantee the frame will be transmitted as it may be dropped due
d29f749e252bcd Dave Jones             2008-07-22  4339   *	to congestion or traffic shaping.
d29f749e252bcd Dave Jones             2008-07-22  4340   *
d29f749e252bcd Dave Jones             2008-07-22  4341   * -----------------------------------------------------------------------------------
d29f749e252bcd Dave Jones             2008-07-22  4342   *      I notice this method can also return errors from the queue disciplines,
d29f749e252bcd Dave Jones             2008-07-22  4343   *      including NET_XMIT_DROP, which is a positive value.  So, errors can also
d29f749e252bcd Dave Jones             2008-07-22  4344   *      be positive.
d29f749e252bcd Dave Jones             2008-07-22  4345   *
d29f749e252bcd Dave Jones             2008-07-22  4346   *      Regardless of the return value, the skb is consumed, so it is currently
d29f749e252bcd Dave Jones             2008-07-22  4347   *      difficult to retry a send to this method.  (You can bump the ref count
d29f749e252bcd Dave Jones             2008-07-22  4348   *      before sending to hold a reference for retry if you are careful.)
d29f749e252bcd Dave Jones             2008-07-22  4349   *
d29f749e252bcd Dave Jones             2008-07-22  4350   *      When calling this method, interrupts MUST be enabled.  This is because
d29f749e252bcd Dave Jones             2008-07-22  4351   *      the BH enable code must have IRQs enabled so that it will not deadlock.
d29f749e252bcd Dave Jones             2008-07-22  4352   *          --BLG
d29f749e252bcd Dave Jones             2008-07-22  4353   */
eadec877ce9ca4 Alexander Duyck        2018-07-09  4354  static int __dev_queue_xmit(struct sk_buff *skb, struct net_device *sb_dev)
^1da177e4c3f41 Linus Torvalds         2005-04-16  4355  {
^1da177e4c3f41 Linus Torvalds         2005-04-16  4356  	struct net_device *dev = skb->dev;
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4357  	struct netdev_queue *txq = NULL;
^1da177e4c3f41 Linus Torvalds         2005-04-16  4358  	struct Qdisc *q;
^1da177e4c3f41 Linus Torvalds         2005-04-16  4359  	int rc = -ENOMEM;
f53c723902d1ac Steffen Klassert       2017-12-20  4360  	bool again = false;
^1da177e4c3f41 Linus Torvalds         2005-04-16  4361  
6d1ccff6278068 Eric Dumazet           2013-02-05  4362  	skb_reset_mac_header(skb);
4613965a11e7e0 Zhengchao Shao         2022-07-15  4363  	skb_assert_len(skb);
6d1ccff6278068 Eric Dumazet           2013-02-05  4364  
e7fd2885385157 Willem de Bruijn       2014-08-04  4365  	if (unlikely(skb_shinfo(skb)->tx_flags & SKBTX_SCHED_TSTAMP))
e7ed11ee945438 Yousuk Seung           2021-01-20  4366  		__skb_tstamp_tx(skb, NULL, NULL, skb->sk, SCM_TSTAMP_SCHED);
e7fd2885385157 Willem de Bruijn       2014-08-04  4367  
^1da177e4c3f41 Linus Torvalds         2005-04-16  4368  	/* Disable soft irqs for various locks below. Also
^1da177e4c3f41 Linus Torvalds         2005-04-16  4369  	 * stops preemption for RCU.
^1da177e4c3f41 Linus Torvalds         2005-04-16  4370  	 */
d4828d85d188dc Herbert Xu             2006-06-22  4371  	rcu_read_lock_bh();
^1da177e4c3f41 Linus Torvalds         2005-04-16  4372  
5bc1421e34ecfe Neil Horman            2011-11-22  4373  	skb_update_prio(skb);
5bc1421e34ecfe Neil Horman            2011-11-22  4374  
1f211a1b929c80 Daniel Borkmann        2016-01-07  4375  	qdisc_pkt_len_init(skb);
fe7b450226f106 Daniel Borkmann        2023-07-19  4376  	tcx_set_ingress(skb, false);
aabf6772cc745f Davidlohr Bueso        2018-05-08  4377  	if (static_branch_unlikely(&egress_needed_key)) {
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16 @4378  		netdev_xmit_skip_txqueue(false);
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4379  
1f211a1b929c80 Daniel Borkmann        2016-01-07  4380  		skb = sch_handle_egress(skb, &rc, dev);
1f211a1b929c80 Daniel Borkmann        2016-01-07  4381  		if (!skb)
1f211a1b929c80 Daniel Borkmann        2016-01-07  4382  			goto out;
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4383  		if (netdev_xmit_txqueue_skipped())
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4384  			txq = netdev_tx_queue_mapping(dev, skb);
1f211a1b929c80 Daniel Borkmann        2016-01-07  4385  	}
fe7b450226f106 Daniel Borkmann        2023-07-19  4386  
0287587884b150 Eric Dumazet           2014-10-05  4387  	/* If device/qdisc don't need skb->dst, release it right now while
0287587884b150 Eric Dumazet           2014-10-05  4388  	 * its hot in this cpu cache.
0287587884b150 Eric Dumazet           2014-10-05  4389  	 */
0287587884b150 Eric Dumazet           2014-10-05  4390  	if (dev->priv_flags & IFF_XMIT_DST_RELEASE)
0287587884b150 Eric Dumazet           2014-10-05  4391  		skb_dst_drop(skb);
0287587884b150 Eric Dumazet           2014-10-05  4392  	else
0287587884b150 Eric Dumazet           2014-10-05  4393  		skb_dst_force(skb);
0287587884b150 Eric Dumazet           2014-10-05  4394  
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4395  	if (!txq)
4bd97d51a5e602 Paolo Abeni            2019-03-20  4396  		txq = netdev_core_pick_tx(dev, skb, sb_dev);
a898def29e4119 Paul E. McKenney       2010-02-22  4397  	q = rcu_dereference_bh(txq->qdisc);
37437bb2e1ae8a David S. Miller        2008-07-16  4398  
cf66ba58b5cb8b Koki Sanagi            2010-08-23  4399  	trace_net_dev_queue(skb);
^1da177e4c3f41 Linus Torvalds         2005-04-16  4400  	if (q->enqueue) {
bbd8a0d3a3b65d Krishna Kumar          2009-08-06  4401  		rc = __dev_xmit_skb(skb, q, dev, txq);
^1da177e4c3f41 Linus Torvalds         2005-04-16  4402  		goto out;
^1da177e4c3f41 Linus Torvalds         2005-04-16  4403  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  4404  
^1da177e4c3f41 Linus Torvalds         2005-04-16  4405  	/* The device has no queue. Common case for software devices:
eb13da1a103a80 tcharding              2017-02-09  4406  	 * loopback, all the sorts of tunnels...
^1da177e4c3f41 Linus Torvalds         2005-04-16  4407  
eb13da1a103a80 tcharding              2017-02-09  4408  	 * Really, it is unlikely that netif_tx_lock protection is necessary
eb13da1a103a80 tcharding              2017-02-09  4409  	 * here.  (f.e. loopback and IP tunnels are clean ignoring statistics
eb13da1a103a80 tcharding              2017-02-09  4410  	 * counters.)
eb13da1a103a80 tcharding              2017-02-09  4411  	 * However, it is possible, that they rely on protection
eb13da1a103a80 tcharding              2017-02-09  4412  	 * made by us here.
^1da177e4c3f41 Linus Torvalds         2005-04-16  4413  
eb13da1a103a80 tcharding              2017-02-09  4414  	 * Check this and shot the lock. It is not prone from deadlocks.
eb13da1a103a80 tcharding              2017-02-09  4415  	 *Either shot noqueue qdisc, it is even simpler 8)
^1da177e4c3f41 Linus Torvalds         2005-04-16  4416  	 */
^1da177e4c3f41 Linus Torvalds         2005-04-16  4417  	if (dev->flags & IFF_UP) {
^1da177e4c3f41 Linus Torvalds         2005-04-16  4418  		int cpu = smp_processor_id(); /* ok because BHs are off */
^1da177e4c3f41 Linus Torvalds         2005-04-16  4419  
94782c8ffd0756 Eric Dumazet           2021-11-30  4420  		/* Other cpus might concurrently change txq->xmit_lock_owner
94782c8ffd0756 Eric Dumazet           2021-11-30  4421  		 * to -1 or to their cpu id, but not to our id.
94782c8ffd0756 Eric Dumazet           2021-11-30  4422  		 */
94782c8ffd0756 Eric Dumazet           2021-11-30  4423  		if (READ_ONCE(txq->xmit_lock_owner) != cpu) {
97cdcf37b57e3f Florian Westphal       2019-04-01  4424  			if (dev_xmit_recursion())
745e20f1b626b1 Eric Dumazet           2010-09-29  4425  				goto recursion_alert;
745e20f1b626b1 Eric Dumazet           2010-09-29  4426  
f53c723902d1ac Steffen Klassert       2017-12-20  4427  			skb = validate_xmit_skb(skb, dev, &again);
1f59533f9ca563 Jesper Dangaard Brouer 2014-09-03  4428  			if (!skb)
d21fd63ea38562 Eric Dumazet           2016-04-12  4429  				goto out;
1f59533f9ca563 Jesper Dangaard Brouer 2014-09-03  4430  
3744741adab6d9 Willy Tarreau          2020-08-10  4431  			PRANDOM_ADD_NOISE(skb, dev, txq, jiffies);
c773e847ea8f68 David S. Miller        2008-07-08  4432  			HARD_TX_LOCK(dev, txq, cpu);
^1da177e4c3f41 Linus Torvalds         2005-04-16  4433  
7346649826382b Tom Herbert            2011-11-28  4434  			if (!netif_xmit_stopped(txq)) {
97cdcf37b57e3f Florian Westphal       2019-04-01  4435  				dev_xmit_recursion_inc();
ce93718fb7cdbc David S. Miller        2014-08-30  4436  				skb = dev_hard_start_xmit(skb, dev, txq, &rc);
97cdcf37b57e3f Florian Westphal       2019-04-01  4437  				dev_xmit_recursion_dec();
572a9d7b6fc7f2 Patrick McHardy        2009-11-10  4438  				if (dev_xmit_complete(rc)) {
c773e847ea8f68 David S. Miller        2008-07-08  4439  					HARD_TX_UNLOCK(dev, txq);
^1da177e4c3f41 Linus Torvalds         2005-04-16  4440  					goto out;
^1da177e4c3f41 Linus Torvalds         2005-04-16  4441  				}
^1da177e4c3f41 Linus Torvalds         2005-04-16  4442  			}
c773e847ea8f68 David S. Miller        2008-07-08  4443  			HARD_TX_UNLOCK(dev, txq);
e87cc4728f0e2f Joe Perches            2012-05-13  4444  			net_crit_ratelimited("Virtual device %s asks to queue packet!\n",
7b6cd1ce72176e Joe Perches            2012-02-01  4445  					     dev->name);
^1da177e4c3f41 Linus Torvalds         2005-04-16  4446  		} else {
^1da177e4c3f41 Linus Torvalds         2005-04-16  4447  			/* Recursion is detected! It is possible,
745e20f1b626b1 Eric Dumazet           2010-09-29  4448  			 * unfortunately
745e20f1b626b1 Eric Dumazet           2010-09-29  4449  			 */
745e20f1b626b1 Eric Dumazet           2010-09-29  4450  recursion_alert:
e87cc4728f0e2f Joe Perches            2012-05-13  4451  			net_crit_ratelimited("Dead loop on virtual device %s, fix it urgently!\n",
7b6cd1ce72176e Joe Perches            2012-02-01  4452  					     dev->name);
^1da177e4c3f41 Linus Torvalds         2005-04-16  4453  		}
^1da177e4c3f41 Linus Torvalds         2005-04-16  4454  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  4455  
^1da177e4c3f41 Linus Torvalds         2005-04-16  4456  	rc = -ENETDOWN;
d4828d85d188dc Herbert Xu             2006-06-22  4457  	rcu_read_unlock_bh();
^1da177e4c3f41 Linus Torvalds         2005-04-16  4458  
015f0688f57ca4 Eric Dumazet           2014-03-27  4459  	atomic_long_inc(&dev->tx_dropped);
1f59533f9ca563 Jesper Dangaard Brouer 2014-09-03  4460  	kfree_skb_list(skb);
^1da177e4c3f41 Linus Torvalds         2005-04-16  4461  	return rc;
^1da177e4c3f41 Linus Torvalds         2005-04-16  4462  out:
d4828d85d188dc Herbert Xu             2006-06-22  4463  	rcu_read_unlock_bh();
^1da177e4c3f41 Linus Torvalds         2005-04-16  4464  	return rc;
^1da177e4c3f41 Linus Torvalds         2005-04-16  4465  }
f663dd9aaf9ed1 Jason Wang             2014-01-10  4466  

:::::: The code at line 4186 was first introduced by commit
:::::: 8c96f7dbb5d5ead0dbce8b499eb91773e5040de4 net: sched: use queue_mapping to pick tx queue

:::::: TO: Tonghao Zhang <xiangxia.m.yue@gmail.com>
:::::: CC: root <root@bytedance.localdomain>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
