Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A2E408C0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 18:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686336346; x=1717872346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cMiaY0D1a5j5nkOScP3InPQD4nwvjmHAiCw2LTxkliw=;
  b=l1w8GGwB5OOP78dMFtayo4P8mv4sIoTDa3SMU4W9LGKFJLsmF7Rl5dco
   ZA6cD7e0zjSQZ1Yakx5qgix/7u+qCGk7i22GifGuA+t5TSZ9yVZHJD2+C
   c2Xwybst7J9GGQadlaP3wfeETvm1UB+NZKxdPbwwni4BOMLkg5WIa9Eaz
   xV7BYC08ZNPuncVXU1fcFvSO8GWDDche4sKIb6dJx63XMoT8zkUx62l3i
   bMBnyToNtXbXLDYpKcS1Q1iLRu58kCXiPkGEvFE0Ne9LkrGzo+O0dnNsv
   CTeYLqpl6v+fewBItqtbv3RWFakqXBHfK/1MUWPkR8/joAYIaHZq+JBqu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="347310760"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="347310760"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 11:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="687846450"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="687846450"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Jun 2023 11:45:41 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7h7E-0009J2-00;
	Fri, 09 Jun 2023 18:45:40 +0000
Date: Sat, 10 Jun 2023 02:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 4/29] drivers/char/mem.c:164:25: error:
 implicit declaration of function 'unxlate_dev_mem_ptr'; did you mean
 'xlate_dev_mem_ptr'?
Message-ID: <202306100214.RjlWlYDU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   5cad8323040bb8d47e130c10ea4dcb7175c7602a
commit: 99b619b37ae151dc0fcdffcae48b5a5ad90ebde8 [4/29] mips: provide unxlate_dev_mem_ptr() in asm/io.h
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230610/202306100214.RjlWlYDU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=99b619b37ae151dc0fcdffcae48b5a5ad90ebde8
        git remote add mips-linux https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
        git fetch --no-tags mips-linux mips-next
        git checkout 99b619b37ae151dc0fcdffcae48b5a5ad90ebde8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/char/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100214.RjlWlYDU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/mem.c: In function 'read_mem':
>> drivers/char/mem.c:164:25: error: implicit declaration of function 'unxlate_dev_mem_ptr'; did you mean 'xlate_dev_mem_ptr'? [-Werror=implicit-function-declaration]
     164 |                         unxlate_dev_mem_ptr(p, ptr);
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         xlate_dev_mem_ptr
   cc1: some warnings being treated as errors


vim +164 drivers/char/mem.c

^1da177e4c3f41 Linus Torvalds                2005-04-16  133  
22ec1a2aea73b9 Kees Cook                     2017-12-01  134  	bounce = kmalloc(PAGE_SIZE, GFP_KERNEL);
22ec1a2aea73b9 Kees Cook                     2017-12-01  135  	if (!bounce)
22ec1a2aea73b9 Kees Cook                     2017-12-01  136  		return -ENOMEM;
22ec1a2aea73b9 Kees Cook                     2017-12-01  137  
^1da177e4c3f41 Linus Torvalds                2005-04-16  138  	while (count > 0) {
fa29e97bb8c70f Wu Fengguang                  2009-12-14  139  		unsigned long remaining;
b5b38200ebe548 Kees Cook                     2018-03-27  140  		int allowed, probe;
fa29e97bb8c70f Wu Fengguang                  2009-12-14  141  
f222318e9c3a31 Wu Fengguang                  2009-12-14  142  		sz = size_inside_page(p, count);
^1da177e4c3f41 Linus Torvalds                2005-04-16  143  
22ec1a2aea73b9 Kees Cook                     2017-12-01  144  		err = -EPERM;
a4866aa812518e Kees Cook                     2017-04-05  145  		allowed = page_is_allowed(p >> PAGE_SHIFT);
a4866aa812518e Kees Cook                     2017-04-05  146  		if (!allowed)
22ec1a2aea73b9 Kees Cook                     2017-12-01  147  			goto failed;
22ec1a2aea73b9 Kees Cook                     2017-12-01  148  
22ec1a2aea73b9 Kees Cook                     2017-12-01  149  		err = -EFAULT;
a4866aa812518e Kees Cook                     2017-04-05  150  		if (allowed == 2) {
a4866aa812518e Kees Cook                     2017-04-05  151  			/* Show zeros for restricted memory. */
a4866aa812518e Kees Cook                     2017-04-05  152  			remaining = clear_user(buf, sz);
a4866aa812518e Kees Cook                     2017-04-05  153  		} else {
^1da177e4c3f41 Linus Torvalds                2005-04-16  154  			/*
a4866aa812518e Kees Cook                     2017-04-05  155  			 * On ia64 if a page has been mapped somewhere as
a4866aa812518e Kees Cook                     2017-04-05  156  			 * uncached, then it must also be accessed uncached
a4866aa812518e Kees Cook                     2017-04-05  157  			 * by the kernel or data corruption may occur.
^1da177e4c3f41 Linus Torvalds                2005-04-16  158  			 */
^1da177e4c3f41 Linus Torvalds                2005-04-16  159  			ptr = xlate_dev_mem_ptr(p);
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  160  			if (!ptr)
22ec1a2aea73b9 Kees Cook                     2017-12-01  161  				goto failed;
a4866aa812518e Kees Cook                     2017-04-05  162  
fe557319aa06c2 Christoph Hellwig             2020-06-17  163  			probe = copy_from_kernel_nofault(bounce, ptr, sz);
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18 @164  			unxlate_dev_mem_ptr(p, ptr);
b5b38200ebe548 Kees Cook                     2018-03-27  165  			if (probe)
22ec1a2aea73b9 Kees Cook                     2017-12-01  166  				goto failed;
22ec1a2aea73b9 Kees Cook                     2017-12-01  167  
22ec1a2aea73b9 Kees Cook                     2017-12-01  168  			remaining = copy_to_user(buf, bounce, sz);
a4866aa812518e Kees Cook                     2017-04-05  169  		}
a4866aa812518e Kees Cook                     2017-04-05  170  
fa29e97bb8c70f Wu Fengguang                  2009-12-14  171  		if (remaining)
22ec1a2aea73b9 Kees Cook                     2017-12-01  172  			goto failed;
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  173  
^1da177e4c3f41 Linus Torvalds                2005-04-16  174  		buf += sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  175  		p += sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  176  		count -= sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  177  		read += sz;
8619e5bdeee8b2 Tetsuo Handa                  2019-08-26  178  		if (should_stop_iteration())
8619e5bdeee8b2 Tetsuo Handa                  2019-08-26  179  			break;
^1da177e4c3f41 Linus Torvalds                2005-04-16  180  	}
22ec1a2aea73b9 Kees Cook                     2017-12-01  181  	kfree(bounce);
^1da177e4c3f41 Linus Torvalds                2005-04-16  182  
^1da177e4c3f41 Linus Torvalds                2005-04-16  183  	*ppos += read;
^1da177e4c3f41 Linus Torvalds                2005-04-16  184  	return read;
22ec1a2aea73b9 Kees Cook                     2017-12-01  185  
22ec1a2aea73b9 Kees Cook                     2017-12-01  186  failed:
22ec1a2aea73b9 Kees Cook                     2017-12-01  187  	kfree(bounce);
22ec1a2aea73b9 Kees Cook                     2017-12-01  188  	return err;
^1da177e4c3f41 Linus Torvalds                2005-04-16  189  }
^1da177e4c3f41 Linus Torvalds                2005-04-16  190  

:::::: The code at line 164 was first introduced by commit
:::::: e045fb2a988a9a1964059b0d33dbaf18d12f925f x86: PAT avoid aliasing in /dev/mem read/write

:::::: TO: venkatesh.pallipadi@intel.com <venkatesh.pallipadi@intel.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
