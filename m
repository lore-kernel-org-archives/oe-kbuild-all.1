Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37F31DF990
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736181730; cv=none; b=WjfdohL3hq1vEVVXcbzHVsKE3XnUi5hc3mKmxFvRkl6IWnUfav9PYt4yawaFP77jYqncP4/ShMgCBvRyNHme5e7aIJ0olYepmslxZioKu/9qAc5GSGJ7g8u2hEtbFbRJ25M/rbn8oSmWE+PqKWavzfAB4CxkSllSINQ5NoVCfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736181730; c=relaxed/simple;
	bh=FcoIjMNlvTOh4Mek3sIJh231xpVHsRAukCBwqqgQT2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rfPCdYO2KN7qf+wq46ncZOUazfrykBz7rZyQSlEpC20ygr3v/jiuRQB46+OOoCos8E7VQumKny8AFQO+VMrUJgHs8XtObAifZ7ouMFiAVeyenYhpHEhRtG3na/IqU0C7BoLK1FAIUqQWQWsPV78X/cJynQr7O7+xQKJL5kl8E7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ar2scC1z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ar2scC1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736181728; x=1767717728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FcoIjMNlvTOh4Mek3sIJh231xpVHsRAukCBwqqgQT2Q=;
  b=Ar2scC1z7eavHTDSOAuDycXSitX87KeuqzZ1KxCUJkGH0068qTjdlmUx
   FuCgIOfZVos7gpSgAReCsD7TVBN7vj83oQQzZ/3oSn+qVMEIEOyfhSUaj
   V7a/WqitLnKe9WBpYEGHNJuWdwLXBOJIha3/XfscwteN2ZFfopNJ0bga/
   +bGlpCvdPMG4LgtoSofB+2L3gUjuGNboQsnzLn23pVklaATEje6qpIgUn
   FyKRLbdCOCb/CYEi/sHGRgUUswMHB1eBhZUiVTbbH73ujgKROafXzJoqb
   0a8xttdwVdZe1lsRYwhXFcwGslykVMGJB8ZPgwq/IoQYWq2DlJWAb1Zcs
   A==;
X-CSE-ConnectionGUID: a+o0Ps8SS16el5cBce8L/w==
X-CSE-MsgGUID: TAM8udUCTkKdY7sg+64Jow==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40276312"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="40276312"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 08:42:07 -0800
X-CSE-ConnectionGUID: ViCHrQgyS8WffhCQ/1GnHw==
X-CSE-MsgGUID: 6PeLFnDhTZypaEqe9ILVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="102983691"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2025 08:42:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUqB0-000DhX-3B;
	Mon, 06 Jan 2025 16:42:02 +0000
Date: Tue, 7 Jan 2025 00:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 18080/25291] net/core/dev.c:4377:37: error:
 'egress_needed_key' undeclared; did you mean 'netstamp_needed_key'?
Message-ID: <202501070029.chqnPJka-lkp@intel.com>
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
commit: fe7b450226f1062ff7123939ea7ca9d7e30de61a [18080/25291] bpf: Add fd-based tcx multi-prog infra with link support
config: arm64-randconfig-003-20250106 (https://download.01.org/0day-ci/archive/20250107/202501070029.chqnPJka-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070029.chqnPJka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070029.chqnPJka-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/lse.h:13,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:26,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from net/core/dev.c:71:
   net/core/dev.c: In function '__dev_queue_xmit':
>> net/core/dev.c:4377:37: error: 'egress_needed_key' undeclared (first use in this function); did you mean 'netstamp_needed_key'?
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
>> net/core/dev.c:4378:17: error: implicit declaration of function 'netdev_xmit_skip_txqueue'; did you mean 'netdev_cap_txqueue'? [-Werror=implicit-function-declaration]
    4378 |                 netdev_xmit_skip_txqueue(false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 netdev_cap_txqueue
>> net/core/dev.c:4383:21: error: implicit declaration of function 'netdev_xmit_txqueue_skipped' [-Werror=implicit-function-declaration]
    4383 |                 if (netdev_xmit_txqueue_skipped())
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/dev.c:4384:31: error: implicit declaration of function 'netdev_tx_queue_mapping'; did you mean 'sk_tx_queue_mapping'? [-Werror=implicit-function-declaration]
    4384 |                         txq = netdev_tx_queue_mapping(dev, skb);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                               sk_tx_queue_mapping
>> net/core/dev.c:4384:29: warning: assignment to 'struct netdev_queue *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4384 |                         txq = netdev_tx_queue_mapping(dev, skb);
         |                             ^
   cc1: some warnings being treated as errors


vim +4377 net/core/dev.c

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
aabf6772cc745f Davidlohr Bueso        2018-05-08 @4377  	if (static_branch_unlikely(&egress_needed_key)) {
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16 @4378  		netdev_xmit_skip_txqueue(false);
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16  4379  
1f211a1b929c80 Daniel Borkmann        2016-01-07  4380  		skb = sch_handle_egress(skb, &rc, dev);
1f211a1b929c80 Daniel Borkmann        2016-01-07  4381  		if (!skb)
1f211a1b929c80 Daniel Borkmann        2016-01-07  4382  			goto out;
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16 @4383  		if (netdev_xmit_txqueue_skipped())
8c96f7dbb5d5ea Tonghao Zhang          2022-04-16 @4384  			txq = netdev_tx_queue_mapping(dev, skb);
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

:::::: The code at line 4377 was first introduced by commit
:::::: aabf6772cc745f90d1e15b0054eca734ba787784 net: Update [e/in]gress_needed static key to modern api

:::::: TO: Davidlohr Bueso <dave@stgolabs.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
