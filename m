Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681925;
	b=R4uBrHmnmsHxOpXDXMLh8EtzcQdipHTGSKUZgOmM/57hEkGV195sFv0g5xAepa+kGO1n
	 tw/RVJMiIdnY4jxqkbCNqdyi+6sXxK9H7O4K7atFjEj7qNtiEGlwKE2rVy9lfxw0/rUww
	 oim5ErFj6EfZfO/euAw+YWw9mPg/8/0pQuHFpsgwRcS+HOPSlwmGYEwJ11IgcNEcyn2cm
	 mFyCRTQHUum8GpKOD4hpIXE8nD8vQ7LCpmrtTCC3C44bikhXG5R9jsrM1n0EfBIP6m1C2
	 gq/UMT7RTNeUr19tr6C5nK7MNFBsLfvLnUPBIeTZiKhgsSafHFpPVS5n0QwsZ1VaVGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681925;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pAN+x5FTAIxZ0w4kcFv2yJMyZJhapQVlaYVWKFhIyjY=;
	b=WTTReD/CdbnB+sWg2oQIixmYc7gAfzVEyDpY/9FWJM7E6iTYTv+scIbyDnO5Mk++Fnht
	 Vlv8gjDtKelsq85AN5LF8F8q+dT0UipDAxxsyjXrH4ll2xogL5Bji88u3Rsb47IvtQxCc
	 xgNSeac8koiQJm9M1k/polgNP78iRtUsuEmoQFCJMqYXmyFuCI8vLr8FFuzE4vPfFz3iF
	 Nmd5OZQH02jNDIem/Ys6B+gaaObbM+5p4F8aIZd/yRFrOS3tJLVXfVS/ls7eCL7JtlV+q
	 eKmsjkmA9fgLAXJDTn1yWTVN2hWsTh535v4LUcnImVtdU32R9cKNsEQM9zma0XTRriw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CjO3Wyxg;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A5C60A6F6D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 15:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A5C60A6F6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CjO3Wyxg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792681924; x=1824217924;
  h=date:from:to:cc:subject:message-id;
  bh=sLT72P92jQ4N0Mms0XbF0kZJa2Wwm4hZyjZKTf6asEs=;
  b=CjO3Wyxgsjl+j38/8Ecte41Ofz+UcDh9V+hdGqZm95WrKNMOFtclmdIa
   rit2MBN5yjBgMcR4eXmbdwxtA9kAfuftKW4pK4Q/XzGJtebVFYg6KDJSn
   +ybvvwLY2lscRZ3qLq/Ygg9l2huWLSjeKAx0OcKz7Kyfmtzg4IPvXWpIx
   BClZgCZxlwVzS2pOxk9trDT3i0fZmPTkheCFz/mt0qlDJONs+QIjor1HC
   RAGIfvCDEZVWoM6VZU9ccG5ibseHBuu6JUkxKUO+bnV8NRnnNDTXCrLNN
   kz0M6HzC/d3WHiDrDMXZABh3iv9HldTU3MUTduEtfrQNS8SCFxkPhnjgm
   Q==;
X-CSE-ConnectionGUID: baOEtjKIR7+eM6ezCn5Qaw==
X-CSE-MsgGUID: JxpSsJ9ySxuKMwCk4Kg46Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1313311"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1313311"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 08:12:04 -0700
X-CSE-ConnectionGUID: gKV6LJOBSbCMEPl6umqZWQ==
X-CSE-MsgGUID: EJwQR0MlRbqEp557fKQC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3304230"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2026 08:12:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJuSV-000000000LX-3gjv;
	Thu, 22 Oct 2026 15:11:59 +0000
Date: Thu, 22 Oct 2026 17:11:44 +0200
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Meta)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:b4/memalloc-prof-dont-waste-slabobj-ext-metadata
 6/18] ../shared/../../../lib/maple_tree.c:5793:38: error: 'SLAB_MAY_ACCOUNT'
 undeclared; did you mean 'SLAB_ACCOUNT'?
Message-ID: <202610221745.ioLSXZqa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Harry,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git b4/memalloc-prof-dont-waste-slabobj-ext-metadata
head:   4eb758f1c30dafac114e68279058434bf6e617d9
commit: 5ed4fc69772cb4932e4a2e2801c34122a69b0b84 [6/18] lib/maple_tree: specify SLAB_MAY_ACCOUNT for maple_node cache
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261022/202610221745.ioLSXZqa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221745.ioLSXZqa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221745.ioLSXZqa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../shared/maple-shim.c:6,
                    from maple.c:20:
   ../shared/../../../lib/maple_tree.c: In function 'maple_tree_init':
>> ../shared/../../../lib/maple_tree.c:5793:38: error: 'SLAB_MAY_ACCOUNT' undeclared (first use in this function); did you mean 'SLAB_ACCOUNT'?
    5793 |                         SLAB_PANIC | SLAB_MAY_ACCOUNT);
         |                                      ^~~~~~~~~~~~~~~~
   ../../include/linux/slab.h:183:78: note: in definition of macro 'kmem_cache_create'
     183 |                 default: __kmem_cache_create)(__name, __object_size, __args, __VA_ARGS__)
         |                                                                              ^~~~~~~~~~~
   ../shared/../../../lib/maple_tree.c:5793:38: note: each undeclared identifier is reported only once for each function it appears in
    5793 |                         SLAB_PANIC | SLAB_MAY_ACCOUNT);
         |                                      ^~~~~~~~~~~~~~~~
   ../../include/linux/slab.h:183:78: note: in definition of macro 'kmem_cache_create'
     183 |                 default: __kmem_cache_create)(__name, __object_size, __args, __VA_ARGS__)
         |                                                                              ^~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
