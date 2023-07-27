Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19DCD2F0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 08:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690446518; x=1721982518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q748cGaiY4biCoJwmkzUnrvNqHcgpcxX3LVUKvBwjq4=;
  b=LA3p8O763tD2wwV9hkkeJc5rluoSXLJ1z5GRlIHynlLzIWwkATCWlSfB
   +1DL6ofGb43YHRjpGDM27H+AK1+olbYECSZUJmuZv8UizwLEZ6cmgCuWz
   sDYcz7mok8y2hey0KtAiHeh4sP94LOJE3Z5iOg6HwNn2orZmzBb/a88+L
   IKM/1FBWiem8MJL0cx3W91vXJTR45GLCxQwmXrn/91mahgvWW1lucucYg
   DxTYlMJYl9RfaLgh3nPN+9jl+rF0pDMZ7G4dsKJxbvb0gQKJSJP/Nj/oT
   F57z0XcPEIrwcp02qm1zWYbQbUaCjQQfIYXGPGS5UlZQmN11QNY49HgrM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="434521862"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="434521862"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 01:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="973461614"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="973461614"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2023 01:28:35 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOwMH-00025X-3B;
	Thu, 27 Jul 2023 08:28:33 +0000
Date: Thu, 27 Jul 2023 16:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [sudeep-holla:android13-5.15/ffa 1113/4062]
 drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol
 'ads_page_owner' was not declared. Should it be static?
Message-ID: <202307271640.nuX5bQOa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/4062] ANDROID: android: Create debug_symbols driver
config: x86_64-randconfig-x062-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271640.nuX5bQOa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271640.nuX5bQOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271640.nuX5bQOa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol 'ads_page_owner' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:28:6: sparse: sparse: symbol 'ads_slub_debug' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:29:15: sparse: sparse: symbol 'ads_vmalloc_nr_pages' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:30:15: sparse: sparse: symbol 'ads_pcpu_nr_pages' was not declared. Should it be static?
   drivers/android/android_debug_symbols.c:88:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/ads_page_owner +27 drivers/android/android_debug_symbols.c

    26	
  > 27	bool ads_page_owner;
  > 28	bool ads_slub_debug;
  > 29	unsigned long ads_vmalloc_nr_pages;
  > 30	unsigned long ads_pcpu_nr_pages;
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
