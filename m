Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5658150096E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 23:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768865007; cv=none; b=k6NCB2MeGkuwYV3k4+RmmWuEEep9mFyYF676CB1zc4X5g9IwjLQJizRE6XKyF3z4rNyv19jHIQ97bbtdular/pe4Jh3QyLLJ9JEzknFes+u641sDvGApzlQt0/7vm/7cxh/bggqEjSsNXDz1+yCa/4OPKdtyivzZ/hJ94vb4k9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768865007; c=relaxed/simple;
	bh=jS+5x95Zj+uR/6s0jmPRnBQHZ723dxDqrKssoei5Yb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fYP/Hzrqcc7pHv39HyGPawJT30/765PmYPXvbrstAFg0nI1PO194Q+CA1dWARmxn5ne7QIm6jlGkPhdFL7ZlmaXM0NtlOAzyv3vYeQeJPcztf+3tkHgMqxayX4XXz9DrrB0LtabE1Nm4rwq1+IH/Y9UgkMSNaQTTo3CdT72VE20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRlH1eBD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRlH1eBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768865005; x=1800401005;
  h=date:from:to:cc:subject:message-id;
  bh=jS+5x95Zj+uR/6s0jmPRnBQHZ723dxDqrKssoei5Yb8=;
  b=hRlH1eBD/mobUOO9Lqe62FJ5pDrang0qLuPYAeFromNEm4EyH/cPR9Z1
   QLmHeGpmcfZAxb0EquHJdjgH2czuXf2aoMJX0A4ITogJ9JEyk846tneb/
   75nHcnuE2z4R7gDC3DJ03tFNoSlTU59BxIfbzC/FCmMZOQ7l0gXCe24W1
   e+CrX38KBwRvTTKeLZxBJ7dhTHgIk4ySrD1d56rg97TAJhqgYWRaBoRAF
   tzeJzpDS7kBjzTlR4UEWEf3YSt9tvnLRkDEn/wivANU4KOmMo0KtHW0fv
   TeOiw6+z7syC6McbH7Qtgx1Ov6T8HPsWhSRQUOsTpjwV2crOoP6ADNKYO
   A==;
X-CSE-ConnectionGUID: j73hE+XbQh6w45GmNLmBVA==
X-CSE-MsgGUID: gVB3LWAxTHKX1+4/ybJ2ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73700123"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="73700123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 15:23:25 -0800
X-CSE-ConnectionGUID: WtzjLgrORsevdExRr8fMUw==
X-CSE-MsgGUID: RG/CFTksQVWZsOqRnBgTzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="205214716"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Jan 2026 15:23:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhyae-00000000OO5-2uNZ;
	Mon, 19 Jan 2026 23:23:20 +0000
Date: Tue, 20 Jan 2026 07:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 223/229]
 fs/bcachefs/data/reconcile/work.c:594:1: warning: the frame size of 1288
 bytes is larger than 1280 bytes
Message-ID: <202601200716.8a4PY8lU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ff80babc046bd0df84ae9fff59be4433a23d954b
commit: de374d7b7296203619ba70f976867051cebaf41b [223/229] bcachefs: Break up reconcile.c
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260120/202601200716.8a4PY8lU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200716.8a4PY8lU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200716.8a4PY8lU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/reconcile/work.c: In function 'do_reconcile_extent_phys':
>> fs/bcachefs/data/reconcile/work.c:594:1: warning: the frame size of 1288 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     594 | }
         | ^


vim +594 fs/bcachefs/data/reconcile/work.c

   557	
   558	static int do_reconcile_extent_phys(struct moving_context *ctxt,
   559					    struct per_snapshot_io_opts *snapshot_io_opts,
   560					    struct bbpos work,
   561					    struct wb_maybe_flush *last_flushed)
   562	{
   563		struct btree_trans *trans = ctxt->trans;
   564		struct bch_fs *c = trans->c;
   565	
   566		CLASS(btree_iter, bp_iter)(trans, BTREE_ID_backpointers, work.pos, 0);
   567		struct bkey_s_c bp_k = bkey_try(bch2_btree_iter_peek_slot(&bp_iter));
   568		if (!bp_k.k || bp_k.k->type != KEY_TYPE_backpointer) /* write buffer race */
   569			return 0;
   570	
   571		CLASS(btree_iter_uninit, iter)(trans);
   572		struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
   573		struct bkey_s_c k = bkey_try(bch2_backpointer_get_key(trans, bp, &iter, 0, last_flushed));
   574		if (!k.k)
   575			return 0;
   576	
   577		struct bch_inode_opts opts;
   578		struct data_update_opts data_opts = {
   579			.read_dev	= work.pos.inode,
   580			.read_flags	= BCH_READ_soft_require_read_device,
   581		};
   582		try(__do_reconcile_extent(ctxt, snapshot_io_opts, &opts, &data_opts, work, &iter, bp.v->level, k));
   583	
   584		event_add_trace(c, reconcile_phys, k.k->size, buf, ({
   585			prt_newline(&buf);
   586			bch2_bkey_val_to_text(&buf, c, bp_k);
   587			prt_newline(&buf);
   588			bch2_bkey_val_to_text(&buf, c, k);
   589			prt_newline(&buf);
   590			bch2_data_update_opts_to_text(&buf, c, &opts, &data_opts);
   591		}));
   592	
   593		return 0;
 > 594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
