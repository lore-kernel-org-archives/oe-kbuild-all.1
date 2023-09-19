Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9F1FDD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 03:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695093082; x=1726629082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpXSOgD9ZV9rP43A7fQDx3fdVFkKVxznEGgaTjOFUmo=;
  b=QKF73JOfmAMTok/OHcMMyupMp/kj9ya5UxXOESwnjRRAHAiGGFyuuG8G
   10JosRDudOIL8JjAeu90oDH89uveF5akAKrZY/gwfcGtBiW/kWDD43o/H
   aOV0DngWzJBnbuP/JQZnZkP2VFRRknvw3geyeq7qMyETbJFjjObLkmA9t
   VL9Tt4zeyP9JpNDrzHw1djczUFbDQHz9/G4a9ryXC1SE7EK3De1YThYQk
   vcBZB+wdUSltXeeiECqe0SvlwLM8C2oxBjSnQgRHQN+EbWi+xGgp5zltC
   P8Ndh1u18JNegVrOpyl7DpO5Y+Jxx3u+nu/E/siP/EW28r3++iEI9BlDB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378740626"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="378740626"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 20:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="992995675"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="992995675"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Sep 2023 20:11:20 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiR8w-0006pU-1h;
	Tue, 19 Sep 2023 03:11:18 +0000
Date: Tue, 19 Sep 2023 11:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 87/92] topology_common.c:undefined
 reference to `topology_get_logical_id'
Message-ID: <202309191114.Fg65Qtpo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   91418b13c03f8f6c26f4bfca7a82d9b94c4dccde
commit: 78c2272b69e36c329a8639b52af1b4741f2ce967 [87/92] x86/cpu/topology: Use topology logical mapping mechanism
config: i386-buildonly-randconfig-005-20230919 (https://download.01.org/0day-ci/archive/20230919/202309191114.Fg65Qtpo-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191114.Fg65Qtpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191114.Fg65Qtpo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/topology_common.o: in function `topo_set_ids':
>> topology_common.c:(.text+0xf4): undefined reference to `topology_get_logical_id'
>> ld: topology_common.c:(.text+0x103): undefined reference to `topology_get_logical_id'
   ld: arch/x86/kernel/cpu/debugfs.o: in function `dom_debug_show':
   debugfs.c:(.text+0x227): undefined reference to `domain_names'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
