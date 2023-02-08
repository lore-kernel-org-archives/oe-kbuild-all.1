Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467ED2113
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675851313; x=1707387313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9marUyguNk9NhF6WiZlUu5bS8zqafz6sdEW2chmlTF8=;
  b=IdIydj5tj+VjeCVSNyTetgYpEFy457wDTegoehgkF63tAXhy1Vy69Srv
   oQFc23oEutu7zW7kOkg6I9RU24LYInX5VquekiGdwoZhxftuPv53ca4xG
   FiHAKzsScy8ykCBKDUJ0ioAXd3W0YUJcVjodo2hpEHL0rV7iufUNFr0/w
   ZJXsO2QsSVI2zMKzVkVoPkMdX2qZhVsEZlALIR97i9TxTwi3RKwGAE7Ag
   /eOTLORrB1W7y8JmSql2hI2kT2YTwToU6vtcGay6SpWsEmu9vdhoDcVyU
   ryxd+4bgysMnD0qPnbwRRlIqbN8mrkWLq6M7QLbClJaHqUinlEB5WvsHK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="392155699"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="392155699"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 02:15:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="791146320"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="791146320"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 02:15:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPhTh-0004O2-1Z;
	Wed, 08 Feb 2023 10:15:01 +0000
Date: Wed, 8 Feb 2023 18:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:ucode-for-ashok 5/16]
 arch/x86/kernel/cpu/microcode/intel.c:769:10: error: 'struct microcode_ops'
 has no member named 'get_microcode_version'; did you mean
 'get_microcode_revision'?
Message-ID: <202302081815.j0sgRhXQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git ucode-for-ashok
head:   01bd4486138ec018e1bb204d93e4e52190dfde21
commit: c4d034fea56852933d94732fbe044ba554aba745 [5/16] ucode-version-op-intel
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230208/202302081815.j0sgRhXQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=c4d034fea56852933d94732fbe044ba554aba745
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout c4d034fea56852933d94732fbe044ba554aba745
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/intel.c:767:10: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     767 |         .collect_cpu_info       = collect_cpu_info,
         |          ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:767:35: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     767 |         .collect_cpu_info       = collect_cpu_info,
         |                                   ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:767:35: note: (near initialization for 'microcode_intel_ops')
   arch/x86/kernel/cpu/microcode/intel.c:767:35: error: initialization of 'void (*)(int)' from incompatible pointer type 'int (*)(int,  struct cpu_signature *)' [-Werror=incompatible-pointer-types]
   arch/x86/kernel/cpu/microcode/intel.c:767:35: note: (near initialization for 'microcode_intel_ops.microcode_fini_cpu')
>> arch/x86/kernel/cpu/microcode/intel.c:769:10: error: 'struct microcode_ops' has no member named 'get_microcode_version'; did you mean 'get_microcode_revision'?
     769 |         .get_microcode_version  = intel_get_microcode_revision,
         |          ^~~~~~~~~~~~~~~~~~~~~
         |          get_microcode_revision
   arch/x86/kernel/cpu/microcode/intel.c:769:35: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     769 |         .get_microcode_version  = intel_get_microcode_revision,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:769:35: note: (near initialization for 'microcode_intel_ops')
   arch/x86/kernel/cpu/microcode/intel.c:769:35: warning: excess elements in struct initializer
   arch/x86/kernel/cpu/microcode/intel.c:769:35: note: (near initialization for 'microcode_intel_ops')
   cc1: some warnings being treated as errors


vim +769 arch/x86/kernel/cpu/microcode/intel.c

   764	
   765	static struct microcode_ops microcode_intel_ops = {
   766		.request_microcode_fw	= request_microcode_fw,
   767		.collect_cpu_info	= collect_cpu_info,
   768		.apply_microcode	= apply_microcode_intel,
 > 769		.get_microcode_version	= intel_get_microcode_revision,
   770	};
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
