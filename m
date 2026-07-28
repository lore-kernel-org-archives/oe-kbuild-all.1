Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C883B4EA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254943; cv=none; b=qG8X1lcJdWU9in7OJNyDSnCB7/JEpYPtzszzSCtf/BjgaWwE4vem9KI1JG5MPvqXgn12EsnAskQ6r7/9hK6DfV5wN2o/LCZ2bofMhHwrKVngdgKE4g2oBiKyE0uJQ9dUxx0RHoxFNjbnKMJUxDB6MjHZe76X2nN19tsd4+eDNdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254943; c=relaxed/simple;
	bh=fvHkZQeSvhE9mCtOBYtgdFJdRzyQQ8Y1zqPfW0n1Yow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cWUvNDpO7TQUT9cvrkNx46lta/Mz3sO1ENIvKcxxxEOP1g9X5oTiRkgQgrL79l/MvuFLemg3IKwA4jjLPttknrq2P+OCOGWRD4J4OyBFXKPOZ8iLJw0yu4gQbyZtoILTIu2TPb6OmrsJeZ/oqhEXt0nm9dcuPxjaLvPfhh/KiWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHrV/pC2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHrV/pC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785254942; x=1816790942;
  h=date:from:to:cc:subject:message-id;
  bh=fvHkZQeSvhE9mCtOBYtgdFJdRzyQQ8Y1zqPfW0n1Yow=;
  b=LHrV/pC2olFwGHhFjgUzRP8XDi00J9Hu+z2IWr/2V06xE13w04e1utoC
   wyfV0zkvZSE88OpNDuFcc/mXhKjCqapooQ/s+2mcEHxi1HbfHscep2a+e
   AXEbvxU2UBWSflNmATJmM6LmmQoe3dcQBfr0/F4rRJ/K/6F+WaLIXt9wa
   GzZjg/hSM4IB0u0xKT9d1nnLZ9ICtt0LEVYpF46Up9b4Dw2gpNi81ejyn
   41++azUk6aVrtHc4+GeJ/OSmXnaWKBk/UDVHVXWTT9Labt//S0dBCOAyd
   ILihc3GQKumv4TzKGnS8IJAM2BNb4h9svBrHRd+CbIqajcQe7V8t7zuE6
   A==;
X-CSE-ConnectionGUID: Lvi6fUdBQzqE5DTn1tmOHA==
X-CSE-MsgGUID: DgF2mF7FQyibvFSI8XEiVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108642572"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="108642572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 09:09:01 -0700
X-CSE-ConnectionGUID: bPZQouEdT1OxfzSuhVPL0Q==
X-CSE-MsgGUID: +IZfAU5SQJimajrRc3HJ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="283082793"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2026 09:08:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wokLp-00000000eXD-3zQ1;
	Tue, 28 Jul 2026 16:08:23 +0000
Date: Wed, 29 Jul 2026 00:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v4-tmp 12/16] error[E0063]: missing
 field `init_dma_buf_io_ctx` in initializer of `block_device_operations`
Message-ID: <202607282309.9Igx6URK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v4-tmp
head:   4ad753ea35094c0e41d48f8abbf2a42105b8f58a
commit: ba6aecec59d506a41309c0536745bc56e6350eb2 [12/16] block: forward init_dma_buf_io_ctx to drivers
config: s390-randconfig-001-20260728 (https://download.01.org/0day-ci/archive/20260728/202607282309.9Igx6URK-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282309.9Igx6URK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282309.9Igx6URK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `init_dma_buf_io_ctx` in initializer of `block_device_operations`
   --> rust/kernel/block/mq/gen_disk.rs:128:58
   |
   128 |         const TABLE: bindings::block_device_operations = bindings::block_device_operations {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `init_dma_buf_io_ctx`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
