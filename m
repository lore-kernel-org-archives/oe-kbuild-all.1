Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263B4233127
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749717; cv=none; b=SvyYE2mrbPIaEvmkQzKPi30ILLqKJ1jr9Kuop6bvX3v60JhUtDTSaSNsMVp1c7geguSmT0PGYhanbciv6uuK4mDAMB+L6yWquFjsr0VNT/6NXjpqMBNz2ld6eKLdG1BDmDimSrM8BxWl84H3wupu+uT/bOp9CkfgX3FP2Ph2Ilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749717; c=relaxed/simple;
	bh=G5qOHcJ/qTcp1R/i+Sbs3qZEnPUCwUxh9/loLBYK3Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezmyVMEh2TECD2t3vFfYduwT6I88e1ZpbytZQd+R0yxWxkJ/l/chrKcJIMHHkzgNeXadalGqRn32QPIpCZ1hMW151DBWuRQq++stGHdSEJJrVogmIU8jxSb93UEojHh8VjJwDyNp/fM05t/53XnG+bQEompjaTXxN1AWPVFW3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYGy3bT8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYGy3bT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733749716; x=1765285716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G5qOHcJ/qTcp1R/i+Sbs3qZEnPUCwUxh9/loLBYK3Yo=;
  b=XYGy3bT8Nr4L4PDOwA+YwD+xwZYCJt7lVzSbPZqVlOYbsYjZ2C5bWWtB
   1nO8leoKMh8MSSl7gZ0LdqGAHOK0+vPuDIFkDeLK3DUIQlKch/3SI1FUr
   rxg6hZaiDVZ0Mmsm10FHzJJNx8VHe6R6v4MHFq7eQSfiAEQomVKaB0ZdZ
   wGCCb5XatqXH9LA9GJVOfwwPVeZgItJQxIGcBjxIXz/OlJ1KHgyeldaYR
   sTotQw7qoK3FQQzJDZh4MT9s3ThNi/L/KEH8blM/M0KVA/PLaYszA1osS
   NDlkbEOkRA/6Xh7ncT+nxMCkrpXn3BoHFf2UdDmWAuPBIJfsLE1hEKlVr
   w==;
X-CSE-ConnectionGUID: GlbdLvcsR3ilXvBEvpALlg==
X-CSE-MsgGUID: eBfyAvv3SSe5d/2HzcrCWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33958043"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="33958043"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 05:08:34 -0800
X-CSE-ConnectionGUID: NfNVoZ4lR7CUpqjsv4UtKg==
X-CSE-MsgGUID: aQvSd1ltSpugW/BTQWU3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="94746590"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2024 05:08:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKdV0-0004Lp-0q;
	Mon, 09 Dec 2024 13:08:30 +0000
Date: Mon, 9 Dec 2024 21:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>
Subject: [linux-next:master 1562/2442]
 drivers/gpu/drm/nouveau/nouveau_drm.c:129: warning: Function parameter or
 struct member 'gsp_logs' not described in 'NVIF_LOGS_DECLARE'
Message-ID: <202412092012.hLh0KSrp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d1486dca38afd08ca279ae94eb3a397f10737824
commit: 214c9539cf2f5a0116051dc8e2a36b0577383a5e [1562/2442] drm/nouveau: expose GSP-RM logging buffers via debugfs
config: loongarch-randconfig-001-20241209 (https://download.01.org/0day-ci/archive/20241209/202412092012.hLh0KSrp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412092012.hLh0KSrp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412092012.hLh0KSrp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nouveau_drm.c:129: warning: Function parameter or struct member 'gsp_logs' not described in 'NVIF_LOGS_DECLARE'
>> drivers/gpu/drm/nouveau/nouveau_drm.c:129: warning: expecting prototype for gsp_logs(). Prototype was for NVIF_LOGS_DECLARE() instead
--
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1136: warning: cannot understand function prototype: 'struct registry_list_entry '
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1340: warning: cannot understand function prototype: 'const struct nv_gsp_registry_entries r535_registry_entries[] = '
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2112: warning: cannot understand function prototype: 'struct rpc_ucode_libos_print_v1e_08 '
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2174: warning: expecting prototype for create_debufgs(). Prototype was for create_debugfs() instead
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2800: warning: Function parameter or struct member 'parent' not described in 'r535_gsp_copy_log'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2800: warning: Function parameter or struct member 'name' not described in 'r535_gsp_copy_log'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2800: warning: Function parameter or struct member 's' not described in 'r535_gsp_copy_log'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2800: warning: Function parameter or struct member 't' not described in 'r535_gsp_copy_log'


vim +129 drivers/gpu/drm/nouveau/nouveau_drm.c

   120	
   121	/**
   122	 * gsp_logs - list of nvif_log GSP-RM logging buffers
   123	 *
   124	 * Head pointer to a a list of nvif_log buffers that is created for each GPU
   125	 * upon GSP shutdown if the "keep_gsp_logging" command-line parameter is
   126	 * specified. This is used to track the alternative debugfs entries for the
   127	 * GSP-RM logs.
   128	 */
 > 129	NVIF_LOGS_DECLARE(gsp_logs);
   130	#endif
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
