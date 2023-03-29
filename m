Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF365382
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680110654; x=1711646654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hc7pRBEZa8n07+rtc06cewa5kTTBvODDSc+kOyka3XY=;
  b=UE/2p9rrKK/D8OyDHStMRuWJ8ZDYrakcFCKE+z+WbQk7q8lTAlb5LGbo
   D7asLL279tM3Kco2kRALAXAg44brDT8Ijc8whXkE5m2xXEdOI/FcSECR5
   u2nfa8cH79yEUW8MffABrGq4tq2tUSPkevfbWAM9l3PygaoCchf+PYfqS
   vmEwxmCyuYDq/PesnB4v8J8y53XLeTEvpmUA+qK7crvmJRWUNOEzEo7nl
   WYmBj69lSn3GdE8IatxN+s+cqCZ4As4EEtNX51XawPZoQrPSJ1dY08NL7
   VhU2jjXe0ILOY7PhvU6nseil43dJSPhnNgIWbZkU/zour5fZfphS0XeJ+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368720485"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="368720485"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 10:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014108461"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="1014108461"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2023 10:24:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phZWl-000Jl4-1K;
	Wed, 29 Mar 2023 17:24:03 +0000
Date: Thu, 30 Mar 2023 01:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/platform/x86/socwatch/sw_counter_list.c:88:25: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202303300155.IEvnN58t-lkp@intel.com>
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
date:   2 years, 6 months ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230330/202303300155.IEvnN58t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
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
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300155.IEvnN58t-lkp@intel.com/

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
