Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A56D28DF5D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557230; cv=none; b=OtbuVcMaELisOa2cyPn+HK6wCCcb4mZfUpJYGXIVZWwtZLK5ZgcC2YesMdaQE5uCNhBbL/AZsX/NH7dUvCle9JJDGMUzRaZScbbtjj973lqTUEvnre08TLqVDRCRoLsii4PIu5vcdqMTZmLdzhdJmXgAgDjN6AGQIb47Tkvn9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557230; c=relaxed/simple;
	bh=gmB6vATA768ycYsFSxGUygJi/MXnnxCnUEbJuFh33OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVIE3GXjnKGD1bAuoJdK4KNPOOe3Lu0bIEhtHdGVZxyXExnnz0j5AKRsrUl6MTgfujcAkJbAYHDPr6v7PnP4JeVlfekPaLfNAMcuk3t1b3lcEDM14+U7NMr2Tc+r50zCgtXmpZqqWcuv2V/NUgGOOoM4bK9KnkCtA16nRJkmo2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iv8X8/Mf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iv8X8/Mf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749557228; x=1781093228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gmB6vATA768ycYsFSxGUygJi/MXnnxCnUEbJuFh33OM=;
  b=iv8X8/Mf130mfN5bm3GR7TNZ7Y6OLbwgHxRw5Pg/0CcyAwC78NU7wYo0
   Ywi6gvGj8yKGDcXGCkCOprQF0NrVreySVord2VSKGYDtc/idGnrVcV3n1
   bepxfFOlFRRimxE7P5nVdnJdxmPANuPmTj2YXJYWTsPcAeOC4VzWnsaNP
   s2tMeSeHxVTLFpvJfsoM70EULhR3NUIywY+tvrWHJP/Qlk0FnnXrDxlpS
   QI/ey7a1kei/DJSryeGj8DZxwgGDwmuz/DweHibzRKBNV9GQP8ZJAuwVc
   9xt0iyqPLYyftxobmMl3FbaPfJoBL9AGc8fc27j/FipFenpY4rRO2EGIH
   Q==;
X-CSE-ConnectionGUID: TfZ1xB1ORxGqU2tKJDQ7mQ==
X-CSE-MsgGUID: WBG/2K7zTQ+nrcRzCcmM1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51651767"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51651767"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:07:05 -0700
X-CSE-ConnectionGUID: ZhGgCg9kTC6Qi/nx6qjgPQ==
X-CSE-MsgGUID: LEQbJW7IStOUdpF09MmJnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="147780776"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 05:07:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOxks-0008Af-0i;
	Tue, 10 Jun 2025 12:07:02 +0000
Date: Tue, 10 Jun 2025 20:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2954/2954] arch/arm64/mm/pmem_reserve.c:11:17:
 sparse: sparse: symbol 'pmem_res' was not declared. Should it be static?
Message-ID: <202506101929.qhZqxH6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   90ff3e07cc268a8e40bd578dcc4907a3db419c52
commit: db4cd75bc674e6f473c0a7303b1744155352882c [2954/2954] arm64: register persistent memory via protected memory
config: arm64-randconfig-r133-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101929.qhZqxH6c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250610/202506101929.qhZqxH6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101929.qhZqxH6c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)


vim +/pmem_res +11 arch/arm64/mm/pmem_reserve.c

     8	
     9	#define MAX_REGIONS 8
    10	static int pmem_res_cnt;
  > 11	struct resource pmem_res[MAX_REGIONS];
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
