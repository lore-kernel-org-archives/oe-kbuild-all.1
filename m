Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCAD34D909
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773483976; cv=none; b=N60/6xtqfJ41CK1h4I5OMcqEIph86p2XdKEfileelqJmIeJWwzNtXFZRsxolKIHoFzpwenRKFnMNkFXMzlAv9AKgn8IAq17DqM+h6MVnswtJ+nZE1kJ5YZjX4nwUAYHQd3/CW+tI6QT9ur9OGqMuitUix7Sgm11SISjRoSE9zVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773483976; c=relaxed/simple;
	bh=kXBYEKFAPHDn+5Rhh8GXcRBvoZ0GYs3C9QbTJBSqu4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NvDfiEiQ3P9+cqpr7r9WTGcMM4T+HLWDwDQVVOVXhylg1seOdf4vse12XUdd4DllNVvUjgjQa3c7sQ1NdumJ/ux8uv1YPBxk5eKU1OtF3F8qwKJO1MpZk7IB6Hh82tJAuYVdWYpaZipnLAj6T51c81GE20fStvebt5DG2RtGfDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJ+jABAe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJ+jABAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773483974; x=1805019974;
  h=date:from:to:cc:subject:message-id;
  bh=kXBYEKFAPHDn+5Rhh8GXcRBvoZ0GYs3C9QbTJBSqu4I=;
  b=KJ+jABAeMepoEClfrK1aF5IVItnviZmE44guY816pr4ctRAOJ4ebnTsg
   PCPyhTOwPKfXKJJhhPwzlx+uMtIymyuuS/PVasqFsAuU7wix3L2lKx60I
   cYaSeAXl8g++mk2AVgKGqjXENTmRmh4ks8K1RcbV3cm2q+qCZSbc5X6UC
   vuR44PQcYTLB7Q0VoImdqORIzj/RywohnuKTZihdo0gl5w/Fs4GL4eOjU
   fY6GRhJI4N5zkgDd5c6Sl1GEIQHqLG3bwGXPmIz610JhbyNxbX8UKXpWa
   34NabtSHZRtdrJLOWXf4hGF4VkxmvBxTXrSKgaIYfdFIYJRf3hZ5Dx+6I
   A==;
X-CSE-ConnectionGUID: obyYRa9XRX6xOkpdKzv6Yg==
X-CSE-MsgGUID: vcdg4/baSwG6uj0UYntLew==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="85279524"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="85279524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 03:26:14 -0700
X-CSE-ConnectionGUID: QFMwS8MuRDK94mIpvcNo5w==
X-CSE-MsgGUID: +FKdi7twRe+AUXQfRwVGjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="221623020"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2026 03:26:12 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1MC9-000000004zP-1TpR;
	Sat, 14 Mar 2026 10:26:09 +0000
Date: Sat, 14 Mar 2026 18:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 150/332]
 fs/bcachefs/data/migrate.c:247:1: warning: the frame size of 1288 bytes is
 larger than 1280 bytes
Message-ID: <202603141817.APrhgIoc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 88ed14c40e7342e3f87b5171c539ef7667c90376 [150/332] bcachefs: bch2_dev_data_drop_by_backpointers() uses backpointer_scan_for_each()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260314/202603141817.APrhgIoc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141817.APrhgIoc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141817.APrhgIoc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/migrate.c: In function 'bch2_dev_data_drop_by_backpointers':
>> fs/bcachefs/data/migrate.c:247:1: warning: the frame size of 1288 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     247 | }
         | ^


vim +247 fs/bcachefs/data/migrate.c

09fa6c3039d8bb fs/bcachefs/migrate.c      Kent Overstreet 2025-05-03  226  
48ec313e49b184 fs/bcachefs/migrate.c      Kent Overstreet 2025-08-28  227  int bch2_dev_data_drop_by_backpointers(struct bch_fs *c, unsigned dev_idx, unsigned flags,
48ec313e49b184 fs/bcachefs/migrate.c      Kent Overstreet 2025-08-28  228  				       struct printbuf *err)
09fa6c3039d8bb fs/bcachefs/migrate.c      Kent Overstreet 2025-05-03  229  {
a9b8d9823bfe75 fs/bcachefs/migrate.c      Kent Overstreet 2025-07-14  230  	CLASS(btree_trans, trans)(c);
09fa6c3039d8bb fs/bcachefs/migrate.c      Kent Overstreet 2025-05-03  231  
a417a8f59a4808 fs/bcachefs/data/migrate.c Kent Overstreet 2025-10-21  232  	struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
a417a8f59a4808 fs/bcachefs/data/migrate.c Kent Overstreet 2025-10-21  233  	wb_maybe_flush_init(&last_flushed);
09fa6c3039d8bb fs/bcachefs/migrate.c      Kent Overstreet 2025-05-03  234  
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  235  	struct progress_indicator progress;
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  236  	bch2_progress_init(&progress, "dropping device data", c,
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  237  			   BIT(BTREE_ID_backpointers), 0);
09fa6c3039d8bb fs/bcachefs/migrate.c      Kent Overstreet 2025-05-03  238  
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  239  	return bch2_btree_write_buffer_flush_sync(trans) ?:
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  240  		backpointer_scan_for_each(trans, iter, POS(dev_idx, 0), POS(dev_idx, U64_MAX),
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  241  					  &last_flushed, &progress, bp, ({
a417a8f59a4808 fs/bcachefs/data/migrate.c Kent Overstreet 2025-10-21  242  		wb_maybe_flush_inc(&last_flushed);
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  243  		CLASS(disk_reservation, res)(c);
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  244  		data_drop_bp(trans, dev_idx, bp, &last_flushed, flags, err) ?:
88ed14c40e7342 fs/bcachefs/data/migrate.c Kent Overstreet 2025-11-30  245  		bch2_trans_commit(trans, &res.r, NULL, BCH_TRANS_COMMIT_no_enospc);
09fa6c3039d8bb fs/bcachefs/migrate.c      Kent Overstreet 2025-05-03  246  	}));
09fa6c3039d8bb fs/bcachefs/migrate.c      Kent Overstreet 2025-05-03 @247  }
09fa6c3039d8bb fs/bcachefs/migrate.c      Kent Overstreet 2025-05-03  248  

:::::: The code at line 247 was first introduced by commit
:::::: 09fa6c3039d8bb22351ad071ea4656dd4f331d18 bcachefs: bch2_dev_data_drop_by_backpointers()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
