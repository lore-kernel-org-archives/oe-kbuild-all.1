Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5A63CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766438744; cv=none; b=UX92ijNEZD5pqy4PFxPY5lrJgVWEywut6IGeA5T5qkepK4BzwUekhMb89FASltqrF5ZDXyycQ0qz04G0d9MuOFysXjn25IY77QEo/rcKg6pi66wrAVDkDRgy3Db+T3LztnuTfESNJFb+3eABOisJ71l9xamFGqgcm0K8mIZOQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766438744; c=relaxed/simple;
	bh=EhR9MAkzkuVzBkRSKAo9bkcGNeOrCUlCVNqaI1N1kSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SZhq5LPCP/WS11K4dugb5Yso2bpUMDP1YK8GId6rwNcJRz8lZGl4UY7HSobjPC8ZPIw1xqbviCvlBA2MdD9dxAI8/HdkMt0olRM4mbyO+7J5Q2bGErZSE7/PNFAuZMZe4Fq1oW08lWsPVkCVP6ImOz5xT/HRAXIVu+wRsM0jiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8WMTThY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8WMTThY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766438743; x=1797974743;
  h=date:from:to:cc:subject:message-id;
  bh=EhR9MAkzkuVzBkRSKAo9bkcGNeOrCUlCVNqaI1N1kSc=;
  b=d8WMTThYzj2110WFveOntHdGcTnqDtayrzwhjJo5IZVIu2L4RO3Dbu+p
   eBHwf1JIhsD9SyzOpvj+SGB8R6mO+GT7k+XEC4io1Ob+CjWYxrUV+Npoz
   JIBqQ5+0G88c7Adapwq+FJiP48SLsMo5RLskzQVhC0DbgHw4ec1iqIcDz
   qiL5v63Ho4Gbv+JhHWGHDyn8RGiLVG1dC7oQK5Ql5Xfx1NcFPe9C+ZNIp
   XDG/YVepDTZ60+Z9Vq8K1eL7Ys4CoVfrxNLibWckJth9PyMsKZwMMcKPR
   86BPmVS5XfAFUKvGnGlvBUYMwaIaxgCloutxAp2MjMuUIFy26FVT06Gs8
   Q==;
X-CSE-ConnectionGUID: 6Zfjy7GLR66SbG5rrd+mSg==
X-CSE-MsgGUID: hLz8ZN6PRqSzG9l1XAV7/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79659540"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79659540"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:25:42 -0800
X-CSE-ConnectionGUID: BkznjaMqTaCbwYuCjpbonw==
X-CSE-MsgGUID: c/eyyZj0TZKeG/DhxzsYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198852464"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 13:25:33 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnOZ-0000000018N-0deo;
	Mon, 22 Dec 2025 21:24:55 +0000
Date: Tue, 23 Dec 2025 05:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 473/799]
 fs/bcachefs/fs/check_dir_structure.c:303:1: warning: the frame size of 1520
 bytes is larger than 1280 bytes
Message-ID: <202512230547.NeeEGjJb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 31988208d5c7c1af8145e148b6701e76f80a66eb [473/799] bcachefs: split out check_dir_structure.c
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251223/202512230547.NeeEGjJb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230547.NeeEGjJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230547.NeeEGjJb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs/check_dir_structure.c: In function 'check_path_loop':
>> fs/bcachefs/fs/check_dir_structure.c:303:1: warning: the frame size of 1520 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     303 | }
         | ^


vim +303 fs/bcachefs/fs/check_dir_structure.c

   190	
   191	static int check_path_loop(struct btree_trans *trans, struct bkey_s_c inode_k)
   192	{
   193		struct bch_fs *c = trans->c;
   194		CLASS(darray_u64, path)();
   195		CLASS(printbuf, buf)();
   196		u32 snapshot = inode_k.k->p.snapshot;
   197		bool redo_bi_depth = false;
   198		u32 min_bi_depth = U32_MAX;
   199		int ret = 0;
   200	
   201		struct bpos start = inode_k.k->p;
   202	
   203		struct bch_inode_unpacked inode;
   204		ret = bch2_inode_unpack(inode_k, &inode);
   205		if (ret)
   206			return ret;
   207	
   208		CLASS(btree_iter, inode_iter)(trans, BTREE_ID_inodes, POS_MIN, 0);
   209	
   210		/*
   211		 * If we're running full fsck, check_dirents() will have already ran,
   212		 * and we shouldn't see any missing alloc/backpointers.here - otherwise that's
   213		 * handled separately, by check_unreachable_inodes
   214		 */
   215		while (!inode.bi_subvol &&
   216		       bch2_inode_has_backpointer(&inode)) {
   217			struct btree_iter dirent_iter;
   218			struct bkey_s_c_dirent d;
   219	
   220			d = dirent_get_by_pos(trans, &dirent_iter,
   221					      SPOS(inode.bi_dir, inode.bi_dir_offset, snapshot));
   222			ret = bkey_err(d.s_c);
   223			if (ret && !bch2_err_matches(ret, ENOENT))
   224				goto out;
   225	
   226			if (!ret && (ret = dirent_points_to_inode(c, d, &inode)))
   227				bch2_trans_iter_exit(&dirent_iter);
   228	
   229			if (bch2_err_matches(ret, ENOENT)) {
   230				printbuf_reset(&buf);
   231				bch2_bkey_val_to_text(&buf, c, inode_k);
   232				bch_err(c, "unreachable inode in check_directory_structure: %s\n%s",
   233					bch2_err_str(ret), buf.buf);
   234				goto out;
   235			}
   236	
   237			bch2_trans_iter_exit(&dirent_iter);
   238	
   239			ret = darray_push(&path, inode.bi_inum);
   240			if (ret)
   241				return ret;
   242	
   243			bch2_btree_iter_set_pos(&inode_iter, SPOS(0, inode.bi_dir, snapshot));
   244			inode_k = bch2_btree_iter_peek_slot(&inode_iter);
   245	
   246			struct bch_inode_unpacked parent_inode;
   247			ret = bkey_err(inode_k) ?:
   248				!bkey_is_inode(inode_k.k) ? -BCH_ERR_ENOENT_inode
   249				: bch2_inode_unpack(inode_k, &parent_inode);
   250			if (ret) {
   251				/* Should have been caught in dirents pass */
   252				bch_err_msg(c, ret, "error looking up parent directory");
   253				goto out;
   254			}
   255	
   256			min_bi_depth = parent_inode.bi_depth;
   257	
   258			if (parent_inode.bi_depth < inode.bi_depth &&
   259			    min_bi_depth < U16_MAX)
   260				break;
   261	
   262			inode = parent_inode;
   263			redo_bi_depth = true;
   264	
   265			if (darray_find(path, inode.bi_inum)) {
   266				printbuf_reset(&buf);
   267				prt_printf(&buf, "directory structure loop in snapshot %u: ",
   268					   snapshot);
   269	
   270				ret = bch2_inum_snapshot_to_path(trans, start.offset, start.snapshot, NULL, &buf);
   271				if (ret)
   272					goto out;
   273	
   274				if (c->opts.verbose) {
   275					prt_newline(&buf);
   276					darray_for_each(path, i)
   277						prt_printf(&buf, "%llu ", *i);
   278				}
   279	
   280				if (fsck_err(trans, dir_loop, "%s", buf.buf)) {
   281					ret = remove_backpointer(trans, &inode);
   282					bch_err_msg(c, ret, "removing dirent");
   283					if (ret)
   284						goto out;
   285	
   286					ret = bch2_reattach_inode(trans, &inode);
   287					bch_err_msg(c, ret, "reattaching inode %llu", inode.bi_inum);
   288				}
   289	
   290				goto out;
   291			}
   292		}
   293	
   294		if (inode.bi_subvol)
   295			min_bi_depth = 0;
   296	
   297		if (redo_bi_depth)
   298			ret = bch2_bi_depth_renumber(trans, &path, snapshot, min_bi_depth);
   299	out:
   300	fsck_err:
   301		bch_err_fn(c, ret);
   302		return ret;
 > 303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
