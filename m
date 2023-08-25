Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA0CA60
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692975262; x=1724511262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6WVzl6XPI6Ul9xOJB+csAPKyaNLr2SuWJ1J6WP/hIhQ=;
  b=VSbJVIocRk9WlZ0aWuhD+sfx/ln9k6pBezJ4eqV102oI5XtnIUVqa8io
   fYTwQ6qmkk/+ifMzY7Tp19eAZZyy6hqZAVqh7HoR3m3K4bPwUHZWRmzfS
   flzqKlNb73luYc1oPT2DaZ+jRm4vHTRRCpiQndJAW9G1Gm451UK+RWFVk
   1d7/LxbRRCMG01UwSRTb6CWW9aIkqVjdksRfS91bHrv1e7jDQB3PU3ZOk
   nICcBJPMZKAh3+/upvNO6duKS/VthF11Xgcd1hKln0+uxsr7Uzf29wC0a
   oT+va+m0MvnMSykoDjRK9p6fqteuaaAGj8EJa5DUv7445Xe+cvyndW265
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="374704247"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374704247"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 07:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="766972472"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766972472"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 07:54:19 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZYCY-0003iB-0J;
	Fri, 25 Aug 2023 14:54:18 +0000
Date: Fri, 25 Aug 2023 22:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12846/12910]
 arch/x86/kernel/cpu/microcode/amd.c:504:58: warning: 'h.bin' directive
 output may be truncated writing 5 bytes into a region of size between 1 and
 7
Message-ID: <202308252255.2HPJ6x5Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: 0396ebf8fb52069f18d7b947e9313c32b858a2f9 [12846/12910] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230825/202308252255.2HPJ6x5Q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252255.2HPJ6x5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252255.2HPJ6x5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/amd.c: In function 'find_blobs_in_containers':
>> arch/x86/kernel/cpu/microcode/amd.c:504:58: warning: 'h.bin' directive output may be truncated writing 5 bytes into a region of size between 1 and 7 [-Wformat-truncation=]
     504 |                          "amd-ucode/microcode_amd_fam%.2xh.bin", family);
         |                                                          ^~~~~
   arch/x86/kernel/cpu/microcode/amd.c:503:17: note: 'snprintf' output between 35 and 41 bytes into a destination of size 36
     503 |                 snprintf(fw_name, sizeof(fw_name),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |                          "amd-ucode/microcode_amd_fam%.2xh.bin", family);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +504 arch/x86/kernel/cpu/microcode/amd.c

fe055896c040df Borislav Petkov 2015-10-20  493  
06b8534cb72837 Borislav Petkov 2016-10-25  494  static bool get_builtin_microcode(struct cpio_data *cp, unsigned int family)
fe055896c040df Borislav Petkov 2015-10-20  495  {
fe055896c040df Borislav Petkov 2015-10-20  496  	char fw_name[36] = "amd-ucode/microcode_amd.bin";
9d48960414c708 Borislav Petkov 2021-10-21  497  	struct firmware fw;
9d48960414c708 Borislav Petkov 2021-10-21  498  
9d48960414c708 Borislav Petkov 2021-10-21  499  	if (IS_ENABLED(CONFIG_X86_32))
9d48960414c708 Borislav Petkov 2021-10-21  500  		return false;
fe055896c040df Borislav Petkov 2015-10-20  501  
fe055896c040df Borislav Petkov 2015-10-20  502  	if (family >= 0x15)
fe055896c040df Borislav Petkov 2015-10-20  503  		snprintf(fw_name, sizeof(fw_name),
fe055896c040df Borislav Petkov 2015-10-20 @504  			 "amd-ucode/microcode_amd_fam%.2xh.bin", family);
fe055896c040df Borislav Petkov 2015-10-20  505  
9d48960414c708 Borislav Petkov 2021-10-21  506  	if (firmware_request_builtin(&fw, fw_name)) {
9d48960414c708 Borislav Petkov 2021-10-21  507  		cp->size = fw.size;
9d48960414c708 Borislav Petkov 2021-10-21  508  		cp->data = (void *)fw.data;
9d48960414c708 Borislav Petkov 2021-10-21  509  		return true;
9d48960414c708 Borislav Petkov 2021-10-21  510  	}
9d48960414c708 Borislav Petkov 2021-10-21  511  
fe055896c040df Borislav Petkov 2015-10-20  512  	return false;
fe055896c040df Borislav Petkov 2015-10-20  513  }
fe055896c040df Borislav Petkov 2015-10-20  514  

:::::: The code at line 504 was first introduced by commit
:::::: fe055896c040df571e4ff56fb196d6845130057b x86/microcode: Merge the early microcode loader

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
