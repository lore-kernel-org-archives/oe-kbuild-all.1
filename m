Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FEA3016EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352297; cv=none; b=TAh9hLfHIitQviaakTwHVNbjW6Xbxe9hhLvUOyl0vKfsQoNyUrhXluHlIDsiDFZU9xKE0ONiUkmqIgmzMLg4INwWvEhljR0eNCQmprEHBMJOz1CHIz4LhHyItO8zSb0n/hNGzlHd2zovfFLPh3+hfZWmdbD9BvIjmmZNkYiaeko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352297; c=relaxed/simple;
	bh=8VEiOmYfSa26wlU8+UbdBM6wlM5ITFlFuycGKVjvTxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qt3hKqLHM0Nj151LlNKIaSkAbj+4L8R2xDfehy9FZmxedFSTR31CB+kEP/ocjVJlWQVjHVTeDhvC5NrBwnr1k4SFO5vzhHIpZb6E34ucM9y9Dpq/zCO7hH9npurf9/RSSm+4A0nOmQrY/YSd6fV/TA3OW/umX2dWj24f2zjTxbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQBe8B8R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQBe8B8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760352284; x=1791888284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8VEiOmYfSa26wlU8+UbdBM6wlM5ITFlFuycGKVjvTxA=;
  b=eQBe8B8R3kUfXufJAODepLJeLV6fgSCetZuFVyUZBn0BtDIy60/uMdRM
   MO5T1ehaOc3jffQUdK6ZXe0OEA26bBINoEAxG0y5e8+JwoPtWwZuv1OaY
   NkGOcNmvS9EW5JCkmi+z7fVshcNY//6keBuZkj7DO0mHZJXtdKqlv7DB8
   0YtljjvTmEpl+QQZcdMTnDNToAAKR9u0m2SNUduFKO6Yo6b9eM3kpnhO1
   edzUmDTvIz815J/WNJ59p345X7GMbWPVwePMo/vlo6oSP/cYtdPK2Y68a
   wGngMH9MPaiEn8ax9oZtHC9D4FfXSem6oDQwXcg7qjvFJRONDr7ZGGJWg
   A==;
X-CSE-ConnectionGUID: 0sCpRVffQ7uJT4jfaH1roA==
X-CSE-MsgGUID: LHWxQXCQTSy27lOaxxxU6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62520068"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62520068"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 03:44:33 -0700
X-CSE-ConnectionGUID: qZOuYs5+TwGJ8VA/6FQIPA==
X-CSE-MsgGUID: a+gkEM5rTf62VyI+x+yOGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="205252810"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 03:44:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8G2X-0000Ml-2H;
	Mon, 13 Oct 2025 10:44:29 +0000
Date: Mon, 13 Oct 2025 18:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 565/565] fs/bcachefs/data/rebalance.c:368:2:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202510131803.9NpzN9E8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   c2566abb1266756014a8464808dcdf7def91fe31
commit: c2566abb1266756014a8464808dcdf7def91fe31 [565/565] bcachefs: bch2_bkey_get_io_opts() responsible for indirect extent opts
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251013/202510131803.9NpzN9E8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510131803.9NpzN9E8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510131803.9NpzN9E8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/rebalance.c:368:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     368 |         const struct bch_extent_rebalance *old = bch2_bkey_rebalance_opts(k);
         |         ^
   1 warning generated.


vim +368 fs/bcachefs/data/rebalance.c

   288	
   289	int bch2_bkey_get_io_opts(struct btree_trans *trans,
   290				  struct per_snapshot_io_opts *snapshot_opts, struct bkey_s_c k,
   291				  struct bch_inode_opts *opts)
   292	{
   293		struct bch_fs *c = trans->c;
   294	
   295		if (!snapshot_opts) {
   296			bch2_inode_opts_get(c, opts, bkey_is_btree_ptr(k.k));
   297	
   298			if (k.k->type == KEY_TYPE_reflink_v)
   299				goto indirect_extent_fixups;
   300	
   301			if (!bkey_is_btree_ptr(k.k) && k.k->type != KEY_TYPE_reflink_v) {
   302				struct bch_inode_unpacked inode;
   303				int ret = bch2_inode_find_by_inum_snapshot(trans, k.k->p.inode, k.k->p.snapshot,
   304									   &inode, BTREE_ITER_cached);
   305				if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   306					return ret;
   307				if (!ret)
   308					bch2_inode_opts_get_inode(c, &inode, opts);
   309			}
   310	
   311			return 0;
   312		}
   313	
   314		if (snapshot_opts->fs_io_opts.change_cookie != atomic_read(&c->opt_change_cookie)) {
   315			bch2_inode_opts_get(c, &snapshot_opts->fs_io_opts, bkey_is_btree_ptr(k.k));
   316	
   317			snapshot_opts->cur_inum = 0;
   318			snapshot_opts->d.nr = 0;
   319		}
   320	
   321		if (bkey_is_btree_ptr(k.k)) {
   322			*opts = snapshot_opts->fs_io_opts;
   323			return 0;
   324		}
   325	
   326		if (k.k->type == KEY_TYPE_reflink_v) {
   327			*opts = snapshot_opts->fs_io_opts;
   328			goto indirect_extent_fixups;
   329		}
   330	
   331		if (snapshot_opts->cur_inum != k.k->p.inode) {
   332			snapshot_opts->d.nr = 0;
   333	
   334			int ret = for_each_btree_key(trans, iter, BTREE_ID_inodes, POS(0, k.k->p.inode),
   335						     BTREE_ITER_all_snapshots, k, ({
   336				if (k.k->p.offset != k.k->p.inode)
   337					break;
   338	
   339				if (!bkey_is_inode(k.k))
   340					continue;
   341	
   342				struct bch_inode_unpacked inode;
   343				_ret3 = bch2_inode_unpack(k, &inode);
   344				if (_ret3)
   345					break;
   346	
   347				struct snapshot_io_opts_entry e = { .snapshot = k.k->p.snapshot };
   348				bch2_inode_opts_get_inode(c, &inode, &e.io_opts);
   349	
   350				darray_push(&snapshot_opts->d, e);
   351			}));
   352	
   353			snapshot_opts->cur_inum = k.k->p.inode;
   354	
   355			return ret ?: bch_err_throw(c, transaction_restart_nested);
   356		}
   357	
   358		if (k.k->p.snapshot)
   359			darray_for_each(snapshot_opts->d, i)
   360				if (bch2_snapshot_is_ancestor(c, k.k->p.snapshot, i->snapshot)) {
   361					*opts = i->io_opts;
   362					return 0;
   363				}
   364	
   365		*opts = snapshot_opts->fs_io_opts;
   366		return 0;
   367	indirect_extent_fixups:
 > 368		const struct bch_extent_rebalance *old = bch2_bkey_rebalance_opts(k);
   369		if (old) {
   370	#define x(_name)								\
   371		if (old->_name##_from_inode) {						\
   372			opts->_name			= old->_name;			\
   373			opts->_name##_from_inode	= old->_name##_from_inode;	\
   374		}
   375		BCH_REBALANCE_OPTS()
   376	#undef x
   377		}
   378	
   379		return 0;
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
