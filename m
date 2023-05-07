Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9AC1118A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683503286; x=1715039286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XD0AiVTtra1uvxU1U9gDlu77QOx1F0yn9/rLrlypPD0=;
  b=D2VCXFtesV61s5Fm5nj7P7nKmykZwsyz986UDBtXReVoG7gmAzHOFNBt
   5sAE4zEvu7Yfc9dRN/m/UpnNJh++El/Sb2l5FiWRszJFNNtn+7L6vs/Tf
   0wK7hYn3X6vBIddhyJ0Q7WsRkyWiNbIb+Ak6PADaFPYIKk+CGuk3k9T5+
   FIk+p9s+wQgIXv8GxXCTUyACQk//qAGtfpcNxtocXhZaHYChFv7LJHI5D
   vyNujTsdLsISAoNlgNMtUIpWooBpaGJAQqcBJnQq/ajFAtfBLIs1bSRFd
   R++6uMAgqoMWcHGR3zj2LTKYDuRCPdYNkuSgo6QXeTUPCwg6j71/8bfEO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="351680523"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="351680523"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 16:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="692410228"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="692410228"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 May 2023 16:48:04 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvo6m-0000uT-0v;
	Sun, 07 May 2023 23:48:04 +0000
Date: Mon, 8 May 2023 07:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/platform/x86/socwatch/sw_counter_list.c:88:25: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202305080756.Lxk9XQoY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: 80c46c8183c607e70bcb88e9b04febae6c7775a2 SEP/SOCWATCH Update SoCWatch driver after rebasing to linux v5.6
date:   2 years, 7 months ago
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230508/202305080756.Lxk9XQoY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/80c46c8183c607e70bcb88e9b04febae6c7775a2
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout 80c46c8183c607e70bcb88e9b04febae6c7775a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080756.Lxk9XQoY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/socwatch/sw_counter_list.c:88:25: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_counter_list.c:88:25: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_counter_list.c:88:25: sparse:     got restricted gfp_t

vim +88 drivers/platform/x86/socwatch/sw_counter_list.c

    74	
    75		pw_u64_t i = 0, max_msr_value = 0;//, msr_array_size = 0;
    76		pw_u64_t msr_list_size = sizeof(msr_info_list) / sizeof(msr_info_list[0]);
    77	
    78		// TODO: Probably sort msr_info_list rather than assuming it is sorted.
    79	
    80		// Since 'msr_info_list' is sorted, the last entry should be the highest MSR
    81		// address
    82		max_msr_value = msr_info_list[msr_list_size-1];
    83		pw_pr_debug("max msr value: %llx\n", max_msr_value);
    84	
    85		// TODO: Optimize the memory usage by making msr_search_array a bit vector
    86		msr_search_array_size = max_msr_value + 1;
    87		msr_search_array = sw_kmalloc(msr_search_array_size * sizeof(pw_u8_t),
  > 88				GFP_KERNEL);
    89	
    90		if (msr_search_array == NULL) {
    91			return -PW_ERROR;
    92		}
    93	
    94		memset(msr_search_array, 0, msr_search_array_size);
    95	
    96		for (i = 0; i < msr_list_size; ++i) {
    97			msr_search_array[msr_info_list[i]] = 1;
    98		}
    99	
   100		return PW_SUCCESS;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
