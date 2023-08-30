Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA12EA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 02:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693361458; x=1724897458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hlmcm0e/tg7QDqEpKW6nUfh2B6EGGr2DJrbFPRVKcK4=;
  b=lCmDg0CGtqgG33959/K05b0UYBLKmCy5CysgVgoFXjEBwjrpjP9y+1wZ
   P6YH3hCsr0SUlSKERYKEUz0AjL/QE41T8HFdW4+9cBk2Bsa7wMGL+Dtxf
   ltuEPR3DjDP4nNcqcou2oAh4EGTIB5gRV7FXCgg7/UdMoQ4DAXF3TqxaY
   IwdtwG/llHkPWflwmGzOBqWbh6sKT4o8UehypxDXVwLrmi5Mtuk1cQpEA
   hzAEIS03G+75ROK5BGfKef2RQSKTGo/Eaz30gzf5JrQMc8v0jAL960zWi
   OKAvdod+QV12kkqbBzVogi4HrE2VSGQqnQ74y95Z3H4KWIRwjr4Bq2mpi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441892370"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="441892370"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 19:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985567469"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="985567469"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2023 19:10:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbAfX-0009Ix-33;
	Wed, 30 Aug 2023 02:10:55 +0000
Date: Wed, 30 Aug 2023 10:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] init: fix -Wmissing-variable-declarations warning
Message-ID: <202308300921.aivILtox-lkp@intel.com>
References: <20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215@google.com>

Hi Justin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 706a741595047797872e669b3101429ab8d378ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Stitt/init-fix-Wmissing-variable-declarations-warning/20230830-074037
base:   706a741595047797872e669b3101429ab8d378ef
patch link:    https://lore.kernel.org/r/20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215%40google.com
patch subject: [PATCH RFC] init: fix -Wmissing-variable-declarations warning
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230830/202308300921.aivILtox-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300921.aivILtox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300921.aivILtox-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: init/do_mounts_initrd.o: in function `handle_initrd':
>> init/do_mounts_initrd.c:103:(.init.text+0x21e): undefined reference to `envp_init'


vim +103 init/do_mounts_initrd.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   85  
c8643c72bc4278 Christoph Hellwig  2023-05-31   86  static void __init handle_initrd(char *root_device_name)
^1da177e4c3f41 Linus Torvalds     2005-04-16   87  {
907ed1328d2a74 Lucas De Marchi    2013-04-30   88  	struct subprocess_info *info;
ba4df2808a86f8 Al Viro            2012-10-02   89  	static char *argv[] = { "linuxrc", NULL, };
ba4df2808a86f8 Al Viro            2012-10-02   90  	extern char *envp_init[];
^1da177e4c3f41 Linus Torvalds     2005-04-16   91  	int error;
^1da177e4c3f41 Linus Torvalds     2005-04-16   92  
9acc17baf1fd63 Christoph Hellwig  2020-07-08   93  	pr_warn("using deprecated initrd support, will be removed in 2021.\n");
9acc17baf1fd63 Christoph Hellwig  2020-07-08   94  
^1da177e4c3f41 Linus Torvalds     2005-04-16   95  	real_root_dev = new_encode_dev(ROOT_DEV);
bdaf8529385d51 Greg Kroah-Hartman 2005-06-20   96  	create_dev("/dev/root.old", Root_RAM0);
^1da177e4c3f41 Linus Torvalds     2005-04-16   97  	/* mount initrd on rootfs' /root */
c8643c72bc4278 Christoph Hellwig  2023-05-31   98  	mount_root_generic("/dev/root.old", root_device_name,
c8643c72bc4278 Christoph Hellwig  2023-05-31   99  			   root_mountflags & ~MS_RDONLY);
83ff98c3e9cd2b Christoph Hellwig  2020-07-22  100  	init_mkdir("/old", 0700);
db63f1e3153845 Christoph Hellwig  2020-07-22  101  	init_chdir("/old");
^1da177e4c3f41 Linus Torvalds     2005-04-16  102  
907ed1328d2a74 Lucas De Marchi    2013-04-30 @103  	info = call_usermodehelper_setup("/linuxrc", argv, envp_init,
907ed1328d2a74 Lucas De Marchi    2013-04-30  104  					 GFP_KERNEL, init_linuxrc, NULL, NULL);
907ed1328d2a74 Lucas De Marchi    2013-04-30  105  	if (!info)
907ed1328d2a74 Lucas De Marchi    2013-04-30  106  		return;
1fbcaa923ce2d7 Peter Zijlstra     2022-08-22  107  	call_usermodehelper_exec(info, UMH_WAIT_PROC|UMH_FREEZABLE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  108  
^1da177e4c3f41 Linus Torvalds     2005-04-16  109  	/* move initrd to rootfs' /old */
c60166f04283ff Christoph Hellwig  2020-07-21  110  	init_mount("..", ".", NULL, MS_MOVE, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  111  	/* switch root and cwd back to / of rootfs */
4b7ca5014cbef5 Christoph Hellwig  2020-07-22  112  	init_chroot("..");
^1da177e4c3f41 Linus Torvalds     2005-04-16  113  
^1da177e4c3f41 Linus Torvalds     2005-04-16  114  	if (new_decode_dev(real_root_dev) == Root_RAM0) {
db63f1e3153845 Christoph Hellwig  2020-07-22  115  		init_chdir("/old");
^1da177e4c3f41 Linus Torvalds     2005-04-16  116  		return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  117  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  118  
db63f1e3153845 Christoph Hellwig  2020-07-22  119  	init_chdir("/");
^1da177e4c3f41 Linus Torvalds     2005-04-16  120  	ROOT_DEV = new_decode_dev(real_root_dev);
c8643c72bc4278 Christoph Hellwig  2023-05-31  121  	mount_root(root_device_name);
^1da177e4c3f41 Linus Torvalds     2005-04-16  122  
^1da177e4c3f41 Linus Torvalds     2005-04-16  123  	printk(KERN_NOTICE "Trying to move old root to /initrd ... ");
c60166f04283ff Christoph Hellwig  2020-07-21  124  	error = init_mount("/old", "/root/initrd", NULL, MS_MOVE, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  125  	if (!error)
^1da177e4c3f41 Linus Torvalds     2005-04-16  126  		printk("okay\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16  127  	else {
f220ab2a5162c3 Jay Lan            2005-06-30  128  		if (error == -ENOENT)
f220ab2a5162c3 Jay Lan            2005-06-30  129  			printk("/initrd does not exist. Ignored.\n");
f220ab2a5162c3 Jay Lan            2005-06-30  130  		else
^1da177e4c3f41 Linus Torvalds     2005-04-16  131  			printk("failed\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16  132  		printk(KERN_NOTICE "Unmounting old root\n");
09267defa36aaf Christoph Hellwig  2020-07-23  133  		init_umount("/old", MNT_DETACH);
^1da177e4c3f41 Linus Torvalds     2005-04-16  134  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  135  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
