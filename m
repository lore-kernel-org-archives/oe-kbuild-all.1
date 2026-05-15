Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647AD34B438
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 05:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823331; cv=none; b=dgo3LL5M5FrRmxxxSOM+JsL4TCOeOyGvnJRcKmQsv1pIO/wymByA/glTx7OL34d87n8/8OlL0aqOXNnODjW7BRqFjwj3CZh8td6P3GrV2CR4BBrp1Qn9LYFmJJOooGYsLg3dCNcpYSuEzAucH+EfcZSMS5xNPv/QomAyEMyIbME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823331; c=relaxed/simple;
	bh=WygjBUpGtYPE5PudZ41wTXvmYYALxY0PUsYgLZ9toac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=diW1c8FvDnDDsMFTYq4iSHtww64EE+5ycEQ/QwRcmVvHcdNgnaTrx92yOmytSGfZM67+ojeSnHNnaz1HCIX2ZMLwhzZkc4oG+rDbRmNQlbPkgB/s3pEKJYprgSnaHmnCC1Xrb1mJ2ZGILalLd2xLicCtRUkjPxXyHbbwWVhM6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSEWa1hS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSEWa1hS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778823331; x=1810359331;
  h=date:from:to:cc:subject:message-id;
  bh=WygjBUpGtYPE5PudZ41wTXvmYYALxY0PUsYgLZ9toac=;
  b=ZSEWa1hSlqh3hwfMEpmKkvRnExsgSop7qoZejx/Bqs7XszbP7FDMNT0k
   /ugoYTIdBicdK3qe+BD7jP0nj9sAluK2PO8ibOZr33RIX9bEHpUgnnyPE
   zsvtJfZnvsANo8/FbByQAFZ6TgUPlMnFQLJK6D0UmkN9cTuVqiJFHvG7u
   3ucGaIub5lEr49wFhXlf2EUCKnQN7MnjoNW3tkrb5ufl2wGYjS+NDy8e/
   Yic/wYwPhC2AxUww8WsMKQvGjCRwMmFgApmN5WJ4q3A9CQtyn5Q/JuZFO
   TBCGe1yGglP2UP6ux1Q657KNf/ZwvOP/3Ko+CrkoYiBhFL4V+pUTtVch0
   w==;
X-CSE-ConnectionGUID: D6YB+iJkTOOQXVgm7M2W9Q==
X-CSE-MsgGUID: 5gXpaheZRXaqhJ/Zbw0htA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79668915"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79668915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 22:35:30 -0700
X-CSE-ConnectionGUID: AP4QbvyVTBeQQ2EZ1W98Kw==
X-CSE-MsgGUID: FYRJo/TIRUeSVjxKXFpjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="243571689"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2026 22:35:29 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNlCo-000000000w9-0mk0;
	Fri, 15 May 2026 05:35:26 +0000
Date: Fri, 15 May 2026 13:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 325/799]
 fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to
 integer
Message-ID: <202605151351.pCw3jobN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 70a2c761c8b41d30ae891c3b8367364b4c4738f3 [325/799] bcachefs: Print sb_field_errors sorted by datetime
config: sh-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260515/202605151351.pCw3jobN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151351.pCw3jobN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151351.pCw3jobN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
