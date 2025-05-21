Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC346264A61
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827297; cv=none; b=Dg4NZBRsBxbiWKiti3h8NJ87zoLO/bTUeCdLg19+T4fWRuYm+l1ZEYHybljNYSmjd5fHTJsKqH6XLebLpQBzCxsJEDtsc+gqm2W1pk4gKXxYWbTfNlHMMMcKBoRiOyo+yLyLwOb8ja1P+luA0zbizeuPzzOp2lEgIojOgBrpS/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827297; c=relaxed/simple;
	bh=pzXQ+5pI/KrEd+MyJMvzxFd3J6ZS/neldoHSvMLEgAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ewpgU9gRnjAYyeUJXG4teN1aByjDmXjTcpVsQ7ao3R92TafUt16oQz3UEc7CW26Xd8MDK6brHronA7c63LowXmFid3Qti6116cmP4z1bW0crHomCiWm1LshQuS+u2hobXDDh1gh5PF4H167JWgNbuk3LtkUVcLtWcOWkfY2/woI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1Ie6e88; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1Ie6e88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747827295; x=1779363295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pzXQ+5pI/KrEd+MyJMvzxFd3J6ZS/neldoHSvMLEgAY=;
  b=j1Ie6e88OtuA6w6DcgwrMnxuixe9dOHW5qJaw1BdRBBo4UBCNsSdC/ts
   UMxhDVBe866X76/SDOiW3fciaPq/PNCI0W3ccJDLMXTugaaZwfzjBS53V
   +4PVRrlnYq7Kfgck9NksLpBVikgVFwnL4/bf2EmFJ0AMuIeqhVLdFCLXT
   Lqds2xsHG5FwyzHpltNLiBU1WyD2OBDA/xwnFWzjx6cTX/EUjAObCyttQ
   OAWd98vfryXnY6RvpMjpl876AkAISF+9tCrNcd7iYiHcDXXZgkRahAh3M
   pI0FSERowX8DNVyE8F7wuuRIegsk9jvj8Z5GeHqVatDWvUgwto8HDpMVK
   Q==;
X-CSE-ConnectionGUID: w6jmTnssSVCpIWQPLeUyTA==
X-CSE-MsgGUID: TUMxz1GqRBKstUXzil822A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="61202444"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="61202444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:34:54 -0700
X-CSE-ConnectionGUID: TbcXttS4Tnm/5CvmPwkHMg==
X-CSE-MsgGUID: hIiB+c8DRCWNSviAmAP+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144765085"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2025 04:34:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHhij-000OCC-1d;
	Wed, 21 May 2025 11:34:49 +0000
Date: Wed, 21 May 2025 19:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	Jann Horn <jannh@google.com>
Subject: [brauner-github:vfs-6.16.coredump 27/33] fs/coredump.c:966:17:
 error: 'default' label not within a switch statement
Message-ID: <202505211906.Cck0K5xE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.16.coredump
head:   ad2a84867c2951d84ba94acb9f67001314f511b7
commit: 1fe211b28af6234d4a003072d9ab1fcdf7f7c4d9 [27/33] coredump: add coredump socket
config: i386-buildonly-randconfig-003-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211906.Cck0K5xE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211906.Cck0K5xE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211906.Cck0K5xE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/coredump.c: In function 'do_coredump':
>> fs/coredump.c:946:17: warning: enumeration value 'COREDUMP_FILE' not handled in switch [-Wswitch]
     946 |                 switch (cn.core_type) {
         |                 ^~~~~~
>> fs/coredump.c:946:17: warning: enumeration value 'COREDUMP_SOCK' not handled in switch [-Wswitch]
>> fs/coredump.c:966:17: error: 'default' label not within a switch statement
     966 |                 default:
         |                 ^~~~~~~
>> fs/coredump.c:967:25: error: break statement not within loop or switch
     967 |                         break;
         |                         ^~~~~
>> fs/coredump.c:828:25: error: label 'fail_dropcount' used but not defined
     828 |                         goto fail_dropcount;
         |                         ^~~~
>> fs/coredump.c:916:25: error: label 'close_fail' used but not defined
     916 |                         goto close_fail;
         |                         ^~~~
>> fs/coredump.c:814:25: error: label 'fail_unlock' used but not defined
     814 |                         goto fail_unlock;
         |                         ^~~~
>> fs/coredump.c:684:17: error: label 'fail_creds' used but not defined
     684 |                 goto fail_creds;
         |                 ^~~~
>> fs/coredump.c:669:17: error: label 'fail' used but not defined
     669 |                 goto fail;
         |                 ^~~~
>> fs/coredump.c:644:14: warning: variable 'core_dumped' set but not used [-Wunused-but-set-variable]
     644 |         bool core_dumped = false;
         |              ^~~~~~~~~~~
>> fs/coredump.c:637:28: warning: variable 'old_cred' set but not used [-Wunused-but-set-variable]
     637 |         const struct cred *old_cred;
         |                            ^~~~~~~~
   fs/coredump.c: At top level:
>> fs/coredump.c:971:11: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
     971 | close_fail:
         |           ^
   fs/coredump.c:974:15: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
     974 | fail_dropcount:
         |               ^
   fs/coredump.c:977:12: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
     977 | fail_unlock:
         |            ^
>> fs/coredump.c:979:17: error: expected ')' before '.' token
     979 |         kfree(cn.corename);
         |                 ^
         |                 )
>> fs/coredump.c:980:9: warning: data definition has no type or storage class
     980 |         coredump_finish(core_dumped);
         |         ^~~~~~~~~~~~~~~
>> fs/coredump.c:980:9: error: type defaults to 'int' in declaration of 'coredump_finish' [-Werror=implicit-int]
>> fs/coredump.c:980:9: warning: parameter names (without types) in function declaration
>> fs/coredump.c:980:9: error: conflicting types for 'coredump_finish'; have 'int()'
   fs/coredump.c:519:13: note: previous definition of 'coredump_finish' with type 'void(bool)' {aka 'void(_Bool)'}
     519 | static void coredump_finish(bool core_dumped)
         |             ^~~~~~~~~~~~~~~
   fs/coredump.c:981:9: warning: data definition has no type or storage class
     981 |         revert_creds(old_cred);
         |         ^~~~~~~~~~~~
>> fs/coredump.c:981:9: error: type defaults to 'int' in declaration of 'revert_creds' [-Werror=implicit-int]
   fs/coredump.c:981:9: warning: parameter names (without types) in function declaration
>> fs/coredump.c:981:9: error: conflicting types for 'revert_creds'; have 'int()'
   In file included from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/fdtable.h:16,
                    from fs/coredump.c:4:
   include/linux/cred.h:178:34: note: previous definition of 'revert_creds' with type 'const struct cred *(const struct cred *)'
     178 | static inline const struct cred *revert_creds(const struct cred *revert_cred)
         |                                  ^~~~~~~~~~~~
   fs/coredump.c:982:11: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
     982 | fail_creds:
         |           ^
   fs/coredump.c:984:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
     984 | fail:
         |     ^
>> fs/coredump.c:986:1: error: expected identifier or '(' before '}' token
     986 | }
         | ^
   fs/coredump.c:519:13: warning: 'coredump_finish' defined but not used [-Wunused-function]
     519 | static void coredump_finish(bool core_dumped)
         |             ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/default +966 fs/coredump.c

   630	
   631	void do_coredump(const kernel_siginfo_t *siginfo)
   632	{
   633		struct core_state core_state;
   634		struct core_name cn;
   635		struct mm_struct *mm = current->mm;
   636		struct linux_binfmt * binfmt;
   637		const struct cred *old_cred;
   638		struct cred *cred;
   639		int retval = 0;
   640		size_t *argv = NULL;
   641		int argc = 0;
   642		/* require nonrelative corefile path and be extra careful */
   643		bool need_suid_safe = false;
   644		bool core_dumped = false;
   645		static atomic_t core_dump_count = ATOMIC_INIT(0);
   646		struct coredump_params cprm = {
   647			.siginfo = siginfo,
   648			.limit = rlimit(RLIMIT_CORE),
   649			/*
   650			 * We must use the same mm->flags while dumping core to avoid
   651			 * inconsistency of bit flags, since this flag is not protected
   652			 * by any locks.
   653			 */
   654			.mm_flags = mm->flags,
   655			.vma_meta = NULL,
   656			.cpu = raw_smp_processor_id(),
   657		};
   658	
   659		audit_core_dumps(siginfo->si_signo);
   660	
   661		binfmt = mm->binfmt;
   662		if (!binfmt || !binfmt->core_dump)
   663			goto fail;
   664		if (!__get_dumpable(cprm.mm_flags))
   665			goto fail;
   666	
   667		cred = prepare_creds();
   668		if (!cred)
   669			goto fail;
   670		/*
   671		 * We cannot trust fsuid as being the "true" uid of the process
   672		 * nor do we know its entire history. We only know it was tainted
   673		 * so we dump it as root in mode 2, and only into a controlled
   674		 * environment (pipe handler or fully qualified path).
   675		 */
   676		if (__get_dumpable(cprm.mm_flags) == SUID_DUMP_ROOT) {
   677			/* Setuid core dump mode */
   678			cred->fsuid = GLOBAL_ROOT_UID;	/* Dump root private */
   679			need_suid_safe = true;
   680		}
   681	
   682		retval = coredump_wait(siginfo->si_signo, &core_state);
   683		if (retval < 0)
   684			goto fail_creds;
   685	
   686		old_cred = override_creds(cred);
   687	
   688		retval = format_corename(&cn, &cprm, &argv, &argc);
   689		if (retval < 0) {
   690			coredump_report_failure("format_corename failed, aborting core");
   691			goto fail_unlock;
   692		}
   693	
   694		switch (cn.core_type) {
   695		case COREDUMP_FILE: {
   696			struct mnt_idmap *idmap;
   697			struct inode *inode;
   698			int open_flags = O_CREAT | O_WRONLY | O_NOFOLLOW |
   699					 O_LARGEFILE | O_EXCL;
   700	
   701			if (cprm.limit < binfmt->min_coredump)
   702				goto fail_unlock;
   703	
   704			if (need_suid_safe && cn.corename[0] != '/') {
   705				coredump_report_failure(
   706					"this process can only dump core to a fully qualified path, skipping core dump");
   707				goto fail_unlock;
   708			}
   709	
   710			/*
   711			 * Unlink the file if it exists unless this is a SUID
   712			 * binary - in that case, we're running around with root
   713			 * privs and don't want to unlink another user's coredump.
   714			 */
   715			if (!need_suid_safe) {
   716				/*
   717				 * If it doesn't exist, that's fine. If there's some
   718				 * other problem, we'll catch it at the filp_open().
   719				 */
   720				do_unlinkat(AT_FDCWD, getname_kernel(cn.corename));
   721			}
   722	
   723			/*
   724			 * There is a race between unlinking and creating the
   725			 * file, but if that causes an EEXIST here, that's
   726			 * fine - another process raced with us while creating
   727			 * the corefile, and the other process won. To userspace,
   728			 * what matters is that at least one of the two processes
   729			 * writes its coredump successfully, not which one.
   730			 */
   731			if (need_suid_safe) {
   732				/*
   733				 * Using user namespaces, normal user tasks can change
   734				 * their current->fs->root to point to arbitrary
   735				 * directories. Since the intention of the "only dump
   736				 * with a fully qualified path" rule is to control where
   737				 * coredumps may be placed using root privileges,
   738				 * current->fs->root must not be used. Instead, use the
   739				 * root directory of init_task.
   740				 */
   741				struct path root;
   742	
   743				task_lock(&init_task);
   744				get_fs_root(init_task.fs, &root);
   745				task_unlock(&init_task);
   746				cprm.file = file_open_root(&root, cn.corename,
   747							   open_flags, 0600);
   748				path_put(&root);
   749			} else {
   750				cprm.file = filp_open(cn.corename, open_flags, 0600);
   751			}
   752			if (IS_ERR(cprm.file))
   753				goto fail_unlock;
   754	
   755			inode = file_inode(cprm.file);
   756			if (inode->i_nlink > 1)
   757				goto close_fail;
   758			if (d_unhashed(cprm.file->f_path.dentry))
   759				goto close_fail;
   760			/*
   761			 * AK: actually i see no reason to not allow this for named
   762			 * pipes etc, but keep the previous behaviour for now.
   763			 */
   764			if (!S_ISREG(inode->i_mode))
   765				goto close_fail;
   766			/*
   767			 * Don't dump core if the filesystem changed owner or mode
   768			 * of the file during file creation. This is an issue when
   769			 * a process dumps core while its cwd is e.g. on a vfat
   770			 * filesystem.
   771			 */
   772			idmap = file_mnt_idmap(cprm.file);
   773			if (!vfsuid_eq_kuid(i_uid_into_vfsuid(idmap, inode),
   774					    current_fsuid())) {
   775				coredump_report_failure("Core dump to %s aborted: "
   776					"cannot preserve file owner", cn.corename);
   777				goto close_fail;
   778			}
   779			if ((inode->i_mode & 0677) != 0600) {
   780				coredump_report_failure("Core dump to %s aborted: "
   781					"cannot preserve file permissions", cn.corename);
   782				goto close_fail;
   783			}
   784			if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
   785				goto close_fail;
   786			if (do_truncate(idmap, cprm.file->f_path.dentry,
   787					0, 0, cprm.file))
   788				goto close_fail;
   789			break;
   790		}
   791		case COREDUMP_PIPE: {
   792			int argi;
   793			int dump_count;
   794			char **helper_argv;
   795			struct subprocess_info *sub_info;
   796	
   797			if (cprm.limit == 1) {
   798				/* See umh_coredump_setup() which sets RLIMIT_CORE = 1.
   799				 *
   800				 * Normally core limits are irrelevant to pipes, since
   801				 * we're not writing to the file system, but we use
   802				 * cprm.limit of 1 here as a special value, this is a
   803				 * consistent way to catch recursive crashes.
   804				 * We can still crash if the core_pattern binary sets
   805				 * RLIM_CORE = !1, but it runs as root, and can do
   806				 * lots of stupid things.
   807				 *
   808				 * Note that we use task_tgid_vnr here to grab the pid
   809				 * of the process group leader.  That way we get the
   810				 * right pid if a thread in a multi-threaded
   811				 * core_pattern process dies.
   812				 */
   813				coredump_report_failure("RLIMIT_CORE is set to 1, aborting core");
 > 814				goto fail_unlock;
   815			}
   816			cprm.limit = RLIM_INFINITY;
   817	
   818			dump_count = atomic_inc_return(&core_dump_count);
   819			if (core_pipe_limit && (core_pipe_limit < dump_count)) {
   820				coredump_report_failure("over core_pipe_limit, skipping core dump");
   821				goto fail_dropcount;
   822			}
   823	
   824			helper_argv = kmalloc_array(argc + 1, sizeof(*helper_argv),
   825						    GFP_KERNEL);
   826			if (!helper_argv) {
   827				coredump_report_failure("%s failed to allocate memory", __func__);
 > 828				goto fail_dropcount;
   829			}
   830			for (argi = 0; argi < argc; argi++)
   831				helper_argv[argi] = cn.corename + argv[argi];
   832			helper_argv[argi] = NULL;
   833	
   834			retval = -ENOMEM;
   835			sub_info = call_usermodehelper_setup(helper_argv[0],
   836							helper_argv, NULL, GFP_KERNEL,
   837							umh_coredump_setup, NULL, &cprm);
   838			if (sub_info)
   839				retval = call_usermodehelper_exec(sub_info,
   840								  UMH_WAIT_EXEC);
   841	
   842			kfree(helper_argv);
   843			if (retval) {
   844				coredump_report_failure("|%s pipe failed", cn.corename);
   845				goto close_fail;
   846			}
   847			break;
   848		}
   849		case COREDUMP_SOCK: {
   850	#ifdef CONFIG_UNIX
   851			struct file *file __free(fput) = NULL;
   852			struct sockaddr_un addr = {
   853				.sun_family = AF_UNIX,
   854			};
   855			ssize_t addr_len;
   856			struct socket *socket;
   857	
   858			addr_len = strscpy(addr.sun_path, cn.corename);
   859			if (addr_len < 0)
   860				goto close_fail;
   861			addr_len += offsetof(struct sockaddr_un, sun_path) + 1;
   862	
   863			/*
   864			 * It is possible that the userspace process which is
   865			 * supposed to handle the coredump and is listening on
   866			 * the AF_UNIX socket coredumps. Userspace should just
   867			 * mark itself non dumpable.
   868			 */
   869	
   870			retval = sock_create_kern(&init_net, AF_UNIX, SOCK_STREAM, 0, &socket);
   871			if (retval < 0)
   872				goto close_fail;
   873	
   874			file = sock_alloc_file(socket, 0, NULL);
   875			if (IS_ERR(file))
   876				goto close_fail;
   877	
   878			retval = kernel_connect(socket, (struct sockaddr *)(&addr),
   879						addr_len, O_NONBLOCK | SOCK_COREDUMP);
   880			if (retval) {
   881				if (retval == -EAGAIN)
   882					coredump_report_failure("Coredump socket %s receive queue full", addr.sun_path);
   883				else
   884					coredump_report_failure("Coredump socket connection %s failed %d", addr.sun_path, retval);
   885				goto close_fail;
   886			}
   887	
   888			cprm.limit = RLIM_INFINITY;
   889			cprm.file = no_free_ptr(file);
   890	#else
   891			coredump_report_failure("Core dump socket support %s disabled", cn.corename);
   892			goto close_fail;
   893	#endif
   894			break;
   895		}
   896		default:
   897			WARN_ON_ONCE(true);
   898			goto close_fail;
   899		}
   900	
   901		/* get us an unshared descriptor table; almost always a no-op */
   902		/* The cell spufs coredump code reads the file descriptor tables */
   903		retval = unshare_files();
   904		if (retval)
   905			goto close_fail;
   906		if (!dump_interrupted()) {
   907			/*
   908			 * umh disabled with CONFIG_STATIC_USERMODEHELPER_PATH="" would
   909			 * have this set to NULL.
   910			 */
   911			if (!cprm.file) {
   912				coredump_report_failure("Core dump to |%s disabled", cn.corename);
   913				goto close_fail;
   914			}
   915			if (!dump_vma_snapshot(&cprm))
 > 916				goto close_fail;
   917	
   918			file_start_write(cprm.file);
   919			core_dumped = binfmt->core_dump(&cprm);
   920			/*
   921			 * Ensures that file size is big enough to contain the current
   922			 * file postion. This prevents gdb from complaining about
   923			 * a truncated file if the last "write" to the file was
   924			 * dump_skip.
   925			 */
   926			if (cprm.to_skip) {
   927				cprm.to_skip--;
   928				dump_emit(&cprm, "", 1);
   929			}
   930			file_end_write(cprm.file);
   931			free_vma_snapshot(&cprm);
   932		}
   933	
   934	#ifdef CONFIG_UNIX
   935		/* Let userspace know we're done processing the coredump. */
   936		if (sock_from_file(cprm.file))
   937			kernel_sock_shutdown(sock_from_file(cprm.file), SHUT_WR);
   938	#endif
   939	
   940		/*
   941		 * When core_pipe_limit is set we wait for the coredump server
   942		 * or usermodehelper to finish before exiting so it can e.g.,
   943		 * inspect /proc/<pid>.
   944		 */
   945		if (core_pipe_limit) {
 > 946			switch (cn.core_type) {
   947			case COREDUMP_PIPE:
   948				wait_for_dump_helpers(cprm.file);
   949				break;
   950	#ifdef CONFIG_UNIX
   951			case COREDUMP_SOCK: {
   952				ssize_t n;
   953	
   954				/*
   955				 * We use a simple read to wait for the coredump
   956				 * processing to finish. Either the socket is
   957				 * closed or we get sent unexpected data. In
   958				 * both cases, we're done.
   959				 */
   960				n = __kernel_read(cprm.file, &(char){ 0 }, 1, NULL);
   961				if (n != 0)
   962					coredump_report_failure("Unexpected data on coredump socket");
   963				break;
   964	#endif
   965			}
 > 966			default:
 > 967				break;
   968			}
   969		}
   970	
 > 971	close_fail:
   972		if (cprm.file)
   973			filp_close(cprm.file, NULL);
   974	fail_dropcount:
   975		if (cn.core_type == COREDUMP_PIPE)
   976			atomic_dec(&core_dump_count);
   977	fail_unlock:
   978		kfree(argv);
 > 979		kfree(cn.corename);
 > 980		coredump_finish(core_dumped);
 > 981		revert_creds(old_cred);
   982	fail_creds:
   983		put_cred(cred);
   984	fail:
   985		return;
 > 986	}
   987	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
