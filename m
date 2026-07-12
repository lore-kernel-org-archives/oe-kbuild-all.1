Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E98145B27
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 05:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783834261; cv=none; b=nhGzwtT0NOr/i2mQR7M4Wydxrg82navIioKwI7a6WGuSoAtBWfeeU1OPJ/dgNRvTx8XhvcPYyyyBfQWlYk3Bn1uJ++CHF1EFUaZ7nZvHfSmLEqAsqCHXC7eVT54QWiBJlp4erWFZYA+m12oWiWR+IXfua8w/9quLOXeYgom4x3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783834261; c=relaxed/simple;
	bh=nvU5ZIWLSogdDPwYRS4I/1dwYSB02gHrGDbqjC5vhzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ut29a8qWawk/TBCZbmVX4eBXnCMJJUjGtfhmzgojtatnDmBnnWbQDquLkZeiZAuTLlJBVza/valNnlRW1tgUwNKLNFtFf1/4tft3wlJun6CMV7bIEKGfPbeTty7+HnQeGlcrxZ9A3eRR9daShSZb/7qIWoIxcGZRymXFjT1CVAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sk37I0O5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sk37I0O5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783834260; x=1815370260;
  h=date:from:to:cc:subject:message-id;
  bh=nvU5ZIWLSogdDPwYRS4I/1dwYSB02gHrGDbqjC5vhzk=;
  b=Sk37I0O5vJoGNtwhSBaUNLDBPU/nkj3O0mLgG5ygiCLWCVtxCFKCRzLb
   9bEXtgqRkj/RWXAa3aHZ7gO5V2zT4pKynHO9dizZwQ2u0i69HpFN5ZLPg
   JQtKh6GLlWYtSL1/z9ungRwOZpZAcq6dkcPayW8VGLBk+G3/FAK7mE1d7
   wtDgHf0gm/9Uf/DpNH6mNBsArO2OkV22BKuHk1ke5d5uOyvwKuO8SVI5L
   D9xttUR2SQQjcnPGkZ7xoQ9IQhITEDOIbZNunk56h3rci1dEXSoulCyNe
   LPtv2KDwi3ssUQBjq+oD50D/1JB3vsrkLG6x/zfW1sqb7DkrTr9xd7PDb
   w==;
X-CSE-ConnectionGUID: ql5aMjXrSVmE+Jo43HTpwQ==
X-CSE-MsgGUID: jlNIzUpkTqOHGvYs3mjLbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84260793"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84260793"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 22:30:59 -0700
X-CSE-ConnectionGUID: 04jaAUEHSd6PJA5kyfD3fA==
X-CSE-MsgGUID: cVcaPcLrS+yqpqEkvaL4EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259551297"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Jul 2026 22:30:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wimmC-00000000Kic-3Okq;
	Sun, 12 Jul 2026 05:30:53 +0000
Date: Sun, 12 Jul 2026 13:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pr/17 1/2] ld.lld: error: call to
 __compiletime_assert_338 marked "dontcall-error": BUILD_BUG_ON failed:
 offsetof(struct pt_regs, r15) != 0
Message-ID: <202607121352.VUzrDgUb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/alexshi/linux.git pr/17
head:   521ce3b68fcc0aae09370fcfe3aad3c45a6e9d0d
commit: 80997c8b66fd8d73a96cd681a473bacaf75b7d98 [1/2] x86/ptrace: move down unused registers
config: x86_64-randconfig-076 (https://download.01.org/0day-ci/archive/20260712/202607121352.VUzrDgUb-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607121352.VUzrDgUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607121352.VUzrDgUb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_338 marked "dontcall-error": BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
>> ld.lld: error: call to __compiletime_assert_338 marked "dontcall-error": BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
>> ld.lld: error: call to __compiletime_assert_338 marked "dontcall-error": BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
