Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721976026
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 19:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761507568; cv=none; b=EEwI5k1I+qCMkaM+K/Sx2KvpEknGdzC/0nYXoGFuL9TfYSaSH2vPoGl7g2fpVva7hKmHGfOKZ0rqFzEXuqb6DGjFYUWvGtqGb02g6CbCf7nozijTztSa2BKy1HFMW8YxZ5OggEbOSjd/fzEJ7jL5up2vfQmU7BsxUT+nV/zbFPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761507568; c=relaxed/simple;
	bh=M2Y3fJAYj69xEDI1H/ATVTFGa30667CIZz8rbV0YLgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UopF0eKW7UsvYeaiioC7KLfdHB/lRTjx9rajj50aVLv24ccc0OubwdvP9Dyr63Ehqvc2wbe3y0t8HaN/AIwuMCLrtSa2ZJEpmwnNtt1gCFXw4eVTOYlta9w9LB52qKep59rg3WCnhUBGV2uZMJfLSiY59wvIC0KHthtnfCXbQLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tj4FmBnz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tj4FmBnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761507567; x=1793043567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2Y3fJAYj69xEDI1H/ATVTFGa30667CIZz8rbV0YLgI=;
  b=Tj4FmBnz4n0dswV0Z44HhxCpvZOyT5sAcCquP5Oi9hUeEBdMxhzm30wZ
   IBM1YytM+bWeOmA9V3DbpulI1O3FYLAY+TXJNBzJ4DNN43JfMM/aB7pyR
   RUbdKeAcPH9hVd3UGn+W2RHDWIJrku+kMx9IS84MiwH9u7llpXRFD34iA
   cF2mtqiCKG1osCZOnZh6KRuv+bj8rGXKWdQYlmXk5rjNTv4dLV+xhH3eN
   Sc6bDFt6WtkuoQ1YpKRX6c4Rmw4hAElloEUaJglMGyNMl3ci07OU4O1+2
   prmedJNYaoU6nbKR7li4r/lpLbjclHfdQVsqknIKQ/T/4cfhCX3Q6KKfG
   A==;
X-CSE-ConnectionGUID: vkYf8LMwQN2hYhbuUGBVBw==
X-CSE-MsgGUID: C+X0HA1wRr65fGUebslAZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63503114"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="63503114"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 12:39:26 -0700
X-CSE-ConnectionGUID: TXgYOCnfQUuzLP5nKy9/PQ==
X-CSE-MsgGUID: X4crOq1mRpSYMz4oZx7q4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184053916"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2025 12:39:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD6aI-000GJp-2Y;
	Sun, 26 Oct 2025 19:39:22 +0000
Date: Mon, 27 Oct 2025 03:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 460/692]
 fs/bcachefs/btree/journal_overlay.c:83:22: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202510270318.AUpz7ThY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a4abf4352bcdf7adc9cf5605c5035f6441ed7576
commit: e76ee9c357ee7790d44c9cbdb00466d23aca892c [460/692] bcachefs: btree_journal_iter.c -> btree/journal_overlay.c
config: powerpc-randconfig-r112-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270318.AUpz7ThY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270318.AUpz7ThY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270318.AUpz7ThY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree/journal_overlay.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1325:38: sparse: sparse: array of flexible structures
>> fs/bcachefs/btree/journal_overlay.c:83:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/journal_overlay.c:83:22: sparse:    struct journal_key_range_overwritten [noderef] __rcu *
   fs/bcachefs/btree/journal_overlay.c:83:22: sparse:    struct journal_key_range_overwritten *
>> fs/bcachefs/btree/journal_overlay.c:83:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/journal_overlay.c:83:22: sparse:    struct journal_key_range_overwritten [noderef] __rcu *
   fs/bcachefs/btree/journal_overlay.c:83:22: sparse:    struct journal_key_range_overwritten *
>> fs/bcachefs/btree/journal_overlay.c:83:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/journal_overlay.c:83:22: sparse:    struct journal_key_range_overwritten [noderef] __rcu *
   fs/bcachefs/btree/journal_overlay.c:83:22: sparse:    struct journal_key_range_overwritten *

vim +83 fs/bcachefs/btree/journal_overlay.c

597554cb9b31d8 fs/bcachefs/btree_journal_iter.c Kent Overstreet 2025-08-13  80  
597554cb9b31d8 fs/bcachefs/btree_journal_iter.c Kent Overstreet 2025-08-13  81  static inline struct journal_key_range_overwritten *overwrite_range(struct journal_keys *keys, u32 idx)
597554cb9b31d8 fs/bcachefs/btree_journal_iter.c Kent Overstreet 2025-08-13  82  {
597554cb9b31d8 fs/bcachefs/btree_journal_iter.c Kent Overstreet 2025-08-13 @83  	return idx ? rcu_dereference(keys->overwrites.data) + idx : NULL;
597554cb9b31d8 fs/bcachefs/btree_journal_iter.c Kent Overstreet 2025-08-13  84  }
597554cb9b31d8 fs/bcachefs/btree_journal_iter.c Kent Overstreet 2025-08-13  85  

:::::: The code at line 83 was first introduced by commit
:::::: 597554cb9b31d8d2073776de3dc9c34d3a7d36bf bcachefs: pointer compression for journal_key_range_overwritten

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
