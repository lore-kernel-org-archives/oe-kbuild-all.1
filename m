Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D722815C6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 03:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTODGlTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705203751; x=1736739751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aKkWdErzFt+03ZegZ+jKIUrCm4U516k00c9bYj0AkqQ=;
  b=QTODGlTEwgRyCPYM2At41e1kjF4cie3KQcIVbdepr650lwIWJgXee5s7
   E8ywFvr7hC5FpfSDVPmH3ckceDog1BPEEW+Ma5iSJvjsdINqqGc0JG4pM
   MsmNZjlkd/rRJjNNRm1UJ+7Wv78QPV+tG4emZfv33f2zNG7OuzbtS78ZC
   8hqlV4lUO3BTBfNJ2vxDfljnm/0dm2GVAbvIErXIfsDCPMXRiWGrvp/1I
   WttnM8oa+0o9A08ZW0Cwp4Gr9a10Lf+2moT7L5sjKOiG7ClKzVwkiBusT
   yhOEuiWDQzPZgyJZkuXA8JpE9zgybxoYEVf9o5PT6CJARRfhyIy9G+y8H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="465810787"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="465810787"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 19:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="759526599"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="759526599"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2024 19:42:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOrOF-000BAC-2O;
	Sun, 14 Jan 2024 03:42:27 +0000
Date: Sun, 14 Jan 2024 11:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15329/21544]
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:66:19: warning: array
 subscript 0 is outside array bounds of 'struct aperture[0]'
Message-ID: <202401141153.bOk4qdT5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 97663f80b4826fcd792deef824b18510e139d674 [15329/21544] gpu: hibmc: Fix stuck when switch GUI to text.
config: arm64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240114/202401141153.bOk4qdT5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141153.bOk4qdT5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141153.bOk4qdT5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:40:13: warning: no previous prototype for 'hibmc_drm_interrupt' [-Wmissing-prototypes]
      40 | irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
         |             ^~~~~~~~~~~~~~~~~~~
   In function 'hibmc_remove_framebuffers',
       inlined from 'hibmc_pci_probe' at drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:386:2:
>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:66:19: warning: array subscript 0 is outside array bounds of 'struct aperture[0]' [-Warray-bounds=]
      66 |         ap->ranges[0].base = pci_resource_start(pdev, 0);
         |         ~~~~~~~~~~^~~
   In file included from include/drm/drm_crtc.h:31,
                    from include/drm/drm_atomic_helper.h:31,
                    from drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:22:
   include/linux/fb.h: In function 'hibmc_pci_probe':
   include/linux/fb.h:527:19: note: while referencing 'ranges'
     527 |                 } ranges[0];
         |                   ^~~~~~
   In function 'hibmc_remove_framebuffers',
       inlined from 'hibmc_pci_probe' at drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:386:2:
   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:67:19: warning: array subscript 0 is outside array bounds of 'struct aperture[0]' [-Warray-bounds=]
      67 |         ap->ranges[0].size = pci_resource_len(pdev, 0);
         |         ~~~~~~~~~~^~~
   include/linux/fb.h: In function 'hibmc_pci_probe':
   include/linux/fb.h:527:19: note: while referencing 'ranges'
     527 |                 } ranges[0];
         |                   ^~~~~~


vim +66 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c

    57	
    58	static void hibmc_remove_framebuffers(struct pci_dev *pdev)
    59	{
    60		struct apertures_struct *ap;
    61	
    62		ap = alloc_apertures(1);
    63		if (!ap)
    64			return;
    65	
  > 66		ap->ranges[0].base = pci_resource_start(pdev, 0);
    67		ap->ranges[0].size = pci_resource_len(pdev, 0);
    68	
    69		drm_fb_helper_remove_conflicting_framebuffers(ap, "hibmcdrmfb", false);
    70	
    71		kfree(ap);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
