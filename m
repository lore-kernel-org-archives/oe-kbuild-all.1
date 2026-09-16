Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E867B345CA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528558; cv=none; b=n938S6TUcMIkuEwpSlQC3OpspJs3Dj1Agz/s+Cs9uRGvnTe2afA0F8kF2fQCaEhjwrfnOFnRF9Jp8gryYwXs/y5vFpalFTBA8xPGK/7qa4wUPsFQ+RU9WibEEvng37VI6RFEyQ4hbVNp2c7k0zRz/l4gXVv6ATJxofsmOYy+q8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528558; c=relaxed/simple;
	bh=YQ611rZlxiHuZvWlcLKS6WVm14cve3077V88c8BscXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XnbUuRy95PCzckJsixf9pQRegTvrRDBiOQ0l5GLtpU59XW/hrRfZhhrN2scXBjaUiGLzncjjr2AgAtltv5vZjK+fzl2HMU9gBeP4DkxNZjP/JlqyaKDGHLXPsgoypDK10S60GA0zjSIyz4Tm2CUCZMW4XwXtvi4gxQzPa5qpa58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeDWn0Ks; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeDWn0Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789528555; x=1821064555;
  h=date:from:to:cc:subject:message-id;
  bh=YQ611rZlxiHuZvWlcLKS6WVm14cve3077V88c8BscXg=;
  b=IeDWn0KspEf1ra/dR+45UzS690zmqqyveDq+y7PUh26Mrnu9xxvXfCrr
   MRlvkjl8VqS6X+dzCH0j3z3M6El0Zdhg139Eis3mEEgQZwT9H83vQgcDf
   KUDW18CFwsM+pQGvBSAWfz8QCJqTK/v3nInK5hdNH8Gz1LIoyKdkBTehW
   U5sukLfLS91IFELOTaurEFiPrTzeW0xCtRhU96mTAY/VEM5P9/YDGoG2Z
   qXnsZb6XVLDJTg0YMnNo3V36f5/b2MAcwnm/oXA0voGWThwwiELs4M8xh
   oDDffLrPOfk055ajXhYN19o/+QGBVGh4WelWmei/exQGjO356pE74uATY
   Q==;
X-CSE-ConnectionGUID: s6P2hQbRQUCt7tI6hwNQAA==
X-CSE-MsgGUID: nHzY0i/cQASZ03vwNNZP9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100499523"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100499523"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 20:15:54 -0700
X-CSE-ConnectionGUID: 36yKefZpRiGxRHASo7+CbQ==
X-CSE-MsgGUID: KTFWen3nTSOTu1boU8oq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311475997"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 20:15:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6g7g-000000005S5-35Ln;
	Wed, 16 Sep 2026 03:15:48 +0000
Date: Wed, 16 Sep 2026 11:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 21/332]
 fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum
 types:
Message-ID: <202609161114.zyxGR8lF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: ef4225fd3371dd0ce8b31150446324c3bd268589 [21/332] bcachefs: Btree node rewrites don't run at BCH_WATERMARK_btree
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260916/202609161114.zyxGR8lF-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161114.zyxGR8lF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161114.zyxGR8lF-lkp@intel.com/

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
