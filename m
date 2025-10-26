Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376327144A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 21:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761514931; cv=none; b=QqWea7pXRNFydJsg5DfjG4DPJZsyMo76csUFSwS+we02yP+tqKPeos/EscABxc7YVRtKMAbuBVIqNxdovibA6BlatqT5JLnp0Xf86rku1F0umsSd3ygJQE3o+8WOp3xgMEW4S4H4wcX5ThOqDEDFRWWDO5TudCFMwPAQa7AO4mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761514931; c=relaxed/simple;
	bh=cDDpMyKrpU70x1Mx/4yf1NSBMoFFHmOG1VXTXa6Fehs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oebECnS3cObR3R0pixygRyFWfOo/bH8Uoxktb+LUI3bvoJGfVWsuKGyNXK26z0Bf1qmmUw8J+Jm1EqjzQ5nuVgb6I+7HKDYa44/06UcPVbhq81+H03M6E0CYSo4L6/8HRP8wQ+b8Kr2yLwbhn7v9jzKrZ6SdLOLsdFP1xBlg0z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qe5nL5yu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qe5nL5yu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761514930; x=1793050930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDDpMyKrpU70x1Mx/4yf1NSBMoFFHmOG1VXTXa6Fehs=;
  b=Qe5nL5yuEeNsXl38WqMT47cec261pnToIs/CLA5YFwypMTE2jntkSJe+
   sBVzfgtBy//8CeXuyR6KlkotVoehiKGrQG+vhU2sGvwHCcao/n+bl0rQQ
   HXg9EWEkjTAG0K95/xa53QfbxXar3K4BIAd6ajowuElGOAAQENS7vh83E
   5YsP5E+15n42OerWVg9CIegB7QH+Me3oHmD5H8AO8O4EIW9wYr6qEhEax
   RIVm14v3I8oIsO3ulEOmO0SuPstMermmUYJN072aBqWtaA1dga0IbsW67
   nzvP0LSTANFXvTR+WXJ0OmUQIgRtjW8fLyC6ysMdT0v4I/ptvo7OPNCH+
   g==;
X-CSE-ConnectionGUID: +1VBjgZuSvusUITML0owEg==
X-CSE-MsgGUID: 2G+ynVN7QtqyzW10fyvFvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67244103"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="67244103"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 14:42:09 -0700
X-CSE-ConnectionGUID: IZf3gKEySAizmO9tz9YkYg==
X-CSE-MsgGUID: KJGcUyYXS5GyJTV76Gq08A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184778808"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2025 14:42:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD8V3-000GM5-1t;
	Sun, 26 Oct 2025 21:42:05 +0000
Date: Mon, 27 Oct 2025 05:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 459/692]
 fs/bcachefs/alloc/background.c:206:5-8: Unneeded variable: "ret". Return "0"
 on line 214
Message-ID: <202510270546.AyUl7wWM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a4abf4352bcdf7adc9cf5605c5035f6441ed7576
commit: 3fdc7b4035515f784e1d442bcca383f5c0267e53 [459/692] bcachefs: move alloc files to subdir
config: parisc-randconfig-r062-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270546.AyUl7wWM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270546.AyUl7wWM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/alloc/background.c:206:5-8: Unneeded variable: "ret". Return "0" on line 214
   fs/bcachefs/alloc/background.c:221:5-8: Unneeded variable: "ret". Return "0" on line 227
   fs/bcachefs/alloc/background.c:234:5-8: Unneeded variable: "ret". Return "0" on line 240
   fs/bcachefs/alloc/background.c:523:5-8: Unneeded variable: "ret". Return "0" on line 530
--
>> fs/bcachefs/alloc/backpointers.c:33:5-8: Unneeded variable: "ret". Return "0" on line 44
--
>> fs/bcachefs/alloc/lru.c:19:5-8: Unneeded variable: "ret". Return "0" on line 25

vim +206 fs/bcachefs/alloc/background.c

1c6fdbd8f2465d fs/bcachefs/alloc.c            Kent Overstreet 2017-03-16  201  
d97de0d017cde0 fs/bcachefs/alloc_background.c Kent Overstreet 2024-08-12  202  int bch2_alloc_v1_validate(struct bch_fs *c, struct bkey_s_c k,
a6f4794fcd8627 fs/bcachefs/alloc_background.c Kent Overstreet 2024-11-27  203  			   struct bkey_validate_context from)
1c6fdbd8f2465d fs/bcachefs/alloc.c            Kent Overstreet 2017-03-16  204  {
26609b619fa230 fs/bcachefs/alloc_background.c Kent Overstreet 2018-11-01  205  	struct bkey_s_c_alloc a = bkey_s_c_to_alloc(k);
b65db750e2bb92 fs/bcachefs/alloc_background.c Kent Overstreet 2023-10-24 @206  	int ret = 0;
26609b619fa230 fs/bcachefs/alloc_background.c Kent Overstreet 2018-11-01  207  
e88973373aaabe fs/bcachefs/alloc_background.c Kent Overstreet 2018-11-22  208  	/* allow for unknown fields */
d97de0d017cde0 fs/bcachefs/alloc_background.c Kent Overstreet 2024-08-12  209  	bkey_fsck_err_on(bkey_val_u64s(a.k) < bch_alloc_v1_val_u64s(a.v),
d97de0d017cde0 fs/bcachefs/alloc_background.c Kent Overstreet 2024-08-12  210  			 c, alloc_v1_val_size_bad,
b65db750e2bb92 fs/bcachefs/alloc_background.c Kent Overstreet 2023-10-24  211  			 "incorrect value size (%zu < %u)",
f0ac7df23d04f3 fs/bcachefs/alloc_background.c Kent Overstreet 2022-04-03  212  			 bkey_val_u64s(a.k), bch_alloc_v1_val_u64s(a.v));
b65db750e2bb92 fs/bcachefs/alloc_background.c Kent Overstreet 2023-10-24  213  fsck_err:
b65db750e2bb92 fs/bcachefs/alloc_background.c Kent Overstreet 2023-10-24 @214  	return ret;
1c6fdbd8f2465d fs/bcachefs/alloc.c            Kent Overstreet 2017-03-16  215  }
1c6fdbd8f2465d fs/bcachefs/alloc.c            Kent Overstreet 2017-03-16  216  

:::::: The code at line 206 was first introduced by commit
:::::: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
