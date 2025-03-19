Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920670808
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 22:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742423678; cv=none; b=lJCafjnxynsCFn5VZa2tD/wG+sFdxaKhpL8wocq7oXNKrgsu+ktuzs2T11pq73aZGNnyU/pywq8oDedU6IPYtDPIefdn5+GNbswv3chVerkSza3Pc8d5JM6k2zrJbq3PkaPcpi+y1w4wKDGhN2ZpaNBQgobEHiad6jfM0uhsvRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742423678; c=relaxed/simple;
	bh=b16P64Qh6YhADfVXFxHu2fQFudGhdMa7C2N5XU7lO5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cU8NvxYcxBn3dUBR4kDZ7JR7GGKMVh9Q1IPMF4bIvlsGkG0Romz9voNO6G5a46p9Iwqge0GhKKYZzJzKW2wFi0XNwFZ9MzoH8+G4D+VFsz0be2Rv4Ujc0E4kWBnoCpDwZjoucETzb0z9Z3yucs2T7g3hiE3WU79ytNKupbjxrdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYTp++xL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYTp++xL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742423677; x=1773959677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b16P64Qh6YhADfVXFxHu2fQFudGhdMa7C2N5XU7lO5I=;
  b=FYTp++xLmkB7/KNhlEuKtfygvnnkLGtKvmcOcQEEHntve5HoomTiGCCF
   OA8pbtLuJ769nB1gx3GsRk1emtCmZyKKU82NSte5baSk92iiNbgkGTg/y
   2I5QMFWqIGkbOs2oFLX5RXHoqZZM9Y3EvB3h6QVLMKRTrVBHr0jhqrkEh
   OF8+f2e9AklShaf8krJ/iJ2G2mFgsweB4mrZaDwzByYreHSHK8SfYmk+w
   d4AMk4fol81So4ES/tK0Wpyiw9V16YQ23E1qzAgebJrc86xYvOSKHatVf
   5lCQFlywYCIICJWEC7R9WXOQteREVXio9/helgoeHPFv1dplSGYdRj7jT
   Q==;
X-CSE-ConnectionGUID: 0HelnisQROKoNbe6mBlwag==
X-CSE-MsgGUID: vJzetHKmSAqiGs0+m1Z1WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43747640"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="43747640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 15:34:36 -0700
X-CSE-ConnectionGUID: cPEY3hooSZuLjKP5Z4BIIw==
X-CSE-MsgGUID: epNdSxYzTBe1jSEdJwa9kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="128043317"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Mar 2025 15:34:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv1zc-000Fia-0B;
	Wed, 19 Mar 2025 22:34:32 +0000
Date: Thu, 20 Mar 2025 06:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Subject: [linux-next:master 2350/12447]
 arch/riscv/include/asm/syscall_wrapper.h:35:14: warning:
 '__se_sys_open_tree_attr' alias between functions of incompatible types
 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long
 int(long unsigned int,  long unsigned int,  long ...
Message-ID: <202503200652.fcCCg9qO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
commit: c4a16820d90199409c9bf01c4f794e1e9e8d8fd8 [2350/12447] fs: add open_tree_attr()
config: riscv-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200652.fcCCg9qO-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200652.fcCCg9qO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200652.fcCCg9qO-lkp@intel.com/

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
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_umount' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:2151:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(umount, char __user *, name, int, flags)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:2151:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(umount, char __user *, name, int, flags)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_listmount' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:5774:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(listmount, const struct mnt_id_req __user *, req,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:5774:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(listmount, const struct mnt_id_req __user *, req,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_statmount' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:5667:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:5667:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
    ^~~~~~~~~~~~~~~
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_open_tree_attr' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:4998:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(open_tree_attr, int, dfd, const char __user *, filename,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:4998:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(open_tree_attr, int, dfd, const char __user *, filename,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_mount_setattr' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:4958:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(mount_setattr, int, dfd, const char __user *, path,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:4958:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(mount_setattr, int, dfd, const char __user *, path,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_pivot_root' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:4482:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:4482:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_move_mount' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)


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
