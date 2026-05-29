Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0519B32B13A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 05:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034147; cv=none; b=dINxYGTlVcIL/b2i6ojCugh6248HMm8IRInPcayK/j/kqK2EobHzJ+Ys6tixpaYPXhiBMR8jVuQXAULdYDxAMi2mtUASnL2V8PSknaqIz72T6bKWD8HHW1wmX6DMG3lcN5ylb5dasByhKCaAJVMTWX5maGonlOGInOooTitE9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034147; c=relaxed/simple;
	bh=JK0LUCE0peVgGY8IO/ARXuwtHxegxsrHg0YpZIXyQFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L7pXYSGihTcafNlN+6Ql3PzA+oUo+nrczTSJt2KmgURhYHBoCMB1FWvNT7Z+1yet+caHiy+x3Vm7QZh1R0mVUz3lhBCXAoibMF4yOhAy+OLJC4h8lB+e0BOS6nfOqfKuBs8FdtQT3NsarvAu2MpKh5xtQPtr++cEi9B1Asm2B8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQtFMD/A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQtFMD/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780034146; x=1811570146;
  h=date:from:to:cc:subject:message-id;
  bh=JK0LUCE0peVgGY8IO/ARXuwtHxegxsrHg0YpZIXyQFA=;
  b=bQtFMD/Am4zQ+2LS5aGNX38w0suJEmI1DaeEeNGA07fRhtfAWXhqlFzX
   iL3uTiGk72I6kIcs4A7TgZyMs+DbtkrGwaMZkJA0qzNI+DEPZ+4JP9YqZ
   0VuyWgcHD+IlfMkw7G4JJhVODtI9aBFwCkkGm/NfW3dtQIFQURMWxEZtp
   CdASGcs1pOx/151cPAhUPUOCBW7eTqHsvMmoIEpl2OoFotAiPOfK3Rgk0
   CC5Qv60Nvg72nEACK8dc3UrMFXgqJu3PvJlfEdxB6Agkf9lb64B33l0R9
   JBYR7Gjq6Xy/V8vaB6jRkxR7MOWryxFvkwNfqsU8RMKQugYzzCdI41faA
   g==;
X-CSE-ConnectionGUID: WYgJWFVVTfWBEXpRl78lXQ==
X-CSE-MsgGUID: IKIRnUNLRJ2uCxrL597NGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80996011"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80996011"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 22:55:45 -0700
X-CSE-ConnectionGUID: bA5KttrAQuWQN4a6VpMJBQ==
X-CSE-MsgGUID: Mlps386ZT8mJxptYAnZEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="246767638"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2026 22:55:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSqC4-000000006oc-2DgV;
	Fri, 29 May 2026 05:55:40 +0000
Date: Fri, 29 May 2026 13:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8522/9137] mm/memcontrol-v1.c:651:31:
 error: implicit declaration of function 'swp_cluster_offset'
Message-ID: <202605291334.abNeADbG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
commit: 93680c2b51fa1f84fe50800b71140dbd283372b8 [8522/9137] mm/memcg, swap: store cgroup id in cluster table directly
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260529/202605291334.abNeADbG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291334.abNeADbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291334.abNeADbG-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol-v1.c: In function '__memcg1_swapout':
>> mm/memcontrol-v1.c:651:31: error: implicit declaration of function 'swp_cluster_offset' [-Wimplicit-function-declaration]
     651 |         __swap_cgroup_set(ci, swp_cluster_offset(folio->swap), nr_entries,
         |                               ^~~~~~~~~~~~~~~~~~


vim +/swp_cluster_offset +651 mm/memcontrol-v1.c

   606	
   607	/**
   608	 * __memcg1_swapout - transfer a memsw charge to swap
   609	 * @folio: folio whose memsw charge to transfer
   610	 * @ci: the locked swap cluster holding the swap entries
   611	 *
   612	 * Transfer the memsw charge of @folio to the swap entry stored in
   613	 * folio->swap.
   614	 *
   615	 * Context: folio must be isolated, unmapped, locked and is just about to
   616	 * be freed, and caller must disable IRQs and hold the swap cluster lock.
   617	 */
   618	void __memcg1_swapout(struct folio *folio, struct swap_cluster_info *ci)
   619	{
   620		struct mem_cgroup *memcg, *swap_memcg;
   621		struct obj_cgroup *objcg;
   622		unsigned int nr_entries;
   623	
   624		VM_WARN_ON_ONCE_FOLIO(!folio_test_swapcache(folio), folio);
   625		VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
   626		VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
   627		VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
   628	
   629		if (mem_cgroup_disabled())
   630			return;
   631	
   632		if (!do_memsw_account())
   633			return;
   634	
   635		objcg = folio_objcg(folio);
   636		VM_WARN_ON_ONCE_FOLIO(!objcg, folio);
   637		if (!objcg)
   638			return;
   639	
   640		rcu_read_lock();
   641		memcg = obj_cgroup_memcg(objcg);
   642		/*
   643		 * In case the memcg owning these pages has been offlined and doesn't
   644		 * have an ID allocated to it anymore, charge the closest online
   645		 * ancestor for the swap instead and transfer the memory+swap charge.
   646		 */
   647		nr_entries = folio_nr_pages(folio);
   648		swap_memcg = mem_cgroup_private_id_get_online(memcg, nr_entries);
   649		mod_memcg_state(swap_memcg, MEMCG_SWAP, nr_entries);
   650	
 > 651		__swap_cgroup_set(ci, swp_cluster_offset(folio->swap), nr_entries,
   652				  mem_cgroup_private_id(swap_memcg));
   653	
   654		folio_unqueue_deferred_split(folio);
   655		folio->memcg_data = 0;
   656	
   657		if (!obj_cgroup_is_root(objcg))
   658			page_counter_uncharge(&memcg->memory, nr_entries);
   659	
   660		if (memcg != swap_memcg) {
   661			if (!mem_cgroup_is_root(swap_memcg))
   662				page_counter_charge(&swap_memcg->memsw, nr_entries);
   663			page_counter_uncharge(&memcg->memsw, nr_entries);
   664		}
   665	
   666		/*
   667		 * The caller must hold the swap cluster lock with IRQ off. It is
   668		 * important here to have the interrupts disabled because it is the
   669		 * only synchronisation we have for updating the per-CPU variables.
   670		 */
   671		preempt_disable_nested();
   672		VM_WARN_ON_IRQS_ENABLED();
   673		memcg1_charge_statistics(memcg, -folio_nr_pages(folio));
   674		preempt_enable_nested();
   675		memcg1_check_events(memcg, folio_nid(folio));
   676	
   677		rcu_read_unlock();
   678		obj_cgroup_put(objcg);
   679	}
   680	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
