Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466AC17BEC2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426409; cv=none; b=M2mtY1f7yh+2O4Z25kZEzgXUytvzRHNf1xirgN5RyGKaZ9xZ2kXEu4HsFbb45x2OdCF91K9t9yhQpyTJjDRphddRvWC+RSVCMmXOdKYS5CvwH9qO/iuM8QfE019/E8toazcuOGLISqtsGulc6XnW4vcy5FooRNzmEMffOrENaf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426409; c=relaxed/simple;
	bh=uq8/HU1cBP29yJkIrDwp23P3p+V90wzYN+bl1/NOkQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BvQiFWX+fDP7lmbD8oAaTS8tp++L4EYoqVFXG+0E48P0Hyn+btrP9zX2ur9Or0RCs3YQB//S/Zua5HauwD17T6kI8NLwacP5j0w4vZvnLmL8Xe0B3s70ZNXgxIpTP4FHJHYlwBWNTFj+rS+hhEkl1TgxUBOLLE0Bz7O7OCdKtjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEZY0A5J; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEZY0A5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727426408; x=1758962408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uq8/HU1cBP29yJkIrDwp23P3p+V90wzYN+bl1/NOkQA=;
  b=LEZY0A5JG4MUQNnYnTEAbxEk4zTE29EuXo/AcJDBrRwsMars2erDKdeN
   ZklSe3tQhAQ7Q25LuVFzOhHHMR2y2ChYR/WDSrqriwjgyYr1YwMI9TB+4
   ftvFtGTY/y0+t002mGDNHpH3DGRtYRNxPifx7vmOKoL+f4YLL7FBaW0m2
   mdnBFb8bO/RCDt+kQVDKguY4RLL4Z8Oscnny7Bzrfr4xZdEgOrVnf69da
   x9aeS/GjXzQ2lSVvwMe1PONmvNiOJj2Xrs5YWQDQ8HnMOSPjSQLizrK0y
   W8s9/XZVv340rI0qRFcKY/dk1kgxteuOfwbdWGhBfPFinbaMi/aSanuQC
   g==;
X-CSE-ConnectionGUID: yYhIXOcdQ42lBPn08rXXkg==
X-CSE-MsgGUID: 6VFJ/lSERHqa+6otShPfUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30452961"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="30452961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 01:40:07 -0700
X-CSE-ConnectionGUID: o6IJptmmTZCmDkhu1HgpJQ==
X-CSE-MsgGUID: Gp5wQ2akSliRbe5cAd7uzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77296092"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2024 01:40:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su6WB-000Li3-2o;
	Fri, 27 Sep 2024 08:40:03 +0000
Date: Fri, 27 Sep 2024 16:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 595/1001]
 drivers/fpga/fpga-mgr.c:902: undefined reference to `dma_buf_get'
Message-ID: <202409271612.G4zGP0gZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: dc67651172095c04c4e6e1a64983036f4e654fd2 [595/1001] fpga: support loading from a pre-allocated buffer
config: i386-randconfig-014-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271612.G4zGP0gZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271612.G4zGP0gZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271612.G4zGP0gZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/fpga/fpga-mgr.o: in function `fpga_dmabuf_fd_get':
>> drivers/fpga/fpga-mgr.c:902: undefined reference to `dma_buf_get'
   ld: drivers/fpga/fpga-mgr.o: in function `fpga_dmabuf_load':
>> drivers/fpga/fpga-mgr.c:536: undefined reference to `dma_buf_attach'
>> ld: drivers/fpga/fpga-mgr.c:543: undefined reference to `dma_buf_map_attachment'
>> ld: drivers/fpga/fpga-mgr.c:551: undefined reference to `dma_buf_unmap_attachment'
>> ld: drivers/fpga/fpga-mgr.c:554: undefined reference to `dma_buf_detach'
>> ld: drivers/fpga/fpga-mgr.c:556: undefined reference to `dma_buf_put'


vim +902 drivers/fpga/fpga-mgr.c

   893	
   894	static int fpga_dmabuf_fd_get(struct file *file, char __user *argp)
   895	{
   896		struct fpga_manager *mgr =  (struct fpga_manager *)(file->private_data);
   897		int buffd;
   898	
   899		if (copy_from_user(&buffd, argp, sizeof(buffd)))
   900			return -EFAULT;
   901	
 > 902		mgr->dmabuf = dma_buf_get(buffd);
   903		if (IS_ERR_OR_NULL(mgr->dmabuf))
   904			return -EINVAL;
   905	
   906		mgr->flags = FPGA_MGR_CONFIG_DMA_BUF;
   907	
   908		return 0;
   909	}
   910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
