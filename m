Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD585189BB3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733297870; cv=none; b=T6NXmdD8q2x9GV6tWbTVNR5bWpOxIgoBRdRsvGBYWzGkSE6GIXT4+gkB4pAwPnmPg7gr2EJ2kAuK7f+/lJq7JdC685Qk57hKED8vjDVn3RDSCIJZYFgU3tOMGfoGC9UQYzt2vE+fle7pC4h66mp4dkOPtNiIuG3gf/wf3YGDjBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733297870; c=relaxed/simple;
	bh=aL1/ohteWqueVBmFUk7n204gVVHVF3k8vxv/sVRxT9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I2uO+6SxM/KSTt3IFafGV5YE13ejaTKJLJpyA6P0s/kfaH8ZQCiM0JsWnBOHheXauUaJKekzIdFOx5pnD9TV5Ok6XucYseLlNF3nPh9QozuMEUO5NbaFqkYibfjSUa94uiSl3MJs7HR9CyGpZDdsTLXO6fc6iRYNtxHs9ntrlHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNTVDX6d; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNTVDX6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733297868; x=1764833868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aL1/ohteWqueVBmFUk7n204gVVHVF3k8vxv/sVRxT9o=;
  b=GNTVDX6dhbfuI1iLvjOA2P8zreYZSTdzhcLYDG24niaQiiNiIu/SIeAf
   JnkJG8YohyoHMjgk/1Jxq/+oe8YKzWkp/0bjZoRAhhO7dn2O8HS2kbMCI
   BoI4q5RV8dEyoXKQbY7RrBvydWJMOustKVus8KuJdo3p1x2nR30CXLy3C
   ZENTequDUORe6VepvPxN8KZpKscic6zjEjTAz5D3sU6o6j82g11H76SrS
   X1fqhdJuQ2skf9Ih8wvZCrj5CJvhAEDCPCuJHd4ztuCwdFs+HaEcesPo8
   G2W/vrdZzQms1mWJZJL+KVRJf01E4g6InzqpI4xRSCCOMgpskXaxrT63I
   w==;
X-CSE-ConnectionGUID: gms7u815R/Krq8WkMSfNeg==
X-CSE-MsgGUID: Q4VSXNdwTOCjk2GkOC3KVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44027730"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44027730"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:37:46 -0800
X-CSE-ConnectionGUID: wZ1/oUeYQySGQWllI9jmrQ==
X-CSE-MsgGUID: Vg+9m4FYSZmO2MyLuJhBHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98488779"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Dec 2024 23:37:44 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIjx8-0002iH-0o;
	Wed, 04 Dec 2024 07:37:42 +0000
Date: Wed, 4 Dec 2024 15:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1320/1320]
 arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long
 unsigned int[2]' is partly outside array bounds of 'struct sk_buff_head[1]'
Message-ID: <202412041542.hMfB2LmU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   98beb6bc5000f977169e4f633e450f4e3e9d84d1
commit: 71e217e85c3dff8a9151707ed3afc7b4b054a2d4 [1320/1320] selinux: use kernel linux/socket.h for genheaders and mdp
config: arm64-randconfig-002 (https://download.01.org/0day-ci/archive/20241204/202412041542.hMfB2LmU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041542.hMfB2LmU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041542.hMfB2LmU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/moduleparam.h:7,
                    from net/core/netpoll.c:14:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock_flags' at include/linux/spinlock.h:191:2,
       inlined from '__raw_spin_lock_irqsave' at include/linux/spinlock_api_smp.h:119:2,
       inlined from 'refill_skbs' at net/core/netpoll.c:230:2:
>> arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[2]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   net/core/netpoll.c: In function 'refill_skbs':
   net/core/netpoll.c:47:28: note: at offset 20 into object 'skb_pool' of size 24
      47 | static struct sk_buff_head skb_pool;
         |                            ^~~~~~~~
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock_flags' at include/linux/spinlock.h:191:2,
       inlined from '__raw_spin_lock_irqsave' at include/linux/spinlock_api_smp.h:119:2,
       inlined from 'refill_skbs' at net/core/netpoll.c:230:2:
>> arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[2]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   net/core/netpoll.c: In function 'refill_skbs':
   net/core/netpoll.c:47:28: note: at offset 20 into object 'skb_pool' of size 24
      47 | static struct sk_buff_head skb_pool;
         |                            ^~~~~~~~
   In file included from include/linux/if_ether.h:23,
                    from include/uapi/linux/ethtool.h:19,
                    from include/linux/ethtool.h:19,
                    from include/linux/netdevice.h:42,
                    from net/core/netpoll.c:16:
   In function '__skb_queue_before',
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1866:2,
       inlined from 'refill_skbs' at net/core/netpoll.c:236:3:
   include/linux/skbuff.h:1832:9: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
    1832 |         __skb_insert(newsk, next->prev, next, list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netpoll.c: In function 'refill_skbs':
   net/core/netpoll.c:47:28: note: object 'skb_pool' of size 24
      47 | static struct sk_buff_head skb_pool;
         |                            ^~~~~~~~
   In function '__skb_insert',
       inlined from '__skb_queue_before' at include/linux/skbuff.h:1832:2,
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1866:2,
       inlined from 'refill_skbs' at net/core/netpoll.c:236:3:
   include/linux/skbuff.h:1726:21: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
    1726 |         next->prev  = prev->next = newsk;
         |         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   net/core/netpoll.c: In function 'refill_skbs':
   net/core/netpoll.c:47:28: note: object 'skb_pool' of size 24
      47 | static struct sk_buff_head skb_pool;
         |                            ^~~~~~~~
--
   net/ipv4/route.c: In function 'ip_rt_send_redirect':
   net/ipv4/route.c:866:13: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
     866 |         int log_martians;
         |             ^~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:10,
                    from net/ipv4/route.c:67:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock_bh' at include/linux/spinlock_api_smp.h:136:2,
       inlined from 'spin_lock_bh' at include/linux/spinlock.h:334:2,
       inlined from 'update_or_create_fnhe' at net/ipv4/route.c:648:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:82,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:11:
   net/ipv4/route.c: In function 'update_or_create_fnhe':
   net/ipv4/route.c:578:24: note: object 'fnhe_lock' of size 4
     578 | static DEFINE_SPINLOCK(fnhe_lock);
         |                        ^~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock_bh' at include/linux/spinlock_api_smp.h:136:2,
       inlined from 'spin_lock_bh' at include/linux/spinlock.h:334:2,
       inlined from 'update_or_create_fnhe' at net/ipv4/route.c:648:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   net/ipv4/route.c: In function 'update_or_create_fnhe':
   net/ipv4/route.c:578:24: note: object 'fnhe_lock' of size 4
     578 | static DEFINE_SPINLOCK(fnhe_lock);
         |                        ^~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   net/ipv4/route.c: In function '__ip_rt_update_pmtu':
>> net/ipv4/route.c:1027:37: warning: array subscript 0 is outside array bounds of 'struct fib_nh[0]' [-Warray-bounds=]
    1027 |                 struct fib_nh *nh = &FIB_RES_NH(res);
   In file included from include/net/route.h:31,
                    from include/net/lwtunnel.h:10,
                    from include/net/ip_tunnels.h:18,
                    from include/net/dst_metadata.h:6,
                    from net/ipv4/route.c:94:
   include/net/ip_fib.h:127:33: note: while referencing 'fib_nh'
     127 |         struct fib_nh           fib_nh[0];
         |                                 ^~~~~~
   net/ipv4/route.c: In function '__ip_do_redirect':
   net/ipv4/route.c:779:53: warning: array subscript 0 is outside array bounds of 'struct fib_nh[0]' [-Warray-bounds=]
     779 |                                 struct fib_nh *nh = &FIB_RES_NH(res);
   include/net/ip_fib.h:127:33: note: while referencing 'fib_nh'
     127 |         struct fib_nh           fib_nh[0];
         |                                 ^~~~~~
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock_bh' at include/linux/spinlock_api_smp.h:136:2,
       inlined from 'spin_lock_bh' at include/linux/spinlock.h:334:2,
       inlined from 'ip_del_fnhe' at net/ipv4/route.c:1326:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   net/ipv4/route.c: In function 'ip_del_fnhe':
   net/ipv4/route.c:578:24: note: object 'fnhe_lock' of size 4
     578 | static DEFINE_SPINLOCK(fnhe_lock);
         |                        ^~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock_bh' at include/linux/spinlock_api_smp.h:136:2,
       inlined from 'spin_lock_bh' at include/linux/spinlock.h:334:2,
       inlined from 'ip_del_fnhe' at net/ipv4/route.c:1326:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   net/ipv4/route.c: In function 'ip_del_fnhe':
   net/ipv4/route.c:578:24: note: object 'fnhe_lock' of size 4
     578 | static DEFINE_SPINLOCK(fnhe_lock);
         |                        ^~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock_bh' at include/linux/spinlock_api_smp.h:136:2,
       inlined from 'spin_lock_bh' at include/linux/spinlock.h:334:2,
       inlined from 'rt_bind_exception' at net/ipv4/route.c:1415:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   net/ipv4/route.c: In function 'rt_bind_exception':
   net/ipv4/route.c:578:24: note: object 'fnhe_lock' of size 4
     578 | static DEFINE_SPINLOCK(fnhe_lock);
         |                        ^~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock_bh' at include/linux/spinlock_api_smp.h:136:2,
       inlined from 'spin_lock_bh' at include/linux/spinlock.h:334:2,
       inlined from 'rt_bind_exception' at net/ipv4/route.c:1415:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   net/ipv4/route.c: In function 'rt_bind_exception':
   net/ipv4/route.c:578:24: note: object 'fnhe_lock' of size 4
     578 | static DEFINE_SPINLOCK(fnhe_lock);
         |                        ^~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   net/ipv4/route.c: In function 'ip_rt_get_source':
   include/net/ip_fib.h:167:50: warning: array subscript 0 is outside array bounds of 'struct fib_nh[0]' [-Warray-bounds=]
     167 | #define FIB_RES_NH(res)         ((res).fi->fib_nh[0])
         |                                 ~~~~~~~~~~~~~~~~~^~~~
   include/net/ip_fib.h:179:11: note: in expansion of macro 'FIB_RES_NH'
--
   fs/ocfs2/alloc.c:1713:25: warning: array subscript 0 is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    1713 |                 memmove(&el->l_recs[0], &el->l_recs[1], size);
         |                         ^~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:1713:41: warning: array subscript 1 is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    1713 |                 memmove(&el->l_recs[0], &el->l_recs[1], size);
         |                                         ^~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:1714:24: warning: array subscript num_recs is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    1714 |                 memset(&el->l_recs[num_recs], 0,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c: In function 'ocfs2_replay_truncate_records':
   fs/ocfs2/alloc.c:5972:34: warning: array subscript i is outside array bounds of 'struct ocfs2_truncate_rec[0]' [-Warray-bounds=]
    5972 |                 rec = tl->tl_recs[i];
         |                       ~~~~~~~~~~~^~~
   fs/ocfs2/ocfs2_fs.h:538:35: note: while referencing 'tl_recs'
     538 | /*08*/  struct ocfs2_truncate_rec tl_recs[0];   /* Truncate records */
         |                                   ^~~~~~~
   fs/ocfs2/alloc.c:5972:34: warning: array subscript i is outside array bounds of 'struct ocfs2_truncate_rec[0]' [-Warray-bounds=]
    5972 |                 rec = tl->tl_recs[i];
         |                       ~~~~~~~~~~~^~~
   fs/ocfs2/ocfs2_fs.h:538:35: note: while referencing 'tl_recs'
     538 | /*08*/  struct ocfs2_truncate_rec tl_recs[0];   /* Truncate records */
         |                                   ^~~~~~~
   fs/ocfs2/alloc.c: In function 'ocfs2_adjust_rightmost_records':
   fs/ocfs2/alloc.c:3989:34: warning: array subscript <unknown> is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    3989 |                 rec = &el->l_recs[next_free - 1];
         |                        ~~~~~~~~~~^~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:3989:34: warning: array subscript <unknown> is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    3989 |                 rec = &el->l_recs[next_free - 1];
         |                        ~~~~~~~~~~^~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:3989:34: warning: array subscript <unknown> is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    3989 |                 rec = &el->l_recs[next_free - 1];
         |                        ~~~~~~~~~~^~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c: In function 'ocfs2_figure_appending_type.isra':
   fs/ocfs2/alloc.c:4561:26: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    4561 |         rec = &el->l_recs[i];
         |                ~~~~~~~~~~^~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:4561:26: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    4561 |         rec = &el->l_recs[i];
         |                ~~~~~~~~~~^~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   In function 'ocfs2_adjust_root_records',
       inlined from 'ocfs2_complete_edge_insert' at fs/ocfs2/alloc.c:2114:2:
   fs/ocfs2/alloc.c:2025:48: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2025 |                 if (le64_to_cpu(root_el->l_recs[i].e_blkno) == left_el_blkno)
         |                                 ~~~~~~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition of macro '__le64_to_cpu'
      32 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/ocfs2/alloc.c:2025:21: note: in expansion of macro 'le64_to_cpu'
    2025 |                 if (le64_to_cpu(root_el->l_recs[i].e_blkno) == left_el_blkno)
         |                     ^~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h: In function 'ocfs2_complete_edge_insert':
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   In function 'ocfs2_adjust_root_records',
       inlined from 'ocfs2_complete_edge_insert' at fs/ocfs2/alloc.c:2114:2:
   fs/ocfs2/alloc.c:2035:9: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2035 |         ocfs2_adjust_adjacent_records(&root_el->l_recs[i],
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2036 |                                       &root_el->l_recs[i + 1], right_el);
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h: In function 'ocfs2_complete_edge_insert':
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   In function 'ocfs2_adjust_root_records',
       inlined from 'ocfs2_complete_edge_insert' at fs/ocfs2/alloc.c:2114:2:
   fs/ocfs2/alloc.c:2035:9: warning: array subscript <unknown> is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2035 |         ocfs2_adjust_adjacent_records(&root_el->l_recs[i],
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2036 |                                       &root_el->l_recs[i + 1], right_el);
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h: In function 'ocfs2_complete_edge_insert':
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
>> fs/ocfs2/alloc.c:2087:28: warning: array subscript idx is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2087 |                 left_rec = &el->l_recs[idx];
         |                            ^~~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:2090:29: warning: array subscript 0 is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2090 |                 right_rec = &el->l_recs[0];
         |                             ^~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c: In function 'ocfs2_figure_contig_type':
   fs/ocfs2/alloc.c:4504:31: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    4504 |                 contig_type = ocfs2_et_extent_contig(et, &el->l_recs[i],
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4505 |                                                      insert_rec);
         |                                                      ~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:4515:44: warning: array subscript <unknown> is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    4515 |                                 &el->l_recs[insert->ins_contig_index];
         |                                  ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c: In function '__ocfs2_find_path.constprop':
   fs/ocfs2/alloc.c:1827:42: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    1827 |                         rec = &el->l_recs[i];
         |                                ~~~~~~~~~~^~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:1827:42: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    1827 |                         rec = &el->l_recs[i];
         |                                ~~~~~~~~~~^~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:1840:47: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    1840 |                 blkno = le64_to_cpu(el->l_recs[i].e_blkno);
         |                                     ~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition of macro '__le64_to_cpu'
      32 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/ocfs2/alloc.c:1840:25: note: in expansion of macro 'le64_to_cpu'
    1840 |                 blkno = le64_to_cpu(el->l_recs[i].e_blkno);
         |                         ^~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c: In function 'ocfs2_find_branch_target.constprop':
   fs/ocfs2/alloc.c:1488:47: warning: array subscript i is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    1488 |                 blkno = le64_to_cpu(el->l_recs[i].e_blkno);
         |                                     ~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition of macro '__le64_to_cpu'
      32 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/ocfs2/alloc.c:1488:25: note: in expansion of macro 'le64_to_cpu'
    1488 |                 blkno = le64_to_cpu(el->l_recs[i].e_blkno);
         |                         ^~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c: In function 'ocfs2_update_edge_lengths.isra':
   fs/ocfs2/alloc.c:2561:26: warning: array subscript idx is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2561 |         rec = &el->l_recs[idx];
         |                ~~~~~~~~~~^~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:2561:26: warning: array subscript idx is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2561 |         rec = &el->l_recs[idx];
         |                ~~~~~~~~~~^~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:2561:26: warning: array subscript idx is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2561 |         rec = &el->l_recs[idx];
         |                ~~~~~~~~~~^~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:2567:34: warning: array subscript idx is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2567 |                 rec = &el->l_recs[idx];
         |                        ~~~~~~~~~~^~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c:2567:34: warning: array subscript idx is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    2567 |                 rec = &el->l_recs[idx];
         |                        ~~~~~~~~~~^~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
     512 | /*10*/  struct ocfs2_extent_rec l_recs[0];      /* Extent records */
         |                                 ^~~~~~
   fs/ocfs2/alloc.c: In function 'ocfs2_adjust_rightmost_branch':
   fs/ocfs2/alloc.c:1141:15: warning: array subscript <unknown> is outside array bounds of 'struct ocfs2_extent_rec[0]' [-Warray-bounds=]
    1141 |         rec = &el->l_recs[le16_to_cpu(el->l_next_free_rec) - 1];
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/ocfs2_fs.h:512:33: note: while referencing 'l_recs'
..


vim +458 arch/arm64/include/asm/atomic_lse.h

c342f78217e822 Will Deacon    2015-04-23  448  
c342f78217e822 Will Deacon    2015-04-23  449  #define __CMPXCHG_CASE(w, sz, name, mb, cl...)				\
c342f78217e822 Will Deacon    2015-04-23  450  static inline unsigned long __cmpxchg_case_##name(volatile void *ptr,	\
c342f78217e822 Will Deacon    2015-04-23  451  						  unsigned long old,	\
c342f78217e822 Will Deacon    2015-04-23  452  						  unsigned long new)	\
c342f78217e822 Will Deacon    2015-04-23  453  {									\
c342f78217e822 Will Deacon    2015-04-23  454  	register unsigned long x0 asm ("x0") = (unsigned long)ptr;	\
c342f78217e822 Will Deacon    2015-04-23  455  	register unsigned long x1 asm ("x1") = old;			\
c342f78217e822 Will Deacon    2015-04-23  456  	register unsigned long x2 asm ("x2") = new;			\
c342f78217e822 Will Deacon    2015-04-23  457  									\
c342f78217e822 Will Deacon    2015-04-23 @458  	asm volatile(ARM64_LSE_ATOMIC_INSN(				\
c342f78217e822 Will Deacon    2015-04-23  459  	/* LL/SC */							\
c342f78217e822 Will Deacon    2015-04-23  460  	__LL_SC_CMPXCHG(name)						\
05492f2fd87d0a Will Deacon    2016-09-06  461  	__nops(2),							\
c342f78217e822 Will Deacon    2015-04-23  462  	/* LSE atomics */						\
c342f78217e822 Will Deacon    2015-04-23  463  	"	mov	" #w "30, %" #w "[old]\n"			\
c342f78217e822 Will Deacon    2015-04-23  464  	"	cas" #mb #sz "\t" #w "30, %" #w "[new], %[v]\n"		\
c342f78217e822 Will Deacon    2015-04-23  465  	"	mov	%" #w "[ret], " #w "30")			\
c342f78217e822 Will Deacon    2015-04-23  466  	: [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr)		\
c342f78217e822 Will Deacon    2015-04-23  467  	: [old] "r" (x1), [new] "r" (x2)				\
5be8b70af1ca78 Ard Biesheuvel 2016-02-25  468  	: __LL_SC_CLOBBERS, ##cl);					\
c342f78217e822 Will Deacon    2015-04-23  469  									\
c342f78217e822 Will Deacon    2015-04-23  470  	return x0;							\
c342f78217e822 Will Deacon    2015-04-23  471  }
c342f78217e822 Will Deacon    2015-04-23  472  

:::::: The code at line 458 was first introduced by commit
:::::: c342f78217e822d2178265b0b1de232eeb717149 arm64: cmpxchg: patch in lse instructions when supported by the CPU

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
