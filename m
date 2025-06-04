Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBB224503B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025493; cv=none; b=EburdplzCMYlSTFoyQrVbPngVLxRDXUoDelyjiGrnuEWTAT24K8UM4s1+mhDsP+AhXmiHfdXi6x2/EemuCgB0awRsNelk48JW/Y60uQE5QBcOf+UET200oCYCZmFC8zmLEeVEvOj3C7FjcHe9P4BySzACqEBXtL4fnvfYayoRyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025493; c=relaxed/simple;
	bh=kDj+RduK4/D1BUdtpgHrw36cmf7PGWfrC7QLNxJ8jcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/b1amJYE+mq7KdBT6EJwqW+e0MwfJuG/xwdcV0AwC3YqgdgAw6wP7Clf7fE42f3dM/Iji0GTVeXliDsUG7vgEC1H0MCGrKW5Ux5pXlxI077xUdr2L82rkBlLwXv3uap6gIOeLkW/Fr7d9C4mp4s/Pdw6XbD2hjtbghSH2t36uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efikuqpy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efikuqpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749025491; x=1780561491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDj+RduK4/D1BUdtpgHrw36cmf7PGWfrC7QLNxJ8jcI=;
  b=efikuqpypqCIBcoQXdNZ7SE0BcBgBMno73rjtWWOrU/wtNItNC6tkT3D
   ML0t7cFLis/7ajxBvnWGjMCTwtTYwU6gxUJeeCj4g9+H08tY76YNH6VU1
   8TymXezxItnfWc2JypbWtI78BQbSydbkzXENtenkogMHFqCt3IV2w9K55
   acrmRnFIJdAaniJDGDDT9tcN5LLuhu6PWzXq8E9gtgBEI1uheejWBpJZC
   yuHbMfpQfF59/HNma7QRZnoC225QdjwE0unGJhEKJ2lmV4otcnqBJP84k
   qYyjZjsD1fyfu86urmEIux5rkrv8LzLREsHnE8DdWdp0GpyHDv9amD5k+
   g==;
X-CSE-ConnectionGUID: uTFgc3YFSbe8YPmwOaXbaQ==
X-CSE-MsgGUID: G6kTJ3S5TveQu4GC/kW/Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68530274"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="68530274"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 01:24:50 -0700
X-CSE-ConnectionGUID: 1FOaDemuQ2u7RHhdU8VB+g==
X-CSE-MsgGUID: buAiFg2AQt6A8qYQKLxh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="146089541"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jun 2025 01:24:50 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMjQV-0001ew-1U;
	Wed, 04 Jun 2025 08:24:47 +0000
Date: Wed, 4 Jun 2025 16:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] fs/fscache/main.c:52:21: warning:
 'fscache_min_op_max_active' defined but not used
Message-ID: <202506041639.lLGjtl2G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: c55fa11d134b40dbe1a4a5512a7fe43497cb6d5e [2882/2882] fscache: limit fscache_object_max_active to avoid blocking
config: x86_64-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250604/202506041639.lLGjtl2G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041639.lLGjtl2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041639.lLGjtl2G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fscache/main.c:52:21: warning: 'fscache_min_op_max_active' defined but not used [-Wunused-variable]
      52 | static unsigned int fscache_min_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/fscache/main.c:51:21: warning: 'fscache_min_object_max_active' defined but not used [-Wunused-variable]
      51 | static unsigned int fscache_min_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fscache_min_op_max_active +52 fs/fscache/main.c

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
