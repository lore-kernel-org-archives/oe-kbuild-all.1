Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A90A59
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 04:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689310224; x=1720846224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AlpddzsK9B72iqeNgC5kG2BBdoAvEF+g3iz8iisEnBI=;
  b=XTGS+Mhdu0y0Z9tD31cF4jFiVhIQWhhJrwXYc5PQq6t+yPJVgvRMRqVx
   7pzPKft8mMHd6q40d2cYksKd3y1jXrStUGXLlmRQvQZmJi8nI8BxPqVZh
   q1IOnSC4zsvdnFB+0AA/eojLrxzJ+mKlN9II0D/nOsfkLYR88ifz3I9Js
   yjtQqm14hq+ocTfPqsMy+xLKbCPUZF8H9dlMdEVj2yLL1q41uiQUdcDIN
   6t13GamrkjqIMCvDPBfyL7eUO0lpaGqX9jWMRSfLPsZ5aidSj1IEjPwmF
   pSUrpNTfbfz1QmjEBzbd0cInEC2rX+njMWXUxQeY3KM1ed8nSDct7y3wz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431561307"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="431561307"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 21:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792311565"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="792311565"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 21:50:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKAl4-0007Bl-04;
	Fri, 14 Jul 2023 04:50:22 +0000
Date: Fri, 14 Jul 2023 12:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 49/57]
 arch/x86/kernel/cpu/mce/inject.c:437:66: error: implicit declaration of
 function 'topology_amd_nodes_per_pkg'; did you mean 'topology_amd_node_id'?
Message-ID: <202307141233.d2lsNVDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   39d1f9d6ad3d4b9bf9c298db5685f22d8fe6e2c0
commit: d66eb4f7d75cfff16143a88e8d40eb3c9c59b405 [49/57] x86/cpu: Use common topology code for AMD
config: x86_64-buildonly-randconfig-r003-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141233.d2lsNVDV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141233.d2lsNVDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141233.d2lsNVDV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mce/inject.c: In function 'get_nbc_for_node':
>> arch/x86/kernel/cpu/mce/inject.c:437:66: error: implicit declaration of function 'topology_amd_nodes_per_pkg'; did you mean 'topology_amd_node_id'? [-Werror=implicit-function-declaration]
     437 |         cores_per_node = (c->x86_max_cores * smp_num_siblings) / topology_amd_nodes_per_pkg();
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                  topology_amd_node_id
   cc1: some warnings being treated as errors


vim +437 arch/x86/kernel/cpu/mce/inject.c

   431	
   432	static u32 get_nbc_for_node(int node_id)
   433	{
   434		struct cpuinfo_x86 *c = &boot_cpu_data;
   435		u32 cores_per_node;
   436	
 > 437		cores_per_node = (c->x86_max_cores * smp_num_siblings) / topology_amd_nodes_per_pkg();
   438		return cores_per_node * node_id;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
