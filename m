Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A9B326932
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 23:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678365; cv=none; b=ShtnU09tt45nQYF0SGI+Klq2D9XvKUU58jfbtAfpEJj05ZTywa97Oe93uquAzl4BfZhb1QMt2gPJ9i9PF4uZjxyiGWzwUMHeglvxoLwdgR9c9zig2YhsRJX+YUQqgxbb8+JHt2njWwo0YG7UocTEVo41YWSIu28GbmgKFpKMue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678365; c=relaxed/simple;
	bh=fGbUREYaBwOi0UvnKJd9VK2PFmBMCHW44myNsmic/04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a0CJIb3j0JevA2wYn2WPQIbwZ0nQTr+Ccrx/PmGxSWCBE9WZaOQTJfXtCJ46IbHR+Cb70dNMelboHXaoDT42/lgQyUDebQAJzteQP1rsiDjy9fGBchpHakpH0jRVK+ZWksBwPvZzSpER6cbhzUd+ER9OQvmurwhVW8AgD1B43O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQ6bjDNT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQ6bjDNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770678364; x=1802214364;
  h=date:from:to:cc:subject:message-id;
  bh=fGbUREYaBwOi0UvnKJd9VK2PFmBMCHW44myNsmic/04=;
  b=OQ6bjDNTFjTU9AjWoJ9+WKSkZeeqWOvJSFqNgWmEY8qPQveiLzWaxWoC
   2BaH5oIA7Z5Bq/oMfuOSmvUmsZTAA4y/XxqxliDqWCbfYoGlN/ht0A0Bv
   H4Tg57tmXe7mI7+39nzJcki95mRBtINZKZ8zVB1DB6KNrUJDGaak73swz
   mXUotKViKzE0KllrGeKBX1T9gm6Ta1dsTOoK7Y/jFi2eWWJe4hSGwdCBc
   iAeSjmfuzYiJXGF+v6NopVYeQ0Bm+Z8J8jZWpAG29Kqbc2k+8JmSIpyEZ
   leCxEM9fwCZlsP5JMKstPIbUfXONa19esgQnj1W6gma3pR2J8u2bumzOf
   A==;
X-CSE-ConnectionGUID: APTSiaJgQxayvqbbYkBYFw==
X-CSE-MsgGUID: h3p0XRIIQ/irQwapA5XrOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82122174"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82122174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 15:06:03 -0800
X-CSE-ConnectionGUID: Xpfi7ijWSkuz7VgkoEG2wQ==
X-CSE-MsgGUID: Jg7JK43TQXa0Uumjmbr0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211297900"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2026 15:06:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpaKN-00000000oOa-3J8Y;
	Mon, 09 Feb 2026 23:05:59 +0000
Date: Tue, 10 Feb 2026 07:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 463/799]
 fs/bcachefs/btree/bkey_methods.c:50:5-8: Unneeded variable: "ret". Return "0"
 on line 57
Message-ID: <202602100609.Ofwel6EE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 341ed7235f7a21d75b0bf273bdfef7525d4230c9 [463/799] bcachefs: move bkey, bset code to btree/
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100609.Ofwel6EE-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100609.Ofwel6EE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/bkey_methods.c:50:5-8: Unneeded variable: "ret". Return "0" on line 57
   fs/bcachefs/btree/bkey_methods.c:261:5-8: Unneeded variable: "ret". Return "0" on line 271

vim +50 fs/bcachefs/btree/bkey_methods.c

13ab885706d6f0 fs/bcachefs/bkey_methods.c Kent Overstreet 2025-07-24  46  
d97de0d017cde0 fs/bcachefs/bkey_methods.c Kent Overstreet 2024-08-12  47  static int empty_val_key_validate(struct bch_fs *c, struct bkey_s_c k,
a6f4794fcd8627 fs/bcachefs/bkey_methods.c Kent Overstreet 2024-11-27  48  				  struct bkey_validate_context from)
26609b619fa230 fs/bcachefs/bkey_methods.c Kent Overstreet 2018-11-01  49  {
b65db750e2bb92 fs/bcachefs/bkey_methods.c Kent Overstreet 2023-10-24 @50  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/bkey_methods.c Kent Overstreet 2017-03-16  51  
d97de0d017cde0 fs/bcachefs/bkey_methods.c Kent Overstreet 2024-08-12  52  	bkey_fsck_err_on(bkey_val_bytes(k.k),
d97de0d017cde0 fs/bcachefs/bkey_methods.c Kent Overstreet 2024-08-12  53  			 c, bkey_val_size_nonzero,
b65db750e2bb92 fs/bcachefs/bkey_methods.c Kent Overstreet 2023-10-24  54  			 "incorrect value size (%zu != 0)",
b65db750e2bb92 fs/bcachefs/bkey_methods.c Kent Overstreet 2023-10-24  55  			 bkey_val_bytes(k.k));
b65db750e2bb92 fs/bcachefs/bkey_methods.c Kent Overstreet 2023-10-24  56  fsck_err:
b65db750e2bb92 fs/bcachefs/bkey_methods.c Kent Overstreet 2023-10-24 @57  	return ret;
1c6fdbd8f2465d fs/bcachefs/bkey_methods.c Kent Overstreet 2017-03-16  58  }
1c6fdbd8f2465d fs/bcachefs/bkey_methods.c Kent Overstreet 2017-03-16  59  

:::::: The code at line 50 was first introduced by commit
:::::: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
