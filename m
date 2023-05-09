Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32C20EF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 05:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683611104; x=1715147104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9emecGMWaWWjZjMLmmGL+L2JENPjCEJ6LhsRZdQS8Ts=;
  b=hnUP0No38ebaD/F8jod+4UUvQDlcCO5A7qrd5FrvLZXcKZ4kNcZCfetj
   rnoToZE8wOG2jjGg/mYCcmYamdneot7l7TbIxSlWe3JHwLvA3RJswgV6H
   jOBg1Y15i3Du5+BfR3J7XrMkCbXm6oupF1Wk9GBfYae37kzBZy2RjSXon
   PKcheinm1BB2r3R4hGxDZh7FHucSRM+PP7de8LzexvUVKZpdtNDT6+dNm
   9vUd6YHqYHmjC6gBKUSBHRnFeKzLjILBtC9SeQIWNLWUFoLicP3Ug/X6l
   gN74zZemM4UI6vyOT13OKyCBgDp2gmww4UDCmYsChfuGUwVQvJaILlRb0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349849786"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="349849786"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 22:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028680955"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="1028680955"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 22:45:02 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwG9m-0001nE-16;
	Tue, 09 May 2023 05:45:02 +0000
Date: Tue, 9 May 2023 13:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 482/1172]
 include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 6 has type 'blkcnt_t' {aka 'long long
 unsigned int'}
Message-ID: <202305091349.3XtdK7jv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 0f87f20d0536ae21524ce1c25335aec991229114 [482/1172] f2fs: fix to check i_compr_blocks correctly
config: i386-randconfig-a004-20230508 (https://download.01.org/0day-ci/archive/20230509/202305091349.3XtdK7jv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common upstream-f2fs-stable-linux-4.19.y
        git checkout 0f87f20d0536ae21524ce1c25335aec991229114
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091349.3XtdK7jv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/inode.c:14:
   fs/f2fs/f2fs.h: In function 'blkaddr_in_node':
   fs/f2fs/f2fs.h:2377:37: warning: taking address of packed member of 'struct f2fs_inode' may result in an unaligned pointer value [-Waddress-of-packed-member]
    2377 |         return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
         |                                     ^~~~
   fs/f2fs/f2fs.h:2377:54: warning: taking address of packed member of 'struct direct_node' may result in an unaligned pointer value [-Waddress-of-packed-member]
    2377 |         return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
         |                                                      ^~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'blkcnt_t' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:1949:26: note: in expansion of macro 'KERN_WARNING'
    1949 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~
   fs/f2fs/inode.c:303:25: note: in expansion of macro 'f2fs_warn'
     303 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
         |                         ^~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
