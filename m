Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F274D8C3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717965871; cv=none; b=sRLLP4F4Nmc9T8fXo+/ZK28o4cYbgur1FMc+u9s2ihbdc1WBwO4Odh/L0z2oq7qfPgHOxDO+R1Q9xNB6Wr/0K7FUF369LZU2O06gO3/WB5uzY9KdoU2ZpG3343/rYPT3aTD04WMyS34D2/aElx+L7ts3ARrJPOvL4KgBrO6D1oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717965871; c=relaxed/simple;
	bh=6FF6FYjJaFGev0csTCiBEi4J+LuRSP5G3gPbEcke/gE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0+GiuhMDKVLi+wHKZYzYIAKkYjL8y5V99SrnLsLH4kyJkAGQcCmn2AfDJKtqklX8zRIxklzjAiPHwR7+vdtUfB/uWiZgpLIxDpgj8FMlFrsaVeXz2xgGjomu/xauyWRv0g/iAiZBukdSJTCl3e7XXNqp1Rkkhy0xFYdf8sAaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItC/UFEi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItC/UFEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717965870; x=1749501870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6FF6FYjJaFGev0csTCiBEi4J+LuRSP5G3gPbEcke/gE=;
  b=ItC/UFEiuHEaaJTQGfdL804fwP6hU705cs6nm9UbKobJerM2ivHLhym6
   6mSgZGXTFW9XTpDJ9NtWLOvFnyNUIZLYwHqLkGN8xuaP+IRohGaYqbr/O
   WHlUI5727X/LrwD5JWRHBszC71Jq8P0noEzxfh3ABvFtknUGWqZB3aAkU
   IzZDwQ4AC3Hp0QHOiRTAyGBhbo2z7gOQFcOlqnbOLwTPU0boA+8aB7LbL
   /OTWm1g5SuRxJxD4gS28CCpCeVEKV+8Q+rq9RcG8y69Qz4xUq14YshDs8
   YY083aBwBQcDDUi5TEqfiZvBtJ5575ZxgZy0SBf64bbPpADFl29gsyuyK
   Q==;
X-CSE-ConnectionGUID: iHiHVl8MTo21nleVG2Q5aw==
X-CSE-MsgGUID: aTe24WGbStaPviJAi+Eajw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18478582"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="18478582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 13:44:29 -0700
X-CSE-ConnectionGUID: VqDvaDueS5amLEBKOEBVsw==
X-CSE-MsgGUID: SI+tlNKHQYS3ZCyJOGeUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="38866655"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jun 2024 13:44:28 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGPOs-0001Zy-09;
	Sun, 09 Jun 2024 20:44:26 +0000
Date: Mon, 10 Jun 2024 04:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 97/97] fs/bcachefs/btree_iter.c:3411:83:
 error: 'ck' undeclared; did you mean 'c'?
Message-ID: <202406100438.HAWNbcex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   e514088a9cf20c9729c12fb6cf92de291fb7cca6
commit: e514088a9cf20c9729c12fb6cf92de291fb7cca6 [97/97] debug per paul
config: i386-buildonly-randconfig-002-20240610 (https://download.01.org/0day-ci/archive/20240610/202406100438.HAWNbcex-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100438.HAWNbcex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100438.HAWNbcex-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:374,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:13,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/radix-tree.h:14,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:186,
                    from fs/bcachefs/btree_iter.c:3:
   fs/bcachefs/btree_iter.c: In function 'bch2_fs_btree_iter_exit':
>> fs/bcachefs/btree_iter.c:3411:83: error: 'ck' undeclared (first use in this function); did you mean 'c'?
    3411 |                 WARN_ON_ONCE(poll_state_synchronize_srcu(&c->btree_trans_barrier, ck->btree_trans_barrier_seq));
         |                                                                                   ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/bcachefs/btree_iter.c:3411:83: note: each undeclared identifier is reported only once for each function it appears in
    3411 |                 WARN_ON_ONCE(poll_state_synchronize_srcu(&c->btree_trans_barrier, ck->btree_trans_barrier_seq));
         |                                                                                   ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~


vim +3411 fs/bcachefs/btree_iter.c

  3376	
  3377	void bch2_fs_btree_iter_exit(struct bch_fs *c)
  3378	{
  3379		struct btree_transaction_stats *s;
  3380		struct btree_trans *trans;
  3381		int cpu;
  3382	
  3383		if (c->btree_trans_bufs)
  3384			for_each_possible_cpu(cpu) {
  3385				struct btree_trans *trans =
  3386					per_cpu_ptr(c->btree_trans_bufs, cpu)->trans;
  3387	
  3388				if (trans) {
  3389					closure_sync(&trans->ref);
  3390	
  3391					seqmutex_lock(&c->btree_trans_lock);
  3392					list_del(&trans->list);
  3393					seqmutex_unlock(&c->btree_trans_lock);
  3394				}
  3395				kfree(trans);
  3396			}
  3397		free_percpu(c->btree_trans_bufs);
  3398	
  3399		trans = list_first_entry_or_null(&c->btree_trans_list, struct btree_trans, list);
  3400		if (trans)
  3401			panic("%s leaked btree_trans\n", trans->fn);
  3402	
  3403		for (s = c->btree_transaction_stats;
  3404		     s < c->btree_transaction_stats + ARRAY_SIZE(c->btree_transaction_stats);
  3405		     s++) {
  3406			kfree(s->max_paths_text);
  3407			bch2_time_stats_exit(&s->lock_hold_times);
  3408		}
  3409	
  3410		if (c->btree_trans_barrier_initialized) {
> 3411			WARN_ON_ONCE(poll_state_synchronize_srcu(&c->btree_trans_barrier, ck->btree_trans_barrier_seq));
  3412			cleanup_srcu_struct(&c->btree_trans_barrier);
  3413		}
  3414		mempool_exit(&c->btree_trans_mem_pool);
  3415		mempool_exit(&c->btree_trans_pool);
  3416	}
  3417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
