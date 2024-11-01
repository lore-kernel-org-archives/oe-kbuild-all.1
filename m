Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDAB1B5EBC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730475352; cv=none; b=Ax1xUJ/1YP9URxyQXZ71gTbaTFPJGtSlAYjvyBcUbDdJWFtj+mwtKj6DplX02UgyO0Zczd0J8DGDx+zNYN8AhBKfLkIWeds+4n/nT7fNTvm5td3SVUGLWJTECQU+fGCgLGGozZjAqmEhBWeyfIlMfGIFNlIamEZXYPAkTMIhWu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730475352; c=relaxed/simple;
	bh=ANW5lg6k78zikEoo6fdvX2qlRiaoUovUFxOTrkGUeiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OvZd661jOJkUdtvOeqRnzcU+1swy2nLjBiSOFzIkcKmNMVpfNJSPMeaRAy0zuurEHnkCIjCJE7LyvfZ1R0B7FRYr8/ZsEGLJPyyx1oUlgVlaQtyWVtF10g+CM0VccZshkeXXyV7La+Wpf9surt29Gopavg8IOTq64blcsB8wKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjroZ7bh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjroZ7bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730475348; x=1762011348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ANW5lg6k78zikEoo6fdvX2qlRiaoUovUFxOTrkGUeiE=;
  b=YjroZ7bhVdeeoxzUDPpFmhRsYCjsVbIrffUCecyj6IbY3mJ7Twptnty0
   EsVDcywq7XN+KncFzFsEJ0eLcNyclHHxM3bwC+lOWBp9vQMCTs/ajez0v
   G4Vq3DNGs43hdD6+Q+bBxNfNz1i3fRRIJFG96oxSYFFHrBTjy9DazpxvQ
   C6vCSpfL/Jmh3CsdktTdb0yvEsqaLOXRa0RhQKDKaaJ2xWQg+gtVQJwL9
   oF2RedTpSFR2qFSjYaFF30Eb0HyFQ2AERk5fx8Ftfd9BYpoFRHaB91Ran
   b8A/vcRAA9p0D97mAGeAwYLb8ihjZQuSVtCQw1aPM4CKWLH0x+TDL6gqm
   g==;
X-CSE-ConnectionGUID: MbnbONPGTV+uo325WELpEg==
X-CSE-MsgGUID: JK2qUh+uSkqGulzikst8UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40788262"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40788262"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 08:35:47 -0700
X-CSE-ConnectionGUID: HyxOu1j9RR6f0trVW7FxQA==
X-CSE-MsgGUID: x8GlSmt+Rw6svBxBE2REiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87784764"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2024 08:35:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6tgc-000hiT-3D;
	Fri, 01 Nov 2024 15:35:43 +0000
Date: Fri, 1 Nov 2024 23:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr 7/11]
 arch/alpha/kernel/pci-sysfs.c:163:24: error: assignment to 'int (*)(struct
 file *, struct kobject *, const struct bin_attribute *, struct
 vm_area_struct *)' from incompatible pointer type 'int (*)(struct file *,
 struct kobject *, struct bin_attribute *, s...
Message-ID: <202411012338.oM4U91lu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr
head:   ed99c08a36655b8daa71029185eef8079813fee4
commit: 6a911ccb46a24517dc66b2a233ee21f27b46d211 [7/11] sysfs: treewide: constify attribute callback of bin_attribute::mmap()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20241101/202411012338.oM4U91lu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012338.oM4U91lu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012338.oM4U91lu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/alpha/kernel/pci-sysfs.c: In function 'pci_create_one_attr':
>> arch/alpha/kernel/pci-sysfs.c:163:24: error: assignment to 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, struct vm_area_struct *)' from incompatible pointer type 'int (*)(struct file *, struct kobject *, struct bin_attribute *, struct vm_area_struct *)' [-Werror=incompatible-pointer-types]
     163 |         res_attr->mmap = sparse ? pci_mmap_resource_sparse :
         |                        ^
   cc1: some warnings being treated as errors
--
   drivers/pci/pci-sysfs.c: In function 'pci_create_legacy_files':
>> drivers/pci/pci-sysfs.c:984:28: error: assignment to 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, struct vm_area_struct *)' from incompatible pointer type 'int (*)(struct file *, struct kobject *, struct bin_attribute *, struct vm_area_struct *)' [-Werror=incompatible-pointer-types]
     984 |         b->legacy_io->mmap = pci_mmap_legacy_io;
         |                            ^
   drivers/pci/pci-sysfs.c:997:29: error: assignment to 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, struct vm_area_struct *)' from incompatible pointer type 'int (*)(struct file *, struct kobject *, struct bin_attribute *, struct vm_area_struct *)' [-Werror=incompatible-pointer-types]
     997 |         b->legacy_mem->mmap = pci_mmap_legacy_mem;
         |                             ^
   cc1: some warnings being treated as errors


vim +163 arch/alpha/kernel/pci-sysfs.c

10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  155  
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  156  static int pci_create_one_attr(struct pci_dev *pdev, int num, char *name,
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  157  			       char *suffix, struct bin_attribute *res_attr,
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  158  			       unsigned long sparse)
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  159  {
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  160  	size_t size = pci_resource_len(pdev, num);
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  161  
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  162  	sprintf(name, "resource%d%s", num, suffix);
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17 @163  	res_attr->mmap = sparse ? pci_mmap_resource_sparse :
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  164  				  pci_mmap_resource_dense;
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  165  	res_attr->attr.name = name;
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  166  	res_attr->attr.mode = S_IRUSR | S_IWUSR;
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  167  	res_attr->size = sparse ? size << 5 : size;
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  168  	res_attr->private = &pdev->resource[num];
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  169  	return sysfs_create_bin_file(&pdev->dev.kobj, res_attr);
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  170  }
10a0ef39fbd1d4 Ivan Kokshaysky 2009-02-17  171  

:::::: The code at line 163 was first introduced by commit
:::::: 10a0ef39fbd1d484c2bbc1ffd83d57ecef209140 PCI/alpha: pci sysfs resources

:::::: TO: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
:::::: CC: Jesse Barnes <jbarnes@hobbes.lan>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
