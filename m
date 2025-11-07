Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3398F30DEB8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762547725; cv=none; b=gi2Cv53VG6Zo24HVlhNPCb2nL6z7d1GwTJONaUAKLlCEBHZmmThDweReZ6uSp+EnyIOwA1fChUj8lRNLFsx/YXbjCaejAzgoTKLKw8AbcUyQplt2JGEAg/cPUFE3MKXdUbyJoZ63uaA0IdBw+HUBpi2XfIOamQfNkteKmzTEt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762547725; c=relaxed/simple;
	bh=ZHdB1k4tqiNCFfnnHS/Y64/bQTlpgeG4SJ/vKR6nyjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bTRrxcofvseqpFzIwt86MnwXF47wEfrSR+AD6CQzH0L4lpS1oZr3EYpHCQxwkajbchExbGAjzg2RqYtC28e8XoezrPeXFhpv1J6aKmk0023QnyMXoo91D+HVa4MEE9heAzAlWZexXoCbZuKlsTbBPvLibPcdbAr1zDxGMHwxs68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gp/Kdhrf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gp/Kdhrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762547723; x=1794083723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZHdB1k4tqiNCFfnnHS/Y64/bQTlpgeG4SJ/vKR6nyjM=;
  b=Gp/Kdhrf+UFyEKt+xO0CfEw+D1qrWyKnI7NW7vhCY0/2OXYbk8V1IyG+
   mswUATRAj4DdUYVkAup9gBfENaX0Ngs1T5wgf9BpWav8C/hE08kGWtbY8
   B0Wrtuc38jzx4WC4xRMKkE4BApvt/Qub6d+jK8rXtND0y1lQHRE/dsJcY
   t9KxCdrNSOkbQ3QSVfPDrthKD5Oa/i1lG/KcwtY1L6Xl8CVbo86tBvyw3
   sEHBdy9UDNrXfdO2f+30Gyy3LtXMx6Z4fADv5AuuIzrYRoTKDZQnQKW/T
   KU/0l7Jvl3U2By9Y0mB+GeZtFC+E2qvH7/hRLiPdOMhJG3QlGDLL1Fwoq
   A==;
X-CSE-ConnectionGUID: 5lHdJ5SFRrqF4q5SehSYEw==
X-CSE-MsgGUID: SipmGejgR6G1MSm1HLMalg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64401421"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64401421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 12:35:23 -0800
X-CSE-ConnectionGUID: PLkCNctgQI+f2xXpKg9FBg==
X-CSE-MsgGUID: 9uKCq1MqTRyHHuFHmN+lSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="218782262"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2025 12:35:22 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHTB1-0000Lp-0s;
	Fri, 07 Nov 2025 20:35:19 +0000
Date: Sat, 8 Nov 2025 04:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 4684/7207]
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c:80:17: error: implicit declaration
 of function 'drm_err'; did you mean 'pr_err'?
Message-ID: <202511080426.S2N9kMwx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c0826a5d9aa4d52206dd89976858457a2a8a7ed
commit: ea722522d505fa8fb3533a386adeb400607e5072 [4684/7207] drm/mm: replace drm_print.h include with a forward declaration
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511080426.S2N9kMwx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080426.S2N9kMwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080426.S2N9kMwx-lkp@intel.com/

Note: the linux-next/master HEAD 9c0826a5d9aa4d52206dd89976858457a2a8a7ed builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_setup_vram':
>> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:80:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
      80 |                 drm_err(dev, "Failed to allocate mmio\n");
         |                 ^~~~~~~
         |                 pr_err
   drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_vmbus_probe':
>> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:140:17: error: implicit declaration of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-declaration]
     140 |                 drm_warn(dev, "Failed to update vram location.\n");
         |                 ^~~~~~~~
         |                 dev_warn
--
   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_plane_atomic_check':
>> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:161:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
     161 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%d (pitch %d) greater than %ld\n",
         |                 ^~~~~~~
         |                 pr_err


vim +80 drivers/gpu/drm/hyperv/hyperv_drm_drv.c

76c56a5affeba1 Deepak Rawat       2021-05-27   68  
a0ab5abced550d Saurabh Sengar     2022-05-21   69  static int hyperv_setup_vram(struct hyperv_drm_device *hv,
76c56a5affeba1 Deepak Rawat       2021-05-27   70  			     struct hv_device *hdev)
76c56a5affeba1 Deepak Rawat       2021-05-27   71  {
76c56a5affeba1 Deepak Rawat       2021-05-27   72  	struct drm_device *dev = &hv->dev;
76c56a5affeba1 Deepak Rawat       2021-05-27   73  	int ret;
76c56a5affeba1 Deepak Rawat       2021-05-27   74  
76c56a5affeba1 Deepak Rawat       2021-05-27   75  	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
76c56a5affeba1 Deepak Rawat       2021-05-27   76  
76c56a5affeba1 Deepak Rawat       2021-05-27   77  	ret = vmbus_allocate_mmio(&hv->mem, hdev, 0, -1, hv->fb_size, 0x100000,
76c56a5affeba1 Deepak Rawat       2021-05-27   78  				  true);
76c56a5affeba1 Deepak Rawat       2021-05-27   79  	if (ret) {
76c56a5affeba1 Deepak Rawat       2021-05-27  @80  		drm_err(dev, "Failed to allocate mmio\n");
76c56a5affeba1 Deepak Rawat       2021-05-27   81  		return -ENOMEM;
76c56a5affeba1 Deepak Rawat       2021-05-27   82  	}
76c56a5affeba1 Deepak Rawat       2021-05-27   83  
76c56a5affeba1 Deepak Rawat       2021-05-27   84  	/*
76c56a5affeba1 Deepak Rawat       2021-05-27   85  	 * Map the VRAM cacheable for performance. This is also required for VM
76c56a5affeba1 Deepak Rawat       2021-05-27   86  	 * connect to display properly for ARM64 Linux VM, as the host also maps
76c56a5affeba1 Deepak Rawat       2021-05-27   87  	 * the VRAM cacheable.
76c56a5affeba1 Deepak Rawat       2021-05-27   88  	 */
76c56a5affeba1 Deepak Rawat       2021-05-27   89  	hv->vram = ioremap_cache(hv->mem->start, hv->fb_size);
76c56a5affeba1 Deepak Rawat       2021-05-27   90  	if (!hv->vram) {
76c56a5affeba1 Deepak Rawat       2021-05-27   91  		drm_err(dev, "Failed to map vram\n");
76c56a5affeba1 Deepak Rawat       2021-05-27   92  		ret = -ENOMEM;
76c56a5affeba1 Deepak Rawat       2021-05-27   93  		goto error;
76c56a5affeba1 Deepak Rawat       2021-05-27   94  	}
76c56a5affeba1 Deepak Rawat       2021-05-27   95  
76c56a5affeba1 Deepak Rawat       2021-05-27   96  	hv->fb_base = hv->mem->start;
76c56a5affeba1 Deepak Rawat       2021-05-27   97  	return 0;
76c56a5affeba1 Deepak Rawat       2021-05-27   98  
76c56a5affeba1 Deepak Rawat       2021-05-27   99  error:
76c56a5affeba1 Deepak Rawat       2021-05-27  100  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
76c56a5affeba1 Deepak Rawat       2021-05-27  101  	return ret;
76c56a5affeba1 Deepak Rawat       2021-05-27  102  }
76c56a5affeba1 Deepak Rawat       2021-05-27  103  
76c56a5affeba1 Deepak Rawat       2021-05-27  104  static int hyperv_vmbus_probe(struct hv_device *hdev,
76c56a5affeba1 Deepak Rawat       2021-05-27  105  			      const struct hv_vmbus_device_id *dev_id)
76c56a5affeba1 Deepak Rawat       2021-05-27  106  {
76c56a5affeba1 Deepak Rawat       2021-05-27  107  	struct hyperv_drm_device *hv;
76c56a5affeba1 Deepak Rawat       2021-05-27  108  	struct drm_device *dev;
76c56a5affeba1 Deepak Rawat       2021-05-27  109  	int ret;
76c56a5affeba1 Deepak Rawat       2021-05-27  110  
76c56a5affeba1 Deepak Rawat       2021-05-27  111  	hv = devm_drm_dev_alloc(&hdev->device, &hyperv_driver,
76c56a5affeba1 Deepak Rawat       2021-05-27  112  				struct hyperv_drm_device, dev);
76c56a5affeba1 Deepak Rawat       2021-05-27  113  	if (IS_ERR(hv))
76c56a5affeba1 Deepak Rawat       2021-05-27  114  		return PTR_ERR(hv);
76c56a5affeba1 Deepak Rawat       2021-05-27  115  
76c56a5affeba1 Deepak Rawat       2021-05-27  116  	dev = &hv->dev;
76c56a5affeba1 Deepak Rawat       2021-05-27  117  	init_completion(&hv->wait);
76c56a5affeba1 Deepak Rawat       2021-05-27  118  	hv_set_drvdata(hdev, hv);
76c56a5affeba1 Deepak Rawat       2021-05-27  119  	hv->hdev = hdev;
76c56a5affeba1 Deepak Rawat       2021-05-27  120  
76c56a5affeba1 Deepak Rawat       2021-05-27  121  	ret = hyperv_connect_vsp(hdev);
76c56a5affeba1 Deepak Rawat       2021-05-27  122  	if (ret) {
76c56a5affeba1 Deepak Rawat       2021-05-27  123  		drm_err(dev, "Failed to connect to vmbus.\n");
76c56a5affeba1 Deepak Rawat       2021-05-27  124  		goto err_hv_set_drv_data;
76c56a5affeba1 Deepak Rawat       2021-05-27  125  	}
76c56a5affeba1 Deepak Rawat       2021-05-27  126  
37aeccf5f839c1 Thomas Zimmermann  2024-09-30  127  	aperture_remove_all_conflicting_devices(hyperv_driver.name);
778e73d2411abc Thomas Zimmermann  2024-01-03  128  
a0ab5abced550d Saurabh Sengar     2022-05-21  129  	ret = hyperv_setup_vram(hv, hdev);
76c56a5affeba1 Deepak Rawat       2021-05-27  130  	if (ret)
76c56a5affeba1 Deepak Rawat       2021-05-27  131  		goto err_vmbus_close;
76c56a5affeba1 Deepak Rawat       2021-05-27  132  
76c56a5affeba1 Deepak Rawat       2021-05-27  133  	/*
76c56a5affeba1 Deepak Rawat       2021-05-27  134  	 * Should be done only once during init and resume. Failing to update
76c56a5affeba1 Deepak Rawat       2021-05-27  135  	 * vram location is not fatal. Device will update dirty area till
76c56a5affeba1 Deepak Rawat       2021-05-27  136  	 * preferred resolution only.
76c56a5affeba1 Deepak Rawat       2021-05-27  137  	 */
76c56a5affeba1 Deepak Rawat       2021-05-27  138  	ret = hyperv_update_vram_location(hdev, hv->fb_base);
76c56a5affeba1 Deepak Rawat       2021-05-27  139  	if (ret)
76c56a5affeba1 Deepak Rawat       2021-05-27 @140  		drm_warn(dev, "Failed to update vram location.\n");
76c56a5affeba1 Deepak Rawat       2021-05-27  141  
76c56a5affeba1 Deepak Rawat       2021-05-27  142  	ret = hyperv_mode_config_init(hv);
76c56a5affeba1 Deepak Rawat       2021-05-27  143  	if (ret)
f1f63cbb705dc3 Christophe JAILLET 2022-07-31  144  		goto err_free_mmio;
76c56a5affeba1 Deepak Rawat       2021-05-27  145  
76c56a5affeba1 Deepak Rawat       2021-05-27  146  	ret = drm_dev_register(dev, 0);
76c56a5affeba1 Deepak Rawat       2021-05-27  147  	if (ret) {
76c56a5affeba1 Deepak Rawat       2021-05-27  148  		drm_err(dev, "Failed to register drm driver.\n");
f1f63cbb705dc3 Christophe JAILLET 2022-07-31  149  		goto err_free_mmio;
76c56a5affeba1 Deepak Rawat       2021-05-27  150  	}
76c56a5affeba1 Deepak Rawat       2021-05-27  151  
663269cebc7157 Thomas Zimmermann  2024-09-24  152  	drm_client_setup(dev, NULL);
76c56a5affeba1 Deepak Rawat       2021-05-27  153  
76c56a5affeba1 Deepak Rawat       2021-05-27  154  	return 0;
76c56a5affeba1 Deepak Rawat       2021-05-27  155  
f1f63cbb705dc3 Christophe JAILLET 2022-07-31  156  err_free_mmio:
aed709355fd05e Michael Kelley     2025-02-10  157  	iounmap(hv->vram);
f1f63cbb705dc3 Christophe JAILLET 2022-07-31  158  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
76c56a5affeba1 Deepak Rawat       2021-05-27  159  err_vmbus_close:
76c56a5affeba1 Deepak Rawat       2021-05-27  160  	vmbus_close(hdev->channel);
76c56a5affeba1 Deepak Rawat       2021-05-27  161  err_hv_set_drv_data:
76c56a5affeba1 Deepak Rawat       2021-05-27  162  	hv_set_drvdata(hdev, NULL);
76c56a5affeba1 Deepak Rawat       2021-05-27  163  	return ret;
76c56a5affeba1 Deepak Rawat       2021-05-27  164  }
76c56a5affeba1 Deepak Rawat       2021-05-27  165  

:::::: The code at line 80 was first introduced by commit
:::::: 76c56a5affeba1e163b66b9d8cc192e6154466f0 drm/hyperv: Add DRM driver for hyperv synthetic video device

:::::: TO: Deepak Rawat <drawat.floss@gmail.com>
:::::: CC: Deepak Rawat <drawat.floss@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
