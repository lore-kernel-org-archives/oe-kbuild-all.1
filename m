Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A6538F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 20:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676232353; x=1707768353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=asUFCyKEJ+zUdco4KMLT5pQBWx42v3iG6j5CX3LWmf0=;
  b=Ew3Pyib/YsH1fGY15TsvtPmDjlBFB2kvbsmQ68ZeVZJfC8DeCNIjd/Hr
   OnGF4GEIxKrJ5CsBsoKk+MLDa1pZjull6i6RlVhG8VlpdrAzBSBq91EYa
   Z6BB15bdMcNiMStTp46qaiSuqVkOTQiYAnv4hf5seNU85Ag6UEfcG9/eX
   mn3xfC+HF3A6b3UthZgVZjIX88pnjZ3AUSiW2K7xR9yyE+oD0rpXKQIjq
   LjnAKwRt9REP3nIroDFlbERR0o/7emrqtpRGskkZ6Z1EIWqca/Sp7+Y97
   myfyLbUlcNGXHIyHQny2XwPn9jLSqxTgi7px0ZBbzpbGg+G0AP0qpSgAN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="314395492"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="314395492"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 12:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670590927"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="670590927"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Feb 2023 12:05:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRIbf-0007NJ-0Z;
	Sun, 12 Feb 2023 20:05:51 +0000
Date: Mon, 13 Feb 2023 04:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:asahi-6.2-rc3-7_dp-altmode-wip 2256/2268]
 drivers/mux/apple-display-crossbar.c:267:1: warning: 'static' is not at
 beginning of declaration
Message-ID: <202302130310.xrv1A6pX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux asahi-6.2-rc3-7_dp-altmode-wip
head:   72e7196879b629343123a0459d858ef161061600
commit: 9973c2a54f51ded15596231a192b75a30d98de5c [2256/2268] crossbar WIP
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302130310.xrv1A6pX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/9973c2a54f51ded15596231a192b75a30d98de5c
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik asahi-6.2-rc3-7_dp-altmode-wip
        git checkout 9973c2a54f51ded15596231a192b75a30d98de5c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/mux/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130310.xrv1A6pX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/apple-display-crossbar.c:267:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     267 | const static struct apple_dpxbar_hw apple_dpxbar_hw_t8103 = {
         | ^~~~~
   drivers/mux/apple-display-crossbar.c:272:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     272 | const static struct apple_dpxbar_hw apple_dpxbar_hw_t6000 = {
         | ^~~~~


vim +/static +267 drivers/mux/apple-display-crossbar.c

   266	
 > 267	const static struct apple_dpxbar_hw apple_dpxbar_hw_t8103 = {
   268		.n_ufp = 2,
   269		.tunable = 0,
   270	};
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
