Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8C6219EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691786035; x=1723322035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LoGK9BQQyb5eY+wr93KiBxq0RrXoXnDSnaCRa9EyuHU=;
  b=BTeHM2GXUZtbvk0M9iOQ+DTSJUrEi5ktkT3GMaOsOFvhZmmTQQX91+EY
   3QoiEknkBuVUZdhTTaKxIa318dFneIyEWCxPkwAi0/yc9isZZab/0N4p6
   Mh9KZEimTOij7tyhPsuYqyPO3hk4H5l+yVcK//Y5cj0+078maj3wxcTPm
   hYIxqiwZFts6lE0QrQ4V5n062/kcohzXaZlEyW7h070H+76cXIdavd+BM
   01IJBma1TqPF0oUVCJ+rTnIaXUi12as6g2M9Z//5QV+iVlS0rPNS7KJuB
   C+gJSyZqebC2Nfy3nNcUbU/MNKf3+LnUPIZ06MRL4Iztf9J3a81ij0CeR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="361903623"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="361903623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 13:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709649527"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="709649527"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Aug 2023 13:33:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUYpT-00080y-0E;
	Fri, 11 Aug 2023 20:33:51 +0000
Date: Sat, 12 Aug 2023 04:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Sierra <alex.sierra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Philip Yang <Philip.Yang@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [linux-next:master 3829/8441]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:50:9: error: implicit
 declaration of function '_dynamic_func_call_no_desc'
Message-ID: <202308120420.43Ww4zyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 8923137dbe4b24863694c35284df51d036b5dd5e [3829/8441] drm/amdkfd: avoid svm dump when dynamic debug disabled
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230812/202308120420.43Ww4zyU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120420.43Ww4zyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120420.43Ww4zyU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c: In function 'svm_range_set_attr':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:50:9: error: implicit declaration of function '_dynamic_func_call_no_desc' [-Werror=implicit-function-declaration]
      50 |         _dynamic_func_call_no_desc("svm_range_dump", svm_range_debug_dump, svms)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:3568:9: note: in expansion of macro 'dynamic_svm_range_dump'
    3568 |         dynamic_svm_range_dump(svms);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/_dynamic_func_call_no_desc +50 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c

    44	
    45	/* Long enough to ensure no retry fault comes after svm range is restored and
    46	 * page table is updated.
    47	 */
    48	#define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	(2UL * NSEC_PER_MSEC)
    49	#define dynamic_svm_range_dump(svms) \
  > 50		_dynamic_func_call_no_desc("svm_range_dump", svm_range_debug_dump, svms)
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
