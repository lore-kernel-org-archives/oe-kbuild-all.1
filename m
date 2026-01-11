Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2891FB1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 06:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768111672; cv=none; b=LKdQZ8ZyezpSNgDMxWtqUGOJ3FD6/wAQamU7vv7Se/Y0XYud2F56/kGcVQ4XSlOnrWGVKZo/VcUlNvOZDUuDj7lpiGqfp6BQDX/HDZ1DbJZYGIxi6cl7u+BywMb9+UHDVmwVObDxcdv00Qcp9EQ4UmI+BPFXe/tn7Uafca/c5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768111672; c=relaxed/simple;
	bh=vLTpciLTc/cNtSQemLGhMeoQqXKtXmuotA1RjuZnpPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bN1Gt45CwuudXHrXd3hNsoooUpytwgv+p/LgjcBIT0JKw7BCP1b5PNlMJR2qK5SrAcDlSOeLa4IZWI7nKmOHsCw+kAMHzwZbEfxTH5OizlMyGpRewxErf7AeX+xzZuQdZ2TXtSzbUmHAPqNeszJUqNCg2tcaqDKgqCP8miRtOKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDZl2VZY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDZl2VZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768111670; x=1799647670;
  h=date:from:to:cc:subject:message-id;
  bh=vLTpciLTc/cNtSQemLGhMeoQqXKtXmuotA1RjuZnpPc=;
  b=IDZl2VZY2ypfoc7cUgQqQUAYVV++HSkcB0CEg/Vks0V1u/UATniyp/Y0
   8SzIVa21Tpbm/BLx721hcR/5mivILX7kH0PIZlCKZOHTpyNl1NwZCy/Au
   oBMoOSqRM02sBdvTtAHS+WYk2xBc+JtF2TSmk3KXXut2YaA8SryfzpaGB
   8pKdD6fzIfChuegLKjyc2gvLcXW9xRoBwP4kKqubtYOTo9utbWKJrTZQa
   R1/8XRJWfLzY1Z/05NcEErTyCtCtvg1qWLqijOWrXF2sB83TwattD7q6N
   TCTclExFoUg4dxvQwbiu0mQRgfJWFPjpM89oxFZCYG6Nx0HOWAy52d+jv
   Q==;
X-CSE-ConnectionGUID: 7wXReN3wSzug+N4kQa/OQQ==
X-CSE-MsgGUID: FuaAiX7kSaeQCbehWuzHJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69356451"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69356451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 22:07:49 -0800
X-CSE-ConnectionGUID: Pyf50yrXS0SmK/YTLxkkDQ==
X-CSE-MsgGUID: jAo/7yRoQ/atREcb3Wmv7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="208645258"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jan 2026 22:07:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veoc6-000000009g8-1t3Z;
	Sun, 11 Jan 2026 06:07:46 +0000
Date: Sun, 11 Jan 2026 14:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 1108/1155] fs/bcachefs/btree/cache.c:26:6:
 sparse: sparse: symbol 'bch2_mm_avoid_compaction' was not declared. Should it
 be static?
Message-ID: <202601111341.QROhw8Yq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   af2e18a32ff0ee83f028b504e0ff92450377ff24
commit: 090d4a4b1567ae743f1342c976b449d104c53a6f [1108/1155] bcachefs: Avoid waiting on compaction when allocating btree node bufs
config: hexagon-randconfig-r134-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111341.QROhw8Yq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111341.QROhw8Yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111341.QROhw8Yq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/cache.c:26:6: sparse: sparse: symbol 'bch2_mm_avoid_compaction' was not declared. Should it be static?

vim +/bch2_mm_avoid_compaction +26 fs/bcachefs/btree/cache.c

    25	
  > 26	bool bch2_mm_avoid_compaction = true;
    27	module_param_named(mm_avoid_compaction, bch2_mm_avoid_compaction, bool, 0644);
    28	MODULE_PARM_DESC(force_read_device, "");
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
