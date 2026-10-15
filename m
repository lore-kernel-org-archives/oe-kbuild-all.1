Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1837235E950
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 05:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042816; cv=none; b=llPu0TSk+IVi4ixArN6UDInADKzNzKI+BRX1ssMlc6M4pqr21h5oyn2LT4/IxFs1TcxJ23mD6LkIomlZrSM9fqVeAh5SinYUn+KH0bjcLhD3bEebpi+PbZ2X5p+rSMdg1AU0EJdFAekqVyNFGLVYOYx1/BivBm9/qqAf0xrlcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042816; c=relaxed/simple;
	bh=hM8IvEAn33mBjBZzHBx+URMamx10cHP02vpcuVfVLCI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ye51C4nNinUoEXiFBGIzlq/nhuhfLahDHJFMTXdLyjzcfexXun/TPYw28S8ephu8XnLbb594eqjQeCudGFj+iYcc+kFXPfnU707O8o38HgqfCKPWMkgZqCrdxFH4v7nm7qnf0Q6xrkt4h0AcllytSJC/JCJrVyET4cDv3cLTpp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YI0kCsNv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YI0kCsNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792042815; x=1823578815;
  h=date:from:to:cc:subject:message-id;
  bh=hM8IvEAn33mBjBZzHBx+URMamx10cHP02vpcuVfVLCI=;
  b=YI0kCsNv6AkIXWoev3P+/bW6AspWyrKGOV0CMESpMm/2RwO5Geaa3XN1
   jTs+IWXsXW/bqihQTZInilWpZGAuHgYkhvU/R4gdtxijEbv2RJIojVJiw
   W2nIhjoOzJGvDOjjR6CnqVtxAlSY0xFp2rAeFRo2OExoBSPckIoUTXx5y
   vrwi6tMuCVznSqtcY3SbrRgHZjmndiXwUV3st0zdXQ65P5UDS0e+lnGkU
   TbkJ5Nmbv/HEyTQyj4b53nBnJK0baJ8YSkjoJer0JOXGaGX6EgYX4cpcO
   Lx4JA+lT7XF5dBdG28bk3oMRuusXDFPGeQkak3CsCXahfnmFlM0WLHnod
   g==;
X-CSE-ConnectionGUID: Zy1wiyEzShCXtiXNDs0Cgg==
X-CSE-MsgGUID: iiE8yDYNQ2iZksf47gr0mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="689806"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="689806"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:40:14 -0700
X-CSE-ConnectionGUID: wzBaG+DmTtSfG1kAC6JvYw==
X-CSE-MsgGUID: egDm/pJ5T+iA6vJkwFgSLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2073050"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2026 22:40:13 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHECJ-00000000BdL-1NWJ;
	Thu, 15 Oct 2026 05:40:11 +0000
Date: Thu, 15 Oct 2026 07:39:40 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 34/119] ERROR: modpost:
 drivers/infiniband/core/ib_uverbs.ko: symbol 'ib_open_qp_user' undefined!
Message-ID: <202610150720.Icfh1qKM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   51164760f7c1e7761e793acedc65c2c014d0e92f
commit: d60ff395211e20739522d20122f8c14746e31f3f [34/119] RDMA/uverbs: Initialize QP event ownership before provider publication
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261015/202610150720.Icfh1qKM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150720.Icfh1qKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150720.Icfh1qKM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/infiniband/core/ib_uverbs.ko: symbol 'ib_open_qp_user' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
