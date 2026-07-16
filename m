Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351D30E84F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236004; cv=none; b=FwQNDwvxHTwMvUV34DRiMicycCpo2Nbpkl29B1LMnkGmV//JcNHbDsaDQQUj6qYg19JMIwB1Tth1eyQS5toOQYlxI/wX9BxT2e/C7o0EP+bSOJ6/MSTWGvck6ms+bPP57lg86uuFWHefglbifsAZXNqH5zsCZDLZxVvA2ncKsss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236004; c=relaxed/simple;
	bh=Nfb8f8U5rPKo2VqyOxaNUMAqFRuAOr7C60v1AQzd38w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mf99/yZ7tjlWDVGEHKs0OxinhZ2K6q/JCNRn+1utZNMN3050jzzhPcM5yeNlaK/Or1sGkveExdF1npKT+3FtlNSqS5ZAj9j6fD46u4/zdkCFlEBunE5Ghbilow6bLG2RyRv83lLEJgizI99fQDR9mcXi51w8h2IenXfmb0YA3Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLkVODwE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLkVODwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784236003; x=1815772003;
  h=date:from:to:cc:subject:message-id;
  bh=Nfb8f8U5rPKo2VqyOxaNUMAqFRuAOr7C60v1AQzd38w=;
  b=KLkVODwE4OmS7Wzc/9oyDyIit1tyJ3CxVUwBV1R9xWokYTg3NlvZBvdh
   9fjAPFBvcNnnt6wMm2BvZ6hbMgRORnrkcrZaZJ4Zr3yWqeZdcqrFabSfr
   JPhs4UdkOGmET79EgduW/rCIyObwqzfs0yPri/8BtVL4tYLnErp6ttxYM
   HVKUAm6TstBjIBwfch5KB620rwfBjE7hkdUMj40g1+GcwkDJe6kKxmvZO
   03TKuDD+CyaB8oajFalsreAXJRpwm/pT6Nw4CkwpaJzESJnBHrCV8/O3a
   IVEYc6seRb3DBVuEibIEUu6Mv3MHOuuM6WMpH8HNjpGIAebtcs6GEA6U1
   g==;
X-CSE-ConnectionGUID: YT+EDKpXQpm2O6I1qKSNPw==
X-CSE-MsgGUID: Ki9oaSEZRJ+LtxaLwM0lTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84686604"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="84686604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 14:06:42 -0700
X-CSE-ConnectionGUID: uJTqUzVxTEac8OsyJI2VeA==
X-CSE-MsgGUID: ooaluRTKQEmSMMtDjWwvvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="252202722"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jul 2026 14:06:40 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkTHy-000000004wp-1Rid;
	Thu, 16 Jul 2026 21:06:38 +0000
Date: Thu, 16 Jul 2026 23:06:05 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 307/311]
 sound/soc/soc-component.c:1889:9: error: implicit declaration of function
 'snd_soc_unregister_component_by_driver'; did you mean
 'snd_soc_component_to_driver'?
Message-ID: <202607162354.Cj0qkKYs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e5f6e49182359560489330edda8ea8db0fe3e07b [307/311] ASoC: soc-component: remove compatible definition
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260716/202607162354.Cj0qkKYs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607162354.Cj0qkKYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607162354.Cj0qkKYs-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-component.c: In function 'devm_component_release':
>> sound/soc/soc-component.c:1889:9: error: implicit declaration of function 'snd_soc_unregister_component_by_driver'; did you mean 'snd_soc_component_to_driver'? [-Wimplicit-function-declaration]
    1889 |         snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_component_to_driver


vim +1889 sound/soc/soc-component.c

f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1884  
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1885  static void devm_component_release(struct device *dev, void *res)
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1886  {
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1887  	const struct snd_soc_component_driver **cmpnt_drv = res;
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1888  
f547a858c9abcb1 Kuninori Morimoto 2026-07-08 @1889  	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1890  }
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1891  

:::::: The code at line 1889 was first introduced by commit
:::::: f547a858c9abcb132c18ff0f09700d925b069c21 ASoC: soc-component: move devm_snd_soc_component_register()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
