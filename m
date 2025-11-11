Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C447326943
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 21:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762896447; cv=none; b=FjPq9Jwb64EKyb73c2+/VrhUG7wGwqo7FMYAA94o8GZwXso8z2XknroEbTOsp3LvAxZB+M/rEFykhFH2wf0gFhaylhG046uY3IHLVEKMf6GyN2FqiIUvD4bFyka2ddymi4Set79DCVbVRKoleHLKlxFGp2UVYmOv+aC5eZbn1+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762896447; c=relaxed/simple;
	bh=JZMfWYlosiQ+jG+roub4HqnknxiGqEqxIcdrVe6m17E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dC+Aoa0YZiNO5VKbHbynSX7uE9jwfuDgBxEcRDVN16bfxPgumurdySuEofp8OYC+la/sUXOCnaDx/n1jBocjuE7SfaGlb5DYrIIrn0hyh04hPvrXlpd9Ok9gQdo0DmPcnbSjjx+HfotvK6gfLxPEGqaRfxkutKLvpwQyDUT37N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+7H0spY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+7H0spY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762896445; x=1794432445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZMfWYlosiQ+jG+roub4HqnknxiGqEqxIcdrVe6m17E=;
  b=l+7H0spY52CihLi9q/TbyKcrxtEmFu3jB+Hjtx44e8GcM/5LWZopINNQ
   baeVO9e62wXRwMdY1lLEg2QRiwv9EjefBT8qcJyhii63uLDqczkEO4mct
   HFX46jocrjgdJkmckBueCTSRxcTBjs9oHfUrTwin9QkiYF1e+XNruITVe
   fvCjIUQBSg4Ci6HLSv8zQrKvznY4M6InjlhDxXo8e3R1HP4Rml1ZiownS
   wxPC1F0yjs9YMuYWEkpVzOfeqf5BtcYHmPPlyeVGhj/2WgZKerSEaRqEb
   fsjHG9QqFaI8ed4mOPcXnrgxnAuIG2ZXC+Deqwaku+OK6bESUY/L3adbE
   A==;
X-CSE-ConnectionGUID: 8u0LcqyTQ3CD4DHHMXNLlg==
X-CSE-MsgGUID: +BlZMWc8Rla0fQVqJUFR5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68823583"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="68823583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 13:27:25 -0800
X-CSE-ConnectionGUID: PT0H8EX/TryMTWtJMtK/hA==
X-CSE-MsgGUID: n/rfd7WfQEuBHjYOzV7yyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="193437550"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Nov 2025 13:27:24 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIvtZ-0003aN-2D;
	Tue, 11 Nov 2025 21:27:21 +0000
Date: Wed, 12 Nov 2025 05:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 14/35] include/net/sock.h:2205:10: error:
 assigning to 'struct dst_entry *' from incompatible type 'void'
Message-ID: <202511120521.WdxmtLQc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   1eb5525d8102cc1b1a667ebfb2d04d442ae3dba2
commit: 355b5b134cdf99fd5e1edc4e58ba6702ec061037 [14/35] rcu: Support Clang's context analysis
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511120521.WdxmtLQc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120521.WdxmtLQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120521.WdxmtLQc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:19:
>> include/net/sock.h:2205:10: error: assigning to 'struct dst_entry *' from incompatible type 'void'
    2205 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/net/sock.h:2205:12: warning: expression result unused [-Wunused-value]
    2205 |         old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:26: note: expanded from macro 'unrcu_pointer'
     532 | #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:523:3: note: expanded from macro '__unrcu_pointer'
     519 | #define __unrcu_pointer(p, local)                                       \
         |                                                                         ~
     520 | context_unsafe(                                                 \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     521 |         typeof(*p) *local = (typeof(*p) *__force)(p);                   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     522 |         rcu_check_sparse(p, __rcu);                                     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     523 |         ((typeof(*p) __force __kernel *)(local));                       \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler-context-analysis.h:197:2: note: expanded from macro '\
   context_unsafe'
     197 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +2205 include/net/sock.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  2197  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2198  static inline void
^1da177e4c3f41 Linus Torvalds 2005-04-16  2199  sk_dst_set(struct sock *sk, struct dst_entry *dst)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2200  {
7f502361531e9e Eric Dumazet   2014-06-30  2201  	struct dst_entry *old_dst;
7f502361531e9e Eric Dumazet   2014-06-30  2202  
7f502361531e9e Eric Dumazet   2014-06-30  2203  	sk_tx_queue_clear(sk);
eb44ad4e635132 Eric Dumazet   2023-09-21  2204  	WRITE_ONCE(sk->sk_dst_pending_confirm, 0);
b4cb4a1391dcdc Eric Dumazet   2024-06-04 @2205  	old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
7f502361531e9e Eric Dumazet   2014-06-30  2206  	dst_release(old_dst);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2207  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2208  

:::::: The code at line 2205 was first introduced by commit
:::::: b4cb4a1391dcdc640c4ade003aaf0ee19cc8d509 net: use unrcu_pointer() helper

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
