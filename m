Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F65237FF4C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881856; cv=none; b=qJFDEPoXTOgEFQWl+QUCOwy3yc9pCt4LvXlyM/BCPTOaz8GBP3VrAuzfddJMq8V+vwBigfyQ6WlgicBBikq8SwVSh1/y3lIdmhikMqIohUX9bY/K6FzYx7f3Hzg1j1gNpJexsVOOYp4wWuMBS9FKoagRQmj8XOp0XiG5ZOLNs3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881856; c=relaxed/simple;
	bh=edPp6sLavW7PIPA8v3kBQdFUxLP85FqicArXCWjJNzI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EQGfuVJZa9IXLrCQWy5ANXwA5NisD6/w+ZAjiuogBNGvxUHSB1754hfowOFjXUYP1wgKTggNMQGozUHWOx6eZlE3wrg/xKel9wruE9VnEnUVxooBekuh98ZAUrmAjSrvoCroJ8vQFbESfKgugxRriHXJAs0bxrhRsviXTbT9cP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRxmFV21; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRxmFV21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778881854; x=1810417854;
  h=date:from:to:cc:subject:message-id;
  bh=edPp6sLavW7PIPA8v3kBQdFUxLP85FqicArXCWjJNzI=;
  b=eRxmFV21AV7rF7kbP00HhP+KDBYxSjUBLvg3RPeXa1UAsOtCPNBs1T3R
   QNfTdmwb1lDnNn0QVjpI5zitb1g5pdN3Wq4EOFmuLaovij3DM6wGUO9RV
   KA0bpS2nOAJpmGs6/bXvNrBN6bwvGybTfFgH2AgHA+gIK5HyCoK4JBRez
   ai6LgaWkSSQgVQsv0VVpUyiiRTw3C3aPTOHgAtMnzFn9wfTsCoqEB4dXZ
   cJ8FXRzM5l30YG1VDMiW36tTvPIVS3OAT2DrtagQ+njlsSiFZIBJl1mC6
   w7kIymbNUmKCnSyAnmx1ItqxHNtAF5mDOAa8Ei5YXWE0fmbumpeB9hoQz
   A==;
X-CSE-ConnectionGUID: AXk7By3OQVK6dA/AoUDz0w==
X-CSE-MsgGUID: U2Al5MrOSzyp2gFulchRyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97415557"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="97415557"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 14:50:50 -0700
X-CSE-ConnectionGUID: htWr17E3REOYiUxgL60Bdw==
X-CSE-MsgGUID: uGq/1lBjQn6iW775cSNzUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="242806609"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2026 14:50:48 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO0Qg-0000000007R-2wPB;
	Fri, 15 May 2026 21:50:46 +0000
Date: Sat, 16 May 2026 05:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 21/332]
 fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum
 types:
Message-ID: <202605160556.5fW4SjGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: ef4225fd3371dd0ce8b31150446324c3bd268589 [21/332] bcachefs: Btree node rewrites don't run at BCH_WATERMARK_btree
config: sh-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260516/202605160556.5fW4SjGm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160556.5fW4SjGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160556.5fW4SjGm-lkp@intel.com/

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
