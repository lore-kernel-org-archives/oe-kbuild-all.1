Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A37A41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 05:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683869079; x=1715405079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hYSxkhxE8GBqsnaVjg5JQgUFnBh8FVsRqtmsaihRPRI=;
  b=lEbF/EEWwEEiJv7qfrP4Z3hQVeSw0n5iZARbWvuW80QGUJh9PRT7rCZP
   /sEJIeVsEnSvdUpMIrVDn9beaL0BRSg9Bzsjsy8v8C+pUbs74QO3npxmj
   I5VSzhYje/QZ18hgHXb6e/1UkcUB8u8fUauroQrK06x70FaHb2si6BPJH
   H04+0kQooc2InGCwL+gSSBom+uvMxgDSlEQvELHipl68I1hKmTzVz/OaV
   1bTn3zi4IXtJdl8rQ5JSdfJoUt6HI+qMpTLnKHIXl/WSzoOs15pU7sKXR
   ZTLf7pa0J4DE1PwaQZ/hz6rv9/1s8r0FO+x8qRQBgOFOa1/m/SN/QV7ge
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="352952494"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="352952494"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 22:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1029922598"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="1029922598"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 May 2023 22:24:37 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxLGf-0004YK-0t;
	Fri, 12 May 2023 05:24:37 +0000
Date: Fri, 12 May 2023 13:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaobo Liu <cppcoffee@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 4204/5827] net/atm/mpoa_proc.c:226: Error:
 unrecognized opcode `csrs sstatus,s7'
Message-ID: <202305121214.ve2veEUK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: c5f762b60cd9ae7c766376a94d9c41f4ed613d9f [4204/5827] net/atm: fix proc_mpc_write incorrect return value
config: riscv-buildonly-randconfig-r006-20230511 (https://download.01.org/0day-ci/archive/20230512/202305121214.ve2veEUK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c5f762b60cd9ae7c766376a94d9c41f4ed613d9f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout c5f762b60cd9ae7c766376a94d9c41f4ed613d9f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/atm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121214.ve2veEUK-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/atm/mpoa_proc.c: Assembler messages:
>> net/atm/mpoa_proc.c:226: Error: unrecognized opcode `csrs sstatus,s7'
>> net/atm/mpoa_proc.c:226: Error: unrecognized opcode `csrc sstatus,s7'


vim +226 net/atm/mpoa_proc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  208  
^1da177e4c3f41 Linus Torvalds 2005-04-16  209  static ssize_t proc_mpc_write(struct file *file, const char __user *buff,
^1da177e4c3f41 Linus Torvalds 2005-04-16  210  			      size_t nbytes, loff_t *ppos)
^1da177e4c3f41 Linus Torvalds 2005-04-16  211  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  212  	char *page, *p;
95c961747284a6 Eric Dumazet   2012-04-15  213  	unsigned int len;
^1da177e4c3f41 Linus Torvalds 2005-04-16  214  
^1da177e4c3f41 Linus Torvalds 2005-04-16  215  	if (nbytes == 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  216  		return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  217  
^1da177e4c3f41 Linus Torvalds 2005-04-16  218  	if (nbytes >= PAGE_SIZE)
^1da177e4c3f41 Linus Torvalds 2005-04-16  219  		nbytes = PAGE_SIZE-1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  220  
^1da177e4c3f41 Linus Torvalds 2005-04-16  221  	page = (char *)__get_free_page(GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds 2005-04-16  222  	if (!page)
^1da177e4c3f41 Linus Torvalds 2005-04-16  223  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  224  
c5f762b60cd9ae Xiaobo Liu     2022-10-14  225  	for (p = page, len = 0; len < nbytes; p++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @226  		if (get_user(*p, buff++)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  227  			free_page((unsigned long)page);
^1da177e4c3f41 Linus Torvalds 2005-04-16  228  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  229  		}
c5f762b60cd9ae Xiaobo Liu     2022-10-14  230  		len += 1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  231  		if (*p == '\0' || *p == '\n')
^1da177e4c3f41 Linus Torvalds 2005-04-16  232  			break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  233  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  234  
^1da177e4c3f41 Linus Torvalds 2005-04-16  235  	*p = '\0';
^1da177e4c3f41 Linus Torvalds 2005-04-16  236  
^1da177e4c3f41 Linus Torvalds 2005-04-16  237  	if (!parse_qos(page))
^1da177e4c3f41 Linus Torvalds 2005-04-16  238  		printk("mpoa: proc_mpc_write: could not parse '%s'\n", page);
^1da177e4c3f41 Linus Torvalds 2005-04-16  239  
^1da177e4c3f41 Linus Torvalds 2005-04-16  240  	free_page((unsigned long)page);
^1da177e4c3f41 Linus Torvalds 2005-04-16  241  
^1da177e4c3f41 Linus Torvalds 2005-04-16  242  	return len;
^1da177e4c3f41 Linus Torvalds 2005-04-16  243  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  244  

:::::: The code at line 226 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
