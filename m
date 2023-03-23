Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0E5320A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679561240; x=1711097240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lm6wtq1fNxghGIW5XFaPwOhAcOfHSsw0J+MoeE0snIk=;
  b=RDVZUMyRSWG5Hd2fkgbKhmtKJ2VQFbWnO1T77xPy8UOkqEZs55JjGGLl
   gElVTkoGuqhtEvhCXxozP3ii7svPdqAlZcVo3QCAU6+cnCstS3CT63IJL
   LRPh689EKfpFc48WttpTKEr2H7I8wCVH0FrNjzU5HHpgRXayRYkUlpKPh
   Vs/9ztJhqnAg8bJ2LUmNB//m6SBmtHK6evhlaWMaJa6miY7nQeFE9PFsj
   Z2zT8w9Y1hhhIqbWFGc2EYjjR9WkQBSvsrIMRt3QpobDMYxcxokLSr9Yt
   +/TbBFTYbnQwDhT34/pSYdhGbwECMTSNfTCIW7OJfN5HcXqIm2ugch84F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336936439"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="336936439"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 01:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684635387"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="684635387"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 01:47:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfGbO-000EBA-0E;
	Thu, 23 Mar 2023 08:47:18 +0000
Date: Thu, 23 Mar 2023 16:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 325/325]
 arch/s390/kvm/../../../virt/kvm/kvm_main.c:2117:12: warning: no previous
 prototype for 'kvm_arch_required_alignment'
Message-ID: <202303231603.zXqjdSR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   2a4df90769b13103056558d83a28e6ebca4ba2ee
commit: 2a4df90769b13103056558d83a28e6ebca4ba2ee [325/325] KVM: Relax alignment check for restricted mem
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230323/202303231603.zXqjdSR8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/2a4df90769b13103056558d83a28e6ebca4ba2ee
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 2a4df90769b13103056558d83a28e6ebca4ba2ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231603.zXqjdSR8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:2117:12: warning: no previous prototype for 'kvm_arch_required_alignment' [-Wmissing-prototypes]
    2117 | __weak int kvm_arch_required_alignment(u64 gpa)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_arch_required_alignment':
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:2120:1: error: expected ';' before '}' token
    2120 | }
         | ^


vim +/kvm_arch_required_alignment +2117 arch/s390/kvm/../../../virt/kvm/kvm_main.c

  2115	
  2116	#ifndef kvm_arch_required_alignment
> 2117	__weak int kvm_arch_required_alignment(u64 gpa)
  2118	{
  2119		return PAGE_SHIFT
> 2120	}
  2121	#endif
  2122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
