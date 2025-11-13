Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB3333444
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030942; cv=none; b=jnFjYUWFwBfIaRHIyJaPyv7l6LYkM+eNgRElCkotLPwRgrqQVrdX+PXjuZMu3du+dcVCJnoavPnPg+I+I23cB3UHQeu/IVRz3um9nF8iGMFq1XH6dFpyzPKpOaYt8R4us9rB23S9LQY2VX15zpLgJ2dYpo/8mwbkyG0pz3M5QdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030942; c=relaxed/simple;
	bh=on8Z8Ar/Jq32wVZ2L3QpcWlS6FXUbaMoE9MKXWZH3p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5rlUi6f9aBEPc3xpPureDW5MGhK9umP/M880UZRaYzJPxJc+dNXm4e69Z26CgcuRl5+U7ZsU9CiX4KgSyiZvFTkxVtlKPUJD5H7/121so1A/PiujvktuYYVCdxsXOLtWdDqBeibE2ad9D6XNJA5xeUrZg0/pS363zu8I3ROB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axuy4iW3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axuy4iW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763030941; x=1794566941;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=on8Z8Ar/Jq32wVZ2L3QpcWlS6FXUbaMoE9MKXWZH3p4=;
  b=axuy4iW3DqCTiCsH1atKsQA4zuxGNe26H60gB/PqWA8OqNmvvMNmlfTo
   XjQXFdu24Xlyq4CsccnJI+Pt1g63Q/PTWoD7nc5BSBsxXnltV6/b1HnJX
   je4sDjdsqQ6nYStwk96tRYWr1rx2qOYx5pJvGBVhuap7MuAcKTTJVQq8h
   N4v11Q/umkD9q8jIRty5qAXWOE17r+5GOXr70N4djksrm1GHUiOfOuC2H
   bp6qrCixu2om+Et/9c5r4y4pXZE2iZ3vydkm6KmE8vOf9Ng7RW2d+9FlR
   Fg5Pux2wMwU7xnoGj7KfnYGjChuU2lZOc586oUGwc1i/XHQNhAtRULK9u
   Q==;
X-CSE-ConnectionGUID: QmoXWW3tRTmsdN5dDnG5Hg==
X-CSE-MsgGUID: Qu70u/I1RIKw7rQ8N8+BPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="90579995"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="90579995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 02:49:00 -0800
X-CSE-ConnectionGUID: Yzp1EgFzS7GYmdESBSu2/w==
X-CSE-MsgGUID: DgFYA0mPQdqUNpK2LcU1UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189745958"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 02:48:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJUsq-0005Bc-1X;
	Thu, 13 Nov 2025 10:48:56 +0000
Date: Thu, 13 Nov 2025 18:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 24/62]
 drivers/gpu/drm/xe/xe_device.c:997:22: error: 'id' undeclared; did you mean
 'fd'?
Message-ID: <202511131819.eF8B67cM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   57dc6a91148b6b50bebe454028ce2488d74422df
commit: 77c2336923d4a7f24d717ae22128e5cb65162650 [24/62] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: arc-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131819.eF8B67cM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131819.eF8B67cM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131819.eF8B67cM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_device.c:6:
   drivers/gpu/drm/xe/xe_device.c: In function 'xe_device_shutdown':
>> drivers/gpu/drm/xe/xe_device.c:997:22: error: 'id' undeclared (first use in this function); did you mean 'fd'?
     for_each_gt(gt, xe, id)
                         ^~
   drivers/gpu/drm/xe/xe_device.h:131:8: note: in definition of macro 'for_each_gt'
     for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
           ^~~~
   drivers/gpu/drm/xe/xe_device.c:997:22: note: each undeclared identifier is reported only once for each function it appears in
     for_each_gt(gt, xe, id)
                         ^~
   drivers/gpu/drm/xe/xe_device.h:131:8: note: in definition of macro 'for_each_gt'
     for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
           ^~~~
   In file included from include/linux/kernel.h:36,
                    from include/linux/interrupt.h:6,
                    from include/drm/drm_util.h:35,
                    from drivers/gpu/drm/xe/xe_device.h:9,
                    from drivers/gpu/drm/xe/xe_device.c:6:
>> drivers/gpu/drm/xe/xe_device.c:997:14: error: 'gt' undeclared (first use in this function)
     for_each_gt(gt, xe, id)
                 ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
    #define for_each_if(condition) if (!(condition)) {} else
                                         ^~~~~~~~~
   drivers/gpu/drm/xe/xe_device.c:997:2: note: in expansion of macro 'for_each_gt'
     for_each_gt(gt, xe, id)
     ^~~~~~~~~~~


vim +997 drivers/gpu/drm/xe/xe_device.c

dd08ebf6c3525a Matthew Brost     2023-03-30   988  
dd08ebf6c3525a Matthew Brost     2023-03-30   989  void xe_device_shutdown(struct xe_device *xe)
dd08ebf6c3525a Matthew Brost     2023-03-30   990  {
b11a020d914c3b Jouni Högander    2025-10-31   991  	drm_dbg(&xe->drm, "Shutting down device\n");
b11a020d914c3b Jouni Högander    2025-10-31   992  
501d799a47e2b8 Maarten Lankhorst 2024-09-05   993  	xe_display_pm_shutdown(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05   994  
501d799a47e2b8 Maarten Lankhorst 2024-09-05   995  	xe_irq_suspend(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05   996  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  @997  	for_each_gt(gt, xe, id)
501d799a47e2b8 Maarten Lankhorst 2024-09-05   998  		xe_gt_shutdown(gt);
501d799a47e2b8 Maarten Lankhorst 2024-09-05   999  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  1000  	xe_display_pm_shutdown_late(xe);
b11a020d914c3b Jouni Högander    2025-10-31  1001  
b11a020d914c3b Jouni Högander    2025-10-31  1002  	if (!xe_driver_flr_disabled(xe)) {
501d799a47e2b8 Maarten Lankhorst 2024-09-05  1003  		/* BOOM! */
501d799a47e2b8 Maarten Lankhorst 2024-09-05  1004  		__xe_driver_flr(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  1005  	}
dd08ebf6c3525a Matthew Brost     2023-03-30  1006  }
dd08ebf6c3525a Matthew Brost     2023-03-30  1007  

:::::: The code at line 997 was first introduced by commit
:::::: 501d799a47e2b83b4e41d5306c2266ea5c100a08 drm/xe: Wire up device shutdown handler

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
