Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E6A7E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680601754; x=1712137754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ve1yYpjHeIm0Q4rI2QRTslKtVoI8wRvSt0UPKwnTt58=;
  b=K0K2HNVXO49vQp/hD+xt3WbgHVVl76gqT7Q4Mdzp7vMMbnR1YI0HUdnP
   C7TTgFrxnaXPqnEXFTJIVYJ/uPBNm5bLVpurDEq2PhEnw7p1KFOyjpOhB
   jPSxncglyNsODxGeBEEdidlnRNPg1nUR31ga88qhzAv9BDLPSNyEBsvZG
   r1plTPjXPbPgByVtY8hR1L6mM1F63E7En9IVmcYDNg0XkjnXoaAQyB0DV
   psrm0dDxbAH5fCxfLAXUobV72h4En2B/8wKLnzj5qV/VGbZyaGxTn2Lr1
   qbmUX9EY01P+p07dw9JTrednMiFLkuYHwdChCHmtEv1AGppNuguB1SLT+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428423532"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="428423532"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 02:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="1016063026"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="1016063026"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2023 02:49:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjdHq-000PVS-2e;
	Tue, 04 Apr 2023 09:49:10 +0000
Date: Tue, 4 Apr 2023 17:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Filipe Manana <fdmanana@suse.com>, David Sterba <dsterba@suse.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 2978/9999] include/linux/pagemap.h:576: Error:
 unrecognized opcode `csrs sstatus,s1'
Message-ID: <202304041731.34iVE75Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   30baa0923a27fb9a04444a29562344e0573992e4
commit: 7c9bf5c3ed15fd6ad777663c636a6f4a5d9edf2c [2978/9999] btrfs: fix potential deadlock in the search ioctl
config: riscv-randconfig-r035-20230402 (https://download.01.org/0day-ci/archive/20230404/202304041731.34iVE75Z-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=7c9bf5c3ed15fd6ad777663c636a6f4a5d9edf2c
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 7c9bf5c3ed15fd6ad777663c636a6f4a5d9edf2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041731.34iVE75Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/pagemap.h: Assembler messages:
>> include/linux/pagemap.h:576: Error: unrecognized opcode `csrs sstatus,s1'
>> include/linux/pagemap.h:576: Error: unrecognized opcode `csrc sstatus,s1'
   include/linux/pagemap.h:584: Error: unrecognized opcode `csrs sstatus,s1'
   include/linux/pagemap.h:584: Error: unrecognized opcode `csrc sstatus,s1'
   fs/btrfs/ioctl.c:482: Error: unrecognized opcode `csrs sstatus,a4'
   fs/btrfs/ioctl.c:482: Error: unrecognized opcode `csrc sstatus,a4'


vim +576 include/linux/pagemap.h

385e1ca5f21c46 David Howells  2009-04-03  558  
^1da177e4c3f41 Linus Torvalds 2005-04-16  559  /*
4bce9f6ee8f84f Al Viro        2016-09-17  560   * Fault everything in given userspace address range in.
^1da177e4c3f41 Linus Torvalds 2005-04-16  561   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  562  static inline int fault_in_pages_writeable(char __user *uaddr, int size)
f56f821feb7b36 Daniel Vetter  2012-03-25  563  {
9923777dff4543 Daniel Vetter  2012-04-14  564  	char __user *end = uaddr + size - 1;
f56f821feb7b36 Daniel Vetter  2012-03-25  565  
f56f821feb7b36 Daniel Vetter  2012-03-25  566  	if (unlikely(size == 0))
e23d4159b10916 Al Viro        2016-09-20  567  		return 0;
f56f821feb7b36 Daniel Vetter  2012-03-25  568  
e23d4159b10916 Al Viro        2016-09-20  569  	if (unlikely(uaddr > end))
e23d4159b10916 Al Viro        2016-09-20  570  		return -EFAULT;
f56f821feb7b36 Daniel Vetter  2012-03-25  571  	/*
f56f821feb7b36 Daniel Vetter  2012-03-25  572  	 * Writing zeroes into userspace here is OK, because we know that if
f56f821feb7b36 Daniel Vetter  2012-03-25  573  	 * the zero gets there, we'll be overwriting it.
f56f821feb7b36 Daniel Vetter  2012-03-25  574  	 */
e23d4159b10916 Al Viro        2016-09-20  575  	do {
e23d4159b10916 Al Viro        2016-09-20 @576  		if (unlikely(__put_user(0, uaddr) != 0))
e23d4159b10916 Al Viro        2016-09-20  577  			return -EFAULT;
f56f821feb7b36 Daniel Vetter  2012-03-25  578  		uaddr += PAGE_SIZE;
e23d4159b10916 Al Viro        2016-09-20  579  	} while (uaddr <= end);
f56f821feb7b36 Daniel Vetter  2012-03-25  580  
f56f821feb7b36 Daniel Vetter  2012-03-25  581  	/* Check whether the range spilled into the next page. */
f56f821feb7b36 Daniel Vetter  2012-03-25  582  	if (((unsigned long)uaddr & PAGE_MASK) ==
f56f821feb7b36 Daniel Vetter  2012-03-25  583  			((unsigned long)end & PAGE_MASK))
e23d4159b10916 Al Viro        2016-09-20  584  		return __put_user(0, end);
f56f821feb7b36 Daniel Vetter  2012-03-25  585  
e23d4159b10916 Al Viro        2016-09-20  586  	return 0;
f56f821feb7b36 Daniel Vetter  2012-03-25  587  }
f56f821feb7b36 Daniel Vetter  2012-03-25  588  

:::::: The code at line 576 was first introduced by commit
:::::: e23d4159b109167126e5bcd7f3775c95de7fee47 fix fault_in_multipages_...() on architectures with no-op access_ok()

:::::: TO: Al Viro <viro@ZenIV.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
