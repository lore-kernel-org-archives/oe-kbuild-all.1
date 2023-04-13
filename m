Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633902C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681388511; x=1712924511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QN6t4QbnyVwBEtZEMhvkb+R6p+ZCzGEU4O3gfvJvgVI=;
  b=Mv/ZysJdwRarlfCiPvcKf6oPB+Wc2A8zwOQsiQUTIqf7jcznQwgHuLRG
   Tfknci6B5voH+CZB0boMdP58gwr3EiUkQYcnAeMbSxTIMezF86wpQW9m1
   WlP1ydpCiti9X9ilZ++P217IamEO2ko/0hTuw3A+LpJTTKB7eiDcYMysx
   YIy01J7JGo9M3y5vEI6sD2x3vT87yyLaQ/bnRwkz7K72RdGXESyyTL1B+
   u0EKw6XsKEnLYhI+p2t+RDsJVkvLuebRd0OB3529GhWa+exGnhBgNUegv
   U7O3QVipUnRh4TqCfds3MV6SWSBL5exO8Pxq86vHyxOdN00XZSb2klJvs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328284116"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; 
   d="scan'208";a="328284116"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 05:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639654985"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; 
   d="scan'208";a="639654985"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 05:21:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmvxU-000Yft-0h;
	Thu, 13 Apr 2023 12:21:48 +0000
Date: Thu, 13 Apr 2023 20:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/alt 2/6] arch/x86/kernel/alternative.o: warning:
 objtool: .altinstr_replacement+0x7: call without frame pointer save/setup
Message-ID: <202304132052.5Y144h63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/alt
head:   6da508eff773893ac70d41564fc6dcce31313a7a
commit: 9937825d23de1f52aa388c6c552f32b64bf77e46 [2/6] x86/alternative: Support relocations in alternatives
config: x86_64-randconfig-a003-20220801 (https://download.01.org/0day-ci/archive/20230413/202304132052.5Y144h63-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=9937825d23de1f52aa388c6c552f32b64bf77e46
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/alt
        git checkout 9937825d23de1f52aa388c6c552f32b64bf77e46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132052.5Y144h63-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/alternative.c:1395:32: warning: no previous prototype for '__alt_reloc_selftest' [-Wmissing-prototypes]
    1395 | __visible noinline void __init __alt_reloc_selftest(void *arg)
         |                                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/alternative.o: warning: objtool: .altinstr_replacement+0x7: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
