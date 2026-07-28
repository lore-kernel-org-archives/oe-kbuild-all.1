Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004983E1681
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244775; cv=none; b=LVR1b7wSVdL6EvWWtDbLwninsK2WIrU5MiPAEHrbJuxSPEd4pMrun54UzHwr/9WW0L3g5L4ifjCdvZgGC3fxYRXMW5Hl8FEuUrFudjLcfpj3p5XpYkHzvODSv57LrtdG5ryIzl0Hon/5cHEifEWpJwRCE/cTCNoh9tBsj8VL0ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244775; c=relaxed/simple;
	bh=9cNoHzSxtBMOgbLDO949bZ1EZ8t8mBk7AIYL2oZDrjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EdjippA1zZSPgaH3YEJ+BeY6s/ZzC0rZ/G/POs+VTfCKtnEeaQY9G2UOgWUgMsORT/5D6IbuSORpg6VOBOMGtQzi54dNfc8Uf1llQDvvmJbGWMgonQE6+WCdGvtsSsly4N/CPeKSNDLA7vRISGr8M5ImDxRr6gn46/Xf+yMwIzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tej0NvBh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tej0NvBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785244774; x=1816780774;
  h=date:from:to:cc:subject:message-id;
  bh=9cNoHzSxtBMOgbLDO949bZ1EZ8t8mBk7AIYL2oZDrjc=;
  b=Tej0NvBhXe++Y7nwAD88V0aVW8RIMd1aD+mt5Iyx4aS+7hg+0Nfm+ZpX
   RmX1eh/JXy023BuePtPKl8ZT9IYsqORr85ywlChFIdhM1Sxdsbg3VuWwr
   3h9vvGEkPuUFujrZiIlcKoRCo/rEU+1eapqrCvvOE9So7iNHSru0yfOYO
   yMUje0fL+Ct3ZkByQYKTT6UXCn01jIijbGMT2lud+bE4gkEDchnz6y9N9
   a1CR/JbX3IcwlPGxaafVqv2Vi3IwTlWIQuQ8Er0TFLdxLJ9Xol5E5vdNI
   5hQNCAzYyVhwq0Gsz/NGGipWsT7tPaBx3sUodSP+kGRMCTfMBaaql58k2
   w==;
X-CSE-ConnectionGUID: vCs7AvPcQPerP48pTqPshQ==
X-CSE-MsgGUID: bSkYMTtxSxKXDhz0mRPQUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85701711"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85701711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 06:19:33 -0700
X-CSE-ConnectionGUID: TFEVbafAQnaVgobwY9kQwg==
X-CSE-MsgGUID: 1zQHLmNSTGmn+BnDpAJwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255779135"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jul 2026 06:19:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wohiT-00000000eMh-3BrW;
	Tue, 28 Jul 2026 13:19:29 +0000
Date: Tue, 28 Jul 2026 21:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5] kernel/sched/fair.c:715
 avg_vruntime() warn: inconsistent indenting
Message-ID: <202607282133.sO9vzXXt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   579215f16d4e5c3062e423a583897e83473e1435
commit: 1eb5dc8d1c44e2bf7b36a101c62dad962d673a8b [5/5] UPSTREAM: sched/fair: Fix zero_vruntime tracking
config: x86_64-randconfig-161-20260728 (https://download.01.org/0day-ci/archive/20260728/202607282133.sO9vzXXt-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282133.sO9vzXXt-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:715 avg_vruntime() warn: inconsistent indenting
kernel/sched/fair.c:697 update_zero_vruntime() warn: inconsistent indenting

vim +715 kernel/sched/fair.c

   689	
   690	static inline
   691	void update_zero_vruntime(struct cfs_rq *cfs_rq, s64 delta)
   692	{
   693		/*
   694		 * v' = v + d ==> avg_vruntime' = avg_vruntime - d*avg_load
   695		 */
   696		cfs_rq->avg_vruntime -= cfs_rq->avg_load * delta;
 > 697	       cfs_rq->zero_vruntime += delta;
   698	}
   699	
   700	/*
   701	 * Specifically: avg_vruntime() + 0 must result in entity_eligible() := true
   702	 * For this to be so, the result of this function must have a left bias.
   703	 *
   704	 * Called in:
   705	 *  - place_entity()      -- before enqueue
   706	 *  - update_entity_lag() -- before dequeue
   707	 *  - entity_tick()
   708	 *
   709	 * This means it is one entry 'behind' but that puts it close enough to where
   710	 * the bound on entity_key() is at most two lag bounds.
   711	 */
   712	u64 avg_vruntime(struct cfs_rq *cfs_rq)
   713	{
   714		struct sched_entity *curr = cfs_rq->curr;
 > 715	       long weight = cfs_rq->avg_load;
   716	       s64 delta = 0;
   717	
   718	       if (curr && !curr->on_rq)
   719	               curr = NULL;
   720	
   721	       if (weight) {
   722	               s64 runtime = cfs_rq->avg_vruntime;
   723	
   724	               if (curr) {
   725	                       unsigned long w = scale_load_down(curr->load.weight);
   726	
   727	                       runtime += entity_key(cfs_rq, curr) * w;
   728	                       weight += w;
   729	               }
   730	
   731			/* sign flips effective floor / ceiling */
   732	               if (runtime < 0)
   733	                       runtime -= (weight - 1);
   734	
   735	               delta = div_s64(runtime, weight);
   736	       } else if (curr) {
   737	               /*
   738	                * When there is but one element, it is the average.
   739	                */
   740	               delta = curr->vruntime - cfs_rq->zero_vruntime;
   741		}
   742	
   743	       update_zero_vruntime(cfs_rq, delta);
   744	
   745	       return cfs_rq->zero_vruntime;
   746	}
   747	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
