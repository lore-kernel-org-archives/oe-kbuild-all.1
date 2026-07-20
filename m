Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A67390C8A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 06:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529719; cv=none; b=by8ZK4XSlIf8urbbFuXPEsoqVPtFFmC3jbcTucXTkm8ADVSqVvz5VPRqFrwMlobEaFPGkuDLkMYALlJnTG5WkXQyBxvP70DapxEsha7gPdAteUi72L0EqjYWJrTNmFxpzcoS48wCezmThVzz/FkcHfK3Yao2f3esv8Qnk+no8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529719; c=relaxed/simple;
	bh=KfMF55C+/qERd3Num8z3JvYEwAQG4m4TUyk8pL3iHpI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NRDMTUSiIc7T9rbeLX2F2JTVcAp8PGHWODjhMc8JJGusCSoo8Bje3aaRGpnnpqo4RNJIkhoHKkjDG4ZPGA4VAQVOQbV86k5youbHzQ2r1doocZC4aTIFn8AbFlGnCDZ8ViKC2l/ZPJGRsN9dlUDck7qGnKDV/eD8A0OoRZpaPNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ea6+a5y9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ea6+a5y9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784529716; x=1816065716;
  h=date:from:to:cc:subject:message-id;
  bh=KfMF55C+/qERd3Num8z3JvYEwAQG4m4TUyk8pL3iHpI=;
  b=Ea6+a5y9MYAgLwuFt3q3xpREzYndcqkFA4jK+FT5JKgfid97aTDZ2F0O
   dnzzrd2lsq/evbeORyH/TUxQVF5pFjMQFYT5BbFMxEjslii+yV6w2P47r
   FSzgnc55IK0csiNnRJyDRoZwgVEWIdPvbOiWbUxJjLMXJKZdhWpIm4OpY
   ig2BVI9gVhnJ3c6YRn2PtOuf44/JBg5WrR45GORiK9V2LA2LakMAqEHB2
   STAeOhIbQA7RWZbmSpytGNRDRol8t7APR6KedhaIiotYUJezM01TFqw9r
   lDMJPeWC/iivCNbViDaQnWwZ5jd/DxpeaBCasUi1lc7BNuVUU7fpBlx4W
   A==;
X-CSE-ConnectionGUID: OLmalalAQMO+hED3qZcd7A==
X-CSE-MsgGUID: MKl21W8PSOS3Ulgrcu1Usw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="96615441"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="96615441"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 23:41:56 -0700
X-CSE-ConnectionGUID: ppWzJeBCTBW9MCqIiILanw==
X-CSE-MsgGUID: EwJqenvgTA2PraDKtVevHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="256798147"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 19 Jul 2026 23:41:53 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlhhH-000000006BV-1sBA;
	Mon, 20 Jul 2026 06:41:51 +0000
Date: Mon, 20 Jul 2026 08:41:18 +0200
From: kernel test robot <lkp@intel.com>
To: Taehee Yoo <ap420073@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/knod/knod_core.c:108:15: error: 'struct knod_dev' has no
 member named 'started'
Message-ID: <202607200817.lQXogBsd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Taehee-Yoo/net-knod-add-uapi-and-core-headers/20260720-021105
head:   d65f8a646efeabb7098a8c9a5b586ad3580fe13e
commit: 326530f9cd40b4a123881f1dcc8832b2691c58e4 net: knod: add offload device core and control plane
date:   12 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260720/202607200817.lQXogBsd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260720/202607200817.lQXogBsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607200817.lQXogBsd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cleanup.h:7,
                    from include/linux/jump_label.h:78,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:12,
                    from include/net/knod.h:5,
                    from net/knod/knod_core.c:6:
>> arch/x86/include/asm/percpu_types.h:6:45: error: expected ':', ',', ';', '}' or '__attribute__' before '__seg_gs'
       6 | #define __percpu_seg_override   CONCATENATE(__seg_, __percpu_seg)
         |                                             ^~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   arch/x86/include/asm/percpu_types.h:6:33: note: in expansion of macro 'CONCATENATE'
       6 | #define __percpu_seg_override   CONCATENATE(__seg_, __percpu_seg)
         |                                 ^~~~~~~~~~~
   arch/x86/include/asm/percpu_types.h:12:33: note: in expansion of macro '__percpu_seg_override'
      12 | #define __percpu_qual           __percpu_seg_override
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:71:25: note: in expansion of macro '__percpu_qual'
      71 | # define __percpu       __percpu_qual BTF_TYPE_TAG(percpu)
         |                         ^~~~~~~~~~~~~
   include/net/knod.h:361:38: note: in expansion of macro '__percpu'
     361 |         struct knod_dev_stats *stats __percpu;
         |                                      ^~~~~~~~
   net/knod/knod_core.c: In function 'knod_dev_start':
>> net/knod/knod_core.c:108:15: error: 'struct knod_dev' has no member named 'started'
     108 |         knodev->started = true;
         |               ^~
>> net/knod/knod_core.c:109:19: error: 'struct knod_dev' has no member named 'accel_ops'
     109 |         if (knodev->accel_ops->dev_start)
         |                   ^~
   net/knod/knod_core.c:110:23: error: 'struct knod_dev' has no member named 'accel_ops'
     110 |                 knodev->accel_ops->dev_start(knodev);
         |                       ^~
   net/knod/knod_core.c: In function 'knod_dev_stop':
   net/knod/knod_core.c:117:19: error: 'struct knod_dev' has no member named 'accel_ops'
     117 |         if (knodev->accel_ops->dev_stop)
         |                   ^~
   net/knod/knod_core.c:118:23: error: 'struct knod_dev' has no member named 'accel_ops'
     118 |                 knodev->accel_ops->dev_stop(knodev);
         |                       ^~
   net/knod/knod_core.c:119:15: error: 'struct knod_dev' has no member named 'started'
     119 |         knodev->started = false;
         |               ^~
   net/knod/knod_core.c: In function 'knod_dev_xdp_install':
   net/knod/knod_core.c:125:20: error: 'struct knod_dev' has no member named 'accel_ops'
     125 |         if (!knodev->accel_ops->xdp_ops ||
         |                    ^~
   net/knod/knod_core.c:126:20: error: 'struct knod_dev' has no member named 'accel_ops'
     126 |             !knodev->accel_ops->xdp_ops->xdp_install)
         |                    ^~
   net/knod/knod_core.c:128:22: error: 'struct knod_dev' has no member named 'accel_ops'
     128 |         return knodev->accel_ops->xdp_ops->xdp_install(knodev, xdp);
         |                      ^~
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:593,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11:
   net/knod/knod_core.c: In function 'knod_dev_get_stats64':
>> net/knod/knod_core.c:142:39: error: 'struct knod_dev' has no member named 'stats'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                                       ^~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   net/knod/knod_core.c:142:21: note: in expansion of macro 'per_cpu_ptr'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                     ^~~~~~~~~~~
   In file included from include/linux/compiler_types.h:173,
                    from <command-line>:
>> net/knod/knod_core.c:142:39: error: 'struct knod_dev' has no member named 'stats'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                                       ^~
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   net/knod/knod_core.c:142:21: note: in expansion of macro 'per_cpu_ptr'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                     ^~~~~~~~~~~
>> net/knod/knod_core.c:142:39: error: 'struct knod_dev' has no member named 'stats'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                                       ^~
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   net/knod/knod_core.c:142:21: note: in expansion of macro 'per_cpu_ptr'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                     ^~~~~~~~~~~
>> net/knod/knod_core.c:142:39: error: 'struct knod_dev' has no member named 'stats'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                                       ^~
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   net/knod/knod_core.c:142:21: note: in expansion of macro 'per_cpu_ptr'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                     ^~~~~~~~~~~
>> net/knod/knod_core.c:142:39: error: 'struct knod_dev' has no member named 'stats'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                                       ^~
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   net/knod/knod_core.c:142:21: note: in expansion of macro 'per_cpu_ptr'
     142 |                 p = per_cpu_ptr(knodev->stats, i);
         |                     ^~~~~~~~~~~
   net/knod/knod_core.c: In function 'knod_d2h_copy':
   net/knod/knod_core.c:212:44: error: 'struct knod_dev' has no member named 'accel_ops'
     212 |         struct knod_accel_ops *ops = knodev->accel_ops;
         |                                            ^~
>> net/knod/knod_core.c:220:24: error: 'struct knod_dev' has no member named 'wpriv'
     220 |         wpriv = &knodev->wpriv[napi_index];
         |                        ^~
>> net/knod/knod_core.c:225:26: error: 'struct knod_dev' has no member named 'd2h_lock'
     225 |         spin_lock(&knodev->d2h_lock);
         |                          ^~
   net/knod/knod_core.c:269:28: error: 'struct knod_dev' has no member named 'd2h_lock'
     269 |         spin_unlock(&knodev->d2h_lock);
         |                            ^~
   net/knod/knod_core.c: In function 'knod_d2h_drain':
   net/knod/knod_core.c:306:20: error: 'struct knod_dev' has no member named 'accel_ops'
     306 |             !knodev->accel_ops->d2h_fence)
         |                    ^~
   net/knod/knod_core.c:308:24: error: 'struct knod_dev' has no member named 'wpriv'
     308 |         wpriv = &knodev->wpriv[napi_index];
         |                        ^~
   net/knod/knod_core.c:319:27: error: 'struct knod_dev' has no member named 'accel_ops'
     319 |         cur_fence = knodev->accel_ops->d2h_fence(knodev, d0->sdma_idx);
         |                           ^~
>> net/knod/knod_core.c:339:27: error: 'struct knod_dev' has no member named 'post_copy'
     339 |                 if (knodev->post_copy) {
         |                           ^~
   net/knod/knod_core.c:340:36: error: 'struct knod_dev' has no member named 'post_copy'
     340 |                         if (!knodev->post_copy(knodev, skb, desc, napi_index)) {
         |                                    ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_state_add':
   net/knod/knod_core.c:395:31: error: 'struct knod_dev' has no member named 'accel_ops'
     395 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:396:20: error: 'struct knod_dev' has no member named 'accel_ops'
     396 |             !knodev->accel_ops->ipsec_ops->xdo_dev_state_add)
         |                    ^~
   net/knod/knod_core.c:398:22: error: 'struct knod_dev' has no member named 'accel_ops'
     398 |         return knodev->accel_ops->ipsec_ops->xdo_dev_state_add(knodev, x,
         |                      ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_state_delete':
   net/knod/knod_core.c:407:31: error: 'struct knod_dev' has no member named 'accel_ops'
     407 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:408:20: error: 'struct knod_dev' has no member named 'accel_ops'
     408 |             !knodev->accel_ops->ipsec_ops->xdo_dev_state_delete)
         |                    ^~
   net/knod/knod_core.c:410:15: error: 'struct knod_dev' has no member named 'accel_ops'
     410 |         knodev->accel_ops->ipsec_ops->xdo_dev_state_delete(knodev, x);
         |               ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_state_free':
   net/knod/knod_core.c:418:31: error: 'struct knod_dev' has no member named 'accel_ops'
     418 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:419:20: error: 'struct knod_dev' has no member named 'accel_ops'
     419 |             !knodev->accel_ops->ipsec_ops->xdo_dev_state_free)
         |                    ^~
   net/knod/knod_core.c:421:15: error: 'struct knod_dev' has no member named 'accel_ops'
     421 |         knodev->accel_ops->ipsec_ops->xdo_dev_state_free(knodev, x);
         |               ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_offload_ok':
   net/knod/knod_core.c:429:31: error: 'struct knod_dev' has no member named 'accel_ops'
     429 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:430:20: error: 'struct knod_dev' has no member named 'accel_ops'
     430 |             !knodev->accel_ops->ipsec_ops->xdo_dev_offload_ok)
         |                    ^~
   net/knod/knod_core.c:432:22: error: 'struct knod_dev' has no member named 'accel_ops'
     432 |         return knodev->accel_ops->ipsec_ops->xdo_dev_offload_ok(knodev, skb, x);
         |                      ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_state_advance_esn':
   net/knod/knod_core.c:442:31: error: 'struct knod_dev' has no member named 'accel_ops'
     442 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:443:20: error: 'struct knod_dev' has no member named 'accel_ops'
     443 |             !knodev->accel_ops->ipsec_ops->xdo_dev_state_advance_esn)
         |                    ^~
   net/knod/knod_core.c:445:15: error: 'struct knod_dev' has no member named 'accel_ops'
     445 |         knodev->accel_ops->ipsec_ops->xdo_dev_state_advance_esn(knodev, x);
         |               ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_state_update_stats':
   net/knod/knod_core.c:455:31: error: 'struct knod_dev' has no member named 'accel_ops'
     455 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:456:20: error: 'struct knod_dev' has no member named 'accel_ops'
     456 |             !knodev->accel_ops->ipsec_ops->xdo_dev_state_update_stats)
         |                    ^~
   net/knod/knod_core.c:458:15: error: 'struct knod_dev' has no member named 'accel_ops'
     458 |         knodev->accel_ops->ipsec_ops->xdo_dev_state_update_stats(knodev, x);
         |               ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_policy_add':
   net/knod/knod_core.c:469:31: error: 'struct knod_dev' has no member named 'accel_ops'
     469 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:470:20: error: 'struct knod_dev' has no member named 'accel_ops'
     470 |             !knodev->accel_ops->ipsec_ops->xdo_dev_policy_add)
         |                    ^~
   net/knod/knod_core.c:472:22: error: 'struct knod_dev' has no member named 'accel_ops'
     472 |         return knodev->accel_ops->ipsec_ops->xdo_dev_policy_add(knodev, xp,
         |                      ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_policy_delete':
   net/knod/knod_core.c:483:31: error: 'struct knod_dev' has no member named 'accel_ops'
     483 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:484:20: error: 'struct knod_dev' has no member named 'accel_ops'
     484 |             !knodev->accel_ops->ipsec_ops->xdo_dev_policy_delete)
         |                    ^~
   net/knod/knod_core.c:486:15: error: 'struct knod_dev' has no member named 'accel_ops'
     486 |         knodev->accel_ops->ipsec_ops->xdo_dev_policy_delete(knodev, xp);
         |               ^~
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_policy_free':
   net/knod/knod_core.c:496:31: error: 'struct knod_dev' has no member named 'accel_ops'
     496 |         if (!knodev || !knodev->accel_ops->ipsec_ops ||
         |                               ^~
   net/knod/knod_core.c:497:20: error: 'struct knod_dev' has no member named 'accel_ops'
     497 |             !knodev->accel_ops->ipsec_ops->xdo_dev_policy_free)
         |                    ^~
   net/knod/knod_core.c:499:15: error: 'struct knod_dev' has no member named 'accel_ops'
     499 |         knodev->accel_ops->ipsec_ops->xdo_dev_policy_free(knodev, xp);
         |               ^~
   net/knod/knod_core.c: In function 'knod_dev_xdp_drain_pass':
   net/knod/knod_core.c:517:31: error: 'struct knod_dev' has no member named 'accel_ops'
     517 |         if (!knodev || !knodev->accel_ops)
         |                               ^~
   net/knod/knod_core.c: In function 'knod_ipsec_attach':
   net/knod/knod_core.c:531:20: error: 'struct knod_dev' has no member named 'accel_ops'
     531 |         if (!knodev->accel_ops->ipsec_ops)
         |                    ^~
   net/knod/knod_core.c:534:21: error: 'struct knod_dev' has no member named 'accel_ops'
     534 |         ops = knodev->accel_ops->ipsec_ops;
         |                     ^~
>> net/knod/knod_core.c:548:15: error: 'struct knod_dev' has no member named 'ipsec_orig_xfrmdev_ops'
     548 |         knodev->ipsec_orig_xfrmdev_ops = knodev->netdev->xfrmdev_ops;
         |               ^~
>> net/knod/knod_core.c:549:15: error: 'struct knod_dev' has no member named 'ipsec_added_hw_esp'
     549 |         knodev->ipsec_added_hw_esp =
         |               ^~
   net/knod/knod_core.c: In function 'knod_ipsec_detach':
   net/knod/knod_core.c:563:50: error: 'struct knod_dev' has no member named 'accel_ops'
     563 |         struct knod_accel_ipsec_ops *ops = knodev->accel_ops->ipsec_ops;
         |                                                  ^~
   net/knod/knod_core.c:570:19: error: 'struct knod_dev' has no member named 'ipsec_added_hw_esp'
     570 |         if (knodev->ipsec_added_hw_esp) {
         |                   ^~
   net/knod/knod_core.c:574:45: error: 'struct knod_dev' has no member named 'ipsec_orig_xfrmdev_ops'
     574 |         knodev->netdev->xfrmdev_ops = knodev->ipsec_orig_xfrmdev_ops;
         |                                             ^~
   net/knod/knod_core.c: In function 'knod_pass_drained':
>> net/knod/knod_core.c:704:40: error: 'struct knod_dev' has no member named 'pp_live'
     704 |         if (atomic_dec_and_test(&knodev->pp_live))
         |                                        ^~
>> net/knod/knod_core.c:705:33: error: 'struct knod_dev' has no member named 'pp_drained'
     705 |                 complete(&knodev->pp_drained);
         |                                 ^~
   net/knod/knod_core.c: In function 'knod_pass_attach':
   net/knod/knod_core.c:740:20: error: 'struct knod_dev' has no member named 'accel_ops'
     740 |         if (!knodev->accel_ops->alloc_mem)
         |                    ^~
   net/knod/knod_core.c:744:23: error: 'struct knod_dev' has no member named 'accel_ops'
     744 |         kaddr = knodev->accel_ops->alloc_mem(knodev, total, &base_gaddr, &pages,
         |                       ^~
   net/knod/knod_core.c:751:23: error: 'struct knod_dev' has no member named 'accel_ops'
     751 |                 knodev->accel_ops->free_mem(knodev, pass_priv);
         |                       ^~
   net/knod/knod_core.c:755:32: error: 'struct knod_dev' has no member named 'pp_drained'
     755 |         init_completion(&knodev->pp_drained);
         |                                ^~
   net/knod/knod_core.c:756:27: error: 'struct knod_dev' has no member named 'pp_live'
     756 |         atomic_set(&knodev->pp_live, 0);
         |                           ^~
   In file included from include/linux/sched.h:38,
                    from include/linux/percpu.h:12,
                    from arch/x86/include/asm/msr.h:16,
                    from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:10:
   net/knod/knod_core.c:757:31: error: 'struct knod_dev' has no member named 'd2h_lock'
     757 |         spin_lock_init(&knodev->d2h_lock);
         |                               ^~
   include/linux/spinlock.h:325:45: note: in definition of macro 'spin_lock_init'
     325 |         __raw_spin_lock_init(spinlock_check(lock),              \
         |                                             ^~~~
   net/knod/knod_core.c:760:55: error: 'struct knod_dev' has no member named 'wpriv'
     760 |                 struct knod_work_priv *wpriv = &knodev->wpriv[qi];
         |                                                       ^~
   net/knod/knod_core.c:781:35: error: 'struct knod_dev' has no member named 'pp_live'
     781 |                 atomic_inc(&knodev->pp_live);
         |                                   ^~
>> net/knod/knod_core.c:784:15: error: 'struct knod_dev' has no member named 'pass_priv'
     784 |         knodev->pass_priv = pass_priv;
         |               ^~
   net/knod/knod_core.c:789:37: error: 'struct knod_dev' has no member named 'wpriv'
     789 |                 spsc_destroy(&knodev->wpriv[qi].pass_pending);
         |                                     ^~
   net/knod/knod_core.c:790:41: error: 'struct knod_dev' has no member named 'wpriv'
     790 |                 page_pool_destroy(knodev->wpriv[qi].pass_pool);
         |                                         ^~
   net/knod/knod_core.c:791:23: error: 'struct knod_dev' has no member named 'wpriv'
     791 |                 knodev->wpriv[qi].pass_pool = NULL;
         |                       ^~
   net/knod/knod_core.c:793:32: error: 'struct knod_dev' has no member named 'pp_live'
     793 |         if (atomic_read(&knodev->pp_live))
         |                                ^~
   net/knod/knod_core.c:794:52: error: 'struct knod_dev' has no member named 'pp_drained'
     794 |                 wait_for_completion_timeout(&knodev->pp_drained,
         |                                                    ^~
   net/knod/knod_core.c:796:15: error: 'struct knod_dev' has no member named 'accel_ops'
     796 |         knodev->accel_ops->free_mem(knodev, pass_priv);
         |               ^~
   net/knod/knod_core.c: In function 'knod_pass_flush':
   net/knod/knod_core.c:808:47: error: 'struct knod_dev' has no member named 'wpriv'
     808 |         struct knod_work_priv *wpriv = &knodev->wpriv[qi];
         |                                               ^~
   net/knod/knod_core.c:822:38: error: 'struct knod_dev' has no member named 'accel_ops'
     822 |                         while (knodev->accel_ops->d2h_fence && spins-- &&
         |                                      ^~
   net/knod/knod_core.c:823:44: error: 'struct knod_dev' has no member named 'accel_ops'
     823 |                                (s32)(knodev->accel_ops->d2h_fence(knodev,
         |                                            ^~
   net/knod/knod_core.c:827:41: error: 'struct knod_dev' has no member named 'accel_ops'
     827 |                         WARN_ONCE(knodev->accel_ops->d2h_fence &&
         |                                         ^~
   arch/x86/include/asm/bug.h:184:32: note: in definition of macro 'WARN_ONCE'
     184 |         int __ret_warn_on = !!(cond);                                   \
         |                                ^~~~
   net/knod/knod_core.c:828:47: error: 'struct knod_dev' has no member named 'accel_ops'
     828 |                                   (s32)(knodev->accel_ops->d2h_fence(knodev,
         |                                               ^~
   arch/x86/include/asm/bug.h:184:32: note: in definition of macro 'WARN_ONCE'
     184 |         int __ret_warn_on = !!(cond);                                   \
         |                                ^~~~
   net/knod/knod_core.c: In function 'knod_pass_detach':
   net/knod/knod_core.c:857:20: error: 'struct knod_dev' has no member named 'pass_priv'
     857 |         if (!knodev->pass_priv)
         |                    ^~
   net/knod/knod_core.c:864:28: error: 'struct knod_dev' has no member named 'wpriv'
     864 |                 if (!knodev->wpriv[qi].pass_pool)
         |                            ^~
   net/knod/knod_core.c:871:37: error: 'struct knod_dev' has no member named 'wpriv'
     871 |                 spsc_destroy(&knodev->wpriv[qi].pass_pending);
         |                                     ^~
   net/knod/knod_core.c:872:41: error: 'struct knod_dev' has no member named 'wpriv'
     872 |                 page_pool_destroy(knodev->wpriv[qi].pass_pool);
         |                                         ^~
   net/knod/knod_core.c:873:23: error: 'struct knod_dev' has no member named 'wpriv'
     873 |                 knodev->wpriv[qi].pass_pool = NULL;
         |                       ^~
   net/knod/knod_core.c:875:32: error: 'struct knod_dev' has no member named 'pp_live'
     875 |         if (atomic_read(&knodev->pp_live))
         |                                ^~
   net/knod/knod_core.c:876:52: error: 'struct knod_dev' has no member named 'pp_drained'
     876 |                 wait_for_completion_timeout(&knodev->pp_drained,
         |                                                    ^~
   net/knod/knod_core.c:878:15: error: 'struct knod_dev' has no member named 'accel_ops'
     878 |         knodev->accel_ops->free_mem(knodev, knodev->pass_priv);
         |               ^~
   net/knod/knod_core.c:878:51: error: 'struct knod_dev' has no member named 'pass_priv'
     878 |         knodev->accel_ops->free_mem(knodev, knodev->pass_priv);
         |                                                   ^~
   net/knod/knod_core.c:879:15: error: 'struct knod_dev' has no member named 'pass_priv'
     879 |         knodev->pass_priv = NULL;
         |               ^~
   net/knod/knod_core.c: In function 'knod_dmabuf_attach':
   net/knod/knod_core.c:899:32: error: 'struct knod_dev' has no member named 'wpriv'
     899 |                 dmabuf = knodev->wpriv[i].dmabuf;
         |                                ^~
   net/knod/knod_core.c: In function 'knod_dev_attach':
   net/knod/knod_core.c:991:15: error: 'struct knod_dev' has no member named 'accel_ops'
     991 |         knodev->accel_ops = accel->accel_ops;
         |               ^~
>> net/knod/knod_core.c:992:15: error: 'struct knod_dev' has no member named 'nic_ops'
     992 |         knodev->nic_ops = knetdev->nic_ops;
         |               ^~
   net/knod/knod_core.c:995:15: error: 'struct knod_dev' has no member named 'stats'
     995 |         knodev->stats = netdev_alloc_pcpu_stats(struct knod_dev_stats);
         |               ^~
   net/knod/knod_core.c:996:20: error: 'struct knod_dev' has no member named 'stats'
     996 |         if (!knodev->stats) {
         |                    ^~
   net/knod/knod_core.c:1003:15: error: 'struct knod_dev' has no member named 'wpriv'
    1003 |         knodev->wpriv = kmalloc_array(KNOD_SPSC_MAX,
         |               ^~
   net/knod/knod_core.c:1006:20: error: 'struct knod_dev' has no member named 'wpriv'
    1006 |         if (!knodev->wpriv) {
         |                    ^~
   net/knod/knod_core.c:1014:21: error: 'struct knod_dev' has no member named 'nic_ops'
    1014 |         err = knodev->nic_ops->attach(knodev);
         |                     ^~
   net/knod/knod_core.c:1022:21: error: 'struct knod_dev' has no member named 'accel_ops'
    1022 |         err = knodev->accel_ops->attach(knodev);
         |                     ^~
   net/knod/knod_core.c:1038:27: error: 'struct knod_dev' has no member named 'accel_ops'
    1038 |                 if (knodev->accel_ops->alloc_mem) {
         |                           ^~
   net/knod/knod_core.c:1044:43: error: 'struct knod_dev' has no member named 'accel_ops'
    1044 |                         base_pool = knodev->accel_ops->alloc_mem(knodev, total,
         |                                           ^~
   net/knod/knod_core.c:1054:31: error: 'struct knod_dev' has no member named 'wpriv'
    1054 |                         knodev->wpriv[0].spsc_pool_priv = pool_priv;
         |                               ^~
   net/knod/knod_core.c:1059:39: error: 'struct knod_dev' has no member named 'wpriv'
    1059 |                                 knodev->wpriv[i].spsc_pool_gaddr =
         |                                       ^~
   net/knod/knod_core.c:1061:58: error: 'struct knod_dev' has no member named 'wpriv'
    1061 |                                 err = __spsc_init(&knodev->wpriv[i].spsc_bds,
         |                                                          ^~
   net/knod/knod_core.c:1073:56: error: 'struct knod_dev' has no member named 'wpriv'
    1073 |                                 err = spsc_init(&knodev->wpriv[i].spsc_bds,
         |                                                        ^~
   net/knod/knod_core.c:1089:37: error: 'struct knod_dev' has no member named 'wpriv'
    1089 |                 spsc_destroy(&knodev->wpriv[i].spsc_bds);
         |                                     ^~
   net/knod/knod_core.c:1090:19: error: 'struct knod_dev' has no member named 'wpriv'
    1090 |         if (knodev->wpriv[0].spsc_pool_priv)
         |                   ^~
   net/knod/knod_core.c:1091:23: error: 'struct knod_dev' has no member named 'accel_ops'
    1091 |                 knodev->accel_ops->free_mem(knodev,
         |                       ^~
   net/knod/knod_core.c:1092:39: error: 'struct knod_dev' has no member named 'wpriv'
    1092 |                                 knodev->wpriv[0].spsc_pool_priv);
         |                                       ^~
   net/knod/knod_core.c:1093:15: error: 'struct knod_dev' has no member named 'accel_ops'
    1093 |         knodev->accel_ops->detach(knodev);
         |               ^~
   net/knod/knod_core.c:1117:19: error: 'struct knod_dev' has no member named 'accel_ops'
    1117 |         if (knodev->accel_ops->xdp_ops && knodev->accel_ops->xdp_ops->init) {
         |                   ^~
   net/knod/knod_core.c:1117:49: error: 'struct knod_dev' has no member named 'accel_ops'
    1117 |         if (knodev->accel_ops->xdp_ops && knodev->accel_ops->xdp_ops->init) {
         |                                                 ^~
   net/knod/knod_core.c:1118:29: error: 'struct knod_dev' has no member named 'accel_ops'
    1118 |                 err = knodev->accel_ops->xdp_ops->init(knodev);
         |                             ^~
   net/knod/knod_core.c:1133:19: error: 'struct knod_dev' has no member named 'accel_ops'
    1133 |         if (knodev->accel_ops->mp_map) {
         |                   ^~
   net/knod/knod_core.c:1134:29: error: 'struct knod_dev' has no member named 'accel_ops'
    1134 |                 err = knodev->accel_ops->mp_map(knodev);
         |                             ^~
   net/knod/knod_core.c:1153:37: error: 'struct knod_dev' has no member named 'wpriv'
    1153 |                 spsc_destroy(&knodev->wpriv[i].spsc_bds);
         |                                     ^~
   net/knod/knod_core.c:1154:19: error: 'struct knod_dev' has no member named 'wpriv'
    1154 |         if (knodev->wpriv[0].spsc_pool_priv)
         |                   ^~
   net/knod/knod_core.c:1155:23: error: 'struct knod_dev' has no member named 'accel_ops'
    1155 |                 knodev->accel_ops->free_mem(knodev,
         |                       ^~
   net/knod/knod_core.c:1156:39: error: 'struct knod_dev' has no member named 'wpriv'
    1156 |                                 knodev->wpriv[0].spsc_pool_priv);
         |                                       ^~
   net/knod/knod_core.c:1157:15: error: 'struct knod_dev' has no member named 'accel_ops'
    1157 |         knodev->accel_ops->detach(knodev);
         |               ^~
   net/knod/knod_core.c:1159:15: error: 'struct knod_dev' has no member named 'nic_ops'
    1159 |         knodev->nic_ops->detach(knodev);
         |               ^~
   net/knod/knod_core.c:1162:21: error: 'struct knod_dev' has no member named 'wpriv'
    1162 |         kfree(knodev->wpriv);
         |                     ^~
   net/knod/knod_core.c:1164:27: error: 'struct knod_dev' has no member named 'stats'
    1164 |         free_percpu(knodev->stats);
         |                           ^~
   net/knod/knod_core.c: In function 'knod_dev_detach':
   net/knod/knod_core.c:1197:19: error: 'struct knod_dev' has no member named 'accel_ops'
    1197 |         if (knodev->accel_ops->pre_detach)
         |                   ^~
   net/knod/knod_core.c:1198:23: error: 'struct knod_dev' has no member named 'accel_ops'
    1198 |                 knodev->accel_ops->pre_detach(knodev);
         |                       ^~
   net/knod/knod_core.c:1203:37: error: 'struct knod_dev' has no member named 'wpriv'
..


vim +108 net/knod/knod_core.c

   104	
   105	void knod_dev_start(struct knod_dev *knodev)
   106	{
   107		/* Interface up: start the active feature's worker. */
 > 108		knodev->started = true;
 > 109		if (knodev->accel_ops->dev_start)
   110			knodev->accel_ops->dev_start(knodev);
   111	}
   112	EXPORT_SYMBOL(knod_dev_start);
   113	
   114	void knod_dev_stop(struct knod_dev *knodev)
   115	{
   116		/* Interface down: stop the worker + drain the GPU in-flight. */
   117		if (knodev->accel_ops->dev_stop)
   118			knodev->accel_ops->dev_stop(knodev);
   119		knodev->started = false;
   120	}
   121	EXPORT_SYMBOL(knod_dev_stop);
   122	
   123	int knod_dev_xdp_install(struct knod_dev *knodev, struct netdev_bpf *xdp)
   124	{
   125		if (!knodev->accel_ops->xdp_ops ||
   126		    !knodev->accel_ops->xdp_ops->xdp_install)
   127			return -EOPNOTSUPP;
   128		return knodev->accel_ops->xdp_ops->xdp_install(knodev, xdp);
   129	}
   130	EXPORT_SYMBOL(knod_dev_xdp_install);
   131	
   132	void knod_dev_get_stats64(struct knod_dev *knodev,
   133				  struct rtnl_link_stats64 *stats)
   134	{
   135		struct knod_dev_stats *p;
   136		u32 tx_dropped = 0, tx_errors = 0;
   137		u64 tx_packets, tx_bytes;
   138		unsigned int start;
   139		int i;
   140	
   141		for_each_possible_cpu(i) {
 > 142			p = per_cpu_ptr(knodev->stats, i);
   143			do {
   144				start = u64_stats_fetch_begin(&p->syncp);
   145				tx_packets      = u64_stats_read(&p->tx_packets);
   146				tx_bytes        = u64_stats_read(&p->tx_bytes);
   147			} while (u64_stats_fetch_retry(&p->syncp, start));
   148	
   149			stats->tx_packets       += tx_packets;
   150			stats->tx_bytes         += tx_bytes;
   151			tx_dropped      += READ_ONCE(p->tx_dropped);
   152			tx_errors	+= READ_ONCE(p->tx_errors);
   153		}
   154		stats->tx_dropped       += tx_dropped;
   155		stats->tx_errors	+= tx_errors;
   156	}
   157	EXPORT_SYMBOL(knod_dev_get_stats64);
   158	
   159	/*
   160	 * Wrap a delivery-pool page as a zero-copy head_frag skb: the packet sits at
   161	 * @off (preserved headroom) for @len bytes.  Building it linear keeps
   162	 * skb->data on the packet so callers can edit headers in place.  The page
   163	 * recycles to @pool when the skb is freed.  On oversize or alloc failure the
   164	 * page is returned to @pool and NULL is returned.  @napi selects the NAPI skb
   165	 * cache; callers outside softirq pass false.
   166	 */
   167	struct sk_buff *knod_pass_build_skb(netmem_ref netmem, u16 off, u16 len,
   168					    struct page_pool *pool, bool napi)
   169	{
   170		struct page *pg = netmem_to_page(netmem);
   171		struct sk_buff *skb;
   172	
   173		/* Must fit alongside skb_shared_info at the page tail; MTU is capped
   174		 * below this, so drop the rare oversized outlier.
   175		 */
   176		if (off + len > SKB_WITH_OVERHEAD(PAGE_SIZE)) {
   177			if (pool)
   178				page_pool_put_full_netmem(pool, netmem, false);
   179			return NULL;
   180		}
   181	
   182		if (napi)
   183			skb = napi_build_skb(page_address(pg), PAGE_SIZE);
   184		else
   185			skb = build_skb(page_address(pg), PAGE_SIZE);
   186		if (unlikely(!skb)) {
   187			if (pool)
   188				page_pool_put_full_netmem(pool, netmem, false);
   189			return NULL;
   190		}
   191	
   192		skb_mark_for_recycle(skb);
   193		skb_reserve(skb, off);
   194		skb_put(skb, len);
   195		return skb;
   196	}
   197	EXPORT_SYMBOL(knod_pass_build_skb);
   198	
   199	/*
   200	 * Device->host copy: the NIC DD hands the PASS bds it accumulated during its
   201	 * single act traversal.  Allocate a delivery page per packet, issue the accel
   202	 * SDMA (GPU -> page) asynchronously, and queue a descriptor on the per-queue
   203	 * pending ring tagged with this batch's fence; knod_d2h_drain delivers them
   204	 * once the fence lands and recycles the source.  Sources that cannot be queued
   205	 * (bad len / ring full / pool empty) are recycled here.  Returns the count
   206	 * queued.  Producer and the drain consumer run on the same per-queue NAPI, so
   207	 * the ring is single-threaded; @d2h_lock only guards the shared SDMA submit.
   208	 */
   209	int knod_d2h_copy(struct knod_dev *knodev, int napi_index,
   210			  struct spsc_pass_bd *bds, int cnt)
   211	{
   212		struct knod_accel_ops *ops = knodev->accel_ops;
   213		struct knod_work_priv *wpriv;
   214		struct page_pool *pool;
   215		bool submitted = false;
   216		int i, produced = 0;
   217	
   218		if (napi_index < 0 || napi_index >= KNOD_SPSC_MAX || !ops->d2h_submit)
   219			goto drop_all;
 > 220		wpriv = &knodev->wpriv[napi_index];
   221		pool = READ_ONCE(wpriv->pass_pool);
   222		if (!pool || !wpriv->pass_pending.slots)
   223			goto drop_all;
   224	
 > 225		spin_lock(&knodev->d2h_lock);
   226	
   227		for (i = 0; i < cnt; i++) {
   228			netmem_ref src = bds[i].netmem;
   229			struct knod_pass_desc *desc;
   230			netmem_ref dst;
   231			void *ptr;
   232			u32 fv;
   233			u16 off = bds[i].off;
   234			u16 len = bds[i].len;
   235	
   236			if (!len || off + len > SKB_WITH_OVERHEAD(PAGE_SIZE))
   237				goto drop;
   238			if (spsc_produce(&wpriv->pass_pending, &ptr))
   239				goto drop;
   240			dst = page_pool_dev_alloc_netmems(pool);
   241			if (!dst)
   242				goto drop;	/* slot left uncommitted, reused next */
   243	
   244			fv = ops->d2h_submit(knodev,
   245					     page_pool_get_dma_addr_netmem(dst) + off,
   246					     napi_index, bds[i].page_idx, off, len);
   247			if (!fv) {		/* SDMA ring full: backpressure drop */
   248				page_pool_put_full_netmem(pool, dst, false);
   249				goto drop;
   250			}
   251			submitted = true;
   252	
   253			desc = ptr;
   254			desc->netmem = dst;
   255			desc->src = src;
   256			desc->off = off;
   257			desc->len = len;
   258			desc->fence_val = fv;
   259			desc->sdma_idx = 0;
   260			spsc_produce_commit(&wpriv->pass_pending);
   261			produced++;
   262			continue;
   263	drop:
   264			page_pool_recycle_direct_netmem(netmem_get_pp(src), src);
   265		}
   266	
   267		if (submitted)
   268			ops->d2h_kick(knodev);
   269		spin_unlock(&knodev->d2h_lock);
   270	
   271		/* The copies are async; re-arm the NAPI so the drain runs once the
   272		 * SDMA lands -- at low rate, RX traffic alone may not poll again soon.
   273		 */
   274		if (submitted)
   275			knod_napi_kick(wpriv);
   276		return produced;
   277	
   278	drop_all:
   279		for (i = 0; i < cnt; i++)
   280			page_pool_recycle_direct_netmem(netmem_get_pp(bds[i].netmem),
   281							bds[i].netmem);
   282		return 0;
   283	}
   284	EXPORT_SYMBOL(knod_d2h_copy);
   285	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
