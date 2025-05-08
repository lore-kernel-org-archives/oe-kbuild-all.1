Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0FF28B7C5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 19:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734207; cv=none; b=Ss6YvMmm53oIGUG54LSR9gUmldovNJF6DEbBZZrwg3O9+iv/49078SmXkqNkI+VNSDeXR4CmG/cB0ang62WZ+d58Z+0iVMUv0ZCt91fGwpdgPelHAHqS3yTxq0sw3fcKADPpoFk5uNroXKw+QKaIEnW9YbzgdmK7oOkwz8sV4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734207; c=relaxed/simple;
	bh=XnzgMImy4UjTxtjsVJwTh4n87uWwg4WHO7hc/TjuJ8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YW5unI1tJMZ63O7Is8w0nhZooyI4JIQjlVOp0YxXO+ftG+fAgpxIX8FCns1jo3/kX5O0Pd4fcxZt/G9FptJUq120CELaFLVj7LFKUWw0Ad2SDK6ruLaf/jGbPTkm0aQDeswV9UqtWiKVCuTAe41pAcB+exDtReFgKDmAQYDCMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1KGGKyx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1KGGKyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746734204; x=1778270204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XnzgMImy4UjTxtjsVJwTh4n87uWwg4WHO7hc/TjuJ8Q=;
  b=F1KGGKyx93YSIEt5vT392jM0Dcg9RgVyPZ90YAjSKndhwbJKE+dSoklY
   rHA2YrL+cUmENINTBv5EbJjh7bsQfud4Qi0XayLpyTDIjZ47dMNFwfRlF
   o0GpmMAh69XreBuCO9UI/GErmAd1SWc5Fj/Xd0xL9uOGQ41BpxgJ2Pw1T
   KNFrXYJ/W1whvt8/bYdbyBAdI9mMODfLlxngzDxZlBYIj8vdx63CILPDV
   bsczZ43dQIPxZ8GFkO/1a+GZ+Ee1PmHvgsBFA+gOsM7n+lThGT/Z6waj0
   M1w80SG7alz5f/Af1pHXNpsJ2/RmppTO7S5e3d6zwaXU36sOfDEl0vqAJ
   A==;
X-CSE-ConnectionGUID: Kw7/mIG+TfWJwniVGv5Mww==
X-CSE-MsgGUID: 5QXNG1MTTQCQd22tPLL0ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48690433"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48690433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:56:40 -0700
X-CSE-ConnectionGUID: 0TsqixPiQ0m0wgUq9tLKfg==
X-CSE-MsgGUID: pwEQsPhtTa2ms+sJ5wdS9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136337606"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 12:56:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD7MC-000BK3-2A;
	Thu, 08 May 2025 19:56:36 +0000
Date: Fri, 9 May 2025 03:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1/1] net/core/dev.c:4384:8: warning:
 assignment makes pointer from integer without a cast
Message-ID: <202505090311.tMYvpK9D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: fe7b450226f1062ff7123939ea7ca9d7e30de61a [1/1] bpf: Add fd-based tcx multi-prog infra with link support
config: arm64-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090311.tMYvpK9D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090311.tMYvpK9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090311.tMYvpK9D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7:0,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from net/core/dev.c:71:
   net/core/dev.c:4186:19: error: 'netdev_xmit_skip_txqueue' undeclared here (not in a function); did you mean 'netdev_cap_txqueue'?
    EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
                      ^
   include/linux/export.h:100:16: note: in definition of macro '___EXPORT_SYMBOL'
     extern typeof(sym) sym;       \
                   ^~~
   include/linux/export.h:161:34: note: in expansion of macro '__EXPORT_SYMBOL'
    #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
                                     ^~~~~~~~~~~~~~~
   include/linux/export.h:165:33: note: in expansion of macro '_EXPORT_SYMBOL'
    #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
                                    ^~~~~~~~~~~~~~
   net/core/dev.c:4186:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
    ^~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/cpufeature.h:20:0,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from net/core/dev.c:71:
   net/core/dev.c: In function '__dev_queue_xmit':
   net/core/dev.c:4377:30: error: 'egress_needed_key' undeclared (first use in this function); did you mean 'netstamp_needed_key'?
     if (static_branch_unlikely(&egress_needed_key)) {
                                 ^
   include/linux/jump_label.h:496:43: note: in definition of macro 'static_branch_unlikely'
     if (__builtin_types_compatible_p(typeof(*x), struct static_key_true)) \
                                              ^
   net/core/dev.c:4377:30: note: each undeclared identifier is reported only once for each function it appears in
     if (static_branch_unlikely(&egress_needed_key)) {
                                 ^
   include/linux/jump_label.h:496:43: note: in definition of macro 'static_branch_unlikely'
     if (__builtin_types_compatible_p(typeof(*x), struct static_key_true)) \
                                              ^
   net/core/dev.c:4378:3: error: called object 'netdev_xmit_skip_txqueue' is not a function or function pointer
      netdev_xmit_skip_txqueue(false);
      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7:0,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from net/core/dev.c:71:
   net/core/dev.c:4186:19: note: declared here
    EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
                      ^
   include/linux/export.h:100:21: note: in definition of macro '___EXPORT_SYMBOL'
     extern typeof(sym) sym;       \
                        ^~~
   include/linux/export.h:161:34: note: in expansion of macro '__EXPORT_SYMBOL'
    #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
                                     ^~~~~~~~~~~~~~~
   include/linux/export.h:165:33: note: in expansion of macro '_EXPORT_SYMBOL'
    #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
                                    ^~~~~~~~~~~~~~
   net/core/dev.c:4186:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(netdev_xmit_skip_txqueue);
    ^~~~~~~~~~~~~~~~~
   net/core/dev.c:4383:7: error: implicit declaration of function 'netdev_xmit_txqueue_skipped'; did you mean 'netif_tx_queue_stopped'? [-Werror=implicit-function-declaration]
      if (netdev_xmit_txqueue_skipped())
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
          netif_tx_queue_stopped
   net/core/dev.c:4384:10: error: implicit declaration of function 'netdev_tx_queue_mapping'; did you mean 'sk_tx_queue_mapping'? [-Werror=implicit-function-declaration]
       txq = netdev_tx_queue_mapping(dev, skb);
             ^~~~~~~~~~~~~~~~~~~~~~~
             sk_tx_queue_mapping
>> net/core/dev.c:4384:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
       txq = netdev_tx_queue_mapping(dev, skb);
           ^
   cc1: some warnings being treated as errors


vim +4384 net/core/dev.c

638b2a699fd3ec9 Jiri Pirko             2015-05-12  4327  
d29f749e252bcdb Dave Jones             2008-07-22  4328  /**
9d08dd3d320fab4 Jason Wang             2014-01-20  4329   *	__dev_queue_xmit - transmit a buffer
d29f749e252bcdb Dave Jones             2008-07-22  4330   *	@skb: buffer to transmit
eadec877ce9ca46 Alexander Duyck        2018-07-09  4331   *	@sb_dev: suboordinate device used for L2 forwarding offload
d29f749e252bcdb Dave Jones             2008-07-22  4332   *
d29f749e252bcdb Dave Jones             2008-07-22  4333   *	Queue a buffer for transmission to a network device. The caller must
d29f749e252bcdb Dave Jones             2008-07-22  4334   *	have set the device and priority and built the buffer before calling
d29f749e252bcdb Dave Jones             2008-07-22  4335   *	this function. The function can be called from an interrupt.
d29f749e252bcdb Dave Jones             2008-07-22  4336   *
d29f749e252bcdb Dave Jones             2008-07-22  4337   *	A negative errno code is returned on a failure. A success does not
d29f749e252bcdb Dave Jones             2008-07-22  4338   *	guarantee the frame will be transmitted as it may be dropped due
d29f749e252bcdb Dave Jones             2008-07-22  4339   *	to congestion or traffic shaping.
d29f749e252bcdb Dave Jones             2008-07-22  4340   *
d29f749e252bcdb Dave Jones             2008-07-22  4341   * -----------------------------------------------------------------------------------
d29f749e252bcdb Dave Jones             2008-07-22  4342   *      I notice this method can also return errors from the queue disciplines,
d29f749e252bcdb Dave Jones             2008-07-22  4343   *      including NET_XMIT_DROP, which is a positive value.  So, errors can also
d29f749e252bcdb Dave Jones             2008-07-22  4344   *      be positive.
d29f749e252bcdb Dave Jones             2008-07-22  4345   *
d29f749e252bcdb Dave Jones             2008-07-22  4346   *      Regardless of the return value, the skb is consumed, so it is currently
d29f749e252bcdb Dave Jones             2008-07-22  4347   *      difficult to retry a send to this method.  (You can bump the ref count
d29f749e252bcdb Dave Jones             2008-07-22  4348   *      before sending to hold a reference for retry if you are careful.)
d29f749e252bcdb Dave Jones             2008-07-22  4349   *
d29f749e252bcdb Dave Jones             2008-07-22  4350   *      When calling this method, interrupts MUST be enabled.  This is because
d29f749e252bcdb Dave Jones             2008-07-22  4351   *      the BH enable code must have IRQs enabled so that it will not deadlock.
d29f749e252bcdb Dave Jones             2008-07-22  4352   *          --BLG
d29f749e252bcdb Dave Jones             2008-07-22  4353   */
eadec877ce9ca46 Alexander Duyck        2018-07-09  4354  static int __dev_queue_xmit(struct sk_buff *skb, struct net_device *sb_dev)
^1da177e4c3f415 Linus Torvalds         2005-04-16  4355  {
^1da177e4c3f415 Linus Torvalds         2005-04-16  4356  	struct net_device *dev = skb->dev;
8c96f7dbb5d5ead Tonghao Zhang          2022-04-16  4357  	struct netdev_queue *txq = NULL;
^1da177e4c3f415 Linus Torvalds         2005-04-16  4358  	struct Qdisc *q;
^1da177e4c3f415 Linus Torvalds         2005-04-16  4359  	int rc = -ENOMEM;
f53c723902d1ac5 Steffen Klassert       2017-12-20  4360  	bool again = false;
^1da177e4c3f415 Linus Torvalds         2005-04-16  4361  
6d1ccff62780682 Eric Dumazet           2013-02-05  4362  	skb_reset_mac_header(skb);
4613965a11e7e0e Zhengchao Shao         2022-07-15  4363  	skb_assert_len(skb);
6d1ccff62780682 Eric Dumazet           2013-02-05  4364  
e7fd2885385157d Willem de Bruijn       2014-08-04  4365  	if (unlikely(skb_shinfo(skb)->tx_flags & SKBTX_SCHED_TSTAMP))
e7ed11ee945438b Yousuk Seung           2021-01-20  4366  		__skb_tstamp_tx(skb, NULL, NULL, skb->sk, SCM_TSTAMP_SCHED);
e7fd2885385157d Willem de Bruijn       2014-08-04  4367  
^1da177e4c3f415 Linus Torvalds         2005-04-16  4368  	/* Disable soft irqs for various locks below. Also
^1da177e4c3f415 Linus Torvalds         2005-04-16  4369  	 * stops preemption for RCU.
^1da177e4c3f415 Linus Torvalds         2005-04-16  4370  	 */
d4828d85d188dc7 Herbert Xu             2006-06-22  4371  	rcu_read_lock_bh();
^1da177e4c3f415 Linus Torvalds         2005-04-16  4372  
5bc1421e34ecfe0 Neil Horman            2011-11-22  4373  	skb_update_prio(skb);
5bc1421e34ecfe0 Neil Horman            2011-11-22  4374  
1f211a1b929c804 Daniel Borkmann        2016-01-07  4375  	qdisc_pkt_len_init(skb);
fe7b450226f1062 Daniel Borkmann        2023-07-19  4376  	tcx_set_ingress(skb, false);
aabf6772cc745f9 Davidlohr Bueso        2018-05-08  4377  	if (static_branch_unlikely(&egress_needed_key)) {
8c96f7dbb5d5ead Tonghao Zhang          2022-04-16  4378  		netdev_xmit_skip_txqueue(false);
8c96f7dbb5d5ead Tonghao Zhang          2022-04-16  4379  
1f211a1b929c804 Daniel Borkmann        2016-01-07  4380  		skb = sch_handle_egress(skb, &rc, dev);
1f211a1b929c804 Daniel Borkmann        2016-01-07  4381  		if (!skb)
1f211a1b929c804 Daniel Borkmann        2016-01-07  4382  			goto out;
8c96f7dbb5d5ead Tonghao Zhang          2022-04-16 @4383  		if (netdev_xmit_txqueue_skipped())
8c96f7dbb5d5ead Tonghao Zhang          2022-04-16 @4384  			txq = netdev_tx_queue_mapping(dev, skb);
1f211a1b929c804 Daniel Borkmann        2016-01-07  4385  	}
fe7b450226f1062 Daniel Borkmann        2023-07-19  4386  
0287587884b1504 Eric Dumazet           2014-10-05  4387  	/* If device/qdisc don't need skb->dst, release it right now while
0287587884b1504 Eric Dumazet           2014-10-05  4388  	 * its hot in this cpu cache.
0287587884b1504 Eric Dumazet           2014-10-05  4389  	 */
0287587884b1504 Eric Dumazet           2014-10-05  4390  	if (dev->priv_flags & IFF_XMIT_DST_RELEASE)
0287587884b1504 Eric Dumazet           2014-10-05  4391  		skb_dst_drop(skb);
0287587884b1504 Eric Dumazet           2014-10-05  4392  	else
0287587884b1504 Eric Dumazet           2014-10-05  4393  		skb_dst_force(skb);
0287587884b1504 Eric Dumazet           2014-10-05  4394  
8c96f7dbb5d5ead Tonghao Zhang          2022-04-16  4395  	if (!txq)
4bd97d51a5e602e Paolo Abeni            2019-03-20  4396  		txq = netdev_core_pick_tx(dev, skb, sb_dev);
a898def29e4119b Paul E. McKenney       2010-02-22  4397  	q = rcu_dereference_bh(txq->qdisc);
37437bb2e1ae8af David S. Miller        2008-07-16  4398  
cf66ba58b5cb8b1 Koki Sanagi            2010-08-23  4399  	trace_net_dev_queue(skb);
^1da177e4c3f415 Linus Torvalds         2005-04-16  4400  	if (q->enqueue) {
bbd8a0d3a3b65d3 Krishna Kumar          2009-08-06  4401  		rc = __dev_xmit_skb(skb, q, dev, txq);
^1da177e4c3f415 Linus Torvalds         2005-04-16  4402  		goto out;
^1da177e4c3f415 Linus Torvalds         2005-04-16  4403  	}
^1da177e4c3f415 Linus Torvalds         2005-04-16  4404  
^1da177e4c3f415 Linus Torvalds         2005-04-16  4405  	/* The device has no queue. Common case for software devices:
eb13da1a103a808 tcharding              2017-02-09  4406  	 * loopback, all the sorts of tunnels...
^1da177e4c3f415 Linus Torvalds         2005-04-16  4407  
eb13da1a103a808 tcharding              2017-02-09  4408  	 * Really, it is unlikely that netif_tx_lock protection is necessary
eb13da1a103a808 tcharding              2017-02-09  4409  	 * here.  (f.e. loopback and IP tunnels are clean ignoring statistics
eb13da1a103a808 tcharding              2017-02-09  4410  	 * counters.)
eb13da1a103a808 tcharding              2017-02-09  4411  	 * However, it is possible, that they rely on protection
eb13da1a103a808 tcharding              2017-02-09  4412  	 * made by us here.
^1da177e4c3f415 Linus Torvalds         2005-04-16  4413  
eb13da1a103a808 tcharding              2017-02-09  4414  	 * Check this and shot the lock. It is not prone from deadlocks.
eb13da1a103a808 tcharding              2017-02-09  4415  	 *Either shot noqueue qdisc, it is even simpler 8)
^1da177e4c3f415 Linus Torvalds         2005-04-16  4416  	 */
^1da177e4c3f415 Linus Torvalds         2005-04-16  4417  	if (dev->flags & IFF_UP) {
^1da177e4c3f415 Linus Torvalds         2005-04-16  4418  		int cpu = smp_processor_id(); /* ok because BHs are off */
^1da177e4c3f415 Linus Torvalds         2005-04-16  4419  
94782c8ffd07566 Eric Dumazet           2021-11-30  4420  		/* Other cpus might concurrently change txq->xmit_lock_owner
94782c8ffd07566 Eric Dumazet           2021-11-30  4421  		 * to -1 or to their cpu id, but not to our id.
94782c8ffd07566 Eric Dumazet           2021-11-30  4422  		 */
94782c8ffd07566 Eric Dumazet           2021-11-30  4423  		if (READ_ONCE(txq->xmit_lock_owner) != cpu) {
97cdcf37b57e3f2 Florian Westphal       2019-04-01  4424  			if (dev_xmit_recursion())
745e20f1b626b1b Eric Dumazet           2010-09-29  4425  				goto recursion_alert;
745e20f1b626b1b Eric Dumazet           2010-09-29  4426  
f53c723902d1ac5 Steffen Klassert       2017-12-20  4427  			skb = validate_xmit_skb(skb, dev, &again);
1f59533f9ca5634 Jesper Dangaard Brouer 2014-09-03  4428  			if (!skb)
d21fd63ea385620 Eric Dumazet           2016-04-12  4429  				goto out;
1f59533f9ca5634 Jesper Dangaard Brouer 2014-09-03  4430  
3744741adab6d91 Willy Tarreau          2020-08-10  4431  			PRANDOM_ADD_NOISE(skb, dev, txq, jiffies);
c773e847ea8f681 David S. Miller        2008-07-08  4432  			HARD_TX_LOCK(dev, txq, cpu);
^1da177e4c3f415 Linus Torvalds         2005-04-16  4433  
7346649826382b7 Tom Herbert            2011-11-28  4434  			if (!netif_xmit_stopped(txq)) {
97cdcf37b57e3f2 Florian Westphal       2019-04-01  4435  				dev_xmit_recursion_inc();
ce93718fb7cdbc0 David S. Miller        2014-08-30  4436  				skb = dev_hard_start_xmit(skb, dev, txq, &rc);
97cdcf37b57e3f2 Florian Westphal       2019-04-01  4437  				dev_xmit_recursion_dec();
572a9d7b6fc7f20 Patrick McHardy        2009-11-10  4438  				if (dev_xmit_complete(rc)) {
c773e847ea8f681 David S. Miller        2008-07-08  4439  					HARD_TX_UNLOCK(dev, txq);
^1da177e4c3f415 Linus Torvalds         2005-04-16  4440  					goto out;
^1da177e4c3f415 Linus Torvalds         2005-04-16  4441  				}
^1da177e4c3f415 Linus Torvalds         2005-04-16  4442  			}
c773e847ea8f681 David S. Miller        2008-07-08  4443  			HARD_TX_UNLOCK(dev, txq);
e87cc4728f0e2fb Joe Perches            2012-05-13  4444  			net_crit_ratelimited("Virtual device %s asks to queue packet!\n",
7b6cd1ce72176e2 Joe Perches            2012-02-01  4445  					     dev->name);
^1da177e4c3f415 Linus Torvalds         2005-04-16  4446  		} else {
^1da177e4c3f415 Linus Torvalds         2005-04-16  4447  			/* Recursion is detected! It is possible,
745e20f1b626b1b Eric Dumazet           2010-09-29  4448  			 * unfortunately
745e20f1b626b1b Eric Dumazet           2010-09-29  4449  			 */
745e20f1b626b1b Eric Dumazet           2010-09-29  4450  recursion_alert:
e87cc4728f0e2fb Joe Perches            2012-05-13  4451  			net_crit_ratelimited("Dead loop on virtual device %s, fix it urgently!\n",
7b6cd1ce72176e2 Joe Perches            2012-02-01  4452  					     dev->name);
^1da177e4c3f415 Linus Torvalds         2005-04-16  4453  		}
^1da177e4c3f415 Linus Torvalds         2005-04-16  4454  	}
^1da177e4c3f415 Linus Torvalds         2005-04-16  4455  
^1da177e4c3f415 Linus Torvalds         2005-04-16  4456  	rc = -ENETDOWN;
d4828d85d188dc7 Herbert Xu             2006-06-22  4457  	rcu_read_unlock_bh();
^1da177e4c3f415 Linus Torvalds         2005-04-16  4458  
015f0688f57ca4d Eric Dumazet           2014-03-27  4459  	atomic_long_inc(&dev->tx_dropped);
1f59533f9ca5634 Jesper Dangaard Brouer 2014-09-03  4460  	kfree_skb_list(skb);
^1da177e4c3f415 Linus Torvalds         2005-04-16  4461  	return rc;
^1da177e4c3f415 Linus Torvalds         2005-04-16  4462  out:
d4828d85d188dc7 Herbert Xu             2006-06-22  4463  	rcu_read_unlock_bh();
^1da177e4c3f415 Linus Torvalds         2005-04-16  4464  	return rc;
^1da177e4c3f415 Linus Torvalds         2005-04-16  4465  }
f663dd9aaf9ed12 Jason Wang             2014-01-10  4466  

:::::: The code at line 4384 was first introduced by commit
:::::: 8c96f7dbb5d5ead0dbce8b499eb91773e5040de4 net: sched: use queue_mapping to pick tx queue

:::::: TO: Tonghao Zhang <xiangxia.m.yue@gmail.com>
:::::: CC: root <root@bytedance.localdomain>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
