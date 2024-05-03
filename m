Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B984152179
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737274; cv=none; b=KEtN84QDMniGJY3SrOTGcqM58aabUCDDGisjSY0pF6qJfWTlpgtgREx64PxyNTOW2EFaUGYbLTuLwy7bKxxlbeEWpdp1sLdVOmEzF2DZroz1HY+kQwR/WhM8CH0K71p6fzMGNe2baf2QjdKXanK8Tw1lv4F56RUSvrGI9uvc0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737274; c=relaxed/simple;
	bh=2IsXhYfbq0DnjmnBteMhBEQDqIf10OR2W5tBMKUzT6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FlCnc7r/P99P+bLyIGGHlUf5XQJRJMper8K3J/TpSiST3oxap1UoE0kFCS0WouTQaUzI0TGppiZ10CaWeZP7+stwGANpecPUpHyFazdT4dkTHAKSRjrMM73FBu4O3dRXwGmUXsWDtiKlbgjH3z+CPvqZIVKiRUp3KxNrhR1HiVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJYWF0Vo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJYWF0Vo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714737272; x=1746273272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2IsXhYfbq0DnjmnBteMhBEQDqIf10OR2W5tBMKUzT6c=;
  b=TJYWF0VoqFiIx+KKnhjUQXAdS4gLBuF3pWzgsnynBSd3JQULUlX+lVL1
   alPBAJt96/9n6qMy5cH6EUKBZi1Id8+y/JOLzHj87EOwKqiFncNd1JQoc
   bPUKZSIf0CWCZSvnAlvUCaMhVQY58gMNufmOjg6Mw0i5a8cG6hPtcNsX7
   /xocQvx1VIFnFgEdoOhxRj1r0Eskx7BE7r2gaawviVHTNTkiIyHPHuVPe
   JAEwA9UDMwOWtkSc0371XEeyqG6ckTEebHvKfDO7eORZ+Q/fWvimZcHXA
   dZok8UWglnIKnjM0FfPSKacihge2BJR/azRDMK2QqfzYPDYizfsmo+5w6
   w==;
X-CSE-ConnectionGUID: UGJufurcTM+5tBDj3I4EFg==
X-CSE-MsgGUID: 7b679gnlThGFCBHFbcRDZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21230381"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21230381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 04:54:31 -0700
X-CSE-ConnectionGUID: jKKWTQPTTzWGw7C+kcaTzw==
X-CSE-MsgGUID: /GZWh8c7R/qc9m1TLG7HyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27459875"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2024 04:54:29 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2rUh-000Beq-1l;
	Fri, 03 May 2024 11:54:27 +0000
Date: Fri, 3 May 2024 19:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Asad Kamal <asad.kamal@amd.com>
Subject: [linux-next:master 10507/10967]
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c:59:58: error: '%d' directive
 output may be truncated writing between 1 and 11 bytes into a region of size
 9
Message-ID: <202405031953.taqZevDO-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240503/202405031953.taqZevDO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031953.taqZevDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031953.taqZevDO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c: In function 'amdgpu_xcp_drm_dev_alloc':
>> drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c:59:58: error: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 9 [-Werror=format-truncation=]
      59 |         snprintf(dev_name, sizeof(dev_name), "amdgpu_xcp_%d", pdev_num);
         |                                                          ^~
   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c:59:46: note: directive argument in the range [-2147483648, 63]
      59 |         snprintf(dev_name, sizeof(dev_name), "amdgpu_xcp_%d", pdev_num);
         |                                              ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c:59:9: note: 'snprintf' output between 13 and 23 bytes into a destination of size 20
      59 |         snprintf(dev_name, sizeof(dev_name), "amdgpu_xcp_%d", pdev_num);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
