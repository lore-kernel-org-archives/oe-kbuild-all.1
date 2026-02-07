Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9027F75C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 07:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770449031; cv=none; b=j5LvKMwlQ2kYPXAQk5Mz1sF8cRTt6eDK4i3lPeGpPZ5mrhHycwJ+qfCE51fpHzkUPkJZy57Z5O2NnO+XgWdzxmKQzKztO8EbOTvmnZrTr/00xo5AA7WbVIrf0JmluJoBVDsDqRZmPiSbwkLCUy+adFaKgo28n4LtZToLxgA92Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770449031; c=relaxed/simple;
	bh=ii/8aMD8Bj99hyrGcsEbkUvwxd9Z+pAUPsF9wYZZHGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U3WdrWHwARnKRkzyQeETw7/Qy5obhKW737z7fD5tw2TN3wCpIHZRbxLIEW487CPpeKU6mBv3S1ydFWSMnTi5dySTMIQhE1SDQ3w9bRes1gBqAHTjIfYP9pnWJgj9ouMZ0AzeV4nh0hdthPqAJ/8AxgOYauRO0xms0Jke4Mq8f+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eS+km36Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eS+km36Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770449031; x=1801985031;
  h=date:from:to:cc:subject:message-id;
  bh=ii/8aMD8Bj99hyrGcsEbkUvwxd9Z+pAUPsF9wYZZHGk=;
  b=eS+km36ZVCrFRlu5IQHekd3PAHoNTx14f7SJdUEJvItCTTT5Apu5ZEQ9
   cyWHljvBJuK2wxdmors0F0+Z23+n+dqzHH1/rxjS+ku6qLATDnLLj13mv
   G/EYWWrwD3JAYMkGLikj1t/7krcrnvTcoaCWzO+c2nc4DAUZGi2s1nU6U
   XOJMbM44FUcimtmWWFRkEsUYiaVNIEWgmgMn4UYYhV7yjd6K+X8ICiAAL
   mYib4oCzE4Mk7vM3ElhVh0NlrmW7ibT6w54BGdrBhzgvwTaewQFzJYJ96
   Yd4EMBOf+NU+16Dob1rjglVz0OGEYZh34arxVbuR7umgLSN1g7I07GPDe
   w==;
X-CSE-ConnectionGUID: Z4aiNjcjSaSzqu4Yn/XeBw==
X-CSE-MsgGUID: EpcFF42/Q2Gz20GyNefNPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71830211"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71830211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 23:23:37 -0800
X-CSE-ConnectionGUID: bFUqEA6+TIKNawJ+LbnKhw==
X-CSE-MsgGUID: EonrPa+RQay4bJdtDRvrhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="216055431"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 23:23:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vocfE-00000000lTu-37Xu;
	Sat, 07 Feb 2026 07:23:32 +0000
Date: Sat, 07 Feb 2026 15:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/net.h:23:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202602071558.BaTVzs9l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eeee2f3cb9b462b9954fc31022a42fe014fbdc24
commit: 79e2fce9cd4a58d39cfd5fd081e4ff8d5911adc3 [1/1] ANDROID: GKI: net: add vendor hooks for 'struct sock' lifecycle
config: i386-randconfig-r111-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071558.BaTVzs9l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071558.BaTVzs9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071558.BaTVzs9l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/sock.c: note: in included file:
>> include/trace/hooks/net.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   net/core/sock.c:2417:9: sparse: sparse: context imbalance in 'sk_clone_lock' - wrong count at exit
   net/core/sock.c:2421:6: sparse: sparse: context imbalance in 'sk_free_unlock_clone' - unexpected unlock
   net/core/sock.c:4031:13: sparse: sparse: context imbalance in 'proto_seq_start' - wrong count at exit
   net/core/sock.c:4043:13: sparse: sparse: context imbalance in 'proto_seq_stop' - wrong count at exit

vim +23 include/trace/hooks/net.h

    10	
    11	struct packet_type;
    12	struct list_head;
    13	DECLARE_HOOK(android_vh_ptype_head,
    14		TP_PROTO(const struct packet_type *pt, struct list_head *vendor_pt),
    15		TP_ARGS(pt, vendor_pt));
    16	
    17	struct nf_conn;
    18	struct sock;
    19	DECLARE_RESTRICTED_HOOK(android_rvh_nf_conn_alloc,
    20		TP_PROTO(struct nf_conn *nf_conn), TP_ARGS(nf_conn), 1);
    21	DECLARE_RESTRICTED_HOOK(android_rvh_nf_conn_free,
    22		TP_PROTO(struct nf_conn *nf_conn), TP_ARGS(nf_conn), 1);
  > 23	DECLARE_RESTRICTED_HOOK(android_rvh_sk_alloc,
    24		TP_PROTO(struct sock *sock), TP_ARGS(sock), 1);
    25	DECLARE_RESTRICTED_HOOK(android_rvh_sk_free,
    26		TP_PROTO(struct sock *sock), TP_ARGS(sock), 1);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
