Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6B3D961
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705924196; cv=none; b=LrfOKbToedsi1JtCWEewHIqjLgfXRoWRkM1XYiNLjSeDGTmCBxpLfApqZ97+yYmxl6fRNo84wtz/TUKlBNAlVRtELN4zCscnmF5EIVJ/1Y6e9LQWIXyz8netQXRKcALms1+kaS1otvHCYA90Sy2kaGEDbuUu5Iak6lRKWKwbJt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705924196; c=relaxed/simple;
	bh=BmYc/P9Xb682ld27CH4EWSXn4AjXihCCqYTfqHvsN0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XioEkQFn5/8PtBlQ2aNl5lPumiIkkWzVsk9M3KPMUj3lGPddJ32WOFnI8lVMBaZrsmLuUGkp7co6aO/TRLSMoCrZMJClvGLd0DGdAo0Tz/jMyYXdt/XEUaKIDeqPPTlfnKeKfweBmFB9jd0fhZd6aFfuZeCBcH9nhXOGbGjXPzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHzA6n5l; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHzA6n5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705924193; x=1737460193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BmYc/P9Xb682ld27CH4EWSXn4AjXihCCqYTfqHvsN0c=;
  b=nHzA6n5l0jI8ZfaN6pehbcoTrcY9iFWMktAxEKhKxuZVnVO38eFDxucH
   k8Fyu2LaCohQbH9rs7JMPaKBxeKGPmlQDU/Jqtj1X4nLGpDQDAGKJ7xa7
   jQt69gqMbpX1GJeTX5CFUbgwOfiO0KSrnJ+TA4lxcAxYaKMkRpCHrMLxG
   5Tpnxe8Aekt8KLLkU5MlwtBcNELoc+q9ACX8oER9Cu3Ih1RylOxipiIC0
   R7uY3YnU3bvnQzWQalB7YmF4PGhgCLOxOeT7TUQX0O2MtDLL0pUXxBVo3
   e3cILAuCgHxdLpj3ZbwAzu1TfBCqkv9tFTblV59jt/uQScfao0vOavz/+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432348930"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="432348930"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 03:49:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="958716484"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="958716484"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jan 2024 03:49:51 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRsoG-0006aq-2b;
	Mon, 22 Jan 2024 11:49:48 +0000
Date: Mon, 22 Jan 2024 19:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 6/6] fs/bcachefs/dirent.c:436:2: error: a
 label can only be part of a statement and a declaration is not a statement
Message-ID: <202401221931.LiA3136x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   05b33431c0012466dd40e9949d475adfd45dfc9b
commit: 05b33431c0012466dd40e9949d475adfd45dfc9b [6/6] bcachefs: Subvolumes may now be renamed
config: i386-randconfig-012-20240122 (https://download.01.org/0day-ci/archive/20240122/202401221931.LiA3136x-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401221931.LiA3136x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401221931.LiA3136x-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/dirent.c: In function 'bch2_dirent_rename':
>> fs/bcachefs/dirent.c:436:2: error: a label can only be part of a statement and a declaration is not a statement
     436 |  bool delete_src = bkey_s_c_to_dirent(old_src).v->d_type == DT_SUBVOL &&
         |  ^~~~
>> fs/bcachefs/dirent.c:439:2: error: expected expression before 'bool'
     439 |  bool delete_dst = old_dst.k &&
         |  ^~~~
>> fs/bcachefs/dirent.c:457:6: error: 'delete_dst' undeclared (first use in this function); did you mean 'delete_src'?
     457 |  if (delete_dst) {
         |      ^~~~~~~~~~
         |      delete_src
   fs/bcachefs/dirent.c:457:6: note: each undeclared identifier is reported only once for each function it appears in


vim +436 fs/bcachefs/dirent.c

   282	
   283	int bch2_dirent_rename(struct btree_trans *trans,
   284			subvol_inum src_dir, struct bch_hash_info *src_hash,
   285			subvol_inum dst_dir, struct bch_hash_info *dst_hash,
   286			const struct qstr *src_name, subvol_inum *src_inum, u64 *src_offset,
   287			const struct qstr *dst_name, subvol_inum *dst_inum, u64 *dst_offset,
   288			enum bch_rename_mode mode)
   289	{
   290		struct btree_iter src_iter = { NULL };
   291		struct btree_iter dst_iter = { NULL };
   292		struct bkey_s_c old_src, old_dst = bkey_s_c_null;
   293		struct bkey_i_dirent *new_src = NULL, *new_dst = NULL;
   294		struct bpos dst_pos =
   295			POS(dst_dir.inum, bch2_dirent_hash(dst_hash, dst_name));
   296		unsigned src_update_flags = 0;
   297		int ret = 0;
   298	
   299		memset(src_inum, 0, sizeof(*src_inum));
   300		memset(dst_inum, 0, sizeof(*dst_inum));
   301	
   302		/* Lookup src: */
   303		ret = bch2_hash_lookup(trans, &src_iter, bch2_dirent_hash_desc,
   304				       src_hash, src_dir, src_name,
   305				       BTREE_ITER_INTENT);
   306		if (ret)
   307			goto out;
   308	
   309		old_src = bch2_btree_iter_peek_slot(&src_iter);
   310		ret = bkey_err(old_src);
   311		if (ret)
   312			goto out;
   313	
   314		ret = bch2_dirent_read_target(trans, src_dir,
   315				bkey_s_c_to_dirent(old_src), src_inum);
   316		if (ret)
   317			goto out;
   318	
   319		/* Lookup dst: */
   320		if (mode == BCH_RENAME) {
   321			/*
   322			 * Note that we're _not_ checking if the target already exists -
   323			 * we're relying on the VFS to do that check for us for
   324			 * correctness:
   325			 */
   326			ret = bch2_hash_hole(trans, &dst_iter, bch2_dirent_hash_desc,
   327					     dst_hash, dst_dir, dst_name);
   328			if (ret)
   329				goto out;
   330		} else {
   331			ret = bch2_hash_lookup(trans, &dst_iter, bch2_dirent_hash_desc,
   332					       dst_hash, dst_dir, dst_name,
   333					       BTREE_ITER_INTENT);
   334			if (ret)
   335				goto out;
   336	
   337			old_dst = bch2_btree_iter_peek_slot(&dst_iter);
   338			ret = bkey_err(old_dst);
   339			if (ret)
   340				goto out;
   341	
   342			ret = bch2_dirent_read_target(trans, dst_dir,
   343					bkey_s_c_to_dirent(old_dst), dst_inum);
   344			if (ret)
   345				goto out;
   346		}
   347	
   348		if (mode != BCH_RENAME_EXCHANGE)
   349			*src_offset = dst_iter.pos.offset;
   350	
   351		/* Create new dst key: */
   352		new_dst = dirent_create_key(trans, dst_dir, 0, dst_name, 0);
   353		ret = PTR_ERR_OR_ZERO(new_dst);
   354		if (ret)
   355			goto out;
   356	
   357		dirent_copy_target(new_dst, bkey_s_c_to_dirent(old_src));
   358		new_dst->k.p = dst_iter.pos;
   359	
   360		/* Create new src key: */
   361		if (mode == BCH_RENAME_EXCHANGE) {
   362			new_src = dirent_create_key(trans, src_dir, 0, src_name, 0);
   363			ret = PTR_ERR_OR_ZERO(new_src);
   364			if (ret)
   365				goto out;
   366	
   367			dirent_copy_target(new_src, bkey_s_c_to_dirent(old_dst));
   368			new_src->k.p = src_iter.pos;
   369		} else {
   370			new_src = bch2_trans_kmalloc(trans, sizeof(struct bkey_i));
   371			ret = PTR_ERR_OR_ZERO(new_src);
   372			if (ret)
   373				goto out;
   374	
   375			bkey_init(&new_src->k);
   376			new_src->k.p = src_iter.pos;
   377	
   378			if (bkey_le(dst_pos, src_iter.pos) &&
   379			    bkey_lt(src_iter.pos, dst_iter.pos)) {
   380				/*
   381				 * We have a hash collision for the new dst key,
   382				 * and new_src - the key we're deleting - is between
   383				 * new_dst's hashed slot and the slot we're going to be
   384				 * inserting it into - oops.  This will break the hash
   385				 * table if we don't deal with it:
   386				 */
   387				if (mode == BCH_RENAME) {
   388					/*
   389					 * If we're not overwriting, we can just insert
   390					 * new_dst at the src position:
   391					 */
   392					new_src = new_dst;
   393					new_src->k.p = src_iter.pos;
   394					goto out_set_src;
   395				} else {
   396					/* If we're overwriting, we can't insert new_dst
   397					 * at a different slot because it has to
   398					 * overwrite old_dst - just make sure to use a
   399					 * whiteout when deleting src:
   400					 */
   401					new_src->k.type = KEY_TYPE_hash_whiteout;
   402				}
   403			} else {
   404				/* Check if we need a whiteout to delete src: */
   405				ret = bch2_hash_needs_whiteout(trans, bch2_dirent_hash_desc,
   406							       src_hash, &src_iter);
   407				if (ret < 0)
   408					goto out;
   409	
   410				if (ret)
   411					new_src->k.type = KEY_TYPE_hash_whiteout;
   412			}
   413		}
   414	
   415		if (new_dst->v.d_type == DT_SUBVOL)
   416			new_dst->v.d_parent_subvol = cpu_to_le32(dst_dir.subvol);
   417	
   418		if ((mode == BCH_RENAME_EXCHANGE) &&
   419		    new_src->v.d_type == DT_SUBVOL)
   420			new_src->v.d_parent_subvol = cpu_to_le32(src_dir.subvol);
   421	
   422		ret = bch2_trans_update(trans, &dst_iter, &new_dst->k_i, 0);
   423		if (ret)
   424			goto out;
   425	out_set_src:
   426		/*
   427		 * If we're deleting a subvolume we need to really delete the dirent,
   428		 * not just emit a whiteout in the current snapshot - there can only be
   429		 * single dirent that points to a given subvolume.
   430		 *
   431		 * IOW, we don't maintain multiple versions in different snapshots of
   432		 * dirents that point to subvolumes - dirents that point to subvolumes
   433		 * are only visible in one particular subvolume so it's not necessary,
   434		 * and it would be particularly confusing for fsck to have to deal with.
   435		 */
 > 436		bool delete_src = bkey_s_c_to_dirent(old_src).v->d_type == DT_SUBVOL &&
   437			new_src->k.p.snapshot != old_src.k->p.snapshot;
   438	
 > 439		bool delete_dst = old_dst.k &&
   440			bkey_s_c_to_dirent(old_dst).v->d_type == DT_SUBVOL &&
   441			new_dst->k.p.snapshot != old_dst.k->p.snapshot;
   442	
   443		if (!delete_src || !bkey_deleted(&new_src->k)) {
   444			ret = bch2_trans_update(trans, &src_iter, &new_src->k_i, src_update_flags);
   445			if (ret)
   446				goto out;
   447		}
   448	
   449		if (delete_src) {
   450			bch2_btree_iter_set_snapshot(&src_iter, old_src.k->p.snapshot);
   451			ret =   bch2_btree_iter_traverse(&src_iter) ?:
   452				bch2_btree_delete_at(trans, &src_iter, BTREE_UPDATE_INTERNAL_SNAPSHOT_NODE);
   453			if (ret)
   454				goto out;
   455		}
   456	
 > 457		if (delete_dst) {
   458			bch2_btree_iter_set_snapshot(&dst_iter, old_dst.k->p.snapshot);
   459			ret =   bch2_btree_iter_traverse(&dst_iter) ?:
   460				bch2_btree_delete_at(trans, &dst_iter, BTREE_UPDATE_INTERNAL_SNAPSHOT_NODE);
   461			if (ret)
   462				goto out;
   463		}
   464	
   465		if (mode == BCH_RENAME_EXCHANGE)
   466			*src_offset = new_src->k.p.offset;
   467		*dst_offset = new_dst->k.p.offset;
   468	out:
   469		bch2_trans_iter_exit(trans, &src_iter);
   470		bch2_trans_iter_exit(trans, &dst_iter);
   471		return ret;
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
