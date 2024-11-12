Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EBF213135
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 23:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731454351; cv=none; b=hfR6Gq/6ws5P5L2ur+BzXxw5li71JcFePGOpNSqIEGKnCWBsergn/AQwXa2FbralSekD7Vh22x7NCLQAnbHmtQi3UtczGrxqf6NyAkuwdR1h7Y87bhcd2AzJHmbXLc0mTb2nb+a1Z/zxaiBF38mbUkutmc+MkPpL7dQxDtm4nDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731454351; c=relaxed/simple;
	bh=oAtfMj6jDeDLzUCdzMdvFydjs009vYBlEaONsyGFSXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LAQYuyTbAnm+i/pKJKTrgSwyACZ7iDTYrQcrtefFVZMHk5nqbRYZSFP25NQAdplA9XJAGUuRZ5VBYJ//zrvFhw6WuYYt8/3v4bhIrYMCV4gr89vpcpnmn03tQrbN+4/0z0WR7syY/QqH90wJ6GaE20q5KcEC2hHNjmeyLEbHUfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSK60nHQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSK60nHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731454349; x=1762990349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oAtfMj6jDeDLzUCdzMdvFydjs009vYBlEaONsyGFSXY=;
  b=bSK60nHQ/ca/+/+wSt3pn5wUfBtgV8h50n7QQYIr5KVSaSbxg7ksMRcC
   Y+WEHeefQbXV8MqCXbAvlcLhpdHj0CP3Qk8w/m789IYX1uy67eW9YO6qw
   WVBDfyvtMeEzyxph+0GfvuTV6gjzx8rIaUmlOMx+E+s0ZCIdnI6CRXahH
   T1/cZfTGa8cCfEn46lrvQ4rB/Qpq9u6btmG0a1sU2XQBi6hllr16guoSU
   5heIXMmHkaxnIF3Ug/oYah7fOa8vc8by7NZKadjUQVQCmVs1wcCfOszEj
   aDJv+CKs0jdUAXiGQ28LwYpF+ow/90Xi7WZFvhNtWFA6rreoXPjldSh1Q
   w==;
X-CSE-ConnectionGUID: 9OPsKoyMT6uodPsWwmzpQA==
X-CSE-MsgGUID: nt3YLscsR/aCzFUzgXZA3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="56711082"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="56711082"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:32:28 -0800
X-CSE-ConnectionGUID: 32yZoaoET0SlgD/fZyRKHw==
X-CSE-MsgGUID: VdDEP7n4RamWvTWQBFIHrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="125201378"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2024 15:32:28 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0Mz-0001pf-1e;
	Tue, 12 Nov 2024 23:32:25 +0000
Date: Wed, 13 Nov 2024 07:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291] mm/mem_reliable.c:41:22:
 warning: 'zero' defined but not used
Message-ID: <202411130708.2IT5fUX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   58ec866c31299a4b0d63a01cb026877c5f85e4d9
commit: 6943b93b464351cbc35aa002e86bac48e08b1c3f [1291/1291] mm: add support for limiting the usage of reliable memory in pagecache
config: arm64-randconfig-003-20241113 (https://download.01.org/0day-ci/archive/20241113/202411130708.2IT5fUX3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130708.2IT5fUX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130708.2IT5fUX3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mem_reliable.c:42:22: warning: 'reliable_pagecache_max_bytes' defined but not used [-Wunused-variable]
      42 | static unsigned long reliable_pagecache_max_bytes = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/mem_reliable.c:41:22: warning: 'zero' defined but not used [-Wunused-variable]
      41 | static unsigned long zero;
         |                      ^~~~


vim +/zero +41 mm/mem_reliable.c

    40	
  > 41	static unsigned long zero;
    42	static unsigned long reliable_pagecache_max_bytes = ULONG_MAX;
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
