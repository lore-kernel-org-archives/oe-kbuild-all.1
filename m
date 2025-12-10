Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9533246F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765372282; cv=none; b=OxJHRx+2eDGbwTYMM2dRWhDFE8gPsle75elBnrcG48T1vqXQj9P72BAIPN28/bGM6qz1ygFRtk6NxwpPNz6XWk6NnUG3ZNww9rx3KW/JJJ/SoVtuxAQuNf7kDaghUItM8dahU/Dx1fhbyRC5vI9sXFeT8csznMkwog3Xcz0IAi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765372282; c=relaxed/simple;
	bh=ZRK/llLQVG5/qOIO0DbepgupzZfNEBr3FDIJTwHVYB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ra9bJ3FPDpdfflHqh/qV2xwwv38LRc4JfSrCghqpA2LlRaONeXv+Oe/jVHunhRBcZEr0SEroxBWzJszixF+vtqlcZs3oC8gDU8Yo0L9FWAZp0K28efd6XjccWK4dkcyLpc8fckC8pSAJ+6SQESKGbpD+zHNHW6EnefmKIftSC+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ic2Wyqty; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ic2Wyqty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765372281; x=1796908281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZRK/llLQVG5/qOIO0DbepgupzZfNEBr3FDIJTwHVYB0=;
  b=Ic2WyqtyZYl0GxCClJdbfteAQ2887hYJ3AZrc9pdinPul7xxqzH400tk
   Y2AHxly3bfBJ6ze78w0JDngkTB9sv++2Ha0+InX7a6oWzu1XMMgdlI15Y
   jA4ZElIEchmITiAtDC3aB3jq/dNMOiEeeEurIhAWJub5UJULhOxSXdHz2
   WORfjVAS2/SkR97pRAfZsNA7fNQtZI7nAZse4Ehi5oTSLXBkThhGQ+q3i
   tgYs2g7L1pW0WRU5WoILigIseyLOZuRty/YMB0MyyX3LrVi75F+xVZryu
   +Zkl0ZmLlFbJTCzOQZ8vDXvpuQFPM7VFdusTIJ4gwz+UvNd0ubbtdY6EV
   w==;
X-CSE-ConnectionGUID: 0zRMaSJeSvmi2v3Xlq7UTw==
X-CSE-MsgGUID: wk8AV4hTRfiPSwxgGninww==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67278524"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67278524"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:11:20 -0800
X-CSE-ConnectionGUID: rmGtXc2eSwWITWYCd/F2hA==
X-CSE-MsgGUID: LDfwIrb7SK2QT1Py7ibkCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="200997518"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2025 05:11:18 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTJyL-000000003D7-0W7Y;
	Wed, 10 Dec 2025 13:11:13 +0000
Date: Wed, 10 Dec 2025 21:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/ubcore/ubcore_connect_adapter.c:189:26: sparse: sparse:
 symbol 'ubcore_find_remove_ex_tp_info' was not declared. Should it be
 static?
Message-ID: <202512102106.8emZWvbe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d80b9970681139376cf12bc9145051760176bb95
commit: cd3e93f2a6d3bba9ff616fb065a943877d3d7894 [3508/3508] urma: implement ubcore basic connection and bonding support
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102106.8emZWvbe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102106.8emZWvbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102106.8emZWvbe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcore_connect_adapter.c:189:26: sparse: sparse: symbol 'ubcore_find_remove_ex_tp_info' was not declared. Should it be static?

vim +/ubcore_find_remove_ex_tp_info +189 drivers/ub/urma/ubcore/ubcore_connect_adapter.c

   188	
 > 189	struct ubcore_ex_tp_info *
   190	ubcore_find_remove_ex_tp_info(struct ubcore_device *dev, uint64_t tp_handle)
   191	{
   192		struct ubcore_ex_tp_info *ex_tp_info = NULL;
   193		uint32_t hash;
   194	
   195		hash = ubcore_get_ex_tp_hash(&tp_handle);
   196		spin_lock(&dev->ht[UBCORE_HT_EX_TP].lock);
   197		if (dev->ht[UBCORE_HT_EX_TP].head == NULL) {
   198			spin_unlock(&dev->ht[UBCORE_HT_EX_TP].lock);
   199			return NULL;
   200		}
   201	
   202		ex_tp_info = ubcore_hash_table_lookup_nolock(&dev->ht[UBCORE_HT_EX_TP],
   203							     hash, &tp_handle);
   204		if (ex_tp_info == NULL) {
   205			spin_unlock(&dev->ht[UBCORE_HT_EX_TP].lock);
   206			ubcore_log_warn("Failed to find ex_tp_info, tp_handle: %llu.\n",
   207					tp_handle);
   208			return NULL;
   209		}
   210		ubcore_hash_table_remove_nolock(&dev->ht[UBCORE_HT_EX_TP],
   211						&ex_tp_info->hnode);
   212		spin_unlock(&dev->ht[UBCORE_HT_EX_TP].lock);
   213	
   214		return ex_tp_info;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
