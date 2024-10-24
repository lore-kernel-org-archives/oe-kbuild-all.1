Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05300170A01
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 05:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729747778; cv=none; b=TbXVX2o3btPw9xy1x7VLvxQis9VoBp2GAXkLfWg1oFSSEhQ32B1Tz4uZAkxAGFMMYhLU0msmzPuc3nm3DI2DeJtnyVYg0LyfhOhkZzTjCRvJ4JUOZLtXjOQH7wyG6ZSlpb65wUntopsBdx75ABy/ANraYOPKa/ZqoiBGrhqDa0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729747778; c=relaxed/simple;
	bh=fu0lzxPWNQngTXiur9mVrAAa+mmahXHE1Zi0QA5FAu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G1FJ6rx1LNC4InW+G1EjXfeBumd5NdeHel9BagfA800+7Gt4CaWaLEPEeA8krq6LShWA9FeyIRxFA2tZspyAScsix0HPTkr7GS4fjRyDi2S/hVQECpu3ZXxRjqr74TyxWVRjIJdLvVfUTpU1zoG5KgMrRO+lg2cpjoNSVHwpCv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMtrST1/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMtrST1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729747777; x=1761283777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fu0lzxPWNQngTXiur9mVrAAa+mmahXHE1Zi0QA5FAu0=;
  b=mMtrST1/4lsh7+nzvFYRRJJYpCMjTAiHVghShOtHQ6G7AevIJyHqDgHG
   3JIkN08FoVPbT0a+5/HzAkWrBO6Cy3Y4mHyLxoLXyOHvCe5ryg7V9PuT9
   EYfbJnyHVzoUqsvPDrkaPij1vispNa1kpNjhSIBlt9G3CulV4jLIOLRtx
   wwNEDRTXgEvt4nHtbUAzgz2NK5cEAXfxIuwFIifYT4C74QqCvY8f/MZMS
   JSpefpTw0kCUjh5Wj4turPmcWW2FFA+Ps+I70qYAFJTilebjuuBmL7oNZ
   sf269oHnMfwTgg78WmMuaqpeWcsLtffdroRqb4JsIsiX3u8SR3LTu4J3j
   Q==;
X-CSE-ConnectionGUID: qwftds++RIGko2LgTqmGpw==
X-CSE-MsgGUID: I025cb0iS/iszHPG5I5xew==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29583863"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="29583863"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 22:29:36 -0700
X-CSE-ConnectionGUID: RBzTkvfMRwylhsPODrOFEQ==
X-CSE-MsgGUID: HwatkLSXSJmKv+SwlG4qgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80146635"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Oct 2024 22:29:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3qPd-000Vye-29;
	Thu, 24 Oct 2024 05:29:33 +0000
Date: Thu, 24 Oct 2024 13:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_pfs_parent 7/8] net/devlink/core.c:385:52:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202410241327.t93z1VKG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_pfs_parent
head:   daabd0570d587da0f8bd1b715713a972e84b1663
commit: e69512e22603eb869f18e60644a2c00cfc67c064 [7/8] devlink: unfi
config: riscv-randconfig-r123-20241023 (https://download.01.org/0day-ci/archive/20241024/202410241327.t93z1VKG-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241024/202410241327.t93z1VKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241327.t93z1VKG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/devlink/core.c:385:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted xa_mark_t [usertype] filter @@     got int @@
   net/devlink/core.c:385:52: sparse:     expected restricted xa_mark_t [usertype] filter
   net/devlink/core.c:385:52: sparse:     got int

vim +385 net/devlink/core.c

   382	
   383	struct devlink *devlinks_xa_find_get(struct net *net, unsigned long *indexp)
   384	{
 > 385		return __devlinks_xa_find_get(net, indexp, XA_MAX_MARKS);
   386	}
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
