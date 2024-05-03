Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E4153815
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714742979; cv=none; b=Fxm7C03xZ2yc5H0ncveo381b+o4JmEQWbJTfOjhSe4lqHCytlRHrBSk2xcZFsJtPiJjmGSmxV+p+cChR4rxb0/SbWoBJyj64gjloVARDkhGHYIy/X2q/xnW486v/AMau0G7GuVSR6Iq7Ew0rhTU2cLOptK4Q142YEmj5tUcKQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714742979; c=relaxed/simple;
	bh=89JThmPNE1h+7CSCCxLWpFOS82LEXGRdT7WI5TtVO1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNuNDETSuyyOfIRPa4tvYZGSHn3V4I1OmA+ph9enQbvIh5qwCIgCzuz3rkqI0v5KtJ1YGTTUoDGTcoMYuzri5SulkJqAaebNcwZpgyHeduafhKdJNCA3IY50xupfayZSURD80iTPMSyYIN4qiTaRoT5noZTs76bt65WxC+bxaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdgHksgk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdgHksgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714742978; x=1746278978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89JThmPNE1h+7CSCCxLWpFOS82LEXGRdT7WI5TtVO1k=;
  b=KdgHksgkL/wQ+0SGtLKduj+cKes024SI+LS6NzcwA/Xlxc6XauMHWnda
   j0N64ZghUEjqPMkhg0d3bbGZpZqDUR1vm8hrcDkoUC3YA46bGbQumalWg
   Fx7AQbyvlkFmzuM41gEg4bvZQkekqV54An6+3iLh0BKEfOIwhn+lmj9ai
   ShhBTg5/B5xbegH2R7Ly9UoVIx8KY7jd3f03SQsdGpfQHXXOugSdd2hU4
   j+/TwpUIl/5eO+zUK9lkaJ7hDmJM+ep3KdKRi2mvkfDP1m0IlDc/P8/XW
   YcVvEcUJj+qm2bD2GcYCtTmI+6tOPw2yBHQJcjDtLFSokMqpNtGgPF5Pm
   Q==;
X-CSE-ConnectionGUID: uFKvA0K7RsK/FUBbK7M/ZA==
X-CSE-MsgGUID: fXtfC69MQ8yNOVbI6/sKvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10402539"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10402539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:29:36 -0700
X-CSE-ConnectionGUID: IssJMP45S/yOYmJ57tRfUA==
X-CSE-MsgGUID: JOQzMzbwS+qXgtuez/eJDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27857590"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2024 06:29:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2syh-000Bj3-2u;
	Fri, 03 May 2024 13:29:31 +0000
Date: Fri, 3 May 2024 21:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Asad Kamal <asad.kamal@amd.com>
Subject: [linux-next:master 10507/10967]
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c:59:58: warning: '%d' directive
 output may be truncated writing between 1 and 11 bytes into a region of size
 9
Message-ID: <202405032143.9iYuUxkm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9221b2819b8a4196eecf5476d66201be60fbcf29
commit: 97d814fe4f697791abfbe27e035f0b943c483243 [10507/10967] drm/amd/amdxcp: Use unique name for partition dev
config: csky-randconfig-r031-20220611 (https://download.01.org/0day-ci/archive/20240503/202405032143.9iYuUxkm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032143.9iYuUxkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032143.9iYuUxkm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c: In function 'amdgpu_xcp_drm_dev_alloc':
>> drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c:59:58: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 9 [-Wformat-truncation=]
      59 |         snprintf(dev_name, sizeof(dev_name), "amdgpu_xcp_%d", pdev_num);
         |                                                          ^~
   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c:59:46: note: directive argument in the range [-2147483648, 63]
      59 |         snprintf(dev_name, sizeof(dev_name), "amdgpu_xcp_%d", pdev_num);
         |                                              ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c:59:9: note: 'snprintf' output between 13 and 23 bytes into a destination of size 20
      59 |         snprintf(dev_name, sizeof(dev_name), "amdgpu_xcp_%d", pdev_num);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +59 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c

    48	
    49	int amdgpu_xcp_drm_dev_alloc(struct drm_device **ddev)
    50	{
    51		struct platform_device *pdev;
    52		struct xcp_device *pxcp_dev;
    53		char dev_name[20];
    54		int ret;
    55	
    56		if (pdev_num >= MAX_XCP_PLATFORM_DEVICE)
    57			return -ENODEV;
    58	
  > 59		snprintf(dev_name, sizeof(dev_name), "amdgpu_xcp_%d", pdev_num);
    60		pdev = platform_device_register_simple(dev_name, -1, NULL, 0);
    61		if (IS_ERR(pdev))
    62			return PTR_ERR(pdev);
    63	
    64		if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
    65			ret = -ENOMEM;
    66			goto out_unregister;
    67		}
    68	
    69		pxcp_dev = devm_drm_dev_alloc(&pdev->dev, &amdgpu_xcp_driver, struct xcp_device, drm);
    70		if (IS_ERR(pxcp_dev)) {
    71			ret = PTR_ERR(pxcp_dev);
    72			goto out_devres;
    73		}
    74	
    75		xcp_dev[pdev_num] = pxcp_dev;
    76		xcp_dev[pdev_num]->pdev = pdev;
    77		*ddev = &pxcp_dev->drm;
    78		pdev_num++;
    79	
    80		return 0;
    81	
    82	out_devres:
    83		devres_release_group(&pdev->dev, NULL);
    84	out_unregister:
    85		platform_device_unregister(pdev);
    86	
    87		return ret;
    88	}
    89	EXPORT_SYMBOL(amdgpu_xcp_drm_dev_alloc);
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
