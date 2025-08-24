Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D21ADC7E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756007489; cv=none; b=d/mPd6aatR6i7BaqMoy/d9Ll39vfBom9czSH3SB0Gr7I+XrPA8Yt/ECusfI6u/nwgfpvNvPqBdFC8xaEzEPxc0oWu3rMxwFUPaeWnyk72Mr6wLNLcZWFhYrIbSQsg4hK67AZjs7wJnK/2w3eFb5L8WiaUJF2434StsYBhDDKA6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756007489; c=relaxed/simple;
	bh=hfAjgHhudMWowT1EuPcTDKs01+Nu+jPJBEQnKN+2gtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFnM/EcwfwkXfKo7RrgCth0A9W5R8BZMMqgyFrqZVAvgSkT4MMi0vV6mgWPzyrysy3gL579oG1hlTsZoTZ75nXCGUOD7O1B3EXCThsT/gD924Fp36gdPipQv4rBBV/y34333udoMftnsuE6A+2IjlQtx2CQzl56Mn6mBoKYTykY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCHH5rQ4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCHH5rQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756007486; x=1787543486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hfAjgHhudMWowT1EuPcTDKs01+Nu+jPJBEQnKN+2gtE=;
  b=WCHH5rQ4tvimWWUExqWWYt9Cl+Xc2Oj3l1IrlOhoE93T3626QphzUO/s
   U/tQ2v/ZsWmTYugwrMUaCx0bU3YAt8JZNQXsifG8ZKv4JjCL3ZOvtUeD2
   p0xuJJkhb0dIfqKjI60BTfj17jxgKCyMIRYf4fRkkJ4MiBEwnj0BafupF
   vGXIP8jpH9r9yA54q7uCSv1B+mD89eXhxuJzcsjLYCwLxU3nxYKg/CQ4O
   Mpn+wXIvjKCUCd2jq5py50+eTdirjdjARX734KePwSPH/aXHHi8jI5aaJ
   wsm2nJLEB2tNHPmBM2EajDuoCX+jqK5G+d/R3R+I6fkXEXcRw/twKN6SR
   w==;
X-CSE-ConnectionGUID: GhSuEV/URSWHKp5OWevJBA==
X-CSE-MsgGUID: aPgsWrFKTJ2w3C1iGHo8gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="80852646"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="80852646"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 20:51:26 -0700
X-CSE-ConnectionGUID: BSKG7wvOTwuozXJWwWscWw==
X-CSE-MsgGUID: Y+78fbWRS0CDhPXPpTaGyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168916099"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2025 20:51:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq1lJ-000MkB-2X;
	Sun, 24 Aug 2025 03:51:21 +0000
Date: Sun, 24 Aug 2025 11:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 331/331] fs/bcachefs/rebalance.c:497:17:
 error: too few arguments to function 'bch2_get_update_rebalance_opts'
Message-ID: <202508241127.FsrVTfof-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9ee5d987e88c288fc2a140d7d32cb64b38c05bfe
commit: 9ee5d987e88c288fc2a140d7d32cb64b38c05bfe [331/331] bcachefs: do_rebalance_scan() now responsible for indirect extents
config: i386-buildonly-randconfig-004-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241127.FsrVTfof-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241127.FsrVTfof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241127.FsrVTfof-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/rebalance.c:6:
   fs/bcachefs/rebalance.c: In function 'do_rebalance_scan_indirect':
>> fs/bcachefs/rebalance.c:497:17: error: too few arguments to function 'bch2_get_update_rebalance_opts'
     497 |                 bch2_get_update_rebalance_opts(trans, opts, &iter, k);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:798:18: note: in definition of macro 'lockrestart_do'
     798 |         _ret2 = (_do);                                                  \
         |                  ^~~
   fs/bcachefs/btree_iter.h:862:9: note: in expansion of macro 'for_each_btree_key_max_continue'
     862 |         for_each_btree_key_max_continue(_trans, _iter, _end, _flags, _k, _do);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:866:9: note: in expansion of macro 'for_each_btree_key_max'
     866 |         for_each_btree_key_max(_trans, _iter, _btree_id, _start, SPOS_MAX, _flags, _k, _do)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/rebalance.c:493:19: note: in expansion of macro 'for_each_btree_key'
     493 |         int ret = for_each_btree_key(trans, iter, BTREE_ID_reflink,
         |                   ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/rebalance.c:191:5: note: declared here
     191 | int bch2_get_update_rebalance_opts(struct btree_trans *trans,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bch2_get_update_rebalance_opts +497 fs/bcachefs/rebalance.c

   484	
   485	static int do_rebalance_scan_indirect(struct btree_trans *trans,
   486					      struct bkey_s_c_reflink_p p,
   487					      struct bch_inode_opts *opts)
   488	{
   489		u64 idx = REFLINK_P_IDX(p.v) - le32_to_cpu(p.v->front_pad);
   490		u64 end = REFLINK_P_IDX(p.v) + p.k->size + le32_to_cpu(p.v->back_pad);
   491		u32 restart_count = trans->restart_count;
   492	
   493		int ret = for_each_btree_key(trans, iter, BTREE_ID_reflink,
   494					     POS(0, idx), BTREE_ITER_not_extents, k, ({
   495			if (bpos_ge(bkey_start_pos(k.k), POS(0, end)))
   496				break;
 > 497			bch2_get_update_rebalance_opts(trans, opts, &iter, k);
   498		}));
   499		if (ret)
   500			return ret;
   501	
   502		/* suppress trans_was_restarted() check */
   503		trans->restart_count = restart_count;
   504		return 0;
   505	}
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
