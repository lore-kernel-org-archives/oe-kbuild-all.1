Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E99024A06D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313849; cv=none; b=he5CpCHkKdrvbyKJ9gpXo/cSrdcu4hF6TeAl3lv0Y3ywRWFcnpO3TM/vT8qw9OCwyN0/O0CYv9kJY0HUhTpT99gwIvanZ419Cn10r664bnYsvGgt2NUrXQ/3JafCRuZADgC3ss3fwRPawyYx4x0SkXvQLTGhjbaIEz2junOEOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313849; c=relaxed/simple;
	bh=AmA3mlipspKsKqjT7pzp6H84SglTbsxZgKt4uy4Viz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oza2g7y6xQheGWh+V0IJ9DY5KK/raSb6ntMQfTQ9Slo8KA+HKhCrQMbgIi3DG/cTEDvhyL7HHogHk9EHTB+fjyzfndzhY9Rn4tRx6OXrk0LF+fI7I49CzLeD+pXguXhTFMasvMD6+Z1jNDNYr900jVflmFC0sRHHtaSh4V1gbgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/VQmq24; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/VQmq24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789313847; x=1820849847;
  h=date:from:to:cc:subject:message-id;
  bh=AmA3mlipspKsKqjT7pzp6H84SglTbsxZgKt4uy4Viz8=;
  b=V/VQmq24C+FY33G41/gQvTF6BQ6Hq7sPUctqcc/MAjUwN7MDG+hvrisY
   ljluPS55yO3sowVjBiUiiWCdcOsZ4T07+kYH/IbbtENEQhkTtVthIgWGV
   R4TsEQxkZLHW/QXhRDwbVtKbLs2IDgp4cf/BKZE0QK6eJ5ycWaplLu0mY
   KtXTEgXbarY6RqPTLnjvscREBsMXGNfJJ5oIcU77YF4aMjPNI/V1wWEj3
   IVuNdaQSfVa8E+zgDN5j/GBT/JCip9FAzIOWoOmCmtSnw4KoAKj7h7I5m
   Me16Sq5bdiN4xna/jcnTPJcwnyE45HCKn1gJnmg4vzE3RF7VbD4519GhP
   Q==;
X-CSE-ConnectionGUID: EfYrwTM2RwW0FGRymsSQkA==
X-CSE-MsgGUID: C8yacltyRDm4ThN6OYDDEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89705463"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89705463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 08:37:26 -0700
X-CSE-ConnectionGUID: Xi520GFaR5+sPZRQxKnRrQ==
X-CSE-MsgGUID: fWT6OU5BTRiC1ZoiyLCFrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="268727808"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Sep 2026 08:37:25 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5mGh-000000001dg-18PK;
	Sun, 13 Sep 2026 15:37:23 +0000
Date: Sun, 13 Sep 2026 17:36:27 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 249/332]
 fs/bcachefs/data/reconcile/work.c:658:1: warning: the frame size of 1552
 bytes is larger than 1536 bytes
Message-ID: <202609131723.TsG4zJGP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 2df58c8935f572f91c66956583e5b764203df420 [249/332] bcachefs: Fix use-after-unlock in reconcile tracepoints
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260913/202609131723.TsG4zJGP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609131723.TsG4zJGP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131723.TsG4zJGP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/reconcile/work.c: In function 'do_reconcile_extent_phys':
>> fs/bcachefs/data/reconcile/work.c:658:1: warning: the frame size of 1552 bytes is larger than 1536 bytes [-Wframe-larger-than=]
     658 | }
         | ^


vim +658 fs/bcachefs/data/reconcile/work.c

de374d7b729620 Kent Overstreet 2026-01-19  613  
de374d7b729620 Kent Overstreet 2026-01-19  614  static int do_reconcile_extent_phys(struct moving_context *ctxt,
de374d7b729620 Kent Overstreet 2026-01-19  615  				    struct per_snapshot_io_opts *snapshot_io_opts,
de374d7b729620 Kent Overstreet 2026-01-19  616  				    struct bbpos work,
de374d7b729620 Kent Overstreet 2026-01-19  617  				    struct wb_maybe_flush *last_flushed)
de374d7b729620 Kent Overstreet 2026-01-19  618  {
de374d7b729620 Kent Overstreet 2026-01-19  619  	struct btree_trans *trans = ctxt->trans;
de374d7b729620 Kent Overstreet 2026-01-19  620  	struct bch_fs *c = trans->c;
de374d7b729620 Kent Overstreet 2026-01-19  621  
de374d7b729620 Kent Overstreet 2026-01-19  622  	CLASS(btree_iter, bp_iter)(trans, BTREE_ID_backpointers, work.pos, 0);
de374d7b729620 Kent Overstreet 2026-01-19  623  	struct bkey_s_c bp_k = bkey_try(bch2_btree_iter_peek_slot(&bp_iter));
de374d7b729620 Kent Overstreet 2026-01-19  624  	if (!bp_k.k || bp_k.k->type != KEY_TYPE_backpointer) /* write buffer race */
de374d7b729620 Kent Overstreet 2026-01-19  625  		return 0;
de374d7b729620 Kent Overstreet 2026-01-19  626  
de374d7b729620 Kent Overstreet 2026-01-19  627  	CLASS(btree_iter_uninit, iter)(trans);
de374d7b729620 Kent Overstreet 2026-01-19  628  	struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
de374d7b729620 Kent Overstreet 2026-01-19  629  	struct bkey_s_c k = bkey_try(bch2_backpointer_get_key(trans, bp, &iter, 0, last_flushed));
de374d7b729620 Kent Overstreet 2026-01-19  630  	if (!k.k)
de374d7b729620 Kent Overstreet 2026-01-19  631  		return 0;
de374d7b729620 Kent Overstreet 2026-01-19  632  
2df58c8935f572 Kent Overstreet 2026-01-25  633  	struct bkey_buf stack_bp __cleanup(bch2_bkey_buf_exit);
2df58c8935f572 Kent Overstreet 2026-01-25  634  	bch2_bkey_buf_init(&stack_bp);
2df58c8935f572 Kent Overstreet 2026-01-25  635  	bch2_bkey_buf_reassemble(&stack_bp, bp_k);
2df58c8935f572 Kent Overstreet 2026-01-25  636  
2df58c8935f572 Kent Overstreet 2026-01-25  637  	struct bkey_buf stack_k __cleanup(bch2_bkey_buf_exit);
2df58c8935f572 Kent Overstreet 2026-01-25  638  	bch2_bkey_buf_init(&stack_k);
2df58c8935f572 Kent Overstreet 2026-01-25  639  	bch2_bkey_buf_reassemble(&stack_k, k);
2df58c8935f572 Kent Overstreet 2026-01-25  640  
de374d7b729620 Kent Overstreet 2026-01-19  641  	struct bch_inode_opts opts;
de374d7b729620 Kent Overstreet 2026-01-19  642  	struct data_update_opts data_opts = {
de374d7b729620 Kent Overstreet 2026-01-19  643  		.read_dev	= work.pos.inode,
de374d7b729620 Kent Overstreet 2026-01-19  644  		.read_flags	= BCH_READ_soft_require_read_device,
de374d7b729620 Kent Overstreet 2026-01-19  645  	};
de374d7b729620 Kent Overstreet 2026-01-19  646  	try(__do_reconcile_extent(ctxt, snapshot_io_opts, &opts, &data_opts, work, &iter, bp.v->level, k));
de374d7b729620 Kent Overstreet 2026-01-19  647  
de374d7b729620 Kent Overstreet 2026-01-19  648  	event_add_trace(c, reconcile_phys, k.k->size, buf, ({
de374d7b729620 Kent Overstreet 2026-01-19  649  		prt_newline(&buf);
2df58c8935f572 Kent Overstreet 2026-01-25  650  		bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(stack_bp.k));
de374d7b729620 Kent Overstreet 2026-01-19  651  		prt_newline(&buf);
2df58c8935f572 Kent Overstreet 2026-01-25  652  		bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(stack_k.k));
de374d7b729620 Kent Overstreet 2026-01-19  653  		prt_newline(&buf);
de374d7b729620 Kent Overstreet 2026-01-19  654  		bch2_data_update_opts_to_text(&buf, c, &opts, &data_opts);
de374d7b729620 Kent Overstreet 2026-01-19  655  	}));
de374d7b729620 Kent Overstreet 2026-01-19  656  
de374d7b729620 Kent Overstreet 2026-01-19  657  	return 0;
de374d7b729620 Kent Overstreet 2026-01-19 @658  }
de374d7b729620 Kent Overstreet 2026-01-19  659  

:::::: The code at line 658 was first introduced by commit
:::::: de374d7b7296203619ba70f976867051cebaf41b bcachefs: Break up reconcile.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
