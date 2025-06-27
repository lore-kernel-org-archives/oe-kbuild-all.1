Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9AE610D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750983316; cv=none; b=MAFnf5FSRDmr2h3NCZLM2ja10uFIV72zeP8JzFTWJRT+ouJU0cR/CJITYHO1uZW5atRHa5ZYdYgLdXjjqyc6+Tyd3HHG7AHknS+2Hu1toZUkpkyg/xZIrU1xh4FputLJGMubUdpafA39mSGDcJzBOlis2Ki11o0PUHpwrgiU5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750983316; c=relaxed/simple;
	bh=YL4GPwfGLpjjxf28oA9hfWaUwknkZ43Z9f//saAVjSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hEj5SLronSNcXED5KgPwUhfJZo4HLdug+yrZxPKmNXxt7srb907Gp//oqskui2KMhexD0tQvSKLegFbwp+xjYZjLihkKjze882N42odrc42nn3wawZ+Fnm5zOMdbGjaGP68BLqG933XXg6A8tMSBEqkQPT/KV9DGN+HxVE2XoOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ce9Z2NYq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ce9Z2NYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750983314; x=1782519314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YL4GPwfGLpjjxf28oA9hfWaUwknkZ43Z9f//saAVjSo=;
  b=ce9Z2NYq8fPRwGI4chsX47zHmjtrwk6FmXbFT+emj70HbGhrYwXSGKYF
   pCH8a5BGS/R2yDqBA1S6ICFULG1cWd7PwGGoOenMbRKnQnifI6Iy9Pj8C
   uX95Nhzjph90LIlTqHlHLD2nZ3Lats1FPtlewFG3wqFGUXH5OpUAJ5xFZ
   Nk6Xzudd30qhh+HAujguewTw8jcCY2cbeqnw/4jJGf+RoVUqUSeOPv1xf
   ohB4H10hQ/MzV8iZRb++pmjUk2YpWBflqQgjOeoYdvWnjbv40oZaRsG+4
   VSaoCY9NWA/En3J0KAN22ye8J9ahoL2r6qYJlaTLu6LaOIbwqQoupUt6h
   w==;
X-CSE-ConnectionGUID: hCGxg9MmRtGor04bTv3ABQ==
X-CSE-MsgGUID: /JWmH1HMQAuzwhdOwx3bwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52416189"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="52416189"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 17:15:14 -0700
X-CSE-ConnectionGUID: neWVXnDxRdSqGD6JyQ3zJg==
X-CSE-MsgGUID: /YM7vbM5SRW9lwDNEl4jaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="158143054"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2025 17:15:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUwkJ-000Ver-0S;
	Fri, 27 Jun 2025 00:15:11 +0000
Date: Fri, 27 Jun 2025 08:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw-v1-test 9/16] error[E0063]: missing field
 `get_dma_device` in initializer of `blk_mq_ops`
Message-ID: <202506270854.QV9TNLgw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux dmabuf-rw-v1-test
head:   949fb10351aae03bf6ca32fb3c4a714ebaefc9e9
commit: fa47f310ac655d764753000887265b08cd958ac7 [9/16] block: implement ->get_dma_device callback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250627/202506270854.QV9TNLgw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270854.QV9TNLgw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270854.QV9TNLgw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `get_dma_device` in initializer of `blk_mq_ops`
   --> rust/kernel/block/mq/operations.rs:217:42
   |
   217 |     const VTABLE: bindings::blk_mq_ops = bindings::blk_mq_ops {
   |                                          ^^^^^^^^^^^^^^^^^^^^ missing `get_dma_device`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
