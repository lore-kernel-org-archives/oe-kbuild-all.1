Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C6023B8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 23:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685315299; x=1716851299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q43+LNwjepluEZglvp7BS1Z9t1kjrbQASOtugSxPFkA=;
  b=YkRhBD6Pm+mAKo05q7/8wAUkk5fGVPe4Fuz6Yky2Rt6BMDtWu4f01lNi
   1xYDlKx/toaAS3qoKvN/u0lqBUYWMtXb0rmK/USIZdgv506jye3IJ+b7W
   zc+3LrPXar8rMFbaowMhLyR+zUjAtxMOPOQ4TuXxwGEV7KdMlda3gcRO3
   xLrNiyElc1N0JFXcjaIPNMHz7lwYkUqJLhWYOZB6YEB5xCwlnY0V2pDmq
   fOL/ooH7NiaVchdfH0kQzUHgKk/hhZi26xtKQ7lfRjokfZZcd77+ifchm
   0zSn6HNaVxg1F8HRHuHw5LFqa5ui8WSj6FIyEzAeWMSc37iDvrVQQN5ug
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="334193641"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="334193641"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 16:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="705849794"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="705849794"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 May 2023 16:08:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3PUm-000KlW-1j;
	Sun, 28 May 2023 23:08:16 +0000
Date: Mon, 29 May 2023 07:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaobo Liu <cppcoffee@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 4204/6017] net/atm/mpoa_proc.c:226: Error:
 unrecognized opcode `csrs sstatus,a2'
Message-ID: <202305290652.NeGKB6BF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xiaobo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   3f57fb8b1bd06b277556601133823bec370d723f
commit: c5f762b60cd9ae7c766376a94d9c41f4ed613d9f [4204/6017] net/atm: fix proc_mpc_write incorrect return value
config: riscv-randconfig-c004-20230528 (https://download.01.org/0day-ci/archive/20230529/202305290652.NeGKB6BF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c5f762b60cd9ae7c766376a94d9c41f4ed613d9f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout c5f762b60cd9ae7c766376a94d9c41f4ed613d9f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/atm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305290652.NeGKB6BF-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/atm/mpoa_proc.c: Assembler messages:
>> net/atm/mpoa_proc.c:226: Error: unrecognized opcode `csrs sstatus,a2'
>> net/atm/mpoa_proc.c:226: Error: unrecognized opcode `csrc sstatus,a2'


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
https://github.com/intel/lkp-tests/wiki
