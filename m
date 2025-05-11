Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE601FC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746984907; cv=none; b=SzNIJNIHYkSb7j140AEmfAfrj2uj9vK2W7sRELpYwoWIkkhgJuj4F1UF15Dv2Rky7/4fgRtN6hJSXd2tSoo3IEq7v4ggAnV7yw8hUwtHJlkd9iyn5BP1etoDhK1rXydJPgPovt+MXP38Dp7/63OTuEDhGR7DydCPxN+9gR8tYzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746984907; c=relaxed/simple;
	bh=xIDM/e93NMhm7dVCB8Ye6gYg+Io+SWj55YJ9c6LY3SI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VdlK2unXrUeQr9hTIui3dN10mFyAS4dENZO4QfQq6UT+aFdq7+vUBhGgCzwzojZVL2VyrIMeH3Zmu2+Vmln6/vM0ej7tQQZGvmR0drwfvac+icrBKv/837qsjTlFBG1Qa66nYsjCgZ6WKEqHJ07d1f5PYrEjI06AsOVnedNpXeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jACjxYvc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jACjxYvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746984905; x=1778520905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xIDM/e93NMhm7dVCB8Ye6gYg+Io+SWj55YJ9c6LY3SI=;
  b=jACjxYvcyRD59l9bHZvPP+QR7w2cDUVzQL0i0Hj1hnv98HJ7P5F+EX8P
   btClu2wRmkOvxhLthTNAMfIrbFhjAp2JRrJ4RNWrc/GjRJkvTR+otF6jk
   LOCtk6FVdGzaWWiJa0ZSmNdFTZHJUnRulLgzU0boFmhvaQDPKlyN3uvhP
   GJeUsGByMNz0w031PuNKaA4276DT1Xa9H8V4VYBzxiQbDzlXKKtB5LSeq
   wLrmIVirSy8HEqTFET77DK/qNgvYWKytS1ylTCGI92qWkulDlWgCxnMAW
   PQuY8BFp5hfcgIuf+JedKMljFELqRYGh5qAab5jWF4JTKoQHMKUcfEM90
   A==;
X-CSE-ConnectionGUID: gMEibN0hS7KjvjFGq1bzYQ==
X-CSE-MsgGUID: 8cbAvBJjQmiCDVJTTkCEDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="36405604"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="36405604"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 10:35:04 -0700
X-CSE-ConnectionGUID: DyFi0ZW3RyaiD0hT+Wibpg==
X-CSE-MsgGUID: 6lIc1WT1QV67QP5lb9dlTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="137551350"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2025 10:35:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEAZo-000Dtn-2c;
	Sun, 11 May 2025 17:35:00 +0000
Date: Mon, 12 May 2025 01:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.coredump.socket.tmp 11/17]
 fs/coredump.c:974:57: error: empty scalar initializer
Message-ID: <202505120114.B9lOTx2N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.coredump.socket.tmp
head:   35c4ddb37fc4f2ba3ada4ef8eb64e849f82c702b
commit: 8d89644075ddc43d0a8ea35a401366e981fe43a0 [11/17] coredump: add coredump socket
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250512/202505120114.B9lOTx2N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505120114.B9lOTx2N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505120114.B9lOTx2N-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/coredump.c: In function 'do_coredump':
>> fs/coredump.c:974:57: error: empty scalar initializer
     974 |                         __kernel_read(cprm.file, &(char){}, 1, NULL);
         |                                                         ^
   fs/coredump.c:974:57: note: (near initialization for '(anonymous)')


vim +974 fs/coredump.c

   661	
   662	void do_coredump(const kernel_siginfo_t *siginfo)
   663	{
   664		struct core_state core_state;
   665		struct core_name cn;
   666		struct mm_struct *mm = current->mm;
   667		struct linux_binfmt * binfmt;
   668		const struct cred *old_cred;
   669		struct cred *cred;
   670		int retval = 0;
   671		size_t *argv = NULL;
   672		int argc = 0;
   673		/* require nonrelative corefile path and be extra careful */
   674		bool need_suid_safe = false;
   675		bool core_dumped = false;
   676		static atomic_t core_dump_count = ATOMIC_INIT(0);
   677		struct coredump_params cprm = {
   678			.siginfo = siginfo,
   679			.limit = rlimit(RLIMIT_CORE),
   680			/*
   681			 * We must use the same mm->flags while dumping core to avoid
   682			 * inconsistency of bit flags, since this flag is not protected
   683			 * by any locks.
   684			 */
   685			.mm_flags = mm->flags,
   686			.vma_meta = NULL,
   687			.cpu = raw_smp_processor_id(),
   688		};
   689	
   690		audit_core_dumps(siginfo->si_signo);
   691	
   692		binfmt = mm->binfmt;
   693		if (!binfmt || !binfmt->core_dump)
   694			goto fail;
   695		if (!__get_dumpable(cprm.mm_flags))
   696			goto fail;
   697	
   698		cred = prepare_creds();
   699		if (!cred)
   700			goto fail;
   701		/*
   702		 * We cannot trust fsuid as being the "true" uid of the process
   703		 * nor do we know its entire history. We only know it was tainted
   704		 * so we dump it as root in mode 2, and only into a controlled
   705		 * environment (pipe handler or fully qualified path).
   706		 */
   707		if (__get_dumpable(cprm.mm_flags) == SUID_DUMP_ROOT) {
   708			/* Setuid core dump mode */
   709			cred->fsuid = GLOBAL_ROOT_UID;	/* Dump root private */
   710			need_suid_safe = true;
   711		}
   712	
   713		retval = coredump_wait(siginfo->si_signo, &core_state);
   714		if (retval < 0)
   715			goto fail_creds;
   716	
   717		old_cred = override_creds(cred);
   718	
   719		retval = format_corename(&cn, &cprm, &argv, &argc);
   720		if (retval < 0) {
   721			coredump_report_failure("format_corename failed, aborting core");
   722			goto fail_unlock;
   723		}
   724	
   725		switch (cn.core_type) {
   726		case COREDUMP_FILE: {
   727			struct mnt_idmap *idmap;
   728			struct inode *inode;
   729			int open_flags = O_CREAT | O_WRONLY | O_NOFOLLOW |
   730					 O_LARGEFILE | O_EXCL;
   731	
   732			if (cprm.limit < binfmt->min_coredump)
   733				goto fail_unlock;
   734	
   735			if (need_suid_safe && cn.corename[0] != '/') {
   736				coredump_report_failure(
   737					"this process can only dump core to a fully qualified path, skipping core dump");
   738				goto fail_unlock;
   739			}
   740	
   741			/*
   742			 * Unlink the file if it exists unless this is a SUID
   743			 * binary - in that case, we're running around with root
   744			 * privs and don't want to unlink another user's coredump.
   745			 */
   746			if (!need_suid_safe) {
   747				/*
   748				 * If it doesn't exist, that's fine. If there's some
   749				 * other problem, we'll catch it at the filp_open().
   750				 */
   751				do_unlinkat(AT_FDCWD, getname_kernel(cn.corename));
   752			}
   753	
   754			/*
   755			 * There is a race between unlinking and creating the
   756			 * file, but if that causes an EEXIST here, that's
   757			 * fine - another process raced with us while creating
   758			 * the corefile, and the other process won. To userspace,
   759			 * what matters is that at least one of the two processes
   760			 * writes its coredump successfully, not which one.
   761			 */
   762			if (need_suid_safe) {
   763				/*
   764				 * Using user namespaces, normal user tasks can change
   765				 * their current->fs->root to point to arbitrary
   766				 * directories. Since the intention of the "only dump
   767				 * with a fully qualified path" rule is to control where
   768				 * coredumps may be placed using root privileges,
   769				 * current->fs->root must not be used. Instead, use the
   770				 * root directory of init_task.
   771				 */
   772				struct path root;
   773	
   774				task_lock(&init_task);
   775				get_fs_root(init_task.fs, &root);
   776				task_unlock(&init_task);
   777				cprm.file = file_open_root(&root, cn.corename,
   778							   open_flags, 0600);
   779				path_put(&root);
   780			} else {
   781				cprm.file = filp_open(cn.corename, open_flags, 0600);
   782			}
   783			if (IS_ERR(cprm.file))
   784				goto fail_unlock;
   785	
   786			inode = file_inode(cprm.file);
   787			if (inode->i_nlink > 1)
   788				goto close_fail;
   789			if (d_unhashed(cprm.file->f_path.dentry))
   790				goto close_fail;
   791			/*
   792			 * AK: actually i see no reason to not allow this for named
   793			 * pipes etc, but keep the previous behaviour for now.
   794			 */
   795			if (!S_ISREG(inode->i_mode))
   796				goto close_fail;
   797			/*
   798			 * Don't dump core if the filesystem changed owner or mode
   799			 * of the file during file creation. This is an issue when
   800			 * a process dumps core while its cwd is e.g. on a vfat
   801			 * filesystem.
   802			 */
   803			idmap = file_mnt_idmap(cprm.file);
   804			if (!vfsuid_eq_kuid(i_uid_into_vfsuid(idmap, inode),
   805					    current_fsuid())) {
   806				coredump_report_failure("Core dump to %s aborted: "
   807					"cannot preserve file owner", cn.corename);
   808				goto close_fail;
   809			}
   810			if ((inode->i_mode & 0677) != 0600) {
   811				coredump_report_failure("Core dump to %s aborted: "
   812					"cannot preserve file permissions", cn.corename);
   813				goto close_fail;
   814			}
   815			if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
   816				goto close_fail;
   817			if (do_truncate(idmap, cprm.file->f_path.dentry,
   818					0, 0, cprm.file))
   819				goto close_fail;
   820			break;
   821		}
   822		case COREDUMP_PIPE: {
   823			int argi;
   824			int dump_count;
   825			char **helper_argv;
   826			struct subprocess_info *sub_info;
   827	
   828			if (cprm.limit == 1) {
   829				/* See umh_coredump_setup() which sets RLIMIT_CORE = 1.
   830				 *
   831				 * Normally core limits are irrelevant to pipes, since
   832				 * we're not writing to the file system, but we use
   833				 * cprm.limit of 1 here as a special value, this is a
   834				 * consistent way to catch recursive crashes.
   835				 * We can still crash if the core_pattern binary sets
   836				 * RLIM_CORE = !1, but it runs as root, and can do
   837				 * lots of stupid things.
   838				 *
   839				 * Note that we use task_tgid_vnr here to grab the pid
   840				 * of the process group leader.  That way we get the
   841				 * right pid if a thread in a multi-threaded
   842				 * core_pattern process dies.
   843				 */
   844				coredump_report_failure("RLIMIT_CORE is set to 1, aborting core");
   845				goto fail_unlock;
   846			}
   847			cprm.limit = RLIM_INFINITY;
   848	
   849			dump_count = atomic_inc_return(&core_dump_count);
   850			if (core_pipe_limit && (core_pipe_limit < dump_count)) {
   851				coredump_report_failure("over core_pipe_limit, skipping core dump");
   852				goto fail_dropcount;
   853			}
   854	
   855			helper_argv = kmalloc_array(argc + 1, sizeof(*helper_argv),
   856						    GFP_KERNEL);
   857			if (!helper_argv) {
   858				coredump_report_failure("%s failed to allocate memory", __func__);
   859				goto fail_dropcount;
   860			}
   861			for (argi = 0; argi < argc; argi++)
   862				helper_argv[argi] = cn.corename + argv[argi];
   863			helper_argv[argi] = NULL;
   864	
   865			retval = -ENOMEM;
   866			sub_info = call_usermodehelper_setup(helper_argv[0],
   867							helper_argv, NULL, GFP_KERNEL,
   868							umh_coredump_setup, NULL, &cprm);
   869			if (sub_info)
   870				retval = call_usermodehelper_exec(sub_info,
   871								  UMH_WAIT_EXEC);
   872	
   873			kfree(helper_argv);
   874			if (retval) {
   875				coredump_report_failure("|%s pipe failed", cn.corename);
   876				goto close_fail;
   877			}
   878			break;
   879		}
   880		case COREDUMP_SOCK: {
   881	#ifdef CONFIG_UNIX
   882			struct file *file __free(fput) = NULL;
   883			struct socket *socket;
   884	
   885			/*
   886			 * It is possible that the userspace process which is
   887			 * supposed to handle the coredump and is listening on
   888			 * the AF_UNIX socket coredumps. Userspace should just
   889			 * mark itself non dumpable.
   890			 */
   891	
   892			retval = sock_create_kern(&init_net, AF_UNIX, SOCK_STREAM, 0, &socket);
   893			if (retval < 0)
   894				goto close_fail;
   895	
   896			file = sock_alloc_file(socket, 0, NULL);
   897			if (IS_ERR(file)) {
   898				sock_release(socket);
   899				goto close_fail;
   900			}
   901	
   902			retval = kernel_connect(socket,
   903						(struct sockaddr *)(&coredump_unix_socket),
   904						COREDUMP_UNIX_SOCKET_ADDR_SIZE, O_NONBLOCK);
   905			if (retval) {
   906				if (retval == -EAGAIN)
   907					coredump_report_failure("Skipping as coredump socket connection %s couldn't complete immediately", cn.corename);
   908				goto close_fail;
   909			}
   910	
   911			cprm.limit = RLIM_INFINITY;
   912			cprm.file = no_free_ptr(file);
   913	#else
   914			coredump_report_failure("Core dump socket support %s disabled", cn.corename);
   915			goto close_fail;
   916	#endif
   917			break;
   918		}
   919		default:
   920			WARN_ON_ONCE(true);
   921			goto close_fail;
   922		}
   923	
   924		/* get us an unshared descriptor table; almost always a no-op */
   925		/* The cell spufs coredump code reads the file descriptor tables */
   926		retval = unshare_files();
   927		if (retval)
   928			goto close_fail;
   929		if (!dump_interrupted()) {
   930			/*
   931			 * umh disabled with CONFIG_STATIC_USERMODEHELPER_PATH="" would
   932			 * have this set to NULL.
   933			 */
   934			if (!cprm.file) {
   935				coredump_report_failure("Core dump to |%s disabled", cn.corename);
   936				goto close_fail;
   937			}
   938			if (!dump_vma_snapshot(&cprm))
   939				goto close_fail;
   940	
   941			file_start_write(cprm.file);
   942			core_dumped = binfmt->core_dump(&cprm);
   943			/*
   944			 * Ensures that file size is big enough to contain the current
   945			 * file postion. This prevents gdb from complaining about
   946			 * a truncated file if the last "write" to the file was
   947			 * dump_skip.
   948			 */
   949			if (cprm.to_skip) {
   950				cprm.to_skip--;
   951				dump_emit(&cprm, "", 1);
   952			}
   953			file_end_write(cprm.file);
   954			free_vma_snapshot(&cprm);
   955		}
   956	
   957		/*
   958		 * When core_pipe_limit is set we wait for the coredump server
   959		 * or usermodehelper to finish before exiting so it can e.g.,
   960		 * inspect /proc/<pid>.
   961		 */
   962		if (core_pipe_limit) {
   963			switch (cn.core_type) {
   964			case COREDUMP_PIPE:
   965				wait_for_dump_helpers(cprm.file);
   966				break;
   967			case COREDUMP_SOCK: {
   968				/*
   969				 * We use a simple read to wait for the coredump
   970				 * processing to finish. Either the socket is
   971				 * closed or we get sent unexpected data. In
   972				 * both cases, we're done.
   973				 */
 > 974				__kernel_read(cprm.file, &(char){}, 1, NULL);
   975				break;
   976			}
   977			default:
   978				break;
   979			}
   980		}
   981	
   982	close_fail:
   983		if (cprm.file)
   984			filp_close(cprm.file, NULL);
   985	fail_dropcount:
   986		if (cn.core_type == COREDUMP_PIPE)
   987			atomic_dec(&core_dump_count);
   988	fail_unlock:
   989		kfree(argv);
   990		kfree(cn.corename);
   991		coredump_finish(core_dumped);
   992		revert_creds(old_cred);
   993	fail_creds:
   994		put_cred(cred);
   995	fail:
   996		return;
   997	}
   998	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
