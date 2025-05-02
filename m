Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D2BDF5C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 02:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746152774; cv=none; b=lDQYEwHCkMczx5zAhy76iP0AQ3n2Isttc1QB9jluXiW4+t4qAV52S01DBnsVwCPF+9wgD0Oq7UN2MPnME1Vp9FhNfzMxVXCEhjYIOUVftade4T3uHAxdmh74VujqZtaWhytREzUvuW5oHFzZrE6bUWEkD7fwenxo4bVfhrnGDIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746152774; c=relaxed/simple;
	bh=RECspk6f8dNsSHGlCHvWsQByPy/HIR7IEmrw7ykTM1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AbBOnSqxY8M+gCbnkgoSw3zHDd2smpzdWkWfKPnEC36JhqJtnsjyI/QQgGV5n9a6mWnL9pyg46FbMcEYmIgWbLEBEqPLI5M1l1FWsjvdT0kTankCfJWMj9AGDzPzWrJ9JO5Oh+PRLBQuvPwB3Mi+QQedU7cqk89seobNeiqf0SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzBWdAMo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzBWdAMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746152772; x=1777688772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RECspk6f8dNsSHGlCHvWsQByPy/HIR7IEmrw7ykTM1A=;
  b=KzBWdAMo3Dk9PhtjZXq1i8eu/aRNnjinpwZ3mtvE9l0sZVIa3htJO3m3
   14fQpB3GIIxzrZZCHDi9ixX56pzID1O1SPCM7sH8jc1ofvpOR/dqPOrfJ
   xWAEoHAhrxj6WuseiWr+JJCBuHOrCfq1b4MOjH1hau7WEsNGEOV9Tn3LW
   EQoA2OpDyBa/74xJERVX63gNkT0ZWzTZY8mETsYrc15kSLHhexu2ZKrOl
   fivmUgQXUjRpb1hWhUgprfos74RgBIEfrftAw3IgMR+O/WxCoSsThHFXf
   kCCLrRtORAlNeGGQywEqpagyKH6d6lMGxkzATQRuIVQ+zjAA5RWly9aLP
   g==;
X-CSE-ConnectionGUID: mugQOQtbQlGVgd7L1LTtQQ==
X-CSE-MsgGUID: lTKTkrJ+TPibyLC/LVxKZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47845852"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47845852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 19:26:11 -0700
X-CSE-ConnectionGUID: QW0L90R4RCyrllIBXOtWnA==
X-CSE-MsgGUID: gNn8EtgCSPyywh/DVhULBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="171778148"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2025 19:26:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAg6J-0004VB-22;
	Fri, 02 May 2025 02:26:07 +0000
Date: Fri, 2 May 2025 10:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882]
 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:32:19: sparse:
 sparse: symbol 'g_netdev' was not declared. Should it be static?
Message-ID: <202505021040.redoLH7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   46abe407b020831448331eea487e07c883e95836
commit: 8cee206b5558245197158bd20895f95cc28d8468 [2882/2882] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-randconfig-123-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021040.redoLH7C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021040.redoLH7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021040.redoLH7C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:32:19: sparse: sparse: symbol 'g_netdev' was not declared. Should it be static?
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:262:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void const *reg @@
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:262:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:262:22: sparse:     got void const *reg
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:267:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reg @@
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:267:23: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:267:23: sparse:     got void *reg

vim +/g_netdev +32 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c

    30	
    31	static struct workqueue_struct *sxevf_wq;
  > 32	struct net_device *g_netdev;
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
