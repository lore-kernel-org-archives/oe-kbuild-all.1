Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67B1165F1A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 04:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762145021; cv=none; b=Eb3C7XGU8ONsQiHBf7nanTfbuNJNn6T+Lq0cOWjtUoJ35louS8Mj5avz5q8G1Z4lUSSBqXsvyWKpmb75+y4Seo5IX+1Tb55vl/KTFhKEBxn5tqOKPYEPDhr21E0fRqkQrmmLtwQnfxX/OKrGo8BF3ipaVZd+gzdIKnWw+ghx2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762145021; c=relaxed/simple;
	bh=QU1yN0yaP45TLRuxSJ4L2Sxyb20AzkMbg+ZZNpz28gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+hvrsEucHL7MsIZ8wpGNUvFUmIWz0S8NSD+OdehiEvDh9yCQNaK3A/dwCMwd8wZblDjMMnIH++z38xWWKbd8v6u70qRsmth2j6PhVQO9+bsjWBGvXc6l8drFcWwzU5HA/yBQQMdne9pl6cSBtQI/y8rzKgXKnUW8RtsAHptxZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+7YLI10; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+7YLI10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762145020; x=1793681020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QU1yN0yaP45TLRuxSJ4L2Sxyb20AzkMbg+ZZNpz28gg=;
  b=b+7YLI10Bzdjepf2MZBAZ+TP5yLa6tWf2Vj3bKKBJMWm9Fu6f2tDbbYa
   W9Rq3UkUjxPlf7/Oz2IljLN6dhxYRVaePz5H/PRjCsUhrap66YHwaDmpB
   q/CvHyHuLnU9MfMzROUyPBQdBqB866spfOXqsvBFz1IH3vIgEFzPhTFch
   WnSMMkuI77mMN6yKpkAJDh4J4X1AbeucVx4OOdpjmVfizEWypQwFrkVCB
   60YI3/sX5xb484aUJGMpraFzVnxD+DxSXQoe9oXihHQ1nzjG7XVtE30oA
   vu/1rDJod8x3jR+SNr0Cm5Ca7IlC5tqTE9JdOae8bO3+XWY7zljgk+Ei5
   Q==;
X-CSE-ConnectionGUID: 1Ai7OFpEQv+qov4eh0nPdA==
X-CSE-MsgGUID: M1X+9mmHQniDdBhFbQDyIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="81844169"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="81844169"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 20:43:39 -0800
X-CSE-ConnectionGUID: IYY7P8U1RyiL24YvnLKhDw==
X-CSE-MsgGUID: 5A2ditaOQsCQErme1Lql5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="210304434"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2025 20:43:37 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFmPn-000Ppc-2z;
	Mon, 03 Nov 2025 04:43:35 +0000
Date: Mon, 3 Nov 2025 12:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:for-next 5/15] kernel/trace/trace_syscalls.c:779:7: error:
 '__NR_mq_timedsend' undeclared
Message-ID: <202511031239.ZigDcWzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
head:   7281582a91c6549e6c302a47718a8aa33e27e2df
commit: b4f7624cfc9422209b844793521c60edb289fb69 [5/15] tracing: Have system call events record user array data
config: riscv-randconfig-002-20251103 (https://download.01.org/0day-ci/archive/20251103/202511031239.ZigDcWzY-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031239.ZigDcWzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031239.ZigDcWzY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_syscalls.c: In function 'check_faultable_syscall':
>> kernel/trace/trace_syscalls.c:779:7: error: '__NR_mq_timedsend' undeclared (first use in this function)
     779 |  case __NR_mq_timedsend:
         |       ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_syscalls.c:779:7: note: each undeclared identifier is reported only once for each function it appears in
   kernel/trace/trace_syscalls.c:910:7: error: '__NR_utimensat' undeclared (first use in this function)
     910 |  case __NR_utimensat:
         |       ^~~~~~~~~~~~~~


vim +/__NR_mq_timedsend +779 kernel/trace/trace_syscalls.c

   760	
   761	/*
   762	 * For system calls that reference user space memory that can
   763	 * be recorded into the event, set the system call meta data's user_mask
   764	 * to the "args" index that points to the user space memory to retrieve.
   765	 */
   766	static void check_faultable_syscall(struct trace_event_call *call, int nr)
   767	{
   768		struct syscall_metadata *sys_data = call->data;
   769	
   770		/* Only work on entry */
   771		if (sys_data->enter_event != call)
   772			return;
   773	
   774		sys_data->user_arg_size = -1;
   775	
   776		switch (nr) {
   777		/* user arg 1 with size arg at 2 */
   778		case __NR_write:
 > 779		case __NR_mq_timedsend:
   780		case __NR_pwrite64:
   781			sys_data->user_mask = BIT(1);
   782			sys_data->user_arg_size = 2;
   783			break;
   784		/* user arg at position 0 */
   785	#ifdef __NR_access
   786		case __NR_access:
   787	#endif
   788		case __NR_acct:
   789		case __NR_add_key: /* Just _type. TODO add _description */
   790		case __NR_chdir:
   791	#ifdef  __NR_chown
   792		case __NR_chown:
   793	#endif
   794	#ifdef  __NR_chmod
   795		case __NR_chmod:
   796	#endif
   797		case __NR_chroot:
   798	#ifdef __NR_creat
   799		case __NR_creat:
   800	#endif
   801		case __NR_delete_module:
   802		case __NR_execve:
   803		case __NR_fsopen:
   804		case __NR_getxattr: /* Just pathname, TODO add name */
   805	#ifdef __NR_lchown
   806		case __NR_lchown:
   807	#endif
   808		case __NR_lgetxattr: /* Just pathname, TODO add name */
   809		case __NR_lremovexattr: /* Just pathname, TODO add name */
   810	#ifdef __NR_link
   811		case __NR_link: /* Just oldname. TODO add newname */
   812	#endif
   813		case __NR_listxattr: /* Just pathname, TODO add list */
   814		case __NR_llistxattr: /* Just pathname, TODO add list */
   815		case __NR_lsetxattr: /* Just pathname, TODO add list */
   816	#ifdef __NR_open
   817		case __NR_open:
   818	#endif
   819		case __NR_memfd_create:
   820		case __NR_mount: /* Just dev_name, TODO add dir_name and type */
   821	#ifdef __NR_mkdir
   822		case __NR_mkdir:
   823	#endif
   824	#ifdef __NR_mknod
   825		case __NR_mknod:
   826	#endif
   827		case __NR_mq_open:
   828		case __NR_mq_unlink:
   829		case __NR_pivot_root: /* Just new_root, TODO add old_root */
   830	#ifdef __NR_readlink
   831		case __NR_readlink:
   832	#endif
   833		case __NR_removexattr: /* Just pathname, TODO add name */
   834	#ifdef __NR_rename
   835		case __NR_rename: /* Just oldname. TODO add newname */
   836	#endif
   837		case __NR_request_key: /* Just _type. TODO add _description */
   838	#ifdef  __NR_rmdir
   839		case __NR_rmdir:
   840	#endif
   841		case __NR_setxattr: /* Just pathname, TODO add list */
   842		case __NR_shmdt:
   843	#ifdef __NR_statfs
   844		case __NR_statfs:
   845	#endif
   846		case __NR_swapon:
   847		case __NR_swapoff:
   848	#ifdef __NR_symlink
   849		case __NR_symlink: /* Just oldname. TODO add newname */
   850	#endif
   851	#ifdef __NR_truncate
   852		case __NR_truncate:
   853	#endif
   854	#ifdef __NR_unlink
   855		case __NR_unlink:
   856	#endif
   857		case __NR_umount2:
   858	#ifdef __NR_utime
   859		case __NR_utime:
   860	#endif
   861	#ifdef __NR_utimes
   862		case __NR_utimes:
   863	#endif
   864			sys_data->user_mask = BIT(0);
   865			break;
   866		/* user arg at position 1 */
   867		case __NR_execveat:
   868		case __NR_faccessat:
   869		case __NR_faccessat2:
   870		case __NR_finit_module:
   871		case __NR_fchmodat:
   872		case __NR_fchmodat2:
   873		case __NR_fchownat:
   874		case __NR_fgetxattr:
   875		case __NR_flistxattr:
   876		case __NR_fsetxattr:
   877		case __NR_fspick:
   878		case __NR_fremovexattr:
   879	#ifdef __NR_futimesat
   880		case __NR_futimesat:
   881	#endif
   882		case __NR_getxattrat: /* Just pathname, TODO add name */
   883		case __NR_inotify_add_watch:
   884		case __NR_linkat: /* Just oldname. TODO add newname */
   885		case __NR_listxattrat: /* Just pathname, TODO add list */
   886		case __NR_mkdirat:
   887		case __NR_mknodat:
   888		case __NR_mount_setattr:
   889		case __NR_move_mount: /* Just from_pathname, TODO add to_pathname */
   890		case __NR_name_to_handle_at:
   891	#ifdef __NR_newfstatat
   892		case __NR_newfstatat:
   893	#endif
   894		case __NR_openat:
   895		case __NR_openat2:
   896		case __NR_open_tree:
   897		case __NR_open_tree_attr:
   898		case __NR_readlinkat:
   899	#ifdef __NR_renameat
   900		case __NR_renameat: /* Just oldname. TODO add newname */
   901	#endif
   902		case __NR_renameat2: /* Just oldname. TODO add newname */
   903		case __NR_removexattrat: /* Just pathname, TODO add name */
   904		case __NR_quotactl:
   905		case __NR_setxattrat: /* Just pathname, TODO add list */
   906		case __NR_syslog:
   907		case __NR_symlinkat: /* Just oldname. TODO add newname */
   908		case __NR_statx:
   909		case __NR_unlinkat:
   910		case __NR_utimensat:
   911			sys_data->user_mask = BIT(1);
   912			break;
   913		/* user arg at position 2 */
   914		case __NR_init_module:
   915		case __NR_fsconfig:
   916			sys_data->user_mask = BIT(2);
   917			break;
   918		/* user arg at position 4 */
   919		case __NR_fanotify_mark:
   920			sys_data->user_mask = BIT(4);
   921			break;
   922		default:
   923			sys_data->user_mask = 0;
   924		}
   925	}
   926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
