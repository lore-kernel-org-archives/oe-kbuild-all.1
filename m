Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCCE259CB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325213; cv=none; b=CafCuZxRJguvz2YMRkxK868+wnalOPDji9Kj7JQWq7K+oSMdxcCEg82rPvlxiqE1XgSpIt5f6cbx9QhrVd2UMrXn/MszIBT5lpMqmtfPhW5rMVTZgTpQ5ik5gYpYJRU9SdaGaQ5aAZUquxajO9kID2oJ1HhFR+qQZgNU+/EEq9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325213; c=relaxed/simple;
	bh=T0/SZRBuhn312yYETAh5uZu7VUEU8QCb6GpLTROwOFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YFUxRL8Cqbdoirh2KEmhskm8FoGB/O8Zxkl2KOOnlem6PYoLafvJDiYnSqWEc7vRDvSpUs5TuoUCQqqCsXs/TeyhjSc6O/ZtuJCLikTHkIJQFgzIaQ3/Wif40Uc7IBLtfPaLxaiA5KxitW35mJQRf5uopkP2DnyYVNNozzb6hUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdKO9YYK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdKO9YYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764325212; x=1795861212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T0/SZRBuhn312yYETAh5uZu7VUEU8QCb6GpLTROwOFM=;
  b=SdKO9YYKNFaPWEAqbN75KookDp5o9fF1s7Lz7Js8WIXvr+TTVmLOZVfy
   GP3nFTXfGV/Ckj+0WWp0s4Em1vMxAuAAuxrDX8zSl+69TRS2T0umeSVlr
   ByA4V4U3AFIzkLwqdL7+f9Z+SyKAhdOK0afz5VFou4BCVj137C4P7Y8Iw
   Udia1EuHbVETVG5qTTN9go+cNjmhGSZ+K/GAM2DAKxZOLvHKI935YQKRO
   /iybDNBVthprHXEgtl6DKfscUa51yCm3sa43wdnICjmiMLizFYZaAbdZ3
   EBJ1n5s3D00qZrqpfCwrwCkAsEBTZqDBq3hMunt9YZO2cJ5/yn1mk3zmg
   A==;
X-CSE-ConnectionGUID: xKCdSeWMRLKDdAmdv6GgrA==
X-CSE-MsgGUID: xwMNCYE/TBakAt1Y2HqhIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66319528"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66319528"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:20:11 -0800
X-CSE-ConnectionGUID: 9N523chWTHmjN2rxE+wP9Q==
X-CSE-MsgGUID: 02yRWbJQSeGevYyemG2myA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193225156"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Nov 2025 02:20:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOvaB-000000006Hx-18Vt;
	Fri, 28 Nov 2025 10:20:07 +0000
Date: Fri, 28 Nov 2025 18:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3355/3355] kernel/xsched/vstream.c:94:19:
 warning: no previous prototype for function 'xcu_find'
Message-ID: <202511281845.H2cg7rYT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ae3faae9efa6dabe1e7613b5e5d3758ffaefb86a
commit: 8dde1f2e6bf6049bf69c9f510349c698e0aba49d [3355/3355] xsched: Introduce vstream management
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251128/202511281845.H2cg7rYT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281845.H2cg7rYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281845.H2cg7rYT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/xsched/vstream.c:94:19: warning: no previous prototype for function 'xcu_find' [-Wmissing-prototypes]
      94 | struct xsched_cu *xcu_find(uint32_t type,
         |                   ^
   kernel/xsched/vstream.c:94:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      94 | struct xsched_cu *xcu_find(uint32_t type,
         | ^
         | static 
   1 warning generated.


vim +/xcu_find +94 kernel/xsched/vstream.c

    93	
  > 94	struct xsched_cu *xcu_find(uint32_t type,
    95					uint32_t dev_id, uint32_t channel_id)
    96	{
    97		struct xcu_group *group = NULL;
    98	
    99		/* Find xcu by type. */
   100		group = xcu_group_find(xcu_group_root, type);
   101		if (group == NULL) {
   102			XSCHED_ERR("Fail to find type group.\n");
   103			return NULL;
   104		}
   105	
   106		/* Find device id group. */
   107		group = xcu_group_find(group, dev_id);
   108		if (group == NULL) {
   109			XSCHED_ERR("Fail to find device group.\n");
   110			return NULL;
   111		}
   112		/* Find channel id group. */
   113		group = xcu_group_find(group, channel_id);
   114		if (group == NULL) {
   115			XSCHED_ERR("Fail to find channel group.\n");
   116			return NULL;
   117		}
   118	
   119		XSCHED_DEBUG("XCU found: type=%u, dev_id=%u, chan_id=%u.\n",
   120			type, dev_id, channel_id);
   121	
   122		return group->xcu;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
