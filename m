Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0DE1D514E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300187; cv=none; b=O1n0MsUynjw+F2/VTqN308MrVfPZ8FKivf2pQABJGrv8o2AhrJANFRN+Yxf2YIzI4HOfi26j1eyPLXo29wY6SLHrHu53HuEf3XSwiqAIXkVyvI06WiZk4ozrSrhqDN7IYD33wQl1CGme6LAXNappV3gB+VCzhR7rM27v+CnQ7rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300187; c=relaxed/simple;
	bh=WXu40rpY55dogfYbE8NH2A1ltpnrruX5BEr1/2hHAa4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S3/1A8QOZs/t6rzVqEuxvbqZ8DCMly/z/xpV1/V4Qgi45Y7dv9N+p/OO2+IQv6clX8d8t9WrmaUINGi3EbpKmZOmW4B078th7Q/LYENq1y8Db/Q+nFX2SJUI51pk13eKvX0yZnNZiEpEvj/yYbk7Pv14JtuGZh5sWFKKXsD3tcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+V+Z71/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+V+Z71/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784300184; x=1815836184;
  h=date:from:to:cc:subject:message-id;
  bh=WXu40rpY55dogfYbE8NH2A1ltpnrruX5BEr1/2hHAa4=;
  b=D+V+Z71/pnv3PFZ2/EaUjsRLaqoMT5UX4hVxijdU2X4iXltpWcw5Y9BC
   bzmWB48E8FPu4pIq+I9ls1CQti6fPrSuDGT/mORIM6MJqn/v2oUdzNzJB
   gz0OgVE4BXTBDe6M/O8+yxVbtaLeGTolXd1b3c69uBpdZWSg7HmtSvatQ
   L/2DhEcMwszXMc1wan1OXIELgJyq48Zr7SSSSaRfrl28ufUi1NjzAHYSW
   A6Nous+G7CaD92lFor/Hn+jhEyqqORl9efNsMwuUQsCrgrYPDzHot9C9q
   R8dedBITVWNnxs8t946UTxASwhHxewPXsRwpwDW16wcPEkZp4fQIpD7ca
   A==;
X-CSE-ConnectionGUID: TDpR4uVTSeWkCXDH0gAG5A==
X-CSE-MsgGUID: Dm8gidJ7SlecjlbpSKaXMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="87518084"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="87518084"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 07:56:22 -0700
X-CSE-ConnectionGUID: 3v6XVREPS7++/pS+Uh1HBQ==
X-CSE-MsgGUID: q8ESl0q5SL2rmhxcIbYOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="281258894"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2026 07:56:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkjz7-00000000Sq0-3mhS;
	Fri, 17 Jul 2026 14:56:17 +0000
Date: Fri, 17 Jul 2026 22:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 sound/soc/soc-component.c:1889:9: error: implicit declaration of function
 'snd_soc_unregister_component_by_driver'; did you mean
 'snd_soc_component_to_driver'?
Message-ID: <202607172220.zE8d4GCF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e5f6e49182359560489330edda8ea8db0fe3e07b [311/311] ASoC: soc-component: remove compatible definition
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607172220.zE8d4GCF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172220.zE8d4GCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172220.zE8d4GCF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-component.c: In function 'devm_component_release':
>> sound/soc/soc-component.c:1889:9: error: implicit declaration of function 'snd_soc_unregister_component_by_driver'; did you mean 'snd_soc_component_to_driver'? [-Wimplicit-function-declaration]
    1889 |         snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_component_to_driver


vim +1889 sound/soc/soc-component.c

f547a858c9abcb Kuninori Morimoto 2026-07-08  1884  
f547a858c9abcb Kuninori Morimoto 2026-07-08  1885  static void devm_component_release(struct device *dev, void *res)
f547a858c9abcb Kuninori Morimoto 2026-07-08  1886  {
f547a858c9abcb Kuninori Morimoto 2026-07-08  1887  	const struct snd_soc_component_driver **cmpnt_drv = res;
f547a858c9abcb Kuninori Morimoto 2026-07-08  1888  
f547a858c9abcb Kuninori Morimoto 2026-07-08 @1889  	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
f547a858c9abcb Kuninori Morimoto 2026-07-08  1890  }
f547a858c9abcb Kuninori Morimoto 2026-07-08  1891  

:::::: The code at line 1889 was first introduced by commit
:::::: f547a858c9abcb132c18ff0f09700d925b069c21 ASoC: soc-component: move devm_snd_soc_component_register()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
