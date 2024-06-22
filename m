Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344834206C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719059509; cv=none; b=g/VFeq32cKpKk+N9PUZIW8/I8yIzhi9+QBfylWJtntPOVFKxsInvy8xG1/559x8ef4mYNLV22hfVnreFixg87gO7Qe8EPu1Ax9Oe+PLdsx5hZkRGVICCeWDqBSXhCWEz/e6KpgWbV48DHTGq8hadL5E+hHS4MLRkYpNycRJDqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719059509; c=relaxed/simple;
	bh=eWoBF+odDkj//sauFo59f1Nm45mlimaSGVc1ckt7gp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UixNUdZ1fVHJ2ASC+rHbzSk6mEejWHVsliZkP2CbSCwQ8kfkJvMKIh1RKyHrMDAD8ieKkDEa2YgV9xVxFfK+vO3MF/YqnBCSTYhQOCzkxKJGq2k6qs40Z7T3PDaBrIZLvOB6fWw1NQbiPZjBl1/u5n00K+3gVtyW4itLhj14lIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqE3JyWA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqE3JyWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719059507; x=1750595507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWoBF+odDkj//sauFo59f1Nm45mlimaSGVc1ckt7gp4=;
  b=IqE3JyWAZYrYYH8MMB4m3JSinGamiIO6LsnWDiIlCbT1kNIZZLfFQKNv
   9VZdlS1sAraGgxRZP9ZSoUjdexJVbDYDMJEPFw2xGblkuOWSpf/Z0pdbF
   If4+WNmn1xzjZaz6CXPiQ4KDfYybAXmQ9Jt3BfK+J8VDq5J/z/E39mdai
   LlEvbBKpeLhDwqN6HttnD07unxSQBuyPrbhOX9xzyuGvSN7Q/Ca2x44v5
   sqPjoVnmHlFeVtgJZQbMsgn/UWQCDI10CGQQG5vSL5MD4D3Q2qmELYmct
   tQeb0o0GQODWp6U/38VppKUh8XV1FM4NWKDWh4NH3YoFkgJofIJSzuCCE
   g==;
X-CSE-ConnectionGUID: odvT0IzTT6y4LCkp7M/rOw==
X-CSE-MsgGUID: bDzBfwkjRGK4WTRS7Q0Ruw==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16059166"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="16059166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 05:31:46 -0700
X-CSE-ConnectionGUID: SY9r8OSfRaauzRwBwu9Lmw==
X-CSE-MsgGUID: TjL1SQAAQ1CeyM96a5zLqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="43521931"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2024 05:31:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKzuB-0009cE-0y;
	Sat, 22 Jun 2024 12:31:43 +0000
Date: Sat, 22 Jun 2024 20:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 3610/3645] ld.lld: error: undefined symbol:
 gen_pool_for_each_chunk
Message-ID: <202406222021.e2mKosjC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   e1d705ecf1cbeeaa9091d3d2f0504acfbb18475f
commit: ad8659cc85096979a4f7efddcd4adffb055f3122 [3610/3645] netdev: support binding dma-buf to netdevice
config: i386-buildonly-randconfig-006-20240622 (https://download.01.org/0day-ci/archive/20240622/202406222021.e2mKosjC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406222021.e2mKosjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406222021.e2mKosjC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: gen_pool_for_each_chunk
   >>> referenced by devmem.c
   >>>               net/core/devmem.o:(__net_devmem_dmabuf_binding_free) in archive vmlinux.a
   >>> referenced by devmem.c
   >>>               net/core/devmem.o:(net_devmem_bind_dmabuf) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: gen_pool_size
   >>> referenced by devmem.c
   >>>               net/core/devmem.o:(__net_devmem_dmabuf_binding_free) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: gen_pool_avail
   >>> referenced by devmem.c
   >>>               net/core/devmem.o:(__net_devmem_dmabuf_binding_free) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
