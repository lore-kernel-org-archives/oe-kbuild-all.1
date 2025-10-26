Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B1F2D8393
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761482024; cv=none; b=MLSBKVn59ALfG7FEM6T1FsdgDaSqLk3F3o+QnXUpkWbaS+PRF1pvfmMRn6qqBhTf8g2ZK5aYzjZ2QyiPUt0usjQLpjs5tcPh2nRI9ynzuzwoYzMAwCIa4O3N+SFOfueumPILDu8MNYIQ7VS43kCbAe8RA2McaZQwYjN6QLR8Alc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761482024; c=relaxed/simple;
	bh=9BQt/XK9Z4G7Ocgxewaac7FeOLJRWAi2zhEcqCF0Pb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ceKLtFUr6n6d6dVyZoj2gIvcnqcu1tN0Dnzgf2yAX5HB+WBuHJb1DFaziPF5tGupJmhZJEiwmt2kMzstU2Lci9JKvTpnCieoaMOPDUTInQw02wCKNduYRUQ60tl6WdiDlb1GvFm4uHOKrXs5E/9izoSaCfpPkVj/Jpq3ezlLOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5DtBICT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5DtBICT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761482021; x=1793018021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9BQt/XK9Z4G7Ocgxewaac7FeOLJRWAi2zhEcqCF0Pb8=;
  b=N5DtBICTFvC4pH+ar7+8E2NNDtJyYpuXZWsqPIDGr1I/ko0q8cmH1ITx
   0wn4Pyz1EdFyzmONvmzXYiZFYJwgNMlv99UNtHJ+jOSFUArLWzP3wYB0Y
   X9lCY23+aKQB3Efklj9CSjNd02faNe71gLnfV9fP4Qf7IutB89HyqBbWs
   avm9m4LEjuc3v0lodreI8zhJ9E7nV4mHcOpKjNvEY7eHogxNkMQiTlUqw
   yLL7212+kE/8uXXmFDzBtis7EGI7msbOY4qw+1I3vTG+pCvcADLECLslA
   +kYJTyQkX41GIHMqdJOK+yh+dKDRM91kDur6IMLtZH81DrqVK9Ry+b5Q7
   A==;
X-CSE-ConnectionGUID: 7XUvlE4vSU6s9lYO/79PDA==
X-CSE-MsgGUID: IoAJMx99Q5eJ8Z58BOwehg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74187462"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="74187462"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 05:33:39 -0700
X-CSE-ConnectionGUID: FGVXHtn6QEW0o92tvLR/Wg==
X-CSE-MsgGUID: euVAvayVQOanNTeZM4d9iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184898820"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2025 05:33:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCzwG-000G6n-1i;
	Sun, 26 Oct 2025 12:33:36 +0000
Date: Sun, 26 Oct 2025 20:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 458/672]
 fs/bcachefs/btree/commit.c:343:32-33: Unneeded semicolon
Message-ID: <202510262023.DFG8DRdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs master
head:   232d5200c70baf66e106b70f6f54f6c234c2be46
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/672] bcachefs: move btree files to subdir
config: parisc-randconfig-r062-20251026 (https://download.01.org/0day-ci/archive/20251026/202510262023.DFG8DRdF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510262023.DFG8DRdF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/commit.c:343:32-33: Unneeded semicolon

vim +343 fs/bcachefs/btree/commit.c

1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  333  
1a470560c9ab8d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-03-18  334  static inline void btree_insert_entry_checks(struct btree_trans *trans,
6333bd2f133459 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-02-20  335  					     struct btree_insert_entry *i)
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  336  {
7f9821a7c10bca fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  337  	struct btree_path *path = trans->paths + i->path;
7f9821a7c10bca fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  338  
7f9821a7c10bca fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  339  	BUG_ON(!bpos_eq(i->k->k.p, path->pos));
7f9821a7c10bca fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  340  	BUG_ON(i->cached	!= path->cached);
54582f52ed7a63 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-06-24  341  	BUG_ON(i->cached &&
54582f52ed7a63 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-06-24  342  	       !i->key_cache_already_flushed  &&
54582f52ed7a63 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-06-24 @343  	       bkey_deleted(&i->k->k));;
7f9821a7c10bca fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  344  	BUG_ON(i->level		!= path->level);
7f9821a7c10bca fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-12-10  345  	BUG_ON(i->btree_id	!= path->btree_id);
65bc7688b8feb5 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-02-11  346  	BUG_ON(i->bkey_type	!= __btree_node_type(path->level, path->btree_id));
14b393ee768e83 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-03-16  347  	EBUG_ON(!i->level &&
d3c7727bb9269c fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-03  348  		btree_type_has_snapshots(i->btree_id) &&
5dd8c60e1e0448 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2024-04-07  349  		!(i->flags & BTREE_UPDATE_internal_snapshot_node) &&
b895c70326aa43 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2024-04-30  350  		test_bit(JOURNAL_replay_done, &trans->c->journal.flags) &&
14b393ee768e83 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-03-16  351  		i->k->k.p.snapshot &&
ec9cc18fc2e65b fs/bcachefs/btree_trans_commit.c Kent Overstreet 2024-03-22  352  		bch2_snapshot_is_internal_node(trans->c, i->k->k.p.snapshot) > 0);
9623ab27ab27e2 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-03-15  353  }
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  354  

:::::: The code at line 343 was first introduced by commit
:::::: 54582f52ed7a63a557308bd0a3efd0f5fc5443c6 bcachefs: Evict/bypass key cache when deleting

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
