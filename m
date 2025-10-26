Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC24A1E9B22
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761488856; cv=none; b=sNLqsIQgBZcHpkMXEMDTYZlc+9WyJOEzmHNsLTFNFAjbYLUotGp6IwqIc6Fle4U+vJH/lP1Tea0CzBPUDhVJpqlPmy5PMjbvnWohGzfDyogeBGx+7T0t9ASMKAYl/2kxGN1xiBzZgf7rLt+wYsPSfuuFN3TcHTHODjJroIsD6dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761488856; c=relaxed/simple;
	bh=+kJYmM21isiU4PbcAXT5yA4eCgejdL+5RwnNy+9c8zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GoH2P3D70RtfLCjmiuoiv3WbVwA99OJ0SIGXdwTHfLDhqWMx75i8lqun+ec28TLJJbyRcEWFGsn/J6c2r5aMyvch1CvD6q8m6rnWWK9uANULHq3egVtxx0xKT13OL/Xo7ZkgFWmWHsEHE+WPc5YaJoVqBPPYcQfhMuT8pkAIcxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7AzLY/y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7AzLY/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761488855; x=1793024855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kJYmM21isiU4PbcAXT5yA4eCgejdL+5RwnNy+9c8zo=;
  b=Y7AzLY/yWPlV87TjSQqesyZGl2pVzPQVW7s/zQWJ5Mo9MNwhVRHVu/p/
   8b18nhIO48P2Ya/CItnNbmk6MWWZJbWidki9CkLcAvZhM3Wz+nmeS3z2S
   vi66PNCznScYv5TzkdXurk4EKjx83dx/brUT97K8Tfi6ke1BmBsm74y+O
   PX2MMCEJHmDT9P1jcLX40B5Mp3roc723V1H+BTzCQy3pcvFZjcmklER5S
   uHfdp6BOh7pCmil3z6vicpR5jm3HD8i1yqV2c7HEmFVzq8iMfK8bUFzyL
   sTx34T71a/eDgtKHbrNnzTuNU8QPmyzEn/y+6qE5P4yOocbHRAitsAY5A
   g==;
X-CSE-ConnectionGUID: 2yNZ3Ag4RBSvKGajvxeaCw==
X-CSE-MsgGUID: 8it7HM6bTEmuc+QkDYpFJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73876838"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="73876838"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 07:27:35 -0700
X-CSE-ConnectionGUID: 95pwB558QZ+CFJ5ZmLng1w==
X-CSE-MsgGUID: 1ZA4I0sXT8GFiHryDuVKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184736722"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Oct 2025 07:27:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD1iD-000G9d-0c;
	Sun, 26 Oct 2025 14:27:30 +0000
Date: Sun, 26 Oct 2025 22:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 459/672]
 fs/bcachefs/alloc/background.c:206:5-8: Unneeded variable: "ret". Return "0"
 on line 214
Message-ID: <202510262220.uCssIwEJ-lkp@intel.com>
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

tree:   https://github.com/koverstreet/bcachefs master
head:   232d5200c70baf66e106b70f6f54f6c234c2be46
commit: 3fdc7b4035515f784e1d442bcca383f5c0267e53 [459/672] bcachefs: move alloc files to subdir
config: parisc-randconfig-r062-20251026 (https://download.01.org/0day-ci/archive/20251026/202510262220.uCssIwEJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510262220.uCssIwEJ-lkp@intel.com/

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
