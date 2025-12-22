Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC0333737
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766426855; cv=none; b=Y+3/fATdBcgL1sZfjPCGbLAdafm8pJ9TdMhpY6D5A6TuB8DTnq+bRAHDBxTJ38vt8rBlSK5Vnp+JcibXVqvRUJCa5sk5rrO2o8eVaaLBEqNyAlQGY+S9EwA/xwijVZaRZPLgVDyr8azzBJer5/kq0+ia0nlqvMjHSSUcf5yzins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766426855; c=relaxed/simple;
	bh=2bj4tP+X8dzBX/edaXtorsc3RD1zT9g2gcc60XcnSqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V0hWYdl4KOEKdW7ODHcSvlzN00uPN1EVBNpeW6tXz9VFG5verePgUsGGnBAam/omMo29+xqUfgCSYvvj4knWl28zy6YNgD6LIuuu4U/svhohRiByWNZ1HyIvSeQOSMrrxFo0WR/6tpLYzWyxDKSecwBTdAwGFjWyxs7AnqNF6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Amy+bznh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Amy+bznh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766426854; x=1797962854;
  h=date:from:to:cc:subject:message-id;
  bh=2bj4tP+X8dzBX/edaXtorsc3RD1zT9g2gcc60XcnSqw=;
  b=Amy+bznhZ1BnZPKYE+TJhTFNhIYBVB6wCRI72QyAbprNW+z6MNcYk6T9
   cBxgRrg3VMmfJ8P36X7GAiMkadM35yChncGMQYjvCLGEKA8ms0zPOQ2Ht
   0S+cA9byeXGG/FJGTqZYEQTRd0ysp3r3GKKxJjNNs+rtwPCtbEEhGIgP7
   LkRI4h7X71BmdWT/WfiUNqvdPoLplW71f/3wv1uw44gbT2CPii6VUBRwT
   cCI5Nysl80kTAff9Si7nsIMCl3j28cXBZGzgNXjvNfs7gfzZO0kJI7wP/
   T96BaAmvI+KfhxKvZ/DxwtxbulHF39L1Y2XSvsGey0nGOSg99zECcXS9x
   g==;
X-CSE-ConnectionGUID: nwBKC4oGTaOehaeblq+Ggw==
X-CSE-MsgGUID: EEgHwt8IQSSjB7o2FK+Szw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79401678"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79401678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:07:30 -0800
X-CSE-ConnectionGUID: Wv1uOPJ1QDymohYcxV6Ouw==
X-CSE-MsgGUID: wHyI9VL3TEm/8MNTa/K/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="198822946"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 10:07:29 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXkJa-000000000xi-1S8g;
	Mon, 22 Dec 2025 18:07:26 +0000
Date: Tue, 23 Dec 2025 02:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 325/799]
 fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to
 integer
Message-ID: <202512230256.KT5me3Sx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 70a2c761c8b41d30ae891c3b8367364b4c4738f3 [325/799] bcachefs: Print sb_field_errors sorted by datetime
config: riscv-randconfig-r133-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230256.KT5me3Sx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230256.KT5me3Sx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230256.KT5me3Sx-lkp@intel.com/

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
