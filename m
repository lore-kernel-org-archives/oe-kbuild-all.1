Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0454BA31
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 23:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676330742; x=1707866742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBITXMgY5jkQj/AgXMLv8VV7nSVD3VLvCdV7LTT9dME=;
  b=kTWqJX6avCz76o5a/g7rJQQweJYOqDwSwVI9tM+QD3+oKkJDJTHszP+S
   8ileZDGNCbANm/CqxMM39EkXNX0Yk0ZV4zNMnIZss7CsSak/FNdUzDLRn
   ntTj+E9AF05iJnP8+yxOP1Nd+iirILrX37DhO2Wm2hoMi5JKOm+5jn1G2
   g7n13u4j1nPRDkmr6OeDJwL4ZiEGm/0CWQ9ttO0J0e20vnHBRxC0dNnUo
   ua4WERAK+rmDarE2EcL/rV69O7XAGjTa1C5P4lPrh/u4+9bSJqpi7fv0c
   pN6a6+Ym52xTSYz+QK4f4p9lvNS24CN6ANDNy910dMZVKVAASJBnvx+nD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393426039"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="393426039"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 15:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997862193"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="997862193"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2023 15:25:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRiCX-00083p-32;
	Mon, 13 Feb 2023 23:25:37 +0000
Date: Tue, 14 Feb 2023 07:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Subject: [stable:linux-4.19.y 3835/9999] include/linux/pagemap.h:576: Error:
 unrecognized opcode `csrs sstatus,s4'
Message-ID: <202302140706.HJDNA8li-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   53b696f0584acce2e90db69272a2a11aab138370
commit: 91567128a9cbe55a4c133b900d73e6f56fef8f59 [3835/9999] btrfs: fix wrong address when faulting in pages in the search ioctl
config: riscv-randconfig-c44-20230212 (https://download.01.org/0day-ci/archive/20230214/202302140706.HJDNA8li-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=91567128a9cbe55a4c133b900d73e6f56fef8f59
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 91567128a9cbe55a4c133b900d73e6f56fef8f59
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140706.HJDNA8li-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/pagemap.h: Assembler messages:
>> include/linux/pagemap.h:576: Error: unrecognized opcode `csrs sstatus,s4'
>> include/linux/pagemap.h:576: Error: unrecognized opcode `csrc sstatus,s4'
   include/linux/pagemap.h:584: Error: unrecognized opcode `csrs sstatus,s4'
   include/linux/pagemap.h:584: Error: unrecognized opcode `csrc sstatus,s4'
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
