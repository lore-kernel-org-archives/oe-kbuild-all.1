Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52DE1856
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 05:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705729531; cv=none; b=oD+JbBR6INuCUWsvCOI8SVlNGwXlIcSIOrEe9+eQ3gVJhknO3zWfwoMcf0FWKhfyJG9bkTl2Knwn49Uhsn47UEL6fRgO1Inr5qCkaJWSEmjYJfFoPFAy5qBCruJ+dIv28xqXLhonW/0JqIMTbhO37Rmjk9Rfv023UFPhkgghHa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705729531; c=relaxed/simple;
	bh=O2kkhb1LouWmLoJvwuo6o2u2GIA5mxd3g/broZ2VUkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/28c8I23RFJhjItcG45+8cTTXnNK1IkVyJe2l6dM/a72bS2j9+DKn5vIlSTWMni9zE+z+gnKg6WHcjo3g/8Y9VYul1jzWv0QklcfRIVU7/xQQTm3we8hg30WsO9GaiXMzokjUKmQhb1S+6tRt1XjgVKl/h0w24KiroMMgcyxls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeps8hYm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeps8hYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705729529; x=1737265529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O2kkhb1LouWmLoJvwuo6o2u2GIA5mxd3g/broZ2VUkQ=;
  b=eeps8hYmMRILMGKBsVPfZmdjpUCbO8oW1lbqnyIBnPBPg4bWe8UswEt6
   tX1GJzrKcK6ELKJfs3L5sqWyDAagaj5LG8jkJsVw4jattzR7V9hlc5YFO
   /jvyxTlqoF/fnnNlTd8YeZyEMJwuzfXQdmqB4Gjstq6g+nRbmG8vH76Bx
   I/DTxCP1IJOu51/rwuhT+VP35gumkyjs8DO6b1cXytKA7trev18Oixxu+
   UnedJzzq2ijPKJf6UJ5VxOtWxDnKDP4k7X4KCmTsw9tPAioojB98f9VKm
   Xdl0NeruQkSg4CrEDU4OI2PJOsj3jLTxRTSTNcJ5oD2iuNK5XMdExCHn0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14264990"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="14264990"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 21:45:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="734718147"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="734718147"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Jan 2024 21:45:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR4AX-0004n2-2Q;
	Sat, 20 Jan 2024 05:45:25 +0000
Date: Sat, 20 Jan 2024 13:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-hmem-report 13/13] drivers/cxl/core/cdat.c:632:17:
 error: implicit declaration of function 'acpi_node_backed_by_real_pxm'
Message-ID: <202401201314.xzykMb0n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   b720bb8edd5a52abe7d5c888245352e3dbaefdb1
commit: 1be4f7102ff8722322c7935ae6c9a75527e3fd91 [13/13] cxl: Deal with numa nodes not enumarated by SRAT
config: arm-randconfig-001-20240119 (https://download.01.org/0day-ci/archive/20240120/202401201314.xzykMb0n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201314.xzykMb0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201314.xzykMb0n-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/cdat.c: In function 'cxl_update_hmat_access_coordinates':
   drivers/cxl/core/cdat.c:627:16: error: implicit declaration of function 'hmat_update_target_coordinates'; did you mean 'cxl_update_hmat_access_coordinates'? [-Werror=implicit-function-declaration]
     627 |         return hmat_update_target_coordinates(nid, &cxlr->coord[access], access);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                cxl_update_hmat_access_coordinates
   drivers/cxl/core/cdat.c: In function 'cxl_need_node_perf_attrs_update':
>> drivers/cxl/core/cdat.c:632:17: error: implicit declaration of function 'acpi_node_backed_by_real_pxm' [-Werror=implicit-function-declaration]
     632 |         return !acpi_node_backed_by_real_pxm(nid);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/acpi_node_backed_by_real_pxm +632 drivers/cxl/core/cdat.c

   629	
   630	bool cxl_need_node_perf_attrs_update(int nid)
   631	{
 > 632		return !acpi_node_backed_by_real_pxm(nid);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
