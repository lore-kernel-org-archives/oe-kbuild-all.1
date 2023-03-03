Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143661FA1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677831608; x=1709367608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RD6eQrDmm8Oxod9+Tm7ijo4RuOcNKHPmnbz622vhHjA=;
  b=mfO4P1V6abXN8F6PZJsiAGVajUvC4HRb6ewkQIc3BPGUtfviCs0RE4cV
   gQ62AqAtN5IU6bxCqZM09VL3dZEmAAmKwjJ0pAcW6l65zb7aXt9cJNOik
   LiypCwJ6qooMOglJBze2SarfYi0elTHLtQKVTvgrehXbfmUBIhwlOZoFU
   YTJxoURMpNbG79x1jsdQPB02MviKPMAbtVAvsdZeT06rkEsf/qtCox9jG
   i/qI2xYBD3z7IXg56hCs4dTwZJWOf0XYFcOBYjmJS/3OKvVt34xujK9Pz
   RRTsuN66Jsr5mND8hve21BxfcUP6pjJILr6YZXcjxxlhn26Wi+rzkwX4w
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="333711974"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="333711974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 00:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="675281912"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="675281912"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Mar 2023 00:20:04 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY0e3-0001KI-2e;
	Fri, 03 Mar 2023 08:20:03 +0000
Date: Fri, 3 Mar 2023 16:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: arch/powerpc/kvm/e500mc.c:171:5: error: no previous prototype for
 'kvmppc_e500mc_check_processor_compat'
Message-ID: <202303031630.ntvIuYqo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eb29d59ddf02e39774abfb60b2030b0b7e27c1f
commit: 7cb79f433e75b05d1635aefaa851cfcd1cb7dc4f KVM: PPC: Fix refactoring goof in kvmppc_e500mc_init()
date:   5 weeks ago
config: powerpc-randconfig-r001-20230302 (https://download.01.org/0day-ci/archive/20230303/202303031630.ntvIuYqo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7cb79f433e75b05d1635aefaa851cfcd1cb7dc4f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7cb79f433e75b05d1635aefaa851cfcd1cb7dc4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031630.ntvIuYqo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kvm/e500mc.c:171:5: error: no previous prototype for 'kvmppc_e500mc_check_processor_compat' [-Werror=missing-prototypes]
     171 | int kvmppc_e500mc_check_processor_compat(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/kvmppc_e500mc_check_processor_compat +171 arch/powerpc/kvm/e500mc.c

   170	
 > 171	int kvmppc_e500mc_check_processor_compat(void)
   172	{
   173		int r;
   174	
   175		if (strcmp(cur_cpu_spec->cpu_name, "e500mc") == 0)
   176			r = 0;
   177		else if (strcmp(cur_cpu_spec->cpu_name, "e5500") == 0)
   178			r = 0;
   179	#ifdef CONFIG_ALTIVEC
   180		/*
   181		 * Since guests have the privilege to enable AltiVec, we need AltiVec
   182		 * support in the host to save/restore their context.
   183		 * Don't use CPU_FTR_ALTIVEC to identify cores with AltiVec unit
   184		 * because it's cleared in the absence of CONFIG_ALTIVEC!
   185		 */
   186		else if (strcmp(cur_cpu_spec->cpu_name, "e6500") == 0)
   187			r = 0;
   188	#endif
   189		else
   190			r = -ENOTSUPP;
   191	
   192		return r;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
