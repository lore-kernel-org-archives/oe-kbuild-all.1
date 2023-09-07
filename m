Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2726A29
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 01:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694051489; x=1725587489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zwevr/szTfwC+Yy8EtZe1vBQZ4Y15NBu0cyWlvDMk+U=;
  b=EfGb5FJAy/g4mMv6FVBlXDXSr8KHCbuZy4RFRAibVgjhd+1m0MdJhjCh
   94/Vqd0AVpYu1iHLfBg///DK/XGRa9Pl4TaeqJ9QwYg6ISUCS+4H7GrnI
   RSO6SM3OW9xK89uOjlsvHopsNpaNYK4kXp7Ixc/Ea1m9JIUc1fJqToL+K
   mJmZJlU0bIBIhN+y6AzsyFCwqc4uXxzOJJDicaSCh7TBiB+DpL23cxL9D
   +BlRLDztsP5q2G09U87vrJvTsvzzBa4o5zorrMmwEdreAlVrs5C3e79pP
   +vjUG9XpwIjTU3DTEsNHYgXxv8cQXNOgvtpCLOit3jUL8c40cX3IG1zd0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367455382"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="367455382"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 18:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="884979378"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="884979378"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2023 18:51:14 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe4B3-0000mZ-0a;
	Thu, 07 Sep 2023 01:51:25 +0000
Date: Thu, 7 Sep 2023 09:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 15/179] arch/arm64/kvm/arm.c:493:15:
 warning: no previous prototype for 'kvm_arch_vcpu_get_ip'
Message-ID: <202309070955.hnJXlvp0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   89a4bca2629d5169c163e3ec353812226b0a1435
commit: a2aa2a6c9491a807bb898220acb1062dd8226a12 [15/179] BACKPORT: KVM: Move x86's perf guest info callbacks to generic KVM
config: arm64-randconfig-r035-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070955.hnJXlvp0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070955.hnJXlvp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070955.hnJXlvp0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:493:15: warning: no previous prototype for 'kvm_arch_vcpu_get_ip' [-Wmissing-prototypes]
     493 | unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
         |               ^~~~~~~~~~~~~~~~~~~~


vim +/kvm_arch_vcpu_get_ip +493 arch/arm64/kvm/arm.c

   492	
 > 493	unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
   494	{
   495		return *vcpu_pc(vcpu);
   496	}
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
