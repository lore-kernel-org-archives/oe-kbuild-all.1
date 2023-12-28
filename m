Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35DF6FCF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibl2k2bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703764177; x=1735300177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wir40R2rEH5nCSGW94Ybers22YZK7PeX2M0o2Hhenwc=;
  b=ibl2k2bqlHSe8ZJmYB9VdQQyS85BQgZ5ImYQhDlEhOcFJLioGJkb3oS8
   hRf3CR0tom09bYCfyUCP0cobByh2NjsPWzR9i55lo70wpLqd5eXEdVdGz
   c1D+Y+tFVZfnozx69KUyBFmgsgndQtIBNTJnM++M2ghjstwjAF+zE/yXt
   z51ugK0J5JRapgFwFJWYUbBYh4X24+3uG6DtFvCABz6LntiJHm+H7IAPh
   1VrTrpS3MjkbG8xSjATebskUy9n+OZWj6KCcdUG7SAo5agWw0g6zLQ8Ky
   8gOPZBKYPjyRZmc8tcwumxqCv+oXAI/R7q7ULY1O1tXCOyVtCLjrrhS/u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="399323436"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="399323436"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 03:49:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="807408395"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="807408395"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Dec 2023 03:49:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIotD-000GS1-0p;
	Thu, 28 Dec 2023 11:49:29 +0000
Date: Thu, 28 Dec 2023 19:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:group_cpus 8/9] lib/group_cpus.c:79:83: error: incompatible
 pointer types passing 'struct cpumask **' to parameter of type
 'cpumask_var_t *' (aka 'struct cpumask (*)[1]')
Message-ID: <202312281913.45oudMqO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux group_cpus
head:   9e87e3fe992bf34f79fa5841a97b667c39882323
commit: 08643f5362abb830375d889fb52b490b505d3d1e [8/9] lib/group_cpus: rework group_cpus_evenly()
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231228/202312281913.45oudMqO-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312281913.45oudMqO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312281913.45oudMqO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/group_cpus.c:79:83: error: incompatible pointer types passing 'struct cpumask **' to parameter of type 'cpumask_var_t *' (aka 'struct cpumask (*)[1]') [-Werror,-Wincompatible-pointer-types]
      79 | DEFINE_FREE(free_node_to_cpumask, struct cpumask **, if (_T) free_node_to_cpumask(_T));
         |                                                                                   ^~
   include/linux/cleanup.h:62:71: note: expanded from macro 'DEFINE_FREE'
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                              ^~~~~
   lib/group_cpus.c:70:49: note: passing argument to parameter 'masks' here
      70 | static void free_node_to_cpumask(cpumask_var_t *masks)
         |                                                 ^
   1 error generated.


vim +79 lib/group_cpus.c

    78	
  > 79	DEFINE_FREE(free_node_to_cpumask, struct cpumask **, if (_T) free_node_to_cpumask(_T));
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
