Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C21C38
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 07:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677827907; x=1709363907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TIs8vSyG5bXGsG0NLegOaEP1SjffPdbGqUaJkgM2rB8=;
  b=aU54YzzthTApVaDIIvjogDc2Vca0I2FxIzqtQhXAo+yvfLRePwKV+qFp
   O4C7hOQiLi6/OTUl4fnaO2OuVRdtq6RihtcGSQ6XZCHuQ0tj4dnZNNQ0V
   dR1kkRynOoPAh4vwagv0eeIk8Nhn+YxPw50MNlHgv013n9ghBAUyhcRgH
   UOzn/CgOw+Uw/by2YED8bRpHS+uK4YbMa39NaySg64xGps1pyuJSOSwh7
   fgffayuYakvjTRe6K9vGnG3EiHCletGC95/vKbgXV0bkju0SYsQ9qT5iH
   2BCkxw7Rc77GWZPmHuvhxeF6yNDnX09bv/n7tiarqI2fEGMVunM2fVZdD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334999310"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="334999310"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 23:18:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004487367"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="1004487367"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2023 23:18:13 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXzg2-0001II-2H;
	Fri, 03 Mar 2023 07:18:02 +0000
Date: Fri, 3 Mar 2023 15:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 39/152] crypto/testmgr.c:336:53: error:
 'MAX_ALGAPI_ALIGNMASK' undeclared; did you mean 'MAX_CIPHER_ALIGNMASK'?
Message-ID: <202303031532.HFReX8sc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   187298f40ebfa8aa5002b22d760c07f1834ceabd
commit: f3007a76216d079b341fc4da785198ffc53b5fc8 [39/152] crypto: testmgr - add testvec_config struct and helper functions
config: arm64-randconfig-r022-20230302 (https://download.01.org/0day-ci/archive/20230303/202303031532.HFReX8sc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=f3007a76216d079b341fc4da785198ffc53b5fc8
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout f3007a76216d079b341fc4da785198ffc53b5fc8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031532.HFReX8sc-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/testmgr.c: In function 'valid_testvec_config':
>> crypto/testmgr.c:336:53: error: 'MAX_ALGAPI_ALIGNMASK' undeclared (first use in this function); did you mean 'MAX_CIPHER_ALIGNMASK'?
     336 |             (cfg->iv_offset_relative_to_alignmask ? MAX_ALGAPI_ALIGNMASK : 0) >
         |                                                     ^~~~~~~~~~~~~~~~~~~~
         |                                                     MAX_CIPHER_ALIGNMASK
   crypto/testmgr.c:336:53: note: each undeclared identifier is reported only once for each function it appears in
   crypto/testmgr.c: At top level:
   crypto/testmgr.c:567:12: warning: 'build_cipher_test_sglists' defined but not used [-Wunused-function]
     567 | static int build_cipher_test_sglists(struct cipher_test_sglists *tsgls,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:557:13: warning: 'free_cipher_test_sglists' defined but not used [-Wunused-function]
     557 | static void free_cipher_test_sglists(struct cipher_test_sglists *tsgls)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:535:36: warning: 'alloc_cipher_test_sglists' defined but not used [-Wunused-function]
     535 | static struct cipher_test_sglists *alloc_cipher_test_sglists(void)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:515:13: warning: 'is_test_sglist_corrupted' defined but not used [-Wunused-function]
     515 | static bool is_test_sglist_corrupted(const struct test_sglist *tsgl)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:477:12: warning: 'verify_correct_output' defined but not used [-Wunused-function]
     477 | static int verify_correct_output(const struct test_sglist *tsgl,
         |            ^~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:313:13: warning: 'valid_testvec_config' defined but not used [-Wunused-function]
     313 | static bool valid_testvec_config(const struct testvec_config *cfg)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +336 crypto/testmgr.c

   307	
   308	/*
   309	 * Check whether the given testvec_config is valid.  This isn't strictly needed
   310	 * since every testvec_config should be valid, but check anyway so that people
   311	 * don't unknowingly add broken configs that don't do what they wanted.
   312	 */
   313	static bool valid_testvec_config(const struct testvec_config *cfg)
   314	{
   315		bool any_flushes = false;
   316	
   317		if (cfg->name == NULL)
   318			return false;
   319	
   320		if (!valid_sg_divisions(cfg->src_divs, ARRAY_SIZE(cfg->src_divs),
   321					&any_flushes))
   322			return false;
   323	
   324		if (cfg->dst_divs[0].proportion_of_total) {
   325			if (!valid_sg_divisions(cfg->dst_divs,
   326						ARRAY_SIZE(cfg->dst_divs),
   327						&any_flushes))
   328				return false;
   329		} else {
   330			if (memchr_inv(cfg->dst_divs, 0, sizeof(cfg->dst_divs)))
   331				return false;
   332			/* defaults to dst_divs=src_divs */
   333		}
   334	
   335		if (cfg->iv_offset +
 > 336		    (cfg->iv_offset_relative_to_alignmask ? MAX_ALGAPI_ALIGNMASK : 0) >
   337		    MAX_ALGAPI_ALIGNMASK + 1)
   338			return false;
   339	
   340		if (any_flushes && cfg->finalization_type == FINALIZATION_TYPE_DIGEST)
   341			return false;
   342	
   343		return true;
   344	}
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
