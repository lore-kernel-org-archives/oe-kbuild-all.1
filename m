Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606426CE09
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365275; cv=none; b=NbvX+I0CJSVGHABndub+HykcHd6F023mYRuZZCwkDO6XwDECIvSPKxSqy+NAkqIbqrqFJkfs4A9JFx/ZUTioYwm2W5kluMwibSgc6wWRQEoe7isrKkWP9ShDYJgdxykV5GCyxrthrwgARaQKjMOEuPO/kEmSLIyB6kTX9OHnP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365275; c=relaxed/simple;
	bh=R35f7QOLJDjj806zZBaQweKrqZ6H65v4upY/jQicw68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwetwjCHzCkWa62OF/wMPeI9H3vZFDKHFT6aVkuooVcYuf31trJBr78uW+SuZ3b3bHxlQMWPgmnozX7U0ZR5Eq+QnCzTvoxyE9Fse8nGThNIuQ8n5E9M4WPS9F8Uoar4XgdX8DswRkTMsiap+YbVjMXTAarkp/YWhEXCvj9E4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chPnYrIi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chPnYrIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751365273; x=1782901273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R35f7QOLJDjj806zZBaQweKrqZ6H65v4upY/jQicw68=;
  b=chPnYrIicHch3+KADxLs0HQA8ZC1ceAPUjk4nhvPSAxpc+wG+DihRsLx
   R3f/AuqXJj6EXZ3vqp/m+NEuWNzfm7D8d4rdqlyeKbBTfqogTqV2PCeBZ
   7WoQgUFgvqaRL7JxVgmoit6rfWqeh/5MheIx9q5yxF61gVXij0aSxbzEP
   NbNI+q55FDwp5dtBK6fF1egQ7gWXVUMK+x0xOkhiOirLohVpTe2tNqbJG
   8l6VQBAvHJvusvIb0k+7N1JCpZw1p6CPsJQBHgOIjWt2MZOUFIOPIyTG4
   5RL5Iot/CUTywb4yaFOANkHkTAd+AIfvtmTg3U2OIFVW4gYEhK0t0je2f
   Q==;
X-CSE-ConnectionGUID: R+dZvZJyQCGOn585JcTLqg==
X-CSE-MsgGUID: i2O7JOvrSxakU4aUKCNy3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="65071336"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="65071336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:21:12 -0700
X-CSE-ConnectionGUID: iKS5pJvGSiecpwyBtOIKRA==
X-CSE-MsgGUID: YRvEDkfTT8C2aA9+9hHU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="158283628"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2025 03:21:12 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWY6v-00003l-1v;
	Tue, 01 Jul 2025 10:21:09 +0000
Date: Tue, 1 Jul 2025 12:20:41 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 net/core/sock_reuseport.c:150: warning: Function parameter or member
 'bind_inany' not described in 'reuseport_add_sock'
Message-ID: <202507011220.5MWbk5GX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   890108d01fde2c3b6dde4d169b695ce64362f135
commit: 2dbb9b9e6df67d444fbe425c7f6014858d337adf [1605/1605] bpf: Introduce BPF_PROG_TYPE_SK_REUSEPORT
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250701/202507011220.5MWbk5GX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011220.5MWbk5GX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011220.5MWbk5GX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/sock_reuseport.c:150: warning: Function parameter or member 'bind_inany' not described in 'reuseport_add_sock'


vim +150 net/core/sock_reuseport.c

4db428a7c9ab07 Eric Dumazet     2018-02-02  142  
ef456144da8ef5 Craig Gallek     2016-01-04  143  /**
ef456144da8ef5 Craig Gallek     2016-01-04  144   *  reuseport_add_sock - Add a socket to the reuseport group of another.
ef456144da8ef5 Craig Gallek     2016-01-04  145   *  @sk:  New socket to add to the group.
ef456144da8ef5 Craig Gallek     2016-01-04  146   *  @sk2: Socket belonging to the existing reuseport group.
ef456144da8ef5 Craig Gallek     2016-01-04  147   *  May return ENOMEM and not add socket to group under memory pressure.
ef456144da8ef5 Craig Gallek     2016-01-04  148   */
2dbb9b9e6df67d Martin KaFai Lau 2018-08-08  149  int reuseport_add_sock(struct sock *sk, struct sock *sk2, bool bind_inany)
ef456144da8ef5 Craig Gallek     2016-01-04 @150  {
4db428a7c9ab07 Eric Dumazet     2018-02-02  151  	struct sock_reuseport *old_reuse, *reuse;
ef456144da8ef5 Craig Gallek     2016-01-04  152  
b4ace4f1ae0769 Craig Gallek     2016-01-19  153  	if (!rcu_access_pointer(sk2->sk_reuseport_cb)) {
2dbb9b9e6df67d Martin KaFai Lau 2018-08-08  154  		int err = reuseport_alloc(sk2, bind_inany);
b4ace4f1ae0769 Craig Gallek     2016-01-19  155  
b4ace4f1ae0769 Craig Gallek     2016-01-19  156  		if (err)
b4ace4f1ae0769 Craig Gallek     2016-01-19  157  			return err;
b4ace4f1ae0769 Craig Gallek     2016-01-19  158  	}
b4ace4f1ae0769 Craig Gallek     2016-01-19  159  
ef456144da8ef5 Craig Gallek     2016-01-04  160  	spin_lock_bh(&reuseport_lock);
ef456144da8ef5 Craig Gallek     2016-01-04  161  	reuse = rcu_dereference_protected(sk2->sk_reuseport_cb,
4db428a7c9ab07 Eric Dumazet     2018-02-02  162  					  lockdep_is_held(&reuseport_lock));
4db428a7c9ab07 Eric Dumazet     2018-02-02  163  	old_reuse = rcu_dereference_protected(sk->sk_reuseport_cb,
4db428a7c9ab07 Eric Dumazet     2018-02-02  164  					     lockdep_is_held(&reuseport_lock));
4db428a7c9ab07 Eric Dumazet     2018-02-02  165  	if (old_reuse && old_reuse->num_socks != 1) {
4db428a7c9ab07 Eric Dumazet     2018-02-02  166  		spin_unlock_bh(&reuseport_lock);
4db428a7c9ab07 Eric Dumazet     2018-02-02  167  		return -EBUSY;
4db428a7c9ab07 Eric Dumazet     2018-02-02  168  	}
ef456144da8ef5 Craig Gallek     2016-01-04  169  
ef456144da8ef5 Craig Gallek     2016-01-04  170  	if (reuse->num_socks == reuse->max_socks) {
ef456144da8ef5 Craig Gallek     2016-01-04  171  		reuse = reuseport_grow(reuse);
ef456144da8ef5 Craig Gallek     2016-01-04  172  		if (!reuse) {
ef456144da8ef5 Craig Gallek     2016-01-04  173  			spin_unlock_bh(&reuseport_lock);
ef456144da8ef5 Craig Gallek     2016-01-04  174  			return -ENOMEM;
ef456144da8ef5 Craig Gallek     2016-01-04  175  		}
ef456144da8ef5 Craig Gallek     2016-01-04  176  	}
ef456144da8ef5 Craig Gallek     2016-01-04  177  
ef456144da8ef5 Craig Gallek     2016-01-04  178  	reuse->socks[reuse->num_socks] = sk;
ef456144da8ef5 Craig Gallek     2016-01-04  179  	/* paired with smp_rmb() in reuseport_select_sock() */
ef456144da8ef5 Craig Gallek     2016-01-04  180  	smp_wmb();
ef456144da8ef5 Craig Gallek     2016-01-04  181  	reuse->num_socks++;
ef456144da8ef5 Craig Gallek     2016-01-04  182  	rcu_assign_pointer(sk->sk_reuseport_cb, reuse);
ef456144da8ef5 Craig Gallek     2016-01-04  183  
ef456144da8ef5 Craig Gallek     2016-01-04  184  	spin_unlock_bh(&reuseport_lock);
ef456144da8ef5 Craig Gallek     2016-01-04  185  
4db428a7c9ab07 Eric Dumazet     2018-02-02  186  	if (old_reuse)
4db428a7c9ab07 Eric Dumazet     2018-02-02  187  		call_rcu(&old_reuse->rcu, reuseport_free_rcu);
ef456144da8ef5 Craig Gallek     2016-01-04  188  	return 0;
ef456144da8ef5 Craig Gallek     2016-01-04  189  }
ef456144da8ef5 Craig Gallek     2016-01-04  190  

:::::: The code at line 150 was first introduced by commit
:::::: ef456144da8ef507c8cf504284b6042e9201a05c soreuseport: define reuseport groups

:::::: TO: Craig Gallek <kraig@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
