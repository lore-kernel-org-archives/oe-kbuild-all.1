Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D12D1907
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 05:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789276121; cv=none; b=ZenZDz2MRZhF3YG+CU9qLwjk7R9mPKKBLiSM4HYRGIiW079KEDjOPORpwY1lDYC0GILt1Jle9VFh2Eo+97uKQ8IppyvTbqZTFQEwq4kRuducpPaxbUlVhw9DMv8dTML8i4wvm/rTMwWkF4eH8BDtpuPJ+bHolWvAyVzPVlVKgoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789276121; c=relaxed/simple;
	bh=ygKoP9i6k2/2TJUYUjEATCMzDM5IYyY8ruX+7/LLUqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=REpzl8GwVZ2uFZ9glCtP8f6zfcQWgKJXNme+RRCTEIdanYEGxdeeZoGjZn3flRhjnXKXS0WpZoBnjoVddijGyb4ng2rgZROCmpGvAL5ZT1LGDTfYOCSacSi6DIv0uNuM7Fc8JjciBcb2ibtpprgyjEG0GPJAGq8tFo7j7Yia0wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWt5ndfh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWt5ndfh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789276119; x=1820812119;
  h=date:from:to:cc:subject:message-id;
  bh=ygKoP9i6k2/2TJUYUjEATCMzDM5IYyY8ruX+7/LLUqc=;
  b=TWt5ndfhno8IdAwJWtHvZWF79SzArYD5x7uV0cgZ1Thuz4m/aihKAuSl
   1EPEuBqunX2x8zgWXcWXGz9QpFWbRYHkiy3LaA6Rkxqn45ax20efiiZOI
   i1Qq+ceCn5GPPeycYH9m0EDM35Or7lC7vNUjBamPQ+P38pWAcZIDuJeTQ
   fW0VepPSRhQ20H/ryx9YLH/MGfTVihW5sWhxHmN8J3Ya1yfK5EmQNl3IP
   I7tYn9+euPJjPHj9d0eJr0pRnA+2oLmD00K/puXD0TIJnzCrjJZPy1Cr2
   /WKN15R7nEYLlqYvjKlX3O67n2fjXY2lKkTinAN5gVObGjWSlAEyH7pqN
   g==;
X-CSE-ConnectionGUID: rPhNBIXAS6uXJr6TX0mJ9g==
X-CSE-MsgGUID: Ap7jDM7VT6Whpj+y7yU52w==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="100008628"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="100008628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 22:08:39 -0700
X-CSE-ConnectionGUID: F65IfLRKTWqmqH4E3SCn+g==
X-CSE-MsgGUID: bzGj65wPRmGy55VUg6Btmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="270531054"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 12 Sep 2026 22:08:37 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5cSA-000000001Wp-3ZkB;
	Sun, 13 Sep 2026 05:08:34 +0000
Date: Sun, 13 Sep 2026 07:08:23 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 57/332]
 fs/bcachefs/snapshots/snapshot.c:378:7: warning: variable 'lock_dropped' set
 but not used
Message-ID: <202609130706.MIJr23Rk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 54998105f6ef5d0c64d7986fd6f670d2b4f3bef4 [57/332] bcachefs: Drop locks for printbuf allocation in snapshot_get_print()
config: xtensa-randconfig-r073-20260913 (https://download.01.org/0day-ci/archive/20260913/202609130706.MIJr23Rk-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130706.MIJr23Rk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130706.MIJr23Rk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/snapshots/snapshot.c: In function 'snapshot_get_print':
>> fs/bcachefs/snapshots/snapshot.c:378:7: warning: variable 'lock_dropped' set but not used [-Wunused-but-set-variable]
     378 |  bool lock_dropped = false;
         |       ^~~~~~~~~~~~


vim +/lock_dropped +378 fs/bcachefs/snapshots/snapshot.c

   330	
   331	static int snapshot_get_print(struct printbuf *out, struct btree_trans *trans, u32 id)
   332	{
   333		prt_printf(out, "%u \t", id);
   334	
   335		struct bch_snapshot s;
   336		int ret = bch2_snapshot_lookup(trans, id, &s);
   337		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   338			return ret;
   339	
   340		if (ret) {
   341			prt_str(out, bch2_err_str(ret));
   342		} else {
   343			if (BCH_SNAPSHOT_DELETED(&s))
   344				prt_str(out, "deleted ");
   345			if (BCH_SNAPSHOT_NO_KEYS(&s))
   346				prt_str(out, "no_keys ");
   347			if (BCH_SNAPSHOT_WILL_DELETE(&s))
   348				prt_str(out, "will_delete ");
   349			if (BCH_SNAPSHOT_SUBVOL(&s))
   350				prt_printf(out, "subvol %u", le32_to_cpu(s.subvol));
   351	
   352			prt_tab(out);
   353	
   354			if (s.subvol) {
   355				struct bch_subvolume subvol;
   356				ret = bch2_subvolume_get(trans, le32_to_cpu(s.subvol), false, &subvol);
   357				if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   358					return ret;
   359	
   360				if (ret)
   361					prt_str(out, bch2_err_str(ret));
   362				else
   363					try(bch2_inum_to_path(trans, (subvol_inum)
   364						{ le32_to_cpu(s.subvol), le64_to_cpu(subvol.inode) }, out));
   365			}
   366	
   367			prt_tab(out);
   368	
   369			u64 v[1] = { 0 };
   370			try(bch2_fs_accounting_read_key2(trans, v, snapshot, id));
   371	
   372			prt_human_readable_u64(out, v[0] << 9);
   373			prt_tab_rjust(out);
   374		}
   375	
   376		prt_newline(out);
   377	
 > 378		bool lock_dropped = false;
   379		allocate_dropping_locks_norelock(trans, lock_dropped,
   380				!bch2_printbuf_make_room_gfp(out, 1024, _gfp));
   381		return 0;
   382	}
   383	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
