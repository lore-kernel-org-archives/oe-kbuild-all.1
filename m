Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80144190051
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 11:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735818691; cv=none; b=gQOwM2s8KVhkNL/gi7l9tSKnQ+7gMFGNYFVv7ONnqQiMCiOZN3S5drFRbuWkHM1P1/uMVbKdSGFwszwMdkjf1dlabrNOhnl+QC0iBltE2cXrcJpIcpR91ufaNCohpCd/uU/ywwwy1tjGg84Y0SGNJZfkTX9q+BkyrrGaGqP2aaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735818691; c=relaxed/simple;
	bh=bqzT7lgri0P3x/efc1ZJzuNiAakHc21OvzouE59MSfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SvYlM84BgybwH0nKMYqBwmNSIf1H53NVaCV0Q5Y4+k2o8vAcIGftZCqg316FWvADA4fA3JVqFIrgNW7hG5nilkv0WhAkEWh8sgkdfTibYJGPO6rhqDZOHBllICuv3ic7PJ//WnPX958sm4bClH2O+Xi+WhUGdIOh4IuHj5MN+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVijJPYx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVijJPYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735818689; x=1767354689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bqzT7lgri0P3x/efc1ZJzuNiAakHc21OvzouE59MSfU=;
  b=EVijJPYxtjW3C6X3489d/1vacrnVONxKRMrLVyaaSuiDWddElHqXp9vd
   avsk7xcvtpGrWdzesUZqISEvmN9qZ4fkNUhuYx7BjDBz0T1VpETLF9ntR
   6Yr9GdO/dTQLSrxYcNtM3LAHX68+/sGiNNnwYUsYWdt9Yf9QvRW1KeXOo
   2M6tuehdAjh8af9rR1v8Alt5dJnwvkM9VzYoj37smvheBbhk0pKKi9K5S
   PAuJvfmbnlvf0yxdUKNDjKthiS+lX2HClJyfwbKbBDwOigkYPxPa5gqzA
   wh9cHmnzDozHiwiqCcQ62yCYkyfhkDYGCdBUMAsv0R9gxaFINKgNOtZYN
   Q==;
X-CSE-ConnectionGUID: 6PZlGbvESgWHZ5Q1JeF8fA==
X-CSE-MsgGUID: uhaFyK42SaidYQvQfeItcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="23640874"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="23640874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 03:51:29 -0800
X-CSE-ConnectionGUID: lEZbh0xlQSykm8Dsj6iv3g==
X-CSE-MsgGUID: 5O5rEE/RTpWmB6QGO0e+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101331417"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jan 2025 03:51:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTJjZ-0008TH-1B;
	Thu, 02 Jan 2025 11:51:25 +0000
Date: Thu, 2 Jan 2025 19:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2620/2620] fs/fscache/main.c:51:21: warning:
 unused variable 'fscache_min_object_max_active'
Message-ID: <202501021908.g3jjkIa6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7059ffd1a85492c66d87331537ee3e4bdf8bf609
commit: c55fa11d134b40dbe1a4a5512a7fe43497cb6d5e [2620/2620] fscache: limit fscache_object_max_active to avoid blocking
config: x86_64-buildonly-randconfig-004-20250102 (https://download.01.org/0day-ci/archive/20250102/202501021908.g3jjkIa6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021908.g3jjkIa6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021908.g3jjkIa6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fscache/main.c:16:
   In file included from fs/fscache/internal.h:27:
   In file included from include/linux/fscache-cache.h:17:
   In file included from include/linux/fscache.h:19:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/fscache/main.c:51:21: warning: unused variable 'fscache_min_object_max_active' [-Wunused-variable]
      51 | static unsigned int fscache_min_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/fscache/main.c:52:21: warning: unused variable 'fscache_min_op_max_active' [-Wunused-variable]
      52 | static unsigned int fscache_min_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/fscache_min_object_max_active +51 fs/fscache/main.c

    46	
    47	/* these values serve as lower bounds, will be adjusted in fscache_init() */
    48	#define FSCACHE_MIN_OBJECT_MAX_ACTIVE 4
    49	static unsigned int fscache_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
    50	static unsigned int fscache_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
  > 51	static unsigned int fscache_min_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
  > 52	static unsigned int fscache_min_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
