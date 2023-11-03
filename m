Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9031C285
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNTMnNkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699025315; x=1730561315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UVfgeAnOPSS39fkhnhp/9Msaxu7nMFUM2dXCgUEvexI=;
  b=SNTMnNkXDNSRx9kicG4FnbMW9ozVxuR5T6+BBFv8esvRK+6K3lR59NYc
   QEvxUzKIN/kcSg6pKVSfvDrD6xyFG5E2MLIPkZ2tSXfHSzCIqaNJYWnwL
   JWcgczMDpkLdJfIHRr8ekv4y5166ikaNqQfWNnxnxkEuKkYEjdDxswPGy
   ziIHOvQynEfnHME5iMhQHDffzm+uSvyZHoBZAgKGheiwW8n9Uia7us1y/
   yN1xMOtMla6cI6WaTflPLklplKs5StUOi8vk+FEBD/H/PyR8XYtf0dykI
   rUs5ZR1i6Hft6l3Kj0rKNsKFdR/iKsLY+vovpowhu6xYYpW5fZlxiwMSO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368307164"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="368307164"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 08:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2787801"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Nov 2023 08:28:33 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyw62-0002dJ-1z;
	Fri, 03 Nov 2023 15:28:30 +0000
Date: Fri, 3 Nov 2023 23:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.mount 5/7] include/linux/syscalls.h:416:44:
 warning: 'struct __mount_arg' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202311032330.iqD9yaZa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount
head:   9b8879c4124d7313b6ca2301d44be30e71c6dd2e
commit: 4412ca803757b94873a2298c7b14ed750230ec9b [5/7] add listmount(2) syscall
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231103/202311032330.iqD9yaZa-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032330.iqD9yaZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032330.iqD9yaZa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/open.c:27:
>> include/linux/syscalls.h:416:44: warning: 'struct __mount_arg' declared inside parameter list will not be visible outside of this definition or declaration
     416 | asmlinkage long sys_listmount(const struct __mount_arg __user *req,
         |                                            ^~~~~~~~~~~
--
   In file included from fs/namespace.c:11:
>> include/linux/syscalls.h:416:44: warning: 'struct __mount_arg' declared inside parameter list will not be visible outside of this definition or declaration
     416 | asmlinkage long sys_listmount(const struct __mount_arg __user *req,
         |                                            ^~~~~~~~~~~
   include/linux/syscalls.h:246:25: error: conflicting types for 'sys_listmount'; have 'long int(const struct mnt_id_req *, u64 *, size_t,  unsigned int)' {aka 'long int(const struct mnt_id_req *, long long unsigned int *, unsigned int,  unsigned int)'}
     246 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:232:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     232 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:224:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     224 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:5017:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    5017 | SYSCALL_DEFINE4(listmount, const struct mnt_id_req __user *, req,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:416:17: note: previous declaration of 'sys_listmount' with type 'long int(const struct __mount_arg *, u64 *, size_t,  unsigned int)' {aka 'long int(const struct __mount_arg *, long long unsigned int *, unsigned int,  unsigned int)'}
     416 | asmlinkage long sys_listmount(const struct __mount_arg __user *req,
         |                 ^~~~~~~~~~~~~


vim +416 include/linux/syscalls.h

   287	
   288	/*
   289	 * These syscall function prototypes are kept in the same order as
   290	 * include/uapi/asm-generic/unistd.h. Architecture specific entries go below,
   291	 * followed by deprecated or obsolete system calls.
   292	 *
   293	 * Please note that these prototypes here are only provided for information
   294	 * purposes, for static analysis, and for linking from the syscall table.
   295	 * These functions should not be called elsewhere from kernel code.
   296	 *
   297	 * As the syscall calling convention may be different from the default
   298	 * for architectures overriding the syscall calling convention, do not
   299	 * include the prototypes if CONFIG_ARCH_HAS_SYSCALL_WRAPPER is enabled.
   300	 */
   301	#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
   302	asmlinkage long sys_io_setup(unsigned nr_reqs, aio_context_t __user *ctx);
   303	asmlinkage long sys_io_destroy(aio_context_t ctx);
   304	asmlinkage long sys_io_submit(aio_context_t, long,
   305				struct iocb __user * __user *);
   306	asmlinkage long sys_io_cancel(aio_context_t ctx_id, struct iocb __user *iocb,
   307				      struct io_event __user *result);
   308	asmlinkage long sys_io_getevents(aio_context_t ctx_id,
   309					long min_nr,
   310					long nr,
   311					struct io_event __user *events,
   312					struct __kernel_timespec __user *timeout);
   313	asmlinkage long sys_io_getevents_time32(__u32 ctx_id,
   314					__s32 min_nr,
   315					__s32 nr,
   316					struct io_event __user *events,
   317					struct old_timespec32 __user *timeout);
   318	asmlinkage long sys_io_pgetevents(aio_context_t ctx_id,
   319					long min_nr,
   320					long nr,
   321					struct io_event __user *events,
   322					struct __kernel_timespec __user *timeout,
   323					const struct __aio_sigset *sig);
   324	asmlinkage long sys_io_pgetevents_time32(aio_context_t ctx_id,
   325					long min_nr,
   326					long nr,
   327					struct io_event __user *events,
   328					struct old_timespec32 __user *timeout,
   329					const struct __aio_sigset *sig);
   330	asmlinkage long sys_io_uring_setup(u32 entries,
   331					struct io_uring_params __user *p);
   332	asmlinkage long sys_io_uring_enter(unsigned int fd, u32 to_submit,
   333					u32 min_complete, u32 flags,
   334					const void __user *argp, size_t argsz);
   335	asmlinkage long sys_io_uring_register(unsigned int fd, unsigned int op,
   336					void __user *arg, unsigned int nr_args);
   337	asmlinkage long sys_setxattr(const char __user *path, const char __user *name,
   338				     const void __user *value, size_t size, int flags);
   339	asmlinkage long sys_lsetxattr(const char __user *path, const char __user *name,
   340				      const void __user *value, size_t size, int flags);
   341	asmlinkage long sys_fsetxattr(int fd, const char __user *name,
   342				      const void __user *value, size_t size, int flags);
   343	asmlinkage long sys_getxattr(const char __user *path, const char __user *name,
   344				     void __user *value, size_t size);
   345	asmlinkage long sys_lgetxattr(const char __user *path, const char __user *name,
   346				      void __user *value, size_t size);
   347	asmlinkage long sys_fgetxattr(int fd, const char __user *name,
   348				      void __user *value, size_t size);
   349	asmlinkage long sys_listxattr(const char __user *path, char __user *list,
   350				      size_t size);
   351	asmlinkage long sys_llistxattr(const char __user *path, char __user *list,
   352				       size_t size);
   353	asmlinkage long sys_flistxattr(int fd, char __user *list, size_t size);
   354	asmlinkage long sys_removexattr(const char __user *path,
   355					const char __user *name);
   356	asmlinkage long sys_lremovexattr(const char __user *path,
   357					 const char __user *name);
   358	asmlinkage long sys_fremovexattr(int fd, const char __user *name);
   359	asmlinkage long sys_getcwd(char __user *buf, unsigned long size);
   360	asmlinkage long sys_lookup_dcookie(u64 cookie64, char __user *buf, size_t len);
   361	asmlinkage long sys_eventfd2(unsigned int count, int flags);
   362	asmlinkage long sys_epoll_create1(int flags);
   363	asmlinkage long sys_epoll_ctl(int epfd, int op, int fd,
   364					struct epoll_event __user *event);
   365	asmlinkage long sys_epoll_pwait(int epfd, struct epoll_event __user *events,
   366					int maxevents, int timeout,
   367					const sigset_t __user *sigmask,
   368					size_t sigsetsize);
   369	asmlinkage long sys_epoll_pwait2(int epfd, struct epoll_event __user *events,
   370					 int maxevents,
   371					 const struct __kernel_timespec __user *timeout,
   372					 const sigset_t __user *sigmask,
   373					 size_t sigsetsize);
   374	asmlinkage long sys_dup(unsigned int fildes);
   375	asmlinkage long sys_dup3(unsigned int oldfd, unsigned int newfd, int flags);
   376	asmlinkage long sys_fcntl(unsigned int fd, unsigned int cmd, unsigned long arg);
   377	#if BITS_PER_LONG == 32
   378	asmlinkage long sys_fcntl64(unsigned int fd,
   379					unsigned int cmd, unsigned long arg);
   380	#endif
   381	asmlinkage long sys_inotify_init1(int flags);
   382	asmlinkage long sys_inotify_add_watch(int fd, const char __user *path,
   383						u32 mask);
   384	asmlinkage long sys_inotify_rm_watch(int fd, __s32 wd);
   385	asmlinkage long sys_ioctl(unsigned int fd, unsigned int cmd,
   386					unsigned long arg);
   387	asmlinkage long sys_ioprio_set(int which, int who, int ioprio);
   388	asmlinkage long sys_ioprio_get(int which, int who);
   389	asmlinkage long sys_flock(unsigned int fd, unsigned int cmd);
   390	asmlinkage long sys_mknodat(int dfd, const char __user * filename, umode_t mode,
   391				    unsigned dev);
   392	asmlinkage long sys_mkdirat(int dfd, const char __user * pathname, umode_t mode);
   393	asmlinkage long sys_unlinkat(int dfd, const char __user * pathname, int flag);
   394	asmlinkage long sys_symlinkat(const char __user * oldname,
   395				      int newdfd, const char __user * newname);
   396	asmlinkage long sys_linkat(int olddfd, const char __user *oldname,
   397				   int newdfd, const char __user *newname, int flags);
   398	asmlinkage long sys_renameat(int olddfd, const char __user * oldname,
   399				     int newdfd, const char __user * newname);
   400	asmlinkage long sys_umount(char __user *name, int flags);
   401	asmlinkage long sys_mount(char __user *dev_name, char __user *dir_name,
   402					char __user *type, unsigned long flags,
   403					void __user *data);
   404	asmlinkage long sys_pivot_root(const char __user *new_root,
   405					const char __user *put_old);
   406	asmlinkage long sys_statfs(const char __user * path,
   407					struct statfs __user *buf);
   408	asmlinkage long sys_statfs64(const char __user *path, size_t sz,
   409					struct statfs64 __user *buf);
   410	asmlinkage long sys_fstatfs(unsigned int fd, struct statfs __user *buf);
   411	asmlinkage long sys_fstatfs64(unsigned int fd, size_t sz,
   412					struct statfs64 __user *buf);
   413	asmlinkage long sys_statmount(const struct mnt_id_req __user *req,
   414				      struct statmount __user *buf, size_t bufsize,
   415				      unsigned int flags);
 > 416	asmlinkage long sys_listmount(const struct __mount_arg __user *req,
   417				      u64 __user *buf, size_t bufsize,
   418				      unsigned int flags);
   419	asmlinkage long sys_truncate(const char __user *path, long length);
   420	asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
   421	#if BITS_PER_LONG == 32
   422	asmlinkage long sys_truncate64(const char __user *path, loff_t length);
   423	asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
   424	#endif
   425	asmlinkage long sys_fallocate(int fd, int mode, loff_t offset, loff_t len);
   426	asmlinkage long sys_faccessat(int dfd, const char __user *filename, int mode);
   427	asmlinkage long sys_faccessat2(int dfd, const char __user *filename, int mode,
   428				       int flags);
   429	asmlinkage long sys_chdir(const char __user *filename);
   430	asmlinkage long sys_fchdir(unsigned int fd);
   431	asmlinkage long sys_chroot(const char __user *filename);
   432	asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
   433	asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
   434				     umode_t mode);
   435	asmlinkage long sys_fchmodat2(int dfd, const char __user *filename,
   436				     umode_t mode, unsigned int flags);
   437	asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
   438				     gid_t group, int flag);
   439	asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
   440	asmlinkage long sys_openat(int dfd, const char __user *filename, int flags,
   441				   umode_t mode);
   442	asmlinkage long sys_openat2(int dfd, const char __user *filename,
   443				    struct open_how *how, size_t size);
   444	asmlinkage long sys_close(unsigned int fd);
   445	asmlinkage long sys_close_range(unsigned int fd, unsigned int max_fd,
   446					unsigned int flags);
   447	asmlinkage long sys_vhangup(void);
   448	asmlinkage long sys_pipe2(int __user *fildes, int flags);
   449	asmlinkage long sys_quotactl(unsigned int cmd, const char __user *special,
   450					qid_t id, void __user *addr);
   451	asmlinkage long sys_quotactl_fd(unsigned int fd, unsigned int cmd, qid_t id,
   452					void __user *addr);
   453	asmlinkage long sys_getdents64(unsigned int fd,
   454					struct linux_dirent64 __user *dirent,
   455					unsigned int count);
   456	asmlinkage long sys_llseek(unsigned int fd, unsigned long offset_high,
   457				unsigned long offset_low, loff_t __user *result,
   458				unsigned int whence);
   459	asmlinkage long sys_lseek(unsigned int fd, off_t offset,
   460				  unsigned int whence);
   461	asmlinkage long sys_read(unsigned int fd, char __user *buf, size_t count);
   462	asmlinkage long sys_write(unsigned int fd, const char __user *buf,
   463				  size_t count);
   464	asmlinkage long sys_readv(unsigned long fd,
   465				  const struct iovec __user *vec,
   466				  unsigned long vlen);
   467	asmlinkage long sys_writev(unsigned long fd,
   468				   const struct iovec __user *vec,
   469				   unsigned long vlen);
   470	asmlinkage long sys_pread64(unsigned int fd, char __user *buf,
   471				    size_t count, loff_t pos);
   472	asmlinkage long sys_pwrite64(unsigned int fd, const char __user *buf,
   473				     size_t count, loff_t pos);
   474	asmlinkage long sys_preadv(unsigned long fd, const struct iovec __user *vec,
   475				   unsigned long vlen, unsigned long pos_l, unsigned long pos_h);
   476	asmlinkage long sys_pwritev(unsigned long fd, const struct iovec __user *vec,
   477				    unsigned long vlen, unsigned long pos_l, unsigned long pos_h);
   478	asmlinkage long sys_sendfile64(int out_fd, int in_fd,
   479				       loff_t __user *offset, size_t count);
   480	asmlinkage long sys_pselect6(int, fd_set __user *, fd_set __user *,
   481				     fd_set __user *, struct __kernel_timespec __user *,
   482				     void __user *);
   483	asmlinkage long sys_pselect6_time32(int, fd_set __user *, fd_set __user *,
   484				     fd_set __user *, struct old_timespec32 __user *,
   485				     void __user *);
   486	asmlinkage long sys_ppoll(struct pollfd __user *, unsigned int,
   487				  struct __kernel_timespec __user *, const sigset_t __user *,
   488				  size_t);
   489	asmlinkage long sys_ppoll_time32(struct pollfd __user *, unsigned int,
   490				  struct old_timespec32 __user *, const sigset_t __user *,
   491				  size_t);
   492	asmlinkage long sys_signalfd4(int ufd, sigset_t __user *user_mask, size_t sizemask, int flags);
   493	asmlinkage long sys_vmsplice(int fd, const struct iovec __user *iov,
   494				     unsigned long nr_segs, unsigned int flags);
   495	asmlinkage long sys_splice(int fd_in, loff_t __user *off_in,
   496				   int fd_out, loff_t __user *off_out,
   497				   size_t len, unsigned int flags);
   498	asmlinkage long sys_tee(int fdin, int fdout, size_t len, unsigned int flags);
   499	asmlinkage long sys_readlinkat(int dfd, const char __user *path, char __user *buf,
   500				       int bufsiz);
   501	asmlinkage long sys_newfstatat(int dfd, const char __user *filename,
   502				       struct stat __user *statbuf, int flag);
   503	asmlinkage long sys_newfstat(unsigned int fd, struct stat __user *statbuf);
   504	#if defined(__ARCH_WANT_STAT64) || defined(__ARCH_WANT_COMPAT_STAT64)
   505	asmlinkage long sys_fstat64(unsigned long fd, struct stat64 __user *statbuf);
   506	asmlinkage long sys_fstatat64(int dfd, const char __user *filename,
   507				       struct stat64 __user *statbuf, int flag);
   508	#endif
   509	asmlinkage long sys_sync(void);
   510	asmlinkage long sys_fsync(unsigned int fd);
   511	asmlinkage long sys_fdatasync(unsigned int fd);
   512	asmlinkage long sys_sync_file_range2(int fd, unsigned int flags,
   513					     loff_t offset, loff_t nbytes);
   514	asmlinkage long sys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
   515						unsigned int flags);
   516	asmlinkage long sys_timerfd_create(int clockid, int flags);
   517	asmlinkage long sys_timerfd_settime(int ufd, int flags,
   518					    const struct __kernel_itimerspec __user *utmr,
   519					    struct __kernel_itimerspec __user *otmr);
   520	asmlinkage long sys_timerfd_gettime(int ufd, struct __kernel_itimerspec __user *otmr);
   521	asmlinkage long sys_timerfd_gettime32(int ufd,
   522					   struct old_itimerspec32 __user *otmr);
   523	asmlinkage long sys_timerfd_settime32(int ufd, int flags,
   524					   const struct old_itimerspec32 __user *utmr,
   525					   struct old_itimerspec32 __user *otmr);
   526	asmlinkage long sys_utimensat(int dfd, const char __user *filename,
   527					struct __kernel_timespec __user *utimes,
   528					int flags);
   529	asmlinkage long sys_utimensat_time32(unsigned int dfd,
   530					const char __user *filename,
   531					struct old_timespec32 __user *t, int flags);
   532	asmlinkage long sys_acct(const char __user *name);
   533	asmlinkage long sys_capget(cap_user_header_t header,
   534					cap_user_data_t dataptr);
   535	asmlinkage long sys_capset(cap_user_header_t header,
   536					const cap_user_data_t data);
   537	asmlinkage long sys_personality(unsigned int personality);
   538	asmlinkage long sys_exit(int error_code);
   539	asmlinkage long sys_exit_group(int error_code);
   540	asmlinkage long sys_waitid(int which, pid_t pid,
   541				   struct siginfo __user *infop,
   542				   int options, struct rusage __user *ru);
   543	asmlinkage long sys_set_tid_address(int __user *tidptr);
   544	asmlinkage long sys_unshare(unsigned long unshare_flags);
   545	asmlinkage long sys_futex(u32 __user *uaddr, int op, u32 val,
   546				  const struct __kernel_timespec __user *utime,
   547				  u32 __user *uaddr2, u32 val3);
   548	asmlinkage long sys_futex_time32(u32 __user *uaddr, int op, u32 val,
   549					 const struct old_timespec32 __user *utime,
   550					 u32 __user *uaddr2, u32 val3);
   551	asmlinkage long sys_get_robust_list(int pid,
   552					    struct robust_list_head __user * __user *head_ptr,
   553					    size_t __user *len_ptr);
   554	asmlinkage long sys_set_robust_list(struct robust_list_head __user *head,
   555					    size_t len);
   556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
