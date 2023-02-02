Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A0D3239
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 12:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675339603; x=1706875603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0FyV+chNOR66b7Xs0p6tBKq9tWCPz+SYaNO8IQQ8jL8=;
  b=f44AnrP+aqndGh32CRyHqhlIgrHftcUwvqCtqk2Ppiz/R8r0HHicLgWq
   4l0blHKQr4ks3KA99CfvC2Xsd7/ABAB0xJ2Q4lRM1UJgx9Iyj/XWLE182
   jVi8xvfIUdPLQ2JkEAXCYKETnXnmSdw1SUWwJ6ob4RKym7g3Zf8O6+vwz
   f/p12889ziNGjF9BK1jtVtaF3wnLPI8+VzzY5egrUZblmoDp/EGUB4GLj
   sfzMalpmF/WMnqPdka/XvrokgSJE+KpoaAivPoTOl+PtyKLMuB9s39ocm
   85XS7+O269YJjY7uAsa/B+2tkQ2NPMXXSMvOnyoqPI+3NRITPUoqmm2+8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308767549"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="308767549"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 04:06:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658698848"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="658698848"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Feb 2023 04:06:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNYMG-0006U3-2J;
	Thu, 02 Feb 2023 12:06:28 +0000
Date: Thu, 2 Feb 2023 20:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/4]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:715:5: warning: no previous prototype
 for '__pkvm_register_illegal_abt_notifier'
Message-ID: <202302021940.EJwBevZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b2487c5b2bdbac887caa086038f90c88f31f30af
commit: f3472b47c8078c3887e34070a9498e62ec294f9d [2/4] ANDROID: KVM: arm64: Allow handling illegal aborts from pKVM modules
config: arm64-buildonly-randconfig-r005-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021940.EJwBevZJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout f3472b47c8078c3887e34070a9498e62ec294f9d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:715:5: warning: no previous prototype for '__pkvm_register_illegal_abt_notifier' [-Wmissing-prototypes]
     715 | int __pkvm_register_illegal_abt_notifier(void (*cb)(struct kvm_cpu_context *))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__pkvm_register_illegal_abt_notifier +715 arch/arm64/kvm/hyp/nvhe/mem_protect.c

   714	
 > 715	int __pkvm_register_illegal_abt_notifier(void (*cb)(struct kvm_cpu_context *))
   716	{
   717		return cmpxchg(&illegal_abt_notifier, NULL, cb) ? -EBUSY : 0;
   718	}
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
