Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE5620F7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675844579; x=1707380579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cY5F8XRLOIkQmgqp5Qp2UJHgm7rgffX5XOBjEZCgKuM=;
  b=FlOebjzTwXu6uXb2xRw94lGdjWSKJ7LWGsXb1SB5SU63UzIXg4jfThv0
   jtlOyaXsa/Cv1UsPdJIZ44SEIxiaaDsODWZB0MAWtzW6r23XjAIgGiFCS
   L9UY587/1E/4RfUpDnaTR9VthVaxmvLdIoN21F2tVSCYe5a+6Q1opnU35
   p5eBtkkfNQdrjKT8SOxTKNfvud7bDYLDabnPj5V3Y7tFxRVjKzLYId+Ve
   jpp0ujPDSr9HNn1sNi81St3vkDpoEoBc6IpJrener0kIQUCnp4SSPtybG
   yq6XzxewlCZfLFtnXBerFGTdcr0l3C43YESkwr6IIPDSrV3zU8mgF4o56
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="415963062"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="415963062"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 00:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="730781792"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="730781792"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Feb 2023 00:22:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPfjE-0004JE-1y;
	Wed, 08 Feb 2023 08:22:56 +0000
Date: Wed, 8 Feb 2023 16:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:ucode-for-ashok 4/16]
 arch/x86/kernel/cpu/microcode/core.c:573:22: error: 'struct microcode_ops'
 has no member named 'collect_cpu_info'
Message-ID: <202302081611.jPWz5VRg-lkp@intel.com>
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
commit: 1f06d23f1930b256d37e15402fdb90e9f44db467 [4/16] ucode-version-op
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230208/202302081611.jPWz5VRg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=1f06d23f1930b256d37e15402fdb90e9f44db467
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout 1f06d23f1930b256d37e15402fdb90e9f44db467
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'microcode_init_cpu':
>> arch/x86/kernel/cpu/microcode/core.c:573:22: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     573 |         microcode_ops->collect_cpu_info(cpu, &uci->cpu_sig);
         |                      ^~
--
>> arch/x86/kernel/cpu/microcode/intel.c:767:10: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     767 |         .collect_cpu_info                 = collect_cpu_info,
         |          ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:767:45: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     767 |         .collect_cpu_info                 = collect_cpu_info,
         |                                             ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:767:45: note: (near initialization for 'microcode_intel_ops')
>> arch/x86/kernel/cpu/microcode/intel.c:767:45: error: initialization of 'void (*)(int)' from incompatible pointer type 'int (*)(int,  struct cpu_signature *)' [-Werror=incompatible-pointer-types]
   arch/x86/kernel/cpu/microcode/intel.c:767:45: note: (near initialization for 'microcode_intel_ops.microcode_fini_cpu')
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/cpu/microcode/amd.c: In function 'load_ucode_amd_ap':
   arch/x86/kernel/cpu/microcode/amd.c:534:28: warning: unused variable 'dummy' [-Wunused-variable]
     534 |         u32 *new_rev, rev, dummy;
         |                            ^~~~~
   arch/x86/kernel/cpu/microcode/amd.c: In function 'apply_microcode_amd':
   arch/x86/kernel/cpu/microcode/amd.c:718:17: error: label 'out' used but not defined
     718 |                 goto out;
         |                 ^~~~
   arch/x86/kernel/cpu/microcode/amd.c:695:29: warning: unused variable 'c' [-Wunused-variable]
     695 |         struct cpuinfo_x86 *c = &cpu_data(cpu);
         |                             ^
   arch/x86/kernel/cpu/microcode/amd.c: At top level:
>> arch/x86/kernel/cpu/microcode/amd.c:950:10: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     950 |         .collect_cpu_info                 = collect_cpu_info_amd,
         |          ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:950:45: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     950 |         .collect_cpu_info                 = collect_cpu_info_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:950:45: note: (near initialization for 'microcode_amd_ops')
>> arch/x86/kernel/cpu/microcode/amd.c:950:45: error: initialization of 'void (*)(int)' from incompatible pointer type 'int (*)(int,  struct cpu_signature *)' [-Werror=incompatible-pointer-types]
   arch/x86/kernel/cpu/microcode/amd.c:950:45: note: (near initialization for 'microcode_amd_ops.microcode_fini_cpu')
   arch/x86/kernel/cpu/microcode/amd.c:952:45: warning: initialized field overwritten [-Woverride-init]
     952 |         .microcode_fini_cpu               = microcode_fini_cpu_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:952:45: note: (near initialization for 'microcode_amd_ops.microcode_fini_cpu')
>> arch/x86/kernel/cpu/microcode/amd.c:953:45: error: initialization of 'u32 (*)(int)' {aka 'unsigned int (*)(int)'} from incompatible pointer type 'u32 (*)(void)' {aka 'unsigned int (*)(void)'} [-Werror=incompatible-pointer-types]
     953 |         .get_microcode_revision           = get_microcode_revision_amd,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/amd.c:953:45: note: (near initialization for 'microcode_amd_ops.get_microcode_revision')
   cc1: some warnings being treated as errors


vim +573 arch/x86/kernel/cpu/microcode/core.c

280a9ca5d0663b arch/x86/kernel/microcode_core.c     Dmitry Adamushko 2008-12-20  566  
2071c0aeda2281 arch/x86/kernel/cpu/microcode/core.c Borislav Petkov  2022-10-19  567  static enum ucode_state microcode_init_cpu(int cpu)
d45de40934897c arch/x86/kernel/microcode.c          Dmitry Adamushko 2008-08-20  568  {
871b72dd1e12af arch/x86/kernel/microcode_core.c     Dmitry Adamushko 2009-05-11  569  	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
d45de40934897c arch/x86/kernel/microcode.c          Dmitry Adamushko 2008-08-20  570  
2071c0aeda2281 arch/x86/kernel/cpu/microcode/core.c Borislav Petkov  2022-10-19  571  	memset(uci, 0, sizeof(*uci));
7f709d0c322203 arch/x86/kernel/cpu/microcode/core.c Borislav Petkov  2016-10-25  572  
2071c0aeda2281 arch/x86/kernel/cpu/microcode/core.c Borislav Petkov  2022-10-19 @573  	microcode_ops->collect_cpu_info(cpu, &uci->cpu_sig);
fd1452ebf25731 arch/x86/kernel/microcode_core.c     Dmitry Adamushko 2008-10-02  574  
2071c0aeda2281 arch/x86/kernel/cpu/microcode/core.c Borislav Petkov  2022-10-19  575  	return microcode_ops->apply_microcode(cpu);
d45de40934897c arch/x86/kernel/microcode.c          Dmitry Adamushko 2008-08-20  576  }
d45de40934897c arch/x86/kernel/microcode.c          Dmitry Adamushko 2008-08-20  577  

:::::: The code at line 573 was first introduced by commit
:::::: 2071c0aeda228107bf1b9e870b6187c90fbeef1d x86/microcode: Simplify init path even more

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
