Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BABF79C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 00:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742518661; cv=none; b=tzRdc2dTTykfNT8rKszFDYBxMGejV8TUgSVP8Dp7amxuL3NHupzlmhLta0I1qO4iLj65F4EbM8t4MV24Sy9USxMATRwLuOLMHeIJANJELObDzayaR4Sm1VzYPbbiNlyOg4yGCfKmIM9BbFcMMOtoNFmQ15jWASd8c2EItnzD39c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742518661; c=relaxed/simple;
	bh=Wpy/ED8mcOKwqHZ1MVXGwIfNDkPzAMM0i2M5cfrvf2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqDQDFLWYKSi3SPwoaEz481eNFwQgu6KyY5pnKQpijnZiUSLkwCY2NjxyNEKG8VPPH+LAGPvO4whL2B5apdmwN1fYlmrwfFflxRAgZG8ULzJJaDQO4DZA8WPXuWG0gN8V/+VsxpY8AeN0DxaI3rqOjpb5tOcCbVpuwnHoERK+og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtWOnx7f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtWOnx7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742518658; x=1774054658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wpy/ED8mcOKwqHZ1MVXGwIfNDkPzAMM0i2M5cfrvf2E=;
  b=TtWOnx7fVxKO6yhYJYUTh2t9ZxN43P+JO9ZPEFp+rDsnsJxZwW+k+zB7
   oP+lkxELDj594WCDWdpfJpb9RsZTXY0II272rKH7zXeQuR5MBEcFMptOs
   hGdVKZnFoqAJeX5xV5SvglbWZZpuQzmYNmMj8UqIYrE0tbsBBhEAqbLTW
   2EOCel+edjayl96jm5ooaVln+99EIPlVQZmNNEyR0AWr98NbOr+qryZhb
   RKZF2Cal8sUmcxV0RL1OUhAs2cxV79SBafjF7u3FrAj1moOQ3l48q966L
   C+phUSn9bKAUIDLshihZ8p2GBFWWZQX+suopHbNZwj7uXCJlIVqic5JvR
   Q==;
X-CSE-ConnectionGUID: VIT/mSmCTtWvhNVyKAMREw==
X-CSE-MsgGUID: RKg3HZZNQ1W8ZPrE4TLJsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54772137"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="54772137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 17:57:37 -0700
X-CSE-ConnectionGUID: 7yvwv8JlR8q0sg6ue1ABnw==
X-CSE-MsgGUID: Ub+0P3YDSYCea+dG/frRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="146482906"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2025 17:57:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvQhZ-0000u5-36;
	Fri, 21 Mar 2025 00:57:33 +0000
Date: Fri, 21 Mar 2025 08:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 184/184] fs/bcachefs/move_types.h:36:1:
 warning: alignment 1 of 'struct move_bucket_key' is less than 4
Message-ID: <202503210846.xyjZMNmN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   e4b67ce488cf00b59430f7bfaa2059ce05b0d300
commit: e4b67ce488cf00b59430f7bfaa2059ce05b0d300 [184/184] bcachefs: move_bucket_key -> __packed
config: arc-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210846.xyjZMNmN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210846.xyjZMNmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210846.xyjZMNmN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/rebalance_types.h:6,
                    from fs/bcachefs/bcachefs.h:488,
                    from fs/bcachefs/acl.c:3:
>> fs/bcachefs/move_types.h:36:1: warning: alignment 1 of 'struct move_bucket_key' is less than 4 [-Wpacked-not-aligned]
      36 | } __packed;
         | ^


vim +36 fs/bcachefs/move_types.h

    32	
    33	struct move_bucket_key {
    34		struct bpos		bucket;
    35		u8			gen;
  > 36	} __packed;
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
