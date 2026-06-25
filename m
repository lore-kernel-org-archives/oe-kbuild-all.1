Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E472571B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395637; cv=none; b=Q7/o75Sip67ZVRO+eaDkzCQ2BW6lHa2k2/rYZH1wzEquhN8XYXTAbqQh2DnzIGZxS2+426MYGpEB3wMnqhC+zRB2YGpdg2v2V9v/RDnWlQrBl+zCOlMHQy3Rdd8tko6Kpw37sTbh4zbn0mhfO7Vq2Dw7KDcIsP34v+ZdbCiIhyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395637; c=relaxed/simple;
	bh=4VLsLPmsOnSm7nDXT0lIfSFTzRLeaQ3MiAdjfHrVnAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QoQ+qqWrBXoHgljbASy9Y8FMezAh0BM7U4Al4q7wHSnKkMSDoQeLfvJS3mWnfqH596a1vQfP7LL/9r7rmfbn7i8nU+nmDpPMVK1sXGp+sbqwatFzcn08zW/XIuFYQMrO5d+gKk8cd5CFURURHSHpR3HF71HO2bSvs3lIZ+SKruE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMGOUBp7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMGOUBp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782395636; x=1813931636;
  h=date:from:to:cc:subject:message-id;
  bh=4VLsLPmsOnSm7nDXT0lIfSFTzRLeaQ3MiAdjfHrVnAk=;
  b=aMGOUBp7Z31TKBFNPVbFb1P9w+vhWLeMXHbUhh7db4uJ7qFTMmVJntsY
   FVEpGz2uNDTH/06msp/Z1O13vvVQmY6ejaWZeCl3/PhbkDWZHA0MrpKyK
   dm83xOgd2SXXNe5tD8tOBbTpQ9yd9VLIvefM99y1ccGEa9pVv1r6C7jQW
   h+GDRffW3dWPwJwCa2R+6gGGsHXxkaEkSik86t3sw8aQM5AgGiienEMuB
   V64mqjtLAkre/7fNgehqhgJUa5HsAvcbU1EzOMadrzCQiSdKmV2IGfbAz
   a0KutAutoNSHlpWHash59lH6eI+VXPsehynxfLvgawvNFcBRL5yinbf/5
   g==;
X-CSE-ConnectionGUID: gFUfqbtnR7+ujD5b0czb2Q==
X-CSE-MsgGUID: Mc8wpX6xQOWfBlDlPnGG2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83055818"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83055818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 06:53:56 -0700
X-CSE-ConnectionGUID: D1GzafVPSneAg8FLZYVA8A==
X-CSE-MsgGUID: MccKMI/sS+a7dT6zuYvRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="248158441"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jun 2026 06:53:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wckWd-000000004AN-0aOp;
	Thu, 25 Jun 2026 13:53:51 +0000
Date: Thu, 25 Jun 2026 21:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 480/799]
 fs/bcachefs/alloc/check.c:621:1: warning: the frame size of 1824 bytes is
 larger than 1280 bytes
Message-ID: <202606252111.08izx0cw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 1793cc6db8c9956fee64b427113359b3a2df7678 [480/799] bcachefs: errptr_try()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260625/202606252111.08izx0cw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606252111.08izx0cw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606252111.08izx0cw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/check.c: In function 'bch2_check_alloc_info':
>> fs/bcachefs/alloc/check.c:621:1: warning: the frame size of 1824 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     621 | }
         | ^
--
   fs/bcachefs/data/update.c: In function '__bch2_data_update_index_update':
>> fs/bcachefs/data/update.c:457:1: warning: the frame size of 1496 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     457 | }
         | ^
--
   fs/bcachefs/fs/check.c: In function 'lookup_lostfound':
>> fs/bcachefs/fs/check.c:240:1: warning: the frame size of 1632 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     240 | }
         | ^
   fs/bcachefs/fs/check.c: In function 'bch2_reattach_inode':
   fs/bcachefs/fs/check.c:414:1: warning: the frame size of 1832 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     414 | }
         | ^
   fs/bcachefs/fs/check.c: In function 'check_inode':
   fs/bcachefs/fs/check.c:1088:1: warning: the frame size of 1328 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1088 | }
         | ^
--
   fs/bcachefs/fs/check_dir_structure.c: In function 'check_path_loop':
>> fs/bcachefs/fs/check_dir_structure.c:285:1: warning: the frame size of 1616 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     285 | }
         | ^
--
   fs/bcachefs/vfs/fs.c: In function 'bch2_get_name':
>> fs/bcachefs/vfs/fs.c:2007:1: warning: the frame size of 1320 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    2007 | }
         | ^
   fs/bcachefs/vfs/fs.c: In function 'bch2_rename2':
   fs/bcachefs/vfs/fs.c:1017:1: warning: the frame size of 1336 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1017 | }
         | ^


vim +621 fs/bcachefs/alloc/check.c

3fdc7b4035515f Kent Overstreet 2025-10-04  496  
3fdc7b4035515f Kent Overstreet 2025-10-04  497  int bch2_check_alloc_info(struct bch_fs *c)
3fdc7b4035515f Kent Overstreet 2025-10-04  498  {
3fdc7b4035515f Kent Overstreet 2025-10-04  499  	struct btree_iter iter, discard_iter, freespace_iter, bucket_gens_iter;
3fdc7b4035515f Kent Overstreet 2025-10-04  500  	struct bch_dev *ca = NULL;
3fdc7b4035515f Kent Overstreet 2025-10-04  501  	struct bkey hole;
3fdc7b4035515f Kent Overstreet 2025-10-04  502  	struct bkey_s_c k;
3fdc7b4035515f Kent Overstreet 2025-10-04  503  	int ret = 0;
3fdc7b4035515f Kent Overstreet 2025-10-04  504  
3fdc7b4035515f Kent Overstreet 2025-10-04  505  	struct progress_indicator_state progress;
3fdc7b4035515f Kent Overstreet 2025-10-04  506  	bch2_progress_init(&progress, c, BIT_ULL(BTREE_ID_alloc));
3fdc7b4035515f Kent Overstreet 2025-10-04  507  
3fdc7b4035515f Kent Overstreet 2025-10-04  508  	CLASS(btree_trans, trans)(c);
3fdc7b4035515f Kent Overstreet 2025-10-04  509  	bch2_trans_iter_init(trans, &iter, BTREE_ID_alloc, POS_MIN,
3fdc7b4035515f Kent Overstreet 2025-10-04  510  			     BTREE_ITER_prefetch);
3fdc7b4035515f Kent Overstreet 2025-10-04  511  	bch2_trans_iter_init(trans, &discard_iter, BTREE_ID_need_discard, POS_MIN,
3fdc7b4035515f Kent Overstreet 2025-10-04  512  			     BTREE_ITER_prefetch);
3fdc7b4035515f Kent Overstreet 2025-10-04  513  	bch2_trans_iter_init(trans, &freespace_iter, BTREE_ID_freespace, POS_MIN,
3fdc7b4035515f Kent Overstreet 2025-10-04  514  			     BTREE_ITER_prefetch);
3fdc7b4035515f Kent Overstreet 2025-10-04  515  	bch2_trans_iter_init(trans, &bucket_gens_iter, BTREE_ID_bucket_gens, POS_MIN,
3fdc7b4035515f Kent Overstreet 2025-10-04  516  			     BTREE_ITER_prefetch);
3fdc7b4035515f Kent Overstreet 2025-10-04  517  
3fdc7b4035515f Kent Overstreet 2025-10-04  518  	while (1) {
3fdc7b4035515f Kent Overstreet 2025-10-04  519  		struct bpos next;
3fdc7b4035515f Kent Overstreet 2025-10-04  520  
3fdc7b4035515f Kent Overstreet 2025-10-04  521  		bch2_trans_begin(trans);
3fdc7b4035515f Kent Overstreet 2025-10-04  522  
3fdc7b4035515f Kent Overstreet 2025-10-04  523  		k = bch2_get_key_or_real_bucket_hole(&iter, &ca, &hole);
3fdc7b4035515f Kent Overstreet 2025-10-04  524  		ret = bkey_err(k);
3fdc7b4035515f Kent Overstreet 2025-10-04  525  		if (ret)
3fdc7b4035515f Kent Overstreet 2025-10-04  526  			goto bkey_err;
3fdc7b4035515f Kent Overstreet 2025-10-04  527  
3fdc7b4035515f Kent Overstreet 2025-10-04  528  		if (!k.k)
3fdc7b4035515f Kent Overstreet 2025-10-04  529  			break;
3fdc7b4035515f Kent Overstreet 2025-10-04  530  
3fdc7b4035515f Kent Overstreet 2025-10-04  531  		progress_update_iter(trans, &progress, &iter);
3fdc7b4035515f Kent Overstreet 2025-10-04  532  
3fdc7b4035515f Kent Overstreet 2025-10-04  533  		if (k.k->type) {
3fdc7b4035515f Kent Overstreet 2025-10-04  534  			next = bpos_nosnap_successor(k.k->p);
3fdc7b4035515f Kent Overstreet 2025-10-04  535  
3fdc7b4035515f Kent Overstreet 2025-10-04  536  			ret = bch2_check_alloc_key(trans,
3fdc7b4035515f Kent Overstreet 2025-10-04  537  						   k, &iter,
3fdc7b4035515f Kent Overstreet 2025-10-04  538  						   &discard_iter,
3fdc7b4035515f Kent Overstreet 2025-10-04  539  						   &freespace_iter,
3fdc7b4035515f Kent Overstreet 2025-10-04  540  						   &bucket_gens_iter);
88b348c46561d1 Kent Overstreet 2025-10-05  541  			BUG_ON(ret > 0);
3fdc7b4035515f Kent Overstreet 2025-10-04  542  			if (ret)
3fdc7b4035515f Kent Overstreet 2025-10-04  543  				goto bkey_err;
3fdc7b4035515f Kent Overstreet 2025-10-04  544  		} else {
3fdc7b4035515f Kent Overstreet 2025-10-04  545  			next = k.k->p;
3fdc7b4035515f Kent Overstreet 2025-10-04  546  
3fdc7b4035515f Kent Overstreet 2025-10-04  547  			ret = bch2_check_alloc_hole_freespace(trans, ca,
3fdc7b4035515f Kent Overstreet 2025-10-04  548  						    bkey_start_pos(k.k),
3fdc7b4035515f Kent Overstreet 2025-10-04  549  						    &next,
3fdc7b4035515f Kent Overstreet 2025-10-04  550  						    &freespace_iter) ?:
3fdc7b4035515f Kent Overstreet 2025-10-04  551  				bch2_check_alloc_hole_bucket_gens(trans,
3fdc7b4035515f Kent Overstreet 2025-10-04  552  						    bkey_start_pos(k.k),
3fdc7b4035515f Kent Overstreet 2025-10-04  553  						    &next,
3fdc7b4035515f Kent Overstreet 2025-10-04  554  						    &bucket_gens_iter);
88b348c46561d1 Kent Overstreet 2025-10-05  555  			BUG_ON(ret > 0);
3fdc7b4035515f Kent Overstreet 2025-10-04  556  			if (ret)
3fdc7b4035515f Kent Overstreet 2025-10-04  557  				goto bkey_err;
3fdc7b4035515f Kent Overstreet 2025-10-04  558  		}
3fdc7b4035515f Kent Overstreet 2025-10-04  559  
3fdc7b4035515f Kent Overstreet 2025-10-04  560  		ret = bch2_trans_commit(trans, NULL, NULL,
3fdc7b4035515f Kent Overstreet 2025-10-04  561  					BCH_TRANS_COMMIT_no_enospc);
3fdc7b4035515f Kent Overstreet 2025-10-04  562  		if (ret)
3fdc7b4035515f Kent Overstreet 2025-10-04  563  			goto bkey_err;
3fdc7b4035515f Kent Overstreet 2025-10-04  564  
3fdc7b4035515f Kent Overstreet 2025-10-04  565  		bch2_btree_iter_set_pos(&iter, next);
3fdc7b4035515f Kent Overstreet 2025-10-04  566  bkey_err:
3fdc7b4035515f Kent Overstreet 2025-10-04  567  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
3fdc7b4035515f Kent Overstreet 2025-10-04  568  			continue;
3fdc7b4035515f Kent Overstreet 2025-10-04  569  		if (ret)
3fdc7b4035515f Kent Overstreet 2025-10-04  570  			break;
3fdc7b4035515f Kent Overstreet 2025-10-04  571  	}
3fdc7b4035515f Kent Overstreet 2025-10-04  572  	bch2_trans_iter_exit(&bucket_gens_iter);
3fdc7b4035515f Kent Overstreet 2025-10-04  573  	bch2_trans_iter_exit(&freespace_iter);
3fdc7b4035515f Kent Overstreet 2025-10-04  574  	bch2_trans_iter_exit(&discard_iter);
3fdc7b4035515f Kent Overstreet 2025-10-04  575  	bch2_trans_iter_exit(&iter);
3fdc7b4035515f Kent Overstreet 2025-10-04  576  	bch2_dev_put(ca);
3fdc7b4035515f Kent Overstreet 2025-10-04  577  	ca = NULL;
3fdc7b4035515f Kent Overstreet 2025-10-04  578  
3fdc7b4035515f Kent Overstreet 2025-10-04  579  	if (ret < 0)
3fdc7b4035515f Kent Overstreet 2025-10-04  580  		return ret;
3fdc7b4035515f Kent Overstreet 2025-10-04  581  
3c16c1d9609b81 Kent Overstreet 2025-10-05  582  	try(for_each_btree_key(trans, iter,
3fdc7b4035515f Kent Overstreet 2025-10-04  583  			BTREE_ID_need_discard, POS_MIN,
3fdc7b4035515f Kent Overstreet 2025-10-04  584  			BTREE_ITER_prefetch, k,
3c16c1d9609b81 Kent Overstreet 2025-10-05  585  		bch2_check_discard_freespace_key(trans, &iter)));
3fdc7b4035515f Kent Overstreet 2025-10-04  586  
3fdc7b4035515f Kent Overstreet 2025-10-04  587  	bch2_trans_iter_init(trans, &iter, BTREE_ID_freespace, POS_MIN,
3fdc7b4035515f Kent Overstreet 2025-10-04  588  			     BTREE_ITER_prefetch);
3fdc7b4035515f Kent Overstreet 2025-10-04  589  	while (1) {
3fdc7b4035515f Kent Overstreet 2025-10-04  590  		bch2_trans_begin(trans);
3fdc7b4035515f Kent Overstreet 2025-10-04  591  		k = bch2_btree_iter_peek(&iter);
3fdc7b4035515f Kent Overstreet 2025-10-04  592  		if (!k.k)
3fdc7b4035515f Kent Overstreet 2025-10-04  593  			break;
3fdc7b4035515f Kent Overstreet 2025-10-04  594  
3fdc7b4035515f Kent Overstreet 2025-10-04  595  		ret = bkey_err(k) ?:
3fdc7b4035515f Kent Overstreet 2025-10-04  596  			bch2_check_discard_freespace_key(trans, &iter);
3fdc7b4035515f Kent Overstreet 2025-10-04  597  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart)) {
3fdc7b4035515f Kent Overstreet 2025-10-04  598  			ret = 0;
3fdc7b4035515f Kent Overstreet 2025-10-04  599  			continue;
3fdc7b4035515f Kent Overstreet 2025-10-04  600  		}
3fdc7b4035515f Kent Overstreet 2025-10-04  601  		if (ret) {
3fdc7b4035515f Kent Overstreet 2025-10-04  602  			CLASS(printbuf, buf)();
3fdc7b4035515f Kent Overstreet 2025-10-04  603  			bch2_bkey_val_to_text(&buf, c, k);
3fdc7b4035515f Kent Overstreet 2025-10-04  604  			bch_err(c, "while checking %s", buf.buf);
3fdc7b4035515f Kent Overstreet 2025-10-04  605  			break;
3fdc7b4035515f Kent Overstreet 2025-10-04  606  		}
3fdc7b4035515f Kent Overstreet 2025-10-04  607  
3fdc7b4035515f Kent Overstreet 2025-10-04  608  		bch2_btree_iter_set_pos(&iter, bpos_nosnap_successor(iter.pos));
3fdc7b4035515f Kent Overstreet 2025-10-04  609  	}
3fdc7b4035515f Kent Overstreet 2025-10-04  610  	bch2_trans_iter_exit(&iter);
3fdc7b4035515f Kent Overstreet 2025-10-04  611  	if (ret)
3fdc7b4035515f Kent Overstreet 2025-10-04  612  		return ret;
3fdc7b4035515f Kent Overstreet 2025-10-04  613  
3fdc7b4035515f Kent Overstreet 2025-10-04  614  	ret = for_each_btree_key_commit(trans, iter,
3fdc7b4035515f Kent Overstreet 2025-10-04  615  			BTREE_ID_bucket_gens, POS_MIN,
3fdc7b4035515f Kent Overstreet 2025-10-04  616  			BTREE_ITER_prefetch, k,
3fdc7b4035515f Kent Overstreet 2025-10-04  617  			NULL, NULL, BCH_TRANS_COMMIT_no_enospc,
3fdc7b4035515f Kent Overstreet 2025-10-04  618  		bch2_check_bucket_gens_key(trans, &iter, k));
3fdc7b4035515f Kent Overstreet 2025-10-04  619  
3fdc7b4035515f Kent Overstreet 2025-10-04  620  	return ret;
3fdc7b4035515f Kent Overstreet 2025-10-04 @621  }
3fdc7b4035515f Kent Overstreet 2025-10-04  622  

:::::: The code at line 621 was first introduced by commit
:::::: 3fdc7b4035515f784e1d442bcca383f5c0267e53 bcachefs: move alloc files to subdir

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
