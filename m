Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC682918
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 20:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692305706; x=1723841706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P73Nj0+SC3NXWv5x79ufC3xA1kmo8cokHxaLMJg5CIQ=;
  b=QCrQhUJQpA74RlyeSuXcyIgfPgsYcXHnQpkF1EdzJf+UgvzL8q5Vkvxw
   i/yBYkiMIRG3vk0jtcbfoPd8rddFylb5y3Gzo+kSBIc2YnwDir3s2o9U6
   8v0biVkjCVCwv4GAd+z4Q7T9xQpbmC7XkRGvhOrHC3VzOtSV/c+ojdDfV
   gEtBvUttfr8ktcakwfUhRbLuNaBbBsKiJQ/3J5z37fX1kQeoiSrtbmNyr
   /zbKgE85Es+ePP+AQNXAkxGxwvT2+Oqp8woPsn89keyWyvpChVcSjpuAh
   TM7NRC93FCRgL0giny1wgjiJQLIx8sq2Jky9PnTo5AFKzstYHyQVFIViu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363086456"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="363086456"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 13:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="804838581"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="804838581"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2023 13:53:57 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWk0D-0001TC-0E;
	Thu, 17 Aug 2023 20:53:57 +0000
Date: Fri, 18 Aug 2023 04:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:621: warning:
 Function parameter or member 'mni' not described in
 'svm_range_cpu_invalidate_pagetables'
Message-ID: <202308180426.KD4JvbY1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core63-43
head:   61b59f76f27b6ba04eb55fcc6b6d84d2bf4e76b6
commit: 7ca4d9a58f301fcf362680bc60488fac012bc50d UPSTREAM: drm/amdkfd: validate svm range system memory
date:   2 years, 2 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230818/202308180426.KD4JvbY1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180426.KD4JvbY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180426.KD4JvbY1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:621: warning: Function parameter or member 'mni' not described in 'svm_range_cpu_invalidate_pagetables'
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:621: warning: Function parameter or member 'range' not described in 'svm_range_cpu_invalidate_pagetables'
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:621: warning: Function parameter or member 'cur_seq' not described in 'svm_range_cpu_invalidate_pagetables'


vim +621 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c

   612	
   613	/**
   614	 * svm_range_cpu_invalidate_pagetables - interval notifier callback
   615	 *
   616	 */
   617	static bool
   618	svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
   619					    const struct mmu_notifier_range *range,
   620					    unsigned long cur_seq)
 > 621	{
   622		return true;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
