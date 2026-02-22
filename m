Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D4C72621
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771782415; cv=none; b=CA/EYP9/k1mxr7kejkdTg+2YrtuHklocaltdoYZbU+GGlCojd7vE1Im7JXByn72d02a5bS8Lg4YjqJzq9Q+79LJ1o3tV97Nr+1PL8YE/YrCtuHtEvDWCpkdGurx+qwbwrmNGjEqDQyl2+cCcwYqf1n88OwRN+EAtqkDwQY1de9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771782415; c=relaxed/simple;
	bh=YxjUjYmEQzsZd3u7CBgzkevZj7J6Yunev7zAfJh07W4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sPPym+rNCTdVO5CHhBzEnKD8sZtGEtfiocXUXeZRBbRwQZXo8ZBbv3NycixYhVkJ1nhFOLf1E5FndJEZOl0BiB1D6fu+FvP62d4f88Y/s3zLYzvJvFztzpvzhF9VfQk28yMEauQByPaQvWUIpRG9Xjmq6NYN4sjLPNRxhQcXzww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aav7DfCw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aav7DfCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771782412; x=1803318412;
  h=date:from:to:cc:subject:message-id;
  bh=YxjUjYmEQzsZd3u7CBgzkevZj7J6Yunev7zAfJh07W4=;
  b=Aav7DfCwMO6uKbSVBPLRL4EMbFalAWvkRmAmwprxCGNnv+DlC5q9jCot
   wA/AH7y7+dCHzDUq8zqKQKmSaEcPgqgm9UIOsreu3UiQow2tDSq7EVHGd
   aPiozV1nmDwZ+oMtqT5yuHh1WkKBo6OspJmN7KbQFfF3pQCAYa7cM4TfR
   gt/Fv80yfyHZ6XoQYZ7CfxNQCre7JSWNc/Foo10sVbVJ0z570SikDJ9wV
   LA5A4k/7JDPrIrhgHvFfogY7xLCXw1sBFz6MEzU61NB4SIazOPBHgffcP
   R9HwNyoEMBOwR1NcVxslwNrQ35vDCaWL6ktjHgfjnUclxajOK2pDm2Ekh
   g==;
X-CSE-ConnectionGUID: yzaZwdWkSJC+AHtJa31oJQ==
X-CSE-MsgGUID: J30RU5FETU66BvCEuf03hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="95409675"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="95409675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 09:46:51 -0800
X-CSE-ConnectionGUID: 0enSv3phS4OQDMyFYE/GUA==
X-CSE-MsgGUID: sao3zgDdSCa7XE3CED0H8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="243603876"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Feb 2026 09:46:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuDXc-000000015ca-1OfB;
	Sun, 22 Feb 2026 17:46:48 +0000
Date: Mon, 23 Feb 2026 01:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 58/60]
 drivers/cxl/core/region_sysram.c:94:22: error: implicit declaration of
 function 'add_private_memory_driver_managed'
Message-ID: <202602230115.bj7dunep-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: 6ac185af27a21c6c16bf4a85db934565424703b3 [58/60] cxl/core: Add private node support to cxl_sysram
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260223/202602230115.bj7dunep-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230115.bj7dunep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602230115.bj7dunep-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/region_sysram.c: In function 'sysram_hotplug_add':
   drivers/cxl/core/region_sysram.c:63:9: error: unknown type name 'mhp_t'
      63 |         mhp_t mhp_flags;
         |         ^~~~~
   drivers/cxl/core/region_sysram.c:83:21: error: 'MHP_NID_IS_MGID' undeclared (first use in this function)
      83 |         mhp_flags = MHP_NID_IS_MGID;
         |                     ^~~~~~~~~~~~~~~
   drivers/cxl/core/region_sysram.c:83:21: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/cxl/core/region_sysram.c:94:22: error: implicit declaration of function 'add_private_memory_driver_managed' [-Wimplicit-function-declaration]
      94 |                 rc = add_private_memory_driver_managed(sysram->mgid,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region_sysram.c:100:22: error: implicit declaration of function '__add_memory_driver_managed' [-Wimplicit-function-declaration]
     100 |                 rc = __add_memory_driver_managed(sysram->mgid,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region_sysram.c: In function 'sysram_hotplug_remove':
   drivers/cxl/core/region_sysram.c:134:22: error: implicit declaration of function 'offline_and_remove_memory'; did you mean 'offline_and_remove_private_memory'? [-Wimplicit-function-declaration]
     134 |                 rc = offline_and_remove_memory(sysram->hpa_range.start,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                      offline_and_remove_private_memory
   drivers/cxl/core/region_sysram.c: In function 'cxl_sysram_release':
   drivers/cxl/core/region_sysram.c:165:17: error: implicit declaration of function 'memory_group_unregister' [-Wimplicit-function-declaration]
     165 |                 memory_group_unregister(sysram->mgid);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region_sysram.c: In function 'devm_cxl_add_sysram':
   drivers/cxl/core/region_sysram.c:348:14: error: implicit declaration of function 'memory_group_register_static' [-Wimplicit-function-declaration]
     348 |         rc = memory_group_register_static(numa_node,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/add_private_memory_driver_managed +94 drivers/cxl/core/region_sysram.c

    59	
    60	static int sysram_hotplug_add(struct cxl_sysram *sysram, enum mmop online_type)
    61	{
    62		struct resource *res;
    63		mhp_t mhp_flags;
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
    83		mhp_flags = MHP_NID_IS_MGID;
    84	
    85		/*
    86		 * Ensure that future kexec'd kernels will not treat
    87		 * this as RAM automatically.
    88		 *
    89		 * For private regions, use add_private_memory_driver_managed()
    90		 * to register as N_MEMORY_PRIVATE which isolates the memory from
    91		 * normal allocations and reclaim.
    92		 */
    93		if (sysram->private)
  > 94			rc = add_private_memory_driver_managed(sysram->mgid,
    95							       sysram->hpa_range.start,
    96							       range_len(&sysram->hpa_range),
    97							       sysram_res_name, mhp_flags,
    98							       online_type, &sysram->np);
    99		else
   100			rc = __add_memory_driver_managed(sysram->mgid,
   101							 sysram->hpa_range.start,
   102							 range_len(&sysram->hpa_range),
   103							 sysram_res_name, mhp_flags,
   104							 online_type);
   105		if (rc) {
   106			remove_resource(res);
   107			kfree(res);
   108			sysram->res = NULL;
   109			return rc;
   110		}
   111	
   112		return 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
