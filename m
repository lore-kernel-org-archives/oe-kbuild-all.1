Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEC18C05
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjDL71HG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698681105; x=1730217105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3uObsi7aG7L29zGTmcnW3VvUNtMSrLajlyajDf2on0Y=;
  b=SjDL71HGdndtHcfm86KJSeW2X9zU1Fkp7TSMfYfdzxXS4vU+GAiajAwe
   R04H7oPUsgG0NxhHOjm6QrvaNR9rIzyHDOyAkI23Cpdh3sD+j/i5ABnyX
   2l88iuL8a8vJFb8ykCPMEXmOyiW0cXKO/7B64iL6H4bwJYAe+SDcsQWQt
   drT0096M/zfLnCQMOGqm03l3tLZ45DynJ4AMrmCf4mEYJu/ZE+K09kDtc
   ZT3vTG1nEcPqWA8ORyQkEIgSecMhS/4O+ZLPmZFsojKBV6lcD3LViw1mT
   jZuDnat0RZVPMWQohgG0lW5Q/rEQxjO6OBVH7iTuDtPsa36bDY+mVO1wD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="367442827"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="367442827"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 08:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="760317695"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="760317695"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Oct 2023 08:51:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxUYE-000DND-2m;
	Mon, 30 Oct 2023 15:51:38 +0000
Date: Mon, 30 Oct 2023 23:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>
Subject: [linux-next:master 14380/16121] include/linux/stddef.h:8:16: error:
 expected identifier or '(' before 'void'
Message-ID: <202310302338.MpPQAr10-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c503e3eec382ac708ee7adf874add37b77c5d312
commit: dfaf653dc41557548b2e75e6cd837071f7c63289 [14380/16121] exportfs: make ->encode_fh() a mandatory method for NFS export
config: xtensa-randconfig-r015-20221109 (https://download.01.org/0day-ci/archive/20231030/202310302338.MpPQAr10-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310302338.MpPQAr10-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310302338.MpPQAr10-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/exportfs.h:5,
                    from fs/exportfs/expfs.c:12:
>> include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
       8 | #define NULL ((void *)0)
         |                ^~~~
   include/linux/exportfs.h:286:33: note: in expansion of macro 'NULL'
     286 | #define generic_encode_ino32_fh NULL
         |                                 ^~~~
   fs/exportfs/expfs.c:357:5: note: in expansion of macro 'generic_encode_ino32_fh'
     357 | int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:23: error: expected ')' before numeric constant
       8 | #define NULL ((void *)0)
         |                       ^
   include/linux/exportfs.h:286:33: note: in expansion of macro 'NULL'
     286 | #define generic_encode_ino32_fh NULL
         |                                 ^~~~
   fs/exportfs/expfs.c:357:5: note: in expansion of macro 'generic_encode_ino32_fh'
     357 | int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from fs/exportfs/expfs.c:13:
>> include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
       8 | #define NULL ((void *)0)
         |                ^~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   fs/exportfs/expfs.c:384:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         | ^~~~~~~~~~~~~~~~~
   include/linux/exportfs.h:286:33: note: in expansion of macro 'NULL'
     286 | #define generic_encode_ino32_fh NULL
         |                                 ^~~~
   fs/exportfs/expfs.c:384:19: note: in expansion of macro 'generic_encode_ino32_fh'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:23: error: expected ')' before numeric constant
       8 | #define NULL ((void *)0)
         |                       ^
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   fs/exportfs/expfs.c:384:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         | ^~~~~~~~~~~~~~~~~
   include/linux/exportfs.h:286:33: note: in expansion of macro 'NULL'
     286 | #define generic_encode_ino32_fh NULL
         |                                 ^~~~
   fs/exportfs/expfs.c:384:19: note: in expansion of macro 'generic_encode_ino32_fh'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/compiler.h:215:37: error: pasting "__addressable_" and "(" does not give a valid preprocessing token
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                     ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:215:29: note: in expansion of macro '__PASTE'
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                             ^~~~~~~
   include/linux/compiler.h:217:9: note: in expansion of macro '___ADDRESSABLE'
     217 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:75:9: note: in expansion of macro '__ADDRESSABLE'
      75 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:83:41: note: in expansion of macro '__EXPORT_SYMBOL'
      83 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   fs/exportfs/expfs.c:384:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:15: error: expected declaration specifiers or '...' before '(' token
       8 | #define NULL ((void *)0)
         |               ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:215:17: note: in expansion of macro '__UNIQUE_ID'
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                 ^~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:215:29: note: in expansion of macro '__PASTE'
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                             ^~~~~~~
   include/linux/compiler.h:217:9: note: in expansion of macro '___ADDRESSABLE'
     217 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:75:9: note: in expansion of macro '__ADDRESSABLE'
      75 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:83:41: note: in expansion of macro '__EXPORT_SYMBOL'
      83 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   fs/exportfs/expfs.c:384:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         | ^~~~~~~~~~~~~~~~~
   include/linux/exportfs.h:286:33: note: in expansion of macro 'NULL'
     286 | #define generic_encode_ino32_fh NULL
         |                                 ^~~~
   fs/exportfs/expfs.c:384:19: note: in expansion of macro 'generic_encode_ino32_fh'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:24: error: pasting ")" and "217" does not give a valid preprocessing token
       8 | #define NULL ((void *)0)
         |                        ^
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:215:17: note: in expansion of macro '__UNIQUE_ID'
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                 ^~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:215:29: note: in expansion of macro '__PASTE'
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                             ^~~~~~~
   include/linux/compiler.h:217:9: note: in expansion of macro '___ADDRESSABLE'
     217 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:75:9: note: in expansion of macro '__ADDRESSABLE'
      75 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:83:41: note: in expansion of macro '__EXPORT_SYMBOL'
      83 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   fs/exportfs/expfs.c:384:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         | ^~~~~~~~~~~~~~~~~
   include/linux/exportfs.h:286:33: note: in expansion of macro 'NULL'
     286 | #define generic_encode_ino32_fh NULL
         |                                 ^~~~
   fs/exportfs/expfs.c:384:19: note: in expansion of macro 'generic_encode_ino32_fh'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/export.h:47:9: error: pasting "__export_symbol_" and "(" does not give a valid preprocessing token
      47 |         __export_symbol_##sym:                  ASM_NL  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/export.h:76:25: note: in expansion of macro '___EXPORT_SYMBOL'
      76 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |                         ^~~~~~~~~~~~~~~~
   include/linux/export.h:83:41: note: in expansion of macro '__EXPORT_SYMBOL'
      83 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   fs/exportfs/expfs.c:384:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     384 | EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
         | ^~~~~~~~~~~~~~~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
