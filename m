Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7E27E06C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766259525; cv=none; b=RFGZg/VkupAJMDDZCzWs1TTUvk/9+gX8PhgzXeOjyktzt2xMrJ8/Qa26YbW2hFBXLPrkN347BufUjs4Tjc7W9BC/HH37tlRX8bAXuiy5SzbL5AEmFYjGcZcAnf0mIh/Fbnlge0v+GNV+IMIVd/8NJsWrjmR4S6sJvP6zCwjqUwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766259525; c=relaxed/simple;
	bh=/MXdkBOxyvPEiMJHxwCZ982+5oxiZSAkYT5JYbmrxiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loAIVxXVVpDWdHwZrTvtJdCSeG2CRQw6/Nu4GDLIVtFTpAdroGqcKVMsUcnz9xGQe53K2b47eccLAJ+/ShJDER6sVzuvLhKnbVvqe5ItDZdXZ6bJ+56gWlS/5JsmbkR1ENEnBs22dCsQkAN1Nfloc6PEQdNDd6I/r2ZlPs18nEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=du4jvbEP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="du4jvbEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766259524; x=1797795524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MXdkBOxyvPEiMJHxwCZ982+5oxiZSAkYT5JYbmrxiU=;
  b=du4jvbEPA0id199n7v+C5KraGitl2c1I4V4Ks1h+HhzpuiRom+UJE61d
   xAaujU8rGVebDXSoO3qzIQLzXDK9fVUTtoEsm5kETog0oUDST2sY+0Vk/
   VnRwEnR1f8BDy4+RojsqIfk99sFg+BoCYKioc6ur9EOYk1iL9/lDUPm8k
   4euzKfr1ZjDm2mC/5RRijw6G9OAZzAou/eilDGqYgEy2ao3MFVIHRfpX3
   BgDK5n5LBqs72R7EcyCMWnHKPy1fsu11B5EUlVMIYhasSyB45g47g5D82
   BeJrU8vFSn7U5eKPwcMLs7trv2UgIOuf9EdstwveavYkRVqCwQCJXXTV3
   A==;
X-CSE-ConnectionGUID: k8lFd3P7T3CO5YAW3cBzGA==
X-CSE-MsgGUID: 2wcmZikdTvKoAo/L0+HcnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78502023"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78502023"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:38:43 -0800
X-CSE-ConnectionGUID: x0JMbJUGRai6VZ9m+PsXZQ==
X-CSE-MsgGUID: /x9tUOQKQH2j9u52dNwMMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200030288"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 11:38:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2ml-0000000054t-2H28;
	Sat, 20 Dec 2025 19:38:39 +0000
Date: Sun, 21 Dec 2025 03:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544]
 drivers/irqchip/irq-gic-v3-its.c:392:15: warning: no previous prototype for
 'gic_data_rdist_get_vlpi_base'
Message-ID: <202512210351.fZ2BxCPV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jinqian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 8207b85ea72073cc2f75884bfad29b41d805ef24 [3544/3544] kvm: hisi: print error for IPIV
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251221/202512210351.fZ2BxCPV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210351.fZ2BxCPV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210351.fZ2BxCPV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3-its.c:392:15: warning: no previous prototype for 'gic_data_rdist_get_vlpi_base' [-Wmissing-prototypes]
     392 | void __iomem *gic_data_rdist_get_vlpi_base(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/gic_data_rdist_get_vlpi_base +392 drivers/irqchip/irq-gic-v3-its.c

   390	
   391	#ifdef CONFIG_ARM64_HISI_IPIV
 > 392	void __iomem *gic_data_rdist_get_vlpi_base(void)
   393	{
   394		return gic_data_rdist_vlpi_base();
   395	}
   396	EXPORT_SYMBOL(gic_data_rdist_get_vlpi_base);
   397	#endif
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
