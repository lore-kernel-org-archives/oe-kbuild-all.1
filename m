Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C63D78F54
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735469688; cv=none; b=WQ+g5naOuRUjPbUWCAKd0lcrPTBPh5cXluyVJxKz/ray8cC70lSx7z6s5CmjFcUOJKBtL/cmY+9hXXZVM61hutT4qadEaIqcDz6e/ATt1IeuuNpRDLWucEU11WRCr10Gf6EoEn8HWHb3lwm0b7N8xvWmwbGcvF1bp5GHO3lYXp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735469688; c=relaxed/simple;
	bh=vsVuCu0HCTQoCTC+sLpfvmFi2bTYXCjisl0Rg2Ov+oM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MrNurAudv8B9nVihBZd8b7k2BBjTKuybxGkMNTnK4bPwfEgc9QdxcQYju4Jez216GAbe2HuiDwIbWzcCAtjHQa35vheSrJ1F5izwZrtDGr93xJTChgX5E43M31RIVIag3qpPa+xY7S09zTL4Jwica97vTASLETLAXyxczF7jFh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJhARp/9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJhARp/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735469687; x=1767005687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsVuCu0HCTQoCTC+sLpfvmFi2bTYXCjisl0Rg2Ov+oM=;
  b=KJhARp/9sYgQSe5JwQabhZqKL3hNBam/sDAov9A0hWo48wWEJ60L1izH
   Mhz7T8YzbWb+erLkxekBuA7GWjWuM7LypyspSjMDg1Vl6nW6sItlEC5Wl
   fYUxz9XBAVVaEUb90huI/4h0O3Y8zGkVGHarE5uqJ5nE6/S5TKmfo/sJh
   ZWk/EtZCGUe2MUk4hM04B9jqChst3/XVrpeBzPPovQqvf/ozi4cO7woK/
   Tw87ZEzNG4T7WcAylHNcNcYyjnJKtZEyWUVGB/64CT8QjqXdHQd5PcDai
   +OmMQ+9217WCjasAeQ3A5Ou9kLBja0Yn7mEmWEuMPLrb+zWxSLbeXpWJD
   A==;
X-CSE-ConnectionGUID: RbDkr0p1Ts2gYTi0UZFVeg==
X-CSE-MsgGUID: 5DCqMn+mQ36ccL5+wtE+gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35498660"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35498660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 02:54:46 -0800
X-CSE-ConnectionGUID: T+jGlfN4QFuQKTap80JuXQ==
X-CSE-MsgGUID: Yxb0qmq/TomzK7nBbNjXTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105530522"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Dec 2024 02:54:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRqwV-0004cC-04;
	Sun, 29 Dec 2024 10:54:43 +0000
Date: Sun, 29 Dec 2024 18:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1356/1356] mm/vmalloc.o: warning:
 objtool: vmap_range_noflush()+0x822: unreachable instruction
Message-ID: <202412291858.fE0rwXZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 2facb5901ceebe6736c0d192ca50be5d26c70ad9 [1356/1356] ascend: vmalloc: export new function for share pool
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241229/202412291858.fE0rwXZl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291858.fE0rwXZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291858.fE0rwXZl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmalloc.c:43:
   In file included from mm/internal.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:231:16: warning: variable 'start' set but not used [-Wunused-but-set-variable]
     231 |         unsigned long start;
         |                       ^
   mm/vmalloc.c:628:14: warning: no previous prototype for function 'vmalloc_to_hugepage' [-Wmissing-prototypes]
     628 | struct page *vmalloc_to_hugepage(const void *vmalloc_addr)
         |              ^
   mm/vmalloc.c:628:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     628 | struct page *vmalloc_to_hugepage(const void *vmalloc_addr)
         | ^
         | static 
   3 warnings generated.
   mm/vmalloc.c:3504: warning: Function parameter or member 'align' not described in 'pvm_determine_end_from_reverse'
>> mm/vmalloc.o: warning: objtool: vmap_range_noflush()+0x822: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
