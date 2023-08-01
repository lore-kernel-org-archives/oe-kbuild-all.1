Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FDA23589
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690913631; x=1722449631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MIw+UOnnQkdnae+jtdPAYxChDgpKlrvJWRQEXJHf4qA=;
  b=MciBhl5v35qxA2xDKauqU+gXHwSb094yoSyk5CoT1AW845Xx+AS6rw+m
   0sBvjQhpPKwZcWdjM3FDJ0FOSUb6vCEF601PrgPpTi2M6eJL42oFyDIbA
   5x0c99Eeo8bYNp3CzAZ+N/OTj19/tjBl6mE5tC77pC97EMphJ/PILYq2h
   HaQKzacx1aUjivu2EAcmwQdwqnOXEfepGjdyl6BmCiyzxeR0/NBx2r+th
   ekvBwGEPXxg2tC+WCDlbCQ6XjzL3u5T7+WQP/MPIWbVQC5jWkUrp5KcOj
   3FAd+iaUbmKXwSCNWft9EG0Y6I58JGJsOch0mL34jpNO9+YsDGKQ6BXz0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="348982210"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="348982210"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="722568064"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="722568064"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 11:13:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQtsH-0000Vr-15;
	Tue, 01 Aug 2023 18:13:37 +0000
Date: Wed, 2 Aug 2023 02:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Filipe Manana <fdmanana@suse.com>, David Sterba <dsterba@suse.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 2978/9999] include/linux/pagemap.h:576: Error:
 unrecognized opcode `csrs sstatus,s9', extension `zicsr' required
Message-ID: <202308020240.DlqzZ1M3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   767049cead76cf699707290d5aeefb3e4d0d5b43
commit: 7c9bf5c3ed15fd6ad777663c636a6f4a5d9edf2c [2978/9999] btrfs: fix potential deadlock in the search ioctl
config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020240.DlqzZ1M3-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020240.DlqzZ1M3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020240.DlqzZ1M3-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/pagemap.h: Assembler messages:
>> include/linux/pagemap.h:576: Error: unrecognized opcode `csrs sstatus,s9', extension `zicsr' required
>> include/linux/pagemap.h:576: Error: unrecognized opcode `csrc sstatus,s9', extension `zicsr' required
   include/linux/pagemap.h:584: Error: unrecognized opcode `csrs sstatus,s9', extension `zicsr' required
   include/linux/pagemap.h:584: Error: unrecognized opcode `csrc sstatus,s9', extension `zicsr' required
   fs/btrfs/ioctl.c:482: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   fs/btrfs/ioctl.c:482: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +576 include/linux/pagemap.h

385e1ca5f21c468 David Howells  2009-04-03  558  
^1da177e4c3f415 Linus Torvalds 2005-04-16  559  /*
4bce9f6ee8f84fd Al Viro        2016-09-17  560   * Fault everything in given userspace address range in.
^1da177e4c3f415 Linus Torvalds 2005-04-16  561   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  562  static inline int fault_in_pages_writeable(char __user *uaddr, int size)
f56f821feb7b362 Daniel Vetter  2012-03-25  563  {
9923777dff45430 Daniel Vetter  2012-04-14  564  	char __user *end = uaddr + size - 1;
f56f821feb7b362 Daniel Vetter  2012-03-25  565  
f56f821feb7b362 Daniel Vetter  2012-03-25  566  	if (unlikely(size == 0))
e23d4159b109167 Al Viro        2016-09-20  567  		return 0;
f56f821feb7b362 Daniel Vetter  2012-03-25  568  
e23d4159b109167 Al Viro        2016-09-20  569  	if (unlikely(uaddr > end))
e23d4159b109167 Al Viro        2016-09-20  570  		return -EFAULT;
f56f821feb7b362 Daniel Vetter  2012-03-25  571  	/*
f56f821feb7b362 Daniel Vetter  2012-03-25  572  	 * Writing zeroes into userspace here is OK, because we know that if
f56f821feb7b362 Daniel Vetter  2012-03-25  573  	 * the zero gets there, we'll be overwriting it.
f56f821feb7b362 Daniel Vetter  2012-03-25  574  	 */
e23d4159b109167 Al Viro        2016-09-20  575  	do {
e23d4159b109167 Al Viro        2016-09-20 @576  		if (unlikely(__put_user(0, uaddr) != 0))
e23d4159b109167 Al Viro        2016-09-20  577  			return -EFAULT;
f56f821feb7b362 Daniel Vetter  2012-03-25  578  		uaddr += PAGE_SIZE;
e23d4159b109167 Al Viro        2016-09-20  579  	} while (uaddr <= end);
f56f821feb7b362 Daniel Vetter  2012-03-25  580  
f56f821feb7b362 Daniel Vetter  2012-03-25  581  	/* Check whether the range spilled into the next page. */
f56f821feb7b362 Daniel Vetter  2012-03-25  582  	if (((unsigned long)uaddr & PAGE_MASK) ==
f56f821feb7b362 Daniel Vetter  2012-03-25  583  			((unsigned long)end & PAGE_MASK))
e23d4159b109167 Al Viro        2016-09-20  584  		return __put_user(0, end);
f56f821feb7b362 Daniel Vetter  2012-03-25  585  
e23d4159b109167 Al Viro        2016-09-20  586  	return 0;
f56f821feb7b362 Daniel Vetter  2012-03-25  587  }
f56f821feb7b362 Daniel Vetter  2012-03-25  588  

:::::: The code at line 576 was first introduced by commit
:::::: e23d4159b109167126e5bcd7f3775c95de7fee47 fix fault_in_multipages_...() on architectures with no-op access_ok()

:::::: TO: Al Viro <viro@ZenIV.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
