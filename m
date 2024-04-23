Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789791CA82
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 05:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713849308; cv=none; b=rLEZQuo4UvFQIOjVLl4uXKfVBgmu1/CVSdowLI7AZb4y+5fCUOhnmyite1nlGWOZACcUXTLb+9teuUv1JkgcmpvGLvXTBezopSTnVcf4fuJ0w3CEl5dNLoR0Zh45bBv4pvR3E0R1CuXBho2ZipO4p347zizjY6EshpS4tdKQOxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713849308; c=relaxed/simple;
	bh=v5c3Hch6vsVfUNiR3UvZwY8Ypv3VPBMSj+P5uI6SNdQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVmCVZEqZEK8hnsKpRdlfSNoansX5bWEHOwOYhy2UiuwNtVQvbbqIZztxq4bPA8s2txZCLwdsmEyVQGEGdn9fC7N1eYvQ3bS9ZqSZ9/h/JtFDnroXyjtD0619NpCn3s2MYv89yPt59elMyU6WEHdhv8F75965SVew49GxEi3V+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cM3852Gx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cM3852Gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713849307; x=1745385307;
  h=date:from:cc:subject:message-id:mime-version;
  bh=v5c3Hch6vsVfUNiR3UvZwY8Ypv3VPBMSj+P5uI6SNdQ=;
  b=cM3852Gx1i8pMxi34skrUXrpgHpv5bvqouGwPdHOKA2Tvqav5PziME7q
   YaMgoaEeft97ySrglwOQwbolNdNnW8fQdNkZGkKZFLotjyPe2nrTm9T9x
   D6WdjdGREYUtMMx9sPqoHHKROhqWcoHLgEcvMptL27TUkEWv8XOfvDkI/
   p/nqYVdZagWCcJU7ih7OOiBgjIR5kTgAcW9t/RMVDwBsDr9GLGtmvIAaJ
   EpjwYy/13maR53qzGHTddPYXqcD3kb8B1o57FtMILb4QHH1TKXcwpKFCX
   J4+Epc04xht3qMWQmZdcIFxZvdhh9SGJ4WMZqHcFJtGkbwfYKRWA9Eo7q
   A==;
X-CSE-ConnectionGUID: J0KBYvS2Ra+DhZiaEl/miA==
X-CSE-MsgGUID: VZ3rEg7wQla9u6jg9YvQhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9582845"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9582845"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 22:15:07 -0700
X-CSE-ConnectionGUID: oGx99umvQlSKMi+IibJ+Qg==
X-CSE-MsgGUID: KLrnrjr3SWCwBra01qO4BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24227787"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2024 22:15:06 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz8Ug-0000Ug-1y
	for oe-kbuild-all@lists.linux.dev;
	Tue, 23 Apr 2024 05:15:02 +0000
Date: Tue, 23 Apr 2024 13:14:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9081/9999]
 drivers/remoteproc/mtk_scp.c:395:23: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202404231351.7tqzCDGW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: badfc166850a3a621d9f793b6cacc4e5f0ff75ff [9081/9999] FROMLIST: remoteproc/mediatek: add SCP support for mt8183
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240423/202404231351.7tqzCDGW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240423/202404231351.7tqzCDGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231351.7tqzCDGW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/mtk_scp.c:395:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *cpu_addr @@     got void * @@
   drivers/remoteproc/mtk_scp.c:395:23: sparse:     expected void [noderef] <asn:2> *cpu_addr
   drivers/remoteproc/mtk_scp.c:395:23: sparse:     got void *
>> drivers/remoteproc/mtk_scp.c:405:56: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got void [noderef] <asn:2> *cpu_addr @@
   drivers/remoteproc/mtk_scp.c:405:56: sparse:     expected void *cpu_addr
   drivers/remoteproc/mtk_scp.c:405:56: sparse:     got void [noderef] <asn:2> *cpu_addr

vim +395 drivers/remoteproc/mtk_scp.c

   379	
   380	static int scp_map_memory_region(struct mtk_scp *scp)
   381	{
   382		int ret;
   383	
   384		ret = of_reserved_mem_device_init_by_idx(scp->dev, scp->dev->of_node,
   385							 0);
   386		if (ret) {
   387			dev_err(scp->dev,
   388				"%s:of_reserved_mem_device_init_by_idx(0) failed:(%d)",
   389				__func__, ret);
   390			return -ENOMEM;
   391		}
   392	
   393		/* Reserved SCP code size */
   394		scp->dram_size = MAX_CODE_SIZE;
 > 395		scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
   396						   &scp->phys_addr, GFP_KERNEL);
   397		if (!scp->cpu_addr)
   398			return -ENOMEM;
   399	
   400		return 0;
   401	}
   402	
   403	static void scp_unmap_memory_region(struct mtk_scp *scp)
   404	{
 > 405		dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
   406				  scp->phys_addr);
   407		of_reserved_mem_device_release(scp->dev);
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
