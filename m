Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47E34FC8DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 21:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371551; cv=none; b=HmCzMwk1STTczXQmbnSjzzibStnEuMoisJMSX2lg4pQoVmHHINrhN7dmNvFSNqN/MOb7XGGTJSRDTdwjKYXqxrGbCX1+Mg89YbaqIVEyJmiyY5UCMsRaKHi7Ol2zYpXl6bk768kNxH/wFAffOlWaWnsK6wApXDewUFjc3aH691A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371551; c=relaxed/simple;
	bh=Z2c1a/fcfl2c+Ss5FWV0mbHZM2J+mVzxdjkL8gLxhrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OPIcIfg5nh7aJBK716MMok4l7abM+dgdUpK835pGLWun7sXrELGiYF+PMp4neLqlm7Bl6cnmg+jzGr/XerpprT5hjCFDny0t96MV/j1NfqdaXJq1m9jc9MtnMvJyLzSKZ+FJSOK+vavWXDSuA7lhoxui6rpxLfWWhLb+ENhkZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8Y+CyIz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8Y+CyIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790371547; x=1821907547;
  h=date:from:to:cc:subject:message-id;
  bh=Z2c1a/fcfl2c+Ss5FWV0mbHZM2J+mVzxdjkL8gLxhrY=;
  b=S8Y+CyIz55mpe2SiRiy78vI1l2hZv2iV8nDf9iFn1w5BE4knVNjTZBnW
   /jjtg0K82BKerhmTOTspgEug7zuiihWyKMMY6OseXLiBGj3bHQZ2wL0+m
   Hzrs1JjVCb1cmEY1EtAh4Sw29sv1riTbKRdQTa32uoYkSPSvcfvNPBX50
   RRIQ+ij3BSAedeD3Tnkk7lPppTEP/hcKAelbkXl/V5KHniumuzQvYzgi4
   XPlc1UfVHUKuITMD11BJAeW/IMU7y8H9ha1ueLFkuZwBivgGuMaOMYswd
   s5tD8deErB0SJ1ES+Kb38Bq0/guae/Nkh91izeG6eJWFifVScxDqgp8UB
   Q==;
X-CSE-ConnectionGUID: tzpOe5/TRYGOIPQ0Q7UHlQ==
X-CSE-MsgGUID: lQJsofSnQE2YsTG+nsyaYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90382466"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90382466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:25:37 -0700
X-CSE-ConnectionGUID: HqLWKzqhRBqywkLRbDxBHw==
X-CSE-MsgGUID: xz2zFSz8RcWpFZ4IpKUMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303945510"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 14:25:35 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADQC-000000000tu-1lUi;
	Fri, 25 Sep 2026 21:25:32 +0000
Date: Fri, 25 Sep 2026 23:25:26 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 628/673]
 block/blk-ioc.c:87:40: error: invalid operands to binary expression ('void'
 and 'struct io_cq *')
Message-ID: <202609252321.55qxdSaL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 5f609cf4ad6407b1967d07a8d6383a7edb182d45 [628/673] fixup clang __diag
config: hexagon-randconfig-r2201-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252321.55qxdSaL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 57e112ccb2a509c0e1d36963b187fccdd59566de)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252321.55qxdSaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252321.55qxdSaL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from block/blk-ioc.c:8:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/blk-ioc.c:87:40: error: invalid operands to binary expression ('void' and 'struct io_cq *')
      87 |         if (rcu_access_pointer(ioc->icq_hint) == icq)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~
   2 errors generated.
--
   In file included from block/blk-cgroup.c:23:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/blk-cgroup.c:557:43: error: invalid operands to binary expression ('void' and 'struct blkcg_gq *')
     557 |         if (rcu_access_pointer(blkcg->blkg_hint) == blkg)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~
   2 errors generated.
--
   In file included from net/bluetooth/hci_codec.c:5:
   In file included from include/net/bluetooth/bluetooth.h:26:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/bluetooth/hci_codec.c:5:
   In file included from include/net/bluetooth/bluetooth.h:27:
>> include/net/sock.h:2251:10: error: assigning to 'struct dst_entry *' from incompatible type 'void'
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sock.h:2251:12: warning: expression result unused [-Wunused-value]
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:500:26: note: expanded from macro 'unrcu_pointer'
     500 | #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:491:3: note: expanded from macro '__unrcu_pointer'
     487 | #define __unrcu_pointer(p, local)                                       \
         |                                                                         ~
     488 | context_unsafe(                                                         \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     489 |         typeof(*p) *local = (typeof(*p) *__force)(p);                   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     490 |         rcu_check_sparse(p, __rcu);                                     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |         ((typeof(*p) __force __kernel *)(local))                        \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro '\
   context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from net/bluetooth/l2cap_sock.c:29:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:23:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:36:
   include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/bluetooth/l2cap_sock.c:29:
   In file included from include/linux/filter.h:27:
>> include/net/sch_generic.h:876:38: error: invalid operands to binary expression ('void' and 'void')
     876 |                 if (rcu_access_pointer(txq->qdisc) !=
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
     877 |                     rcu_access_pointer(txq->qdisc_sleeping))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sch_generic.h:886:16: error: initializing 'struct Qdisc *' with an expression of incompatible type 'void'
     886 |         struct Qdisc *qdisc = rcu_access_pointer(txq->qdisc);
         |                       ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sch_generic.h:898:38: error: invalid operands to binary expression ('void' and 'struct Qdisc *')
     898 |                 if (rcu_access_pointer(txq->qdisc) != &noop_qdisc)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   In file included from net/bluetooth/l2cap_sock.c:33:
   In file included from include/net/bluetooth/bluetooth.h:27:
>> include/net/sock.h:2251:10: error: assigning to 'struct dst_entry *' from incompatible type 'void'
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sock.h:2251:12: warning: expression result unused [-Wunused-value]
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:500:26: note: expanded from macro 'unrcu_pointer'
     500 | #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:491:3: note: expanded from macro '__unrcu_pointer'
     487 | #define __unrcu_pointer(p, local)                                       \
         |                                                                         ~
     488 | context_unsafe(                                                         \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     489 |         typeof(*p) *local = (typeof(*p) *__force)(p);                   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     490 |         rcu_check_sparse(p, __rcu);                                     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |         ((typeof(*p) __force __kernel *)(local))                        \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro '\
   context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   1 warning and 5 errors generated.
--
   In file included from net/bluetooth/l2cap_core.c:30:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/bluetooth/l2cap_core.c:32:
   In file included from include/linux/filter.h:27:
>> include/net/sch_generic.h:876:38: error: invalid operands to binary expression ('void' and 'void')
     876 |                 if (rcu_access_pointer(txq->qdisc) !=
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
     877 |                     rcu_access_pointer(txq->qdisc_sleeping))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sch_generic.h:886:16: error: initializing 'struct Qdisc *' with an expression of incompatible type 'void'
     886 |         struct Qdisc *qdisc = rcu_access_pointer(txq->qdisc);
         |                       ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sch_generic.h:898:38: error: invalid operands to binary expression ('void' and 'struct Qdisc *')
     898 |                 if (rcu_access_pointer(txq->qdisc) != &noop_qdisc)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
   In file included from net/bluetooth/l2cap_core.c:34:
   In file included from include/net/bluetooth/bluetooth.h:27:
>> include/net/sock.h:2251:10: error: assigning to 'struct dst_entry *' from incompatible type 'void'
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sock.h:2251:12: warning: expression result unused [-Wunused-value]
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:500:26: note: expanded from macro 'unrcu_pointer'
     500 | #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:491:3: note: expanded from macro '__unrcu_pointer'
     487 | #define __unrcu_pointer(p, local)                                       \
         |                                                                         ~
     488 | context_unsafe(                                                         \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     489 |         typeof(*p) *local = (typeof(*p) *__force)(p);                   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     490 |         rcu_check_sparse(p, __rcu);                                     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |         ((typeof(*p) __force __kernel *)(local))                        \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro '\
   context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
>> net/bluetooth/l2cap_core.c:4034:2: error: statement requires expression of scalar type ('void' invalid)
    4034 |         if (context_unsafe(!locked && chan != rsp->locked_chan))
         |         ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/bluetooth/l2cap_core.c:4034:29: warning: expression result unused [-Wunused-value]
    4034 |         if (context_unsafe(!locked && chan != rsp->locked_chan))
         |                            ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro 'context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   2 warnings and 6 errors generated.
--
   In file included from net/bluetooth/smp.c:20:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/bluetooth/smp.c:27:
   In file included from include/net/bluetooth/bluetooth.h:27:
>> include/net/sock.h:2251:10: error: assigning to 'struct dst_entry *' from incompatible type 'void'
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sock.h:2251:12: warning: expression result unused [-Wunused-value]
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:500:26: note: expanded from macro 'unrcu_pointer'
     500 | #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:491:3: note: expanded from macro '__unrcu_pointer'
     487 | #define __unrcu_pointer(p, local)                                       \
         |                                                                         ~
     488 | context_unsafe(                                                         \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     489 |         typeof(*p) *local = (typeof(*p) *__force)(p);                   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     490 |         rcu_check_sparse(p, __rcu);                                     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |         ((typeof(*p) __force __kernel *)(local))                        \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro '\
   context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
>> net/bluetooth/smp.c:2340:7: error: assigning to 'struct l2cap_conn *' from incompatible type 'void'
    2340 |         conn = context_unsafe(hcon->l2cap_data);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/bluetooth/smp.c:2340:30: warning: expression result unused [-Wunused-value]
    2340 |         conn = context_unsafe(hcon->l2cap_data);
         |                               ~~~~  ^~~~~~~~~~
   2 warnings and 3 errors generated.
--
   In file included from net/bluetooth/hci_conn.c:26:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   include/linux/rcuwait.h:23:10: error: invalid argument type 'void' to unary expression
      23 |         return !!rcu_access_pointer(w->task);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/bluetooth/hci_conn.c:27:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:2251:10: error: assigning to 'struct dst_entry *' from incompatible type 'void'
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sock.h:2251:12: warning: expression result unused [-Wunused-value]
    2251 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:500:26: note: expanded from macro 'unrcu_pointer'
     500 | #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:491:3: note: expanded from macro '__unrcu_pointer'
     487 | #define __unrcu_pointer(p, local)                                       \
         |                                                                         ~
     488 | context_unsafe(                                                         \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     489 |         typeof(*p) *local = (typeof(*p) *__force)(p);                   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     490 |         rcu_check_sparse(p, __rcu);                                     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |         ((typeof(*p) __force __kernel *)(local))                        \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:218:2: note: expanded from macro '\
   context_unsafe'
     218 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   In file included from net/bluetooth/hci_conn.c:27:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:24:
   In file included from include/net/inetpeer.h:16:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
>> include/linux/tcp.h:597:54: error: invalid operands to binary expression ('void' and 'void *')
     597 |                rcu_access_pointer(tcp_sk(sk)->fastopen_rsk) != NULL;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~
   1 warning and 3 errors generated.


vim +87 block/blk-ioc.c

4be8a2eaff2e44 Christoph Hellwig 2021-12-09   61  
7b36a7189fc320 Jens Axboe        2017-03-02   62  /*
7b36a7189fc320 Jens Axboe        2017-03-02   63   * Release an icq. Called with ioc locked for blk-mq, and with both ioc
7b36a7189fc320 Jens Axboe        2017-03-02   64   * and queue locked for legacy.
7b36a7189fc320 Jens Axboe        2017-03-02   65   */
621032ad6eaabf Tejun Heo         2012-02-15   66  static void ioc_destroy_icq(struct io_cq *icq)
7e5a8794492e43 Tejun Heo         2011-12-14   67  {
7e5a8794492e43 Tejun Heo         2011-12-14   68  	struct io_context *ioc = icq->ioc;
7e5a8794492e43 Tejun Heo         2011-12-14   69  	struct request_queue *q = icq->q;
7e5a8794492e43 Tejun Heo         2011-12-14   70  	struct elevator_type *et = q->elevator->type;
7e5a8794492e43 Tejun Heo         2011-12-14   71  
7e5a8794492e43 Tejun Heo         2011-12-14   72  	lockdep_assert_held(&ioc->lock);
5a0ac57c48aa93 Yu Kuai           2023-05-31   73  	lockdep_assert_held(&q->queue_lock);
5a0ac57c48aa93 Yu Kuai           2023-05-31   74  
5a0ac57c48aa93 Yu Kuai           2023-05-31   75  	if (icq->flags & ICQ_DESTROYED)
5a0ac57c48aa93 Yu Kuai           2023-05-31   76  		return;
7e5a8794492e43 Tejun Heo         2011-12-14   77  
7e5a8794492e43 Tejun Heo         2011-12-14   78  	radix_tree_delete(&ioc->icq_tree, icq->q->id);
7e5a8794492e43 Tejun Heo         2011-12-14   79  	hlist_del_init(&icq->ioc_node);
7e5a8794492e43 Tejun Heo         2011-12-14   80  	list_del_init(&icq->q_node);
7e5a8794492e43 Tejun Heo         2011-12-14   81  
7e5a8794492e43 Tejun Heo         2011-12-14   82  	/*
7e5a8794492e43 Tejun Heo         2011-12-14   83  	 * Both setting lookup hint to and clearing it from @icq are done
7e5a8794492e43 Tejun Heo         2011-12-14   84  	 * under queue_lock.  If it's not pointing to @icq now, it never
7e5a8794492e43 Tejun Heo         2011-12-14   85  	 * will.  Hint assignment itself can race safely.
7e5a8794492e43 Tejun Heo         2011-12-14   86  	 */
ec6c676a08b077 Paul E. McKenney  2014-02-17  @87  	if (rcu_access_pointer(ioc->icq_hint) == icq)
7e5a8794492e43 Tejun Heo         2011-12-14   88  		rcu_assign_pointer(ioc->icq_hint, NULL);
7e5a8794492e43 Tejun Heo         2011-12-14   89  
621032ad6eaabf Tejun Heo         2012-02-15   90  	ioc_exit_icq(icq);
7e5a8794492e43 Tejun Heo         2011-12-14   91  
7e5a8794492e43 Tejun Heo         2011-12-14   92  	/*
7e5a8794492e43 Tejun Heo         2011-12-14   93  	 * @icq->q might have gone away by the time RCU callback runs
7e5a8794492e43 Tejun Heo         2011-12-14   94  	 * making it impossible to determine icq_cache.  Record it in @icq.
7e5a8794492e43 Tejun Heo         2011-12-14   95  	 */
7e5a8794492e43 Tejun Heo         2011-12-14   96  	icq->__rcu_icq_cache = et->icq_cache;
30a2da7b7e225e Sahitya Tummala   2020-03-11   97  	icq->flags |= ICQ_DESTROYED;
28878733ca5abb Julia Lawall      2024-10-13   98  	kfree_rcu(icq, __rcu_head);
7e5a8794492e43 Tejun Heo         2011-12-14   99  }
7e5a8794492e43 Tejun Heo         2011-12-14  100  

:::::: The code at line 87 was first introduced by commit
:::::: ec6c676a08b0779a32c9cec9fae7532add32fe15 block: Substitute rcu_access_pointer() for rcu_dereference_raw()

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Jens Axboe <axboe@fb.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
