Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813653E8C75
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465330; cv=none; b=tLYo5IWGeF8GcAyeBAh7ri9vR2hkBOjejYo92gx5fTOsyUC58hEPM/ZioCU+qr7XniB3YKihSSsKiYnZVTH6vGjrG/2a1FMu5KY/4a580NkAFe50Akp87ZE4KQ419a7FYCEml50hs1OcafJNzTzqt14YS6pM4zW63VF1B8ApbpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465330; c=relaxed/simple;
	bh=qmgBf72idf58FDCXfZTJgPz21ScTbXhYfDI6ORF3g+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JV7uJxcZu4Z1lTtq75qfjavmo+0b7OUE+vIwoQV0qgdJkTBHoPE4ciSzsefFBaW2AH/onD4IO3ZIwWSiy192ZInR4kaB9eUQGl2J/k8an3S8bsOn0vAU04kGbborqaXjKKmxxkQxttHcsUCajjyHsa0idzq+lwi1cGxwwx7oHQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApwKYaWz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApwKYaWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782465328; x=1814001328;
  h=date:from:to:cc:subject:message-id;
  bh=qmgBf72idf58FDCXfZTJgPz21ScTbXhYfDI6ORF3g+s=;
  b=ApwKYaWzi8/cAhs0lWQJt+yOSWLR9sFjhhJUffwtqs/h9i49YdR5Di7C
   4sm5mwypxm8Id+0zPDxJ/ByrzNUPqdh3jsl2eAh/6nvmVj4e6p/MuBv3V
   G6xdvcAloVaBr0lFmmmjGH/BZChCs7Dwmxi5EBKmkqdc2yMOpfLHm/XUs
   yjOlSRjVw4coH8bJwC/9IjGtwetXKAJnDjjxSzVxq6KLsUAQVHniM5knG
   cyszp+ErAA2GrSNziZXE71KV+VZw9o7ev+wa1Or/QSclQ4cyVGN7BSm9q
   VejbVy6KKpNg6Z1IjGbGrfpdqx3VBQxTlJcyr50cdexUv18XTN0/Sv9tP
   g==;
X-CSE-ConnectionGUID: lUclz6AXRYasnpy7XIyhdw==
X-CSE-MsgGUID: tgWu4Uj5QAGzQQ06EnBdsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83393642"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83393642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 02:15:27 -0700
X-CSE-ConnectionGUID: AZnlyV33R0u2ahiyuLw01g==
X-CSE-MsgGUID: WKgXDLxuSSG/AiOM7WrV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="251944293"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2026 02:15:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd2eb-000000004wj-0hbO;
	Fri, 26 Jun 2026 09:15:20 +0000
Date: Fri, 26 Jun 2026 17:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 361/405]
 fs/bcachefs/data/ec/create.c:371:1: warning: the frame size of 1352 bytes is
 larger than 1280 bytes
Message-ID: <202606261712.ZltrHkIJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 87c8e87f6e10fa0ef7e46b4b356c8598a0abcfbb [361/405] bcachefs: Exents that point to stripes with missing devs can be repaired
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260626/202606261712.ZltrHkIJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606261712.ZltrHkIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606261712.ZltrHkIJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/ec/create.c: In function 'stripe_update_bucket':
>> fs/bcachefs/data/ec/create.c:371:1: warning: the frame size of 1352 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     371 | }
         | ^


vim +371 fs/bcachefs/data/ec/create.c

bde39b90107558 Kent Overstreet 2026-01-17  302  
0a97da6f3749b9 Kent Overstreet 2026-01-22  303  static int stripe_update_bucket(struct btree_trans *trans, struct ec_stripe_new *s, unsigned new_blocknr)
bde39b90107558 Kent Overstreet 2026-01-17  304  {
bde39b90107558 Kent Overstreet 2026-01-17  305  	struct bch_fs *c = trans->c;
0a97da6f3749b9 Kent Overstreet 2026-01-22  306  	unsigned old_blocknr = new_blocknr < s->old_blocks_nr
0a97da6f3749b9 Kent Overstreet 2026-01-22  307  		? s->old_block_map[new_blocknr]
0a97da6f3749b9 Kent Overstreet 2026-01-22  308  		: new_blocknr;
bde39b90107558 Kent Overstreet 2026-01-17  309  
0ca5116355ce27 Kent Overstreet 2026-01-25  310  	struct bkey_i_stripe *new_stripe = &s->new_stripe.key;
0a97da6f3749b9 Kent Overstreet 2026-01-22  311  	struct bkey_i_stripe *old_stripe = new_blocknr < s->old_blocks_nr
0ca5116355ce27 Kent Overstreet 2026-01-25  312  		? &s->old_stripe.key
0a97da6f3749b9 Kent Overstreet 2026-01-22  313  		: new_stripe;
0a97da6f3749b9 Kent Overstreet 2026-01-22  314  
0a97da6f3749b9 Kent Overstreet 2026-01-22  315  	struct bch_extent_ptr old_block = old_stripe->v.ptrs[old_blocknr];
0a97da6f3749b9 Kent Overstreet 2026-01-22  316  	struct bch_extent_ptr new_block = new_stripe->v.ptrs[new_blocknr];
0a97da6f3749b9 Kent Overstreet 2026-01-22  317  
0a97da6f3749b9 Kent Overstreet 2026-01-22  318  	CLASS(bch2_dev_bkey_tryget, ca)(c, bkey_i_to_s_c(&old_stripe->k_i), old_block.dev);
87c8e87f6e10fa Kent Overstreet 2026-01-22  319  	enum btree_id btree;
87c8e87f6e10fa Kent Overstreet 2026-01-22  320  	struct bpos start, end;
87c8e87f6e10fa Kent Overstreet 2026-01-22  321  	if (ca) {
0a97da6f3749b9 Kent Overstreet 2026-01-22  322  		struct bpos bucket_pos = PTR_BUCKET_POS(ca, &old_block);
bde39b90107558 Kent Overstreet 2026-01-17  323  
87c8e87f6e10fa Kent Overstreet 2026-01-22  324  		btree	= BTREE_ID_backpointers;
87c8e87f6e10fa Kent Overstreet 2026-01-22  325  		start	= bucket_pos_to_bp_start(ca, bucket_pos);
87c8e87f6e10fa Kent Overstreet 2026-01-22  326  		end	= bucket_pos_to_bp_end(ca, bucket_pos);
87c8e87f6e10fa Kent Overstreet 2026-01-22  327  	} else {
87c8e87f6e10fa Kent Overstreet 2026-01-22  328  		u64 idx = old_stripe->k.p.offset;
87c8e87f6e10fa Kent Overstreet 2026-01-22  329  		btree	= BTREE_ID_stripe_backpointers;
87c8e87f6e10fa Kent Overstreet 2026-01-22  330  		start	= POS((idx << 8) | old_blocknr, 0);
87c8e87f6e10fa Kent Overstreet 2026-01-22  331  		end	= POS((idx << 8) | old_blocknr, U64_MAX);
87c8e87f6e10fa Kent Overstreet 2026-01-22  332  	}
87c8e87f6e10fa Kent Overstreet 2026-01-22  333  
bde39b90107558 Kent Overstreet 2026-01-17  334  	struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
bde39b90107558 Kent Overstreet 2026-01-17  335  	wb_maybe_flush_init(&last_flushed);
bde39b90107558 Kent Overstreet 2026-01-17  336  
bde39b90107558 Kent Overstreet 2026-01-17  337  	struct stripe_update_bucket_stats stats = {};
bde39b90107558 Kent Overstreet 2026-01-17  338  
bde39b90107558 Kent Overstreet 2026-01-17  339  	CLASS(disk_reservation, res)(c);
bde39b90107558 Kent Overstreet 2026-01-17  340  
87c8e87f6e10fa Kent Overstreet 2026-01-22  341  	try(for_each_btree_key_max(trans, bp_iter, btree, start, end, 0, bp_k, ({
bde39b90107558 Kent Overstreet 2026-01-17  342  		if (bp_k.k->type != KEY_TYPE_backpointer)
bde39b90107558 Kent Overstreet 2026-01-17  343  			continue;
bde39b90107558 Kent Overstreet 2026-01-17  344  
bde39b90107558 Kent Overstreet 2026-01-17  345  		struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
bde39b90107558 Kent Overstreet 2026-01-17  346  		if (bp.v->btree_id == BTREE_ID_stripes)
bde39b90107558 Kent Overstreet 2026-01-17  347  			continue;
bde39b90107558 Kent Overstreet 2026-01-17  348  
bde39b90107558 Kent Overstreet 2026-01-17  349  		wb_maybe_flush_inc(&last_flushed);
0a97da6f3749b9 Kent Overstreet 2026-01-22  350  		stripe_update_extent(trans, old_stripe, new_stripe,
0a97da6f3749b9 Kent Overstreet 2026-01-22  351  				     old_block, new_block, new_blocknr,
0a97da6f3749b9 Kent Overstreet 2026-01-22  352  				     bp, &stats, &res.r, &last_flushed);
bde39b90107558 Kent Overstreet 2026-01-17  353  	})));
bde39b90107558 Kent Overstreet 2026-01-17  354  
bde39b90107558 Kent Overstreet 2026-01-17  355  	event_inc_trace(c, stripe_update_bucket, buf, ({
0a97da6f3749b9 Kent Overstreet 2026-01-22  356  		prt_printf(&buf, "Updating block %u\n", new_blocknr);
0ca5116355ce27 Kent Overstreet 2026-01-25  357  		bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(&s->new_stripe.key.k_i));
bde39b90107558 Kent Overstreet 2026-01-17  358  		prt_newline(&buf);
bde39b90107558 Kent Overstreet 2026-01-17  359  
bde39b90107558 Kent Overstreet 2026-01-17  360  		prt_printf(&buf, "bp_to_deleted:\t%u %u\n",
bde39b90107558 Kent Overstreet 2026-01-17  361  			   stats.nr_bp_to_deleted, stats.sectors_bp_to_deleted);
bde39b90107558 Kent Overstreet 2026-01-17  362  		prt_printf(&buf, "no_match:\t%u %u\n",
bde39b90107558 Kent Overstreet 2026-01-17  363  			   stats.nr_no_match, stats.sectors_no_match);
bde39b90107558 Kent Overstreet 2026-01-17  364  		prt_printf(&buf, "cached:\t%u %u\n",
bde39b90107558 Kent Overstreet 2026-01-17  365  			   stats.nr_cached, stats.sectors_cached);
bde39b90107558 Kent Overstreet 2026-01-17  366  		prt_printf(&buf, "done:\t%u %u\n",
bde39b90107558 Kent Overstreet 2026-01-17  367  			   stats.nr_done, stats.sectors_done);
bde39b90107558 Kent Overstreet 2026-01-17  368  	}));
bde39b90107558 Kent Overstreet 2026-01-17  369  
bde39b90107558 Kent Overstreet 2026-01-17  370  	return 0;
bde39b90107558 Kent Overstreet 2026-01-17 @371  }
bde39b90107558 Kent Overstreet 2026-01-17  372  

:::::: The code at line 371 was first introduced by commit
:::::: bde39b90107558a6e5c84934716bf171ced1cef5 bcachefs: Split up data/ec.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
