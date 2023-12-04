Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B52E40E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzmBirz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701707242; x=1733243242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnGdzpQHLo4mRfw78YYp6U/+SI3aHq2SX2XoZ0Za6pg=;
  b=RzmBirz3gUtgH26jRamoPFKMjl6C2SKbfIZNzMjHBP7L0c92L02sDoLZ
   Q16+z3u2y1pfK1F3KQr944yH9Xz694I6c5r7ptME2T5TYIG3pg7F3J+KR
   pbHMRzoLczc6g93O8N/YAaSBdUuBcCaBesXi6RJTSzbJjeUR98VHNrYpI
   RfSAiJbjwxRrK+SUpMk00yK1BKNWE+CwskoKiaOwMjzYH+HYvzYpIZjlL
   OFMLscDV4cSYyPbTes9004La1NI8z/Amxh6QAn8nOWHWmUkyZbX8WFfHT
   PPUmwkRH3sBPeCji6XUy1ztRglCCeEI831K9OVo36v4LYOxLFiGjW6QSf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12473895"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="12473895"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836637121"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="836637121"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 04 Dec 2023 08:27:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rABmu-0007uJ-0f;
	Mon, 04 Dec 2023 16:27:16 +0000
Date: Tue, 5 Dec 2023 00:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/snapshot.c:974:17: sparse: sparse: cast from restricted
 __le32
Message-ID: <202312050023.G2CGeL05-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 8e877caaad818595ecb6754355cea2058fd9848e bcachefs: Split out snapshot.c
date:   6 weeks ago
config: mips-randconfig-r132-20231115 (https://download.01.org/0day-ci/archive/20231205/202312050023.G2CGeL05-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312050023.G2CGeL05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312050023.G2CGeL05-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/snapshot.c:974:17: sparse: sparse: cast from restricted __le32

vim +974 fs/bcachefs/snapshot.c

   916	
   917	static int bch2_snapshot_node_delete(struct btree_trans *trans, u32 id)
   918	{
   919		struct bch_fs *c = trans->c;
   920		struct btree_iter iter, p_iter = (struct btree_iter) { NULL };
   921		struct btree_iter tree_iter = (struct btree_iter) { NULL };
   922		struct bkey_s_c_snapshot s;
   923		u32 parent_id;
   924		unsigned i;
   925		int ret = 0;
   926	
   927		s = bch2_bkey_get_iter_typed(trans, &iter, BTREE_ID_snapshots, POS(0, id),
   928					     BTREE_ITER_INTENT, snapshot);
   929		ret = bkey_err(s);
   930		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
   931					"missing snapshot %u", id);
   932	
   933		if (ret)
   934			goto err;
   935	
   936		BUG_ON(!BCH_SNAPSHOT_DELETED(s.v));
   937		parent_id = le32_to_cpu(s.v->parent);
   938	
   939		if (parent_id) {
   940			struct bkey_i_snapshot *parent;
   941	
   942			parent = bch2_bkey_get_mut_typed(trans, &p_iter,
   943					     BTREE_ID_snapshots, POS(0, parent_id),
   944					     0, snapshot);
   945			ret = PTR_ERR_OR_ZERO(parent);
   946			if (unlikely(ret)) {
   947				bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
   948							"missing snapshot %u", parent_id);
   949				goto err;
   950			}
   951	
   952			for (i = 0; i < 2; i++)
   953				if (le32_to_cpu(parent->v.children[i]) == id)
   954					break;
   955	
   956			if (i == 2)
   957				bch_err(c, "snapshot %u missing child pointer to %u",
   958					parent_id, id);
   959			else
   960				parent->v.children[i] = 0;
   961	
   962			if (le32_to_cpu(parent->v.children[0]) <
   963			    le32_to_cpu(parent->v.children[1]))
   964				swap(parent->v.children[0],
   965				     parent->v.children[1]);
   966		} else {
   967			/*
   968			 * We're deleting the root of a snapshot tree: update the
   969			 * snapshot_tree entry to point to the new root, or delete it if
   970			 * this is the last snapshot ID in this tree:
   971			 */
   972			struct bkey_i_snapshot_tree *s_t;
   973	
 > 974			BUG_ON(s.v->children[1]);
   975	
   976			s_t = bch2_bkey_get_mut_typed(trans, &tree_iter,
   977					BTREE_ID_snapshot_trees, POS(0, le32_to_cpu(s.v->tree)),
   978					0, snapshot_tree);
   979			ret = PTR_ERR_OR_ZERO(s_t);
   980			if (ret)
   981				goto err;
   982	
   983			if (s.v->children[0]) {
   984				s_t->v.root_snapshot = s.v->children[0];
   985			} else {
   986				s_t->k.type = KEY_TYPE_deleted;
   987				set_bkey_val_u64s(&s_t->k, 0);
   988			}
   989		}
   990	
   991		ret = bch2_btree_delete_at(trans, &iter, 0);
   992	err:
   993		bch2_trans_iter_exit(trans, &tree_iter);
   994		bch2_trans_iter_exit(trans, &p_iter);
   995		bch2_trans_iter_exit(trans, &iter);
   996		return ret;
   997	}
   998	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
