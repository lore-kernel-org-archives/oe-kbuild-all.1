Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1DE2773E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760135436; cv=none; b=cJQ/F7wO0DPRh5Q1h5+7xCH+OwnIpsFk1CBCrPpkoozEwcgIAgX24QsKXJ0OBfX4lX6fUg4zBstGrfdHYAd3E+LNwkXF7hSIhX/HMcWIcolGx45FEApnnkfDz85pkyT88bTxmTvHsk3vgZ6SpcvFke5/2f/HrY4eqkNhVl/qS48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760135436; c=relaxed/simple;
	bh=q/Td5XLel0NzUIbtVPjM23gktzQVylIJbgjP6IbLkpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H4DzzGbgU2R2N4o2LwDryX9PNQ0hU2jLG9jcojA4DlqQ44yEn8j31xN1UUj+CDsoxp0GPjzUXsvB+ohf3KYxi9/7+WSLVZxEKM28oE30GEg6AXe5f9/wkLqVQFsp1k1cYDqesrxdvO3REYzM6LP7lPCSdFz+IzZ26RPZBSOP434=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atD3Bz6F; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atD3Bz6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760135434; x=1791671434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/Td5XLel0NzUIbtVPjM23gktzQVylIJbgjP6IbLkpI=;
  b=atD3Bz6FcHwZe+QQhEcgKpk30JbDXDZZzlFv0Wo3LMgdzE0p4Abve2ln
   JmbQ9XUSoylXAJ8EggdEHUVW4l1bra68NHzDyI10yJAGqQNYKIFTjHdWw
   RhyB7YF3T+9Ljt1x6LHbWKZWfGn9gpU+cNRC7HPpO5du1zogIZaKZwB/E
   31GitO6ePPEPiokTnPuTiURLZg8zu6aSIyKsLnEkcCHToC6lv3aQfC4Ha
   gxm4ZJfAmsbFxJVs8wOuBV+qEDtFo2I13gHRUhniiOpQRvQFmSjQCYNAu
   QIouJnkku61a615CVh+gN/62ueCy7FstJEXwApIe6s7BN9qaNdoWtJX9m
   A==;
X-CSE-ConnectionGUID: JlsjdwXpTYCkr93pxwLINQ==
X-CSE-MsgGUID: EUhAaJ9JRn+nZhZVrjzWEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62400126"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62400126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 15:30:34 -0700
X-CSE-ConnectionGUID: 0k6Am1o7TQu7OVYM8IWWpA==
X-CSE-MsgGUID: nOOj/wjfQpS9GlLp211G1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180908894"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2025 15:30:33 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Ld8-0003El-1l;
	Fri, 10 Oct 2025 22:30:30 +0000
Date: Sat, 11 Oct 2025 06:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 458/534]
 fs/bcachefs/alloc/check.c:666:1: warning: the frame size of 1880 bytes is
 larger than 1280 bytes
Message-ID: <202510110640.9BTnICHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   9a59939e496692bfa0e4cd6e7b8f79d416c49f72
commit: 0151e9a63908fe0c0e6f7393d8677b62bb3cb71c [458/534] bcachefs: move alloc files to subdir
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251011/202510110640.9BTnICHO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110640.9BTnICHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110640.9BTnICHO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/check.c: In function 'bch2_check_alloc_info':
>> fs/bcachefs/alloc/check.c:666:1: warning: the frame size of 1880 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     666 | }
         | ^


vim +666 fs/bcachefs/alloc/check.c

   541	
   542	int bch2_check_alloc_info(struct bch_fs *c)
   543	{
   544		struct btree_iter iter, discard_iter, freespace_iter, bucket_gens_iter;
   545		struct bch_dev *ca = NULL;
   546		struct bkey hole;
   547		struct bkey_s_c k;
   548		int ret = 0;
   549	
   550		struct progress_indicator_state progress;
   551		bch2_progress_init(&progress, c, BIT_ULL(BTREE_ID_alloc));
   552	
   553		CLASS(btree_trans, trans)(c);
   554		bch2_trans_iter_init(trans, &iter, BTREE_ID_alloc, POS_MIN,
   555				     BTREE_ITER_prefetch);
   556		bch2_trans_iter_init(trans, &discard_iter, BTREE_ID_need_discard, POS_MIN,
   557				     BTREE_ITER_prefetch);
   558		bch2_trans_iter_init(trans, &freespace_iter, BTREE_ID_freespace, POS_MIN,
   559				     BTREE_ITER_prefetch);
   560		bch2_trans_iter_init(trans, &bucket_gens_iter, BTREE_ID_bucket_gens, POS_MIN,
   561				     BTREE_ITER_prefetch);
   562	
   563		while (1) {
   564			struct bpos next;
   565	
   566			bch2_trans_begin(trans);
   567	
   568			k = bch2_get_key_or_real_bucket_hole(&iter, &ca, &hole);
   569			ret = bkey_err(k);
   570			if (ret)
   571				goto bkey_err;
   572	
   573			if (!k.k)
   574				break;
   575	
   576			progress_update_iter(trans, &progress, &iter);
   577	
   578			if (k.k->type) {
   579				next = bpos_nosnap_successor(k.k->p);
   580	
   581				ret = bch2_check_alloc_key(trans,
   582							   k, &iter,
   583							   &discard_iter,
   584							   &freespace_iter,
   585							   &bucket_gens_iter);
   586				if (ret)
   587					goto bkey_err;
   588			} else {
   589				next = k.k->p;
   590	
   591				ret = bch2_check_alloc_hole_freespace(trans, ca,
   592							    bkey_start_pos(k.k),
   593							    &next,
   594							    &freespace_iter) ?:
   595					bch2_check_alloc_hole_bucket_gens(trans,
   596							    bkey_start_pos(k.k),
   597							    &next,
   598							    &bucket_gens_iter);
   599				if (ret)
   600					goto bkey_err;
   601			}
   602	
   603			ret = bch2_trans_commit(trans, NULL, NULL,
   604						BCH_TRANS_COMMIT_no_enospc);
   605			if (ret)
   606				goto bkey_err;
   607	
   608			bch2_btree_iter_set_pos(&iter, next);
   609	bkey_err:
   610			if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   611				continue;
   612			if (ret)
   613				break;
   614		}
   615		bch2_trans_iter_exit(&bucket_gens_iter);
   616		bch2_trans_iter_exit(&freespace_iter);
   617		bch2_trans_iter_exit(&discard_iter);
   618		bch2_trans_iter_exit(&iter);
   619		bch2_dev_put(ca);
   620		ca = NULL;
   621	
   622		if (ret < 0)
   623			return ret;
   624	
   625		ret = for_each_btree_key(trans, iter,
   626				BTREE_ID_need_discard, POS_MIN,
   627				BTREE_ITER_prefetch, k,
   628			bch2_check_discard_freespace_key(trans, &iter));
   629		if (ret)
   630			return ret;
   631	
   632		bch2_trans_iter_init(trans, &iter, BTREE_ID_freespace, POS_MIN,
   633				     BTREE_ITER_prefetch);
   634		while (1) {
   635			bch2_trans_begin(trans);
   636			k = bch2_btree_iter_peek(&iter);
   637			if (!k.k)
   638				break;
   639	
   640			ret = bkey_err(k) ?:
   641				bch2_check_discard_freespace_key(trans, &iter);
   642			if (bch2_err_matches(ret, BCH_ERR_transaction_restart)) {
   643				ret = 0;
   644				continue;
   645			}
   646			if (ret) {
   647				CLASS(printbuf, buf)();
   648				bch2_bkey_val_to_text(&buf, c, k);
   649				bch_err(c, "while checking %s", buf.buf);
   650				break;
   651			}
   652	
   653			bch2_btree_iter_set_pos(&iter, bpos_nosnap_successor(iter.pos));
   654		}
   655		bch2_trans_iter_exit(&iter);
   656		if (ret)
   657			return ret;
   658	
   659		ret = for_each_btree_key_commit(trans, iter,
   660				BTREE_ID_bucket_gens, POS_MIN,
   661				BTREE_ITER_prefetch, k,
   662				NULL, NULL, BCH_TRANS_COMMIT_no_enospc,
   663			bch2_check_bucket_gens_key(trans, &iter, k));
   664	
   665		return ret;
 > 666	}
   667	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
