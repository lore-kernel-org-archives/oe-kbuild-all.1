Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE401BDE2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwz6kCU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697217181; x=1728753181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oM/b9gG45M8snFBQUrMNnV1W55sjV3CxBtG6ScnzP+w=;
  b=cwz6kCU3MymelvfRBjVU+5qH2fKR+PtcfDrll7nPJdJHLWdYAuJXPTj5
   nNGWqnmiG3iLWtb2bEVO5uxQcpbBpBaX4GBtY8in8m6jMslW5Y2fdbxU/
   St1aaZmCj0aNKPUcn+7ZPRsm4GImPVyvYwlcNAhPxocz3qnvBiN758P58
   oCHkQM8Y6Cb4OYkNnjT+1jRqs15BjbuIAX8FuySU7RximZF5ReOhceL28
   nEIKAW+smSe+9gI2uDMK/CduFe9jKhkt/FNALz2g8Zr2PS14OUhQUIdy4
   X+jiz/laXZ7/jF8/+pY12QSsJbp3eGNHG5bSrAqlK9+CY4kcVysmxMhsa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416274186"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="416274186"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 10:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086217698"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="1086217698"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 10:12:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrLiZ-0005BJ-0O;
	Fri, 13 Oct 2023 17:12:55 +0000
Date: Sat, 14 Oct 2023 01:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 19/29] fs/internal.h:36:17: error: unknown
 type name 'get_block_t'
Message-ID: <202310140114.m20tQ2eq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   af314f8dfffbe0852967cf253beb94878c5d4846
commit: 3cfa566dee03bea57e9fe2b763833c61d2ca96ef [19/29] fs: prepare for stackable filesystems backing file helpers
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231014/202310140114.m20tQ2eq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140114.m20tQ2eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140114.m20tQ2eq-lkp@intel.com/

Note: the amir73il/fuse-backing-fd HEAD af314f8dfffbe0852967cf253beb94878c5d4846 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from fs/backing-file.c:8:
>> include/linux/backing-file.h:15:45: warning: 'struct cred' declared inside parameter list will not be visible outside of this definition or declaration
      15 |                                const struct cred *cred);
         |                                             ^~~~
   In file included from fs/backing-file.c:10:
>> fs/internal.h:36:17: error: unknown type name 'get_block_t'
      36 |                 get_block_t *get_block, const struct iomap *iomap);
         |                 ^~~~~~~~~~~
>> fs/internal.h:41:20: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'chrdev_init'
      41 | extern void __init chrdev_init(void);
         |                    ^~~~~~~~~~~
>> fs/internal.h:54:44: warning: 'struct filename' declared inside parameter list will not be visible outside of this definition or declaration
      54 | extern int filename_lookup(int dfd, struct filename *name, unsigned flags,
         |                                            ^~~~~~~~
   fs/internal.h:56:30: warning: 'struct filename' declared inside parameter list will not be visible outside of this definition or declaration
      56 | int do_rmdir(int dfd, struct filename *name);
         |                              ^~~~~~~~
   fs/internal.h:57:33: warning: 'struct filename' declared inside parameter list will not be visible outside of this definition or declaration
      57 | int do_unlinkat(int dfd, struct filename *name);
         |                                 ^~~~~~~~
   fs/internal.h:59:37: warning: 'struct filename' declared inside parameter list will not be visible outside of this definition or declaration
      59 | int do_renameat2(int olddfd, struct filename *oldname, int newdfd,
         |                                     ^~~~~~~~
   fs/internal.h:61:32: warning: 'struct filename' declared inside parameter list will not be visible outside of this definition or declaration
      61 | int do_mkdirat(int dfd, struct filename *name, umode_t mode);
         |                                ^~~~~~~~
   fs/internal.h:62:25: warning: 'struct filename' declared inside parameter list will not be visible outside of this definition or declaration
      62 | int do_symlinkat(struct filename *from, int newdfd, struct filename *to);
         |                         ^~~~~~~~
   fs/internal.h:63:34: warning: 'struct filename' declared inside parameter list will not be visible outside of this definition or declaration
      63 | int do_linkat(int olddfd, struct filename *old, int newdfd,
         |                                  ^~~~~~~~
>> fs/internal.h:74:20: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'mnt_init'
      74 | extern void __init mnt_init(void);
         |                    ^~~~~~~~
>> fs/internal.h:94:55: warning: 'struct cred' declared inside parameter list will not be visible outside of this definition or declaration
      94 | struct file *alloc_empty_file(int flags, const struct cred *cred);
         |                                                       ^~~~
   fs/internal.h:95:65: warning: 'struct cred' declared inside parameter list will not be visible outside of this definition or declaration
      95 | struct file *alloc_empty_file_noaccount(int flags, const struct cred *cred);
         |                                                                 ^~~~
   fs/internal.h:96:63: warning: 'struct cred' declared inside parameter list will not be visible outside of this definition or declaration
      96 | struct file *alloc_empty_backing_file(int flags, const struct cred *cred);
         |                                                               ^~~~
   fs/internal.h: In function 'file_put_write_access':
>> fs/internal.h:101:9: error: implicit declaration of function 'put_write_access'; did you mean 'file_put_write_access'? [-Werror=implicit-function-declaration]
     101 |         put_write_access(file->f_inode);
         |         ^~~~~~~~~~~~~~~~
         |         file_put_write_access
>> fs/internal.h:101:30: error: invalid use of undefined type 'struct file'
     101 |         put_write_access(file->f_inode);
         |                              ^~
>> fs/internal.h:102:9: error: implicit declaration of function 'mnt_put_write_access'; did you mean 'file_put_write_access'? [-Werror=implicit-function-declaration]
     102 |         mnt_put_write_access(file->f_path.mnt);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         file_put_write_access
   fs/internal.h:102:34: error: invalid use of undefined type 'struct file'
     102 |         mnt_put_write_access(file->f_path.mnt);
         |                                  ^~
   In file included from include/linux/file.h:9,
                    from include/linux/backing-file.h:11:
   fs/internal.h:103:26: error: invalid use of undefined type 'struct file'
     103 |         if (unlikely(file->f_mode & FMODE_BACKING))
         |                          ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> fs/internal.h:103:37: error: 'FMODE_BACKING' undeclared (first use in this function)
     103 |         if (unlikely(file->f_mode & FMODE_BACKING))
         |                                     ^~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/internal.h:103:37: note: each undeclared identifier is reported only once for each function it appears in
     103 |         if (unlikely(file->f_mode & FMODE_BACKING))
         |                                     ^~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> fs/internal.h:104:38: error: implicit declaration of function 'backing_file_user_path'; did you mean 'backing_file_open'? [-Werror=implicit-function-declaration]
     104 |                 mnt_put_write_access(backing_file_user_path(file)->mnt);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
         |                                      backing_file_open
>> fs/internal.h:104:66: error: invalid type argument of '->' (have 'int')
     104 |                 mnt_put_write_access(backing_file_user_path(file)->mnt);
         |                                                                  ^~
   fs/internal.h: In function 'put_file_access':
   fs/internal.h:109:18: error: invalid use of undefined type 'struct file'
     109 |         if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) == FMODE_READ) {
         |                  ^~
>> fs/internal.h:109:30: error: 'FMODE_READ' undeclared (first use in this function)
     109 |         if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) == FMODE_READ) {
         |                              ^~~~~~~~~~
>> fs/internal.h:109:43: error: 'FMODE_WRITE' undeclared (first use in this function)
     109 |         if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) == FMODE_READ) {
         |                                           ^~~~~~~~~~~
>> fs/internal.h:110:17: error: implicit declaration of function 'i_readcount_dec' [-Werror=implicit-function-declaration]
     110 |                 i_readcount_dec(file->f_inode);
         |                 ^~~~~~~~~~~~~~~
   fs/internal.h:110:37: error: invalid use of undefined type 'struct file'
     110 |                 i_readcount_dec(file->f_inode);
         |                                     ^~
   fs/internal.h:111:24: error: invalid use of undefined type 'struct file'
     111 |         } else if (file->f_mode & FMODE_WRITER) {
         |                        ^~
>> fs/internal.h:111:35: error: 'FMODE_WRITER' undeclared (first use in this function)
     111 |         } else if (file->f_mode & FMODE_WRITER) {
         |                                   ^~~~~~~~~~~~
   In file included from <command-line>:
   fs/internal.h: In function 'sb_start_ro_state_change':
>> fs/internal.h:135:22: error: invalid use of undefined type 'struct super_block'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |                      ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/internal.h:135:9: note: in expansion of macro 'WRITE_ONCE'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |         ^~~~~~~~~~
>> fs/internal.h:135:22: error: invalid use of undefined type 'struct super_block'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |                      ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/internal.h:135:9: note: in expansion of macro 'WRITE_ONCE'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |         ^~~~~~~~~~
>> fs/internal.h:135:22: error: invalid use of undefined type 'struct super_block'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |                      ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/internal.h:135:9: note: in expansion of macro 'WRITE_ONCE'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |         ^~~~~~~~~~
>> fs/internal.h:135:22: error: invalid use of undefined type 'struct super_block'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |                      ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/internal.h:135:9: note: in expansion of macro 'WRITE_ONCE'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |         ^~~~~~~~~~
   fs/internal.h:135:22: error: invalid use of undefined type 'struct super_block'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |                      ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/internal.h:135:9: note: in expansion of macro 'WRITE_ONCE'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |         ^~~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246:
   fs/internal.h:135:22: error: invalid use of undefined type 'struct super_block'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |                      ^~
   include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                           ^
   fs/internal.h:135:9: note: in expansion of macro 'WRITE_ONCE'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |         ^~~~~~~~~~
   fs/internal.h:135:22: error: invalid use of undefined type 'struct super_block'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |                      ^~
   include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                  ^
   fs/internal.h:135:9: note: in expansion of macro 'WRITE_ONCE'
     135 |         WRITE_ONCE(sb->s_readonly_remount, 1);
         |         ^~~~~~~~~~
   fs/internal.h:145:9: error: implicit declaration of function 'smp_wmb' [-Werror=implicit-function-declaration]
     145 |         smp_wmb();
         |         ^~~~~~~
   fs/internal.h: In function 'sb_end_ro_state_change':
   fs/internal.h:164:22: error: invalid use of undefined type 'struct super_block'
     164 |         WRITE_ONCE(sb->s_readonly_remount, 0);
         |                      ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/internal.h:164:9: note: in expansion of macro 'WRITE_ONCE'
     164 |         WRITE_ONCE(sb->s_readonly_remount, 0);
         |         ^~~~~~~~~~
   fs/internal.h:164:22: error: invalid use of undefined type 'struct super_block'
     164 |         WRITE_ONCE(sb->s_readonly_remount, 0);
         |                      ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \


vim +/get_block_t +36 fs/internal.h

7b0de42d7c5a47 David Howells           2006-08-29   31  
4db96b71e3caea Akinobu Mita            2014-10-09   32  /*
4db96b71e3caea Akinobu Mita            2014-10-09   33   * buffer.c
4db96b71e3caea Akinobu Mita            2014-10-09   34   */
d1bd0b4ebfe052 Matthew Wilcox (Oracle  2021-11-03   35) int __block_write_begin_int(struct folio *folio, loff_t pos, unsigned len,
6d49cc8545e9e9 Christoph Hellwig       2021-08-10  @36  		get_block_t *get_block, const struct iomap *iomap);
4db96b71e3caea Akinobu Mita            2014-10-09   37  
07f3f05c1e3052 David Howells           2006-09-30   38  /*
07f3f05c1e3052 David Howells           2006-09-30   39   * char_dev.c
07f3f05c1e3052 David Howells           2006-09-30   40   */
07f3f05c1e3052 David Howells           2006-09-30  @41  extern void __init chrdev_init(void);
07f3f05c1e3052 David Howells           2006-09-30   42  
9bc61ab18b1d41 David Howells           2018-11-04   43  /*
9bc61ab18b1d41 David Howells           2018-11-04   44   * fs_context.c
9bc61ab18b1d41 David Howells           2018-11-04   45   */
ecdab150fddb42 David Howells           2018-11-01   46  extern const struct fs_context_operations legacy_fs_context_ops;
9bc61ab18b1d41 David Howells           2018-11-04   47  extern int parse_monolithic_mount_data(struct fs_context *, void *);
ecdab150fddb42 David Howells           2018-11-01   48  extern void vfs_clean_context(struct fs_context *fc);
ecdab150fddb42 David Howells           2018-11-01   49  extern int finish_clean_context(struct fs_context *fc);
9bc61ab18b1d41 David Howells           2018-11-04   50  
0bdaea9017b9d2 David Howells           2012-06-25   51  /*
0bdaea9017b9d2 David Howells           2012-06-25   52   * namei.c
0bdaea9017b9d2 David Howells           2012-06-25   53   */
31d921c7fb9691 David Howells           2018-11-01  @54  extern int filename_lookup(int dfd, struct filename *name, unsigned flags,
31d921c7fb9691 David Howells           2018-11-01   55  			   struct path *path, struct path *root);
45f30dab395730 Dmitry Kadashev         2021-07-08   56  int do_rmdir(int dfd, struct filename *name);
45f30dab395730 Dmitry Kadashev         2021-07-08   57  int do_unlinkat(int dfd, struct filename *name);
4609e1f18e19c3 Christian Brauner       2023-01-13   58  int may_linkat(struct mnt_idmap *idmap, const struct path *link);
e886663cfd029b Jens Axboe              2020-09-26   59  int do_renameat2(int olddfd, struct filename *oldname, int newdfd,
e886663cfd029b Jens Axboe              2020-09-26   60  		 struct filename *newname, unsigned int flags);
45f30dab395730 Dmitry Kadashev         2021-07-08   61  int do_mkdirat(int dfd, struct filename *name, umode_t mode);
7a8721f84fcb3b Dmitry Kadashev         2021-07-08   62  int do_symlinkat(struct filename *from, int newdfd, struct filename *to);
cf30da90bc3a26 Dmitry Kadashev         2021-07-08   63  int do_linkat(int olddfd, struct filename *old, int newdfd,
cf30da90bc3a26 Dmitry Kadashev         2021-07-08   64  			struct filename *new, int flags);
0bdaea9017b9d2 David Howells           2012-06-25   65  
07f3f05c1e3052 David Howells           2006-09-30   66  /*
07f3f05c1e3052 David Howells           2006-09-30   67   * namespace.c
07f3f05c1e3052 David Howells           2006-09-30   68   */
ca71cf71eeda04 Al Viro                 2016-11-20   69  extern struct vfsmount *lookup_mnt(const struct path *);
1e2d84644d1ce7 Al Viro                 2021-06-18   70  extern int finish_automount(struct vfsmount *, const struct path *);
6d59e7f582ef1c Al Viro                 2008-03-22   71  
4ed5e82fe77f41 Miklos Szeredi          2011-11-21   72  extern int sb_prepare_remount_readonly(struct super_block *);
f03c65993b98ee Al Viro                 2011-01-14   73  
6d59e7f582ef1c Al Viro                 2008-03-22  @74  extern void __init mnt_init(void);
3e93cd671813e2 Al Viro                 2009-03-29   75  
3e15dcf77b23b8 Amir Goldstein          2023-09-08   76  int mnt_get_write_access_file(struct file *file);
3e15dcf77b23b8 Amir Goldstein          2023-09-08   77  void mnt_put_write_access_file(struct file *file);
47cd813f298456 Al Viro                 2010-02-05   78  
a07b20004793d8 Al Viro                 2018-11-05   79  extern void dissolve_on_fput(struct vfsmount *);
a5f85d7834f7e1 Al Viro                 2022-03-01   80  extern bool may_mount(void);
c60166f04283ff Christoph Hellwig       2020-07-21   81  
c60166f04283ff Christoph Hellwig       2020-07-21   82  int path_mount(const char *dev_name, struct path *path,
c60166f04283ff Christoph Hellwig       2020-07-21   83  		const char *type_page, unsigned long flags, void *data_page);
09267defa36aaf Christoph Hellwig       2020-07-23   84  int path_umount(struct path *path, int flags);
c60166f04283ff Christoph Hellwig       2020-07-21   85  
3e93cd671813e2 Al Viro                 2009-03-29   86  /*
3e93cd671813e2 Al Viro                 2009-03-29   87   * fs_struct.c
3e93cd671813e2 Al Viro                 2009-03-29   88   */
dcf787f39162ce Al Viro                 2013-03-01   89  extern void chroot_fs_refs(const struct path *, const struct path *);
864d7c4c068f23 Nicholas Piggin         2009-04-26   90  
864d7c4c068f23 Nicholas Piggin         2009-04-26   91  /*
864d7c4c068f23 Nicholas Piggin         2009-04-26   92   * file_table.c
864d7c4c068f23 Nicholas Piggin         2009-04-26   93   */
62d53c4a1dfe34 Amir Goldstein          2023-06-15  @94  struct file *alloc_empty_file(int flags, const struct cred *cred);
62d53c4a1dfe34 Amir Goldstein          2023-06-15   95  struct file *alloc_empty_file_noaccount(int flags, const struct cred *cred);
62d53c4a1dfe34 Amir Goldstein          2023-06-15   96  struct file *alloc_empty_backing_file(int flags, const struct cred *cred);
1cf2d167e7f661 Mateusz Guzik           2023-09-26   97  void release_empty_file(struct file *f);
62c6943b4b1e81 Al Viro                 2009-05-07   98  
90e168d5fa0185 Amir Goldstein          2023-10-09   99  static inline void file_put_write_access(struct file *file)
90e168d5fa0185 Amir Goldstein          2023-10-09  100  {
90e168d5fa0185 Amir Goldstein          2023-10-09 @101  	put_write_access(file->f_inode);
90e168d5fa0185 Amir Goldstein          2023-10-09 @102  	mnt_put_write_access(file->f_path.mnt);
90e168d5fa0185 Amir Goldstein          2023-10-09 @103  	if (unlikely(file->f_mode & FMODE_BACKING))
6b9503cf48c98d Amir Goldstein          2023-10-09 @104  		mnt_put_write_access(backing_file_user_path(file)->mnt);
90e168d5fa0185 Amir Goldstein          2023-10-09  105  }
90e168d5fa0185 Amir Goldstein          2023-10-09  106  
d6da19c9cace63 Amir Goldstein          2022-08-16  107  static inline void put_file_access(struct file *file)
d6da19c9cace63 Amir Goldstein          2022-08-16  108  {
d6da19c9cace63 Amir Goldstein          2022-08-16 @109  	if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) == FMODE_READ) {
d6da19c9cace63 Amir Goldstein          2022-08-16 @110  		i_readcount_dec(file->f_inode);
d6da19c9cace63 Amir Goldstein          2022-08-16 @111  	} else if (file->f_mode & FMODE_WRITER) {
90e168d5fa0185 Amir Goldstein          2023-10-09  112  		file_put_write_access(file);
d6da19c9cace63 Amir Goldstein          2022-08-16  113  	}
d6da19c9cace63 Amir Goldstein          2022-08-16  114  }
d6da19c9cace63 Amir Goldstein          2022-08-16  115  
62c6943b4b1e81 Al Viro                 2009-05-07  116  /*
62c6943b4b1e81 Al Viro                 2009-05-07  117   * super.c
62c6943b4b1e81 Al Viro                 2009-05-07  118   */
8d0347f6c3a9d4 David Howells           2018-11-04  119  extern int reconfigure_super(struct fs_context *);
d8ce82efdece37 Christian Brauner       2023-08-18  120  extern bool super_trylock_shared(struct super_block *sb);
4e7b5671c6a883 Christoph Hellwig       2020-11-23  121  struct super_block *user_get_super(dev_t, bool excl);
60b498852bf219 Christoph Hellwig       2020-11-16  122  void put_super(struct super_block *sb);
20284ab7427ffa Al Viro                 2019-05-12  123  extern bool mount_capable(struct fs_context *);
439bc39b3cf001 Christoph Hellwig       2023-01-25  124  int sb_init_dio_done_wq(struct super_block *sb);
482928d59db668 Al Viro                 2009-12-19  125  
d7439fb1f4338f Jan Kara                2023-06-20  126  /*
d7439fb1f4338f Jan Kara                2023-06-20  127   * Prepare superblock for changing its read-only state (i.e., either remount
d7439fb1f4338f Jan Kara                2023-06-20  128   * read-write superblock read-only or vice versa). After this function returns
d7439fb1f4338f Jan Kara                2023-06-20  129   * mnt_is_readonly() will return true for any mount of the superblock if its
d7439fb1f4338f Jan Kara                2023-06-20  130   * caller is able to observe any changes done by the remount. This holds until
d7439fb1f4338f Jan Kara                2023-06-20  131   * sb_end_ro_state_change() is called.
d7439fb1f4338f Jan Kara                2023-06-20  132   */
d7439fb1f4338f Jan Kara                2023-06-20  133  static inline void sb_start_ro_state_change(struct super_block *sb)
d7439fb1f4338f Jan Kara                2023-06-20  134  {
d7439fb1f4338f Jan Kara                2023-06-20 @135  	WRITE_ONCE(sb->s_readonly_remount, 1);
d7439fb1f4338f Jan Kara                2023-06-20  136  	/*
d7439fb1f4338f Jan Kara                2023-06-20  137  	 * For RO->RW transition, the barrier pairs with the barrier in
d7439fb1f4338f Jan Kara                2023-06-20  138  	 * mnt_is_readonly() making sure if mnt_is_readonly() sees SB_RDONLY
d7439fb1f4338f Jan Kara                2023-06-20  139  	 * cleared, it will see s_readonly_remount set.
d7439fb1f4338f Jan Kara                2023-06-20  140  	 * For RW->RO transition, the barrier pairs with the barrier in
3e15dcf77b23b8 Amir Goldstein          2023-09-08  141  	 * mnt_get_write_access() before the mnt_is_readonly() check.
3e15dcf77b23b8 Amir Goldstein          2023-09-08  142  	 * The barrier makes sure if mnt_get_write_access() sees MNT_WRITE_HOLD
3e15dcf77b23b8 Amir Goldstein          2023-09-08  143  	 * already cleared, it will see s_readonly_remount set.
d7439fb1f4338f Jan Kara                2023-06-20  144  	 */
d7439fb1f4338f Jan Kara                2023-06-20 @145  	smp_wmb();
d7439fb1f4338f Jan Kara                2023-06-20  146  }
d7439fb1f4338f Jan Kara                2023-06-20  147  
d7439fb1f4338f Jan Kara                2023-06-20  148  /*
d7439fb1f4338f Jan Kara                2023-06-20  149   * Ends section changing read-only state of the superblock. After this function
d7439fb1f4338f Jan Kara                2023-06-20  150   * returns if mnt_is_readonly() returns false, the caller will be able to
d7439fb1f4338f Jan Kara                2023-06-20  151   * observe all the changes remount did to the superblock.
d7439fb1f4338f Jan Kara                2023-06-20  152   */
d7439fb1f4338f Jan Kara                2023-06-20  153  static inline void sb_end_ro_state_change(struct super_block *sb)
d7439fb1f4338f Jan Kara                2023-06-20  154  {
d7439fb1f4338f Jan Kara                2023-06-20  155  	/*
d7439fb1f4338f Jan Kara                2023-06-20  156  	 * This barrier provides release semantics that pairs with
d7439fb1f4338f Jan Kara                2023-06-20  157  	 * the smp_rmb() acquire semantics in mnt_is_readonly().
d7439fb1f4338f Jan Kara                2023-06-20  158  	 * This barrier pair ensure that when mnt_is_readonly() sees
d7439fb1f4338f Jan Kara                2023-06-20  159  	 * 0 for sb->s_readonly_remount, it will also see all the
d7439fb1f4338f Jan Kara                2023-06-20  160  	 * preceding flag changes that were made during the RO state
d7439fb1f4338f Jan Kara                2023-06-20  161  	 * change.
d7439fb1f4338f Jan Kara                2023-06-20  162  	 */
d7439fb1f4338f Jan Kara                2023-06-20  163  	smp_wmb();
d7439fb1f4338f Jan Kara                2023-06-20  164  	WRITE_ONCE(sb->s_readonly_remount, 0);
d7439fb1f4338f Jan Kara                2023-06-20  165  }
d7439fb1f4338f Jan Kara                2023-06-20  166  
482928d59db668 Al Viro                 2009-12-19  167  /*
482928d59db668 Al Viro                 2009-12-19  168   * open.c
482928d59db668 Al Viro                 2009-12-19  169   */
47c805dc2d2dff Al Viro                 2011-02-23  170  struct open_flags {
47c805dc2d2dff Al Viro                 2011-02-23  171  	int open_flag;
a218d0fdc5f900 Al Viro                 2011-11-21  172  	umode_t mode;
47c805dc2d2dff Al Viro                 2011-02-23  173  	int acc_mode;
47c805dc2d2dff Al Viro                 2011-02-23  174  	int intent;
f9652e10c12b43 Al Viro                 2013-06-11  175  	int lookup_flags;
47c805dc2d2dff Al Viro                 2011-02-23  176  };
669abf4e5539c8 Jeff Layton             2012-10-10  177  extern struct file *do_filp_open(int dfd, struct filename *pathname,
f9652e10c12b43 Al Viro                 2013-06-11  178  		const struct open_flags *op);
ffb37ca3bd16ce Al Viro                 2021-04-01  179  extern struct file *do_file_open_root(const struct path *,
f9652e10c12b43 Al Viro                 2013-06-11  180  		const char *, const struct open_flags *);
35cb6d54c1d5da Jens Axboe              2019-12-13  181  extern struct open_how build_open_how(int flags, umode_t mode);
35cb6d54c1d5da Jens Axboe              2019-12-13  182  extern int build_open_flags(const struct open_how *how, struct open_flags *op);
6319194ec57b04 Al Viro                 2022-05-12  183  extern struct file *__close_fd_get_file(unsigned int fd);
a8dade34e3df58 Al Viro                 2010-10-24  184  
411d9475cf901b Dominik Brodowski       2018-03-11  185  long do_sys_ftruncate(unsigned int fd, loff_t length, int small);
1097742efc643f Christoph Hellwig       2020-07-22  186  int chmod_common(const struct path *path, umode_t mode);
55731b3cda3a85 Dominik Brodowski       2018-03-11  187  int do_fchownat(int dfd, const char __user *filename, uid_t user, gid_t group,
55731b3cda3a85 Dominik Brodowski       2018-03-11  188  		int flag);
b873498f99c77e Christoph Hellwig       2020-07-22  189  int chown_common(const struct path *path, uid_t user, gid_t group);
ae2bb293a3e8ad Al Viro                 2018-07-10  190  extern int vfs_open(const struct path *, struct file *);
becfd1f3754479 Aneesh Kumar K.V        2011-01-29  191  
a8dade34e3df58 Al Viro                 2010-10-24  192  /*
a8dade34e3df58 Al Viro                 2010-10-24  193   * inode.c
a8dade34e3df58 Al Viro                 2010-10-24  194   */
503c358cf19258 Vladimir Davydov        2015-02-12  195  extern long prune_icache_sb(struct super_block *sb, struct shrink_control *sc);
9452e93e6dae86 Christian Brauner       2023-01-13  196  int dentry_needs_remove_privs(struct mnt_idmap *, struct dentry *dentry);
9452e93e6dae86 Christian Brauner       2023-01-13  197  bool in_group_or_capable(struct mnt_idmap *idmap,
11c2a8700cdcab Christian Brauner       2022-10-17 @198  			 const struct inode *inode, vfsgid_t vfsgid);
f23ce757185319 Jan Kara                2023-06-01  199  void lock_two_inodes(struct inode *inode1, struct inode *inode2,
f23ce757185319 Jan Kara                2023-06-01  200  		     unsigned subclass1, unsigned subclass2);
55fa6091d83160 Dave Chinner            2011-03-22  201  
a66979abad090b Dave Chinner            2011-03-22  202  /*
a66979abad090b Dave Chinner            2011-03-22  203   * fs-writeback.c
a66979abad090b Dave Chinner            2011-03-22  204   */
3942c07ccf98e6 Glauber Costa           2013-08-28  205  extern long get_nr_dirty_inodes(void);
e127b9bccdb04e Christoph Hellwig       2023-08-11  206  void invalidate_inodes(struct super_block *sb);
a4464dbc0ca6a3 Al Viro                 2011-07-07  207  
a4464dbc0ca6a3 Al Viro                 2011-07-07  208  /*
a4464dbc0ca6a3 Al Viro                 2011-07-07  209   * dcache.c
a4464dbc0ca6a3 Al Viro                 2011-07-07  210   */
eed810076685c7 Miklos Szeredi          2013-09-05  211  extern int d_set_mounted(struct dentry *dentry);
503c358cf19258 Vladimir Davydov        2015-02-12  212  extern long prune_dcache_sb(struct super_block *sb, struct shrink_control *sc);
ba65dc5ef16f82 Al Viro                 2016-06-10  213  extern struct dentry *d_alloc_cursor(struct dentry *);
ab1152dd5650d3 Al Viro                 2019-03-15 @214  extern struct dentry * d_alloc_pseudo(struct super_block *, const struct qstr *);
7e5f7bb08b8cef Al Viro                 2019-05-20  215  extern char *simple_dname(struct dentry *, char *, int);
9bdebc2bd1c4ab Al Viro                 2019-06-29  216  extern void dput_to_list(struct dentry *, struct list_head *);
9bdebc2bd1c4ab Al Viro                 2019-06-29  217  extern void shrink_dentry_list(struct list_head *);
06ae43f34bcc07 Al Viro                 2013-03-20  218  

:::::: The code at line 36 was first introduced by commit
:::::: 6d49cc8545e9e9e9e5a14e75fd044f049bd6077e fs: mark the iomap argument to __block_write_begin_int const

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
