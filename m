Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01031EB48D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 05:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722488840; cv=none; b=VyZ3HfYo25v8do1Zi4MsVDd0h4oStWTDPFOcPp6FTfWmdjsH+c8L+GfEtCHCOqtBHd87PyGud9RqYLQoKTxo3+LngueMVphX+9xP+kjAI8JKBJpBitinWDYU2Dm4W++ZvlT+gnvwXCBYRb4y7a1o6QglNXMP5Yn1IbEUcZlgZp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722488840; c=relaxed/simple;
	bh=+inXXmQk+Bg3IQuxYwx0UCPbfw0wPFtVM6Rpog8SUjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbIjphndIi9BFq+n8poj1F2lYX4jhpmz+VOcZq+qwaP60CkuVmfn4DSkSw6KuXEVM5509EeBMSWAKggBdq8nVYCs1tbLjMZDJI5p1lEf05kpiHub+ev+mwo7BM6pdLzuNRwi22AbZ9ZLT9LkWCwHiFVzBULo/0pLWydynyKRExQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFa8pL1k; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFa8pL1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722488838; x=1754024838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+inXXmQk+Bg3IQuxYwx0UCPbfw0wPFtVM6Rpog8SUjU=;
  b=hFa8pL1kNrAMzDyzoCdXjqeCKoWxC43keUqCJ2WnxFx/JsbVWUbqG4+o
   qa9nfontz0oH2fIqVWqIDnKDIhFoGu5i/Y09QUxPG98dwWLOJnnpP/i5X
   VaS40SGuBvPDxvSEAJPZYZQ34Gvzw6iCYhmfuCtYXKxY4G36XIiORnV66
   tipK48J/XV94G4rBP41cfAC+vm5jJynwMc0hjI5+pZVRDPXsSwuAQviGc
   Nh6jcDm6eGUPnGFatgehclS2GDHV0gCbd9BCfMuEUwZycubAPSby4O/Nw
   5XxpEADIy1cCohFgBSuOUWIEJbSD6ssjN3BZ1s/Ztw99Gkc8xreS+JNWm
   A==;
X-CSE-ConnectionGUID: 0LL5RWhwRr66/4JnEGCzWg==
X-CSE-MsgGUID: EIKFSp82STOzZfUmcaOnng==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20598700"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20598700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 22:07:17 -0700
X-CSE-ConnectionGUID: GCPc0aCUQDObNb0FW6anBA==
X-CSE-MsgGUID: KH48nnCnTwSBEliIJdppFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="85527399"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Jul 2024 22:07:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZO1x-000vDU-3D;
	Thu, 01 Aug 2024 05:07:13 +0000
Date: Thu, 1 Aug 2024 13:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/threshold-patchset 2/7]
 drivers/thermal/thermal_thresholds.c:22:13: warning: assignment makes
 pointer from integer without a cast
Message-ID: <202408011502.yW3eytja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/threshold-patchset
head:   50ba4b073af81ec2b408cb76a1ed337dcd593750
commit: 2acbbc182e1fd364e022c713c7ac7365fb97a485 [2/7] thermal/core: Add thresholds support
config: i386-randconfig-051-20240801 (https://download.01.org/0day-ci/archive/20240801/202408011502.yW3eytja-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011502.yW3eytja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011502.yW3eytja-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/thermal_thresholds.c: In function 'thermal_thresholds_init':
   drivers/thermal/thermal_thresholds.c:22:15: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
     thresholds = kmalloc(sizeof(*thresholds), GFP_KERNEL);
                  ^~~~~~~
                  mm_alloc
>> drivers/thermal/thermal_thresholds.c:22:13: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     thresholds = kmalloc(sizeof(*thresholds), GFP_KERNEL);
                ^
   drivers/thermal/thermal_thresholds.c: In function 'thermal_thresholds_exit':
   drivers/thermal/thermal_thresholds.c:35:2: error: implicit declaration of function 'kfree'; did you mean '__free'? [-Werror=implicit-function-declaration]
     kfree(tz->thresholds);
     ^~~~~
     __free
   drivers/thermal/thermal_thresholds.c: In function 'thermal_thresholds_add':
   drivers/thermal/thermal_thresholds.c:185:5: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      t = kmalloc(sizeof(*t), GFP_KERNEL);
        ^
   cc1: some warnings being treated as errors


vim +22 drivers/thermal/thermal_thresholds.c

    17	
    18	int thermal_thresholds_init(struct thermal_zone_device *tz)
    19	{
    20		struct thresholds *thresholds;
    21	
  > 22		thresholds = kmalloc(sizeof(*thresholds), GFP_KERNEL);
    23		if (!thresholds)
    24			return -ENOMEM;
    25	
    26		INIT_LIST_HEAD(&thresholds->list);
    27		tz->thresholds = thresholds;
    28	
    29		return 0;
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
