Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D0F78F4B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 02:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214810; cv=none; b=LuRrm0f7rqIjPB+mIbaOxMKC8jrfdOYa6UIaTf/Z2j/36CipKfp5PbZu5kDZd0wU0Ewo+xIAzsD5DnH5FWUNFuHVIF+oSFuy9OtspajhbD1o+kSWs6EIvfrW51DG0ohW+9thHWxziYDO178tXIGFTBTRx2UGQsaM8Onv/iwvNEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214810; c=relaxed/simple;
	bh=lnMf/jfYu4iB2mu0LRmgbvG/ODmY0yrJpXQSaED8P4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlSqQBMpFCZsym3KNhF/25VCkJed8CtuNAUwNFgIL4n4mHoGubGXwSdgu7+6W3GJgjmIoYgpp8gVcuTTl3nv+QXwilRX7LnNRCoqnXxTVb0Tj8f/j68qSl5pRYtQshHY1eTx9HqmCLaKwKxtyM8/5FFH0/9FxluatCOs4kno6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLyQbVoz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLyQbVoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750214808; x=1781750808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnMf/jfYu4iB2mu0LRmgbvG/ODmY0yrJpXQSaED8P4g=;
  b=VLyQbVozN6l1ChFcc2kGuF06hbc1dFVO8tyTF+rfHeX626mwTw2ZyNAm
   p18qxu0MiAqpoApmBU+NGurLoZH+8h9EMGJdxsNxNDTxpDrvVVTuaEA1a
   Zqw75cebmCIXXiUHnndjPpIS+PS+SpIvHR4qYR3vHZJbGwBAsqsF/Spm/
   fR1L/Ig6RyRKKLivim5arELB3Y6NoR2YH8OVmQLEFnVfls4OaV6ALUB+g
   x5vAugHEY0BgDoYJD62VikUwdWw6ARtnrmXIKLFkbFeN03tvGUvEpbVJI
   uX2C3aUAmbdhvQQs4a44a7bmc44Ry467vSJ1ApXVlxIR6sg3moSQ7e+ov
   g==;
X-CSE-ConnectionGUID: qz3XP0yaQ4exN+Lmb2nUUQ==
X-CSE-MsgGUID: m/vTIB2KTPieHjsx8tQ6og==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52394462"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52394462"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 19:46:47 -0700
X-CSE-ConnectionGUID: Uu2I9gNCTHSKf69omINVpg==
X-CSE-MsgGUID: pEeFS6m5Q++XmAOClv7grQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="153988516"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2025 19:46:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRip2-000JKM-0V;
	Wed, 18 Jun 2025 02:46:44 +0000
Date: Wed, 18 Jun 2025 10:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 26/56] fs/bcachefs/fsck.c:384:42: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202506181012.C9rDDq8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   0e421fff004c1bec613b7047888f5e9c2b5d2418
commit: 9fb09ace59b2beab312ec225630ce87ddbec6d79 [26/56] bcachefs: fsck: Fix reattach_inode() for subvol roots
config: arm-randconfig-r113-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181012.C9rDDq8a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506181012.C9rDDq8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181012.C9rDDq8a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/fsck.c:384:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] fs_path_parent @@     got int @@
   fs/bcachefs/fsck.c:384:42: sparse:     expected restricted __le32 [usertype] fs_path_parent
   fs/bcachefs/fsck.c:384:42: sparse:     got int

vim +384 fs/bcachefs/fsck.c

   363	
   364	static int reattach_inode(struct btree_trans *trans, struct bch_inode_unpacked *inode)
   365	{
   366		struct bch_fs *c = trans->c;
   367		struct bch_inode_unpacked lostfound;
   368		char name_buf[20];
   369		int ret;
   370	
   371		u32 dirent_snapshot = inode->bi_snapshot;
   372		if (inode->bi_subvol) {
   373			inode->bi_parent_subvol = BCACHEFS_ROOT_SUBVOL;
   374	
   375			struct btree_iter subvol_iter;
   376			struct bkey_i_subvolume *subvol =
   377				bch2_bkey_get_mut_typed(trans, &subvol_iter,
   378							BTREE_ID_subvolumes, POS(0, inode->bi_subvol),
   379							0, subvolume);
   380			ret = PTR_ERR_OR_ZERO(subvol);
   381			if (ret)
   382				return ret;
   383	
 > 384			subvol->v.fs_path_parent = BCACHEFS_ROOT_SUBVOL;
   385			bch2_trans_iter_exit(trans, &subvol_iter);
   386	
   387			u64 root_inum;
   388			ret = subvol_lookup(trans, inode->bi_parent_subvol,
   389					    &dirent_snapshot, &root_inum);
   390			if (ret)
   391				return ret;
   392	
   393			snprintf(name_buf, sizeof(name_buf), "subvol-%u", inode->bi_subvol);
   394		} else {
   395			snprintf(name_buf, sizeof(name_buf), "%llu", inode->bi_inum);
   396		}
   397	
   398		ret = lookup_lostfound(trans, dirent_snapshot, &lostfound, inode->bi_inum);
   399		if (ret)
   400			return ret;
   401	
   402		lostfound.bi_nlink += S_ISDIR(inode->bi_mode);
   403	
   404		/* ensure lost+found inode is also present in inode snapshot */
   405		if (!inode->bi_subvol) {
   406			BUG_ON(!bch2_snapshot_is_ancestor(c, inode->bi_snapshot, lostfound.bi_snapshot));
   407			lostfound.bi_snapshot = inode->bi_snapshot;
   408		}
   409	
   410		ret = __bch2_fsck_write_inode(trans, &lostfound);
   411		if (ret)
   412			return ret;
   413	
   414		struct bch_hash_info dir_hash = bch2_hash_info_init(c, &lostfound);
   415		struct qstr name = QSTR(name_buf);
   416	
   417		inode->bi_dir = lostfound.bi_inum;
   418	
   419		ret = bch2_dirent_create_snapshot(trans,
   420					inode->bi_parent_subvol, lostfound.bi_inum,
   421					dirent_snapshot,
   422					&dir_hash,
   423					inode_d_type(inode),
   424					&name,
   425					inode->bi_subvol ?: inode->bi_inum,
   426					&inode->bi_dir_offset,
   427					BTREE_UPDATE_internal_snapshot_node|
   428					STR_HASH_must_create);
   429		if (ret) {
   430			bch_err_msg(c, ret, "error creating dirent");
   431			return ret;
   432		}
   433	
   434		ret = __bch2_fsck_write_inode(trans, inode);
   435		if (ret)
   436			return ret;
   437	
   438		/*
   439		 * Fix up inodes in child snapshots: if they should also be reattached
   440		 * update the backpointer field, if they should not be we need to emit
   441		 * whiteouts for the dirent we just created.
   442		 */
   443		if (!inode->bi_subvol && bch2_snapshot_is_leaf(c, inode->bi_snapshot) <= 0) {
   444			snapshot_id_list whiteouts_done;
   445			struct btree_iter iter;
   446			struct bkey_s_c k;
   447	
   448			darray_init(&whiteouts_done);
   449	
   450			for_each_btree_key_reverse_norestart(trans, iter,
   451					BTREE_ID_inodes, SPOS(0, inode->bi_inum, inode->bi_snapshot - 1),
   452					BTREE_ITER_all_snapshots|BTREE_ITER_intent, k, ret) {
   453				if (k.k->p.offset != inode->bi_inum)
   454					break;
   455	
   456				if (!bkey_is_inode(k.k) ||
   457				    !bch2_snapshot_is_ancestor(c, k.k->p.snapshot, inode->bi_snapshot) ||
   458				    snapshot_list_has_ancestor(c, &whiteouts_done, k.k->p.snapshot))
   459					continue;
   460	
   461				struct bch_inode_unpacked child_inode;
   462				ret = bch2_inode_unpack(k, &child_inode);
   463				if (ret)
   464					break;
   465	
   466				if (!inode_should_reattach(&child_inode)) {
   467					ret = maybe_delete_dirent(trans,
   468								  SPOS(lostfound.bi_inum, inode->bi_dir_offset,
   469								       dirent_snapshot),
   470								  k.k->p.snapshot);
   471					if (ret)
   472						break;
   473	
   474					ret = snapshot_list_add(c, &whiteouts_done, k.k->p.snapshot);
   475					if (ret)
   476						break;
   477				} else {
   478					iter.snapshot = k.k->p.snapshot;
   479					child_inode.bi_dir = inode->bi_dir;
   480					child_inode.bi_dir_offset = inode->bi_dir_offset;
   481	
   482					ret = bch2_inode_write_flags(trans, &iter, &child_inode,
   483								     BTREE_UPDATE_internal_snapshot_node);
   484					if (ret)
   485						break;
   486				}
   487			}
   488			darray_exit(&whiteouts_done);
   489			bch2_trans_iter_exit(trans, &iter);
   490		}
   491	
   492		return ret;
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
