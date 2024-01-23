Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38B560EDF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705974926; cv=none; b=fMKkbHwpo4HGdqs/WkwMNvi4wPnaJfjhGPg0FCy1D9ixpzI/yi2HPG3/jTTp3BVQ57LUXSchedwLM2zqJ4eAi+YQAD1PfGeFOdVm+zVfNr2w+ThTJOdg2/n5YIlLxfgO4gUArCmSucnNtR9b6I6sgbdAym/TFCL5QCTQxJONe/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705974926; c=relaxed/simple;
	bh=s1O42Fw5CqMGDEL+J8NReUc7lKkFRsyAmvGdXMN3KsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0GGjeTJTPpzWJazL7q6ogE9rmHE8chxIVybs4qIKWCLEcVi3Fk3xHEUbqD2WoNHb+ijGrEoGF4/cMGYeeBFBTefBiew9hfPVka+1u6s96laOm/LYi+Ct74xdfPxwnZcVIgmW0Li9xMX0JQUbA8Rfd9Pgu7mh5ragCH7wFnMd/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfNSAhRx; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfNSAhRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705974923; x=1737510923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1O42Fw5CqMGDEL+J8NReUc7lKkFRsyAmvGdXMN3KsU=;
  b=NfNSAhRxkIGJgthJYjC/u4JlrzhphUqt1jhOkr4wHrOMoCxWN7HnRwZv
   uMMwDReZgGE7fM2l0ehBEjyIj4/nudFnC8M+vpSRxoSNp6kITPWvpHYZL
   ZBAjjOjuP3knsnqvzm2Qu1VMxbtRxvM+996iBIOaQd1EUYJxx4hXwf9S6
   bUdJUuerQcRoovQfa7iXV8MAzCfqeYWQqmjVnjvLPA0fPkDvJcbpDqz/C
   5OmLoiUfHJf3OVhkPM6ZzKSab7p1TLi/QXcuOaCF9tNiASAxKqHoY4/tD
   i1ymXkDJHCZaV2MFjcKouxMaM6VBewbBnh+8plPJgvwNP+r7y2CKCH9hJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="391810150"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="391810150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 17:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1500419"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2024 17:55:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rS60S-00075c-0s;
	Tue, 23 Jan 2024 01:55:16 +0000
Date: Tue, 23 Jan 2024 09:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15329/21565]
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:66:19: warning: array
 subscript 0 is outside array bounds of 'struct aperture[0]'
Message-ID: <202401230904.waKHfYdD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi shiyongbang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fb3a7131883be36037affebc26a6597087cbd012
commit: 97663f80b4826fcd792deef824b18510e139d674 [15329/21565] gpu: hibmc: Fix stuck when switch GUI to text.
config: arm64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240123/202401230904.waKHfYdD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230904.waKHfYdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401230904.waKHfYdD-lkp@intel.com/

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
