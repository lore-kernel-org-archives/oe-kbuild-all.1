Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1407461
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+WSe1oP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703763815; x=1735299815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8dgTG4LCadmGB80dTnP4u3SBn3ABFxpTTtw4orP8s8M=;
  b=B+WSe1oPwZgYZ2VZSeeLn5++makB7gIwWepEuFDoQUUZRNZSwJfg7UP2
   lOnoA9DpsmuQxQgdnCfEzV/QPKtMkHzxzTV+20UxGtkCwwBDRznF63qav
   hkrxVwl4U31Mq9HYewFFw66TUoPBtiqwsj2YI2gnVKw5xWD1gZ8z7F/L8
   P50TOLM5pW6lyFLXs0fERfOlTI8WwNSMN5TGQ76IkO7JWP4ko+oTetROm
   8VdP/xeE+5crtTD5NdiDO8JMgPaI7I09VZUDRvsYKfixSb49qcbGkAxSo
   hz6vg0T9uA0DeyQufXry5nXnexp4cnHaEAdLCZB/ugrXgCSi9n6plVZjE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3834823"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="3834823"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 03:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="901954185"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="901954185"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Dec 2023 03:43:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIonM-000GQd-1z;
	Thu, 28 Dec 2023 11:43:25 +0000
Date: Thu, 28 Dec 2023 19:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:group_cpus 8/9] lib/group_cpus.c:79:83: error: passing
 argument 1 of 'free_node_to_cpumask' from incompatible pointer type
Message-ID: <202312281926.ME1e2b9d-lkp@intel.com>
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
config: arc-defconfig (https://download.01.org/0day-ci/archive/20231228/202312281926.ME1e2b9d-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312281926.ME1e2b9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312281926.ME1e2b9d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from lib/group_cpus.c:7:
   lib/group_cpus.c: In function '__free_free_node_to_cpumask':
>> lib/group_cpus.c:79:83: error: passing argument 1 of 'free_node_to_cpumask' from incompatible pointer type [-Werror=incompatible-pointer-types]
      79 | DEFINE_FREE(free_node_to_cpumask, struct cpumask **, if (_T) free_node_to_cpumask(_T));
         |                                                                                   ^~
         |                                                                                   |
         |                                                                                   struct cpumask **
   include/linux/cleanup.h:62:78: note: in definition of macro 'DEFINE_FREE'
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                              ^~~~~
   lib/group_cpus.c:70:49: note: expected 'struct cpumask (*)[1]' but argument is of type 'struct cpumask **'
      70 | static void free_node_to_cpumask(cpumask_var_t *masks)
         |                                  ~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/free_node_to_cpumask +79 lib/group_cpus.c

    78	
  > 79	DEFINE_FREE(free_node_to_cpumask, struct cpumask **, if (_T) free_node_to_cpumask(_T));
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
