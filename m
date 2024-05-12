Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD120B20
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715535084; cv=none; b=Lz+prbtkiLu7YeeE5Pwp98OwpNb3YXVY2p+wiIt7+aOOnx+S1ngN32aqiNIqLTyS0ERcanrvhMUbmlpveH4iRQrnN6G1hsJGsrF8L5AXBiqEWrMgaOgp5l1E/+bYuCnK1kogI78VJIfz2bvPhakLCuKBh6dra3pK6P56lp7xzi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715535084; c=relaxed/simple;
	bh=AgkHYaTFSE/uCNf/g1C4cmNLYS+3QeGmBp0gnsYOVro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nWX54Y3NhjltfvKlWWm0G1HCmkuxitztj/MOIfTZrGphhYI54++qHk3kNaXXemvxQx1mycb+EabjJFJeVY25Rcd19EGeHwI0Dgbh6Q+vSU6vYvpaXQ+KxMAGHKwxbvy7ywL6bQOJKZMrX8Jg5uAPr4lX/3Hth+qEctvgHeAl8GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEFSKZ4n; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEFSKZ4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715535083; x=1747071083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgkHYaTFSE/uCNf/g1C4cmNLYS+3QeGmBp0gnsYOVro=;
  b=kEFSKZ4nDNtdQCl7SuDq1HHdw03Mq1j940aI7bJoHvs+5DJo6Rucd7Ca
   xI8I/GvOEHlaY5mV0B/sxR1jmwt82ZxedJddKiKUubO7MwnMnhG2wNd3p
   G/TrP0gEdV3QtStQeb1sZ+nz+NxswrO2U0NV2ROS70NoOd5rkiCsyt33Y
   0xax/b+53+ziQtEukEvWOo+hqpsi+/1/EGqsXRR92IsTraZs7m/o6Fb1o
   aKBBsuhGcTswvLk16YN+xok4N978v40/OYrgsoBpOawUy6eOVuuY544O/
   a2rCn4HmWlWmZ3fljFwj0i2EtdfIy2NMnwRdkAyjaI561Lnz9jiPBlbyp
   g==;
X-CSE-ConnectionGUID: B/oSNxf1Q1usiq53uuxveg==
X-CSE-MsgGUID: zlHVWJh6SCqhpIfcnDjxRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11596021"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="11596021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 10:31:22 -0700
X-CSE-ConnectionGUID: S+ayZQvhQ3uH3PB1Uj0FrQ==
X-CSE-MsgGUID: O4XjdBnjRNOlEf+LuPws2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="30145120"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2024 10:31:04 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6D2L-0008n9-1z;
	Sun, 12 May 2024 17:31:01 +0000
Date: Mon, 13 May 2024 01:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382]
 drivers/spi/spi-cadence-quadspi.c:393:undefined reference to
 `spi_mem_exec_op'
Message-ID: <202405130129.sfnIKI9Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   36746b42badc0d5707b84ccc34c5ea166c9573b2
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: x86_64-randconfig-001-20240512 (https://download.01.org/0day-ci/archive/20240513/202405130129.sfnIKI9Q-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130129.sfnIKI9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130129.sfnIKI9Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `cqspi_phy_check_pattern':
>> drivers/spi/spi-cadence-quadspi.c:393:(.text+0x133318e): undefined reference to `spi_mem_exec_op'


vim +393 drivers/spi/spi-cadence-quadspi.c

   377	
   378	static int cqspi_phy_check_pattern(struct cqspi_flash_pdata *f_pdata,
   379					   struct spi_mem *mem)
   380	{
   381		struct spi_mem_op op = f_pdata->phy_read_op;
   382		u8 *read_data;
   383		unsigned int size = sizeof(phy_tuning_pattern);
   384		int ret;
   385	
   386		read_data = kmalloc(size, GFP_KERNEL);
   387		if (!read_data)
   388			return -ENOMEM;
   389	
   390		op.data.buf.in = read_data;
   391		op.data.nbytes = size;
   392	
 > 393		ret = spi_mem_exec_op(mem, &op);
   394		if (ret)
   395			goto out;
   396	
   397		if (memcmp(read_data, phy_tuning_pattern,
   398			   ARRAY_SIZE(phy_tuning_pattern))) {
   399			ret = -EAGAIN;
   400			goto out;
   401		}
   402	
   403		ret = 0;
   404	
   405	out:
   406		kfree(read_data);
   407		return ret;
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
