Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FE37F8D5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 16:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409948; cv=none; b=pdz+XilKqTZzfZW2gYwG4i0kd7Kc6Fj4TCeVlegbi/DgVnDM1EwYi8uQB4TVabqH136rKPR3sGzy08X/7sPMlv8HlXtfXQhn9iSLl7EBkbxp8+jUQyuft4wu3ipqSF1X2L8nX2yznUdorQeccaqOs4bBEM8mgCOsfoCJ/TpekxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409948; c=relaxed/simple;
	bh=acRrVwqsE9WCLmNKsk6KerC3WymRJzSnpPGaKO69GJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HtmobhcTVT3N54fCSmdfcdBBAY7iWB5iFchNwG/NTrMkV0SeGOzOLDTnvZ59roXwWD2mPGQq1Wp/XMEDqDAft6A7or/aYnEIj594Vesmcjg2mIUr9VFAJ62ZA32R/VYu8zZNqhUjeFOeMt1Ux5RliQ1fsVt3u1EA5TiCVLWTa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUMQPWP0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUMQPWP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768409948; x=1799945948;
  h=date:from:to:cc:subject:message-id;
  bh=acRrVwqsE9WCLmNKsk6KerC3WymRJzSnpPGaKO69GJE=;
  b=mUMQPWP0EN765dCWJlsbnCJ6Iy82BrtAbF6UjhPiCI0dZj3q+HClvZ+H
   CjtU7EU9Q28GQtEAllAq0leQqMc1Nu7+5T7fjvBvzOC10k6Aqrz096NWo
   WobbXEzqLka8lWicajzwQnQTx5XuNDNynjXOL9hrer6pdaEZcy2QO89rZ
   xaTCz8KE4PeADR66FyISdIlgNxIpY39A2AAOwwoNQ5I/6z0IUsVGxkQ/5
   uC9qJ2OAKCysE8DwCIJytMjaR0esCg4UTnCPHGfVdirCAivsWteU7wJBY
   c0jaJRcB8+rAIB8osGtEyyFeR/V7Wb/OyNe2huFZAJTEuC9DwEtjDTB16
   w==;
X-CSE-ConnectionGUID: SZYdtzuDTqykb/YuVoIDzw==
X-CSE-MsgGUID: eZ68nj/LTRKX/On4+4lECQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69622263"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69622263"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 08:59:05 -0800
X-CSE-ConnectionGUID: EoZM5cdtS4G4wsB0lj0NAg==
X-CSE-MsgGUID: zprJqgfqTxWEtZQxJYZ5kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204757284"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 08:59:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg4Cy-00000000GhW-3qTJ;
	Wed, 14 Jan 2026 16:59:00 +0000
Date: Thu, 15 Jan 2026 00:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/video/fbdev/hyperv_fb.c:1109:28: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202601150020.WKLVytsu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   32c7c0a13e486b127821c1d74f7dbd3ff78ce493
commit: c198157ae1585495908a23e7adf578c571e78323 [2/2] fbdev: hyperv_fb: iounmap() the correct memory when removing a device
config: x86_64-randconfig-r131-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150020.WKLVytsu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150020.WKLVytsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150020.WKLVytsu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/hyperv_fb.c:1026:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got unsigned char *mmio_vp @@
   drivers/video/fbdev/hyperv_fb.c:1026:43: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/hyperv_fb.c:1026:43: sparse:     got unsigned char *mmio_vp
   drivers/video/fbdev/hyperv_fb.c:1069:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/hyperv_fb.c:1073:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got unsigned char *dio_vp @@
   drivers/video/fbdev/hyperv_fb.c:1073:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/hyperv_fb.c:1073:27: sparse:     got unsigned char *dio_vp
>> drivers/video/fbdev/hyperv_fb.c:1109:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char *mmio_vp @@
   drivers/video/fbdev/hyperv_fb.c:1109:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/hyperv_fb.c:1109:28: sparse:     got unsigned char *mmio_vp

vim +1109 drivers/video/fbdev/hyperv_fb.c

  1101	
  1102	/* Release the framebuffer */
  1103	static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
  1104	{
  1105		struct hvfb_par *par = info->par;
  1106	
  1107		if (par->need_docopy) {
  1108			vfree(par->dio_vp);
> 1109			iounmap(par->mmio_vp);
  1110			vmbus_free_mmio(par->mem->start, screen_fb_size);
  1111		} else {
  1112			hvfb_release_phymem(hdev, info->fix.smem_start,
  1113					    screen_fb_size);
  1114		}
  1115	
  1116		par->mem = NULL;
  1117	}
  1118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
