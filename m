Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01FD3A1E7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767552565; cv=none; b=e2stISxIV+DOStCgVkJT3parH8U3KT01gxFgB1aRtrUBflWNrfh2gvX15WNjcnokjnnWqI6x1xIc/ae/3DIl2nDyayjBIYMZhMCryJZEzSNWaEdjPOJiYG+hDX1DcLjO4+nNrwpSqWzrn2Q/9y3MIk2rgikrBpnhDHAzOh4jo4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767552565; c=relaxed/simple;
	bh=L+lF5TkUCy6eiQVkvJ4ldPW/kr6y1z61HfWM6FmqfX0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j50jB1vvH5AK14gLMaa1kYKBLwWBRR5/2sfwmFbDjjYhI9O18d8WCHUU56pWUZsGtWsJgTj4xhR4JQbSbC3HOnkl7lbvZBgzu8m3k3xaKZCEIMcqP5ujFAdpEeCkZ2IaSiAl3AS6J8SHvqnokoBCUge0+90+hFOZ87Bq73aHJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsvSRlM2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsvSRlM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767552564; x=1799088564;
  h=date:from:to:cc:subject:message-id;
  bh=L+lF5TkUCy6eiQVkvJ4ldPW/kr6y1z61HfWM6FmqfX0=;
  b=BsvSRlM2BPDZ8HuR+oIuOWaJIMhNqip8fXRF9o/1kTPjDxFTCjO11iVr
   jrrcFNDlcebrPL5tjIxlZ7D9M6gz0ZAk0JSEJ8gwGKAwhSBGRrqKHEq2q
   gcStrrxqxFmu89Xya+EpLH3q/C2zWz/BZKg4sz8B96EObTwrx8L+OSQGJ
   uSqzhhUhFRpLwU6ZzEfv+IhHxBe56ic7hDi7Mbh4ISl33Z8ioHYQ6apKu
   LynuBhRSSn5fQtEQMR9vCK8AoFOMeRfEEkYguindENyFacOR9/1lLw6Ky
   fQ56xzeIFnrtlaeTdDII6/zXcD6h08YuVMDeHWxKs3Fv0EPXnFVbon7SQ
   w==;
X-CSE-ConnectionGUID: 8HKRTB6sTPyOfRYxemtJag==
X-CSE-MsgGUID: aUCSkFU/T06Y+bdRpZVN2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68870735"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68870735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 10:49:23 -0800
X-CSE-ConnectionGUID: n2xcL9OAR6WCgRUmlqFxhQ==
X-CSE-MsgGUID: ukOgVLvFSB6soCiZu0Pttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="202262462"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jan 2026 10:49:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcTAF-000000000jV-2VK8;
	Sun, 04 Jan 2026 18:49:19 +0000
Date: Mon, 05 Jan 2026 02:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 97/115] fs/bcachefs/data/ec.c:2363:5-8:
 Unneeded variable: "ret". Return "0" on line 2391
Message-ID: <202601050206.sSJaKVXG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   c8443102a129f8cf440d2e0e02ee631753f16327
commit: bc72d0fdd27601422a078536a6b53ddb8caacb4e [97/115] bcachefs: bcachefs_metadata_version_bucket_stripe_index
config: sparc-randconfig-r061-20260104 (https://download.01.org/0day-ci/archive/20260105/202601050206.sSJaKVXG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050206.sSJaKVXG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/ec.c:2363:5-8: Unneeded variable: "ret". Return "0" on line 2391

vim +2363 fs/bcachefs/data/ec.c

  2353	
  2354	static int check_stripe_refs_one(struct btree_trans *trans,
  2355					 struct bkey_s_c k,
  2356					 struct wb_maybe_flush *last_flushed)
  2357	{
  2358		if (k.k->type != KEY_TYPE_stripe)
  2359			return 0;
  2360	
  2361		struct bch_fs *c = trans->c;
  2362		const struct bch_stripe *s = bkey_s_c_to_stripe(k).v;
> 2363		int ret = 0;
  2364	
  2365		u64 lru_idx = stripe_lru_pos(s);
  2366		if (lru_idx)
  2367			try(bch2_lru_check_set(trans, BCH_LRU_STRIPE_FRAGMENTATION,
  2368					       k.k->p.offset, lru_idx, k, last_flushed));
  2369	
  2370		for (unsigned i = 0; i < s->nr_blocks; i++) {
  2371			const struct bch_extent_ptr *ptr = s->ptrs + i;
  2372			CLASS(bch2_dev_tryget_noerror, ca)(c, ptr->dev);
  2373			if (!ca)
  2374				continue;
  2375	
  2376			struct bpos bucket = PTR_BUCKET_POS(ca, ptr);
  2377	
  2378			CLASS(btree_iter, iter)(trans, BTREE_ID_bucket_to_stripe,
  2379						POS(bucket_to_u64(bucket), k.k->p.offset), 0);
  2380			struct bkey_s_c ref = bkey_try(bch2_btree_iter_peek_slot(&iter));
  2381	
  2382			CLASS(printbuf, buf)();
  2383	
  2384			if (fsck_err_on(ref.k->type != KEY_TYPE_set,
  2385					trans, stripe_to_missing_bucket_ref,
  2386					"stripe block %u missing bucket ref\n%s",
  2387					i, (bch2_bkey_val_to_text(&buf, c, k), buf.buf)))
  2388				try(bucket_stripe_ref_mod(trans, bucket, k.k->p.offset, true));
  2389		}
  2390	fsck_err:
> 2391		return ret;
  2392	}
  2393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
