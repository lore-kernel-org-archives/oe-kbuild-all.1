Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4811581E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743107577; cv=none; b=VabXNUuwrUZyvYyV4wzOl1JYhOfBug+l98FOomcIzEAhCQkQ2reHWAFJH+CRdf0/8m3p9db/1SFIaqIulMJ8ITvw5crG+vyX+70ERuVD5K9gUnt1HkZlU+XBULuJhSnsKLK3FE5jQI/jLZe7DEX2kHmdU6ZGLSz5zUpuBzVnfXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743107577; c=relaxed/simple;
	bh=4bmaqiZMnKHPX1jvaV9L2nJXQrGRVvmwNwW33tWL1TU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNbvV4A1aN9dW54HgW/x7IZUO7p9vCEqYwl1mUiX0W3Fi4STFEJo/w4Yqdu0PQ1sY7gJACYTlV0DLMlxcsLDTXXQZZYG4ZTKpCETC5SqO7JB5sSF1TY5brihhndUbN/p4eADHdnhwYUvnuL9pXFzOWOk4MRqjNrTv8MdgWN9iqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBnrtDG5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBnrtDG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743107576; x=1774643576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bmaqiZMnKHPX1jvaV9L2nJXQrGRVvmwNwW33tWL1TU=;
  b=EBnrtDG5bU1a1MtJU4R8AMYQXyiQ01A07M0X+XJyxTNF5z+xhhZ2Fr0p
   ISgzED4XkAE71kelCPk/b66GHVkM3V5TfDxp2RM0EhulxfJEau0xkSCUs
   KEs5uYK0hQOG87Vvn2fOT9W1Lf5JskKx7Qov62dkrMoFsesF0VYpxtkFu
   A9uLZKXCgfBOWfckpNq05sfcu928dKanpVJWt8RpzMQ6nJsQa847nKwLF
   JVgoLPnAc4UnzIeHWbaQhZouPhqOqghAtuha2MmAwAVjRfVQ525zjUVAQ
   ZLm+0vT0W+CwdbHBQhp677BAOwxXwkM9Yow3407BaUJTc4LD8KK5az7nQ
   A==;
X-CSE-ConnectionGUID: mbGxYYMnRfKXh+76GQR+NQ==
X-CSE-MsgGUID: n8WvY21GQl63s3wBLGHY5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48243162"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="48243162"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 13:32:56 -0700
X-CSE-ConnectionGUID: C6xtVWWPQVWSAHSbotW0xA==
X-CSE-MsgGUID: p4/iEI5lQ0WmdHCESBn5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="156184546"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2025 13:32:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txtuG-0006ws-0q;
	Thu, 27 Mar 2025 20:32:52 +0000
Date: Fri, 28 Mar 2025 04:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 4/43]
 security/selinux/ss/services.c:2212:27: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202503280405.CIQjTiGW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   e2fa496070dcff2ef6cf58fedc273879de301d7e
commit: 262d77ae4bee830cb21123c7cbbc6c176c8707bc [4/43] selinux: dynamically allocate selinux namespace
config: csky-randconfig-r131-20250327 (https://download.01.org/0day-ci/archive/20250328/202503280405.CIQjTiGW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250328/202503280405.CIQjTiGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280405.CIQjTiGW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/selinux/ss/services.c:2212:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct policydb *p @@     got struct policydb [noderef] __rcu * @@
   security/selinux/ss/services.c:2212:27: sparse:     expected struct policydb *p
   security/selinux/ss/services.c:2212:27: sparse:     got struct policydb [noderef] __rcu *
>> security/selinux/ss/services.c:2214:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct selinux_policy [noderef] __rcu *policy @@
   security/selinux/ss/services.c:2214:15: sparse:     expected void const *objp
   security/selinux/ss/services.c:2214:15: sparse:     got struct selinux_policy [noderef] __rcu *policy
>> security/selinux/ss/services.c:2232:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct selinux_policy [noderef] __rcu *policy @@     got struct selinux_policy *policy @@
   security/selinux/ss/services.c:2232:39: sparse:     expected struct selinux_policy [noderef] __rcu *policy
   security/selinux/ss/services.c:2232:39: sparse:     got struct selinux_policy *policy
>> security/selinux/ss/services.c:2297:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct selinux_policy [noderef] __rcu *policy @@     got struct selinux_policy *[assigned] oldpolicy @@
   security/selinux/ss/services.c:2297:29: sparse:     expected struct selinux_policy [noderef] __rcu *policy
   security/selinux/ss/services.c:2297:29: sparse:     got struct selinux_policy *[assigned] oldpolicy
>> security/selinux/ss/services.c:2210:24: sparse: sparse: dereference of noderef expression
   security/selinux/ss/services.c:2211:15: sparse: sparse: dereference of noderef expression
   security/selinux/ss/services.c:2213:15: sparse: sparse: dereference of noderef expression

vim +2212 security/selinux/ss/services.c

3bb56b25dbe0a4 Paul Moore      2008-01-29  2201  
1b8b31a2e6120b Stephen Smalley 2020-08-19  2202  static int security_preserve_bools(struct selinux_policy *oldpolicy,
1b8b31a2e6120b Stephen Smalley 2020-08-19  2203  				struct selinux_policy *newpolicy);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2204  
262d77ae4bee83 Stephen Smalley 2020-08-21  2205  void selinux_policy_free(struct selinux_policy __rcu *policy)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2206  {
461698026ffa74 Stephen Smalley 2020-08-07  2207  	if (!policy)
461698026ffa74 Stephen Smalley 2020-08-07  2208  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2209  
c7c556f1e81bb9 Stephen Smalley 2020-08-11 @2210  	sidtab_destroy(policy->sidtab);
461698026ffa74 Stephen Smalley 2020-08-07  2211  	kfree(policy->map.mapping);
0256b0aa8019d9 Dan Carpenter   2020-08-26 @2212  	policydb_destroy(&policy->policydb);
0256b0aa8019d9 Dan Carpenter   2020-08-26  2213  	kfree(policy->sidtab);
461698026ffa74 Stephen Smalley 2020-08-07 @2214  	kfree(policy);
461698026ffa74 Stephen Smalley 2020-08-07  2215  }
24ed7fdae669fe Ondrej Mosnacek 2018-11-30  2216  
1b8b31a2e6120b Stephen Smalley 2020-08-19  2217  static void selinux_policy_cond_free(struct selinux_policy *policy)
1b8b31a2e6120b Stephen Smalley 2020-08-19  2218  {
1b8b31a2e6120b Stephen Smalley 2020-08-19  2219  	cond_policydb_destroy_dup(&policy->policydb);
1b8b31a2e6120b Stephen Smalley 2020-08-19  2220  	kfree(policy);
1b8b31a2e6120b Stephen Smalley 2020-08-19  2221  }
1b8b31a2e6120b Stephen Smalley 2020-08-19  2222  
db42f318d66d66 Stephen Smalley 2024-07-30  2223  void selinux_policy_cancel(struct selinux_state *state,
db42f318d66d66 Stephen Smalley 2024-07-30  2224  			   struct selinux_load_state *load_state)
02a52c5c8c3b8c Stephen Smalley 2020-08-07  2225  {
1b8b31a2e6120b Stephen Smalley 2020-08-19  2226  	struct selinux_policy *oldpolicy;
1b8b31a2e6120b Stephen Smalley 2020-08-19  2227  
9ff9abc4c6be27 Stephen Smalley 2020-08-26  2228  	oldpolicy = rcu_dereference_protected(state->policy,
9ff9abc4c6be27 Stephen Smalley 2020-08-26  2229  					lockdep_is_held(&state->policy_mutex));
1b8b31a2e6120b Stephen Smalley 2020-08-19  2230  
1b8b31a2e6120b Stephen Smalley 2020-08-19  2231  	sidtab_cancel_convert(oldpolicy->sidtab);
6406887a12ee5d Ondrej Mosnacek 2021-03-18 @2232  	selinux_policy_free(load_state->policy);
6406887a12ee5d Ondrej Mosnacek 2021-03-18  2233  	kfree(load_state->convert_data);
02a52c5c8c3b8c Stephen Smalley 2020-08-07  2234  }
02a52c5c8c3b8c Stephen Smalley 2020-08-07  2235  
db42f318d66d66 Stephen Smalley 2024-07-30  2236  static void selinux_notify_policy_change(struct selinux_state *state,
db42f318d66d66 Stephen Smalley 2024-07-30  2237  					u32 seqno)
c7c556f1e81bb9 Stephen Smalley 2020-08-11  2238  {
c7c556f1e81bb9 Stephen Smalley 2020-08-11  2239  	/* Flush external caches and notify userspace of policy load */
db42f318d66d66 Stephen Smalley 2024-07-30  2240  	avc_ss_reset(state->avc, seqno);
c7c556f1e81bb9 Stephen Smalley 2020-08-11  2241  	selnl_notify_policyload(seqno);
db42f318d66d66 Stephen Smalley 2024-07-30  2242  	selinux_status_update_policyload(state, seqno);
c7c556f1e81bb9 Stephen Smalley 2020-08-11  2243  	selinux_netlbl_cache_invalidate();
c7c556f1e81bb9 Stephen Smalley 2020-08-11  2244  	selinux_xfrm_notify_policyload();
db42f318d66d66 Stephen Smalley 2024-07-30  2245  	selinux_ima_measure_state_locked(state);
c7c556f1e81bb9 Stephen Smalley 2020-08-11  2246  }
c7c556f1e81bb9 Stephen Smalley 2020-08-11  2247  
db42f318d66d66 Stephen Smalley 2024-07-30  2248  void selinux_policy_commit(struct selinux_state *state,
db42f318d66d66 Stephen Smalley 2024-07-30  2249  			   struct selinux_load_state *load_state)
461698026ffa74 Stephen Smalley 2020-08-07  2250  {
6406887a12ee5d Ondrej Mosnacek 2021-03-18  2251  	struct selinux_policy *oldpolicy, *newpolicy = load_state->policy;
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  2252  	unsigned long flags;
461698026ffa74 Stephen Smalley 2020-08-07  2253  	u32 seqno;
aa8e712cee93d5 Stephen Smalley 2018-03-01  2254  
9ff9abc4c6be27 Stephen Smalley 2020-08-26  2255  	oldpolicy = rcu_dereference_protected(state->policy,
9ff9abc4c6be27 Stephen Smalley 2020-08-26  2256  					lockdep_is_held(&state->policy_mutex));
a2000050389550 Eric Paris      2010-04-20  2257  
461698026ffa74 Stephen Smalley 2020-08-07  2258  	/* If switching between different policy types, log MLS status */
461698026ffa74 Stephen Smalley 2020-08-07  2259  	if (oldpolicy) {
461698026ffa74 Stephen Smalley 2020-08-07  2260  		if (oldpolicy->policydb.mls_enabled && !newpolicy->policydb.mls_enabled)
461698026ffa74 Stephen Smalley 2020-08-07  2261  			pr_info("SELinux: Disabling MLS support...\n");
461698026ffa74 Stephen Smalley 2020-08-07  2262  		else if (!oldpolicy->policydb.mls_enabled && newpolicy->policydb.mls_enabled)
461698026ffa74 Stephen Smalley 2020-08-07  2263  			pr_info("SELinux: Enabling MLS support...\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  2264  	}
a2000050389550 Eric Paris      2010-04-20  2265  
1b8b31a2e6120b Stephen Smalley 2020-08-19  2266  	/* Set latest granting seqno for new policy. */
1b8b31a2e6120b Stephen Smalley 2020-08-19  2267  	if (oldpolicy)
1b8b31a2e6120b Stephen Smalley 2020-08-19  2268  		newpolicy->latest_granting = oldpolicy->latest_granting + 1;
1b8b31a2e6120b Stephen Smalley 2020-08-19  2269  	else
1b8b31a2e6120b Stephen Smalley 2020-08-19  2270  		newpolicy->latest_granting = 1;
1b8b31a2e6120b Stephen Smalley 2020-08-19  2271  	seqno = newpolicy->latest_granting;
1b8b31a2e6120b Stephen Smalley 2020-08-19  2272  
461698026ffa74 Stephen Smalley 2020-08-07  2273  	/* Install the new policy. */
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  2274  	if (oldpolicy) {
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  2275  		sidtab_freeze_begin(oldpolicy->sidtab, &flags);
1b8b31a2e6120b Stephen Smalley 2020-08-19  2276  		rcu_assign_pointer(state->policy, newpolicy);
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  2277  		sidtab_freeze_end(oldpolicy->sidtab, &flags);
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  2278  	} else {
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  2279  		rcu_assign_pointer(state->policy, newpolicy);
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  2280  	}
a2000050389550 Eric Paris      2010-04-20  2281  
461698026ffa74 Stephen Smalley 2020-08-07  2282  	/* Load the policycaps from the new policy */
db42f318d66d66 Stephen Smalley 2024-07-30  2283  	security_load_policycaps(state, newpolicy);
461698026ffa74 Stephen Smalley 2020-08-07  2284  
db42f318d66d66 Stephen Smalley 2024-07-30  2285  	if (!selinux_initialized(state)) {
461698026ffa74 Stephen Smalley 2020-08-07  2286  		/*
461698026ffa74 Stephen Smalley 2020-08-07  2287  		 * After first policy load, the security server is
461698026ffa74 Stephen Smalley 2020-08-07  2288  		 * marked as initialized and ready to handle requests and
461698026ffa74 Stephen Smalley 2020-08-07  2289  		 * any objects created prior to policy load are then labeled.
461698026ffa74 Stephen Smalley 2020-08-07  2290  		 */
db42f318d66d66 Stephen Smalley 2024-07-30  2291  		selinux_mark_initialized(state);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2292  		selinux_complete_init();
461698026ffa74 Stephen Smalley 2020-08-07  2293  	}
461698026ffa74 Stephen Smalley 2020-08-07  2294  
461698026ffa74 Stephen Smalley 2020-08-07  2295  	/* Free the old policy */
1b8b31a2e6120b Stephen Smalley 2020-08-19  2296  	synchronize_rcu();
461698026ffa74 Stephen Smalley 2020-08-07 @2297  	selinux_policy_free(oldpolicy);
6406887a12ee5d Ondrej Mosnacek 2021-03-18  2298  	kfree(load_state->convert_data);
461698026ffa74 Stephen Smalley 2020-08-07  2299  
c7c556f1e81bb9 Stephen Smalley 2020-08-11  2300  	/* Notify others of the policy change */
db42f318d66d66 Stephen Smalley 2024-07-30  2301  	selinux_notify_policy_change(state, seqno);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2302  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2303  

:::::: The code at line 2212 was first introduced by commit
:::::: 0256b0aa8019d937a0bdce3584c6b8b47f618202 selinux: fix error handling bugs in security_load_policy()

:::::: TO: Dan Carpenter <dan.carpenter@oracle.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
