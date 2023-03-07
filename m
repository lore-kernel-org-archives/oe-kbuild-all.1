Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BD366
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 05:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678166093; x=1709702093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5tHHzSNEoN1VmPUjVeJE/RldxYhRjF7anv7B3OQUn+s=;
  b=LEVZg2BiJJ5dcvRLN5cTpPQ+iV1dTBe40INn5q2pbDjAYdE+bv8Q/yf1
   wNcNDBD655DvxxfOf4/DPHQGMVwhQ5GCpOnToJJU2v2E+4nr7+J0inUvl
   knpuQprAytNCuaR0HXSANpOSiB5f9mGXzpQWEaPeO1uJ5+BU77YfhuPE/
   PeU3X9thfIK6yqyIVgygB9/TUVGjZh3snqf7om7uVjkv9vNMLMLIVhBRj
   /1GIv4f1eY8k5go6ELoDNn24HMVrqGDMsJtahgYtRcFiPYS4d3tS70aIK
   RdBj+tLrLPJ+OZwPRXS17cXdI46Ai9o1U1uiMuNgzK6RLIWGwUdo+duZY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338087733"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="338087733"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 21:14:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745319369"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="745319369"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 21:14:51 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZPf0-0000yp-2L;
	Tue, 07 Mar 2023 05:14:50 +0000
Date: Tue, 7 Mar 2023 13:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:viro/vfs/work.minix 3/4] fs/sysv/dir.c:32:
 multiple definition of `dir_put_page'; fs/minix/dir.o:fs/minix/dir.c:30:
 first defined here
Message-ID: <202303071352.h8Mj6c0x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block viro/vfs/work.minix
head:   39d0d7f9b65f1fe91c5ba6d375f1ddb0c34fe843
commit: b7176563af9725b556c512d0fee2dbd051839147 [3/4] minixfs: Use dir_put_page() in minix_unlink() and minix_rename()
config: i386-randconfig-a005-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071352.h8Mj6c0x-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/b7176563af9725b556c512d0fee2dbd051839147
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block viro/vfs/work.minix
        git checkout b7176563af9725b556c512d0fee2dbd051839147
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071352.h8Mj6c0x-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/sysv/dir.o: in function `dir_put_page':
>> fs/sysv/dir.c:32: multiple definition of `dir_put_page'; fs/minix/dir.o:fs/minix/dir.c:30: first defined here


vim +32 fs/sysv/dir.c

^1da177e4c3f415 Linus Torvalds        2005-04-16  30  
83005276d383387 Fabio M. De Francesco 2023-01-19  31  inline void dir_put_page(struct page *page, void *page_addr)
^1da177e4c3f415 Linus Torvalds        2005-04-16 @32  {
83005276d383387 Fabio M. De Francesco 2023-01-19  33  	kunmap_local((void *)((unsigned long)page_addr & PAGE_MASK));
09cbfeaf1a5a67b Kirill A. Shutemov    2016-04-01  34  	put_page(page);
^1da177e4c3f415 Linus Torvalds        2005-04-16  35  }
^1da177e4c3f415 Linus Torvalds        2005-04-16  36  

:::::: The code at line 32 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
