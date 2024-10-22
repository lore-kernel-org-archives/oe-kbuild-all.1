Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8147112FB2E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580844; cv=none; b=ooyGi/uNhTFipTk55ZEFwBnZB9Zit3CGsJYG59LU4aSp9+XqkFPCkCVynoHAnGJTEKn7QzD/8Kt+bHK4Sz9znb85mxRSUnLlryXlX6iVJAorPu1Qf6CsHWDvNNSLEeboXcuc5YAlCFGDvQT+UWn/dITqHt+Mxx+tP1sLtsYIlwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580844; c=relaxed/simple;
	bh=9fMLKSLXFlem/QpeLnzMU6IMpVhoegxwSf3gHyadlrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLRwqOk6PeYnOFk9euqNaIg9czEM1qabzeGK1gszYdSOAyuqGlkKHoKIymb/Apau+bkYz28C11+RIboS3xdP7FfnxGF+asNe930ykQa7VHZWY/X89mrenR+y6R+C191IOIEAZYu+uls8hGvRiiNmZhArep1df2DohQK2l7sjIxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCmRWlJS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCmRWlJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729580842; x=1761116842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9fMLKSLXFlem/QpeLnzMU6IMpVhoegxwSf3gHyadlrQ=;
  b=dCmRWlJS4DLhwS7lfuFvQkrZjc31/1EjGhnJLj0gCmHo5hZZRLgBcrYH
   2+iDxpNibhZRJc2aX2Jo9otLHZklF/I+ZE+CEvb4WfKucQiyQU30Gnaiu
   05IPHA+oWAPkqY3FELbBZoWEZoRlvB/t2ONy4pzF1oIMU1Kh+Ly8tR/ZC
   DcOx+m5Kcsf89NtAMfcnuIsc06GBBPNO+3qsLM9V85eUedzzmUx4mDz56
   SATLDcm3HTdWFBvc/rFz6QMWtM1gnYhfiicNMlwa9dQA9xpdgtEx57YwC
   jscOF3SOWpKX8ZcLVB22QzgeLvIXoOT8AF1tu7Wz9vpuI+Fx2AL+c/9+b
   g==;
X-CSE-ConnectionGUID: MmSfMH7wTGe9whijsvNZsQ==
X-CSE-MsgGUID: 6PFq/MnyQfW9PWbpIwzEOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32906331"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="32906331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 00:07:20 -0700
X-CSE-ConnectionGUID: 6ku72ENYT5yeKkfp9zWjnQ==
X-CSE-MsgGUID: aDCbuiRaSgabxUiWTIShBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79336501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2024 00:07:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t38z7-000TDi-2s;
	Tue, 22 Oct 2024 07:07:17 +0000
Date: Tue, 22 Oct 2024 15:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_pfs_parent 7/8] net/devlink/core.c:536:
 warning: expecting prototype for devlink_alloc_shared(). Prototype was for
 __devlink_alloc_shared() instead
Message-ID: <202410221432.CHmSFXqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_pfs_parent
head:   34d2a95831164325b8a8050e6092dce20d050743
commit: dc0295622a8904261675fbf1b38f435c7db9296d [7/8] devlink: unfi
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241022/202410221432.CHmSFXqx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221432.CHmSFXqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221432.CHmSFXqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/devlink/core.c:536: warning: expecting prototype for devlink_alloc_shared(). Prototype was for __devlink_alloc_shared() instead


vim +536 net/devlink/core.c

   521	
   522	/**
   523	 * devlink_alloc_shared - Allocate new shared devlink instance resources
   524	 * @ops: ops
   525	 * @priv_size: size of user private data
   526	 * @net: net namespace
   527	 * @module: module owner
   528	 * @per_module_id: uniqueue id within the module
   529	 *
   530	 * Allocate new devlink instance resources, including devlink index
   531	 * and name. If instance already exists, just take a reference.
   532	 */
   533	struct devlink *__devlink_alloc_shared(const struct devlink_ops *ops,
   534					       size_t priv_size, struct net *net,
   535					       struct module *module, u64 per_module_id)
 > 536	{
   537		struct devlink *devlink;
   538		unsigned long index;
   539	
   540		if (WARN_ON(!module))
   541			return NULL;
   542		devlinks_xa_for_each_get(net, index, devlink) {
   543			if (devlink->module == module &&
   544			    devlink->per_module_id == per_module_id)
   545				/* Reference was taken, return. */
   546				return devlink;
   547			devlink_put(devlink);
   548		}
   549		return __devlink_alloc_ns(ops, priv_size, net, NULL, module, per_module_id);
   550	}
   551	EXPORT_SYMBOL_GPL(__devlink_alloc_shared);
   552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
