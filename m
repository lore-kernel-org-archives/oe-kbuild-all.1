Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF5D266
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 03:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ck6wuaQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701832646; x=1733368646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yx/wZJfeiDUIig2Sw+QaJFDjLbPdBP7MWYnbnBNaMCw=;
  b=ck6wuaQZruKFVrw9B5m3U1Ut5c3EOBoVrTF0SMwh2L1V9C2eQZ1VBOuk
   X+Slps/lHAJmI2tJqWy1XSE5fwFehAq29/XCc+ZAZyt2hmVkxDKX/0hDE
   mULCdgaPRsBxPTCt92x7/XiJuOfMSBnPhbsmBPmGHtgetZwxdBHk4drfH
   feaYvPGMOuqvEmqIx11cWnYZETCh+IFXsCLMURcN41sApCg7OOfTBsHfX
   neVexfCK6qoGBra+LeQjwMnfHTWxN2lXmHy2Vink3Li2fJl+5Cu7E1kAJ
   JjN7SvASO+/+BWnq6vio99h/X2n7CTXLSjwTh6BldZwxvD4h0yWvyvMdc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374181589"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="374181589"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018428688"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1018428688"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 19:17:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAiPX-000A9G-04;
	Wed, 06 Dec 2023 03:17:19 +0000
Date: Wed, 6 Dec 2023 11:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4353/4884]
 arch/mips/kernel/machine_kexec.c:76:17: error: 'kexec_args' undeclared
Message-ID: <202312061137.QgjJ4nTc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 4fa0ee5b7e2ddb44036b40795ca4a79d94edc7d4 [4353/4884] kexec_core: change dependency of object files
config: mips-randconfig-r032-20220731 (https://download.01.org/0day-ci/archive/20231206/202312061137.QgjJ4nTc-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061137.QgjJ4nTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061137.QgjJ4nTc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/machine_kexec.c: In function 'uhi_machine_kexec_prepare':
>> arch/mips/kernel/machine_kexec.c:76:17: error: 'kexec_args' undeclared (first use in this function)
      76 |                 kexec_args[0] = -2;
         |                 ^~~~~~~~~~
   arch/mips/kernel/machine_kexec.c:76:17: note: each undeclared identifier is reported only once for each function it appears in
   arch/mips/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
   arch/mips/kernel/machine_kexec.c:97:14: error: implicit declaration of function 'kexec_nonboot_cpu_func' [-Werror=implicit-function-declaration]
      97 |         if (!kexec_nonboot_cpu_func())
         |              ^~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c: In function 'kexec_shutdown_secondary':
   arch/mips/kernel/machine_kexec.c:129:9: error: implicit declaration of function 'kexec_reboot' [-Werror=implicit-function-declaration]
     129 |         kexec_reboot();
         |         ^~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c: At top level:
   arch/mips/kernel/machine_kexec.c:136:1: warning: no previous prototype for 'machine_shutdown' [-Wmissing-prototypes]
     136 | machine_shutdown(void)
         | ^~~~~~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c:152:1: warning: no previous prototype for 'machine_crash_shutdown' [-Wmissing-prototypes]
     152 | machine_crash_shutdown(struct pt_regs *regs)
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c: In function 'machine_crash_shutdown':
   arch/mips/kernel/machine_kexec.c:157:17: error: implicit declaration of function 'default_machine_crash_shutdown'; did you mean '_machine_crash_shutdown'? [-Werror=implicit-function-declaration]
     157 |                 default_machine_crash_shutdown(regs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 _machine_crash_shutdown
   arch/mips/kernel/machine_kexec.c: At top level:
   arch/mips/kernel/machine_kexec.c:161:6: warning: no previous prototype for 'kexec_nonboot_cpu_jump' [-Wmissing-prototypes]
     161 | void kexec_nonboot_cpu_jump(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c:170:6: warning: no previous prototype for 'kexec_reboot' [-Wmissing-prototypes]
     170 | void kexec_reboot(void)
         |      ^~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c:170:6: warning: conflicting types for 'kexec_reboot'; have 'void(void)'
   arch/mips/kernel/machine_kexec.c:129:9: note: previous implicit declaration of 'kexec_reboot' with type 'void(void)'
     129 |         kexec_reboot();
         |         ^~~~~~~~~~~~
   arch/mips/kernel/machine_kexec.c: In function 'kexec_reboot':
   arch/mips/kernel/machine_kexec.c:191:17: error: implicit declaration of function 'kexec_nonboot_cpu'; did you mean 'kexec_nonboot_cpu_jump'? [-Werror=implicit-function-declaration]
     191 |                 kexec_nonboot_cpu();
         |                 ^~~~~~~~~~~~~~~~~
         |                 kexec_nonboot_cpu_jump
   arch/mips/kernel/machine_kexec.c: In function 'machine_kexec':
   arch/mips/kernel/machine_kexec.c:259:26: error: 'kexec_smp_wait' undeclared (first use in this function)
     259 |                 (void *)(kexec_smp_wait - relocate_new_kernel);
         |                          ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kexec_args +76 arch/mips/kernel/machine_kexec.c

2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  54  
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  55  static int uhi_machine_kexec_prepare(struct kimage *kimage)
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  56  {
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  57  	int i;
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  58  
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  59  	/*
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  60  	 * In case DTB file is not passed to the new kernel, a flat device
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  61  	 * tree will be created by kexec tool. It holds modified command
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  62  	 * line for the new kernel.
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  63  	 */
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  64  	for (i = 0; i < kimage->nr_segments; i++) {
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  65  		struct fdt_header fdt;
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  66  
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  67  		if (kimage->segment[i].memsz <= sizeof(fdt))
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  68  			continue;
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  69  
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  70  		if (copy_from_user(&fdt, kimage->segment[i].buf, sizeof(fdt)))
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  71  			continue;
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  72  
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  73  		if (fdt_check_header(&fdt))
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  74  			continue;
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  75  
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11 @76  		kexec_args[0] = -2;
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  77  		kexec_args[1] = (unsigned long)
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  78  			phys_to_virt((unsigned long)kimage->segment[i].mem);
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  79  		break;
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  80  	}
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  81  
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  82  	return 0;
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  83  }
2fe8ea39c9a848 Dengcheng Zhu 2018-09-11  84  

:::::: The code at line 76 was first introduced by commit
:::::: 2fe8ea39c9a8489799cf86bb377fc80492b5b3bf MIPS: kexec: Use prepare method from Generic for UHI platforms

:::::: TO: Dengcheng Zhu <dzhu@wavecomp.com>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
