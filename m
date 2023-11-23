Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEDE1FA2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 01:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eB2kfXnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704514; x=1732240514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdsIuKG13+wB6gNWSlZpSqmbJmVJ9B4l8RTs84Y4DtY=;
  b=eB2kfXnnnfN5oMEoSGT8BvAk8toNC7OZ6+sksjZrnVi4v7i/LclwLXuY
   vpByBF/lyK6BWlsPQUA5XkgoU3zBqgOmazqnTqM/p1Y9cus60JyLqU+ZI
   NjLvlxEF7G7kc2j8sw0SyOpea++grBGk3OX5XtqeaZnb9wuijEW4go2Zy
   k1PkYG3dYb7rAT056dGa08JHYyByGzh4hngsO2y09dur4E517x1Kasf4s
   i7tvvHQUd5Wfh88zgIuw/tHQKdIHkQ1UOfrqPC2gJLSL2cWvQ4XDSilhI
   6dFn4nFOp63KOCa7Z3jsOc8U2fdU0N5W/AA9fYlBq9xL9eoThXqYgiCWV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13737173"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="13737173"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801909597"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801909597"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Nov 2023 17:55:10 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5yvs-00016I-1M;
	Thu, 23 Nov 2023 01:55:08 +0000
Date: Thu, 23 Nov 2023 09:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2254/2429] arch/parisc/include/asm/bug.h:70:17:
 error: invalid 'asm': operand number out of range
Message-ID: <202311230405.edAXyqKp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   288736c822de7fd3b69be317c11eaa8dfb78bf6f
commit: 2546732f135427a14e8cf0d0b1a72862368d86e8 [2254/2429] parisc: Use correct alignment in __bug_table
config: parisc-randconfig-r081-20231122 (https://download.01.org/0day-ci/archive/20231123/202311230405.edAXyqKp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230405.edAXyqKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230405.edAXyqKp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/cpumask.h:14,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/dmi.h:6,
                    from drivers/media/cec/i2c/ch7322.c:17:
   In function 'ch7322_send_message',
       inlined from 'ch7322_cec_adap_transmit' at drivers/media/cec/i2c/ch7322.c:360:8:
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/parisc/include/asm/bug.h:92:25: note: in expansion of macro '__WARN'
      92 |                         __WARN();                               \
         |                         ^~~~~~
   drivers/media/cec/i2c/ch7322.c:172:9: note: in expansion of macro 'WARN_ON'
     172 |         WARN_ON(!mutex_is_locked(&ch7322->mutex));
         |         ^~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/most/core.c:8:
   drivers/most/core.c: In function 'most_submit_mbo':
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:152:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   drivers/most/core.c:927:13: note: in expansion of macro 'WARN_ONCE'
     927 |         if (WARN_ONCE(!mbo || !mbo->context,
         |             ^~~~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/most/most_cdev.c:8:
   In function 'check_copy_size',
       inlined from 'copy_to_user' at include/linux/uaccess.h:190:6,
       inlined from 'comp_read' at drivers/most/most_cdev.c:265:15:
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/mtd/maps/physmap-core.c:26:
   drivers/mtd/maps/physmap-core.c: In function 'physmap_flash_remove':
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/parisc/include/asm/bug.h:92:25: note: in expansion of macro '__WARN'
      92 |                         __WARN();                               \
         |                         ^~~~~~
   drivers/mtd/maps/physmap-core.c:75:17: note: in expansion of macro 'WARN_ON'
      75 |                 WARN_ON(mtd_device_unregister(info->cmtd));
         |                 ^~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/cpumask.h:14,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/mtd/devices/spear_smi.c:16:
   drivers/mtd/devices/spear_smi.c: In function 'spear_smi_remove':
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/parisc/include/asm/bug.h:92:25: note: in expansion of macro '__WARN'
      92 |                         __WARN();                               \
         |                         ^~~~~~
   drivers/mtd/devices/spear_smi.c:1049:17: note: in expansion of macro 'WARN_ON'
    1049 |                 WARN_ON(mtd_device_unregister(&flash->mtd));
         |                 ^~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/mtd/hyperbus/hyperbus-core.c:8:
   drivers/mtd/hyperbus/hyperbus-core.c: In function 'hyperbus_unregister_device':
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/parisc/include/asm/bug.h:92:25: note: in expansion of macro '__WARN'
      92 |                         __WARN();                               \
         |                         ^~~~~~
   drivers/mtd/hyperbus/hyperbus-core.c:132:17: note: in expansion of macro 'WARN_ON'
     132 |                 WARN_ON(mtd_device_unregister(hbdev->mtd));
         |                 ^~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/media/i2c/cx25840/cx25840-core.c:30:
   In function 'cx25840_init',
       inlined from 'cx25840_init' at drivers/media/i2c/cx25840/cx25840-core.c:2263:12:
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/parisc/include/asm/bug.h:89:25: note: in expansion of macro '__WARN'
      89 |                         __WARN();                               \
         |                         ^~~~~~
   drivers/media/i2c/cx25840/cx25840-core.c:2288:17: note: in expansion of macro 'WARN_ON'
    2288 |                 WARN_ON(1);
         |                 ^~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from drivers/hwmon/pmbus/pmbus_core.c:9:
   drivers/hwmon/pmbus/pmbus_core.c: In function 'pmbus_add_boolean':
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:1250:13: note: in expansion of macro 'WARN'
    1250 |         if (WARN((s1 && !s2) || (!s1 && s2), "Bad s1/s2 parameters\n"))
         |             ^~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from fs/pstore/blk.c:10:
   fs/pstore/blk.c: In function '__register_pstore_device':
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:103:33: note: in expansion of macro '__WARN_FLAGS'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^~~~~~~~~~~~
   arch/parisc/include/asm/bug.h:92:25: note: in expansion of macro '__WARN'
      92 |                         __WARN();                               \
         |                         ^~~~~~
   include/linux/lockdep.h:318:14: note: in expansion of macro 'WARN_ON'
     318 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^~~~~~~
   include/linux/lockdep.h:324:9: note: in expansion of macro 'lockdep_assert'
     324 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   fs/pstore/blk.c:101:9: note: in expansion of macro 'lockdep_assert_held'
     101 |         lockdep_assert_held(&pstore_blk_lock);
         |         ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/task_io_accounting_ops.h:8,
                    from fs/netfs/buffered_read.c:9:
   In function 'trace_netfs_read',
       inlined from 'trace_netfs_read' at include/trace/events/netfs.h:127:1,
       inlined from 'netfs_rreq_expand' at fs/netfs/buffered_read.c:145:3:
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/tracepoint.h:262:25: note: in expansion of macro 'WARN_ON_ONCE'
     262 |                         WARN_ON_ONCE(!rcu_is_watching());               \
         |                         ^~~~~~~~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:9: note: in expansion of macro 'DECLARE_TRACE'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/netfs.h:127:1: note: in expansion of macro 'TRACE_EVENT'
     127 | TRACE_EVENT(netfs_read,
         | ^~~~~~~~~~~
--
   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from fs/netfs/io.c:8:
   In function 'trace_netfs_failure',
       inlined from 'trace_netfs_rreq' at include/trace/events/netfs.h:226:1,
       inlined from 'netfs_rreq_completed' at fs/netfs/io.c:99:2,
       inlined from 'netfs_rreq_unmark_after_write' at fs/netfs/io.c:139:2:
>> arch/parisc/include/asm/bug.h:70:17: error: invalid 'asm': operand number out of range
      70 |                 asm volatile("\n"                                       \
         |                 ^~~
   include/asm-generic/bug.h:113:17: note: in expansion of macro '__WARN_FLAGS'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^~~~~~~~~~~~
   include/linux/tracepoint.h:262:25: note: in expansion of macro 'WARN_ON_ONCE'
     262 |                         WARN_ON_ONCE(!rcu_is_watching());               \
         |                         ^~~~~~~~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:9: note: in expansion of macro 'DECLARE_TRACE'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/netfs.h:226:1: note: in expansion of macro 'TRACE_EVENT'
     226 | TRACE_EVENT(netfs_failure,
         | ^~~~~~~~~~~
..

smatch warnings:
drivers/parisc/lasi.c:216 lasi_init_chip() warn: 'lasi->gsc_irq.irq' from request_irq() not released on lines: 207.

vim +/asm +70 arch/parisc/include/asm/bug.h

^1da177e4c3f41 include/asm-parisc/bug.h      Linus Torvalds 2005-04-16  50  
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  51  #ifdef CONFIG_DEBUG_BUGVERBOSE
19d436268dde95 arch/parisc/include/asm/bug.h Peter Zijlstra 2017-02-25  52  #define __WARN_FLAGS(flags)						\
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  53  	do {								\
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  54  		asm volatile("\n"					\
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  55  			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
325cdacd03c126 arch/parisc/include/asm/bug.h Josh Poimboeuf 2017-07-15  56  			     "\t.pushsection __bug_table,\"aw\"\n"	\
2546732f135427 arch/parisc/include/asm/bug.h Helge Deller   2023-11-20  57  			     "\t.align %4\n"				\
0b3d643f9ead9b include/asm-parisc/bug.h      Helge Deller   2007-01-28  58  			     "2:\t" ASM_WORD_INSN "1b, %c0\n"		\
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  59  			     "\t.short %c1, %c2\n"			\
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  60  			     "\t.org 2b+%c3\n"				\
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  61  			     "\t.popsection"				\
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  62  			     : : "i" (__FILE__), "i" (__LINE__),	\
19d436268dde95 arch/parisc/include/asm/bug.h Peter Zijlstra 2017-02-25  63  			     "i" (BUGFLAG_WARNING|(flags)),		\
2546732f135427 arch/parisc/include/asm/bug.h Helge Deller   2023-11-20  64  			     "i" (sizeof(struct bug_entry)),		\
2546732f135427 arch/parisc/include/asm/bug.h Helge Deller   2023-11-20  65  			     "i" (sizeof(long)) );			\
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  66  	} while(0)
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  67  #else
19d436268dde95 arch/parisc/include/asm/bug.h Peter Zijlstra 2017-02-25  68  #define __WARN_FLAGS(flags)						\
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  69  	do {								\
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16 @70  		asm volatile("\n"					\
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  71  			     "1:\t" PARISC_BUG_BREAK_ASM "\n"		\
325cdacd03c126 arch/parisc/include/asm/bug.h Josh Poimboeuf 2017-07-15  72  			     "\t.pushsection __bug_table,\"aw\"\n"	\
2546732f135427 arch/parisc/include/asm/bug.h Helge Deller   2023-11-20  73  			     "\t.align %4\n"				\
0b3d643f9ead9b include/asm-parisc/bug.h      Helge Deller   2007-01-28  74  			     "2:\t" ASM_WORD_INSN "1b\n"		\
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  75  			     "\t.short %c0\n"				\
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  76  			     "\t.org 2b+%c1\n"				\
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  77  			     "\t.popsection"				\
19d436268dde95 arch/parisc/include/asm/bug.h Peter Zijlstra 2017-02-25  78  			     : : "i" (BUGFLAG_WARNING|(flags)),		\
2546732f135427 arch/parisc/include/asm/bug.h Helge Deller   2023-11-20  79  			     "i" (sizeof(struct bug_entry)),		\
2546732f135427 arch/parisc/include/asm/bug.h Helge Deller   2023-11-20  80  			     "i" (sizeof(long)) );			\
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  81  	} while(0)
e3828764746718 include/asm-parisc/bug.h      Helge Deller   2006-12-16  82  #endif
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  83  
6891f8a1135b96 include/asm-parisc/bug.h      Helge Deller   2006-12-16  84  

:::::: The code at line 70 was first introduced by commit
:::::: e38287647467188d8b8d1adadc6ab26267758151 [PARISC] fix build for WARN_ON() when CONFIG_DEBUG_BUGVERBOSE=y

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Kyle McMartin <kyle@athena.road.mcmartin.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
