Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1303839B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382394; cv=none; b=QQ4r8L99673PSYZfoSdlY/yz04aqauJsFIN2FkqaUjxfAcUJK0FQ7VE583MO8hluCXAKlVYYPY+2zftO99HPca9cTsUQ9mHeOV5THmxRpQo75g2XZ1nrjXJ7vi4vmX4s1i/x3Cc9OsGxCV7lpsYQ5QaPuPZnODA4giVhIB5NxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382394; c=relaxed/simple;
	bh=XGGxXOvYh9nCkApPAPlwLvFPZU+O5XcSCmENFA9lUG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cvxd+1ZZmgITughPHMUeXzFIy63cpVLzb2rOrxooEDo39KlUfIj7cmf+yZgwh/SdhguBHQYmE/1j0Gq4HDjELuEh3vGN1YrZ4S9Qvzxi2CDJ9OsjYjHGhBu/JLigX/kKdcK9gRVHtiDbfHrKRMUpm2t2NgAWo6x6KXAVY8KzXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQ3/yctD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQ3/yctD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779382388; x=1810918388;
  h=date:from:to:cc:subject:message-id;
  bh=XGGxXOvYh9nCkApPAPlwLvFPZU+O5XcSCmENFA9lUG0=;
  b=dQ3/yctDKGJt1xNWGINPclv0EjbH8xUgxmS8XY4kis9O0tAedWsd9x1d
   qN6MpLWtfXq4/VxxBldtub5t5YG836TRaPbdSb2XtnTc8sZtx3COxpV0a
   ZM+2YdbKelxZgVC/AuHfHaGekkorlA2pkw/9heYHyHubxfoYkGT/KZ9+p
   KyrXQYXkV5YcRHcH9HMFb1NDhUvrPn5nbA29MKRUuBGjvNu36oW6THbkY
   EB8SGP544t22XqS3vOzjuV07WxOzLMe2NCryCRttr5vzVr6PGYjXtAGPQ
   zlQ9GFlvSUiisAXTG+F+T6lMfB6G3AGDvV4Zql2VbhUN/+7pajl+HNtCq
   Q==;
X-CSE-ConnectionGUID: gM6Qjw4YRcavPxpqPj1c0Q==
X-CSE-MsgGUID: 1ptYkBHNQnWBb6mgBlKVOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91416383"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="91416383"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 09:53:08 -0700
X-CSE-ConnectionGUID: CADA94MTRfO1uWVuO1OA7g==
X-CSE-MsgGUID: BPkbozAQR1mnLZtSdUMgYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="237976403"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 May 2026 09:53:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ6ds-00000000B0b-0qBc;
	Thu, 21 May 2026 16:53:04 +0000
Date: Thu, 21 May 2026 18:52:25 +0200
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/ring-buffer-bootid 4/4]
 kernel/trace/trace.c:5841:12: error: invalid storage class for function
 'l_show'
Message-ID: <202605211817.WsvyJnd4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/ring-buffer-bootid
head:   11c7f327c260ca2dd626cb8e242b1aed41959caf
commit: 11c7f327c260ca2dd626cb8e242b1aed41959caf [4/4] tracing: Record and show boot ID in last_boot_info
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260521/202605211817.WsvyJnd4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211817.WsvyJnd4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211817.WsvyJnd4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'show_last_boot_header':
>> kernel/trace/trace.c:5841:12: error: invalid storage class for function 'l_show'
    5841 | static int l_show(struct seq_file *m, void *v)
         |            ^~~~~~
>> kernel/trace/trace.c:5859:27: error: initializer element is not constant
    5859 |         .show           = l_show,
         |                           ^~~~~~
   kernel/trace/trace.c:5859:27: note: (near initialization for 'last_boot_seq_ops.show')
>> kernel/trace/trace.c:5862:12: error: invalid storage class for function 'tracing_last_boot_open'
    5862 | static int tracing_last_boot_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:5884:12: error: invalid storage class for function 'tracing_buffer_meta_open'
    5884 | static int tracing_buffer_meta_open(struct inode *inode, struct file *filp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:5901:1: error: invalid storage class for function 'tracing_free_buffer_write'
    5901 | tracing_free_buffer_write(struct file *filp, const char __user *ubuf,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:5915:1: error: invalid storage class for function 'tracing_free_buffer_release'
    5915 | tracing_free_buffer_release(struct inode *inode, struct file *filp)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:5932:16: error: invalid storage class for function 'write_marker_to_buffer'
    5932 | static ssize_t write_marker_to_buffer(struct trace_array *tr, const char *buf,
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:598,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   kernel/trace/trace.c: In function 'trace_user_fault_destroy':
>> include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'struct trace_user_buf'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:239:9: note: in expansion of macro '__verify_pcpu_ptr'
     239 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6016:23: note: in expansion of macro 'per_cpu_ptr'
    6016 |                 buf = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
         |                       ^~~~~~~~~~~
>> kernel/trace/trace.c:6016:52: error: invalid use of undefined type 'struct trace_user_buf'
    6016 |                 buf = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
         |                                                    ^~
   kernel/trace/trace.c: In function 'show_last_boot_header':
>> kernel/trace/trace.c:6022:12: error: invalid storage class for function 'user_fault_buffer_enable'
    6022 | static int user_fault_buffer_enable(struct trace_user_buf_info *tinfo, size_t size)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'user_fault_buffer_enable':
>> kernel/trace/trace.c:6029:21: error: assignment to '__seg_gs struct trace_user_buf *' from incompatible pointer type '__seg_gs struct trace_user_buf *' [-Wincompatible-pointer-types]
    6029 |         tinfo->tbuf = alloc_percpu(struct trace_user_buf);
         |                     ^
>> include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'struct trace_user_buf'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:239:9: note: in expansion of macro '__verify_pcpu_ptr'
     239 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6038:17: note: in expansion of macro 'per_cpu_ptr'
    6038 |                 per_cpu_ptr(tinfo->tbuf, cpu)->buf = NULL;
         |                 ^~~~~~~~~~~
   kernel/trace/trace.c:6038:46: error: invalid use of undefined type 'struct trace_user_buf'
    6038 |                 per_cpu_ptr(tinfo->tbuf, cpu)->buf = NULL;
         |                                              ^~
>> include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'struct trace_user_buf'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:239:9: note: in expansion of macro '__verify_pcpu_ptr'
     239 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6046:17: note: in expansion of macro 'per_cpu_ptr'
    6046 |                 per_cpu_ptr(tinfo->tbuf, cpu)->buf = buf;
         |                 ^~~~~~~~~~~
   kernel/trace/trace.c:6046:46: error: invalid use of undefined type 'struct trace_user_buf'
    6046 |                 per_cpu_ptr(tinfo->tbuf, cpu)->buf = buf;
         |                                              ^~
   kernel/trace/trace.c: In function 'show_last_boot_header':
>> kernel/trace/trace.c:6053:13: error: invalid storage class for function 'user_buffer_free'
    6053 | static void user_buffer_free(struct trace_user_buf_info **tinfo)
         |             ^~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:6063:12: error: invalid storage class for function 'user_buffer_init'
    6063 | static int user_buffer_init(struct trace_user_buf_info **tinfo, size_t size)
         |            ^~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:6085:13: error: invalid storage class for function 'user_buffer_put'
    6085 | static void user_buffer_put(struct trace_user_buf_info **tinfo)
         |             ^~~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'trace_user_fault_read':
>> include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'struct trace_user_buf'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:239:9: note: in expansion of macro '__verify_pcpu_ptr'
     239 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6203:24: note: in expansion of macro 'per_cpu_ptr'
    6203 |         char *buffer = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
         |                        ^~~~~~~~~~~
   kernel/trace/trace.c:6203:53: error: invalid use of undefined type 'struct trace_user_buf'
    6203 |         char *buffer = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
         |                                                     ^~
>> include/linux/percpu-defs.h:221:59: error: invalid use of undefined type 'struct trace_user_buf'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                           ^
   include/linux/percpu-defs.h:239:9: note: in expansion of macro '__verify_pcpu_ptr'
     239 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6242:34: note: in expansion of macro 'per_cpu_ptr'
    6242 |                         buffer = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
         |                                  ^~~~~~~~~~~
   kernel/trace/trace.c:6242:63: error: invalid use of undefined type 'struct trace_user_buf'
    6242 |                         buffer = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
         |                                                               ^~
   kernel/trace/trace.c: In function 'show_last_boot_header':
>> kernel/trace/trace.c:6300:1: error: invalid storage class for function 'tracing_mark_write'
    6300 | tracing_mark_write(struct file *filp, const char __user *ubuf,
         | ^~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:6345:16: error: invalid storage class for function 'write_raw_marker_to_buffer'
    6345 | static ssize_t write_raw_marker_to_buffer(struct trace_array *tr,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6381:1: error: invalid storage class for function 'tracing_mark_raw_write'
    6381 | tracing_mark_raw_write(struct file *filp, const char __user *ubuf,
         | ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6424:12: error: invalid storage class for function 'tracing_mark_open'
    6424 | static int tracing_mark_open(struct inode *inode, struct file *filp)
         |            ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6445:12: error: invalid storage class for function 'tracing_mark_release'
    6445 | static int tracing_mark_release(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6451:12: error: invalid storage class for function 'tracing_clock_show'
    6451 | static int tracing_clock_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6505:16: error: invalid storage class for function 'tracing_clock_write'
    6505 | static ssize_t tracing_clock_write(struct file *filp, const char __user *ubuf,
         |                ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6533:12: error: invalid storage class for function 'tracing_clock_open'
    6533 | static int tracing_clock_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6554:12: error: invalid storage class for function 'tracing_time_stamp_mode_show'
    6554 | static int tracing_time_stamp_mode_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6568:12: error: invalid storage class for function 'tracing_time_stamp_mode_open'
    6568 | static int tracing_time_stamp_mode_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6632:27: error: initializer element is not constant
    6632 |         .open           = tracing_buffer_meta_open,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6632:27: note: (near initialization for 'tracing_buffer_meta_fops.open')
   kernel/trace/trace.c:6647:27: error: initializer element is not constant
    6647 |         .write          = tracing_free_buffer_write,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6647:27: note: (near initialization for 'tracing_free_buffer_fops.write')
   kernel/trace/trace.c:6648:27: error: initializer element is not constant
    6648 |         .release        = tracing_free_buffer_release,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6648:27: note: (near initialization for 'tracing_free_buffer_fops.release')
   kernel/trace/trace.c:6652:27: error: initializer element is not constant
    6652 |         .open           = tracing_mark_open,
         |                           ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6652:27: note: (near initialization for 'tracing_mark_fops.open')
   kernel/trace/trace.c:6653:27: error: initializer element is not constant
    6653 |         .write          = tracing_mark_write,
         |                           ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6653:27: note: (near initialization for 'tracing_mark_fops.write')
   kernel/trace/trace.c:6654:27: error: initializer element is not constant
    6654 |         .release        = tracing_mark_release,
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6654:27: note: (near initialization for 'tracing_mark_fops.release')
   kernel/trace/trace.c:6658:27: error: initializer element is not constant
    6658 |         .open           = tracing_mark_open,
         |                           ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6658:27: note: (near initialization for 'tracing_mark_raw_fops.open')
   kernel/trace/trace.c:6659:27: error: initializer element is not constant
    6659 |         .write          = tracing_mark_raw_write,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6659:27: note: (near initialization for 'tracing_mark_raw_fops.write')
   kernel/trace/trace.c:6660:27: error: initializer element is not constant
    6660 |         .release        = tracing_mark_release,
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6660:27: note: (near initialization for 'tracing_mark_raw_fops.release')
   kernel/trace/trace.c:6664:27: error: initializer element is not constant
    6664 |         .open           = tracing_clock_open,
         |                           ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6664:27: note: (near initialization for 'trace_clock_fops.open')
   kernel/trace/trace.c:6668:27: error: initializer element is not constant
    6668 |         .write          = tracing_clock_write,
         |                           ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6668:27: note: (near initialization for 'trace_clock_fops.write')
   kernel/trace/trace.c:6672:27: error: initializer element is not constant
    6672 |         .open           = tracing_time_stamp_mode_open,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6672:27: note: (near initialization for 'trace_time_stamp_mode_fops.open')
   kernel/trace/trace.c:6679:27: error: initializer element is not constant
    6679 |         .open           = tracing_last_boot_open,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6679:27: note: (near initialization for 'last_boot_fops.open')
   kernel/trace/trace.c:6698:1: error: invalid storage class for function 'trace_min_max_write'
    6698 | trace_min_max_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
         | ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6744:1: error: invalid storage class for function 'trace_min_max_read'
    6744 | trace_min_max_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
         | ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6791:32: error: invalid storage class for function 'alloc_tracing_log_err'
    6791 | static struct tracing_log_err *alloc_tracing_log_err(int len)
         |                                ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6808:13: error: invalid storage class for function 'free_tracing_log_err'
    6808 | static void free_tracing_log_err(struct tracing_log_err *err)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6814:32: error: invalid storage class for function 'get_tracing_log_err'
    6814 | static struct tracing_log_err *get_tracing_log_err(struct trace_array *tr,
         |                                ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6920:13: error: invalid storage class for function 'clear_tracing_err_log'
    6920 | static void clear_tracing_err_log(struct trace_array *tr)
         |             ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6934:14: error: invalid storage class for function 'tracing_err_log_seq_start'
    6934 | static void *tracing_err_log_seq_start(struct seq_file *m, loff_t *pos)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6943:14: error: invalid storage class for function 'tracing_err_log_seq_next'


vim +/l_show +5841 kernel/trace/trace.c

7a1d1e4b9639ff Steven Rostedt (Google    2024-06-12  5840) 
1bd25a6f7173c0 Steven Rostedt            2025-03-05 @5841  static int l_show(struct seq_file *m, void *v)
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5842  {
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5843  	struct trace_array *tr = m->private;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5844  	struct trace_mod_entry *entry = v;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5845  
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5846  	if (v == LAST_BOOT_HEADER) {
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5847  		show_last_boot_header(m, tr);
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5848  		return 0;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5849  	}
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5850  
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5851  	seq_printf(m, "%lx\t%s\n", entry->mod_addr, entry->mod_name);
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5852  	return 0;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5853  }
7a1d1e4b9639ff Steven Rostedt (Google    2024-06-12  5854) 
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5855  static const struct seq_operations last_boot_seq_ops = {
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5856  	.start		= l_start,
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5857  	.next		= l_next,
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5858  	.stop		= l_stop,
1bd25a6f7173c0 Steven Rostedt            2025-03-05 @5859  	.show		= l_show,
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5860  };
7a1d1e4b9639ff Steven Rostedt (Google    2024-06-12  5861) 
1bd25a6f7173c0 Steven Rostedt            2025-03-05 @5862  static int tracing_last_boot_open(struct inode *inode, struct file *file)
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5863  {
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5864  	struct trace_array *tr = inode->i_private;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5865  	struct seq_file *m;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5866  	int ret;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5867  
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5868  	ret = tracing_check_open_get_tr(tr);
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5869  	if (ret)
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5870  		return ret;
7a1d1e4b9639ff Steven Rostedt (Google    2024-06-12  5871) 
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5872  	ret = seq_open(file, &last_boot_seq_ops);
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5873  	if (ret) {
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5874  		trace_array_put(tr);
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5875  		return ret;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5876  	}
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5877  
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5878  	m = file->private_data;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5879  	m->private = tr;
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5880  
1bd25a6f7173c0 Steven Rostedt            2025-03-05  5881  	return 0;
7a1d1e4b9639ff Steven Rostedt (Google    2024-06-12  5882) }
7a1d1e4b9639ff Steven Rostedt (Google    2024-06-12  5883) 
950032ffcee7a4 Steven Rostedt (Google    2024-06-12 @5884) static int tracing_buffer_meta_open(struct inode *inode, struct file *filp)
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5885) {
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5886) 	struct trace_array *tr = inode->i_private;
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5887) 	int cpu = tracing_get_cpu(inode);
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5888) 	int ret;
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5889) 
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5890) 	ret = tracing_check_open_get_tr(tr);
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5891) 	if (ret)
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5892) 		return ret;
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5893) 
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5894) 	ret = ring_buffer_meta_seq_init(filp, tr->array_buffer.buffer, cpu);
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5895) 	if (ret < 0)
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5896) 		__trace_array_put(tr);
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5897) 	return ret;
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5898) }
950032ffcee7a4 Steven Rostedt (Google    2024-06-12  5899) 
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5900  static ssize_t
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13 @5901  tracing_free_buffer_write(struct file *filp, const char __user *ubuf,
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5902  			  size_t cnt, loff_t *ppos)
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5903  {
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5904  	/*
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5905  	 * There is no need to read what the user has written, this function
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5906  	 * is just to make sure that there is no error when "echo" is used
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5907  	 */
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5908  
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5909  	*ppos += cnt;
a98a3c3fde3ae7 Steven Rostedt            2008-05-12  5910  
a98a3c3fde3ae7 Steven Rostedt            2008-05-12  5911  	return cnt;
a98a3c3fde3ae7 Steven Rostedt            2008-05-12  5912  }
a98a3c3fde3ae7 Steven Rostedt            2008-05-12  5913  
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5914  static int
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13 @5915  tracing_free_buffer_release(struct inode *inode, struct file *filp)
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5916  {
2b6080f28c7cc3 Steven Rostedt            2012-05-11  5917  	struct trace_array *tr = inode->i_private;
2b6080f28c7cc3 Steven Rostedt            2012-05-11  5918  
cf30cf67d6c759 Steven Rostedt            2011-06-14  5919  	/* disable tracing ? */
bbec8e28cac592 Masami Hiramatsu (Google  2025-10-31  5920) 	if (tr->trace_flags & TRACE_ITER(STOP_ON_FREE))
711e124379e0f8 Alexander Z Lam           2013-08-02  5921  		tracer_tracing_off(tr);
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5922  	/* resize the ring buffer to 0 */
2b6080f28c7cc3 Steven Rostedt            2012-05-11  5923  	tracing_resize_ring_buffer(tr, 0, RING_BUFFER_ALL_CPUS);
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5924  
7b85af63034818 Steven Rostedt (Red Hat   2013-07-01  5925) 	trace_array_put(tr);
7b85af63034818 Steven Rostedt (Red Hat   2013-07-01  5926) 
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5927  	return 0;
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5928  }
4f271a2a60c748 Vaibhav Nagarnaik         2011-06-13  5929  
095fe4891282be Steven Rostedt (Google    2024-03-04  5930) #define TRACE_MARKER_MAX_SIZE		4096
095fe4891282be Steven Rostedt (Google    2024-03-04  5931) 
64cf7d058a005c Steven Rostedt            2025-10-08 @5932  static ssize_t write_marker_to_buffer(struct trace_array *tr, const char *buf,
7b382efd5e8af4 Steven Rostedt            2025-05-08  5933  				      size_t cnt, unsigned long ip)
5bf9a1ee350a10 Pekka Paalanen            2008-09-16  5934  {
d696b58ca2c3ca Steven Rostedt            2011-09-22  5935  	struct ring_buffer_event *event;
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5936) 	enum event_trigger_type tt = ETT_NONE;
13292494379f92 Steven Rostedt (VMware    2019-12-13  5937) 	struct trace_buffer *buffer;
d696b58ca2c3ca Steven Rostedt            2011-09-22  5938  	struct print_entry *entry;
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5939) 	int meta_size;
d696b58ca2c3ca Steven Rostedt            2011-09-22  5940  	ssize_t written;
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5941) 	size_t size;
5bf9a1ee350a10 Pekka Paalanen            2008-09-16  5942  
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5943) 	meta_size = sizeof(*entry) + 2;  /* add '\0' and possible '\n' */
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5944)  again:
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5945) 	size = cnt + meta_size;
d696b58ca2c3ca Steven Rostedt            2011-09-22  5946  
1c5eb4481e0151 Steven Rostedt (VMware    2020-01-09  5947) 	buffer = tr->array_buffer.buffer;
3e9a8aadca4807 Steven Rostedt (Red Hat   2016-11-23  5948) 	event = __trace_buffer_lock_reserve(buffer, TRACE_PRINT, size,
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  5949  					    tracing_gen_ctx());
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5950) 	if (unlikely(!event)) {
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5951) 		/*
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5952) 		 * If the size was greater than what was allowed, then
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5953) 		 * make it smaller and try again.
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5954) 		 */
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5955) 		if (size > ring_buffer_max_event_size(buffer)) {
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5956) 			cnt = ring_buffer_max_event_size(buffer) - meta_size;
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5957) 			/* The above should only happen once */
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5958) 			if (WARN_ON_ONCE(cnt + meta_size == size))
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5959) 				return -EBADF;
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5960) 			goto again;
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5961) 		}
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5962) 
d696b58ca2c3ca Steven Rostedt            2011-09-22  5963  		/* Ring buffer disabled, return as if not open for write */
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  5964) 		return -EBADF;
8ec90be7f15fac Steven Rostedt (Google    2023-12-12  5965) 	}
d696b58ca2c3ca Steven Rostedt            2011-09-22  5966  
d696b58ca2c3ca Steven Rostedt            2011-09-22  5967  	entry = ring_buffer_event_data(event);
7b382efd5e8af4 Steven Rostedt            2025-05-08  5968  	entry->ip = ip;
64cf7d058a005c Steven Rostedt            2025-10-08  5969  	memcpy(&entry->buf, buf, cnt);
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  5970) 	written = cnt;
5bf9a1ee350a10 Pekka Paalanen            2008-09-16  5971  
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5972) 	if (tr->trace_marker_file && !list_empty(&tr->trace_marker_file->triggers)) {
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5973) 		/* do not add \n before testing triggers, but add \0 */
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5974) 		entry->buf[cnt] = '\0';
b47e330231acbf Steven Rostedt (VMware    2021-03-16  5975) 		tt = event_triggers_call(tr->trace_marker_file, buffer, entry, event);
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5976) 	}
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5977) 
d696b58ca2c3ca Steven Rostedt            2011-09-22  5978  	if (entry->buf[cnt - 1] != '\n') {
d696b58ca2c3ca Steven Rostedt            2011-09-22  5979  		entry->buf[cnt] = '\n';
d696b58ca2c3ca Steven Rostedt            2011-09-22  5980  		entry->buf[cnt + 1] = '\0';
d696b58ca2c3ca Steven Rostedt            2011-09-22  5981  	} else
d696b58ca2c3ca Steven Rostedt            2011-09-22  5982  		entry->buf[cnt] = '\0';
d696b58ca2c3ca Steven Rostedt            2011-09-22  5983  
458999c6f67b0f Tingwei Zhang             2020-10-05  5984  	if (static_branch_unlikely(&trace_marker_exports_enabled))
458999c6f67b0f Tingwei Zhang             2020-10-05  5985  		ftrace_exports(event, TRACE_EXPORT_MARKER);
7ffbd48d5cab22 Steven Rostedt            2012-10-11  5986  	__buffer_unlock_commit(buffer, event);
5bf9a1ee350a10 Pekka Paalanen            2008-09-16  5987  
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5988) 	if (tt)
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5989) 		event_triggers_post_call(tr->trace_marker_file, tt);
3dd8095368475a Steven Rostedt (VMware    2018-05-09  5990) 
fa32e8557b470f Steven Rostedt            2016-07-06  5991  	return written;
6edb2a8a385f0c Steven Rostedt            2012-05-11  5992  }
fa32e8557b470f Steven Rostedt            2016-07-06  5993  
64cf7d058a005c Steven Rostedt            2025-10-08  5994  struct trace_user_buf {
64cf7d058a005c Steven Rostedt            2025-10-08  5995  	char		*buf;
64cf7d058a005c Steven Rostedt            2025-10-08  5996  };
64cf7d058a005c Steven Rostedt            2025-10-08  5997  
64cf7d058a005c Steven Rostedt            2025-10-08  5998  static DEFINE_MUTEX(trace_user_buffer_mutex);
64cf7d058a005c Steven Rostedt            2025-10-08  5999  static struct trace_user_buf_info *trace_user_buffer;
64cf7d058a005c Steven Rostedt            2025-10-08  6000  
a9f16872642203 Steven Rostedt            2025-10-28  6001  /**
a9f16872642203 Steven Rostedt            2025-10-28  6002   * trace_user_fault_destroy - free up allocated memory of a trace user buffer
a9f16872642203 Steven Rostedt            2025-10-28  6003   * @tinfo: The descriptor to free up
a9f16872642203 Steven Rostedt            2025-10-28  6004   *
a9f16872642203 Steven Rostedt            2025-10-28  6005   * Frees any data allocated in the trace info dsecriptor.
a9f16872642203 Steven Rostedt            2025-10-28  6006   */
a9f16872642203 Steven Rostedt            2025-10-28  6007  void trace_user_fault_destroy(struct trace_user_buf_info *tinfo)
64cf7d058a005c Steven Rostedt            2025-10-08  6008  {
64cf7d058a005c Steven Rostedt            2025-10-08  6009  	char *buf;
64cf7d058a005c Steven Rostedt            2025-10-08  6010  	int cpu;
64cf7d058a005c Steven Rostedt            2025-10-08  6011  
a9f16872642203 Steven Rostedt            2025-10-28  6012  	if (!tinfo || !tinfo->tbuf)
a9f16872642203 Steven Rostedt            2025-10-28  6013  		return;
a9f16872642203 Steven Rostedt            2025-10-28  6014  
64cf7d058a005c Steven Rostedt            2025-10-08  6015  	for_each_possible_cpu(cpu) {
64cf7d058a005c Steven Rostedt            2025-10-08 @6016  		buf = per_cpu_ptr(tinfo->tbuf, cpu)->buf;
64cf7d058a005c Steven Rostedt            2025-10-08  6017  		kfree(buf);
64cf7d058a005c Steven Rostedt            2025-10-08  6018  	}
64cf7d058a005c Steven Rostedt            2025-10-08  6019  	free_percpu(tinfo->tbuf);
64cf7d058a005c Steven Rostedt            2025-10-08  6020  }
64cf7d058a005c Steven Rostedt            2025-10-08  6021  
a9f16872642203 Steven Rostedt            2025-10-28 @6022  static int user_fault_buffer_enable(struct trace_user_buf_info *tinfo, size_t size)
64cf7d058a005c Steven Rostedt            2025-10-08  6023  {
64cf7d058a005c Steven Rostedt            2025-10-08  6024  	char *buf;
64cf7d058a005c Steven Rostedt            2025-10-08  6025  	int cpu;
64cf7d058a005c Steven Rostedt            2025-10-08  6026  
a9f16872642203 Steven Rostedt            2025-10-28  6027  	lockdep_assert_held(&trace_user_buffer_mutex);
64cf7d058a005c Steven Rostedt            2025-10-08  6028  
64cf7d058a005c Steven Rostedt            2025-10-08 @6029  	tinfo->tbuf = alloc_percpu(struct trace_user_buf);
a9f16872642203 Steven Rostedt            2025-10-28  6030  	if (!tinfo->tbuf)
64cf7d058a005c Steven Rostedt            2025-10-08  6031  		return -ENOMEM;
64cf7d058a005c Steven Rostedt            2025-10-08  6032  
64cf7d058a005c Steven Rostedt            2025-10-08  6033  	tinfo->ref = 1;
a9f16872642203 Steven Rostedt            2025-10-28  6034  	tinfo->size = size;
64cf7d058a005c Steven Rostedt            2025-10-08  6035  
64cf7d058a005c Steven Rostedt            2025-10-08  6036  	/* Clear each buffer in case of error */
64cf7d058a005c Steven Rostedt            2025-10-08  6037  	for_each_possible_cpu(cpu) {
64cf7d058a005c Steven Rostedt            2025-10-08  6038  		per_cpu_ptr(tinfo->tbuf, cpu)->buf = NULL;
64cf7d058a005c Steven Rostedt            2025-10-08  6039  	}
64cf7d058a005c Steven Rostedt            2025-10-08  6040  
64cf7d058a005c Steven Rostedt            2025-10-08  6041  	for_each_possible_cpu(cpu) {
a9f16872642203 Steven Rostedt            2025-10-28  6042  		buf = kmalloc_node(size, GFP_KERNEL,
64cf7d058a005c Steven Rostedt            2025-10-08  6043  				   cpu_to_node(cpu));
a9f16872642203 Steven Rostedt            2025-10-28  6044  		if (!buf)
64cf7d058a005c Steven Rostedt            2025-10-08  6045  			return -ENOMEM;
64cf7d058a005c Steven Rostedt            2025-10-08  6046  		per_cpu_ptr(tinfo->tbuf, cpu)->buf = buf;
64cf7d058a005c Steven Rostedt            2025-10-08  6047  	}
64cf7d058a005c Steven Rostedt            2025-10-08  6048  
64cf7d058a005c Steven Rostedt            2025-10-08  6049  	return 0;
64cf7d058a005c Steven Rostedt            2025-10-08  6050  }
64cf7d058a005c Steven Rostedt            2025-10-08  6051  

:::::: The code at line 5841 was first introduced by commit
:::::: 1bd25a6f7173c005844cd0076718b3c87bccd891 tracing: Show module names and addresses of last boot

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
