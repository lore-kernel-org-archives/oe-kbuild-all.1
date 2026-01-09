Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5ED35C19C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767965464; cv=none; b=KhXJ/ENH+EON0cScLjyj6bwcf33boT3Q51OaIzJXgXz0Hs0C3k+xW2u0jHOX6x8uH4TpdMUYmWDpqJEkdNRERSD6seVWDYUwtJLnsJqq76oMJ6p2vnLZNFqhpSVb9rakI9CdIcVfL1r/zir3F50dfU3FGZnKV4iwLsaG4CSBnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767965464; c=relaxed/simple;
	bh=JjsStyDmSbQwGGSAH3hFVjEM3tFf4eO3mZ3bNy7hMrw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i8O8nUtmPVJEHaM1agC4E5JnAsJlbSRMVEMD8I3pJLEnnwe7PZDUWnOjzx/XUS0/cZrHxXjFP+0htPxbVLc2oB2rIE6XdLgQs06aH2UBupLSlIHhp4A/CPQLJPO7Fm0oK9sua5t/ZM0kxdgNZOdeoWtR4oKOwDe2KNnDkyiftLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnrpwhBX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnrpwhBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767965462; x=1799501462;
  h=date:from:to:cc:subject:message-id;
  bh=JjsStyDmSbQwGGSAH3hFVjEM3tFf4eO3mZ3bNy7hMrw=;
  b=MnrpwhBXrlUAhHO5sak2KkzTMS7l0qrIIrUeYt5ptJCifMFXsEfhG/Xv
   YcjF4+G8LU2tmxopcUyrarx3yeP9qevas3604d4bseUnisD4lHSjNkc+N
   KsEIe9VppvxoSsMfuxqnRZbm5j+d8vQqxrjqWzk15a6mj3jGShxAO4rlQ
   Mcg7mCTZYlTY4u3jVmGF6AdvNil91d05wLi38gU1JquJeHCShLJgnWKu0
   QJfgmtF7CpFM1zT7Nqp8MAY851vXYNnQchAckuDtanH/gs5Zn34TqWFC6
   b04QhFArfRaxFy4RV372qEGHNybDD1Z4l5W/WyrwVhYqJHZPBPj5TLY8X
   g==;
X-CSE-ConnectionGUID: VgtOoGR2TIiMG5rXBxQj6w==
X-CSE-MsgGUID: zU5KQJVAQquDroqNOvJpvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69249040"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69249040"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 05:31:02 -0800
X-CSE-ConnectionGUID: 2syAU2TURaepzaTWafeY/g==
X-CSE-MsgGUID: +zbdbO1VTLSJVjseMhNWRg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2026 05:31:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veCZu-000000007LM-34RD;
	Fri, 09 Jan 2026 13:30:58 +0000
Date: Fri, 09 Jan 2026 21:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 145/168]
 fs/bcachefs/data/reconcile.c:1912:3: error: cannot jump from this goto
 statement to its label
Message-ID: <202601092109.2kiT8txx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   fd7c41ee93b085f2e5d11fb263fe2c291fcb90ed
commit: 6efb894685bad7b9d57fc51a8bfef4707572382f [145/168] bcachefs: Multithreaded processing of reconcile_phys
config: mips-randconfig-r073-20260109 (https://download.01.org/0day-ci/archive/20260109/202601092109.2kiT8txx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601092109.2kiT8txx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601092109.2kiT8txx-lkp@intel.com/

Note: the koverstreet-bcachefs/master HEAD fd7c41ee93b085f2e5d11fb263fe2c291fcb90ed builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/bcachefs/data/reconcile.c:1912:3: error: cannot jump from this goto statement to its label
    1912 |                 goto out;
         |                 ^
   fs/bcachefs/data/reconcile.c:1917:24: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1917 |         struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
         |                               ^
   fs/bcachefs/data/reconcile.c:1915:30: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1915 |         CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
         |                                     ^
   1 error generated.


vim +1912 fs/bcachefs/data/reconcile.c

  1895	
  1896	static CLOSURE_CALLBACK(do_reconcile_phys_thread)
  1897	{
  1898		closure_type(thr, reconcile_phys_thr, cl);
  1899		struct bch_fs *c = thr->c;
  1900	
  1901		struct moving_context ctxt __cleanup(bch2_moving_ctxt_exit);
  1902		bch2_moving_ctxt_init(&ctxt, c, NULL, &thr->stats,
  1903				      writepoint_ptr(&c->allocator.reconcile_write_point),
  1904				      true);
  1905	
  1906		struct btree_trans *trans = ctxt.trans;
  1907	
  1908		CLASS(darray_reconcile_work, work)();
  1909		darray_make_room(&work, REBALANCE_WORK_BUF_NR);
  1910		if (!work.size) {
  1911			bch_err(c, "%s: unable to allocate memory", __func__);
> 1912			goto out;
  1913		}
  1914	
  1915		CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
  1916	
  1917		struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
  1918		wb_maybe_flush_init(&last_flushed);
  1919	
  1920		struct bbpos work_pos = BBPOS(thr->btree, POS(thr->dev, 0));
  1921	
  1922		while (!bch2_move_ratelimit(&ctxt)) {
  1923			if (!bch2_reconcile_enabled(c))
  1924				break;
  1925	
  1926			bch2_trans_begin(trans);
  1927	
  1928			struct bkey_s_c k = next_reconcile_entry(trans, &work, thr->btree, &work_pos.pos);
  1929			if (bkey_err(k) ||
  1930			    !k.k ||
  1931			    k.k->p.inode != thr->dev)
  1932				break;
  1933	
  1934			int ret = lockrestart_do(trans,
  1935				do_reconcile_extent_phys(&ctxt, &snapshot_io_opts, work_pos, &last_flushed));
  1936			if (ret)
  1937				break;
  1938		}
  1939	out:
  1940		closure_return(cl);
  1941	}
  1942	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
