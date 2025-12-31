Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC1623ED75
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 02:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767149950; cv=none; b=szGTCmTAY6dP5tf3Gi8rqMaUnv100EMZuijfxDBSqGfhKATKVnwkdygNmlnBG2gGtZh06kIT/N99Qzmkmq1F2jdZlPyoVBQqp45HmfjZVPFfZls9mYLYQbWbrO0AT6p1SQM8fq6XIMV22E5sW1IDMyJ8u7Zo6I4t41QLdNZtrRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767149950; c=relaxed/simple;
	bh=sGt+DcrzYB9BBdvBwj2TeJKu/Icze4Ak8M3LwrotN7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e+EiRJykaLn8tTKkvMxktsXSzQPOZWy2hVwjXnnQoDw22d95hKKNgWHtjtHEJyFZ5xT1iQLIUmFlIwr9oJbxVDPRu9j1n+QSM7GaK83HugSk/xSLOEQW4inygtKQ6vHwYCwri2vvxncbHltWmq4fl9F6rgp4EPQZjfrvlPcyn8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSeQwkd4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSeQwkd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767149949; x=1798685949;
  h=date:from:to:cc:subject:message-id;
  bh=sGt+DcrzYB9BBdvBwj2TeJKu/Icze4Ak8M3LwrotN7A=;
  b=YSeQwkd4GKWvplKWHvmoRvmkB41RYpOy4v29+KQxOFnAxp/z1uDDfF47
   xpb3paxJsrdM78LwB/scJe2ltuP4wchuEp/UMY+XhhSc2/8h1ajSDhAl0
   YGbyQxJlZMmB1U7X4Tm8+XlkojLICKMrMQuSv9JSM+1dL50lpyWApX/f2
   09u5faAz4upmWjmhExJHzhwaJmuXkMBuis+xLaCLv7wAVUuAHY+/a2Md9
   mneT4Gp2OiLun3buJjzSS8AWlPFqsVq3kZL2DwLOR2n186FPXbiF0zuAA
   O2EWIdZPhfPy9QWX7bAwmx3adopR2YKEtpoddlBOCsLJiVkDKul946EWx
   Q==;
X-CSE-ConnectionGUID: hd90JIIhQVa7bnPiWBkveQ==
X-CSE-MsgGUID: blGKmiuHQEidwavmuKu8Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68773235"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="68773235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:59:06 -0800
X-CSE-ConnectionGUID: gR4T+CYASdm+c7G+70sNJw==
X-CSE-MsgGUID: wb4q+bq4Q0OPsj6VQbQssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="201094700"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Dec 2025 18:59:05 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vamQP-000000000tl-3m1w;
	Wed, 31 Dec 2025 02:59:01 +0000
Date: Wed, 31 Dec 2025 10:59:01 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, Hongbo Li <lihongbo22@huawei.com>
Subject: [xiang-erofs:dev-test 9/10] fs/erofs/xattr.c:451:43: sparse:
 sparse: symbol 'erofs_xattr_security_handler' was not declared. Should it be
 static?
Message-ID: <202512311021.L0IMtTOh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   e84fd1bdbe05e6b3ebe5766b98b7e4902203e8e1
commit: cb6528654a7fb2a3ffd55889fc877f61ca72edda [9/10] erofs: unexport erofs_xattr_prefix()
config: arm-randconfig-r113-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311021.L0IMtTOh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311021.L0IMtTOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311021.L0IMtTOh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/erofs/xattr.c:436:28: sparse: sparse: symbol 'erofs_xattr_user_handler' was not declared. Should it be static?
   fs/erofs/xattr.c:443:28: sparse: sparse: symbol 'erofs_xattr_trusted_handler' was not declared. Should it be static?
>> fs/erofs/xattr.c:451:43: sparse: sparse: symbol 'erofs_xattr_security_handler' was not declared. Should it be static?

vim +/erofs_xattr_security_handler +451 fs/erofs/xattr.c

89d806805778053 Gao Xiang 2025-12-29  449  
89d806805778053 Gao Xiang 2025-12-29  450  #ifdef CONFIG_EROFS_FS_SECURITY
89d806805778053 Gao Xiang 2025-12-29 @451  const struct xattr_handler __maybe_unused erofs_xattr_security_handler = {
89d806805778053 Gao Xiang 2025-12-29  452  	.prefix	= XATTR_SECURITY_PREFIX,
89d806805778053 Gao Xiang 2025-12-29  453  	.flags	= EROFS_XATTR_INDEX_SECURITY,
89d806805778053 Gao Xiang 2025-12-29  454  	.get	= erofs_xattr_generic_get,
89d806805778053 Gao Xiang 2025-12-29  455  };
89d806805778053 Gao Xiang 2025-12-29  456  #endif
89d806805778053 Gao Xiang 2025-12-29  457  

:::::: The code at line 451 was first introduced by commit
:::::: 89d8068057780531fab06b928a80599b9762e461 erofs: unexport erofs_getxattr()

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
