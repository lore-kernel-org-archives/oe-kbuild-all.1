Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D21ACED5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 03:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768619439; cv=none; b=GauakZdCNmwqoA83qcVs4wfIfb0UBq/1aO92cDOiocClsJ+66CywplNEF9TUXbVHtcj1iNjMNP8kukFJzqt8xAcMpNQP47l6BWn63jnKeLEDWooWSA0lVTnMnSbkKT3rHIWvXJr3UvHi8oLzPsf4LxLgSZfl62jTmabWlDUSyyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768619439; c=relaxed/simple;
	bh=7aw0/Dfn7oDTRF6JaZZo/5XTplGcO/6+P8wCg3FYKE0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eKaoWyuNmgIEpFoxTcG9SHBKcL/iztSkwA5QjQJ6fycFazgCIE+dnTVjOlF2vKGoErp67cy6UlFRWCn09YS12wN2vxA76NizxoTjNpgf3UU36EhByipSy5ZeTWF0kt7vj2Fy4PSMh99oDdGLkxFfxS0MEu6+9zIpSMdzM0WeWAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwnJRtvt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwnJRtvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768619437; x=1800155437;
  h=date:from:to:cc:subject:message-id;
  bh=7aw0/Dfn7oDTRF6JaZZo/5XTplGcO/6+P8wCg3FYKE0=;
  b=jwnJRtvtf24UJPp1rAgWPCimDdSZR32i3yKRw5zwdb8Mg9/JLurILOgB
   OWv1Fxj/1DeiQ+tj6VHsY150/qxz1xa5PQvSVYPBvS9MsCZZ77djlZB3V
   VMGuC+nIqYAtAxRWdyH4klPf93pD2l+3Mx8NePSS0+IpKE1J/o6ZEfAKW
   6RPKNIS/JOTXUlY/2MZHsOOEvKWAFFcoawxCRczT5bwVCQEOM3TBIsiLi
   MtQ28XqoUeNk6W9n6Txclrr+PzZ84oTmJPY1m3lEdSAU88/WFCKWZ2YQn
   r7LEYMMvUEeOn4+ScqVQuroKMWjewLXn1mrXggxzjLLMl6KVR2Kg5OTsh
   A==;
X-CSE-ConnectionGUID: +kcX/YGNRdScO9RSYC3vUQ==
X-CSE-MsgGUID: RsK136HGT+Kk9Qy/5NvQhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81377553"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="81377553"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 19:10:37 -0800
X-CSE-ConnectionGUID: +lu90hNiS6WzlLzb90qkaQ==
X-CSE-MsgGUID: RF4OSrCrTAWsHXFc9ESagw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="236668702"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2026 19:10:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgwht-00000000LVM-0qbk;
	Sat, 17 Jan 2026 03:10:33 +0000
Date: Sat, 17 Jan 2026 11:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_print_to_pagebuf 11/12] cacheinfo.c:undefined
 reference to `cpumap_print_to_pagebuf'
Message-ID: <202601171127.DauyWpig-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux bitmap_print_to_pagebuf
head:   90f258135a3e620859dae9d24ec629edb2463803
commit: 12d89d4a90f9460d13e46f85c7aecd290e5e9f1c [11/12] cpumask: switch cpumap_print_to_pagebuf() to using scnprintf()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260117/202601171127.DauyWpig-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171127.DauyWpig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171127.DauyWpig-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/kernel/cacheinfo.o: in function `shared_cpu_list_show':
>> cacheinfo.c:(.text+0x150): undefined reference to `cpumap_print_to_pagebuf'
   powerpc-linux-ld: arch/powerpc/kernel/cacheinfo.o: in function `shared_cpu_map_show':
   cacheinfo.c:(.text+0x190): undefined reference to `cpumap_print_to_pagebuf'
   powerpc-linux-ld: drivers/base/cpu.o: in function `show_cpus_attr':
   cpu.c:(.text+0x550): undefined reference to `cpumap_print_to_pagebuf'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
