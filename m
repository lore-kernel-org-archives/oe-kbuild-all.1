Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ACA157A72
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 02:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754533655; cv=none; b=XZYe0IYrQDy39letkZKHuwCm2ewNaWip0SU89GR5Cz4ON8uXYvVoi619CVMHVU3UclLU6fc1LyWNMXeutgfRzRv8yZFWBJ7SYL7/gEFmsczgzKItzi+yWl0N4moDOoI5q14mE/0igxcImZkJbqzzlDttX8/XML6zOZDSuko5V7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754533655; c=relaxed/simple;
	bh=Cgk0wWczsMgbLiQpMErB2ssyc72ju+hHwPvGFN4TyAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msVMuWXzPWv59BZwnzCXd1su47Q41J6VFqApu+2YVDxa/sX2q+EQ2+sFYI6uVYqd7AWAFnC9D3J+hRffydtHbOU1Wi7O+I8cnaXNpHBNC6dbIsOjudErR+DiemyerVY3HGKNfsad6vo2RNg71AoE5ukGoz5nOhoAonarefoorOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nY/BUMGS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nY/BUMGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754533653; x=1786069653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cgk0wWczsMgbLiQpMErB2ssyc72ju+hHwPvGFN4TyAE=;
  b=nY/BUMGSiSmbsFT1a5knNZSJZGBLAkTsN3yZCe1znRcxsdQ+KXufQbpj
   frnewZtrE1vmRTeD7+uSZabk7G8MG2eVL4GtcuVnOBJDoGlOjmFf7EaJs
   WLNBRCoxQuAXuB8nEu0aoqWYutYqURA1Af6pFDM82gz4hyEM2iMY/lT7Q
   wI5sLUk+kchPL3G6NvOMTeFgrULsf2+lx8kGfhel4MvMk6BcBRkpacn24
   LiVTqCPqpFh8F7zykMC8NZoIBMuC2xR+NuT1rrTP2fsFO1u6vtda7NSxL
   j4yfIpRQVG9pEwSiLSH3SZJ81Bg+4lVsKViTKs459D2c77Jet0J5YlY56
   g==;
X-CSE-ConnectionGUID: OL8y2ClWTDaMuO0pihjdLA==
X-CSE-MsgGUID: 1J31/kIaQ+mY3rKmZ4XduA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68312144"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68312144"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:27:33 -0700
X-CSE-ConnectionGUID: v2vEXPT1SKiGzRSHizbY1Q==
X-CSE-MsgGUID: pDuKdDNnQmqo+aEOd7MrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170302569"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2025 19:27:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujqLq-0002I2-0z;
	Thu, 07 Aug 2025 02:27:30 +0000
Date: Thu, 7 Aug 2025 10:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 15/17] include/linux/bpf_psi.h:18:41: warning:
 'struct psi_trigger' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202508071013.LkP5Y1pm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   56067bc9ae98ae8d75fbb2506874ef96ee0396e5
commit: 23cb752a881939dc52d857168e7a156606fbadb2 [15/17] sched: psi: implement psi trigger handling using bpf
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250807/202508071013.LkP5Y1pm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071013.LkP5Y1pm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071013.LkP5Y1pm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:22:
>> include/linux/bpf_psi.h:18:41: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      18 |         void (*handle_psi_event)(struct psi_trigger *t);
         |                                         ^~~~~~~~~~~
   include/linux/bpf_psi.h:40:47: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      40 | static inline void bpf_psi_add_trigger(struct psi_trigger *t,
         |                                               ^~~~~~~~~~~
   include/linux/bpf_psi.h:42:50: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      42 | static inline void bpf_psi_remove_trigger(struct psi_trigger *t) {}
         |                                                  ^~~~~~~~~~~
   include/linux/bpf_psi.h:43:48: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      43 | static inline void bpf_psi_handle_event(struct psi_trigger *t) {}
         |                                                ^~~~~~~~~~~


vim +18 include/linux/bpf_psi.h

    15	
    16	struct bpf_psi_ops {
    17		int (*init)(struct bpf_psi *bpf_psi);
  > 18		void (*handle_psi_event)(struct psi_trigger *t);
    19		void (*handle_cgroup_free)(u64 cgroup_id);
    20	
    21		/* private */
    22		struct bpf_psi *bpf_psi;
    23	};
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
