Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686B2199
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680353189; x=1711889189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IH16zvJ8AyZWz+2KO2UMr3PruLZamqWzIdO/8+LzhOE=;
  b=czLpmuXcajKaxqQUKudEb0JPHRY5Lb/3jHfNk02yHGPk2NN2WRQEmcSp
   Oh5FCoJv6exf9Kdl/KpuXHHNBtswHo18+qbgGJvIlRYiLKjM+qoe9bryk
   p/zth1yRUAAGvdCm03kVnM9H8WeLlI8U+Hey0SE0fQPdE6H3Ib4eeWca0
   C5o8mOrkmPe2BWlNOV55J9LVsDnZGmfVfeIFc6pPS9yuXNXSJidVVyzc/
   xf219glDLapgXjj1n3HkWnyQpx8pwklzwpTR19p6AUhqTiRb4VF9SW3tC
   67QTyRJVD6TE7SAKt88ar9Qesca0AB3bsnt53epER9+oboKYyzqtUN6Ww
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="339145478"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="339145478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 05:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="635592973"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="635592973"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Apr 2023 05:46:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piack-000Mlv-1Z;
	Sat, 01 Apr 2023 12:46:26 +0000
Date: Sat, 1 Apr 2023 20:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.4
 2811/9999] drivers/dma-buf/heaps/page_pool.c:236:17: sparse: sparse: symbol
 'pool_shrinker' was not declared. Should it be static?
Message-ID: <202304012020.FmhA8lWS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

First bad commit (maybe != root cause):

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-5.4
head:   09417023d02f21d46d6a239c93a6ae0f45a1b1e7
commit: 44008f99d9ca0793e2562967e1da01fa74ee4a41 [2811/9999] ANDROID: dma-buf: system_heap: Add pagepool support to system heap
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230401/202304012020.FmhA8lWS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/44008f99d9ca0793e2562967e1da01fa74ee4a41
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-5.4
        git checkout 44008f99d9ca0793e2562967e1da01fa74ee4a41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dma-buf/heaps/ init/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304012020.FmhA8lWS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/page_pool.c:236:17: sparse: sparse: symbol 'pool_shrinker' was not declared. Should it be static?
   drivers/dma-buf/heaps/page_pool.c:243:5: sparse: sparse: symbol 'dmabuf_page_pool_init_shrinker' was not declared. Should it be static?

vim +/pool_shrinker +236 drivers/dma-buf/heaps/page_pool.c

bd4db96bfc247af John Stultz 2020-10-02  235  
bd4db96bfc247af John Stultz 2020-10-02 @236  struct shrinker pool_shrinker = {
bd4db96bfc247af John Stultz 2020-10-02  237  	.count_objects = dmabuf_page_pool_shrink_count,
bd4db96bfc247af John Stultz 2020-10-02  238  	.scan_objects = dmabuf_page_pool_shrink_scan,
bd4db96bfc247af John Stultz 2020-10-02  239  	.seeks = DEFAULT_SEEKS,
bd4db96bfc247af John Stultz 2020-10-02  240  	.batch = 0,
bd4db96bfc247af John Stultz 2020-10-02  241  };
bd4db96bfc247af John Stultz 2020-10-02  242  

:::::: The code at line 236 was first introduced by commit
:::::: bd4db96bfc247afdaf7a4cfde85fd8147522f3e6 ANDROID: dma-buf: heaps: Add a shrinker controlled page pool

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
