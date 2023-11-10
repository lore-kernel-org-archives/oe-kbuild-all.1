Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455A01862B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdHUiuLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699618614; x=1731154614;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1shH/Ufv5+LDSa0xjeXDsCtNE6aZcjqwqWeBv6YusLo=;
  b=LdHUiuLtcWhqlydlJ7Eas9N4oNbYLKMPqTLR2MkJRBr44OBSD9kkr2FO
   T34getKIP7Xb3aFdetZY1/RY6Yubzr0UHTZAdbwuqx0w+bFK6O19zj0ui
   hTiUfWpWx6WrNIYeydbFrqRI6EsnW6THzu4AIoe5DwgUChXnjicyR6a2J
   f5IhdJa7mz/3RrMANLfBbio0Jor1ptVAT2mQ+/3MA/duRu5olBIjnZ7/k
   egxJex86LbJAl2DklLxbImQ9APK9NVNI1YFhg8fIDggBoADGkp8NVie70
   c8TOiZrVnwxo/gMTi5MBtDijAbiNZKzFusTBL8cvBkT+Fvmtr0Swg++7F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375215396"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375215396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 04:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="11858046"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2023 04:16:52 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1QRN-0009ak-33;
	Fri, 10 Nov 2023 12:16:49 +0000
Date: Fri, 10 Nov 2023 20:15:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3158/30000] security/security.c:324:5:
 sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be
 static?
Message-ID: <202311102018.fGa00Cjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 7cb75cc654c717697b9152cbce9ce5efbf4edab4 [3158/30000] LSM: Infrastructure management of the task security blob
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231110/202311102018.fGa00Cjt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102018.fGa00Cjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102018.fGa00Cjt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/security.c:303:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
>> security/security.c:324:5: sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be static?
   security/security.c:303:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     303 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~
   security/security.c:324:5: warning: no previous prototype for 'lsm_task_alloc' [-Wmissing-prototypes]
     324 | int lsm_task_alloc(struct task_struct *task)
         |     ^~~~~~~~~~~~~~

vim +/lsm_task_alloc +324 security/security.c

   315	
   316	/**
   317	 * lsm_task_alloc - allocate a composite task blob
   318	 * @task: the task that needs a blob
   319	 *
   320	 * Allocate the task blob for all the modules
   321	 *
   322	 * Returns 0, or -ENOMEM if memory can't be allocated.
   323	 */
 > 324	int lsm_task_alloc(struct task_struct *task)
   325	{
   326		if (blob_sizes.lbs_task == 0) {
   327			task->security = NULL;
   328			return 0;
   329		}
   330	
   331		task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
   332		if (task->security == NULL)
   333			return -ENOMEM;
   334		return 0;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
