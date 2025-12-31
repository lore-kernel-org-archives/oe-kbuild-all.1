Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F207415B998
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 22:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767221302; cv=none; b=e18x05BG1oYRjRSxggagwog6V+qoFqb75GfBS21z15S61uaGTDhKHKOuDP6+rlerQMPhms0LAFTbPpl2YUMoEA3AlggiHmQvS0vxxgfxtyFinhogkxlAt8Jr9K2pcQe+M78ptkSXnmebAoA6JTHyRjueWTrvKJ4TzQxq0g0g868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767221302; c=relaxed/simple;
	bh=bDQtrjdZykCWTrz6riuhIMCsrorO3iAUqJAWE0a7sbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WUghLMW/Lhye81MlqqjbFpx80SWPlK4MlwFyTZbpBp9M0YMOT0ltTdDlYNILNaEJ7lwTFWPFtKyoi34on4yrt1V45G91F10iirsPOZBkmlfo/EHiRL1IKbgzl/oQOlj5NZqD75RJd3NT/PYD/hYZ5bN7FNYGNdiQTzXaIwLMZk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zc/QN/ZK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zc/QN/ZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767221301; x=1798757301;
  h=date:from:to:cc:subject:message-id;
  bh=bDQtrjdZykCWTrz6riuhIMCsrorO3iAUqJAWE0a7sbs=;
  b=Zc/QN/ZK28Sn1wdYSinopVhSX1fWBGFbEWvrkZWXAD742znaQ9JTRy0n
   w2WatZQJl/yob7jKcgvjXrLxMMk39lk/ex8UwP8dETXtObnq6u5EVEdUM
   TxIg6Och0RBHHtq//ob4BM/cf7403UCzrcYi5iTdnxZuPYkc1M1L9lPe6
   HDIWyH9aLE8q0NEjeXd0D1Ww/bZOytFib57h1Rl76XE0izZN4bA4VXw7D
   bRa5f3Cr3DQWnqq0lt/EawCAH+MI7O2d9QxfGYEZYpURsVtYwJ2Z3IWSh
   V2fOcEk6sHDovYOIV3+orrlsUz7H9Xi8myXdMgrNDRJuewpgiO5o1RN/2
   A==;
X-CSE-ConnectionGUID: SLiowvKeT/SNdLDBQMxyxw==
X-CSE-MsgGUID: HAU7BfwPREO/QZOrSQzrBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68528890"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="68528890"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 14:48:20 -0800
X-CSE-ConnectionGUID: RqaDHzaJQ+2qZHjOKJuhJg==
X-CSE-MsgGUID: rNpF6C55StG9ZVqnTYeZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="201768535"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Dec 2025 14:48:18 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb4zI-000000001Wh-1TjA;
	Wed, 31 Dec 2025 22:48:16 +0000
Date: Thu, 01 Jan 2026 06:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Jan Kara <jack@suse.cz>
Subject: fs/pidfs.c:279:10: error: unexpected token, expected comma
Message-ID: <202601010626.shzZgUe1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   349bd28a86f2bc33b8c61f6cc7886f45d5c7cda7
commit: 230536ff6b06b199995687aa7fbf164970ebda85 pidfs: support FS_IOC_GETVERSION
date:   1 year, 1 month ago
config: mips-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010626.shzZgUe1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010626.shzZgUe1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010626.shzZgUe1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/pidfs.c:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/pidfs.c:279:10: error: unexpected token, expected comma
     279 |                 return put_user(file_inode(file)->i_generation, argp);
         |                        ^
   arch/mips/include/asm/uaccess.h:71:33: note: expanded from macro 'put_user'
      71 |         access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
         |                                        ^
   arch/mips/include/asm/uaccess.h:136:18: note: expanded from macro '__put_user'
     136 |                 __put_data_asm(user_sw, __pu_ptr);                      \
         |                                ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   fs/pidfs.c:279:10: error: instruction requires a CPU feature not currently enabled
     279 |                 return put_user(file_inode(file)->i_generation, argp);
         |                        ^
   arch/mips/include/asm/uaccess.h:71:33: note: expanded from macro 'put_user'
      71 |         access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
         |                                        ^
   arch/mips/include/asm/uaccess.h:136:18: note: expanded from macro '__put_user'
     136 |                 __put_data_asm(user_sw, __pu_ptr);                      \
         |                                ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         swe $2, 0($17)
         |         ^
   1 warning and 2 errors generated.


vim +279 fs/pidfs.c

   265	
   266	static long pidfd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
   267	{
   268		struct task_struct *task __free(put_task) = NULL;
   269		struct nsproxy *nsp __free(put_nsproxy) = NULL;
   270		struct pid *pid = pidfd_pid(file);
   271		struct ns_common *ns_common = NULL;
   272		struct pid_namespace *pid_ns;
   273	
   274		if (cmd == FS_IOC_GETVERSION) {
   275			if (!arg)
   276				return -EINVAL;
   277	
   278			__u32 __user *argp = (__u32 __user *)arg;
 > 279			return put_user(file_inode(file)->i_generation, argp);
   280		}
   281	
   282		task = get_pid_task(pid, PIDTYPE_PID);
   283		if (!task)
   284			return -ESRCH;
   285	
   286		/* Extensible IOCTL that does not open namespace FDs, take a shortcut */
   287		if (_IOC_NR(cmd) == _IOC_NR(PIDFD_GET_INFO))
   288			return pidfd_info(task, cmd, arg);
   289	
   290		if (arg)
   291			return -EINVAL;
   292	
   293		scoped_guard(task_lock, task) {
   294			nsp = task->nsproxy;
   295			if (nsp)
   296				get_nsproxy(nsp);
   297		}
   298		if (!nsp)
   299			return -ESRCH; /* just pretend it didn't exist */
   300	
   301		/*
   302		 * We're trying to open a file descriptor to the namespace so perform a
   303		 * filesystem cred ptrace check. Also, we mirror nsfs behavior.
   304		 */
   305		if (!ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS))
   306			return -EACCES;
   307	
   308		switch (cmd) {
   309		/* Namespaces that hang of nsproxy. */
   310		case PIDFD_GET_CGROUP_NAMESPACE:
   311			if (IS_ENABLED(CONFIG_CGROUPS)) {
   312				get_cgroup_ns(nsp->cgroup_ns);
   313				ns_common = to_ns_common(nsp->cgroup_ns);
   314			}
   315			break;
   316		case PIDFD_GET_IPC_NAMESPACE:
   317			if (IS_ENABLED(CONFIG_IPC_NS)) {
   318				get_ipc_ns(nsp->ipc_ns);
   319				ns_common = to_ns_common(nsp->ipc_ns);
   320			}
   321			break;
   322		case PIDFD_GET_MNT_NAMESPACE:
   323			get_mnt_ns(nsp->mnt_ns);
   324			ns_common = to_ns_common(nsp->mnt_ns);
   325			break;
   326		case PIDFD_GET_NET_NAMESPACE:
   327			if (IS_ENABLED(CONFIG_NET_NS)) {
   328				ns_common = to_ns_common(nsp->net_ns);
   329				get_net_ns(ns_common);
   330			}
   331			break;
   332		case PIDFD_GET_PID_FOR_CHILDREN_NAMESPACE:
   333			if (IS_ENABLED(CONFIG_PID_NS)) {
   334				get_pid_ns(nsp->pid_ns_for_children);
   335				ns_common = to_ns_common(nsp->pid_ns_for_children);
   336			}
   337			break;
   338		case PIDFD_GET_TIME_NAMESPACE:
   339			if (IS_ENABLED(CONFIG_TIME_NS)) {
   340				get_time_ns(nsp->time_ns);
   341				ns_common = to_ns_common(nsp->time_ns);
   342			}
   343			break;
   344		case PIDFD_GET_TIME_FOR_CHILDREN_NAMESPACE:
   345			if (IS_ENABLED(CONFIG_TIME_NS)) {
   346				get_time_ns(nsp->time_ns_for_children);
   347				ns_common = to_ns_common(nsp->time_ns_for_children);
   348			}
   349			break;
   350		case PIDFD_GET_UTS_NAMESPACE:
   351			if (IS_ENABLED(CONFIG_UTS_NS)) {
   352				get_uts_ns(nsp->uts_ns);
   353				ns_common = to_ns_common(nsp->uts_ns);
   354			}
   355			break;
   356		/* Namespaces that don't hang of nsproxy. */
   357		case PIDFD_GET_USER_NAMESPACE:
   358			if (IS_ENABLED(CONFIG_USER_NS)) {
   359				rcu_read_lock();
   360				ns_common = to_ns_common(get_user_ns(task_cred_xxx(task, user_ns)));
   361				rcu_read_unlock();
   362			}
   363			break;
   364		case PIDFD_GET_PID_NAMESPACE:
   365			if (IS_ENABLED(CONFIG_PID_NS)) {
   366				rcu_read_lock();
   367				pid_ns = task_active_pid_ns(task);
   368				if (pid_ns)
   369					ns_common = to_ns_common(get_pid_ns(pid_ns));
   370				rcu_read_unlock();
   371			}
   372			break;
   373		default:
   374			return -ENOIOCTLCMD;
   375		}
   376	
   377		if (!ns_common)
   378			return -EOPNOTSUPP;
   379	
   380		/* open_namespace() unconditionally consumes the reference */
   381		return open_namespace(ns_common);
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
