Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F115854F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739517516; cv=none; b=pfmYYmAqBHc3l4Qqq3qi9mFccFwdjPdjBCY9QPicmc5NoBNaP/ynsjRhjXrMy/SeddCv6Hd0ZBy4iyijC2QPkf7VnnihK0DiSn1+ZPVkysI0hC1Rm9s9WmDk84ULBDFgtkk0gyoOUO7MBpMxUzE1G45LHBls3klsIYgElITiHpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739517516; c=relaxed/simple;
	bh=nYSxCDbBwgGI1vR9WDXRVUZOhVB/ixVWaB3Z657XqGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYlsEMoTNlELP4icc3hg1t+TMA46stci+9DmcyWWR87OUebvv0Mx1N470gKWI58oDLfc/x4y5T2k02pGVdjmPeBaR61SNpA51wCYi2gbMUDlYzZ6TQGP4F2dHS5KMG4f5BDwsIKKwYi+0QvMzxR6A1TzLb9w2hyPMBjfnUjakdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/rVt8h1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/rVt8h1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739517515; x=1771053515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nYSxCDbBwgGI1vR9WDXRVUZOhVB/ixVWaB3Z657XqGA=;
  b=S/rVt8h1fb5cjg5bvZYNj6JYL9rvpCXrrYdfhYoEa7KGTLDFpPzxnOqh
   rxJng4MKmbLbjsXo3APmxGvAEript7wgkdGidepyMRIalK1agKMjtxX8m
   DFdg6I2vZPBS+JTBWP1MiFjKWvvNb6pC8oUF2tldz0OpAgm4C0XSLmH7w
   Wso3YZsrHm1wx5trdGNtLbtwq7ZUuoZrTFv0cGQtQyLu8gsX815ZuEh6X
   ybN4UuwvWnf3l39t3G/ib07Y6SPGHO3zv5bNXa296i58eXG3WpQRgJj7X
   V66wwVTDrPylRtHmO75ea2N0EajAIQ32591cLtEX22EGJ/DSJG5O0AVj9
   Q==;
X-CSE-ConnectionGUID: 8dp5RXg9QZi9cmF/xekiMA==
X-CSE-MsgGUID: MSbmlxL9Qbim7CHfTSc1Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="27858090"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="27858090"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 23:18:34 -0800
X-CSE-ConnectionGUID: Gr7tPuj4R1W+XMoKBgaufw==
X-CSE-MsgGUID: RmYXACEPTk2w9w51ZryE1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150559904"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 23:18:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tipy2-0019Cv-0O;
	Fri, 14 Feb 2025 07:18:30 +0000
Date: Fri, 14 Feb 2025 15:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: [linux-next:master 3083/3437]
 drivers/video/fbdev/hyperv_fb.c:1083:28: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202502141545.Vrmh7ZlT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b7a883c7f4de1ee5040bd1c32aabaafde54d209
commit: 2a1852f9062bcda671a85dfde52b870fd4122a36 [3083/3437] fbdev: hyperv_fb: iounmap() the correct memory when removing a device
config: i386-randconfig-r123-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141545.Vrmh7ZlT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141545.Vrmh7ZlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141545.Vrmh7ZlT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/hyperv_fb.c:1006:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got unsigned char *mmio_vp @@
   drivers/video/fbdev/hyperv_fb.c:1006:43: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/hyperv_fb.c:1006:43: sparse:     got unsigned char *mmio_vp
   drivers/video/fbdev/hyperv_fb.c:1046:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/hyperv_fb.c:1050:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got unsigned char *dio_vp @@
   drivers/video/fbdev/hyperv_fb.c:1050:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/hyperv_fb.c:1050:27: sparse:     got unsigned char *dio_vp
>> drivers/video/fbdev/hyperv_fb.c:1083:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char *mmio_vp @@
   drivers/video/fbdev/hyperv_fb.c:1083:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/hyperv_fb.c:1083:28: sparse:     got unsigned char *mmio_vp

vim +1083 drivers/video/fbdev/hyperv_fb.c

  1075	
  1076	/* Release the framebuffer */
  1077	static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
  1078	{
  1079		struct hvfb_par *par = info->par;
  1080	
  1081		if (par->need_docopy) {
  1082			vfree(par->dio_vp);
> 1083			iounmap(par->mmio_vp);
  1084			vmbus_free_mmio(par->mem->start, screen_fb_size);
  1085		} else {
  1086			hvfb_release_phymem(hdev, info->fix.smem_start,
  1087					    screen_fb_size);
  1088		}
  1089	
  1090		par->mem = NULL;
  1091	}
  1092	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
