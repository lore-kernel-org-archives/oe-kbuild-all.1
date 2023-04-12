Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0A3C02
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681299310; x=1712835310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfsEzCMVBDA0WooaShTz39yTj2e55XJ2aHIQxfNVay8=;
  b=ZcteCXRaB4KW0gh5QzRgWEBFH5/6NCJCoobFwbeZgCGDDN9e+edyNhjS
   4Y5I1UVCSOVD1Ux6ZT0igYsXPwJ5vA3lYGEGhKe50SsHQSaAwmyLJdtk+
   BkFhTjKXWD7cog/3nxwXWEiVZ1QMoi2ez25Y5ifCFwnazkGX2kA5G0kxD
   zSdhDNOmt+sjoo40WL/FU8eeuTromIqco0Qzi3VnTRjtekvvbMpOUgUXb
   bJdXHaak3e1Fmrrgmtv2KJLIIrvGQFs2784LkWRUOTfxuxtpU6taFwj0u
   l5LhsvjLkVz6kUqdqoCtnL2lp+J8VcJRISnS4Ot62z36a2lZmqPpwOR4r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="332562418"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="332562418"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 04:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018712894"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="1018712894"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2023 04:35:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmYkl-000XgV-2X;
	Wed, 12 Apr 2023 11:35:07 +0000
Date: Wed, 12 Apr 2023 19:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:tmp-crypto-x86-local-labels 49/52]
 arch/x86/mm/testmmiotrace.o: warning: objtool: do_test+0x0: indirect call
 found in RETPOLINE build
Message-ID: <202304121937.USfyQErQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git tmp-crypto-x86-local-labels
head:   05c1b94d2afb1f4e0b2ce8bd48a8097df4288166
commit: 3308893d18a862828ec552159ea3dc35edd86957 [49/52] WIP
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304121937.USfyQErQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=3308893d18a862828ec552159ea3dc35edd86957
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb tmp-crypto-x86-local-labels
        git checkout 3308893d18a862828ec552159ea3dc35edd86957
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121937.USfyQErQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/testmmiotrace.o: warning: objtool: do_test+0x0: indirect call found in RETPOLINE build
>> arch/x86/mm/testmmiotrace.o: warning: objtool: init+0x4: indirect call found in RETPOLINE build

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
