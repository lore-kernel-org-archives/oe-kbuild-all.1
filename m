Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2289460
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 03:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762140711; cv=none; b=N1S3wrsKsSWVD0HsPNCowtOVgIGGJ5U2z8URxJ7U0twNSTlMvsHa63e+pBpVY0qytQFkfHhG09x3YbTS+fS/FfsunxebGXJPZfObVCCeEn2HjrGueNsWAAqrn4PhMDm8CeB1HJ0ejQu1ZjrqgfwINrodx9krhoamavn53G6NJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762140711; c=relaxed/simple;
	bh=3xvjQ6uhx9lhTl8a+UUH2Ttcd7ivRmA6mQ0tpbYY8+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KgcFRxkI9r+KgiyEACkDCjla61QvBEqTFKkqLSmGWErmG9kNjvdOUE4wD9Bj/FsOptjF0wdFsXj/UVZKXGXDTOOtrGJyLE9OX9N3yj0kJrmjpAOGkLOgqQyp8Qx9t7fNdutG+2dQXxi4nWd7gO5IAcDgehsjiGkW6DZrOYbfIKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egtPNpU2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egtPNpU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762140709; x=1793676709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3xvjQ6uhx9lhTl8a+UUH2Ttcd7ivRmA6mQ0tpbYY8+g=;
  b=egtPNpU21K2oHz39ZDqQdQB0kLpn9MTar2kCPktVG9vBN16RUEf2l9rO
   rohVLghho/1t1nvN4H3h7crw0yF/lqDcq4TRA2c4wa0LMqIlyKG64bYvZ
   tC1rz4h99arX7IGoVo5FcRSUsdP/mRTCgqGBMpjrG0zp/IijDKA7YrcYn
   HF7RTvLPfVMviEQrCxis9t+K76ibrZPhH2mllmQbi41tUGZ8hj2VV1ybc
   b0D+itxGJ6+Ky+i7MeSXg7iYDANqeBdbuVIjzIj81tVoTMWXRMk0VbhBA
   i6qjNKFlLWanDokx1wpAcRaGxg3cxvQlB+u5vuU2gLWOUFoG5VYALhR3i
   Q==;
X-CSE-ConnectionGUID: lhr3hJUoQh6IOhp7yhZrHw==
X-CSE-MsgGUID: DaYh/lNYQjW4UsPmKJbH2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74505037"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="74505037"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 19:31:48 -0800
X-CSE-ConnectionGUID: 6SP2ZDceRk6baDK/LVeV2A==
X-CSE-MsgGUID: OcLbuGN+Tv6BMdWXJLyMAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="191088331"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Nov 2025 19:31:47 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFlID-000PnY-2w;
	Mon, 03 Nov 2025 03:31:43 +0000
Date: Mon, 3 Nov 2025 11:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:for-next 2/15] kernel/trace/trace_syscalls.c:841:7: error:
 '__NR_utimensat' undeclared
Message-ID: <202511031109.dYk1sJ6Y-lkp@intel.com>
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
commit: a544d9a66bdf20eb25cc40f99e1d09c825b71b26 [2/15] tracing: Have syscall trace events read user space string
config: riscv-randconfig-002-20251103 (https://download.01.org/0day-ci/archive/20251103/202511031109.dYk1sJ6Y-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031109.dYk1sJ6Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031109.dYk1sJ6Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_syscalls.c: In function 'check_faultable_syscall':
>> kernel/trace/trace_syscalls.c:841:7: error: '__NR_utimensat' undeclared (first use in this function)
     841 |  case __NR_utimensat:
         |       ^~~~~~~~~~~~~~
   kernel/trace/trace_syscalls.c:841:7: note: each undeclared identifier is reported only once for each function it appears in


vim +/__NR_utimensat +841 kernel/trace/trace_syscalls.c

   700	
   701	/*
   702	 * For system calls that reference user space memory that can
   703	 * be recorded into the event, set the system call meta data's user_mask
   704	 * to the "args" index that points to the user space memory to retrieve.
   705	 */
   706	static void check_faultable_syscall(struct trace_event_call *call, int nr)
   707	{
   708		struct syscall_metadata *sys_data = call->data;
   709	
   710		/* Only work on entry */
   711		if (sys_data->enter_event != call)
   712			return;
   713	
   714		switch (nr) {
   715		/* user arg at position 0 */
   716	#ifdef __NR_access
   717		case __NR_access:
   718	#endif
   719		case __NR_acct:
   720		case __NR_add_key: /* Just _type. TODO add _description */
   721		case __NR_chdir:
   722	#ifdef  __NR_chown
   723		case __NR_chown:
   724	#endif
   725	#ifdef  __NR_chmod
   726		case __NR_chmod:
   727	#endif
   728		case __NR_chroot:
   729	#ifdef __NR_creat
   730		case __NR_creat:
   731	#endif
   732		case __NR_delete_module:
   733		case __NR_execve:
   734		case __NR_fsopen:
   735		case __NR_getxattr: /* Just pathname, TODO add name */
   736	#ifdef __NR_lchown
   737		case __NR_lchown:
   738	#endif
   739		case __NR_lgetxattr: /* Just pathname, TODO add name */
   740		case __NR_lremovexattr: /* Just pathname, TODO add name */
   741	#ifdef __NR_link
   742		case __NR_link: /* Just oldname. TODO add newname */
   743	#endif
   744		case __NR_listxattr: /* Just pathname, TODO add list */
   745		case __NR_llistxattr: /* Just pathname, TODO add list */
   746		case __NR_lsetxattr: /* Just pathname, TODO add list */
   747	#ifdef __NR_open
   748		case __NR_open:
   749	#endif
   750		case __NR_memfd_create:
   751		case __NR_mount: /* Just dev_name, TODO add dir_name and type */
   752	#ifdef __NR_mkdir
   753		case __NR_mkdir:
   754	#endif
   755	#ifdef __NR_mknod
   756		case __NR_mknod:
   757	#endif
   758		case __NR_mq_open:
   759		case __NR_mq_unlink:
   760		case __NR_pivot_root: /* Just new_root, TODO add old_root */
   761	#ifdef __NR_readlink
   762		case __NR_readlink:
   763	#endif
   764		case __NR_removexattr: /* Just pathname, TODO add name */
   765	#ifdef __NR_rename
   766		case __NR_rename: /* Just oldname. TODO add newname */
   767	#endif
   768		case __NR_request_key: /* Just _type. TODO add _description */
   769	#ifdef  __NR_rmdir
   770		case __NR_rmdir:
   771	#endif
   772		case __NR_setxattr: /* Just pathname, TODO add list */
   773		case __NR_shmdt:
   774	#ifdef __NR_statfs
   775		case __NR_statfs:
   776	#endif
   777		case __NR_swapon:
   778		case __NR_swapoff:
   779	#ifdef __NR_symlink
   780		case __NR_symlink: /* Just oldname. TODO add newname */
   781	#endif
   782	#ifdef __NR_truncate
   783		case __NR_truncate:
   784	#endif
   785	#ifdef __NR_unlink
   786		case __NR_unlink:
   787	#endif
   788		case __NR_umount2:
   789	#ifdef __NR_utime
   790		case __NR_utime:
   791	#endif
   792	#ifdef __NR_utimes
   793		case __NR_utimes:
   794	#endif
   795			sys_data->user_mask = BIT(0);
   796			break;
   797		/* user arg at position 1 */
   798		case __NR_execveat:
   799		case __NR_faccessat:
   800		case __NR_faccessat2:
   801		case __NR_finit_module:
   802		case __NR_fchmodat:
   803		case __NR_fchmodat2:
   804		case __NR_fchownat:
   805		case __NR_fgetxattr:
   806		case __NR_flistxattr:
   807		case __NR_fsetxattr:
   808		case __NR_fspick:
   809		case __NR_fremovexattr:
   810	#ifdef __NR_futimesat
   811		case __NR_futimesat:
   812	#endif
   813		case __NR_getxattrat: /* Just pathname, TODO add name */
   814		case __NR_inotify_add_watch:
   815		case __NR_linkat: /* Just oldname. TODO add newname */
   816		case __NR_listxattrat: /* Just pathname, TODO add list */
   817		case __NR_mkdirat:
   818		case __NR_mknodat:
   819		case __NR_mount_setattr:
   820		case __NR_move_mount: /* Just from_pathname, TODO add to_pathname */
   821		case __NR_name_to_handle_at:
   822	#ifdef __NR_newfstatat
   823		case __NR_newfstatat:
   824	#endif
   825		case __NR_openat:
   826		case __NR_openat2:
   827		case __NR_open_tree:
   828		case __NR_open_tree_attr:
   829		case __NR_readlinkat:
   830	#ifdef __NR_renameat
   831		case __NR_renameat: /* Just oldname. TODO add newname */
   832	#endif
   833		case __NR_renameat2: /* Just oldname. TODO add newname */
   834		case __NR_removexattrat: /* Just pathname, TODO add name */
   835		case __NR_quotactl:
   836		case __NR_setxattrat: /* Just pathname, TODO add list */
   837		case __NR_syslog:
   838		case __NR_symlinkat: /* Just oldname. TODO add newname */
   839		case __NR_statx:
   840		case __NR_unlinkat:
 > 841		case __NR_utimensat:
   842			sys_data->user_mask = BIT(1);
   843			break;
   844		/* user arg at position 2 */
   845		case __NR_init_module:
   846		case __NR_fsconfig:
   847			sys_data->user_mask = BIT(2);
   848			break;
   849		/* user arg at position 4 */
   850		case __NR_fanotify_mark:
   851			sys_data->user_mask = BIT(4);
   852			break;
   853		default:
   854			sys_data->user_mask = 0;
   855		}
   856	}
   857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
