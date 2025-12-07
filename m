Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3432224891
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 21:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765143214; cv=none; b=NYl0Hf/5cExfYbHdDNk4eBgw+KZD7+viE/8woAFL42Gp2BRWeCKc875HsGFshS0uy95Gkll9+298TopzrvIp3z9+/5tP+kVUDFpdSQWu80/QcxL0i3EzWoeSbzgrlF12gSo6ZL6qkd3udGZEcivn1f1S5jR0w+kQjQuPRbBHV4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765143214; c=relaxed/simple;
	bh=bVTXwtkLM7qsCh7YyXjIeZP3HQop8wHvddFutwJJTQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xd7Ke8GXQpyn4fMvmDnUpe3PqVe65K/Pu3fhvQdJeJeo2h1pJtZcpbmpFxTslmsjE0n2e53BbHlEGYtcPV8vfrsKMLvxuFhBbfg1JbA4JK/IjbiJUYHx7/R5oCwprxJIDHePigu5dqCbcYu2sXtueZHI1qc/GGLpb7GRi1pXTkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNm81M5W; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNm81M5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765143212; x=1796679212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bVTXwtkLM7qsCh7YyXjIeZP3HQop8wHvddFutwJJTQ4=;
  b=XNm81M5WdfxbXveA6DEz4KLEc8uwxbmuObhQZOihyy73bzdnIL9jvzxH
   EzwoVJiLJLIFF51jDnVGwlWSg0Px2o5EfJqixI+c4UfT/NOEjBxLj09Bg
   Ccp+C/CXLS0XJf/RLILVzsiuOAzfyoeoW9PwFZFQi2ZXrTkgU0UvFgzty
   /7Lkt2knqP4kHRxZx8XqvTy9RipV4L8ljTzTkYQMTAmN7euUIHrjZC9C5
   ba06z/grVZYyW6B07XZiIRvn1X+i4CfUVFpQOEOq2Xd5hoaPwXFx0KJ8y
   a3kQSpua2JhJb3X9FG3lbJKx9STU2YgBSP/qMqUmzEsGYzr83VbOycBJ6
   w==;
X-CSE-ConnectionGUID: je8hcdLVQ3uK1HSWezo5zg==
X-CSE-MsgGUID: bEp1bI50SDShZ7cfc/98GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66987199"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66987199"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 13:33:32 -0800
X-CSE-ConnectionGUID: b6RkDtweR/2KtVKfOA5ATw==
X-CSE-MsgGUID: h4fQ/eKDSiec6CGuu7vX+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="195681365"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Dec 2025 13:33:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSMNk-00000000Jen-3Skg;
	Sun, 07 Dec 2025 21:33:28 +0000
Date: Mon, 8 Dec 2025 05:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] kernel/xsched/vstream.c:94:18: sparse:
 sparse: symbol 'xcu_find' was not declared. Should it be static?
Message-ID: <202512080518.RsQU37Pq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 8dde1f2e6bf6049bf69c9f510349c698e0aba49d [3482/3482] xsched: Introduce vstream management
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251208/202512080518.RsQU37Pq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080518.RsQU37Pq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080518.RsQU37Pq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/xsched/vstream.c:94:18: sparse: sparse: symbol 'xcu_find' was not declared. Should it be static?

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
