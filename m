Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB02E3714
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 20:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754166769; cv=none; b=o7VA8ixJvIXfdnLN1Dv5TiVZKNOy9vn22eKC3GJwemhSmvdSu8B7crn8IBqZQwJaI/POOuKAIDp1l3gOZEu902Nen6FaumcvpaRzribYg2HoqNS4tg5JkC6TPPmtQy/EWVh33T0tycm4pmxMnZDudoVHXK75ittB9SvWdxPvZlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754166769; c=relaxed/simple;
	bh=A9/FMGgwL8k4f/Cs6mpDxwtHqIV6h3Aeolasc0uvK38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+cqyAUr1TY8BqsMITiOQizSPZvKeLsiZDdf21yiKs+N9AF69P0G6K76WdKPEsDcZ9IZpctcv2pC5/lYVd9/IM1UoHRnfHqSeQm1Nu2I+JKACd6teu0LaUBs2JEfFT3Gaizy7O5pNBj7z3B3rKvE8IyXDFxmXzqgd/oaAHzC+LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ixch0LOE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ixch0LOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754166767; x=1785702767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9/FMGgwL8k4f/Cs6mpDxwtHqIV6h3Aeolasc0uvK38=;
  b=Ixch0LOEFPRcaYHKN4BiGu2KWFZY+iJYMkDozav4uIU1OK47WJ2lv+0E
   KGke5m3648zN4HfHAJD8/ZKtAv/ACMUWQwVBfGYFveoaPlCUwmxpkULNs
   GNIKCnSmAu8pHEcCnucLgR9Jt8BkCs5olN312YlvXIT5tVg+d3x6acJtP
   csnlhHioedtrT5Ui0vWM+7D2nbGc6Rmo5nbcVefZqvlcG2Nk4yZJ5t5qh
   zxY9wdcRte7J4TkvHJBAksWciM28VDY72YZ+sGyqC8fwRhQ3aGt86635/
   inZgI4zLnaxGMNUh/DgwLKLtnJN9JvqCv3sUFx0kMvaWYxB/iWz2/7gDi
   g==;
X-CSE-ConnectionGUID: /p+grfWIRCGoai9i7qgwuA==
X-CSE-MsgGUID: KA1Vdck9TIa8jgC2cGE/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="67172597"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67172597"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 13:32:45 -0700
X-CSE-ConnectionGUID: oXfmAA66T/Wnq0fRYo4JAA==
X-CSE-MsgGUID: OmQBGNZLSM2WhWRn+omqEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168093531"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Aug 2025 13:32:40 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiIuE-0005aq-13;
	Sat, 02 Aug 2025 20:32:38 +0000
Date: Sun, 3 Aug 2025 04:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 14/33] include/net/sock.h:2179:17: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202508030440.kkrawze3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   fdd3a307f8bbbf8727a633b44c3d6a31103e1938
commit: 20516295fa8be1f4447326d6b8fa1b1c5e236951 [14/33] rcu: Support Clang's capability analysis
config: arc-randconfig-r123-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030440.kkrawze3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250803/202508030440.kkrawze3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030440.kkrawze3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/sock.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h, include/linux/errqueue.h):
>> include/net/sock.h:2179:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2179:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2179:17: sparse:     got void
>> include/net/sock.h:2179:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2179:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2179:17: sparse:     got void
>> include/net/sock.h:2179:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2179:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2179:17: sparse:     got void
>> include/net/sock.h:2179:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2179:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2179:17: sparse:     got void
   net/core/sock.c:2582:9: sparse: sparse: context imbalance in 'sk_clone_lock' - different lock contexts for basic block
>> include/net/sock.h:2179:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2179:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2179:17: sparse:     got void
--
>> net/sched/act_api.c:65:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct tc_cookie *old @@     got void @@
   net/sched/act_api.c:65:13: sparse:     expected struct tc_cookie *old
   net/sched/act_api.c:65:13: sparse:     got void
   net/sched/act_api.c:380:17: sparse: sparse: context imbalance in '__tcf_action_put' - unexpected unlock

vim +2179 include/net/sock.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  2171  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2172  static inline void
^1da177e4c3f41 Linus Torvalds 2005-04-16  2173  sk_dst_set(struct sock *sk, struct dst_entry *dst)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2174  {
7f502361531e9e Eric Dumazet   2014-06-30  2175  	struct dst_entry *old_dst;
7f502361531e9e Eric Dumazet   2014-06-30  2176  
7f502361531e9e Eric Dumazet   2014-06-30  2177  	sk_tx_queue_clear(sk);
eb44ad4e635132 Eric Dumazet   2023-09-21  2178  	WRITE_ONCE(sk->sk_dst_pending_confirm, 0);
b4cb4a1391dcdc Eric Dumazet   2024-06-04 @2179  	old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
7f502361531e9e Eric Dumazet   2014-06-30  2180  	dst_release(old_dst);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2181  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2182  

:::::: The code at line 2179 was first introduced by commit
:::::: b4cb4a1391dcdc640c4ade003aaf0ee19cc8d509 net: use unrcu_pointer() helper

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
