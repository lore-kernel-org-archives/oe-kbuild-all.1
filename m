Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BE2361
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675876866; x=1707412866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HzTOM7eGCB48p1Br3ugk8SbrSg153Xf9chSGq714bEw=;
  b=DJxeaCotmMLJNDABcy/dB5Q/ihlufoOefrd1cZE8A669L/zbVb8yYczR
   sV4VuGavgYRCLcl942mqkJbSiTuwdvkwpBSYRn/NmG+G1aXvuiFGAVjlq
   CwVlu8OpHe65fU6I142mHwc9ugEZUk0oXDbeMy7hMIruQnsioL4TcdWsS
   V3yW8Rd+KdOXyTiN0XFiHpwGGDtpBiinPTx8Lo2uJq0BX6/5apEV6xZff
   7hqVQJpUNpE+CQVbCbHwoasLPvZeMv2lPoysEwd3Sx0eY6B75HEERE8N7
   4guHDhTirfQy/DIOQbVFla6qGNbMWynlwc+OQxZE6CyfuRv6Htvb+pl3G
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309513606"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="309513606"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="791274262"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="791274262"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 09:20:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPo77-0004Z0-15;
	Wed, 08 Feb 2023 17:20:09 +0000
Date: Thu, 9 Feb 2023 01:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tony Luck <tony.luck@intel.com>,
	Ashok Raj <ashok.raj@intel.com>
Subject: [daveh-devel:ucode-for-ashok 14/16]
 arch/x86/kernel/cpu/microcode/intel.c:800:35: error: initialization of 'u32
 (*)(int)' {aka 'unsigned int (*)(int)'} from incompatible pointer type 'u32
 (*)(void)' {aka 'unsigned int (*)(void)'}
Message-ID: <202302090151.nllEqzw1-lkp@intel.com>
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
commit: d1f54fa0ee375a3cd9a9a3502653607b81b58eac [14/16] [Patch v3 Part2 7/9] x86/microcode: Add a generic mechanism to declare support for minrev
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230209/202302090151.nllEqzw1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=d1f54fa0ee375a3cd9a9a3502653607b81b58eac
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout d1f54fa0ee375a3cd9a9a3502653607b81b58eac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/intel.c: In function 'apply_microcode_intel':
   arch/x86/kernel/cpu/microcode/intel.c:599:26: warning: unused variable 'ret' [-Wunused-variable]
     599 |         enum ucode_state ret;
         |                          ^~~
   arch/x86/kernel/cpu/microcode/intel.c: At top level:
   arch/x86/kernel/cpu/microcode/intel.c:798:10: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     798 |         .collect_cpu_info       = collect_cpu_info,
         |          ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:798:35: error: initialization of 'void (*)(int)' from incompatible pointer type 'int (*)(int,  struct cpu_signature *)' [-Werror=incompatible-pointer-types]
     798 |         .collect_cpu_info       = collect_cpu_info,
         |                                   ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:798:35: note: (near initialization for 'microcode_intel_ops.microcode_fini_cpu')
   arch/x86/kernel/cpu/microcode/intel.c:800:10: error: 'struct microcode_ops' has no member named 'get_microcode_version'; did you mean 'get_microcode_revision'?
     800 |         .get_microcode_version  = intel_get_microcode_revision,
         |          ^~~~~~~~~~~~~~~~~~~~~
         |          get_microcode_revision
>> arch/x86/kernel/cpu/microcode/intel.c:800:35: error: initialization of 'u32 (*)(int)' {aka 'unsigned int (*)(int)'} from incompatible pointer type 'u32 (*)(void)' {aka 'unsigned int (*)(void)'} [-Werror=incompatible-pointer-types]
     800 |         .get_microcode_version  = intel_get_microcode_revision,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/intel.c:800:35: note: (near initialization for 'microcode_intel_ops.get_microcode_revision')
   cc1: some warnings being treated as errors


vim +800 arch/x86/kernel/cpu/microcode/intel.c

a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko            2008-09-11  794  
4db646b1af8fdc arch/x86/kernel/microcode_intel.c     Hannes Eder                 2008-11-23  795  static struct microcode_ops microcode_intel_ops = {
d1f54fa0ee375a arch/x86/kernel/cpu/microcode/intel.c Dave Hansen                 2023-02-07  796  	.safe_late_load		= true,
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko            2008-09-11  797  	.request_microcode_fw	= request_microcode_fw,
8d86f390d9bb5b arch/x86/kernel/microcode_intel.c     Peter Oruba                 2008-07-28  798  	.collect_cpu_info	= collect_cpu_info,
532ed3740c1ed1 arch/x86/kernel/cpu/microcode/intel.c Henrique de Moraes Holschuh 2014-07-24  799  	.apply_microcode	= apply_microcode_intel,
c4d034fea56852 arch/x86/kernel/cpu/microcode/intel.c Dave Hansen                 2023-02-07 @800  	.get_microcode_version	= intel_get_microcode_revision,
8d86f390d9bb5b arch/x86/kernel/microcode_intel.c     Peter Oruba                 2008-07-28  801  };
8d86f390d9bb5b arch/x86/kernel/microcode_intel.c     Peter Oruba                 2008-07-28  802  

:::::: The code at line 800 was first introduced by commit
:::::: c4d034fea56852933d94732fbe044ba554aba745 ucode-version-op-intel

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
