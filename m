Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F245171CD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 02:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783133518; cv=none; b=X8PI9I1ShwhzulAiUmOJYXezOFsfgeEU8BQJsx+pMZPNT0xQB3AQpqpWP3IsBbVDYZQm2okbayDb2eo4odjvqzIusddrjPfodBhsaXaIeRWDblIXyaVEgCfFzLffdAAO0M6lccUhyBo7zylz0yrVr3y6MXWCAF42Nt6CrPiiqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783133518; c=relaxed/simple;
	bh=GBGAkZ4y4IKx0a11VqMIqIWRBGTOCFZ1bKf7BafoZCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OAaY30ax2++m4HRi3YOETJV5EGXguOGPUWr0E/aXTFO86qB1eSyDZ2YOW0w/+dUDSZRrmjeu9GT4HadMHoDtEVuYp+/9RSy0Jrv7UipNEdKZRF7ASylyj1huNHhN4qzxN+umG/FC2dC0UAnTCrwKnY9Oov8vycugp+bKNx7lj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBHuJnLX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBHuJnLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783133518; x=1814669518;
  h=date:from:to:cc:subject:message-id;
  bh=GBGAkZ4y4IKx0a11VqMIqIWRBGTOCFZ1bKf7BafoZCM=;
  b=eBHuJnLXljd7W0YBUYnHFzqOsfxdxN7hvqtbLuDwfuE5rm14S7W1WD4O
   LGonEq/EIgTfBIB5hEcTH2r300vribKhsZ8m2KhtxYs+ZRbbAN9DHaBkE
   wN1qXT5uknyTGao6YoiIP/t/Kj9T8UTZMtWYXJsedADyZEzLnK7GxpM+9
   WhqhhOpTaT10iNtm1xQxSYTs3RqlV5wcTmhNrg1ct1HRWjOiKvddKecNt
   UBkkVp0bH+nLk9n78WXdiaXFqy9WeMuJnxVqEqq3np2Y3Rq8OKTk14R0y
   Dmu1fpFZnly+GvG2ZvtuxbJayEP58vxVN4dUdKk0AfJCKWCZEoA6gNbsA
   A==;
X-CSE-ConnectionGUID: PCaZzV6/ReyFknrupVzjdA==
X-CSE-MsgGUID: RxZ0WkbsQomtJ/HsV+5pqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83646228"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83646228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 19:51:57 -0700
X-CSE-ConnectionGUID: UtweavlxQ2enycDKfXM6jw==
X-CSE-MsgGUID: 70gEbe8qQWKpJBMTyQv19w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248778945"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2026 19:51:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfqTp-00000000Cmb-2h5P;
	Sat, 04 Jul 2026 02:51:48 +0000
Date: Sat, 04 Jul 2026 10:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 12/13] csky-linux-ld:
 fault.c:undefined reference to `set_pgd'
Message-ID: <202607041006.sE5lKJC0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   898b37f4865d94ff198bb62dfe2517a6d1b7d44e
commit: 262ccde2d8b41adf4ccff70b6fb199f3a3b67882 [12/13] mm/pgtable: stop allowing to call folded set_pgd/set_p4d/set_pud
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260704/202607041006.sE5lKJC0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041006.sE5lKJC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041006.sE5lKJC0-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: arch/csky/mm/fault.o: in function `do_page_fault':
   fault.c:(.text+0x230): undefined reference to `set_pgd'
>> csky-linux-ld: fault.c:(.text+0x318): undefined reference to `set_pgd'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
