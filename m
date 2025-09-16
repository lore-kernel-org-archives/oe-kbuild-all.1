Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B9236CC9A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758037524; cv=none; b=LuYpY8lwUBmuYix6doTalE2J/aZ2+FmE88tPTH7Zu1lFR67NLTrWdb2Ylf8ZfAW0pLuIPfM9on778f+kLGNtbNMDqBAGQEUM2uD071tzLKqiuVVUL2vn3budgVqTTysZTsIfdm71uZ1/6vkN91NrsZvVvTWnW7w3/W0HI5TOieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758037524; c=relaxed/simple;
	bh=Fgc1EMC8XHPNW5I2w2HPFUAg2aiCA9tariEEyPSaK7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=paKOs+uR+giMA0g4vRPNNjpzDrn7ou47nCv4AdzyFYLGFEpz86pnbLFsi4fl+la1eDuVxBRCQfStMLlyHODM5VIwT03KB535lgY8YGMt+JPbhOkAd0Nbe5bFKuRJMfRi6eKAK2EUpLWb6UPfY8YzRQUs5LLYM0LV6Y80s3aL95c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOzyVTUC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOzyVTUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758037522; x=1789573522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fgc1EMC8XHPNW5I2w2HPFUAg2aiCA9tariEEyPSaK7g=;
  b=GOzyVTUCI5Y7rvE8ULhxSVpz4giaOIi93tWQridneGNupNnTKQfBCH5s
   K82eU39bKDcb8BdIjabPifu02rll1ZM0daX+8g47GBnimX1YY4LspqPph
   Z3hF7lh027pDIzvUa/K4cCXezICE9i86ETOtnhwi/WgJwcrepZq3GeuBh
   YEkeZKEVw0ehDl9XpwRNighFEZtx3s3TF7aG8zplKKbN/ynxHqZnKyfho
   HyKpSYCnya7Ol8x9Qsvk7seTrcXJzc2oVrF3nLeSUh+LbsLNml2MusCx9
   ibheB4DlgkySnjbSZlCQJnD5qnrt1NHmB/2yja1C9uQuCYZQo89t855jV
   A==;
X-CSE-ConnectionGUID: ndStiJQTTK+enLqs3q8U0g==
X-CSE-MsgGUID: AP2YzAFNTkeSpzCEp1qmBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70573772"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="70573772"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 08:45:19 -0700
X-CSE-ConnectionGUID: ueDoAJmKQ3qeBlJ4g0Htcw==
X-CSE-MsgGUID: kMkChY+eSkqAnyzsDkSG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="179355793"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2025 08:45:18 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyXro-0000QR-0r;
	Tue, 16 Sep 2025 15:45:16 +0000
Date: Tue, 16 Sep 2025 23:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 15/36] include/net/sock.h:2194:17: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202509162320.KsfZ1PgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   219a75ef543244c4335b6c050df8426ac8e15845
commit: 9e00ddc1babea4356b3974c1662127e1eba39f77 [15/36] rcu: Support Clang's capability analysis
config: x86_64-randconfig-122-20250916 (https://download.01.org/0day-ci/archive/20250916/202509162320.KsfZ1PgJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509162320.KsfZ1PgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509162320.KsfZ1PgJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/sock.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h, include/linux/errqueue.h):
>> include/net/sock.h:2194:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2194:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2194:17: sparse:     got void
>> include/net/sock.h:2194:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2194:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2194:17: sparse:     got void
>> include/net/sock.h:2194:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2194:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2194:17: sparse:     got void
>> include/net/sock.h:2194:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2194:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2194:17: sparse:     got void
   net/core/sock.c:2574:9: sparse: sparse: context imbalance in 'sk_clone_lock' - different lock contexts for basic block
>> include/net/sock.h:2194:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2194:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2194:17: sparse:     got void

vim +2194 include/net/sock.h

^1da177e4c3f415 Linus Torvalds 2005-04-16  2186  
^1da177e4c3f415 Linus Torvalds 2005-04-16  2187  static inline void
^1da177e4c3f415 Linus Torvalds 2005-04-16  2188  sk_dst_set(struct sock *sk, struct dst_entry *dst)
^1da177e4c3f415 Linus Torvalds 2005-04-16  2189  {
7f502361531e9ee Eric Dumazet   2014-06-30  2190  	struct dst_entry *old_dst;
7f502361531e9ee Eric Dumazet   2014-06-30  2191  
7f502361531e9ee Eric Dumazet   2014-06-30  2192  	sk_tx_queue_clear(sk);
eb44ad4e6351327 Eric Dumazet   2023-09-21  2193  	WRITE_ONCE(sk->sk_dst_pending_confirm, 0);
b4cb4a1391dcdc6 Eric Dumazet   2024-06-04 @2194  	old_dst = unrcu_pointer(xchg(&sk->sk_dst_cache, RCU_INITIALIZER(dst)));
7f502361531e9ee Eric Dumazet   2014-06-30  2195  	dst_release(old_dst);
^1da177e4c3f415 Linus Torvalds 2005-04-16  2196  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  2197  

:::::: The code at line 2194 was first introduced by commit
:::::: b4cb4a1391dcdc640c4ade003aaf0ee19cc8d509 net: use unrcu_pointer() helper

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
