Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E525EF9C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768649216; cv=none; b=NyxexAgjV4mJ6p/s6sj09SdUHyKmQ0ZhYmuNSRIJjBRuptfkCigOy4ECPQz3rV+ZJdGdHqgLejlbir49iq2RJuVWRABYTFGRs7tY2jO49RZHgTS/HmBLhgEj9U4hvWva319Rl0k+u+MsOVGmj4duUxLrMO51hpapAx0H9mqwNiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768649216; c=relaxed/simple;
	bh=8zYYf5Oi7vcLAw2vFw24gZ1AMT3wKi/E++1tKXH/TO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FQMi6+3W2GhwgFJ6jazwS1pbwdpgaqtI2i+xbp9DKLYriL/aQ3i91mw4veeUG6mEB23dKU80tKwpNgpJduLzSkw+lBOt8+JetsF1TL4dY7KyVBiz4xorXwx/z2Tal+s+rhCwQzbfH3gfU0gfFO0ukY/snhnA+ggNFhmrJ9S9dVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPrjYJ5+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPrjYJ5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768649215; x=1800185215;
  h=date:from:to:cc:subject:message-id;
  bh=8zYYf5Oi7vcLAw2vFw24gZ1AMT3wKi/E++1tKXH/TO8=;
  b=VPrjYJ5+lvKBvpGnOZs1x7jkxn1M6eXyrKJkCcSFQ+95Hpt+XrnNcn7D
   2hKIA4s9q1BmmCdXkg1EDT2mCQjONkMP7QHPyMAe3kB+jFsj4oyC7XNqf
   8I1M7Ci4dg5GEcSSLK7iiXKCYIqWtsefxuNCXp6TE4CFHptIt+w5y492d
   8EY0C/5jXltW7a3YR/+jwRYK9tpl3ZFegw+M7LutU2eJAmH9TjN4KZdzw
   3ajQtcBbqltjKf9/cu2PjYJn0SjgZ31IFAEJHIM4tn+HZipWZJrL3Y2z3
   KnnjGGgpgreEvts3bVlyzvqCZtWZgLgQR1JNyNH6fBZ2fLktkaQhPrhbs
   A==;
X-CSE-ConnectionGUID: tl42ISIcQ+CN14RUlADDYw==
X-CSE-MsgGUID: I107LBxbR0O3hWYkJc62Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87516969"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="87516969"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 03:26:54 -0800
X-CSE-ConnectionGUID: BFExh/D/Rl+qp6/or5edSA==
X-CSE-MsgGUID: dW+RVRLbS7KnEXlpLlr/9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205357051"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2026 03:26:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh4SB-00000000Lnu-0ug3;
	Sat, 17 Jan 2026 11:26:51 +0000
Date: Sat, 17 Jan 2026 19:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 150/215]
 fs/bcachefs/data/migrate.c:247:1: warning: the frame size of 1288 bytes is
 larger than 1280 bytes
Message-ID: <202601171926.EwzHThWx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   9e783badbd805a794a4237d27f70360ffc7cca54
commit: 88ed14c40e7342e3f87b5171c539ef7667c90376 [150/215] bcachefs: bch2_dev_data_drop_by_backpointers() uses backpointer_scan_for_each()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260117/202601171926.EwzHThWx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171926.EwzHThWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171926.EwzHThWx-lkp@intel.com/

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
