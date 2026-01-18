Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990BC274FD0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 22:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768774889; cv=none; b=tRLihAnKHd0e+ooDxwR8NgtPfMCvXNccfiEAm1vh/mp2Iw2vRHEZM9wxmZk4AjsxzWcofuQNT2Wtp6d2fVOv/4rk6NhtJS6LLiM2tawGmoZQnF+A7ARqoiRFGCeI2YwG+6r/kNyjbIhYtBlyBscFDTSVud4leSCyG1hHEEzJCRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768774889; c=relaxed/simple;
	bh=c3KVBF5fAOSrc8G5PoJDwwVzDd/lziQ7KC8jSvYnyRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ibx5jr5L+KB5qwyNnMUZRNDnO/VYrBKpxEXs/jYsb/VYFdPjMN5rXnoO/mWUeoMFQ8urT/Rm9CslyG3MdmE0ct0gWjFSeITveg3U9v84fOrgBY/jsEmeam/5X0EZUUri1Te9mREyqh80r6HIhCCNkdwfDAWOAl1SN/jLebqubtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxoPkFiF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxoPkFiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768774887; x=1800310887;
  h=date:from:to:cc:subject:message-id;
  bh=c3KVBF5fAOSrc8G5PoJDwwVzDd/lziQ7KC8jSvYnyRM=;
  b=cxoPkFiFHalFuh52Kg+MJ75oF8sDCFFOOifQpjnWd+qIaCZGxSCPahbc
   kv13bcycUP3s5Lg05TV8Qhu9CiJJ9U0LLDOnPcWWups+sgu8AAU1kOuS8
   JYvPyqu2wn0ZtATdAZq/VOUzrCyjPTLNOqbVeRctb9TAx5VrsP2ZEMYrx
   +i6zuY7y3OqVYPbt9KHcrRa6O+dbq61au9iyUkuXerKuz85nLSLojxVGY
   iHZbRW1acIJCmNJthHq9awrfMLZ4CQxPBZOpYo0UXouKiBDtwSwa3vQyU
   jFHPn+USQw5T6jOnWUEY3EzZRmuACYnwjMi8J1MCMrvti9Dg4p6mdF42g
   w==;
X-CSE-ConnectionGUID: 5xqG1nvVR+Ov/W4VcxjUaA==
X-CSE-MsgGUID: qstjbmu6QMunXXS/No7mFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70043221"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="70043221"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 14:21:26 -0800
X-CSE-ConnectionGUID: RPUZYVBoSBy6rAFqF/R39Q==
X-CSE-MsgGUID: fJ2p77VfRnaIrTU2sVnnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="210209708"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jan 2026 14:21:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhb98-00000000NGL-3D1U;
	Sun, 18 Jan 2026 22:21:22 +0000
Date: Mon, 19 Jan 2026 06:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 216/221]
 fs/bcachefs/data/ec/init.c:240:5-8: Unneeded variable: "ret". Return "0" on
 line 268
Message-ID: <202601190604.NAfVhUHM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   f2527e9c99550c4ae64b6dd01fc9d390c1995587
commit: bde39b90107558a6e5c84934716bf171ced1cef5 [216/221] bcachefs: Split up data/ec.c
config: riscv-randconfig-r052-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190604.NAfVhUHM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190604.NAfVhUHM-lkp@intel.com/

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
