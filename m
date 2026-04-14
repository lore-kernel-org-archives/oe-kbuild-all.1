Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D9330EF89
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776193988; cv=none; b=EWGFI3z3H8mlsjhnpdmYYYcYhK6dyZCjcaEuTwixi1bDCd5faFabhYd/CpSTcYy6+3hqmMHjRxM3esS3+cdpuamvWRVulFdDnhwhe3R/3OzA8NJ/dcADCOogrkx/lelhFq4sdcLJ4Po6rUXUYTJ2H2AA5voD8l+EjCTbILNML2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776193988; c=relaxed/simple;
	bh=flbC2XUN45YgJe/uaclsw3FY5Gwg0Wm48A8hSSJCvPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JtEyk72ZfhNBZmK+jk2cfha5eDezhV43XIAwBvrfsUL3xMDJ18xzxNDzqoxm9Ao7VEpG662czMsxWOoEkB0d9Xk3KTmCo0I8ZU5imIy+GKDiFTzznGk7YVy084k0WQM0ghxtrrZxmVZNhEj3p579nUyp9HyqTyD6xMtDUh2VFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Owyn1q0j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Owyn1q0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776193985; x=1807729985;
  h=date:from:to:cc:subject:message-id;
  bh=flbC2XUN45YgJe/uaclsw3FY5Gwg0Wm48A8hSSJCvPc=;
  b=Owyn1q0jiicZbIIxk0L8dbWke4WkcSsu3hzrDbWu9nGNcQM4U2XzxFT4
   kVyKB++NgopbLXfehgQhuf6LctdjR87FNPylsnG9gmHBNLQk/NIzuPoF4
   coq4gclZUpQzTunY5Pf8aSOUxTuLttLqcjQi7Enu6fFZvODNlbHpwAMDe
   WngUBtuVjgE/6hsyFUcfpJin30MzptLRL01g/HVVtPAwU3J1SMVAxk8On
   GuYBHbWl7AJFdvDAlx89A8EAgcxkyk0ozGSy8IFhVwwCSbKUVa3hoPBeE
   IIcELRQbwcKo2Ds1dfUbSXfkGzelnAYe6WtTB18MN15gJ0KS8y4g7btGW
   Q==;
X-CSE-ConnectionGUID: MApQ1DbfQmWMXQII4zjwTw==
X-CSE-MsgGUID: fg+2vBBSTguZHqgmoTWHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87470421"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87470421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 12:13:04 -0700
X-CSE-ConnectionGUID: 6W7BQxi9SgOfGwnOLHQO9A==
X-CSE-MsgGUID: bi7X48aDQ+ugC0/pEffZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225887064"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Apr 2026 12:13:04 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCjC1-000000001mb-2HDK;
	Tue, 14 Apr 2026 19:13:01 +0000
Date: Wed, 15 Apr 2026 03:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jul Lang <jullanggit@proton.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1073 38/42]
 fs/bcachefs/alloc/buckets.c:959:1: warning: the frame size of 1336 bytes is
 larger than 1024 bytes
Message-ID: <202604150342.iSwqMUzK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   b8c6a77e872499b3d87083a1b4b479a9e4be2f5d
commit: 37541c231786a29ba46ae1cec2e462b0be4edb41 [38/42] bcachefs: update reconcile-only backpointer flags in place
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260415/202604150342.iSwqMUzK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150342.iSwqMUzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150342.iSwqMUzK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/buckets.c: In function 'bch2_trigger_extent_same_backpointers.constprop':
>> fs/bcachefs/alloc/buckets.c:959:1: warning: the frame size of 1336 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     959 | }
         | ^


vim +959 fs/bcachefs/alloc/buckets.c

   880	
   881	static int bch2_trigger_extent_same_backpointers(struct btree_trans *trans,
   882							 enum btree_id btree,
   883							 unsigned level,
   884							 struct bkey_s_c old,
   885							 struct bkey_s new,
   886							 bool *handled)
   887	{
   888		struct bch_fs *c = trans->c;
   889		struct bkey_i_backpointer old_bp[BCH_REPLICAS_MAX * 2];
   890		struct bkey_i_backpointer new_bp[BCH_REPLICAS_MAX * 2];
   891		struct bkey_ptrs_c ptrs;
   892		const union bch_extent_entry *entry;
   893		struct extent_ptr_decoded p;
   894		unsigned nr_old = 0, nr_new = 0;
   895		unsigned i;
   896	
   897		*handled = false;
   898		if (level)
   899			return 0;
   900	
   901		/*
   902		 * Reconcile-only updates do not move the extent, they only toggle the
   903		 * phys-work flag that is cached in rotational-data backpointers.  Do
   904		 * not delete+reinsert those backpointers through the write buffer when
   905		 * the key itself is unchanged: update the existing entry in place and
   906		 * adjust the reconcile_work_phys bit separately.
   907		 */
   908		ptrs = bch2_bkey_ptrs_c(old);
   909		bkey_for_each_ptr_decode(old.k, ptrs, p, entry) {
   910			BUG_ON(nr_old == ARRAY_SIZE(old_bp));
   911			bch2_extent_ptr_to_bp(c, btree, level, old, p, entry, &old_bp[nr_old++]);
   912		}
   913	
   914		ptrs = bch2_bkey_ptrs_c(new.s_c);
   915		bkey_for_each_ptr_decode(new.k, ptrs, p, entry) {
   916			BUG_ON(nr_new == ARRAY_SIZE(new_bp));
   917			bch2_extent_ptr_to_bp(c, btree, level, new.s_c, p, entry, &new_bp[nr_new++]);
   918		}
   919	
   920		if (nr_old != nr_new)
   921			return 0;
   922	
   923		for (i = 0; i < nr_old; i++) {
   924			struct bch_backpointer old_v = old_bp[i].v;
   925			struct bch_backpointer new_v = new_bp[i].v;
   926	
   927			SET_BACKPOINTER_RECONCILE_PHYS(&old_v, 0);
   928			SET_BACKPOINTER_RECONCILE_PHYS(&new_v, 0);
   929	
   930			if (!bpos_eq(old_bp[i].k.p, new_bp[i].k.p) ||
   931			    memcmp(&old_v, &new_v, sizeof(old_v)))
   932				return 0;
   933		}
   934	
   935		for (i = 0; i < nr_old; i++) {
   936			unsigned old_phys = BACKPOINTER_RECONCILE_PHYS(&old_bp[i].v);
   937			unsigned new_phys = BACKPOINTER_RECONCILE_PHYS(&new_bp[i].v);
   938	
   939			if (!old_phys && !new_phys)
   940				continue;
   941	
   942			if (old_phys)
   943				try(bch2_btree_bit_mod_buffered(trans,
   944						reconcile_work_phys_btree[old_phys],
   945						old_bp[i].k.p, false));
   946	
   947			if (new_phys)
   948				try(bch2_btree_bit_mod_buffered(trans,
   949						reconcile_work_phys_btree[new_phys],
   950						new_bp[i].k.p, true));
   951	
   952			try(bch2_trans_update_buffered(trans,
   953					backpointer_btree(&new_bp[i].v),
   954					&new_bp[i].k_i));
   955		}
   956	
   957		*handled = true;
   958		return 0;
 > 959	}
   960	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
