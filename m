Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC652594B6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735495657; cv=none; b=klScmTwCfUriOGNCOreGR28z++sjsQDVCT2x3Zw05IcZwsBtyJGiFLo0nBHZHwlWp+0A6Rw1/UkKGpABi1Z168yQ7iQJVzPJEKKMLH2Gr0U6eaLYQpBxd1x14prNgIdskXJDbh7Nhlt3LTC5s0gojELgz8DGSeoRiTkPw8S2ug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735495657; c=relaxed/simple;
	bh=4UbW7UsekMJtXGuO0T6eJFfGou+UeZiRKt2oOhWj2T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=plOo2JgAg1BIoRAjrNpEsh+Tu34/iKkiBrboaIoRanqtGMoUXjUSqx6ATUB/v2lzMr6Uv/wkIImP2sNut2ijKUvCYJp1ANAoMK+QWYmPeoiO2fm5IF3BLTnVBirqUwImNIt8txm93HVc6ntpCP2VmmxMK7fcoIwAqMX3ZfKcM3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJimjmnJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJimjmnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735495656; x=1767031656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4UbW7UsekMJtXGuO0T6eJFfGou+UeZiRKt2oOhWj2T8=;
  b=TJimjmnJqwTYkvhhVCUQ4s+EGIL2+VivUm5SA1Szppon9IUdrVgbzGlx
   aL/71n7oZSjIq+qWkCIlpJPVUDWr7Paxs6zX9e0B3b5vMrqfs/eJvF+NP
   AgE8Z4+ZhQZLaKvi/etC6pvbKnFvuf7BLgXLzA0bNoNRFPmS1/mvw1kpI
   pWGT/xmvtNmqhDyZ90ADp0mZLGWEnGYcyWimgHoen4kdYOYqRKPVMwWPH
   h2vS/ls7hsdElxnwE2JudmkBLR68YYTnV5lD52NtSjkW9AoRyEYf+jTsS
   TNb2df7YGex0WCj6IRGy+7O3fFYp9zTkTsZTPBqd7kzbGfNncdETeHuw/
   Q==;
X-CSE-ConnectionGUID: vgyjag/RTV+aQnfj0Ud+1A==
X-CSE-MsgGUID: QNpE/HaKQEiNt5JeSeidOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35962162"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35962162"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 10:07:35 -0800
X-CSE-ConnectionGUID: 51R8JHOaTEmWR8AHhuOytQ==
X-CSE-MsgGUID: u9vxZ1WITYSYjc5DjQ+9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="100354209"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Dec 2024 10:07:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRxhL-0004s0-23;
	Sun, 29 Dec 2024 18:07:31 +0000
Date: Mon, 30 Dec 2024 02:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Gmeiner <cgmeiner@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: [linux-next:master 1073/5236]
 drivers/gpu/drm/v3d/v3d_perfmon.c:317:9: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202412300224.xS8gRG3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: c6eabbab359c156669e10d5dec3e71e80ff09bd2 [1073/5236] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
config: hexagon-randconfig-r133-20241229 (https://download.01.org/0day-ci/archive/20241230/202412300224.xS8gRG3b-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
reproduce: (https://download.01.org/0day-ci/archive/20241230/202412300224.xS8gRG3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412300224.xS8gRG3b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/v3d/v3d_perfmon.c:317:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/v3d/v3d_perfmon.c:405:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/v3d/v3d_perfmon.c:492:13: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/v3d/v3d_perfmon.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/stackdepot.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +317 drivers/gpu/drm/v3d/v3d_perfmon.c

   306	
   307	static int v3d_perfmon_idr_del(int id, void *elem, void *data)
   308	{
   309		struct v3d_perfmon *perfmon = elem;
   310		struct v3d_dev *v3d = (struct v3d_dev *)data;
   311	
   312		/* If the active perfmon is being destroyed, stop it first */
   313		if (perfmon == v3d->active_perfmon)
   314			v3d_perfmon_stop(v3d, perfmon, false);
   315	
   316		/* If the global perfmon is being destroyed, set it to NULL */
 > 317		cmpxchg(&v3d->global_perfmon, perfmon, NULL);
   318	
   319		v3d_perfmon_put(perfmon);
   320	
   321		return 0;
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
