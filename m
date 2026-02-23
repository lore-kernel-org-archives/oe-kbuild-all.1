Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A22777F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 05:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771824385; cv=none; b=WJ+Sdj2M0GD4HbZJ7q/SePKFPr5+GhbuBJpQ94c/xqy4PbQGYT8Ht3cDGvpvQeosxmcmlmKg4hWcg6EUJlJ42JhH5AfYyMwIf6Aa5/nUi/7ekIH/GLvLeNnAnhuM8WYyLN5mwKXRbXG6lHyZqkypVOxXX8doAg1kcuQEPWhizRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771824385; c=relaxed/simple;
	bh=bYMd8xyV8Z0Lgb4qDmhXCbYYUp5Dg3lOelBU8mPMylI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bsr/N3h5JjkcnvOLpH4sQuKsxKrSApNNmqYUCbostcm3zoVdHCyLF7yC93OyLGQxe6Tj2MNzJ6B3cVSYKIOpqeEvBhoRIngdc++7YEFTuSpkaU5qrWoqn8NvIJQ5CVKC2JLIXAupkiB5B8Zf0FcOUXLwyOsFdfE/MhmPndepwmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKiu9AYe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKiu9AYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771824383; x=1803360383;
  h=date:from:to:cc:subject:message-id;
  bh=bYMd8xyV8Z0Lgb4qDmhXCbYYUp5Dg3lOelBU8mPMylI=;
  b=fKiu9AYeTPa++hWumqzUp9fNfnCtfv1yoID2/KeSRSYe0xqJSKSICbef
   0tWMvG4z/HTV/anlklHFAQrxwIBzL9Im72wdZebZsh3GzUgpj0b/wrbri
   CfDnkJX38XkOwK9eWmMZpjrkOISAiDG0JKIbd7tg8bichIfbw/0WJgJNO
   NFR6OXJJ3AQ/4a1TlfoxY/N1PJcwfGUNdFWrRaB4V7JOA54zWuzg6q/S/
   7wY5t/VZ8MKF6uJyTiBxOUOqgDt4umNuO4sOuZiyj/KNU/H/pBlZHEzxn
   kmU7YzSEmUUvvRbO/OptmUNP5+Y8eqttFbdvH42LQ8uaB8+1b3e2BtGej
   Q==;
X-CSE-ConnectionGUID: utPZtK11Tj6uTREVr5kUfg==
X-CSE-MsgGUID: rs2ynohoSVyyndWmMlXNqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="84266308"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="84266308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 21:26:23 -0800
X-CSE-ConnectionGUID: 6+vEopcKQZCjNlUyuR9Kkw==
X-CSE-MsgGUID: AUGYaIE8Tne5IjjKv/s+EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213881350"
Received: from lkp-server01.sh.intel.com (HELO f9d61316528f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Feb 2026 21:26:21 -0800
Received: from kbuild by f9d61316528f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuOSZ-000000000A9-2H8D;
	Mon, 23 Feb 2026 05:26:19 +0000
Date: Mon, 23 Feb 2026 13:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 249/385]
 fs/bcachefs/data/reconcile/work.c:658:1: warning: the frame size of 1632
 bytes is larger than 1536 bytes
Message-ID: <202602231349.82AAmGJY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   d4bd02beae9ffcc8e3c028b54cb3a25b06e95beb
commit: 2df58c8935f572f91c66956583e5b764203df420 [249/385] bcachefs: Fix use-after-unlock in reconcile tracepoints
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260223/202602231349.82AAmGJY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602231349.82AAmGJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602231349.82AAmGJY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/reconcile/work.c: In function 'do_reconcile_extent_phys':
>> fs/bcachefs/data/reconcile/work.c:658:1: warning: the frame size of 1632 bytes is larger than 1536 bytes [-Wframe-larger-than=]
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
