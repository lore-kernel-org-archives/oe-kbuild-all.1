Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597FA45
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693823647; x=1725359647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SH/lafFGafHU2uUfHa7NXMnft3wiqZi84aVUArAMO1c=;
  b=CbQw+AoxoS0CcBm6DnmsQv7T5pYAqwduO7apZBP5vfKxEpZ4oAs5SfvG
   4mMHARNLTENfdYHxjQD8ECFwk09I21bXxGb5bdQ05l3UkXinY1N6pSpQR
   l++l4kUdFTPp0c5nAYTxfS/iUMkLjLabGpfUYZw+6xACRpEBonMCmrKei
   7IYAT6aTaomrgs0D4wqYqeNUf09dJOrtX06fhV9ROXF2vJmRwSYlIIct9
   /a+LBYA7OQUMklgLMpNe6/WOdhKujoSUgy4uplcrTkC9HamPqwipI5lgJ
   PMaaaR/AQSpWpBucjxoDh7YZjnUnYC7+vGGdTY2S0dCNzSmgmqtMUgzsQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="440534541"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="440534541"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 03:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690547986"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="690547986"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Sep 2023 03:33:57 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd6sS-0000P1-2O;
	Mon, 04 Sep 2023 10:32:37 +0000
Date: Mon, 4 Sep 2023 18:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Zawawi, Muhammad Zul Husni" <muhammad.zul.husni.zawawi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 2339/2351]
 drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:460:25: warning: variable
 'vf_regs' set but not used
Message-ID: <202309041804.BzrBVXOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   18d00276e43669d12070546d738df98b52a0fbbf
commit: 7f2edf7ea216980d5aaeaa0d16c892f6bd1f6334 [2339/2351] drm/i915/gt: SR-IOV feature enablement
config: i386-randconfig-r022-20230904 (https://download.01.org/0day-ci/archive/20230904/202309041804.BzrBVXOh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309041804.BzrBVXOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309041804.BzrBVXOh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:460:25: warning: variable 'vf_regs' set but not used [-Wunused-but-set-variable]
           struct vf_runtime_reg *vf_regs = iov->vf.runtime.regs;
                                  ^
   1 warning generated.


vim +/vf_regs +460 drivers/gpu/drm/i915/gt/iov/intel_iov_query.c

   457	
   458	static void vf_show_runtime_info(struct intel_iov *iov)
   459	{
 > 460		struct vf_runtime_reg *vf_regs = iov->vf.runtime.regs;
   461		unsigned int size = iov->vf.runtime.regs_size;
   462	
   463		GEM_BUG_ON(!intel_iov_is_vf(iov));
   464	
   465		for (; size--; vf_regs++) {
   466			IOV_DEBUG(iov, "RUNTIME reg[%#x] = %#x\n",
   467				  vf_regs->offset, vf_regs->value);
   468		}
   469	}
   470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
