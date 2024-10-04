Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91482146A83
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728036916; cv=none; b=KUYYT2AW6nW6LPPFRIl8Ouh7eGjRvYq4y/48p/qB+1AjeSSrx6RHhSf1mFSC+uDvf3yXey3ykgxmE+6bpPrMf8BtWMKhmkV5xcj7yWvbWV/OEmm81JuDocnYaK27ZtCTSb/RyI1qVo1ytDp6QaQFWKDt6XLvkAQyz5dQ8r/AY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728036916; c=relaxed/simple;
	bh=/MdO53A1yQCMqyD1rX2Er6DuDSIzC6YtU4v5HanaLRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDzvbYsmadaaPFL9kQ1n938I38vZoysnBfkytZ6bewNU5Hkdq45jQVhedsQcHO1xnX0J4jtYLOojmpJp7/03UPMUgXUH27DwVfQ749DwpZJCg/B3cZbePMrY6GENROEYmRBzhRdvJS79VePycAbzWZX2kUILZGhoYV1RU1oyjWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxrUvB3o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxrUvB3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728036914; x=1759572914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/MdO53A1yQCMqyD1rX2Er6DuDSIzC6YtU4v5HanaLRk=;
  b=CxrUvB3oys3vmjnMvUdiwvwHOyvhnpnRL8s38eCMeWaXJbLabNM41p8o
   IkjlH1Tc4G1VOOl3+isydmrraPD1wXAipv87jtvj2jDTvYQvEU2jhGDlk
   46rSdWfDpmhW3cnxVEXluvpp56tBzL21IcvpFGyf9pR9EJfDG8rJCFmU0
   o8+8CEDuIgwy60VQAXxNKzE+2CGTReUwi/54gImuHrwpAMDfkLK7F1A0u
   fPvldiYK4/lPK0HcxlupVhlPeQyX54e3qcBX6X0u+xWGQjf6bteTVe0Je
   8WsmtT9ztYeru7X4aUuiutTn3J85ZOVVjQqn5SnVeoyvTzlElilEVqky/
   Q==;
X-CSE-ConnectionGUID: LX/tMPhVTB+io4/5TvNu4g==
X-CSE-MsgGUID: FwBvpeSGQ7aauU4Dxl6OkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="49784768"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="49784768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:15:14 -0700
X-CSE-ConnectionGUID: kD5wqDgURuKIgczO68Mc2w==
X-CSE-MsgGUID: QMOvAJkqQxWziiIcTpM0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79218973"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 03:15:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swfL3-0001SY-2U;
	Fri, 04 Oct 2024 10:15:09 +0000
Date: Fri, 4 Oct 2024 18:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] sched+mm: Use hazard pointers to track lazy
 active mm existence
Message-ID: <202410041810.3seDq730-lkp@intel.com>
References: <20241002010205.1341915-5-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002010205.1341915-5-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes akpm-mm/mm-everything linux/master linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/compiler-h-Introduce-ptr_eq-to-preserve-address-dependency/20241002-090631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241002010205.1341915-5-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH 4/4] sched+mm: Use hazard pointers to track lazy active mm existence
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20241004/202410041810.3seDq730-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041810.3seDq730-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041810.3seDq730-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:13:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:21:
   In file included from include/linux/sched/mm.h:12:
>> include/linux/hp.h:137:13: warning: variable 'slot' is uninitialized when used here [-Wuninitialized]
     137 |         ctx.slot = slot;
         |                    ^~~~
   include/linux/hp.h:110:22: note: initialize the variable 'slot' to silence this warning
     110 |         struct hp_slot *slot;
         |                             ^
         |                              = NULL
   1 warning generated.


vim +/slot +137 include/linux/hp.h

5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  101  
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  102  /*
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  103   * hp_dereference_allocate: Dereference and allocate a hazard pointer.
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  104   *
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  105   * Returns a hazard pointer context.
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  106   */
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  107  static inline
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  108  struct hp_ctx hp_dereference_allocate(struct hp_slot __percpu *percpu_slots, void * const * addr_p)
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  109  {
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  110  	struct hp_slot *slot;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  111  	void *addr, *addr2;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  112  	struct hp_ctx ctx;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  113  
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  114  	addr = READ_ONCE(*addr_p);
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  115  retry:
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  116  	ctx = hp_allocate(percpu_slots, addr);
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  117  	if (!hp_ctx_addr(ctx))
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  118  		goto fail;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  119  	/* Memory ordering: Store B before Load A. */
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  120  	smp_mb();
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  121  	/*
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  122  	 * Use RCU dereference without lockdep checks, because
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  123  	 * lockdep is not aware of HP guarantees.
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  124  	 */
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  125  	addr2 = rcu_access_pointer(*addr_p);	/* Load A */
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  126  	/*
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  127  	 * If @addr_p content has changed since the first load,
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  128  	 * clear the hazard pointer and try again.
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  129  	 */
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  130  	if (!ptr_eq(addr2, addr)) {
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  131  		WRITE_ONCE(slot->addr, NULL);
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  132  		if (!addr2)
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  133  			goto fail;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  134  		addr = addr2;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  135  		goto retry;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  136  	}
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01 @137  	ctx.slot = slot;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  138  	ctx.addr = addr2;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  139  	return ctx;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  140  
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  141  fail:
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  142  	ctx.slot = NULL;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  143  	ctx.addr = NULL;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  144  	return ctx;
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  145  }
5f42d8c10ae4b3 Mathieu Desnoyers 2024-10-01  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
