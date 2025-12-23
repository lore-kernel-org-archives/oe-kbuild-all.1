Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2711940A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 07:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475368; cv=none; b=m33r3KFGvsXdG06YR4/Lse0H7Et6hsxHRyt/oxYDzHSQ+BVm81/iPWwXF6TA69o8fDue4VSu4UUivDAWo2pIHdD/sWYFiqMUgT/LF3GcJ9zBXohWXUvtk6N6PlwTAS71R9JlZVdChJtB9IX6Uu8MKMxsXVTxH+U63syK0HR26Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475368; c=relaxed/simple;
	bh=PVwN/DyY7Y5YHdgPQ+DsxvQTNkRaqBqJ5VZY5OptLCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GIQP1CH99f/7f3PDx4I0tpsWRiRQULA8NZKNFeSEET0PuHOscx2yu5OgTNUSNFKlR2IWxOLGAfsJmKcYNK6lv8IxppHzOHpQe7QD4fNjX5AIKtXBVH4oA4AG49JGMw5QnaTGyC2B6Fj0AFZcUqviRTNbO7uuAqVsLcdKOqqaHl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXgiJX2G; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXgiJX2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766475367; x=1798011367;
  h=date:from:to:cc:subject:message-id;
  bh=PVwN/DyY7Y5YHdgPQ+DsxvQTNkRaqBqJ5VZY5OptLCo=;
  b=hXgiJX2G9vATFf83jyRYGTk6HOrbaqYxdtn6rf8j4PC/aFHVCjObhiSe
   suKRFk+hS57HuwVfWyUP5hd3c99PTA1wwMOLoT+lIIOVgMlVuI4kE7M6R
   g5KFBiL9vJDkhTEmZKUyfemv0R2lYbHmXlnr+QnyDl0ud0cnPTxFk58MZ
   c+NgfVJrMKKgXpC+986vfGMmL3WKrZspJvFziX79vzLdH8/1BK2zECZhW
   mzt53Dl9r6nZTnW08RsDvdbULdoiP+edCRUcJ6R4GaZRLs4iReU1NTFre
   7BkAVOSCSoIND8JIYTVeGB7pkO7NrFRT0f138AQLBRdfR0FSkE0PdTVwv
   A==;
X-CSE-ConnectionGUID: PWE3oc5kToepbXs5pMuwwg==
X-CSE-MsgGUID: J1djb290QXeV3uKCBArcqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85738648"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="85738648"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:36:06 -0800
X-CSE-ConnectionGUID: Wa6TYAbGT9qETQp5ZkjEaA==
X-CSE-MsgGUID: dSJKi07DRSeEbthRntrQqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="200023745"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 23:36:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXww5-000000001b7-3pgF;
	Tue, 23 Dec 2025 07:36:01 +0000
Date: Tue, 23 Dec 2025 15:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 325/799]
 fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to
 integer
Message-ID: <202512231643.z8uTEYw7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 70a2c761c8b41d30ae891c3b8367364b4c4738f3 [325/799] bcachefs: Print sb_field_errors sorted by datetime
config: riscv-randconfig-r133-20251222 (https://download.01.org/0day-ci/archive/20251223/202512231643.z8uTEYw7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231643.z8uTEYw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231643.z8uTEYw7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer

vim +62 fs/bcachefs/sb-errors.c

    56	
    57	static int error_entry_cmp(const void *_l, const void *_r)
    58	{
    59		const struct bch_sb_field_error_entry *l = _l;
    60		const struct bch_sb_field_error_entry *r = _r;
    61	
  > 62		return -cmp_int(l->last_error_time, r->last_error_time);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
