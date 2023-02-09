Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB8371
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675932214; x=1707468214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUWttd5KJNclQiN7SjHRci22gpkkx37bhJmgo99GTpo=;
  b=g6uc+f1yQ41XQogexhtUKNIyqOhcKom6hKdJvioDPwK4YMeItXeer8Ad
   o+yHZeivD6X3X48gJbM30TAJuO6HA9rLO2da0DxOqAQex+hcVv+TMdaSa
   oYs9nUo+9qQ2EAE35Eq36gqveXQBvESbUNIHpkAxWA16e9qoydbWj/1LN
   NE013j8E0G6fBbLw5xVD0z/JDcDto7XQZlHmfzsOyF2tLRTrsofFqKZam
   pXP9t83GYnvzhxZqWpg7iyjZSeVoV9eVCIhMja9xTTimffQSf+JH69/Lj
   HagGuzTAkcR18B24vNYMiE3VWnSMkfuugUwcvvbYmdt1Wi03RzPQizMvR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="313686641"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="313686641"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 00:43:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="776391388"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="776391388"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Feb 2023 00:43:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ2Wi-0004wm-0Z;
	Thu, 09 Feb 2023 08:43:32 +0000
Date: Thu, 9 Feb 2023 16:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:ucode-for-ashok 5/16]
 arch/x86/kernel/cpu/microcode/intel.c:769:10: error: 'struct microcode_ops'
 has no member named 'get_microcode_version'; did you mean
 'get_microcode_revision'?
Message-ID: <202302091622.vXWE4fqI-lkp@intel.com>
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
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230209/202302091622.vXWE4fqI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=c4d034fea56852933d94732fbe044ba554aba745
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout c4d034fea56852933d94732fbe044ba554aba745
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302091622.vXWE4fqI-lkp@intel.com

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/intel.c:767:10: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     767 |         .collect_cpu_info       = collect_cpu_info,
         |          ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:767:35: error: initialization of 'void (*)(int)' from incompatible pointer type 'int (*)(int,  struct cpu_signature *)' [-Werror=incompatible-pointer-types]
     767 |         .collect_cpu_info       = collect_cpu_info,
         |                                   ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:767:35: note: (near initialization for 'microcode_intel_ops.microcode_fini_cpu')
>> arch/x86/kernel/cpu/microcode/intel.c:769:10: error: 'struct microcode_ops' has no member named 'get_microcode_version'; did you mean 'get_microcode_revision'?
     769 |         .get_microcode_version  = intel_get_microcode_revision,
         |          ^~~~~~~~~~~~~~~~~~~~~
         |          get_microcode_revision
>> arch/x86/kernel/cpu/microcode/intel.c:769:35: error: initialization of 'u32 (*)(int)' {aka 'unsigned int (*)(int)'} from incompatible pointer type 'u32 (*)(void)' {aka 'unsigned int (*)(void)'} [-Werror=incompatible-pointer-types]
     769 |         .get_microcode_version  = intel_get_microcode_revision,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:769:35: note: (near initialization for 'microcode_intel_ops.get_microcode_revision')
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
