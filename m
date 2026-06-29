Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4FC390CBF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 17:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752847; cv=none; b=hvgOY1rR+pHcgzSACl1csZntwO5bae3Mw6kWgdvAJq6Xq9vrDbU/Qc8Z+7tufwzKawHu8wU+6UcUu3/m7RIKgkBpE11tsQ3yxBdtaUG0veg6KGF7u4OjV6IwcN4t9AtXHrU1Ev/YT4z87gTDLkRJnzeQVEegtQQbr8CSF2dekTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752847; c=relaxed/simple;
	bh=tR4pQ8QLLfwFKAwhVTX9Uj80k3veUQzyysegrsSCGQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZDW+rO+OKDt34lZwdt+Uisa8f3jUl0w66FeWi6aZ2c7SXNibkXpOAP9CAFwImdyJF4aSWZwN7Okw/Nf5lYzdKMXlPsLTJnOi9NnFJURgNk33pyHFhFum7FNtfNDQBAKCKcQygr9uZn+L3GVlDLsN+G3LDn5JjHZgKqiKwVCHQ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgXL2aft; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgXL2aft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782752845; x=1814288845;
  h=date:from:to:cc:subject:message-id;
  bh=tR4pQ8QLLfwFKAwhVTX9Uj80k3veUQzyysegrsSCGQY=;
  b=CgXL2aftL2a1qcJhatIHxokoMUCNE5kckg4BOLbqzpjwo2Iw1WlHJ+UP
   OJ/nJUy9/cF7AePScLiHCwaYcsOSTXT00V65nh6sGZ6KV75dVyFANSBs9
   2Vyhes/ZJH7V2gpIeSu8mZD+zW6PjLI/5iYsrj8tYRCUzhjeocQk1FnY1
   n3HqLuUa8nJaRhntyorqEeDx/GrfKa8KBEKGzW16SvtTPbivCmujPy0bH
   vrgsZTad098koolJ9rX3FQkAvzZfsCq5oVG5WE+9Kvit6aBaoi4/oXrDR
   CNsyeHCIyGFYG4g9NlD4Nf/yEBfMv+PvsIKH9VD2gTW2DKp0527NoJ4Sj
   A==;
X-CSE-ConnectionGUID: bfmcto4uRxymD9DI5yCmvw==
X-CSE-MsgGUID: LbNgjcxzRN+mW4telsI8nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82447112"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="82447112"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:07:24 -0700
X-CSE-ConnectionGUID: zoNafuQlQympL9tdTbNOtQ==
X-CSE-MsgGUID: jjuc36DzTBqLVWElTYJAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="248648304"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jun 2026 10:07:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weFS3-000000007bN-3xRi;
	Mon, 29 Jun 2026 17:07:19 +0000
Date: Tue, 30 Jun 2026 01:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 216/332]
 fs/bcachefs/data/ec/init.c:240:5-8: Unneeded variable: "ret". Return "0" on
 line 268
Message-ID: <202606300042.lB1koufY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: bde39b90107558a6e5c84934716bf171ced1cef5 [216/332] bcachefs: Split up data/ec.c
config: arc-randconfig-r061-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300042.lB1koufY-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300042.lB1koufY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/ec/init.c:240:5-8: Unneeded variable: "ret". Return "0" on line 268

vim +240 fs/bcachefs/data/ec/init.c

   230	
   231	static int check_stripe_refs_one(struct btree_trans *trans,
   232					 struct bkey_s_c k,
   233					 struct wb_maybe_flush *last_flushed)
   234	{
   235		if (k.k->type != KEY_TYPE_stripe)
   236			return 0;
   237	
   238		struct bch_fs *c = trans->c;
   239		const struct bch_stripe *s = bkey_s_c_to_stripe(k).v;
 > 240		int ret = 0;
   241	
   242		u64 lru_idx = stripe_lru_pos(s);
   243		if (lru_idx)
   244			try(bch2_lru_check_set(trans, BCH_LRU_STRIPE_FRAGMENTATION,
   245					       k.k->p.offset, lru_idx, k, last_flushed));
   246	
   247		for (unsigned i = 0; i < s->nr_blocks; i++) {
   248			const struct bch_extent_ptr *ptr = s->ptrs + i;
   249			CLASS(bch2_dev_tryget_noerror, ca)(c, ptr->dev);
   250			if (!ca)
   251				continue;
   252	
   253			struct bpos bucket = PTR_BUCKET_POS(ca, ptr);
   254	
   255			CLASS(btree_iter, iter)(trans, BTREE_ID_bucket_to_stripe,
   256						POS(bucket_to_u64(bucket), k.k->p.offset), 0);
   257			struct bkey_s_c ref = bkey_try(bch2_btree_iter_peek_slot(&iter));
   258	
   259			CLASS(printbuf, buf)();
   260	
   261			if (fsck_err_on(ref.k->type != KEY_TYPE_set,
   262					trans, stripe_to_missing_bucket_ref,
   263					"stripe block %u missing bucket ref\n%s",
   264					i, (bch2_bkey_val_to_text(&buf, c, k), buf.buf)))
   265				try(bucket_stripe_ref_mod(trans, bucket, k.k->p.offset, true));
   266		}
   267	fsck_err:
 > 268		return ret;
   269	}
   270	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
