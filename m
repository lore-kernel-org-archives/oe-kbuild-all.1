Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416CD215066
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 17:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120971; cv=none; b=r85Zi3g9cQZWzjsBekF4HfJyBhi9AsYeacvnXOw7ulje8Beiq1DMWlnOB4N7Nyel5Et/r4eGuiosFSrjFU4incTWB75RHCIZJ/hPyzMt90XUWX7iKYpByjBQv+alwnPDguQCk9/UTYoKVA1sqXik83tFNVp3zz/43NqcUTgvlGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120971; c=relaxed/simple;
	bh=7dxW20i0cKgNluGHhTsXJfDOEcanZs4KUq0+KTeVXc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucg8eHz9yRlUng6hD2rZpTbNUvnXKSfN31LUEgK1SEGGc02Pw2l6+fG0QUd5Cxy1MwUQXPJb/CoDio9oducARDH/vSqVFapW5KpCCKhTm/a7+bLkU7bJqM5VVCSwyJDa5KZ8TClupFT8C5r94PkNtOd0IjrPj8F0KF7v4JYTloc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQPOvLLT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQPOvLLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746120966; x=1777656966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7dxW20i0cKgNluGHhTsXJfDOEcanZs4KUq0+KTeVXc8=;
  b=eQPOvLLTC1ugx5VnV999azKORjW7u9w34CKCP3qApnlU8hRlC7Lp2hS8
   D6g9+9EQGP/5Anr5IU3tTXQPK6Tqch/HH9+uy/+TyLoI17+SZ9DklQuKi
   pAHRmUFHBHtF2WZwXpV2q76K7kB6+6zxVeXyhz8eCPQGUjg6lnEwhqxED
   U5Figjcv7XVPhzwZ1IDlOJAv+CNPfo5fk2Lt9+AhUbEgJDLAxHda2uZag
   hIskEiJUtvxPFR5dhTYeVykD9UK9/QET3R78qfJmcV4h8VDsJy1wCWrGo
   Z8FvjksFYMK5vNCnsXe8Dchrv2pSR9pskzq+fQb5aavUjORfqFjiMyzim
   w==;
X-CSE-ConnectionGUID: wDp4qv1UQ7OExqSdpLZfwg==
X-CSE-MsgGUID: +D0ACPvWR2WjK/bZdn3P4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51622641"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="51622641"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:36:04 -0700
X-CSE-ConnectionGUID: ctaBS00pRGWJUr9ANpVekQ==
X-CSE-MsgGUID: Sg9O6vDQSG+eBdtzO2dtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134940911"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2025 10:36:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAXpI-0004IN-00;
	Thu, 01 May 2025 17:36:00 +0000
Date: Fri, 2 May 2025 01:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/3] coredump: support AF_UNIX sockets
Message-ID: <202505020143.Kuje6Wsb-lkp@intel.com>
References: <20250430-work-coredump-socket-v1-3-2faf027dbb47@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-work-coredump-socket-v1-3-2faf027dbb47@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 80e14080a00bc429a4ee440d17746a49867df663]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/coredump-massage-format_corname/20250430-191417
base:   80e14080a00bc429a4ee440d17746a49867df663
patch link:    https://lore.kernel.org/r/20250430-work-coredump-socket-v1-3-2faf027dbb47%40kernel.org
patch subject: [PATCH RFC 3/3] coredump: support AF_UNIX sockets
config: nios2-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020143.Kuje6Wsb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020143.Kuje6Wsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020143.Kuje6Wsb-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: fs/coredump.o: in function `do_coredump':
   fs/coredump.c:851: undefined reference to `__sys_socket_file'
>> fs/coredump.c:851:(.text+0x14b4): relocation truncated to fit: R_NIOS2_CALL26 against `__sys_socket_file'
>> nios2-linux-ld: fs/coredump.c:870: undefined reference to `__sys_connect_file'
>> fs/coredump.c:870:(.text+0x14d4): relocation truncated to fit: R_NIOS2_CALL26 against `__sys_connect_file'
>> nios2-linux-ld: fs/coredump.c:875: undefined reference to `sock_from_file'
>> fs/coredump.c:875:(.text+0x14e0): relocation truncated to fit: R_NIOS2_CALL26 against `sock_from_file'
>> nios2-linux-ld: fs/coredump.c:875: undefined reference to `__sys_shutdown_sock'
>> fs/coredump.c:875:(.text+0x14ec): relocation truncated to fit: R_NIOS2_CALL26 against `__sys_shutdown_sock'


vim +851 fs/coredump.c

   621	
   622	void do_coredump(const kernel_siginfo_t *siginfo)
   623	{
   624		struct core_state core_state;
   625		struct core_name cn;
   626		struct mm_struct *mm = current->mm;
   627		struct linux_binfmt * binfmt;
   628		const struct cred *old_cred;
   629		struct cred *cred;
   630		int retval = 0;
   631		size_t *argv = NULL;
   632		int argc = 0;
   633		/* require nonrelative corefile path and be extra careful */
   634		bool need_suid_safe = false;
   635		bool core_dumped = false;
   636		static atomic_t core_dump_count = ATOMIC_INIT(0);
   637		struct coredump_params cprm = {
   638			.siginfo = siginfo,
   639			.limit = rlimit(RLIMIT_CORE),
   640			/*
   641			 * We must use the same mm->flags while dumping core to avoid
   642			 * inconsistency of bit flags, since this flag is not protected
   643			 * by any locks.
   644			 */
   645			.mm_flags = mm->flags,
   646			.vma_meta = NULL,
   647			.cpu = raw_smp_processor_id(),
   648		};
   649	
   650		audit_core_dumps(siginfo->si_signo);
   651	
   652		binfmt = mm->binfmt;
   653		if (!binfmt || !binfmt->core_dump)
   654			goto fail;
   655		if (!__get_dumpable(cprm.mm_flags))
   656			goto fail;
   657	
   658		cred = prepare_creds();
   659		if (!cred)
   660			goto fail;
   661		/*
   662		 * We cannot trust fsuid as being the "true" uid of the process
   663		 * nor do we know its entire history. We only know it was tainted
   664		 * so we dump it as root in mode 2, and only into a controlled
   665		 * environment (pipe handler or fully qualified path).
   666		 */
   667		if (__get_dumpable(cprm.mm_flags) == SUID_DUMP_ROOT) {
   668			/* Setuid core dump mode */
   669			cred->fsuid = GLOBAL_ROOT_UID;	/* Dump root private */
   670			need_suid_safe = true;
   671		}
   672	
   673		retval = coredump_wait(siginfo->si_signo, &core_state);
   674		if (retval < 0)
   675			goto fail_creds;
   676	
   677		old_cred = override_creds(cred);
   678	
   679		retval = format_corename(&cn, &cprm, &argv, &argc);
   680		if (retval < 0) {
   681			coredump_report_failure("format_corename failed, aborting core");
   682			goto fail_unlock;
   683		}
   684	
   685		switch (cn.core_type) {
   686		case COREDUMP_FILE: {
   687			struct mnt_idmap *idmap;
   688			struct inode *inode;
   689			int open_flags = O_CREAT | O_WRONLY | O_NOFOLLOW |
   690					 O_LARGEFILE | O_EXCL;
   691	
   692			if (cprm.limit < binfmt->min_coredump)
   693				goto fail_unlock;
   694	
   695			if (need_suid_safe && cn.corename[0] != '/') {
   696				coredump_report_failure(
   697					"this process can only dump core to a fully qualified path, skipping core dump");
   698				goto fail_unlock;
   699			}
   700	
   701			/*
   702			 * Unlink the file if it exists unless this is a SUID
   703			 * binary - in that case, we're running around with root
   704			 * privs and don't want to unlink another user's coredump.
   705			 */
   706			if (!need_suid_safe) {
   707				/*
   708				 * If it doesn't exist, that's fine. If there's some
   709				 * other problem, we'll catch it at the filp_open().
   710				 */
   711				do_unlinkat(AT_FDCWD, getname_kernel(cn.corename));
   712			}
   713	
   714			/*
   715			 * There is a race between unlinking and creating the
   716			 * file, but if that causes an EEXIST here, that's
   717			 * fine - another process raced with us while creating
   718			 * the corefile, and the other process won. To userspace,
   719			 * what matters is that at least one of the two processes
   720			 * writes its coredump successfully, not which one.
   721			 */
   722			if (need_suid_safe) {
   723				/*
   724				 * Using user namespaces, normal user tasks can change
   725				 * their current->fs->root to point to arbitrary
   726				 * directories. Since the intention of the "only dump
   727				 * with a fully qualified path" rule is to control where
   728				 * coredumps may be placed using root privileges,
   729				 * current->fs->root must not be used. Instead, use the
   730				 * root directory of init_task.
   731				 */
   732				struct path root;
   733	
   734				task_lock(&init_task);
   735				get_fs_root(init_task.fs, &root);
   736				task_unlock(&init_task);
   737				cprm.file = file_open_root(&root, cn.corename,
   738							   open_flags, 0600);
   739				path_put(&root);
   740			} else {
   741				cprm.file = filp_open(cn.corename, open_flags, 0600);
   742			}
   743			if (IS_ERR(cprm.file))
   744				goto fail_unlock;
   745	
   746			inode = file_inode(cprm.file);
   747			if (inode->i_nlink > 1)
   748				goto close_fail;
   749			if (d_unhashed(cprm.file->f_path.dentry))
   750				goto close_fail;
   751			/*
   752			 * AK: actually i see no reason to not allow this for named
   753			 * pipes etc, but keep the previous behaviour for now.
   754			 */
   755			if (!S_ISREG(inode->i_mode))
   756				goto close_fail;
   757			/*
   758			 * Don't dump core if the filesystem changed owner or mode
   759			 * of the file during file creation. This is an issue when
   760			 * a process dumps core while its cwd is e.g. on a vfat
   761			 * filesystem.
   762			 */
   763			idmap = file_mnt_idmap(cprm.file);
   764			if (!vfsuid_eq_kuid(i_uid_into_vfsuid(idmap, inode),
   765					    current_fsuid())) {
   766				coredump_report_failure("Core dump to %s aborted: "
   767					"cannot preserve file owner", cn.corename);
   768				goto close_fail;
   769			}
   770			if ((inode->i_mode & 0677) != 0600) {
   771				coredump_report_failure("Core dump to %s aborted: "
   772					"cannot preserve file permissions", cn.corename);
   773				goto close_fail;
   774			}
   775			if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
   776				goto close_fail;
   777			if (do_truncate(idmap, cprm.file->f_path.dentry,
   778					0, 0, cprm.file))
   779				goto close_fail;
   780			break;
   781		}
   782		case COREDUMP_PIPE: {
   783			int argi;
   784			int dump_count;
   785			char **helper_argv;
   786			struct subprocess_info *sub_info;
   787	
   788			if (cprm.limit == 1) {
   789				/* See umh_coredump_setup() which sets RLIMIT_CORE = 1.
   790				 *
   791				 * Normally core limits are irrelevant to pipes, since
   792				 * we're not writing to the file system, but we use
   793				 * cprm.limit of 1 here as a special value, this is a
   794				 * consistent way to catch recursive crashes.
   795				 * We can still crash if the core_pattern binary sets
   796				 * RLIM_CORE = !1, but it runs as root, and can do
   797				 * lots of stupid things.
   798				 *
   799				 * Note that we use task_tgid_vnr here to grab the pid
   800				 * of the process group leader.  That way we get the
   801				 * right pid if a thread in a multi-threaded
   802				 * core_pattern process dies.
   803				 */
   804				coredump_report_failure("RLIMIT_CORE is set to 1, aborting core");
   805				goto fail_unlock;
   806			}
   807			cprm.limit = RLIM_INFINITY;
   808	
   809			dump_count = atomic_inc_return(&core_dump_count);
   810			if (core_pipe_limit && (core_pipe_limit < dump_count)) {
   811				coredump_report_failure("over core_pipe_limit, skipping core dump");
   812				goto fail_dropcount;
   813			}
   814	
   815			helper_argv = kmalloc_array(argc + 1, sizeof(*helper_argv),
   816						    GFP_KERNEL);
   817			if (!helper_argv) {
   818				coredump_report_failure("%s failed to allocate memory", __func__);
   819				goto fail_dropcount;
   820			}
   821			for (argi = 0; argi < argc; argi++)
   822				helper_argv[argi] = cn.corename + argv[argi];
   823			helper_argv[argi] = NULL;
   824	
   825			retval = -ENOMEM;
   826			sub_info = call_usermodehelper_setup(helper_argv[0],
   827							helper_argv, NULL, GFP_KERNEL,
   828							umh_coredump_setup, NULL, &cprm);
   829			if (sub_info)
   830				retval = call_usermodehelper_exec(sub_info,
   831								  UMH_WAIT_EXEC);
   832	
   833			kfree(helper_argv);
   834			if (retval) {
   835				coredump_report_failure("|%s pipe failed", cn.corename);
   836				goto close_fail;
   837			}
   838			break;
   839		}
   840		case COREDUMP_SOCK: {
   841			struct file *file __free(fput) = NULL;
   842			struct sockaddr_un unix_addr = {
   843				.sun_family = AF_UNIX,
   844			};
   845			struct sockaddr_storage *addr;
   846	
   847			retval = strscpy(unix_addr.sun_path, cn.corename, sizeof(unix_addr.sun_path));
   848			if (retval < 0)
   849				goto close_fail;
   850	
 > 851			file = __sys_socket_file(AF_UNIX, SOCK_STREAM, 0);
   852			if (IS_ERR(file))
   853				goto close_fail;
   854	
   855			/*
   856			 * It is possible that the userspace process which is
   857			 * supposed to handle the coredump and is listening on
   858			 * the AF_UNIX socket coredumps. This should be fine
   859			 * though. If this was the only process which was
   860			 * listen()ing on the AF_UNIX socket for coredumps it
   861			 * obviously won't be listen()ing anymore by the time it
   862			 * gets here. So the __sys_connect_file() call will
   863			 * often fail with ECONNREFUSED and the coredump.
   864			 *
   865			 * In general though, userspace should just mark itself
   866			 * non dumpable and not do any of this nonsense. We
   867			 * shouldn't work around this.
   868			 */
   869			addr = (struct sockaddr_storage *)(&unix_addr);
 > 870			retval = __sys_connect_file(file, addr, sizeof(unix_addr), O_CLOEXEC);
   871			if (retval)
   872				goto close_fail;
   873	
   874			/* The peer isn't supposed to write and we for sure won't read. */
 > 875			retval =  __sys_shutdown_sock(sock_from_file(file), SHUT_RD);
   876			if (retval)
   877				goto close_fail;
   878	
   879			cprm.file = no_free_ptr(file);
   880			cprm.limit = RLIM_INFINITY;
   881			break;
   882		}
   883		default:
   884			WARN_ON_ONCE(true);
   885			retval = -EINVAL;
   886			goto close_fail;
   887		}
   888	
   889		/* get us an unshared descriptor table; almost always a no-op */
   890		/* The cell spufs coredump code reads the file descriptor tables */
   891		retval = unshare_files();
   892		if (retval)
   893			goto close_fail;
   894		if (!dump_interrupted()) {
   895			/*
   896			 * umh disabled with CONFIG_STATIC_USERMODEHELPER_PATH="" would
   897			 * have this set to NULL.
   898			 */
   899			if (!cprm.file) {
   900				coredump_report_failure("Core dump to |%s disabled", cn.corename);
   901				goto close_fail;
   902			}
   903			if (!dump_vma_snapshot(&cprm))
   904				goto close_fail;
   905	
   906			file_start_write(cprm.file);
   907			core_dumped = binfmt->core_dump(&cprm);
   908			/*
   909			 * Ensures that file size is big enough to contain the current
   910			 * file postion. This prevents gdb from complaining about
   911			 * a truncated file if the last "write" to the file was
   912			 * dump_skip.
   913			 */
   914			if (cprm.to_skip) {
   915				cprm.to_skip--;
   916				dump_emit(&cprm, "", 1);
   917			}
   918			file_end_write(cprm.file);
   919			free_vma_snapshot(&cprm);
   920		}
   921		if ((cn.core_type == COREDUMP_PIPE) && core_pipe_limit)
   922			wait_for_dump_helpers(cprm.file);
   923	close_fail:
   924		if (cprm.file)
   925			filp_close(cprm.file, NULL);
   926	fail_dropcount:
   927		if (cn.core_type == COREDUMP_PIPE)
   928			atomic_dec(&core_dump_count);
   929	fail_unlock:
   930		kfree(argv);
   931		kfree(cn.corename);
   932		coredump_finish(core_dumped);
   933		revert_creds(old_cred);
   934	fail_creds:
   935		put_cred(cred);
   936	fail:
   937		return;
   938	}
   939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
