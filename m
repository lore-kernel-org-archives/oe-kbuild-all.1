Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22F07E8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 01:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690161235; x=1721697235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9w1L+gAR04vntuPPonSsxSA7KFOadsGl+MZc2ibuWkU=;
  b=mNjMpQ3QKbYLfmjRKxQOvlCstLl9ZA6BX8t4y4NMw4LP3Pw/kHuBtQeL
   TUy6BrreMIQoLvnUPpmwgYOiopcdn1RSMimFIvEKi66FqbECYdBfjmzQB
   l/c1UMsheAUiiaVadgiNqOcaNp57JGxUj4lRZqcWnc2KPKeVpb9dzwSme
   FB89lLGe5JSkSSN+pYMjZB96pjxgnTbUabtgeJFdgUvBQ+tHd0pcVSU7u
   IYfiAHg2DljX+P6OYZYfhibKNL5YVRglleAR5VARmqBfKZycDnr+3TAYT
   dBBuVOchAjH2PbW1lPASVG3m2+9OpfoDf7UCD5kcC1dp2fG1v60REuLNH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352219096"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="352219096"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 18:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="725521254"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="725521254"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Jul 2023 18:13:53 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNk92-0009NY-3D;
	Mon, 24 Jul 2023 01:13:53 +0000
Date: Mon, 24 Jul 2023 09:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaobo Liu <cppcoffee@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 4204/6356] net/atm/mpoa_proc.c:226: Error:
 unrecognized opcode `csrs sstatus,a6', extension `zicsr' required
Message-ID: <202307240951.CWW0o5Ft-lkp@intel.com>
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
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: c5f762b60cd9ae7c766376a94d9c41f4ed613d9f [4204/6356] net/atm: fix proc_mpc_write incorrect return value
config: riscv-randconfig-r024-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240951.CWW0o5Ft-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240951.CWW0o5Ft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240951.CWW0o5Ft-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/atm/mpoa_proc.c: Assembler messages:
>> net/atm/mpoa_proc.c:226: Error: unrecognized opcode `csrs sstatus,a6', extension `zicsr' required
>> net/atm/mpoa_proc.c:226: Error: unrecognized opcode `csrc sstatus,a6', extension `zicsr' required


vim +226 net/atm/mpoa_proc.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  208  
^1da177e4c3f415 Linus Torvalds 2005-04-16  209  static ssize_t proc_mpc_write(struct file *file, const char __user *buff,
^1da177e4c3f415 Linus Torvalds 2005-04-16  210  			      size_t nbytes, loff_t *ppos)
^1da177e4c3f415 Linus Torvalds 2005-04-16  211  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  212  	char *page, *p;
95c961747284a6b Eric Dumazet   2012-04-15  213  	unsigned int len;
^1da177e4c3f415 Linus Torvalds 2005-04-16  214  
^1da177e4c3f415 Linus Torvalds 2005-04-16  215  	if (nbytes == 0)
^1da177e4c3f415 Linus Torvalds 2005-04-16  216  		return 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  217  
^1da177e4c3f415 Linus Torvalds 2005-04-16  218  	if (nbytes >= PAGE_SIZE)
^1da177e4c3f415 Linus Torvalds 2005-04-16  219  		nbytes = PAGE_SIZE-1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  220  
^1da177e4c3f415 Linus Torvalds 2005-04-16  221  	page = (char *)__get_free_page(GFP_KERNEL);
^1da177e4c3f415 Linus Torvalds 2005-04-16  222  	if (!page)
^1da177e4c3f415 Linus Torvalds 2005-04-16  223  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds 2005-04-16  224  
c5f762b60cd9ae7 Xiaobo Liu     2022-10-14  225  	for (p = page, len = 0; len < nbytes; p++) {
^1da177e4c3f415 Linus Torvalds 2005-04-16 @226  		if (get_user(*p, buff++)) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  227  			free_page((unsigned long)page);
^1da177e4c3f415 Linus Torvalds 2005-04-16  228  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds 2005-04-16  229  		}
c5f762b60cd9ae7 Xiaobo Liu     2022-10-14  230  		len += 1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  231  		if (*p == '\0' || *p == '\n')
^1da177e4c3f415 Linus Torvalds 2005-04-16  232  			break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  233  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  234  
^1da177e4c3f415 Linus Torvalds 2005-04-16  235  	*p = '\0';
^1da177e4c3f415 Linus Torvalds 2005-04-16  236  
^1da177e4c3f415 Linus Torvalds 2005-04-16  237  	if (!parse_qos(page))
^1da177e4c3f415 Linus Torvalds 2005-04-16  238  		printk("mpoa: proc_mpc_write: could not parse '%s'\n", page);
^1da177e4c3f415 Linus Torvalds 2005-04-16  239  
^1da177e4c3f415 Linus Torvalds 2005-04-16  240  	free_page((unsigned long)page);
^1da177e4c3f415 Linus Torvalds 2005-04-16  241  
^1da177e4c3f415 Linus Torvalds 2005-04-16  242  	return len;
^1da177e4c3f415 Linus Torvalds 2005-04-16  243  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  244  

:::::: The code at line 226 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
