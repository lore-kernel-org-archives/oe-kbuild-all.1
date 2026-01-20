Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969293B8BC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899053; cv=none; b=EUwaY8KKSKGkTy0pj8LTdPV5ApbnNwUWHYXn2rEWVPhcpqSH+d3wmh1MIWxjYGbUtWdqtpp3XWrR4ohLMIPXE2PuymDB5nMNmoOEgewbOdQOaY8+s4CQ5jljOVlcbaYxIeM3NB5fkchBhNlEdzW+LLzY7phDQ5VmDJjqOqfpWdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899053; c=relaxed/simple;
	bh=J2oVK7zS6/xtERM78FI8RoewrPdKco8XYh6gAtQP1gk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A+BNOyYPV38MqotgI15QiGC0RZEym7p7NvsvZuahXkZNuMlbGjb1wldjjvNypTDj08jFjLy7yfHBrPG3oIiLNxpgmZ5gTIOjGSMsZVkYmatV55o+pY2WMvAwfXfgTQeO8aGo2pSdH79qkU0W30TbVBUdB55vjhQY5R2xQZqGF6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuPjUCob; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuPjUCob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768899051; x=1800435051;
  h=date:from:to:cc:subject:message-id;
  bh=J2oVK7zS6/xtERM78FI8RoewrPdKco8XYh6gAtQP1gk=;
  b=SuPjUCobBPo5htfveS8xZK6EbqlqTvruwCHTRsZTXlZ1ucTxg+EGofrQ
   lGTRTeG6atPyEA5YXWM8VWM/Bs74asO9CfZRXa9FJJ7terChEtLzkYA94
   VfshPhnQ6GyWNSwIXrsK4lOr/aUWdKS6YrM0etdte49SlNXsaW+sXFZz6
   jenSX1kwEWyCSuWH8Q2RBcVM7rPZVlbLAGhOmtLsHNcnAD8nmLgxpbHsp
   z9+Coqq2pDibB4uWFnzl0Dx60Ve6A+YlZhxQjbXwNnblzWIYAuIUntciT
   g4JRQGeTBJJ3cqIXhkszDWVEZ7Wo/+7Fh7TYrm2QLya9JjQ12zDtwL8y9
   Q==;
X-CSE-ConnectionGUID: 5KDTm1NdSpuiJ28uaSDO6Q==
X-CSE-MsgGUID: WEI+pWB/TF+dlS0zP+kcPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73969035"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="73969035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 00:50:50 -0800
X-CSE-ConnectionGUID: QGMkor6aRWSPHh/2SBNOuA==
X-CSE-MsgGUID: O4WmK2LtRz+a09H7aao7Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205316240"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jan 2026 00:50:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi7Rm-00000000OkH-1AA0;
	Tue, 20 Jan 2026 08:50:46 +0000
Date: Tue, 20 Jan 2026 16:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Subject: arch/riscv/include/asm/syscall_wrapper.h:35:14: warning:
 '__se_sys_open_tree_attr' alias between functions of incompatible types 'long
 int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long
 int(long unsigned int,  long unsigned int,  long ...
Message-ID: <202601201609.Ev0vkaId-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: c4a16820d90199409c9bf01c4f794e1e9e8d8fd8 fs: add open_tree_attr()
date:   11 months ago
config: riscv-randconfig-r063-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201609.Ev0vkaId-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201609.Ev0vkaId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201609.Ev0vkaId-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:94,
                    from fs/namespace.c:11:
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_umount' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:2151:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    2151 | SYSCALL_DEFINE2(umount, char __user *, name, int, flags)
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
      41 |  static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |              ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:2151:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    2151 | SYSCALL_DEFINE2(umount, char __user *, name, int, flags)
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_listmount' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     227 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:5774:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    5774 | SYSCALL_DEFINE4(listmount, const struct mnt_id_req __user *, req,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
      41 |  static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |              ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     227 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:5774:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    5774 | SYSCALL_DEFINE4(listmount, const struct mnt_id_req __user *, req,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_statmount' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     227 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:5667:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    5667 | SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
      41 |  static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |              ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     227 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:5667:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    5667 | SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
         | ^~~~~~~~~~~~~~~
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_open_tree_attr' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:4998:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    4998 | SYSCALL_DEFINE5(open_tree_attr, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
      41 |  static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |              ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:4998:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    4998 | SYSCALL_DEFINE5(open_tree_attr, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_mount_setattr' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:4958:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    4958 | SYSCALL_DEFINE5(mount_setattr, int, dfd, const char __user *, path,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
      41 |  static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |              ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:4958:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    4958 | SYSCALL_DEFINE5(mount_setattr, int, dfd, const char __user *, path,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_pivot_root' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:4482:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    4482 | SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
      41 |  static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |              ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/namespace.c:4482:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    4482 | SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_move_mount' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     235 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)


vim +35 arch/riscv/include/asm/syscall_wrapper.h

a9ad73295cc1e3 Sami Tolvanen 2024-03-11  16  
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  17  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  18  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  19  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  20  
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  21  #define SC_RISCV_REGS_TO_ARGS(x, ...)							\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  22  	__MAP(x,__SC_ARGS								\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  23  	      ,,regs->orig_a0,,regs->a1,,regs->a2					\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  24  	      ,,regs->a3,,regs->a4,,regs->a5,,regs->a6)
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  25  
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  26  #else
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  27  /*
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  28   * Use type aliasing to ensure registers a0-a6 are correctly passed to the syscall
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  29   * implementation when >word-size arguments are used.
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  30   */
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  31  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  32  	__diag_push();									\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  33  	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  34  			"Type aliasing is used to sanitize syscall arguments");		\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11 @35  	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  36  					ulong)						\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  37  			__attribute__((alias(__stringify(___se_##prefix##name))));	\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  38  	__diag_pop();									\
653650c468be21 Sami Tolvanen 2024-03-26  39  	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
653650c468be21 Sami Tolvanen 2024-03-26  40  			__used;								\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  41  	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  42  

:::::: The code at line 35 was first introduced by commit
:::::: a9ad73295cc1e3af0253eee7d08943b2419444c4 riscv: Fix syscall wrapper for >word-size arguments

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
