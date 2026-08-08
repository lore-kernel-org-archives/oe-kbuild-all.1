Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC2272816
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 00:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150747; cv=none; b=e5SinUIrfnUMoLoWKkdSg0H/k525xARdg9+QyQdJR8IQV0NLKx944O/R/2LTeh3Hu6o8I3ZLf0jo+aFEz9z6uvqRxZqeyzznWui6owkLrdpEk5nkxZwLUUeejEpCKKpOdJ1VeyvK/CJQXhUzBnzEc1gvGfT34s6tEu1xiZYwh+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150747; c=relaxed/simple;
	bh=qPDolAwavzdqBWqRryQZseh+/IHB3ws9y9RdiAptuyg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ChM69Voswc54FBKk+PfNf9CtDZduZ38b9sBRtCwPvFe9RydspPeuDMMhmJqh9ewqN/ZKU32/kj14gO5ajb9D2DAvNZC36OAWrtutakbAWjw2Mj9O3D+TP3tZFlAuB18yDDI4GO3BYhQpyPTBYd4jDyqQvjCKwds3NKN6u2nZxyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awsJxVCF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awsJxVCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786150746; x=1817686746;
  h=date:from:to:cc:subject:message-id;
  bh=qPDolAwavzdqBWqRryQZseh+/IHB3ws9y9RdiAptuyg=;
  b=awsJxVCF8fiJ6Cqzl10AlvyKlbCUt/CvyuUN9yemC67cZD2dNYWrps3p
   sIIeh8R3JwPUow+QQeNMUvjgnsCKjtFUiBabKUGtH0neiYioN1wYfAhE9
   mFz6rwXND15rY2QlFU7IkjhG7HjKbEbElww5LhWakXWHb7Byf4xxYVxsQ
   glQ+XPmMeA/VPvTUMivyk+falH6ZrcSOxQKA6o5enkOw1IVhrnlalUGJv
   1P1KAXZG0ufG9X4pl7amfrCGcoGFuQeaMPTQJfZnpdg6DwtGleLUH42HN
   XHRrQ0S/auVOySWGwpP6DDppHqw4BaCRfwvplqqg3tgoqPfK7amhk+Ikz
   Q==;
X-CSE-ConnectionGUID: SZTf2oU8RKmPs0uGdWwZVg==
X-CSE-MsgGUID: 2rXFxZMoTOK1QWx+eQuTjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86974776"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86974776"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 17:59:05 -0700
X-CSE-ConnectionGUID: OyDbzQ9NQ52zmD6oNC5rUw==
X-CSE-MsgGUID: wqDBsazmQKyA1n60hCIBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="300749994"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2026 17:59:03 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsVOv-00000000Jak-0ErL;
	Sat, 08 Aug 2026 00:59:01 +0000
Date: Sat, 08 Aug 2026 08:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [linux-next:master 7183/13846] kernel/hazptr.c:178: Warning:
 missing closing `"'
Message-ID: <202608080824.VRQz4FGl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 9d30872a4c09c2e8a97084ef1fe6913f6bf9e34d [7183/13846] hazptr: Implement Hazard Pointers
config: s390-randconfig-001-20260808 (https://download.01.org/0day-ci/archive/20260808/202608080824.VRQz4FGl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080824.VRQz4FGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080824.VRQz4FGl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/hazptr.c: Assembler messages:
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
>> kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:178: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'
   kernel/hazptr.c:183: Warning: missing closing `"'


vim +178 kernel/hazptr.c

   154	
   155	/*
   156	 * hazptr_synchronize: Wait until @addr is released from all slots.
   157	 *
   158	 * Wait to observe that each slot contains a value that differs from
   159	 * @addr before returning.
   160	 * Should be called from preemptible context.
   161	 */
   162	void hazptr_synchronize(void *addr)
   163	{
   164		int cpu;
   165	
   166		/*
   167		 * Busy-wait should only be done from preemptible context.
   168		 */
   169		lockdep_assert_preemption_enabled();
   170	
   171		/*
   172		 * Store A precedes hazptr_scan(): it unpublishes addr (sets it to
   173		 * NULL or to a different value), and thus hides it from hazard
   174		 * pointer readers.
   175		 */
   176		if (!addr)
   177			return;
 > 178		/* Memory ordering: Store A before Load B. */
   179		smp_mb();
   180		/* Scan all CPUs slots. */
   181		for_each_possible_cpu(cpu) {
   182			struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
   183			unsigned int scan_idx;
   184	
   185			/* Scan CPU slots. */
   186			hazptr_synchronize_cpu_slots(cpu, addr);
   187	
   188			/*
   189			 * Scan backup slots in percpu overflow lists.
   190			 * Forward progress is guaranteed by scanning one list
   191			 * while new elements are added into the other list.
   192			 */
   193			guard(mutex)(&overflow_list_flip->lock);
   194			scan_idx = overflow_list_flip->add_idx ^ 1;
   195			hazptr_synchronize_overflow_list(&overflow_list_flip->array[scan_idx], addr);
   196			/* Flip current list. */
   197			WRITE_ONCE(overflow_list_flip->add_idx, scan_idx);
   198			hazptr_synchronize_overflow_list(&overflow_list_flip->array[scan_idx ^ 1], addr);
   199		}
   200	}
   201	EXPORT_SYMBOL_GPL(hazptr_synchronize);
   202	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
