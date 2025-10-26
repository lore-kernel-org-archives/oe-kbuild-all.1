Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83F37263E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761503182; cv=none; b=kgde5GYqdmy1MRj/g3Cb/s3gHgtrmCfA7OYFjSIqZqlc7uUAPrMK4+JCFTr/8icszsTS8Lp7bG93Lr0ubufaCC5hU5nfDL8X+fp4DYVJXDcpl4tS6MQ+NfCiwhm1TQoOIaaLZ+mGyXD6fBth1bNT61XwilbULVUxA3sMZL9HeEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761503182; c=relaxed/simple;
	bh=Byjq6dRoZxVyFQUO6dqhUrJYRKLbmWI00bn9Ywm1q9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNKdu2htSZzCzrbbiSvlGHyj8v1Bfa1FKsz7iD1EbPN5b+VEtKi5Pno6WpuxGBwwPxPaTTHe2ayWUF8OoUifyQLKGLEN4Mk94z0P9Pz/gjmiaxX6PRESgByH7eyfkZBnSRtgw6cVGCPRPSWXd8OLRibCL3e4XK/y9a+fK2vHv+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3JRoXLI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3JRoXLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761503181; x=1793039181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Byjq6dRoZxVyFQUO6dqhUrJYRKLbmWI00bn9Ywm1q9c=;
  b=R3JRoXLIhrksU7sA9Z/FGSf/YoHnRUKdWnOkrbvTfQdRQqzj/1aR2gde
   BAgXeSUsjO5U4bkAg+eR8LH9TFyo9wKaXRaAjSz6/XltUF26aHpRBtExl
   QW7OzIYkF/X2GVCQKG0H3iphKvI9rVcWrl/aADyoqTxOMG5kdCH3MXgRU
   jM5GYX8jhFwihWsJ/lfnvqOmWfn4Ra0UKI0llUS+MzLC2Di4AgIMLqL7K
   fMzAiGHago9IaErJwx+l+IsiJXG2Zl6ZoE9rmrulwUWuuHkdu+ZfACIia
   AXTyG6hD8uSzZJ5QYEjd4U/NJFh2C99eR0HLb50hvLZUy32EWYP2n5TLe
   A==;
X-CSE-ConnectionGUID: U7h9Zk68R7ORr5Eu/T2TWQ==
X-CSE-MsgGUID: HtVFlqLVRSuQMmRujHyQLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74714853"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="74714853"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 11:26:21 -0700
X-CSE-ConnectionGUID: yayXyHcvQEetPNPcBlnfzg==
X-CSE-MsgGUID: XRfmqVWkRgawL+LRw0dsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="190086061"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2025 11:26:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD5RY-000GIH-2q;
	Sun, 26 Oct 2025 18:26:16 +0000
Date: Mon, 27 Oct 2025 02:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 458/668]
 fs/bcachefs/btree/commit.c:343:32-33: Unneeded semicolon
Message-ID: <202510270204.NKjYauNO-lkp@intel.com>
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
head:   b552eb12225133c8bf869b461faba6b72e35d2be
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/668] bcachefs: move btree files to subdir
config: parisc-randconfig-r062-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270204.NKjYauNO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270204.NKjYauNO-lkp@intel.com/

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
