Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AF8231A24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406089; cv=none; b=p5p48cWPeTb8j4w2YcEV3KvZpbL49brYZrMIECM7r6qcz2xVAKPOijWhg2ABjhl1PYDIJWGMpt09a8v1ja/pwjohVKELcqJcmqq5Tg7W7A1OEOuwXHDW2FmB5/HG0XGJnKyAT9DI2O7iJTLRo6xJamyI81gzIyMXXsfqi4zmoo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406089; c=relaxed/simple;
	bh=Rczqs7pzCbiIz4CDI3BkuW1JpTc8ROAU4v6zw+cxmsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kkBkbIVWfM8JLRm+2VFlZRm2iZb7xr03l2tIV6DjGStQAXnN3pJKU8wQ4QAbByuOy0LtHVZ/SzcDIUNqtIFnfo4Q5gQlPKBsxjwQWM3SkYACedRyxPZ8Up9gFsle7MNeSlOtypVyjZlq2gup9Qk7LRNdG8Crf7Pxnuovhcg9DKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRfWKhih; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRfWKhih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750406087; x=1781942087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rczqs7pzCbiIz4CDI3BkuW1JpTc8ROAU4v6zw+cxmsM=;
  b=XRfWKhihFingOa+Z/NwNlhX4lxw6ERJ4BMRZAwkKQPb09l48GXYYJ9Iz
   hWkF+Q3QqjnruN3hn3V2iHfeT9CxnW6fPkAvVYb1LPPnc8k+vOUjkoIGj
   NG9ThcDdxvWYbOB3+YeDaYnmDuRXAI4u96u6SmP4LkNXqbJFu2cjgvmE1
   Yh1GbtEfHhSv7hEa1oiuARh0cY2LlGSaTrU9Hh98uazS3RnnD/8vvcjJQ
   siMPS6YgCdqqNAIKXoeLywoi9lVEeyHvXYlztwooWy1tO8DvnuEo6YcbP
   UYL/KpTNwGcqsyquRin1epaxp6wGFOpuotx7NVPxfv21kidVFEnCS3k1A
   w==;
X-CSE-ConnectionGUID: EpZGSCFFQ5WleAoR5xLPqg==
X-CSE-MsgGUID: R4PDJKZvQkiFUUAzh1YB5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52534423"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="52534423"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 00:54:46 -0700
X-CSE-ConnectionGUID: wzLygB6iSRCPbIoqSReapA==
X-CSE-MsgGUID: /eTXxKFpTpSC+XjbVDIVMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150651404"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jun 2025 00:54:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSWaA-000LUE-2M;
	Fri, 20 Jun 2025 07:54:42 +0000
Date: Fri, 20 Jun 2025 15:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Ge <gehao@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 31/159] lib/alloc_tag.c:641:17: error: implicit
 declaration of function 'kmemleak_igonore_percpu'; did you mean
 'kmemleak_ignore_phys'?
Message-ID: <202506201556.3CQsVRca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   2cdf4156ee65d8b988f460ee2c8802ea7c455fa7
commit: 5b70675cebc3dfcdb355054122698de788cb052d [31/159] mm/alloc_tag: fix the kmemleak false positive issue in the allocation of the percpu variable tag->counters
config: csky-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201556.3CQsVRca-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201556.3CQsVRca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201556.3CQsVRca-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/alloc_tag.c: In function 'load_module':
>> lib/alloc_tag.c:641:17: error: implicit declaration of function 'kmemleak_igonore_percpu'; did you mean 'kmemleak_ignore_phys'? [-Werror=implicit-function-declaration]
     641 |                 kmemleak_igonore_percpu(tag->counters);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 kmemleak_ignore_phys
   cc1: some warnings being treated as errors


vim +641 lib/alloc_tag.c

   610	
   611	static int load_module(struct module *mod, struct codetag *start, struct codetag *stop)
   612	{
   613		/* Allocate module alloc_tag percpu counters */
   614		struct alloc_tag *start_tag;
   615		struct alloc_tag *stop_tag;
   616		struct alloc_tag *tag;
   617	
   618		/* percpu counters for core allocations are already statically allocated */
   619		if (!mod)
   620			return 0;
   621	
   622		start_tag = ct_to_alloc_tag(start);
   623		stop_tag = ct_to_alloc_tag(stop);
   624		for (tag = start_tag; tag < stop_tag; tag++) {
   625			WARN_ON(tag->counters);
   626			tag->counters = alloc_percpu(struct alloc_tag_counters);
   627			if (!tag->counters) {
   628				while (--tag >= start_tag) {
   629					free_percpu(tag->counters);
   630					tag->counters = NULL;
   631				}
   632				pr_err("Failed to allocate memory for allocation tag percpu counters in the module %s\n",
   633				       mod->name);
   634				return -ENOMEM;
   635			}
   636	
   637			/*
   638			 * Avoid a kmemleak false positive. The pointer to the counters is stored
   639			 * in the alloc_tag section of the module and cannot be directly accessed.
   640			 */
 > 641			kmemleak_igonore_percpu(tag->counters);
   642		}
   643		return 0;
   644	}
   645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
