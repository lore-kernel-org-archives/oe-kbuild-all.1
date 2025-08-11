Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5861D61B7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 22:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754951302; cv=none; b=ULGUD+z1s6vS4bHFTg98cEbPuZpkr9v2auJnfQZTpjbSLSLTF2wxpVzVhWcWpNyfTfBuq1qMo+JRnD3luSQQVeJieWm6N5rWlsToouXmtr8rQ3oHli1dsDfitcX8G7Ut8loHi/uxMR9/cMAhB12oPu3RyVY/p6XbW2FJyYt4ZDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754951302; c=relaxed/simple;
	bh=CuhBY7zWl3DYbnJ3k4HxGMgnvOzqKqgS8KiXBMVW2a8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOXCWdc9V1yyaH7Dft7lPGEa8QCuq7JvFGPjebE/fhox+96DwDK+cF6E2vCif+vJRQModTnt2kd7P+0xvbzzI/ObpIWssNYKJjbbAkpRelU4ndl6npyEbTj4z/Xe3iZWJxdfKTTbbKcEBENjKPnB7bVRFfLarJTOyY1ztMMx6HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZe5IZdk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZe5IZdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754951301; x=1786487301;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CuhBY7zWl3DYbnJ3k4HxGMgnvOzqKqgS8KiXBMVW2a8=;
  b=RZe5IZdkQqyzeUeNaep8XvhB2ZlgowbV//xkqLNgZr7pGpaZDyTYDCnW
   zRg2PjaLMHTLPyoV02nvJzye0AYqotzqw2MX25Nu3AyasVsGNH9x5yL3W
   Es5SzdKgiwDcyMRucysRKl372LAcZMttbcXgB5YhJaEmKpEAloATIZva0
   lH2xZf0b6yJbIBwKfYT233zf0F2goN2yDtUfWlhUjevBu0RVPyBCwmUZZ
   rZPdmlc7HSvbc8eIl/7Oi+w/G/q4CKw5366EDvTjvcTHMIzD4e1M2wWs3
   jfZnuJNrt6R1ln/iQcwfV0ZsUJhuesOsssQRdDdw02w4uQ+AuE8tUbzNW
   g==;
X-CSE-ConnectionGUID: OP1q2ENGSReaC0ua+Jge4w==
X-CSE-MsgGUID: vqRSf8IRQquCnE7sb/sy4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57136420"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57136420"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 15:28:20 -0700
X-CSE-ConnectionGUID: VE7CaRrrRuym2tet3kYSYg==
X-CSE-MsgGUID: 27tQL/yIS4yjaJn5QnrAIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165652943"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Aug 2025 15:28:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulb04-0006GO-1d;
	Mon, 11 Aug 2025 22:28:16 +0000
Date: Tue, 12 Aug 2025 06:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cgns 1/2] mm/memcontrol.c:3629:31: error: too few
 arguments to function call, expected 2, have 1
Message-ID: <202508120614.AZsG8gdu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/kkdwivedi/linux cgns
head:   0cec2bb6438cabeaac49e0f608bacca6636eeffd
commit: d7ffaa6f39eb4ea1670f4b2660004e2e04afca19 [1/2] bpf: Do not limit bpf_cgroup_from_id to current's namespace
config: i386-buildonly-randconfig-005-20250812 (https://download.01.org/0day-ci/archive/20250812/202508120614.AZsG8gdu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120614.AZsG8gdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120614.AZsG8gdu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:3629:31: error: too few arguments to function call, expected 2, have 1
    3629 |         cgrp = cgroup_get_from_id(ino);
         |                ~~~~~~~~~~~~~~~~~~    ^
   include/linux/cgroup.h:653:16: note: 'cgroup_get_from_id' declared here
     653 | struct cgroup *cgroup_get_from_id(u64 id, bool root_cgns);
         |                ^                  ~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3629 mm/memcontrol.c

73f576c04b9410 Johannes Weiner 2016-07-20  3621  
c15187a4a2d660 Roman Gushchin  2022-05-31  3622  #ifdef CONFIG_SHRINKER_DEBUG
c15187a4a2d660 Roman Gushchin  2022-05-31  3623  struct mem_cgroup *mem_cgroup_get_from_ino(unsigned long ino)
c15187a4a2d660 Roman Gushchin  2022-05-31  3624  {
c15187a4a2d660 Roman Gushchin  2022-05-31  3625  	struct cgroup *cgrp;
c15187a4a2d660 Roman Gushchin  2022-05-31  3626  	struct cgroup_subsys_state *css;
c15187a4a2d660 Roman Gushchin  2022-05-31  3627  	struct mem_cgroup *memcg;
c15187a4a2d660 Roman Gushchin  2022-05-31  3628  
c15187a4a2d660 Roman Gushchin  2022-05-31 @3629  	cgrp = cgroup_get_from_id(ino);
fa7e439cf90ba2 Michal Koutný   2022-08-26  3630  	if (IS_ERR(cgrp))
c0f2df49cf2471 Tejun Heo       2022-08-28  3631  		return ERR_CAST(cgrp);
c15187a4a2d660 Roman Gushchin  2022-05-31  3632  
c15187a4a2d660 Roman Gushchin  2022-05-31  3633  	css = cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
c15187a4a2d660 Roman Gushchin  2022-05-31  3634  	if (css)
c15187a4a2d660 Roman Gushchin  2022-05-31  3635  		memcg = container_of(css, struct mem_cgroup, css);
c15187a4a2d660 Roman Gushchin  2022-05-31  3636  	else
c15187a4a2d660 Roman Gushchin  2022-05-31  3637  		memcg = ERR_PTR(-ENOENT);
c15187a4a2d660 Roman Gushchin  2022-05-31  3638  
c15187a4a2d660 Roman Gushchin  2022-05-31  3639  	cgroup_put(cgrp);
c15187a4a2d660 Roman Gushchin  2022-05-31  3640  
c15187a4a2d660 Roman Gushchin  2022-05-31  3641  	return memcg;
c15187a4a2d660 Roman Gushchin  2022-05-31  3642  }
c15187a4a2d660 Roman Gushchin  2022-05-31  3643  #endif
c15187a4a2d660 Roman Gushchin  2022-05-31  3644  

:::::: The code at line 3629 was first introduced by commit
:::::: c15187a4a2d660bf490f7873afd0de5288f65c8f mm: memcontrol: introduce mem_cgroup_ino() and mem_cgroup_get_from_ino()

:::::: TO: Roman Gushchin <roman.gushchin@linux.dev>
:::::: CC: akpm <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
