Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A524198
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 04:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687494840; x=1719030840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X5nR8yipkQutqAeLpnE9yrcPLFp/CUYBOGShQfJxJrM=;
  b=DMeWNbAxDhu+eSUS6aihAh/2pRtdSpXI2tQ5Ja1s0L7XAelfvJgf9JFg
   c28Mo450AeoZ7EZ0GodVqOwajJUrBE85VlUD+9MekL7uDqT8ouVakWEZc
   YEFNz9kavMZ5wj7od/ezZWlA2oPPCHKBRIFfXC4eFSIeMYpyrstp+gFxu
   Z8NWpq89nVSK3vG+AdiwD0HYyEGLjnFYTHz9P6xIxr7d6+3+TGeXJUdH0
   eQKfrDk19T1583JdApueFOnngE8ga3zV1uOkcmuk1TzLsI4QzwagpmDil
   oe5M/xTCnM82a5+AgXi1WbA991gOfWUbN+++MnS5h2RqUGvJyxw81d37R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340280678"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="340280678"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 21:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="692538945"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="692538945"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Jun 2023 21:33:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCYUf-0007zO-0o;
	Fri, 23 Jun 2023 04:33:57 +0000
Date: Fri, 23 Jun 2023 12:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime.2 17/30] include/linux/fortify-string.h:452:65:
 warning: left-hand operand of comma expression has no effect
Message-ID: <202306231247.OdHLgv93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime.2
head:   5b9567fb85f565a8040b60442ba1ab492f90f555
commit: 67217f6c6c4f65612918ab1ceb0b4fa127a1b454 [17/30] JUMBO
config: i386-randconfig-r025-20230622 (https://download.01.org/0day-ci/archive/20230623/202306231247.OdHLgv93-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231247.OdHLgv93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231247.OdHLgv93-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/nfs/inode.c:17:
   fs/nfs/inode.c: In function 'nfs_fhget':
   fs/nfs/inode.c:517:24: error: lvalue required as unary '&' operand
     517 |                 memset(&inode_get_ctime(inode), 0,
         |                        ^
   include/linux/fortify-string.h:452:44: note: in definition of macro '__fortify_memset_chk'
     452 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                            ^~~~~~
   include/linux/fortify-string.h:462:17: note: in expansion of macro '__struct_size'
     462 |                 __struct_size(p), __member_size(p))
         |                 ^~~~~~~~~~~~~
   fs/nfs/inode.c:517:17: note: in expansion of macro 'memset'
     517 |                 memset(&inode_get_ctime(inode), 0,
         |                 ^~~~~~
   fs/nfs/inode.c:517:24: error: lvalue required as unary '&' operand
     517 |                 memset(&inode_get_ctime(inode), 0,
         |                        ^
   include/linux/fortify-string.h:452:52: note: in definition of macro '__fortify_memset_chk'
     452 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                    ^~~~~~~~~~~~
   include/linux/fortify-string.h:462:35: note: in expansion of macro '__member_size'
     462 |                 __struct_size(p), __member_size(p))
         |                                   ^~~~~~~~~~~~~
   fs/nfs/inode.c:517:17: note: in expansion of macro 'memset'
     517 |                 memset(&inode_get_ctime(inode), 0,
         |                 ^~~~~~
   fs/nfs/inode.c:517:24: error: lvalue required as unary '&' operand
     517 |                 memset(&inode_get_ctime(inode), 0,
         |                        ^
   include/linux/fortify-string.h:453:29: note: in definition of macro '__fortify_memset_chk'
     453 |         __underlying_memset(p, c, __fortify_size);                      \
         |                             ^
   fs/nfs/inode.c:517:17: note: in expansion of macro 'memset'
     517 |                 memset(&inode_get_ctime(inode), 0,
         |                 ^~~~~~
>> include/linux/fortify-string.h:452:65: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     452 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                                 ^
   include/linux/fortify-string.h:461:25: note: in expansion of macro '__fortify_memset_chk'
     461 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   fs/nfs/inode.c:517:17: note: in expansion of macro 'memset'
     517 |                 memset(&inode_get_ctime(inode), 0,
         |                 ^~~~~~
   fs/nfs/inode.c:539:48: error: lvalue required as left operand of assignment
     539 |                         inode_get_ctime(inode) = fattr->ctime;
         |                                                ^
   fs/nfs/inode.c: In function 'nfs_setattr_update_inode':
   fs/nfs/inode.c:735:48: error: lvalue required as left operand of assignment
     735 |                         inode_get_ctime(inode) = fattr->ctime;
         |                                                ^
   fs/nfs/inode.c:754:48: error: lvalue required as left operand of assignment
     754 |                         inode_get_ctime(inode) = fattr->ctime;
         |                                                ^
   fs/nfs/inode.c:771:48: error: lvalue required as left operand of assignment
     771 |                         inode_get_ctime(inode) = fattr->ctime;
         |                                                ^
   fs/nfs/inode.c: In function 'nfs_wcc_update_inode':
   fs/nfs/inode.c:1455:40: error: lvalue required as left operand of assignment
    1455 |                 inode_get_ctime(inode) = fattr->ctime;
         |                                        ^
   fs/nfs/inode.c: In function 'nfs_update_inode':
   fs/nfs/inode.c:2197:40: error: lvalue required as left operand of assignment
    2197 |                 inode_get_ctime(inode) = fattr->ctime;
         |                                        ^


vim +452 include/linux/fortify-string.h

28e77cc1c06866 Kees Cook 2021-06-16  449  
28e77cc1c06866 Kees Cook 2021-06-16  450  #define __fortify_memset_chk(p, c, size, p_size, p_size_field) ({	\
28e77cc1c06866 Kees Cook 2021-06-16  451  	size_t __fortify_size = (size_t)(size);				\
28e77cc1c06866 Kees Cook 2021-06-16 @452  	fortify_memset_chk(__fortify_size, p_size, p_size_field),	\
28e77cc1c06866 Kees Cook 2021-06-16  453  	__underlying_memset(p, c, __fortify_size);			\
28e77cc1c06866 Kees Cook 2021-06-16  454  })
28e77cc1c06866 Kees Cook 2021-06-16  455  

:::::: The code at line 452 was first introduced by commit
:::::: 28e77cc1c0686621a4d416f599cee5ab369daa0a fortify: Detect struct member overflows in memset() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
