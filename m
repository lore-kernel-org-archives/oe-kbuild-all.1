Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12F985931
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 05:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735880534; cv=none; b=kyPnscTp8meIXBP4twHFrUUBNeFwAdxrRvkJD14cUFs5Si0kcy4Y6IVhyhoj1BXh6UW9WhDVND4/bHRxBFIv+hfpfkSXGE6klEPRj5XT3l98u1yyV4QV0nGxLqFkMw/aymLwC/fVK9clw1R8rH94Ko1sMLOa+wlHyuZLfqchhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735880534; c=relaxed/simple;
	bh=UrG6Xq5iEd6mMzqtIF59u0/KBauq9HMZ/caeNpDM3To=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ii9mSH15ksUzCHD8CGxnQU6JdT7fD4mxe2i1Lwxmuxm9TPfFof7spqIp07ZYFhdAx+8ovy31XyTTEsiIWu8CnjKrDyWbsrLVm9KLsGS3+UzzdU6pCCAS1GR8ewI3t6crO0F3rVax1K5gYPmVZjcIuQbgxpSBfGf7/vuIiI9lQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOqw3FXg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOqw3FXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735880533; x=1767416533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UrG6Xq5iEd6mMzqtIF59u0/KBauq9HMZ/caeNpDM3To=;
  b=kOqw3FXgU7B49Mrrp+riMVBm0OHTxCMFR3wlevw2/iuWhqTWR+SzRmme
   jkaG4EjC/+S19mn7diP9pvsSLHIEEJOo+l+nXAtocV5ntHKV/AlzT/eMw
   tivPFX/BY+uExJC0GD3Ifgfe5aSRW4Xtrxr0/hAAsyTB6RBcvGrdOKCfG
   F9d/Ve/BCpMqInFR0Kc5edLgBqIokwYiNV7OHwGWDTTknyeg37xnS5BlK
   qpD8n7jfXjENs8nvobSEDaKachgA6O6KhQJ2sztQos6PRvPc4M6h9ZN+S
   Pw9OvgvgCOqvjc3gELPuFh0TeuBZV3YBNls8e/sZ37gGDozwQyOJf18Sf
   Q==;
X-CSE-ConnectionGUID: Hc/gBIcTS62RPaa196WCFg==
X-CSE-MsgGUID: JR+2YZtoQKCFDZcZ36525g==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="47486862"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47486862"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 21:02:09 -0800
X-CSE-ConnectionGUID: TDFu55/BQve1YidgmtmvOQ==
X-CSE-MsgGUID: srHgwv7mRv+YXcvSMQu3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101887237"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jan 2025 21:02:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTZp0-0009El-1e;
	Fri, 03 Jan 2025 05:02:06 +0000
Date: Fri, 3 Jan 2025 13:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Gmeiner <cgmeiner@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: [linux-next:master 1073/5236]
 drivers/gpu/drm/v3d/v3d_perfmon.c:317:9: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202501031246.AD8Jjze0-lkp@intel.com>
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
config: hexagon-randconfig-r133-20241229 (https://download.01.org/0day-ci/archive/20250103/202501031246.AD8Jjze0-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501031246.AD8Jjze0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031246.AD8Jjze0-lkp@intel.com/

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
