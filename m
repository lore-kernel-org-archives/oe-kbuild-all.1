Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C7213DDD9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713958153; cv=none; b=fPUwG5xIsmg1feEudwP8PiQH5CVxFSd+AXTdQom1Q/TgFsuJ2LaKeqsrJT7tyk+e9+/OC0n425K5MlG5dOnRfJFWATFtgjpoG2k66E5N6MSlr4L4/8wwFs8s56+JTXJF+uHF3mjy4Z4x7DwN4+6jiK0UMUh0t1B+6kKDTjKaDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713958153; c=relaxed/simple;
	bh=yWLbXD69XucIn5xKEGVhWiXWpW+qIGLLq2tyYlGF/9k=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCnbTX30hZJE/gLx6jRoEW06zGSwbsXJTpdgJpcdonXdayYQ7JgsVEnr7VljX9yPm6KzCAnvx6UmLHf8wXZik6F+xZiHTKmP2Xtm8a6Pg2PO6fVMxlu59FSykoQRJVP6HcA/wVO+8yYQRyDr+UodOXNXVfEW8IRiD6PVj9ye9/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f51dlrBq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f51dlrBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713958152; x=1745494152;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yWLbXD69XucIn5xKEGVhWiXWpW+qIGLLq2tyYlGF/9k=;
  b=f51dlrBqLdDMNsZlXUK4FU02HJ18mlHrJHm20DGCgxjRNjPDaOPJAJU1
   1JV9eY+g28cH6nQ5u7st+bTi9wRtZ0SQOFDyCYZcFLj1Ydk+mYJbVXnqD
   Ke5/cgICnjYfew6RL56xFx3hrvkavvoUWmI9XCCdQhj1cAWekz5wcriU8
   ySnNb78B36HCZn/lztxtWNOkGGANNgCBg+D0gP9j+21rbBjfqmkdLM5Vs
   hHimGS5LR0vY39U8GnBLZO/ZwzwlCXZBum7rGwZl80mOdjV0qL7O1SiQp
   jira8IHvfnPDSeW0YZUKXAKN9nqbzZ91jnEhv3Bgom4PQXmOBWQhblDBt
   g==;
X-CSE-ConnectionGUID: AZF6ROtXQVKhEGw/jjxrTQ==
X-CSE-MsgGUID: ZMv/tJ6sQN2+70lSJHpQLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="34984894"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="34984894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 04:29:11 -0700
X-CSE-ConnectionGUID: 0dEexRlpTX6RLawan8aafg==
X-CSE-MsgGUID: OH+IHy3SSnmoqj+5RjPkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29139632"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Apr 2024 04:29:10 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzaoG-0001Aw-0O
	for oe-kbuild-all@lists.linux.dev;
	Wed, 24 Apr 2024 11:29:08 +0000
Date: Wed, 24 Apr 2024 19:28:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9081/9999]
 drivers/remoteproc/mtk_scp.c:395:23: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202404241913.sc4KraVu-lkp@intel.com>
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
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240424/202404241913.sc4KraVu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404241913.sc4KraVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241913.sc4KraVu-lkp@intel.com/

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
