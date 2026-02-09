Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A603E2D9EED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668280; cv=none; b=sWX4KcEqIuU7P5inMIY+bgT0gepmpr/agBsZboCDqy/ZBL1O/9W3vMvBgR94YZZHTFRKK7d9TR5bDG+wdpNmLMysWsiR3dW/gh2zs7uo6xsIJJv76xyDLdCzviY0kLvU4fzEdnoBb7BovS3m71dJlH2FApXWbYiAhejdpkXVV3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668280; c=relaxed/simple;
	bh=WjJ/qwt7BaBU9RM2/H+7/nzjcfuGUWAKdst43xOC/qU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tu54TVJigpNfrAPYbX09IEF22MWlcdVp2RSizIGOou5fGyW9Y60hZb/FsQ9Dm6I1dePYI4SP9nfu4PXctNM8evxQRSegiutAz+WbXiDMz8NDXrkSwftZlYty6ZkqJeNp/vbtSVbYhxdVIr/a2qJDOz2zt+pY9Hm6o6fdwRQBOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAfFaSbC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAfFaSbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770668278; x=1802204278;
  h=date:from:to:cc:subject:message-id;
  bh=WjJ/qwt7BaBU9RM2/H+7/nzjcfuGUWAKdst43xOC/qU=;
  b=BAfFaSbCkXk+YGjWq54J37/peVCimjjnTXZ7RZ1ys02xDUBfi0Z92tzT
   cDrIG014IJI4o94chfu60PdQToNOriHNC7io6tqhBJrg5mwhUxyDarxOo
   CS2gaqDqcQsNCDyIGdfYVHqL0dBJi+DEoOyOBb9D3GrN2Nj5cyG5gOU9H
   MIuaMOQYhaVsaoLjPkPbUYv5F+9YUmrXzagVXW/CYG8+TQu342ugUCg6i
   yR2i0MGSPx2cJLg47BLL1qR3u09t/XpgHp1oXKuFcC7sm82j3rerEkxUE
   5qALjcXIrsPAlJ2kwA27HVO+6C1IjIo4xMRyX3F/2Nqu0L52KLzSs9X2F
   w==;
X-CSE-ConnectionGUID: DDt+x5n9T+SvKtMlp5Vw8g==
X-CSE-MsgGUID: yrkEIZIjS6+akgB2YUc7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89373401"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="89373401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 12:17:58 -0800
X-CSE-ConnectionGUID: ufCvp/3RQgCnBpDiPFMvvQ==
X-CSE-MsgGUID: AOSaUWknT3aWmJtqH0LqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211514290"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Feb 2026 12:17:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpXhi-00000000oIU-0y5b;
	Mon, 09 Feb 2026 20:17:54 +0000
Date: Tue, 10 Feb 2026 04:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 458/799]
 fs/bcachefs/btree/commit.c:343:32-33: Unneeded semicolon
Message-ID: <202602100459.1kICyT8u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/799] bcachefs: move btree files to subdir
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100459.1kICyT8u-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100459.1kICyT8u-lkp@intel.com/

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
