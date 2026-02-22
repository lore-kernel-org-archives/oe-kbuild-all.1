Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9A19E7F7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771768366; cv=none; b=dJ+/X9p03WRBf80eJbbWrn146CCC5TxnJ/bc7T6Zilvivkx0ta6q8OAaAvPsE8RQ79q8GqMtFZRElPlrKZxdvH5VNM0qcYDmEipY17KUIFfRyW14Wm6E3s8isXNkESQhg2kNt0o9ZuFkpjb92/mVmqg6FVenzZJfqx5pPQpcGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771768366; c=relaxed/simple;
	bh=Y+ftN6SAloW9LRdsvk1SHuOgB4A3sWopk/8L8IQqoYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qt9OkVh7/HOMu7R5gXYBGiB6LsvADRfho4gBq72dWKpVaR4qPPsg04gRYCEQSES6h8MiSKjHA9FbmnTuc8z8eDgY3CsrjP1d2zyeKHvX1w//chapN8d9cOvCfuYFBlp5FiZy7EKIE6j4DAvg+/prPrYtyjKhHPclI04pnl/2d0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGjQOpGp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGjQOpGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771768363; x=1803304363;
  h=date:from:to:cc:subject:message-id;
  bh=Y+ftN6SAloW9LRdsvk1SHuOgB4A3sWopk/8L8IQqoYM=;
  b=VGjQOpGpDPmmvU8rGKG1q+Zi+igQJHYohO84KEsSjbsya1VEVwddfaYa
   G6fpItoMl/0tc7R903f1m6YqvRqgXd9eJ60ErjpHU+ta7IElIaAEaYVLN
   IA16wijm/D7DkXEpalTvJVZlV6p96PA3mVDIy42FhA3dcgJ6JbNvt9V4j
   eXQDGwUhVGAzYRBV8u8JBLWWhUKRaaAIF31UJEwXdzXTqgssNZZSPenYq
   pX13kJYRRKvi/932AZJyCkWdHJkD1rzN/wyin+VbQwvxgafI/gDH/MGTE
   X7w4QLwRYFk9pcbl7xYiOtuAxieLJ96DDmeKj0SWWOXRErIeG6EpRmeJg
   g==;
X-CSE-ConnectionGUID: 1YsmJvjcTRWJ/1+SEMeG5w==
X-CSE-MsgGUID: pNSwZfrGS324Vlec8EBfiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90194503"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="90194503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 05:52:42 -0800
X-CSE-ConnectionGUID: JcGnzbGIR3GdbH83Ny/hmg==
X-CSE-MsgGUID: Gv3JRpDVQ6y9TBwiGLyhWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="253023432"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Feb 2026 05:52:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu9t1-000000015Uq-39m3;
	Sun, 22 Feb 2026 13:52:39 +0000
Date: Sun, 22 Feb 2026 21:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 57/60]
 drivers/cxl/core/region_sysram.c:63:9: error: unknown type name 'mhp_t'
Message-ID: <202602222149.KbvohNxR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: baec60290631ac5603560724f70e769f8b71de4f [57/60] cxl/core: Add cxl_sysram region type
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260222/202602222149.KbvohNxR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602222149.KbvohNxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602222149.KbvohNxR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/region_sysram.c: In function 'sysram_hotplug_add':
>> drivers/cxl/core/region_sysram.c:63:9: error: unknown type name 'mhp_t'
      63 |         mhp_t mhp_flags;
         |         ^~~~~
>> drivers/cxl/core/region_sysram.c:83:21: error: 'MHP_NID_IS_MGID' undeclared (first use in this function)
      83 |         mhp_flags = MHP_NID_IS_MGID;
         |                     ^~~~~~~~~~~~~~~
   drivers/cxl/core/region_sysram.c:83:21: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/cxl/core/region_sysram.c:89:14: error: implicit declaration of function '__add_memory_driver_managed' [-Wimplicit-function-declaration]
      89 |         rc = __add_memory_driver_managed(sysram->mgid,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region_sysram.c: In function 'sysram_hotplug_remove':
>> drivers/cxl/core/region_sysram.c:111:14: error: implicit declaration of function 'offline_and_remove_memory'; did you mean 'offline_and_remove_private_memory'? [-Wimplicit-function-declaration]
     111 |         rc = offline_and_remove_memory(sysram->hpa_range.start,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              offline_and_remove_private_memory
   drivers/cxl/core/region_sysram.c: In function 'cxl_sysram_release':
>> drivers/cxl/core/region_sysram.c:141:17: error: implicit declaration of function 'memory_group_unregister' [-Wimplicit-function-declaration]
     141 |                 memory_group_unregister(sysram->mgid);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region_sysram.c: In function 'devm_cxl_add_sysram':
>> drivers/cxl/core/region_sysram.c:318:14: error: implicit declaration of function 'memory_group_register_static' [-Wimplicit-function-declaration]
     318 |         rc = memory_group_register_static(numa_node,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mhp_t +63 drivers/cxl/core/region_sysram.c

    59	
    60	static int sysram_hotplug_add(struct cxl_sysram *sysram, enum mmop online_type)
    61	{
    62		struct resource *res;
  > 63		mhp_t mhp_flags;
    64		int rc;
    65	
    66		if (sysram->res)
    67			return -EBUSY;
    68	
    69		res = request_mem_region(sysram->hpa_range.start,
    70					 range_len(&sysram->hpa_range),
    71					 sysram->res_name);
    72		if (!res)
    73			return -EBUSY;
    74	
    75		sysram->res = res;
    76	
    77		/*
    78		 * Set flags appropriate for System RAM. Leave ..._BUSY clear
    79		 * so that add_memory() can add a child resource.
    80		 */
    81		res->flags = IORESOURCE_SYSTEM_RAM;
    82	
  > 83		mhp_flags = MHP_NID_IS_MGID;
    84	
    85		/*
    86		 * Ensure that future kexec'd kernels will not treat
    87		 * this as RAM automatically.
    88		 */
  > 89		rc = __add_memory_driver_managed(sysram->mgid,
    90						 sysram->hpa_range.start,
    91						 range_len(&sysram->hpa_range),
    92						 sysram_res_name, mhp_flags,
    93						 online_type);
    94		if (rc) {
    95			remove_resource(res);
    96			kfree(res);
    97			sysram->res = NULL;
    98			return rc;
    99		}
   100	
   101		return 0;
   102	}
   103	
   104	static int sysram_hotplug_remove(struct cxl_sysram *sysram)
   105	{
   106		int rc;
   107	
   108		if (!sysram->res)
   109			return 0;
   110	
 > 111		rc = offline_and_remove_memory(sysram->hpa_range.start,
   112					       range_len(&sysram->hpa_range));
   113		if (rc)
   114			return rc;
   115	
   116		if (sysram->res) {
   117			remove_resource(sysram->res);
   118			kfree(sysram->res);
   119			sysram->res = NULL;
   120		}
   121	
   122		return 0;
   123	}
   124	
   125	int cxl_sysram_offline_and_remove(struct cxl_sysram *sysram)
   126	{
   127		return sysram_hotplug_remove(sysram);
   128	}
   129	EXPORT_SYMBOL_NS_GPL(cxl_sysram_offline_and_remove, "CXL");
   130	
   131	static void cxl_sysram_release(struct device *dev)
   132	{
   133		struct cxl_sysram *sysram = to_cxl_sysram(dev);
   134	
   135		if (sysram->res)
   136			sysram_hotplug_remove(sysram);
   137	
   138		kfree(sysram->res_name);
   139	
   140		if (sysram->mgid >= 0)
 > 141			memory_group_unregister(sysram->mgid);
   142	
   143		if (sysram->mtype)
   144			clear_node_memory_type(sysram->numa_node, sysram->mtype);
   145	
   146		kfree(sysram);
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
