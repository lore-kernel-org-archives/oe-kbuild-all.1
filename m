Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D54A34
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 20:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693083236; x=1724619236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LqDE2UlbaTvnAohPbHzIzsrLied4CjE+VombLffspjo=;
  b=V1jB5rFnQv8FdDOMeVjouAHkCrReunzup8/2uNlhA5Ke+bPw2LACR8Tl
   zE8IfGQd+Lfx3GcwheHfvpyTVsu61MEGQJrS7eLgf05I+ofnWufQZ4rY9
   ZN4wz2tO/MKE0pCJjmBXsuHWYaWp+BnmCQsLLLzGshxldoy8CFtdE7lMi
   E0kbWqCGus73SKunm9W6rg49jmmCnwRPLIfm+P+/d5lDdqxp8HMp0nrlb
   iQt8nzRjXJBE9KcsmrPvWqw+V06jE3286rzbF5ik3atIFBZxVjq/aqCfR
   cdn106Ocwz8gz2LvZRVH7ucGJRYLnZqACDHAru/6GPdXn50p6kLG7WjcS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="405890614"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="405890614"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 13:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="740955358"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="740955358"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Aug 2023 13:53:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa0Hw-00054L-1L;
	Sat, 26 Aug 2023 20:53:48 +0000
Date: Sun, 27 Aug 2023 04:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: arch/um/drivers/hostaudio_kern.c:348: undefined reference to
 `unregister_sound_mixer'
Message-ID: <202308270448.0vfBd2Rx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28f20a19294da7df158dfca259d0e2b5866baaf9
commit: 0f5d4a0b995faa6537c4de79973817a4f8da206a crypto: certs: fix FIPS selftest dependency
date:   7 months ago
config: um-randconfig-r021-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270448.0vfBd2Rx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270448.0vfBd2Rx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270448.0vfBd2Rx-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_cleanup_module':
>> arch/um/drivers/hostaudio_kern.c:348: undefined reference to `unregister_sound_mixer'
>> /usr/bin/ld: arch/um/drivers/hostaudio_kern.c:349: undefined reference to `unregister_sound_dsp'
   /usr/bin/ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_init_module':
>> arch/um/drivers/hostaudio_kern.c:329: undefined reference to `register_sound_dsp'
>> /usr/bin/ld: arch/um/drivers/hostaudio_kern.c:335: undefined reference to `register_sound_mixer'
   /usr/bin/ld: arch/um/drivers/hostaudio_kern.c:339: undefined reference to `unregister_sound_dsp'
   collect2: error: ld returned 1 exit status


vim +348 arch/um/drivers/hostaudio_kern.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  321  
^1da177e4c3f41 Linus Torvalds 2005-04-16  322  static int __init hostaudio_init_module(void)
^1da177e4c3f41 Linus Torvalds 2005-04-16  323  {
b51d23e4e9fea6 Dan Streetman  2015-06-17  324  	kernel_param_lock(THIS_MODULE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  325  	printk(KERN_INFO "UML Audio Relay (host dsp = %s, host mixer = %s)\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  326  	       dsp, mixer);
b51d23e4e9fea6 Dan Streetman  2015-06-17  327  	kernel_param_unlock(THIS_MODULE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  328  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @329  	module_data.dev_audio = register_sound_dsp(&hostaudio_fops, -1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  330  	if (module_data.dev_audio < 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  331  		printk(KERN_ERR "hostaudio: couldn't register DSP device!\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  332  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds 2005-04-16  333  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  334  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @335  	module_data.dev_mixer = register_sound_mixer(&hostmixer_fops, -1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  336  	if (module_data.dev_mixer < 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  337  		printk(KERN_ERR "hostmixer: couldn't register mixer "
^1da177e4c3f41 Linus Torvalds 2005-04-16  338  		       "device!\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  339  		unregister_sound_dsp(module_data.dev_audio);
^1da177e4c3f41 Linus Torvalds 2005-04-16  340  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds 2005-04-16  341  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  342  
^1da177e4c3f41 Linus Torvalds 2005-04-16  343  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  344  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  345  
^1da177e4c3f41 Linus Torvalds 2005-04-16  346  static void __exit hostaudio_cleanup_module (void)
^1da177e4c3f41 Linus Torvalds 2005-04-16  347  {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @348  	unregister_sound_mixer(module_data.dev_mixer);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @349  	unregister_sound_dsp(module_data.dev_audio);
^1da177e4c3f41 Linus Torvalds 2005-04-16  350  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  351  

:::::: The code at line 348 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
