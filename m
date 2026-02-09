Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F98126ED48
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 21:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770673323; cv=none; b=as8co9l59fqb8wRRLHtU3tXIgBsZpTx+gs2NGgipErG8ETm6nIe4PeHQLPGwXKMXAMw60f5Vt92SSBxUXSoFLN2MaimqXuIk/sj7ecOEBMuSKdjkcgiKyCAE8ZckYGdDv5lX0jXQBehB8BtcgoU3dmdRluG1GBB0fOf6+5j3Yck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770673323; c=relaxed/simple;
	bh=LZouKiHQYrKeXheG96A1NC037D/ZTIbBTBgw3JLEYKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F6/ZIVSotcf01CyBVTpgQhw5Y61GCKao0VvPq1FL2R2FnsZZTVnWnUYjAa/FqemOgiH/czmZWbhRHUE+vpiCNQmgvmAGBkOUhTQ4OVwoGpDPpStjSQ+lx+yOT8TN5GZk2m47htu30BszobC3e/KGtpSyTADxvZ3p7hiNuq1/krM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYe4j7Lj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYe4j7Lj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770673322; x=1802209322;
  h=date:from:to:cc:subject:message-id;
  bh=LZouKiHQYrKeXheG96A1NC037D/ZTIbBTBgw3JLEYKY=;
  b=AYe4j7LjTjTBulBtSWbSstwElkXMKlcwy/SMLw6F31bzALZgUCbLW2XV
   31SMjRFjpxRsgYRDTH3KlZElu7YPnRRuzp9+1D2Jxo6o7O8BEy5hWPMNj
   5aMzQ6dyMbhfuHUBks/CPpr4eTGABhy9h10RmM0dnjrONxEnbrRCM058T
   QgzbpWUnDFH6zMRSfwXdZGtERLSZ4GeUr5MX/eiCBM3n9XSFkHboe7eux
   TUUp7rl/zGTzGr5DvN+u17IFhnDFq2ZIpvi/Ez/l378E3iW2Qvc4XiKZS
   MbGRdMImaWSn+jcU3epVpaTQ3Y2+RkjrtM6nL2fUoGRvqoIMd45TmKk1J
   g==;
X-CSE-ConnectionGUID: X3U5PtkwT9q3i4XzaxQ08w==
X-CSE-MsgGUID: ObdgNYHbTbGwDrxUzPk4SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71694141"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71694141"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:42:01 -0800
X-CSE-ConnectionGUID: +KA6v/KITAysiWfV5uMGAw==
X-CSE-MsgGUID: 5CFcgKGeRsOnfWv1Lh4FUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216087505"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Feb 2026 13:42:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpZ13-00000000oLw-3iU5;
	Mon, 09 Feb 2026 21:41:57 +0000
Date: Tue, 10 Feb 2026 05:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 459/799]
 fs/bcachefs/alloc/background.c:206:5-8: Unneeded variable: "ret". Return "0"
 on line 214
Message-ID: <202602100505.PiRtU9VL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 3fdc7b4035515f784e1d442bcca383f5c0267e53 [459/799] bcachefs: move alloc files to subdir
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100505.PiRtU9VL-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100505.PiRtU9VL-lkp@intel.com/

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
