Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2FEA5F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680778193; x=1712314193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UnMgpHzKhYsfjddHEgIywK+XtxAeIBrPsXeRDyUk1sg=;
  b=RPjH37erWak5iWT6HVTProtKIghzbhBSzUj1j5p3dTuor9JvW/b5Zh2D
   Q0tYNWbvU/mB2hiCzSL/tggY9HX4gv7y0rsWrx2nCVXKPPS39p9NMl7iO
   ACRcSaRKUp1Kn7tzqzdwkDIwe8VakfVcP1DfhTT2FpHQxeoLLd4HmXqde
   wSXp3krZtU7cX+qdIJbWhaTLGip4xc8U0pBSGr2TW38DY9Prd9184rfYH
   s2UOXBAOnxWq0jQuBLUQGiXsJepv7QbKTOQ8qkGKR9IlYtH/BG1ykJDOK
   4vNivqc+sCAduMb7xSgFbQOlTIpLUfUx+i7bEuo2Fnl/l4CwoJ+50ut3n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="344438354"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="344438354"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 03:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="861361726"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="861361726"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Apr 2023 03:49:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkNBc-000RJS-0y;
	Thu, 06 Apr 2023 10:49:48 +0000
Date: Thu, 6 Apr 2023 18:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:lam-old 5/18] arch/x86/kernel/process.c:279:16: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202304061812.xr2ysFdz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git lam-old
head:   e64abde4d7ab69eee2b4d11651d989c451930292
commit: a94e74d3666c7519881ae8b80afb7bbf34d9a9c7 [5/18] x86/uaccess: Provide untagged_addr() and remove tags before address check
config: x86_64-randconfig-s053-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061812.xr2ysFdz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git/commit/?id=a94e74d3666c7519881ae8b80afb7bbf34d9a9c7
        git remote add kas https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git
        git fetch --no-tags kas lam-old
        git checkout a94e74d3666c7519881ae8b80afb7bbf34d9a9c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/entry/vsyscall/ arch/x86/kernel/ arch/x86/mm/ drivers/acpi/ drivers/char/ drivers/fpga/ drivers/hid/ drivers/hwmon/ drivers/i2c/ drivers/input/ drivers/mtd/ drivers/pps/ drivers/rtc/ drivers/spi/ drivers/tty/ drivers/usb/core/ drivers/usb/misc/sisusbvga/ drivers/usb/mon/ drivers/watchdog/ fs/ kernel/ net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061812.xr2ysFdz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/read_write.c:1297:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   fs/read_write.c:1297:21: sparse:     expected long [noderef] __user *__ptr_clean
   fs/read_write.c:1297:21: sparse:     got long *
   fs/read_write.c:1301:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   fs/read_write.c:1301:21: sparse:     expected long [noderef] __user *__ptr_clean
   fs/read_write.c:1301:21: sparse:     got long *
>> fs/read_write.c:1318:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long long [noderef] __user *__ptr_clean @@     got long long * @@
   fs/read_write.c:1318:21: sparse:     expected long long [noderef] __user *__ptr_clean
   fs/read_write.c:1318:21: sparse:     got long long *
--
>> fs/exec.c:419:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *const [noderef] __user *__ptr_clean @@     got char const [noderef] __user *const * @@
   fs/exec.c:419:13: sparse:     expected char const [noderef] __user *const [noderef] __user *__ptr_clean
   fs/exec.c:419:13: sparse:     got char const [noderef] __user *const *
   fs/exec.c:420:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __user * @@     got void * @@
   fs/exec.c:420:31: sparse:     expected char const [noderef] __user *
   fs/exec.c:420:31: sparse:     got void *
   fs/exec.c:1045:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *oldsighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1045:48: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1045:48: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   fs/exec.c:1152:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1152:56: sparse:     expected struct task_struct *parent
   fs/exec.c:1152:56: sparse:     got struct task_struct [noderef] __rcu *parent
   fs/exec.c:1187:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *oldsighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1187:47: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1187:47: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   fs/exec.c:1759:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1759:70: sparse:     expected struct task_struct *tsk
   fs/exec.c:1759:70: sparse:     got struct task_struct [noderef] __rcu *parent
--
>> fs/fcntl.c:258:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/fcntl.c:258:16: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/fcntl.c:258:16: sparse:     got unsigned int *
   fs/fcntl.c:259:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/fcntl.c:259:16: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/fcntl.c:259:16: sparse:     got unsigned int *
   fs/fcntl.c:931:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:931:9: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:931:9: sparse:    struct fasync_struct *
   fs/fcntl.c:1006:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1006:22: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1006:22: sparse:    struct fasync_struct *
   fs/fcntl.c:1017:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1017:33: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1017:33: sparse:    struct fasync_struct *
--
>> fs/ioctl.c:69:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/ioctl.c:69:17: sparse:     expected int [noderef] __user *__ptr_clean
   fs/ioctl.c:69:17: sparse:     got int *
   fs/ioctl.c:91:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/ioctl.c:91:13: sparse:     expected int [noderef] __user *__ptr_clean
   fs/ioctl.c:91:13: sparse:     got int *
   fs/ioctl.c:346:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/ioctl.c:346:17: sparse:     expected int [noderef] __user *__ptr_clean
   fs/ioctl.c:346:17: sparse:     got int *
   fs/ioctl.c:370:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/ioctl.c:370:17: sparse:     expected int [noderef] __user *__ptr_clean
   fs/ioctl.c:370:17: sparse:     got int *
>> fs/ioctl.c:424:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] __user *__ptr_clean @@     got unsigned short * @@
   fs/ioctl.c:424:13: sparse:     expected unsigned short [noderef] __user *__ptr_clean
   fs/ioctl.c:424:13: sparse:     got unsigned short *
>> fs/ioctl.c:711:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/ioctl.c:711:23: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/ioctl.c:711:23: sparse:     got unsigned int *
   fs/ioctl.c:723:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/ioctl.c:723:15: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/ioctl.c:723:15: sparse:     got unsigned int *
   fs/ioctl.c:817:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/ioctl.c:817:24: sparse:     expected int [noderef] __user *__ptr_clean
   fs/ioctl.c:817:24: sparse:     got int *
   fs/ioctl.c:832:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/ioctl.c:832:24: sparse:     expected int [noderef] __user *__ptr_clean
   fs/ioctl.c:832:24: sparse:     got int *
--
>> fs/pipe.c:626:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/pipe.c:626:24: sparse:     expected int [noderef] __user *__ptr_clean
   fs/pipe.c:626:24: sparse:     got int *
--
>> fs/readdir.c:293:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   fs/readdir.c:293:21: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   fs/readdir.c:293:21: sparse:     got unsigned long *
>> fs/readdir.c:377:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed long long [noderef] __user *__ptr_clean @@     got signed long long * @@
   fs/readdir.c:377:21: sparse:     expected signed long long [noderef] __user *__ptr_clean
   fs/readdir.c:377:21: sparse:     got signed long long *
--
   fs/file.c:379:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:379:17: sparse:     expected struct file **old_fds
   fs/file.c:379:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:380:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:380:17: sparse:     expected struct file **new_fds
   fs/file.c:380:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:395:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:395:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:395:17: sparse:    struct file *
   fs/file.c:430:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   fs/file.c:470:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:645:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:838:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:1101:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@
>> fs/file.c:1174:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
--
>> fs/namespace.c:3261:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   fs/namespace.c:3261:21: sparse:     expected char const [noderef] __user *__ptr_clean
   fs/namespace.c:3261:21: sparse:     got char const *
--
>> fs/utimes.c:273:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   fs/utimes.c:273:21: sparse:     expected signed int [noderef] __user *__ptr_clean
   fs/utimes.c:273:21: sparse:     got signed int *
   fs/utimes.c:274:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   fs/utimes.c:274:21: sparse:     expected signed int [noderef] __user *__ptr_clean
   fs/utimes.c:274:21: sparse:     got signed int *
   fs/utimes.c:275:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   fs/utimes.c:275:21: sparse:     expected signed int [noderef] __user *__ptr_clean
   fs/utimes.c:275:21: sparse:     got signed int *
   fs/utimes.c:276:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   fs/utimes.c:276:21: sparse:     expected signed int [noderef] __user *__ptr_clean
   fs/utimes.c:276:21: sparse:     got signed int *
>> fs/utimes.c:219:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   fs/utimes.c:219:21: sparse:     expected long [noderef] __user *__ptr_clean
   fs/utimes.c:219:21: sparse:     got long *
   fs/utimes.c:220:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   fs/utimes.c:220:21: sparse:     expected long [noderef] __user *__ptr_clean
   fs/utimes.c:220:21: sparse:     got long *
   fs/utimes.c:241:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   fs/utimes.c:241:21: sparse:     expected signed int [noderef] __user *__ptr_clean
   fs/utimes.c:241:21: sparse:     got signed int *
   fs/utimes.c:242:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   fs/utimes.c:242:21: sparse:     expected signed int [noderef] __user *__ptr_clean
   fs/utimes.c:242:21: sparse:     got signed int *
--
>> fs/nsfs.c:211:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/nsfs.c:211:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/nsfs.c:211:24: sparse:     got unsigned int *
--
>> fs/timerfd.c:316:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   fs/timerfd.c:316:23: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   fs/timerfd.c:316:23: sparse:     got unsigned long long *
--
>> fs/fhandle.c:72:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/fhandle.c:72:13: sparse:     expected int [noderef] __user *__ptr_clean
   fs/fhandle.c:72:13: sparse:     got int *
--
>> fs/binfmt_elf.c:326:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   fs/binfmt_elf.c:326:13: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   fs/binfmt_elf.c:326:13: sparse:     got unsigned long long *
   fs/binfmt_elf.c:333:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   fs/binfmt_elf.c:333:21: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   fs/binfmt_elf.c:333:21: sparse:     got unsigned long long *
   fs/binfmt_elf.c:340:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   fs/binfmt_elf.c:340:13: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   fs/binfmt_elf.c:340:13: sparse:     got unsigned long long *
   fs/binfmt_elf.c:348:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   fs/binfmt_elf.c:348:21: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   fs/binfmt_elf.c:348:21: sparse:     got unsigned long long *
   fs/binfmt_elf.c:355:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   fs/binfmt_elf.c:355:13: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   fs/binfmt_elf.c:355:13: sparse:     got unsigned long long *
--
   kernel/fork.c:1310:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file [noderef] __rcu *__ret @@     got struct file *new_exe_file @@
   kernel/fork.c:1310:24: sparse:     expected struct file [noderef] __rcu *__ret
   kernel/fork.c:1310:24: sparse:     got struct file *new_exe_file
   kernel/fork.c:1310:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] old_exe_file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   kernel/fork.c:1310:22: sparse:     expected struct file *[assigned] old_exe_file
   kernel/fork.c:1310:22: sparse:     got struct file [noderef] __rcu *[assigned] __ret
>> kernel/fork.c:1474:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/fork.c:1474:25: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/fork.c:1474:25: sparse:     got int *
   kernel/fork.c:1637:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1637:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1637:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1646:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1646:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1646:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1647:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1647:9: sparse:     expected void const *from
   kernel/fork.c:1647:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1648:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1648:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1648:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2074:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2074:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2074:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2078:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2078:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2078:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2298:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/fork.c:2298:26: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/fork.c:2298:26: sparse:     got int *
   kernel/fork.c:2398:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2398:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2398:32: sparse:     got struct task_struct *
   kernel/fork.c:2407:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2407:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2407:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2454:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2454:54: sparse:     expected struct list_head *head
   kernel/fork.c:2454:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2476:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2476:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2476:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2497:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2497:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2497:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2524:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2524:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2524:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2553:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2553:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2553:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2555:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2555:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2555:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2682:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/fork.c:2682:17: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/fork.c:2682:17: sparse:     got int *
   kernel/fork.c:2993:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2993:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:2993:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3078:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3078:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3078:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1742:9: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2119:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2452:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2453:59: sparse: sparse: dereference of noderef expression
--
   kernel/exit.c:286:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:286:37: sparse:     expected struct task_struct *tsk
   kernel/exit.c:286:37: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:289:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:289:32: sparse:     expected struct task_struct *task
   kernel/exit.c:289:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:290:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:290:35: sparse:     expected struct task_struct *task
   kernel/exit.c:290:35: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:335:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:335:24: sparse:     expected struct task_struct *parent
   kernel/exit.c:335:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:362:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:362:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:362:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:365:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:365:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:365:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:589:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:589:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:589:29: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:591:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:591:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:591:29: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:744:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:744:45: sparse:     expected struct sighand_struct *sighand
   kernel/exit.c:744:45: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/exit.c:934:63: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *const sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:934:63: sparse:     expected struct sighand_struct *const sighand
   kernel/exit.c:934:63: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/exit.c:1089:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1089:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1089:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1114:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1114:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1114:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1203:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1203:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1203:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1218:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1218:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1218:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1269:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1269:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1269:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1272:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1272:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1272:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1278:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1278:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1278:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1459:59: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/exit.c:1459:59: sparse:    void *
   kernel/exit.c:1459:59: sparse:    struct task_struct [noderef] __rcu *
   kernel/exit.c:1475:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu * @@
   kernel/exit.c:1475:25: sparse:     expected struct task_struct *parent
   kernel/exit.c:1475:25: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/exit.c:1708:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/exit.c:1708:37: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/exit.c:1708:37: sparse:     got int *
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/sched/task.h:110:21: sparse: sparse: context imbalance in 'wait_task_zombie' - unexpected unlock
   include/linux/sched/task.h:110:21: sparse: sparse: context imbalance in 'wait_task_stopped' - unexpected unlock
   include/linux/sched/task.h:110:21: sparse: sparse: context imbalance in 'wait_task_continued' - unexpected unlock
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c:1567:9: sparse: sparse: context imbalance in 'do_wait' - wrong count at exit
--
>> kernel/capability.c:86:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/capability.c:86:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/capability.c:86:13: sparse:     got unsigned int *
   kernel/capability.c:101:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/capability.c:101:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/capability.c:101:21: sparse:     got unsigned int *
>> kernel/capability.c:159:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/capability.c:159:13: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/capability.c:159:13: sparse:     got int *
   kernel/capability.c:195:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct __user_cap_data_struct [noderef] __user * @@
   kernel/capability.c:195:43: sparse:     expected void const *from
   kernel/capability.c:195:43: sparse:     got struct __user_cap_data_struct [noderef] __user *
   kernel/capability.c:171:30: sparse: sparse: dereference of noderef expression
   kernel/capability.c:172:30: sparse: sparse: dereference of noderef expression
   kernel/capability.c:173:30: sparse: sparse: dereference of noderef expression
   kernel/capability.c:235:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/capability.c:235:13: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/capability.c:235:13: sparse:     got int *
   kernel/capability.c:246:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got struct __user_cap_data_struct [noderef] __user ( * )[2] @@
   kernel/capability.c:246:29: sparse:     expected void *to
   kernel/capability.c:246:29: sparse:     got struct __user_cap_data_struct [noderef] __user ( * )[2]
   kernel/capability.c:250:41: sparse: sparse: dereference of noderef expression
   kernel/capability.c:251:41: sparse: sparse: dereference of noderef expression
   kernel/capability.c:252:43: sparse: sparse: dereference of noderef expression
--
   kernel/ptrace.c:54:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:54:22: sparse:    struct task_struct *
   kernel/ptrace.c:54:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:73:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *parent @@     got struct task_struct *new_parent @@
   kernel/ptrace.c:73:23: sparse:     expected struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:73:23: sparse:     got struct task_struct *new_parent
   kernel/ptrace.c:74:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *ptracer_cred @@     got struct cred const * @@
   kernel/ptrace.c:74:29: sparse:     expected struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:74:29: sparse:     got struct cred const *
   kernel/ptrace.c:128:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   kernel/ptrace.c:128:18: sparse:     expected struct cred const *old_cred
   kernel/ptrace.c:128:18: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:132:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:132:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:132:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:170:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:170:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:170:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:202:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:202:28: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:202:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:208:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:208:30: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:208:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:261:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:261:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:261:44: sparse:    struct task_struct *
   kernel/ptrace.c:452:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:452:24: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:452:24: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:477:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:477:26: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:477:26: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:513:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/ptrace.c:513:54: sparse:     expected struct task_struct *parent
   kernel/ptrace.c:513:54: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:521:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:521:53: sparse:     expected struct task_struct *new_parent
   kernel/ptrace.c:521:53: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:569:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:569:41: sparse:     expected struct task_struct *p1
   kernel/ptrace.c:569:41: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:571:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sigh @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/ptrace.c:571:50: sparse:     expected struct sighand_struct *sigh
   kernel/ptrace.c:571:50: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/ptrace.c:762:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:762:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:762:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:770:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:770:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:770:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:881:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:881:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:881:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:885:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:885:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:885:31: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/ptrace.c:1055:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   kernel/ptrace.c:1055:23: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   kernel/ptrace.c:1055:23: sparse:     got unsigned long *
   kernel/ptrace.c:1115:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1115:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1115:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1117:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1117:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1117:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1315:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   kernel/ptrace.c:1315:16: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   kernel/ptrace.c:1315:16: sparse:     got unsigned long *
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:753:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:753:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:753:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:519:38: sparse: sparse: dereference of noderef expression
   include/linux/sched/signal.h:753:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:753:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:753:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:709:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:753:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:753:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:753:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:725:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:753:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:753:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:753:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:753:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:753:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:753:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1266:9: sparse: sparse: context imbalance in 'ptrace_request' - different lock contexts for basic block
--
>> kernel/sys.c:1980:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:1980:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:1980:24: sparse:     got unsigned int *
>> kernel/sys.c:2247:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *[noderef] __user *__ptr_clean @@     got int [noderef] __user ** @@
   kernel/sys.c:2247:16: sparse:     expected int [noderef] __user *[noderef] __user *__ptr_clean
   kernel/sys.c:2247:16: sparse:     got int [noderef] __user **
   kernel/sys.c:745:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:745:18: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:745:18: sparse:     got unsigned int *
   kernel/sys.c:747:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:747:26: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:747:26: sparse:     got unsigned int *
   kernel/sys.c:749:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:749:32: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:749:32: sparse:     got unsigned int *
   kernel/sys.c:828:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:828:18: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:828:18: sparse:     got unsigned int *
   kernel/sys.c:830:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:830:26: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:830:26: sparse:     got unsigned int *
   kernel/sys.c:832:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:832:34: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:832:34: sparse:     got unsigned int *
   kernel/sys.c:1084:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sys.c:1084:32: sparse:     expected struct task_struct *p1
   kernel/sys.c:1084:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/sys.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:753:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:753:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:753:37: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/sys.c:2372:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/sys.c:2372:25: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/sys.c:2372:25: sparse:     got int *
   kernel/sys.c:2508:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/sys.c:2508:25: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/sys.c:2508:25: sparse:     got int *
   kernel/sys.c:2643:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:2643:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:2643:24: sparse:     got unsigned int *
   kernel/sys.c:2645:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sys.c:2645:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sys.c:2645:24: sparse:     got unsigned int *
--
>> kernel/groups.c:47:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/groups.c:47:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/groups.c:47:21: sparse:     got unsigned int *
   kernel/groups.c:64:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/groups.c:64:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/groups.c:64:21: sparse:     got unsigned int *
--
>> kernel/kcov.c:718:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/kcov.c:718:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/kcov.c:718:21: sparse:     got unsigned int *
--
>> net/socket.c:1227:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/socket.c:1227:29: sparse:     expected int [noderef] __user *__ptr_clean
   net/socket.c:1227:29: sparse:     got int *
   net/socket.c:1233:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/socket.c:1233:31: sparse:     expected int [noderef] __user *__ptr_clean
   net/socket.c:1233:31: sparse:     got int *
   net/socket.c:278:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/socket.c:278:15: sparse:     expected int [noderef] __user *__ptr_clean
   net/socket.c:278:15: sparse:     got int *
   net/socket.c:1685:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/socket.c:1685:15: sparse:     expected int [noderef] __user *__ptr_clean
   net/socket.c:1685:15: sparse:     got int *
   net/socket.c:1689:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/socket.c:1689:15: sparse:     expected int [noderef] __user *__ptr_clean
   net/socket.c:1689:15: sparse:     got int *
>> net/socket.c:2627:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   net/socket.c:2627:31: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   net/socket.c:2627:31: sparse:     got unsigned int *
   net/socket.c:2843:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   net/socket.c:2843:31: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   net/socket.c:2843:31: sparse:     got unsigned int *
--
>> drivers/char/random.c:1386:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/char/random.c:1386:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/char/random.c:1386:21: sparse:     got int *
   drivers/char/random.c:1392:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/char/random.c:1392:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/char/random.c:1392:21: sparse:     got int *
   drivers/char/random.c:1406:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/char/random.c:1406:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/char/random.c:1406:21: sparse:     got int *
   drivers/char/random.c:1410:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/char/random.c:1410:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/char/random.c:1410:21: sparse:     got int *
--
>> arch/x86/kernel/process_64.c:811:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   arch/x86/kernel/process_64.c:811:23: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   arch/x86/kernel/process_64.c:811:23: sparse:     got unsigned long *
   arch/x86/kernel/process_64.c:817:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   arch/x86/kernel/process_64.c:817:23: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   arch/x86/kernel/process_64.c:817:23: sparse:     got unsigned long *
--
>> arch/x86/kernel/traps.c:623:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   arch/x86/kernel/traps.c:623:13: sparse:     expected char const [noderef] __user *__ptr_clean
   arch/x86/kernel/traps.c:623:13: sparse:     got char const *
--
>> arch/x86/kernel/process.c:279:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   arch/x86/kernel/process.c:279:16: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   arch/x86/kernel/process.c:279:16: sparse:     got unsigned int *
   arch/x86/kernel/process.c:758:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct cpuinfo_x86 * @@
   arch/x86/kernel/process.c:758:26: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/process.c:758:26: sparse:     got struct cpuinfo_x86 *
--
>> arch/x86/kernel/ptrace.c:741:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   arch/x86/kernel/ptrace.c:741:23: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   arch/x86/kernel/ptrace.c:741:23: sparse:     got unsigned long *
--
>> net/core/scm.c:324:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/core/scm.c:324:23: sparse:     expected int [noderef] __user *__ptr_clean
   net/core/scm.c:324:23: sparse:     got int *
   net/core/scm.c:326:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/core/scm.c:326:31: sparse:     expected int [noderef] __user *__ptr_clean
   net/core/scm.c:326:31: sparse:     got int *
>> net/core/scm.c:328:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   net/core/scm.c:328:31: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   net/core/scm.c:328:31: sparse:     got unsigned long *
--
>> net/core/dev_ioctl.c:81:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/core/dev_ioctl.c:81:16: sparse:     expected int [noderef] __user *__ptr_clean
   net/core/dev_ioctl.c:81:16: sparse:     got int *
--
>> arch/x86/mm/fault.c:152:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   arch/x86/mm/fault.c:152:29: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   arch/x86/mm/fault.c:152:29: sparse:     got unsigned char *
--
>> drivers/fpga/dfl.c:1837:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/fpga/dfl.c:1837:16: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/fpga/dfl.c:1837:16: sparse:     got unsigned int *
--
>> drivers/fpga/dfl-fme-main.c:143:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/fpga/dfl-fme-main.c:143:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/fpga/dfl-fme-main.c:143:13: sparse:     got int *
   drivers/fpga/dfl-fme-main.c:155:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/fpga/dfl-fme-main.c:155:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/fpga/dfl-fme-main.c:155:13: sparse:     got int *
--
>> fs/crypto/keyring.c:1095:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/crypto/keyring.c:1095:23: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/crypto/keyring.c:1095:23: sparse:     got unsigned int *
--
>> fs/crypto/policy.c:474:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char const [noderef] __user *__ptr_clean @@     got unsigned char const * @@
   fs/crypto/policy.c:474:13: sparse:     expected unsigned char const [noderef] __user *__ptr_clean
   fs/crypto/policy.c:474:13: sparse:     got unsigned char const *
--
>> drivers/hid/hidraw.c:383:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hid/hidraw.c:383:29: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hid/hidraw.c:383:29: sparse:     got int *
   drivers/hid/hidraw.c:391:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hid/hidraw.c:391:37: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hid/hidraw.c:391:37: sparse:     got int *
--
>> drivers/hid/hid-roccat.c:397:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hid/hid-roccat.c:397:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hid/hid-roccat.c:397:21: sparse:     got int *
--
>> net/netlink/af_netlink.c:1730:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/netlink/af_netlink.c:1730:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1730:13: sparse:     got int *
   net/netlink/af_netlink.c:1741:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/netlink/af_netlink.c:1741:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1741:21: sparse:     got int *
>> net/netlink/af_netlink.c:1742:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   net/netlink/af_netlink.c:1742:21: sparse:     expected char [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1742:21: sparse:     got char *
   net/netlink/af_netlink.c:1751:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/netlink/af_netlink.c:1751:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1751:21: sparse:     got int *
   net/netlink/af_netlink.c:1752:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   net/netlink/af_netlink.c:1752:21: sparse:     expected char [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1752:21: sparse:     got char *
   net/netlink/af_netlink.c:1761:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/netlink/af_netlink.c:1761:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1761:21: sparse:     got int *
   net/netlink/af_netlink.c:1762:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   net/netlink/af_netlink.c:1762:21: sparse:     expected char [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1762:21: sparse:     got char *
>> net/netlink/af_netlink.c:1777:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   net/netlink/af_netlink.c:1777:29: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1777:29: sparse:     got unsigned int *
   net/netlink/af_netlink.c:1783:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/netlink/af_netlink.c:1783:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1783:21: sparse:     got int *
   net/netlink/af_netlink.c:1793:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/netlink/af_netlink.c:1793:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1793:21: sparse:     got int *
   net/netlink/af_netlink.c:1794:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   net/netlink/af_netlink.c:1794:21: sparse:     expected char [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1794:21: sparse:     got char *
   net/netlink/af_netlink.c:1803:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/netlink/af_netlink.c:1803:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1803:21: sparse:     got int *
   net/netlink/af_netlink.c:1803:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   net/netlink/af_netlink.c:1803:46: sparse:     expected char [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1803:46: sparse:     got char *
   net/netlink/af_netlink.c:1812:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/netlink/af_netlink.c:1812:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1812:21: sparse:     got int *
   net/netlink/af_netlink.c:1812:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   net/netlink/af_netlink.c:1812:46: sparse:     expected char [noderef] __user *__ptr_clean
   net/netlink/af_netlink.c:1812:46: sparse:     got char *
   net/netlink/af_netlink.c:2607:13: sparse: sparse: context imbalance in 'netlink_walk_start' - wrong count at exit
   net/netlink/af_netlink.c:2613:13: sparse: sparse: context imbalance in 'netlink_walk_stop' - unexpected unlock
   net/netlink/af_netlink.c:2663:9: sparse: sparse: context imbalance in 'netlink_seq_start' - wrong count at exit
--
>> drivers/hwmon/w83793.c:1370:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/hwmon/w83793.c:1370:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/hwmon/w83793.c:1370:37: sparse:     got char const *
>> drivers/hwmon/w83793.c:1406:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/w83793.c:1406:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/w83793.c:1406:23: sparse:     got int *
   drivers/hwmon/w83793.c:1410:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/w83793.c:1410:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/w83793.c:1410:23: sparse:     got int *
   drivers/hwmon/w83793.c:1419:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/w83793.c:1419:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/w83793.c:1419:23: sparse:     got int *
   drivers/hwmon/w83793.c:1423:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/w83793.c:1423:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/w83793.c:1423:21: sparse:     got int *
   drivers/hwmon/w83793.c:1429:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/w83793.c:1429:31: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/w83793.c:1429:31: sparse:     got int *
   drivers/hwmon/w83793.c:1433:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/w83793.c:1433:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/w83793.c:1433:21: sparse:     got int *
--
>> drivers/hwmon/fschmd.c:866:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/hwmon/fschmd.c:866:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/hwmon/fschmd.c:866:37: sparse:     got char const *
>> drivers/hwmon/fschmd.c:900:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/fschmd.c:900:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/fschmd.c:900:23: sparse:     got int *
   drivers/hwmon/fschmd.c:905:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/fschmd.c:905:31: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/fschmd.c:905:31: sparse:     got int *
   drivers/hwmon/fschmd.c:907:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/fschmd.c:907:31: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/fschmd.c:907:31: sparse:     got int *
   drivers/hwmon/fschmd.c:916:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/fschmd.c:916:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/fschmd.c:916:23: sparse:     got int *
   drivers/hwmon/fschmd.c:920:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/fschmd.c:920:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/fschmd.c:920:21: sparse:     got int *
   drivers/hwmon/fschmd.c:926:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/fschmd.c:926:31: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/fschmd.c:926:31: sparse:     got int *
   drivers/hwmon/fschmd.c:930:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/hwmon/fschmd.c:930:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/hwmon/fschmd.c:930:21: sparse:     got int *
--
>> arch/x86/entry/vsyscall/vsyscall_64.c:169:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   arch/x86/entry/vsyscall/vsyscall_64.c:169:13: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   arch/x86/entry/vsyscall/vsyscall_64.c:169:13: sparse:     got unsigned long *
--
>> fs/notify/inotify/inotify_user.c:337:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/notify/inotify/inotify_user.c:337:23: sparse:     expected int [noderef] __user *__ptr_clean
   fs/notify/inotify/inotify_user.c:337:23: sparse:     got int *
   fs/notify/inotify/inotify_user.c:577:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *conn @@     got struct fsnotify_mark_connector [noderef] __rcu *i_fsnotify_marks @@
   fs/notify/inotify/inotify_user.c:577:51: sparse:     expected struct fsnotify_mark_connector *conn
   fs/notify/inotify/inotify_user.c:577:51: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *i_fsnotify_marks
--
>> drivers/i2c/i2c-dev.c:432:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   drivers/i2c/i2c-dev.c:432:24: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   drivers/i2c/i2c-dev.c:432:24: sparse:     got unsigned long *
--
>> fs/notify/fanotify/fanotify_user.c:929:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/notify/fanotify/fanotify_user.c:929:23: sparse:     expected int [noderef] __user *__ptr_clean
   fs/notify/fanotify/fanotify_user.c:929:23: sparse:     got int *
--
>> net/ethtool/ioctl.c:107:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   net/ethtool/ioctl.c:107:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   net/ethtool/ioctl.c:107:13: sparse:     got unsigned int *
--
>> fs/proc/page.c:75:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   fs/proc/page.c:75:21: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   fs/proc/page.c:75:21: sparse:     got unsigned long long *
   fs/proc/page.c:253:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   fs/proc/page.c:253:21: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   fs/proc/page.c:253:21: sparse:     got unsigned long long *
--
>> drivers/input/evdev.c:819:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:819:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:819:13: sparse:     got int *
   drivers/input/evdev.c:854:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:854:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:854:13: sparse:     got int *
   drivers/input/evdev.c:928:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:928:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:928:13: sparse:     got int *
   drivers/input/evdev.c:936:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:936:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:936:21: sparse:     got int *
>> drivers/input/evdev.c:1017:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/input/evdev.c:1017:37: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/input/evdev.c:1017:37: sparse:     got unsigned char *
   drivers/input/evdev.c:1047:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:1047:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:1047:24: sparse:     got int *
   drivers/input/evdev.c:1057:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:1057:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:1057:21: sparse:     got int *
   drivers/input/evdev.c:1059:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:1059:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:1059:21: sparse:     got int *
   drivers/input/evdev.c:1066:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:1066:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:1066:21: sparse:     got int *
   drivers/input/evdev.c:1068:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:1068:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:1068:21: sparse:     got int *
   drivers/input/evdev.c:1082:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/input/evdev.c:1082:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/input/evdev.c:1082:21: sparse:     got int *
>> drivers/input/evdev.c:1187:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed short [noderef] __user *__ptr_clean @@     got signed short * @@
   drivers/input/evdev.c:1187:21: sparse:     expected signed short [noderef] __user *__ptr_clean
   drivers/input/evdev.c:1187:21: sparse:     got signed short *
--
>> drivers/input/mousedev.c:683:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/input/mousedev.c:683:21: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/input/mousedev.c:683:21: sparse:     got char const *
--
>> drivers/input/joydev.c:530:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/input/joydev.c:530:24: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/input/joydev.c:530:24: sparse:     got signed int *
   drivers/input/joydev.c:533:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/input/joydev.c:533:24: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/input/joydev.c:533:24: sparse:     got signed int *
>> drivers/input/joydev.c:536:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/input/joydev.c:536:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/input/joydev.c:536:24: sparse:     got unsigned int *
>> drivers/input/joydev.c:539:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/input/joydev.c:539:24: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/input/joydev.c:539:24: sparse:     got unsigned char *
   drivers/input/joydev.c:542:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/input/joydev.c:542:24: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/input/joydev.c:542:24: sparse:     got unsigned char *
>> drivers/input/joydev.c:682:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   drivers/input/joydev.c:682:26: sparse:     expected long [noderef] __user *__ptr_clean
   drivers/input/joydev.c:682:26: sparse:     got long *
   drivers/input/joydev.c:687:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   drivers/input/joydev.c:687:26: sparse:     expected long [noderef] __user *__ptr_clean
   drivers/input/joydev.c:687:26: sparse:     got long *
--
>> net/ipv4/tcp.c:640:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/tcp.c:640:16: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/tcp.c:640:16: sparse:     got int *
--
>> net/ipv4/raw.c:802:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/raw.c:802:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/raw.c:802:13: sparse:     got int *
   net/ipv4/raw.c:810:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/raw.c:810:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/raw.c:810:13: sparse:     got int *
   net/ipv4/raw.c:863:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/raw.c:863:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/raw.c:863:24: sparse:     got int *
   net/ipv4/raw.c:874:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/raw.c:874:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/raw.c:874:24: sparse:     got int *
--
>> net/ipv4/udp.c:1718:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/udp.c:1718:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/udp.c:1718:24: sparse:     got int *
   net/ipv4/udp.c:1725:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/udp.c:1725:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/udp.c:1725:24: sparse:     got int *
   net/ipv4/udp.c:2801:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/udp.c:2801:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/udp.c:2801:13: sparse:     got int *
   net/ipv4/udp.c:2848:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv4/udp.c:2848:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv4/udp.c:2848:13: sparse:     got int *
   net/ipv4/udp.c:1480:28: sparse: sparse: context imbalance in 'udp_rmem_release' - unexpected unlock
   net/ipv4/udp.c:1512:19: sparse: sparse: context imbalance in 'busylock_acquire' - wrong count at exit
   net/ipv4/udp.c:1524:28: sparse: sparse: context imbalance in 'busylock_release' - unexpected unlock
   net/ipv4/udp.c:2989:9: sparse: sparse: context imbalance in 'udp_get_first' - wrong count at exit
   net/ipv4/udp.c:3011:39: sparse: sparse: context imbalance in 'udp_get_next' - unexpected unlock
   net/ipv4/udp.c:3061:31: sparse: sparse: context imbalance in 'udp_seq_stop' - unexpected unlock
--
   arch/x86/kernel/fpu/xstate.c:1530:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1530:9: sparse:     expected struct lockdep_map const *lock
   arch/x86/kernel/fpu/xstate.c:1530:9: sparse:     got struct lockdep_map [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1620:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1620:31: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1620:31: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1628:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1628:33: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1628:33: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1646:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1646:31: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1646:31: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1650:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1650:41: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1650:41: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1665:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1665:33: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1665:33: sparse:     got struct spinlock [noderef] __rcu *
>> arch/x86/kernel/fpu/xstate.c:1722:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   arch/x86/kernel/fpu/xstate.c:1722:24: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   arch/x86/kernel/fpu/xstate.c:1722:24: sparse:     got unsigned long long *
   arch/x86/kernel/fpu/xstate.c:1731:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   arch/x86/kernel/fpu/xstate.c:1731:24: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   arch/x86/kernel/fpu/xstate.c:1731:24: sparse:     got unsigned long long *
   arch/x86/kernel/fpu/xstate.c:1736:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   arch/x86/kernel/fpu/xstate.c:1736:24: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   arch/x86/kernel/fpu/xstate.c:1736:24: sparse:     got unsigned long long *
--
   kernel/sched/core.c:1021:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1021:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1021:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2185:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2185:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2185:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2185:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2185:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2185:68: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:5130:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   kernel/sched/core.c:5130:17: sparse:     expected int [noderef] __user *__ptr_clean
   kernel/sched/core.c:5130:17: sparse:     got int *
   kernel/sched/core.c:5449:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5449:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5449:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6395:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6395:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6395:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6921:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6921:17: sparse:    struct task_struct *
   kernel/sched/core.c:6921:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7137:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7137:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7137:22: sparse:    struct task_struct *
>> kernel/sched/core.c:7787:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sched/core.c:7787:15: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sched/core.c:7787:15: sparse:     got unsigned int *
   kernel/sched/core.c:7817:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/sched/core.c:7817:9: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/sched/core.c:7817:9: sparse:     got unsigned int *
   kernel/sched/core.c:11165:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11165:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11165:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:530:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:563:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:579:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:617:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:658:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c:2176:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2177:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2178:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:3706:25: sparse: sparse: context imbalance in 'ttwu_runnable' - wrong count at exit
   kernel/sched/core.c:4259:9: sparse: sparse: context imbalance in 'task_call_func' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   include/trace/events/sched.h:185:1: sparse: sparse: context imbalance in 'wake_up_new_task' - wrong count at exit
   kernel/sched/core.c:5107:9: sparse: sparse: context imbalance in 'finish_task_switch' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
--
   kernel/locking/lockdep_proc.c:477:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/locking/lockdep_proc.c:477:17: sparse:    char const [noderef] __rcu *
   kernel/locking/lockdep_proc.c:477:17: sparse:    char const *
   kernel/locking/lockdep_proc.c:478:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/locking/lockdep_proc.c:478:17: sparse:    struct lockdep_subclass_key const [noderef] __rcu *
   kernel/locking/lockdep_proc.c:478:17: sparse:    struct lockdep_subclass_key const *
>> kernel/locking/lockdep_proc.c:683:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   kernel/locking/lockdep_proc.c:683:21: sparse:     expected char const [noderef] __user *__ptr_clean
   kernel/locking/lockdep_proc.c:683:21: sparse:     got char const *
--
>> drivers/mtd/mtdchar.c:409:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/mtd/mtdchar.c:409:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/mtd/mtdchar.c:409:13: sparse:     got unsigned int *
   drivers/mtd/mtdchar.c:889:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/mtd/mtdchar.c:889:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/mtd/mtdchar.c:889:21: sparse:     got unsigned int *
   drivers/mtd/mtdchar.c:897:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/mtd/mtdchar.c:897:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/mtd/mtdchar.c:897:21: sparse:     got unsigned int *
   drivers/mtd/mtdchar.c:898:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/mtd/mtdchar.c:898:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/mtd/mtdchar.c:898:24: sparse:     got unsigned int *
   drivers/mtd/mtdchar.c:899:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/mtd/mtdchar.c:899:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/mtd/mtdchar.c:899:24: sparse:     got unsigned int *
--
>> net/unix/af_unix.c:3106:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/unix/af_unix.c:3106:23: sparse:     expected int [noderef] __user *__ptr_clean
   net/unix/af_unix.c:3106:23: sparse:     got int *
   net/unix/af_unix.c:3113:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/unix/af_unix.c:3113:31: sparse:     expected int [noderef] __user *__ptr_clean
   net/unix/af_unix.c:3113:31: sparse:     got int *
   net/unix/af_unix.c:3127:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/unix/af_unix.c:3127:31: sparse:     expected int [noderef] __user *__ptr_clean
   net/unix/af_unix.c:3127:31: sparse:     got int *
   net/unix/af_unix.c:159:13: sparse: sparse: context imbalance in 'unix_table_double_lock' - wrong count at exit
   net/unix/af_unix.c:178:28: sparse: sparse: context imbalance in 'unix_table_double_unlock' - unexpected unlock
   net/unix/af_unix.c:1321:13: sparse: sparse: context imbalance in 'unix_state_double_lock' - wrong count at exit
   net/unix/af_unix.c:1339:17: sparse: sparse: context imbalance in 'unix_state_double_unlock' - unexpected unlock
   net/unix/af_unix.c:1640:18: sparse: sparse: context imbalance in 'unix_stream_connect' - different lock contexts for basic block
   net/unix/af_unix.c:2003:25: sparse: sparse: context imbalance in 'unix_dgram_sendmsg' - unexpected unlock
   net/unix/af_unix.c:3270:20: sparse: sparse: context imbalance in 'unix_get_first' - wrong count at exit
   net/unix/af_unix.c:3301:34: sparse: sparse: context imbalance in 'unix_get_next' - unexpected unlock
   net/unix/af_unix.c:3331:42: sparse: sparse: context imbalance in 'unix_seq_stop' - unexpected unlock
   net/unix/af_unix.c:3434:34: sparse: sparse: context imbalance in 'bpf_iter_unix_hold_batch' - unexpected unlock
--
>> net/ipv6/raw.c:964:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv6/raw.c:964:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv6/raw.c:964:21: sparse:     got int *
   net/ipv6/raw.c:970:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv6/raw.c:970:21: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv6/raw.c:970:21: sparse:     got int *
   net/ipv6/raw.c:1062:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv6/raw.c:1062:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv6/raw.c:1062:13: sparse:     got int *
   net/ipv6/raw.c:1087:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv6/raw.c:1087:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv6/raw.c:1087:13: sparse:     got int *
   net/ipv6/raw.c:1123:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv6/raw.c:1123:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv6/raw.c:1123:24: sparse:     got int *
   net/ipv6/raw.c:1134:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/ipv6/raw.c:1134:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/ipv6/raw.c:1134:24: sparse:     got int *
--
>> net/ipv6/sit.c:359:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   net/ipv6/sit.c:359:54: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   net/ipv6/sit.c:359:54: sparse:     got unsigned int *
--
>> net/packet/af_packet.c:4034:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/packet/af_packet.c:4034:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/packet/af_packet.c:4034:13: sparse:     got int *
   net/packet/af_packet.c:4134:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/packet/af_packet.c:4134:13: sparse:     expected int [noderef] __user *__ptr_clean
   net/packet/af_packet.c:4134:13: sparse:     got int *
   net/packet/af_packet.c:4202:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/packet/af_packet.c:4202:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/packet/af_packet.c:4202:24: sparse:     got int *
   net/packet/af_packet.c:4214:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/packet/af_packet.c:4214:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/packet/af_packet.c:4214:24: sparse:     got int *
   net/packet/af_packet.c:1050:13: sparse: sparse: context imbalance in '__packet_lookup_frame_in_block' - different lock contexts for basic block
   net/packet/af_packet.c:2490:17: sparse: sparse: context imbalance in 'tpacket_rcv' - unexpected unlock
--
>> net/sunrpc/cache.c:1019:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/sunrpc/cache.c:1019:16: sparse:     expected int [noderef] __user *__ptr_clean
   net/sunrpc/cache.c:1019:16: sparse:     got int *
--
>> net/sunrpc/rpc_pipe.c:380:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   net/sunrpc/rpc_pipe.c:380:24: sparse:     expected int [noderef] __user *__ptr_clean
   net/sunrpc/rpc_pipe.c:380:24: sparse:     got int *
--
>> drivers/pps/pps.c:170:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/pps/pps.c:170:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/pps/pps.c:170:23: sparse:     got int *
--
>> drivers/rtc/rtc-abx80x.c:527:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/rtc/rtc-abx80x.c:527:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/rtc/rtc-abx80x.c:527:24: sparse:     got unsigned int *
--
>> drivers/rtc/rtc-pcf2127.c:231:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/rtc/rtc-pcf2127.c:231:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/rtc/rtc-pcf2127.c:231:24: sparse:     got unsigned int *
--
>> drivers/rtc/rtc-pcf8523.c:332:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/rtc/rtc-pcf8523.c:332:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/rtc/rtc-pcf8523.c:332:24: sparse:     got unsigned int *
--
>> drivers/rtc/rtc-pcf8563.c:288:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/rtc/rtc-pcf8563.c:288:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/rtc/rtc-pcf8563.c:288:24: sparse:     got unsigned int *
--
>> drivers/rtc/rtc-rv3029c2.c:463:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/rtc/rtc-rv3029c2.c:463:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/rtc/rtc-rv3029c2.c:463:24: sparse:     got unsigned int *
--
>> drivers/rtc/rtc-rv8803.c:484:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/rtc/rtc-rv8803.c:484:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/rtc/rtc-rv8803.c:484:24: sparse:     got unsigned int *
--
>> drivers/rtc/rtc-rx8010.c:350:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/rtc/rtc-rx8010.c:350:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/rtc/rtc-rx8010.c:350:24: sparse:     got unsigned int *
--
>> drivers/mtd/ubi/cdev.c:467:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:467:23: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:467:23: sparse:     got signed int *
   drivers/mtd/ubi/cdev.c:512:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:512:23: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:512:23: sparse:     got signed int *
   drivers/mtd/ubi/cdev.c:526:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:526:23: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:526:23: sparse:     got signed int *
   drivers/mtd/ubi/cdev.c:869:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:869:23: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:869:23: sparse:     got signed int *
   drivers/mtd/ubi/cdev.c:882:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:882:23: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:882:23: sparse:     got signed int *
   drivers/mtd/ubi/cdev.c:969:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:969:23: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:969:23: sparse:     got signed int *
   drivers/mtd/ubi/cdev.c:984:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:984:23: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:984:23: sparse:     got signed int *
   drivers/mtd/ubi/cdev.c:1050:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:1050:31: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:1050:31: sparse:     got signed int *
   drivers/mtd/ubi/cdev.c:1061:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   drivers/mtd/ubi/cdev.c:1061:23: sparse:     expected signed int [noderef] __user *__ptr_clean
   drivers/mtd/ubi/cdev.c:1061:23: sparse:     got signed int *
--
>> drivers/spi/spidev.c:380:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/spi/spidev.c:380:26: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:380:26: sparse:     got unsigned char *
>> drivers/spi/spidev.c:384:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/spi/spidev.c:384:26: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:384:26: sparse:     got unsigned int *
   drivers/spi/spidev.c:388:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/spi/spidev.c:388:26: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:388:26: sparse:     got unsigned char *
   drivers/spi/spidev.c:392:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/spi/spidev.c:392:26: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:392:26: sparse:     got unsigned char *
   drivers/spi/spidev.c:395:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/spi/spidev.c:395:26: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:395:26: sparse:     got unsigned int *
   drivers/spi/spidev.c:402:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/spi/spidev.c:402:34: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:402:34: sparse:     got unsigned char *
   drivers/spi/spidev.c:404:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/spi/spidev.c:404:34: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:404:34: sparse:     got unsigned int *
   drivers/spi/spidev.c:428:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/spi/spidev.c:428:26: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:428:26: sparse:     got unsigned char *
   drivers/spi/spidev.c:445:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/spi/spidev.c:445:26: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:445:26: sparse:     got unsigned char *
   drivers/spi/spidev.c:460:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/spi/spidev.c:460:26: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/spi/spidev.c:460:26: sparse:     got unsigned int *
--
>> drivers/tty/tty_io.c:2278:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   drivers/tty/tty_io.c:2278:13: sparse:     expected char [noderef] __user *__ptr_clean
   drivers/tty/tty_io.c:2278:13: sparse:     got char *
>> drivers/tty/tty_io.c:2423:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/tty_io.c:2423:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/tty_io.c:2423:13: sparse:     got int *
   drivers/tty/tty_io.c:2449:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/tty_io.c:2449:15: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/tty_io.c:2449:15: sparse:     got int *
   drivers/tty/tty_io.c:2510:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/tty_io.c:2510:34: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/tty_io.c:2510:34: sparse:     got int *
>> drivers/tty/tty_io.c:2535:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/tty/tty_io.c:2535:18: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/tty/tty_io.c:2535:18: sparse:     got unsigned int *
   drivers/tty/tty_io.c:2702:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/tty_io.c:2702:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/tty_io.c:2702:24: sparse:     got int *
   drivers/tty/tty_io.c:2717:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/tty/tty_io.c:2717:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/tty/tty_io.c:2717:24: sparse:     got unsigned int *
--
>> drivers/tty/n_tty.c:2473:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/n_tty.c:2473:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/n_tty.c:2473:24: sparse:     got int *
>> drivers/tty/n_tty.c:2481:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/tty/n_tty.c:2481:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/tty/n_tty.c:2481:24: sparse:     got unsigned int *
--
>> drivers/tty/tty_ioctl.c:878:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/tty_ioctl.c:878:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/tty_ioctl.c:878:23: sparse:     got int *
>> drivers/tty/tty_ioctl.c:882:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/tty/tty_ioctl.c:882:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/tty/tty_ioctl.c:882:21: sparse:     got unsigned int *
--
   drivers/tty/tty_jobctrl.c:80:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:80:9: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:80:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:83:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:83:34: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:83:34: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:124:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:124:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:124:31: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:126:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:126:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:126:33: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:135:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:135:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:135:31: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:156:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:156:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:156:33: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:165:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:165:9: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:165:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:167:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:167:40: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:167:40: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:205:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:205:41: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:205:41: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:215:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:215:51: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:215:51: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:227:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:227:43: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:227:43: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:291:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:291:39: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:291:39: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:294:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:294:41: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:294:41: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:303:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:303:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:303:31: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:307:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:307:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:307:33: sparse:     got struct spinlock [noderef] __rcu *
>> drivers/tty/tty_jobctrl.c:472:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/tty_jobctrl.c:472:16: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/tty_jobctrl.c:472:16: sparse:     got int *
   drivers/tty/tty_jobctrl.c:499:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/tty_jobctrl.c:499:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/tty_jobctrl.c:499:13: sparse:     got int *
   drivers/tty/tty_jobctrl.c:556:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/tty_jobctrl.c:556:16: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/tty_jobctrl.c:556:16: sparse:     got int *
   drivers/tty/tty_jobctrl.c:19:41: sparse: sparse: dereference of noderef expression
--
>> drivers/tty/pty.c:141:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/pty.c:141:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/pty.c:141:13: sparse:     got int *
   drivers/tty/pty.c:154:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/pty.c:154:16: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/pty.c:154:16: sparse:     got int *
   drivers/tty/pty.c:162:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/pty.c:162:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/pty.c:162:13: sparse:     got int *
   drivers/tty/pty.c:184:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/tty/pty.c:184:16: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/tty/pty.c:184:16: sparse:     got int *
>> drivers/tty/pty.c:655:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/tty/pty.c:655:24: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/tty/pty.c:655:24: sparse:     got unsigned int *
--
>> drivers/tty/sysrq.c:1161:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/tty/sysrq.c:1161:21: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/tty/sysrq.c:1161:21: sparse:     got char const *
   drivers/tty/sysrq.c:150:13: sparse: sparse: context imbalance in 'sysrq_handle_crash' - unexpected unlock
--
>> drivers/tty/serial/serial_core.c:1056:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/tty/serial/serial_core.c:1056:16: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/tty/serial/serial_core.c:1056:16: sparse:     got unsigned int *
   drivers/tty/serial/serial_core.c:152:9: sparse: sparse: context imbalance in 'uart_start' - different lock contexts for basic block
   drivers/tty/serial/serial_core.c:219:17: sparse: sparse: context imbalance in 'uart_port_startup' - different lock contexts for basic block
   drivers/tty/serial/serial_core.c:328:9: sparse: sparse: context imbalance in 'uart_shutdown' - different lock contexts for basic block
   drivers/tty/serial/serial_core.c:555:9: sparse: sparse: context imbalance in 'uart_put_char' - different lock contexts for basic block
   drivers/tty/serial/serial_core.c:603:9: sparse: sparse: context imbalance in 'uart_write' - different lock contexts for basic block
   drivers/tty/serial/serial_core.c:616:9: sparse: sparse: context imbalance in 'uart_write_room' - different lock contexts for basic block
   drivers/tty/serial/serial_core.c:629:9: sparse: sparse: context imbalance in 'uart_chars_in_buffer' - different lock contexts for basic block
   drivers/tty/serial/serial_core.c:656:9: sparse: sparse: context imbalance in 'uart_flush_buffer' - different lock contexts for basic block
--
>> drivers/usb/core/devio.c:950:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:950:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:950:13: sparse:     got unsigned int *
   drivers/usb/core/devio.c:951:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:951:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:951:13: sparse:     got unsigned int *
>> drivers/usb/core/devio.c:966:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/usb/core/devio.c:966:21: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:966:21: sparse:     got unsigned char *
   drivers/usb/core/devio.c:1389:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:1389:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:1389:13: sparse:     got unsigned int *
   drivers/usb/core/devio.c:1408:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:1408:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:1408:13: sparse:     got unsigned int *
>> drivers/usb/core/devio.c:1540:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/usb/core/devio.c:1540:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:1540:13: sparse:     got int *
   drivers/usb/core/devio.c:2043:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/usb/core/devio.c:2043:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2043:13: sparse:     got int *
   drivers/usb/core/devio.c:2045:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/usb/core/devio.c:2045:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2045:13: sparse:     got int *
   drivers/usb/core/devio.c:2047:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/usb/core/devio.c:2047:13: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2047:13: sparse:     got int *
   drivers/usb/core/devio.c:2052:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:2052:29: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2052:29: sparse:     got unsigned int *
   drivers/usb/core/devio.c:2055:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:2055:29: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2055:29: sparse:     got unsigned int *
>> drivers/usb/core/devio.c:2061:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *[noderef] __user *__ptr_clean @@     got void [noderef] __user ** @@
   drivers/usb/core/devio.c:2061:13: sparse:     expected void [noderef] __user *[noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2061:13: sparse:     got void [noderef] __user **
   drivers/usb/core/devio.c:2288:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:2288:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2288:13: sparse:     got unsigned int *
   drivers/usb/core/devio.c:2298:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:2298:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2298:13: sparse:     got unsigned int *
   drivers/usb/core/devio.c:2414:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:2414:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2414:13: sparse:     got unsigned int *
   drivers/usb/core/devio.c:2427:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:2427:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2427:13: sparse:     got unsigned int *
   drivers/usb/core/devio.c:2445:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/core/devio.c:2445:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/core/devio.c:2445:13: sparse:     got unsigned int *
--
>> drivers/watchdog/watchdog_dev.c:695:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/watchdog_dev.c:695:21: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:695:21: sparse:     got char const *
>> drivers/watchdog/watchdog_dev.c:757:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/watchdog_dev.c:757:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:757:23: sparse:     got int *
   drivers/watchdog/watchdog_dev.c:760:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/watchdog_dev.c:760:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:760:23: sparse:     got int *
   drivers/watchdog/watchdog_dev.c:763:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/watchdog_dev.c:763:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:763:21: sparse:     got int *
   drivers/watchdog/watchdog_dev.c:783:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/watchdog_dev.c:783:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:783:21: sparse:     got int *
   drivers/watchdog/watchdog_dev.c:803:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/watchdog_dev.c:803:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:803:23: sparse:     got int *
   drivers/watchdog/watchdog_dev.c:809:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/watchdog_dev.c:809:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:809:23: sparse:     got int *
   drivers/watchdog/watchdog_dev.c:812:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/watchdog_dev.c:812:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:812:21: sparse:     got int *
   drivers/watchdog/watchdog_dev.c:819:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/watchdog_dev.c:819:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/watchdog_dev.c:819:23: sparse:     got int *
--
>> drivers/watchdog/acquirewdt.c:131:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/acquirewdt.c:131:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/acquirewdt.c:131:37: sparse:     got char const *
>> drivers/watchdog/acquirewdt.c:161:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/acquirewdt.c:161:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/acquirewdt.c:161:24: sparse:     got int *
   drivers/watchdog/acquirewdt.c:165:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/acquirewdt.c:165:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/acquirewdt.c:165:21: sparse:     got int *
   drivers/watchdog/acquirewdt.c:182:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/acquirewdt.c:182:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/acquirewdt.c:182:24: sparse:     got int *
--
>> drivers/watchdog/advantechwdt.c:120:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/advantechwdt.c:120:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/advantechwdt.c:120:37: sparse:     got char const *
>> drivers/watchdog/advantechwdt.c:152:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/advantechwdt.c:152:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/advantechwdt.c:152:24: sparse:     got int *
   drivers/watchdog/advantechwdt.c:158:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/advantechwdt.c:158:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/advantechwdt.c:158:21: sparse:     got int *
   drivers/watchdog/advantechwdt.c:175:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/advantechwdt.c:175:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/advantechwdt.c:175:21: sparse:     got int *
   drivers/watchdog/advantechwdt.c:182:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/advantechwdt.c:182:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/advantechwdt.c:182:24: sparse:     got int *
--
>> drivers/watchdog/pc87413_wdt.c:354:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/pc87413_wdt.c:354:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/pc87413_wdt.c:354:37: sparse:     got char const *
>> drivers/watchdog/pc87413_wdt.c:403:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pc87413_wdt.c:403:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pc87413_wdt.c:403:24: sparse:     got int *
   drivers/watchdog/pc87413_wdt.c:405:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pc87413_wdt.c:405:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pc87413_wdt.c:405:24: sparse:     got int *
   drivers/watchdog/pc87413_wdt.c:409:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pc87413_wdt.c:409:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pc87413_wdt.c:409:21: sparse:     got int *
   drivers/watchdog/pc87413_wdt.c:428:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pc87413_wdt.c:428:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pc87413_wdt.c:428:21: sparse:     got int *
   drivers/watchdog/pc87413_wdt.c:439:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pc87413_wdt.c:439:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pc87413_wdt.c:439:24: sparse:     got int *
--
>> drivers/watchdog/sbc60xxwdt.c:180:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/sbc60xxwdt.c:180:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/sbc60xxwdt.c:180:37: sparse:     got char const *
>> drivers/watchdog/sbc60xxwdt.c:237:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sbc60xxwdt.c:237:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sbc60xxwdt.c:237:24: sparse:     got int *
   drivers/watchdog/sbc60xxwdt.c:241:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sbc60xxwdt.c:241:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sbc60xxwdt.c:241:21: sparse:     got int *
   drivers/watchdog/sbc60xxwdt.c:259:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sbc60xxwdt.c:259:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sbc60xxwdt.c:259:21: sparse:     got int *
   drivers/watchdog/sbc60xxwdt.c:270:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sbc60xxwdt.c:270:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sbc60xxwdt.c:270:24: sparse:     got int *
--
>> drivers/watchdog/smsc37b787_wdt.c:404:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/smsc37b787_wdt.c:404:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/smsc37b787_wdt.c:404:37: sparse:     got char const *
>> drivers/watchdog/smsc37b787_wdt.c:444:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/smsc37b787_wdt.c:444:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/smsc37b787_wdt.c:444:24: sparse:     got int *
   drivers/watchdog/smsc37b787_wdt.c:446:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/smsc37b787_wdt.c:446:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/smsc37b787_wdt.c:446:24: sparse:     got int *
   drivers/watchdog/smsc37b787_wdt.c:451:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/smsc37b787_wdt.c:451:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/smsc37b787_wdt.c:451:21: sparse:     got int *
   drivers/watchdog/smsc37b787_wdt.c:468:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/smsc37b787_wdt.c:468:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/smsc37b787_wdt.c:468:21: sparse:     got int *
   drivers/watchdog/smsc37b787_wdt.c:482:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/smsc37b787_wdt.c:482:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/smsc37b787_wdt.c:482:24: sparse:     got int *
--
>> drivers/watchdog/w83877f_wdt.c:202:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/w83877f_wdt.c:202:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/w83877f_wdt.c:202:37: sparse:     got char const *
>> drivers/watchdog/w83877f_wdt.c:255:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83877f_wdt.c:255:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83877f_wdt.c:255:24: sparse:     got int *
   drivers/watchdog/w83877f_wdt.c:260:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83877f_wdt.c:260:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83877f_wdt.c:260:21: sparse:     got int *
   drivers/watchdog/w83877f_wdt.c:282:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83877f_wdt.c:282:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83877f_wdt.c:282:21: sparse:     got int *
   drivers/watchdog/w83877f_wdt.c:294:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83877f_wdt.c:294:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83877f_wdt.c:294:24: sparse:     got int *
--
>> drivers/watchdog/w83977f_wdt.c:343:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/w83977f_wdt.c:343:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/w83977f_wdt.c:343:37: sparse:     got char const *
>> drivers/watchdog/w83977f_wdt.c:392:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83977f_wdt.c:392:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83977f_wdt.c:392:24: sparse:     got int *
   drivers/watchdog/w83977f_wdt.c:395:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83977f_wdt.c:395:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83977f_wdt.c:395:24: sparse:     got int *
   drivers/watchdog/w83977f_wdt.c:398:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83977f_wdt.c:398:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83977f_wdt.c:398:21: sparse:     got int *
   drivers/watchdog/w83977f_wdt.c:418:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83977f_wdt.c:418:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83977f_wdt.c:418:21: sparse:     got int *
   drivers/watchdog/w83977f_wdt.c:428:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/w83977f_wdt.c:428:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/w83977f_wdt.c:428:24: sparse:     got int *
--
>> drivers/watchdog/pcwd_usb.c:375:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/pcwd_usb.c:375:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/pcwd_usb.c:375:37: sparse:     got char const *
>> drivers/watchdog/pcwd_usb.c:407:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pcwd_usb.c:407:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pcwd_usb.c:407:24: sparse:     got int *
   drivers/watchdog/pcwd_usb.c:416:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pcwd_usb.c:416:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pcwd_usb.c:416:24: sparse:     got int *
   drivers/watchdog/pcwd_usb.c:423:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pcwd_usb.c:423:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pcwd_usb.c:423:21: sparse:     got int *
   drivers/watchdog/pcwd_usb.c:447:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pcwd_usb.c:447:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pcwd_usb.c:447:21: sparse:     got int *
   drivers/watchdog/pcwd_usb.c:458:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pcwd_usb.c:458:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pcwd_usb.c:458:24: sparse:     got int *
   drivers/watchdog/pcwd_usb.c:467:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/pcwd_usb.c:467:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/pcwd_usb.c:467:24: sparse:     got int *
--
>> drivers/watchdog/ib700wdt.c:156:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/ib700wdt.c:156:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/ib700wdt.c:156:37: sparse:     got char const *
>> drivers/watchdog/ib700wdt.c:188:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/ib700wdt.c:188:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/ib700wdt.c:188:24: sparse:     got int *
   drivers/watchdog/ib700wdt.c:194:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/ib700wdt.c:194:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/ib700wdt.c:194:21: sparse:     got int *
   drivers/watchdog/ib700wdt.c:212:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/ib700wdt.c:212:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/ib700wdt.c:212:21: sparse:     got int *
   drivers/watchdog/ib700wdt.c:220:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/ib700wdt.c:220:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/ib700wdt.c:220:24: sparse:     got int *
--
>> drivers/watchdog/ibmasr.c:259:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/ibmasr.c:259:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/ibmasr.c:259:37: sparse:     got char const *
>> drivers/watchdog/ibmasr.c:286:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/ibmasr.c:286:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/ibmasr.c:286:24: sparse:     got int *
   drivers/watchdog/ibmasr.c:290:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/ibmasr.c:290:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/ibmasr.c:290:21: sparse:     got int *
   drivers/watchdog/ibmasr.c:312:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/ibmasr.c:312:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/ibmasr.c:312:24: sparse:     got int *
--
>> drivers/watchdog/wafer5823wdt.c:109:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/wafer5823wdt.c:109:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/wafer5823wdt.c:109:37: sparse:     got char const *
>> drivers/watchdog/wafer5823wdt.c:143:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/wafer5823wdt.c:143:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/wafer5823wdt.c:143:24: sparse:     got int *
   drivers/watchdog/wafer5823wdt.c:149:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/wafer5823wdt.c:149:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/wafer5823wdt.c:149:21: sparse:     got int *
   drivers/watchdog/wafer5823wdt.c:170:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/wafer5823wdt.c:170:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/wafer5823wdt.c:170:21: sparse:     got int *
   drivers/watchdog/wafer5823wdt.c:179:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/wafer5823wdt.c:179:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/wafer5823wdt.c:179:24: sparse:     got int *
--
>> drivers/watchdog/kempld_wdt.c:349:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/kempld_wdt.c:349:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/kempld_wdt.c:349:21: sparse:     got int *
   drivers/watchdog/kempld_wdt.c:357:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/kempld_wdt.c:357:23: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/kempld_wdt.c:357:23: sparse:     got int *
--
>> drivers/watchdog/sc1200wdt.c:200:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sc1200wdt.c:200:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sc1200wdt.c:200:24: sparse:     got int *
   drivers/watchdog/sc1200wdt.c:203:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sc1200wdt.c:203:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sc1200wdt.c:203:24: sparse:     got int *
   drivers/watchdog/sc1200wdt.c:209:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sc1200wdt.c:209:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sc1200wdt.c:209:21: sparse:     got int *
   drivers/watchdog/sc1200wdt.c:229:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sc1200wdt.c:229:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sc1200wdt.c:229:21: sparse:     got int *
   drivers/watchdog/sc1200wdt.c:240:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sc1200wdt.c:240:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sc1200wdt.c:240:24: sparse:     got int *
>> drivers/watchdog/sc1200wdt.c:276:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/sc1200wdt.c:276:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/sc1200wdt.c:276:37: sparse:     got char const *
--
>> drivers/watchdog/sch311x_wdt.c:232:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   drivers/watchdog/sch311x_wdt.c:232:37: sparse:     expected char const [noderef] __user *__ptr_clean
   drivers/watchdog/sch311x_wdt.c:232:37: sparse:     got char const *
>> drivers/watchdog/sch311x_wdt.c:267:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sch311x_wdt.c:267:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sch311x_wdt.c:267:24: sparse:     got int *
   drivers/watchdog/sch311x_wdt.c:270:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sch311x_wdt.c:270:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sch311x_wdt.c:270:24: sparse:     got int *
   drivers/watchdog/sch311x_wdt.c:276:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sch311x_wdt.c:276:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sch311x_wdt.c:276:21: sparse:     got int *
   drivers/watchdog/sch311x_wdt.c:293:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sch311x_wdt.c:293:21: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sch311x_wdt.c:293:21: sparse:     got int *
   drivers/watchdog/sch311x_wdt.c:300:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   drivers/watchdog/sch311x_wdt.c:300:24: sparse:     expected int [noderef] __user *__ptr_clean
   drivers/watchdog/sch311x_wdt.c:300:24: sparse:     got int *
--
>> drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse:     got unsigned char *
>> drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] __user *__ptr_clean @@     got unsigned short * @@
   drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse:     expected unsigned short [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse:     got unsigned short *
>> drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse:     got unsigned int *
   drivers/usb/misc/sisusbvga/sisusb.c:1127:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/usb/misc/sisusbvga/sisusb.c:1127:45: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:1127:45: sparse:     got unsigned char *
   drivers/usb/misc/sisusbvga/sisusb.c:1140:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] __user *__ptr_clean @@     got unsigned short * @@
   drivers/usb/misc/sisusbvga/sisusb.c:1140:45: sparse:     expected unsigned short [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:1140:45: sparse:     got unsigned short *
   drivers/usb/misc/sisusbvga/sisusb.c:1180:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/misc/sisusbvga/sisusb.c:1180:45: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:1180:45: sparse:     got unsigned int *
   drivers/usb/misc/sisusbvga/sisusb.c:2520:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2520:34: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2520:34: sparse:     got unsigned char *
   drivers/usb/misc/sisusbvga/sisusb.c:2531:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] __user *__ptr_clean @@     got unsigned short * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2531:34: sparse:     expected unsigned short [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2531:34: sparse:     got unsigned short *
   drivers/usb/misc/sisusbvga/sisusb.c:2542:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2542:34: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2542:34: sparse:     got unsigned int *
   drivers/usb/misc/sisusbvga/sisusb.c:2600:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2600:26: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2600:26: sparse:     got unsigned int *
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse:     got unsigned char *
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] __user *__ptr_clean @@     got unsigned short * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse:     expected unsigned short [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse:     got unsigned short *
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse:     got unsigned int *
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse:     got unsigned int *
   drivers/usb/misc/sisusbvga/sisusb.c:2926:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2926:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/misc/sisusbvga/sisusb.c:2926:21: sparse:     got unsigned int *
--
>> drivers/usb/mon/mon_bin.c:928:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/mon/mon_bin.c:928:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/mon/mon_bin.c:928:21: sparse:     got unsigned int *
   drivers/usb/mon/mon_bin.c:1094:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/mon/mon_bin.c:1094:29: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/mon/mon_bin.c:1094:29: sparse:     got unsigned int *
   drivers/usb/mon/mon_bin.c:1100:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/mon/mon_bin.c:1100:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/mon/mon_bin.c:1100:21: sparse:     got unsigned int *
   drivers/usb/mon/mon_bin.c:1118:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/mon/mon_bin.c:1118:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/mon/mon_bin.c:1118:21: sparse:     got unsigned int *
   drivers/usb/mon/mon_bin.c:1120:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   drivers/usb/mon/mon_bin.c:1120:21: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   drivers/usb/mon/mon_bin.c:1120:21: sparse:     got unsigned int *
--
>> kernel/time/time.c:67:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   kernel/time/time.c:67:21: sparse:     expected long [noderef] __user *__ptr_clean
   kernel/time/time.c:67:21: sparse:     got long *
   kernel/time/time.c:86:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   kernel/time/time.c:86:13: sparse:     expected long [noderef] __user *__ptr_clean
   kernel/time/time.c:86:13: sparse:     got long *
>> kernel/time/time.c:112:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   kernel/time/time.c:112:21: sparse:     expected signed int [noderef] __user *__ptr_clean
   kernel/time/time.c:112:21: sparse:     got signed int *
   kernel/time/time.c:124:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected signed int [noderef] __user *__ptr_clean @@     got signed int * @@
   kernel/time/time.c:124:13: sparse:     expected signed int [noderef] __user *__ptr_clean
   kernel/time/time.c:124:13: sparse:     got signed int *
   kernel/time/time.c:147:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   kernel/time/time.c:147:21: sparse:     expected long [noderef] __user *__ptr_clean
   kernel/time/time.c:147:21: sparse:     got long *
   kernel/time/time.c:148:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   kernel/time/time.c:148:21: sparse:     expected long [noderef] __user *__ptr_clean
   kernel/time/time.c:148:21: sparse:     got long *
   kernel/time/time.c:206:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   kernel/time/time.c:206:21: sparse:     expected long [noderef] __user *__ptr_clean
   kernel/time/time.c:206:21: sparse:     got long *
   kernel/time/time.c:207:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   kernel/time/time.c:207:21: sparse:     expected long [noderef] __user *__ptr_clean
   kernel/time/time.c:207:21: sparse:     got long *
--
>> kernel/futex/core.c:648:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/futex/core.c:648:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/futex/core.c:648:13: sparse:     got unsigned int *
>> kernel/futex/core.c:783:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected long [noderef] __user *__ptr_clean @@     got long * @@
   kernel/futex/core.c:783:13: sparse:     expected long [noderef] __user *__ptr_clean
   kernel/futex/core.c:783:13: sparse:     got long *
>> kernel/futex/core.c:750:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   kernel/futex/core.c:750:13: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   kernel/futex/core.c:750:13: sparse:     got unsigned long *
>> kernel/futex/core.c:750:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   kernel/futex/core.c:750:13: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   kernel/futex/core.c:750:13: sparse:     got unsigned long *
>> kernel/futex/core.c:750:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   kernel/futex/core.c:750:13: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   kernel/futex/core.c:750:13: sparse:     got unsigned long *
--
>> kernel/futex/syscalls.c:75:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   kernel/futex/syscalls.c:75:13: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   kernel/futex/syscalls.c:75:13: sparse:     got unsigned long *
>> kernel/futex/syscalls.c:77:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct robust_list_head [noderef] __user *[noderef] __user *__ptr_clean @@     got struct robust_list_head [noderef] __user ** @@
   kernel/futex/syscalls.c:77:16: sparse:     expected struct robust_list_head [noderef] __user *[noderef] __user *__ptr_clean
   kernel/futex/syscalls.c:77:16: sparse:     got struct robust_list_head [noderef] __user **
--
>> kernel/futex/requeue.c:458:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/futex/requeue.c:458:31: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/futex/requeue.c:458:31: sparse:     got unsigned int *
   kernel/futex/requeue.c:455:41: sparse: sparse: context imbalance in 'futex_requeue' - different lock contexts for basic block
--
>> kernel/futex/pi.c:1112:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/futex/pi.c:1112:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/futex/pi.c:1112:13: sparse:     got unsigned int *
   kernel/futex/pi.c:675:9: sparse: sparse: context imbalance in 'wake_futex_pi' - unexpected unlock
   kernel/futex/pi.c:803:9: sparse: sparse: context imbalance in '__fixup_pi_state_owner' - unexpected unlock
   kernel/futex/pi.c:1068:9: sparse: sparse: context imbalance in 'futex_lock_pi' - unexpected unlock
   kernel/futex/pi.c:1100:5: sparse: sparse: context imbalance in 'futex_unlock_pi' - different lock contexts for basic block
--
>> kernel/futex/waitwake.c:473:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/futex/waitwake.c:473:29: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/futex/waitwake.c:473:29: sparse:     got unsigned int *
   kernel/futex/waitwake.c:614:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/futex/waitwake.c:614:23: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/futex/waitwake.c:614:23: sparse:     got unsigned int *
   kernel/futex/waitwake.c:262:33: sparse: sparse: context imbalance in 'futex_wake_op' - different lock contexts for basic block
   kernel/futex/waitwake.c:328:6: sparse: sparse: context imbalance in 'futex_wait_queue' - unexpected unlock
   kernel/futex/waitwake.c:449:36: sparse: sparse: context imbalance in 'futex_wait_multiple_setup' - unexpected unlock
--
   kernel/trace/trace.c:406:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:406:28: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:406:28: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:420:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:420:33: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:420:33: sparse:     got struct trace_export [noderef] __rcu **
>> kernel/trace/trace.c:1610:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   kernel/trace/trace.c:1610:15: sparse:     expected char const [noderef] __user *__ptr_clean
   kernel/trace/trace.c:1610:15: sparse:     got char const *
   kernel/trace/trace.c:1624:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   kernel/trace/trace.c:1624:31: sparse:     expected char const [noderef] __user *__ptr_clean
   kernel/trace/trace.c:1624:31: sparse:     got char const *
   kernel/trace/trace.c:1649:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   kernel/trace/trace.c:1649:23: sparse:     expected char const [noderef] __user *__ptr_clean
   kernel/trace/trace.c:1649:23: sparse:     got char const *
   kernel/trace/trace.c:2879:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace.c:2879:38: sparse:     expected struct event_filter *filter
   kernel/trace/trace.c:2879:38: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace.c:360:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:360:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:360:9: sparse:    struct trace_export *
   kernel/trace/trace.c:375:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:375:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:375:9: sparse:    struct trace_export *
--
>> fs/autofs/root.c:812:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/autofs/root.c:812:16: sparse:     expected int [noderef] __user *__ptr_clean
   fs/autofs/root.c:812:16: sparse:     got int *
   fs/autofs/root.c:819:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/autofs/root.c:819:16: sparse:     expected int [noderef] __user *__ptr_clean
   fs/autofs/root.c:819:16: sparse:     got int *
>> fs/autofs/root.c:790:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   fs/autofs/root.c:790:14: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   fs/autofs/root.c:790:14: sparse:     got unsigned long *
   fs/autofs/root.c:794:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *__ptr_clean @@     got unsigned long * @@
   fs/autofs/root.c:794:14: sparse:     expected unsigned long [noderef] __user *__ptr_clean
   fs/autofs/root.c:794:14: sparse:     got unsigned long *
   fs/autofs/root.c:834:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/autofs/root.c:834:18: sparse:     expected int [noderef] __user *__ptr_clean
   fs/autofs/root.c:834:18: sparse:     got int *
--
>> fs/autofs/expire.c:616:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/autofs/expire.c:616:20: sparse:     expected int [noderef] __user *__ptr_clean
   fs/autofs/expire.c:616:20: sparse:     got int *
--
>> fs/cifs/cifs_debug.c:779:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const [noderef] __user *__ptr_clean @@     got char const * @@
   fs/cifs/cifs_debug.c:779:14: sparse:     expected char const [noderef] __user *__ptr_clean
   fs/cifs/cifs_debug.c:779:14: sparse:     got char const *
--
>> fs/cifs/ioctl.c:163:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/cifs/ioctl.c:163:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/cifs/ioctl.c:163:13: sparse:     got unsigned int *
>> fs/cifs/ioctl.c:355:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/cifs/ioctl.c:355:38: sparse:     expected int [noderef] __user *__ptr_clean
   fs/cifs/ioctl.c:355:38: sparse:     got int *
   fs/cifs/ioctl.c:365:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int [noderef] __user *__ptr_clean @@     got int * @@
   fs/cifs/ioctl.c:365:29: sparse:     expected int [noderef] __user *__ptr_clean
   fs/cifs/ioctl.c:365:29: sparse:     got int *
--
>> fs/cifs/smb2ops.c:1954:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/cifs/smb2ops.c:1954:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/cifs/smb2ops.c:1954:13: sparse:     got unsigned int *
--
>> kernel/bpf/syscall.c:1700:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:1700:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:1700:13: sparse:     got unsigned int *
>> kernel/bpf/syscall.c:3189:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   kernel/bpf/syscall.c:3189:21: sparse:     expected char [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:3189:21: sparse:     got char *
   kernel/bpf/syscall.c:3659:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:3659:23: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:3659:23: sparse:     got unsigned int *
   kernel/bpf/syscall.c:3935:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:3935:29: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:3935:29: sparse:     got unsigned int *
>> kernel/bpf/syscall.c:4058:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   kernel/bpf/syscall.c:4058:45: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4058:45: sparse:     got unsigned long long *
   kernel/bpf/syscall.c:4064:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   kernel/bpf/syscall.c:4064:37: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4064:37: sparse:     got unsigned long long *
   kernel/bpf/syscall.c:4086:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:4086:45: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4086:45: sparse:     got unsigned int *
   kernel/bpf/syscall.c:4091:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:4091:37: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4091:37: sparse:     got unsigned int *
   kernel/bpf/syscall.c:4144:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   kernel/bpf/syscall.c:4144:37: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4144:37: sparse:     got unsigned long long *
   kernel/bpf/syscall.c:4176:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:4176:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4176:13: sparse:     got unsigned int *
   kernel/bpf/syscall.c:4221:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:4221:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4221:13: sparse:     got unsigned int *
   kernel/bpf/syscall.c:4273:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:4273:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4273:13: sparse:     got unsigned int *
   kernel/bpf/syscall.c:4350:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:4350:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4350:13: sparse:     got unsigned int *
   kernel/bpf/syscall.c:4358:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   kernel/bpf/syscall.c:4358:29: sparse:     expected char [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4358:29: sparse:     got char *
   kernel/bpf/syscall.c:4373:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   kernel/bpf/syscall.c:4373:29: sparse:     expected char [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4373:29: sparse:     got char *
   kernel/bpf/syscall.c:4378:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:4378:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4378:13: sparse:     got unsigned int *
   kernel/bpf/syscall.c:4379:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/syscall.c:4379:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4379:13: sparse:     got unsigned int *
   kernel/bpf/syscall.c:4380:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   kernel/bpf/syscall.c:4380:13: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4380:13: sparse:     got unsigned long long *
   kernel/bpf/syscall.c:4381:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [noderef] __user *__ptr_clean @@     got unsigned long long * @@
   kernel/bpf/syscall.c:4381:13: sparse:     expected unsigned long long [noderef] __user *__ptr_clean
   kernel/bpf/syscall.c:4381:13: sparse:     got unsigned long long *
--
>> kernel/bpf/bpf_iter.c:481:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   kernel/bpf/bpf_iter.c:481:29: sparse:     expected char [noderef] __user *__ptr_clean
   kernel/bpf/bpf_iter.c:481:29: sparse:     got char *
--
   kernel/bpf/hashtab.c:1023:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __percpu *[assigned] pptr @@     got void * @@
   kernel/bpf/hashtab.c:1023:30: sparse:     expected void [noderef] __percpu *[assigned] pptr
   kernel/bpf/hashtab.c:1023:30: sparse:     got void *
   kernel/bpf/hashtab.c:1029:44: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *ptr_to_pptr @@     got void [noderef] __percpu *[assigned] pptr @@
   kernel/bpf/hashtab.c:1029:44: sparse:     expected void *ptr_to_pptr
   kernel/bpf/hashtab.c:1029:44: sparse:     got void [noderef] __percpu *[assigned] pptr
   kernel/bpf/hashtab.c:1030:34: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/bpf/hashtab.c:1030:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __percpu *[assigned] pptr @@     got void * @@
   kernel/bpf/hashtab.c:1030:30: sparse:     expected void [noderef] __percpu *[assigned] pptr
   kernel/bpf/hashtab.c:1030:30: sparse:     got void *
>> kernel/bpf/hashtab.c:1689:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/hashtab.c:1689:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/hashtab.c:1689:13: sparse:     got unsigned int *
   kernel/bpf/hashtab.c:1870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/hashtab.c:1870:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/hashtab.c:1870:13: sparse:     got unsigned int *
   kernel/bpf/hashtab.c:801:27: sparse: sparse: context imbalance in 'htab_lru_map_delete_node' - unexpected unlock
   kernel/bpf/hashtab.c:1160:27: sparse: sparse: context imbalance in 'htab_map_update_elem' - unexpected unlock
   kernel/bpf/hashtab.c:1227:27: sparse: sparse: context imbalance in 'htab_lru_map_update_elem' - unexpected unlock
   kernel/bpf/hashtab.c:1288:27: sparse: sparse: context imbalance in '__htab_percpu_map_update_elem' - unexpected unlock
   kernel/bpf/hashtab.c:1353:27: sparse: sparse: context imbalance in '__htab_lru_percpu_map_update_elem' - unexpected unlock
   kernel/bpf/hashtab.c:1405:27: sparse: sparse: context imbalance in 'htab_map_delete_elem' - unexpected unlock
   kernel/bpf/hashtab.c:1439:27: sparse: sparse: context imbalance in 'htab_lru_map_delete_elem' - unexpected unlock
   kernel/bpf/hashtab.c:1614:27: sparse: sparse: context imbalance in '__htab_map_lookup_and_delete_elem' - unexpected unlock
   kernel/bpf/hashtab.c:1750:17: sparse: sparse: context imbalance in '__htab_map_lookup_and_delete_batch' - unexpected unlock
   kernel/bpf/hashtab.c:1983:17: sparse: sparse: context imbalance in 'bpf_hash_map_seq_find_next' - unexpected unlock
   kernel/bpf/hashtab.c: note: in included file (through include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/rcupdate.h:769:9: sparse: sparse: context imbalance in 'bpf_hash_map_seq_stop' - unexpected unlock
--
>> kernel/bpf/verifier.c:327:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   kernel/bpf/verifier.c:327:13: sparse:     expected char [noderef] __user *__ptr_clean
   kernel/bpf/verifier.c:327:13: sparse:     got char *
   kernel/bpf/verifier.c:14389:38: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c: note: in included file (through include/linux/bpf.h, include/linux/bpf-cgroup.h):
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
--
>> kernel/bpf/btf.c:6991:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __user *__ptr_clean @@     got char * @@
   kernel/bpf/btf.c:6991:29: sparse:     expected char [noderef] __user *__ptr_clean
   kernel/bpf/btf.c:6991:29: sparse:     got char *
>> kernel/bpf/btf.c:6999:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/bpf/btf.c:6999:13: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   kernel/bpf/btf.c:6999:13: sparse:     got unsigned int *
--
   kernel/events/core.c:1403:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1403:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1403:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1416:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1416:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1416:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3425:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3425:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3425:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3426:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3426:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3426:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3486:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3486:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3486:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3487:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3487:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3487:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4721:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4721:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4721:25: sparse:    struct perf_event_context *
   kernel/events/core.c:5992:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5992:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5992:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5464:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
>> kernel/events/core.c:11846:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/events/core.c:11958:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   kernel/events/core.c:5708:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5708:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5708:22: sparse:    struct perf_buffer *
   kernel/events/core.c:5832:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5832:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5832:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5865:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5865:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5865:14: sparse:    struct perf_buffer *
   kernel/events/core.c:5922:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5922:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5922:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6013:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6013:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6013:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6029:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6029:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6029:14: sparse:    struct perf_buffer *
   kernel/events/core.c:7741:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7741:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:7741:23: sparse:    struct perf_event_context *
   kernel/events/core.c:7793:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7793:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:7793:23: sparse:    struct perf_event_context *
   kernel/events/core.c:7832:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7832:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:7832:13: sparse:    struct perf_buffer *
   kernel/events/core.c:7937:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:7937:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:7937:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:7939:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:7939:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:7939:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8640:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8640:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8640:23: sparse:    struct perf_event_context *
   kernel/events/core.c:9646:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9646:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9646:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9685:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9685:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9685:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9867:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9867:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9867:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11059:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:12889:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:12889:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:12889:9: sparse:    struct perf_event_context *
   kernel/events/core.c:12999:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:12999:17: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:12999:17: sparse:    struct perf_event_context *
   kernel/events/core.c:13429:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13429:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13429:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:168:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:176:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rcupdate.h, include/linux/rculist.h, include/linux/dcache.h, ...):
   include/linux/rcutiny.h:164:44: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1450:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2798:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:4693:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:209:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/core.c:9495:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9495:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9495:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9515:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9515:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9515:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9635:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9635:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9635:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9635:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9635:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9635:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9635:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9635:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9635:16: sparse:    struct swevent_hlist *
--
>> fs/fuse/dev.c:2261:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *__ptr_clean @@     got unsigned int * @@
   fs/fuse/dev.c:2261:22: sparse:     expected unsigned int [noderef] __user *__ptr_clean
   fs/fuse/dev.c:2261:22: sparse:     got unsigned int *

vim +279 arch/x86/kernel/process.c

389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  269  
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  270  int get_tsc_mode(unsigned long adr)
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  271  {
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  272  	unsigned int val;
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  273  
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  274  	if (test_thread_flag(TIF_NOTSC))
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  275  		val = PR_TSC_SIGSEGV;
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  276  	else
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  277  		val = PR_TSC_ENABLE;
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  278  
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27 @279  	return put_user(val, (unsigned int __user *)adr);
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  280  }
389d1fb11e5f2a Jeremy Fitzhardinge 2009-02-27  281  

:::::: The code at line 279 was first introduced by commit
:::::: 389d1fb11e5f2a16b5e34c547756f0c4dec641f7 x86: unify chunks of kernel/process*.c

:::::: TO: Jeremy Fitzhardinge <jeremy@goop.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
