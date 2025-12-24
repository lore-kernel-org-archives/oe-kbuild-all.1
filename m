Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F2210F59
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 00:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766537616; cv=none; b=KkgwOqXdzNhBwDvkd0CIeSTBF2guNuicEAcSD4vMJIE6wXHk7w3jIPpi1TuDhfiAkmb/Ga6fdOTy0gjGD8RSMGtg7few0we/sqaS7Nu30eNfIdU/b6QyD9jBMY5Ez827dArS76KoELAvc9Z1AidVHAcd1LqMUxzNCQ8UxOdjLkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766537616; c=relaxed/simple;
	bh=iea6NlEKrdUYCChDYl17dhC2aGkrLOcVw8GAc9kW+OI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qTlTrNVOioBBJ8uE8GCecf7hm3nZ1KyUalUT6//YodlrKsWq0MHpple0QT3uc6211rfYkVUyKt0MLzeCffHFdlw7g7Dzid9WMZtFkwUqj9oIQcr4m17pyKOW1aZKtfR+5SKCfzv58k1HS55tNp+ak6n8e7dTFQt9G9olQms0QpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdTVNAii; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdTVNAii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766537614; x=1798073614;
  h=date:from:to:cc:subject:message-id;
  bh=iea6NlEKrdUYCChDYl17dhC2aGkrLOcVw8GAc9kW+OI=;
  b=KdTVNAii6blJbSD8nPeAp9rvpXf2T4N8HaV1mkPirna6AIQKt0xfcxVq
   1TRjKiEYXa5e+PmU7UJQJI6+rE7m1N/CThlvf2q3JA881+JF8CPCvD35I
   kw7v5/ipje0itYSQFG9/bgL/4udyLy689yQvAu3T4vbd9aySTsu076hTJ
   ANfRK6iv+m4qDj7s7Zu8xt0mGJ94e1zZbeala+zRv8YuSgIMQRvQHCSov
   kv7DgH2pW4cSseFeOJdiM+eIPnHb92/ixV0nI5S+OATyjk4mTaLSyMloI
   NLTSuRn2ueMLVaPJ/5wuPFTc68OhG2SoS4Wal8l0MriBNfiVLR9ncsaZ/
   w==;
X-CSE-ConnectionGUID: 0ha0b31STcCQTf2i0yDvMg==
X-CSE-MsgGUID: rx1+n0dKR+ygJuPp6kgW8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68368490"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68368490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 16:53:32 -0800
X-CSE-ConnectionGUID: 9PVUSc+WQNupIo0Ii43wKA==
X-CSE-MsgGUID: A4F5lsd4RoCyD8SGTplZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="230939340"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Dec 2025 16:53:31 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYD80-000000002WP-1rMB;
	Wed, 24 Dec 2025 00:53:25 +0000
Date: Wed, 24 Dec 2025 08:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 21/33]
 fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum
 types:
Message-ID: <202512240819.yAJ6pzsG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   95e7fbbbe2079679f8aa76d3e4e3599c921807e0
commit: ef4225fd3371dd0ce8b31150446324c3bd268589 [21/33] bcachefs: Btree node rewrites don't run at BCH_WATERMARK_btree
config: arc-randconfig-r121-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240819.yAJ6pzsG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240819.yAJ6pzsG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240819.yAJ6pzsG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/data/move.c: note: in included file:
>> fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_watermark
--
   fs/bcachefs/btree/interior.c: note: in included file:
>> fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_watermark
>> fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_watermark

vim +136 fs/bcachefs/btree/interior.h

   125	
   126	static inline enum bch_trans_commit_flags
   127	btree_update_set_watermark_hipri(enum bch_trans_commit_flags flags)
   128	{
   129		enum bch_watermark watermark = flags & BCH_WATERMARK_MASK;
   130		if (watermark == BCH_WATERMARK_copygc)
   131			watermark = BCH_WATERMARK_btree_copygc;
   132		if (watermark < BCH_WATERMARK_btree)
   133			watermark = BCH_WATERMARK_btree;
   134	
   135		flags &= ~BCH_WATERMARK_MASK;
 > 136		flags |= watermark;
   137		return flags;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
