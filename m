Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E00321A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaEOxl1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702813809; x=1734349809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCVzPhEbNT6THTSID+8T8f1fWbcs5gV4lvukZODTWbg=;
  b=EaEOxl1zK6DM3lmHsJBPQqSQKmhpFEVuWa2j6JthREXSThSXmJk825rm
   TEgyLzsqkd3XXAekDGCYjM5LZvZCTpWrb2TyI8ps1DAzAco5cdf6gRb77
   8IsuKzkF5P2EnV+iATPGcNU+O0f72z9xIx/u6XaZP8CAdVxiV9bzddbF+
   y44a0y34CtlcYrCQqMi0fAnEjlVpik1RKuAE1FNCVp4DlrKAqX4vJaJoY
   oTSJ8q3tiO8h5qQMB51GZZCoADbJ25fit+XGQq+T9t8rybRKVMMWm1UMd
   tKBAghsUTZr++XGAda9BKnaPw5d3azDfQTe9vXJp/BeD0Oux1vnzwYakF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="380404466"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="380404466"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 03:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="804226924"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="804226924"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Dec 2023 03:50:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEpen-0002zQ-0K;
	Sun, 17 Dec 2023 11:50:05 +0000
Date: Sun, 17 Dec 2023 19:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 40/50] include/linux/seccomp.h:49:8: error:
 redefinition of 'struct seccomp'
Message-ID: <202312171918.na5FZjab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 9da0ecf79b1a28b051c2398bcc6c5f606632d19e [40/50] seccomp: Split out seccomp_types.h
config: i386-randconfig-012-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171918.na5FZjab-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171918.na5FZjab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171918.na5FZjab-lkp@intel.com/

Note: the bcachefs/header_cleanup HEAD 7288b19e061b7aa3f46f685e9944af128f10ffd5 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/ptrace.h:12,
                    from include/linux/audit.h:13,
                    from include/linux/fsnotify.h:16,
                    from fs/debugfs/inode.c:23:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from fs/debugfs/inode.c:15:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
--
   In file included from include/linux/ptrace.h:12,
                    from kernel/ptrace.c:21:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from kernel/ptrace.c:13:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
   kernel/ptrace.c: In function 'check_ptrace_options':
>> kernel/ptrace.c:382:34: error: passing argument 1 of 'seccomp_mode' from incompatible pointer type [-Werror=incompatible-pointer-types]
     382 |                 if (seccomp_mode(&current->seccomp) != SECCOMP_MODE_DISABLED ||
         |                                  ^~~~~~~~~~~~~~~~~
         |                                  |
         |                                  struct seccomp *
   In file included from include/linux/ptrace.h:12,
                    from kernel/ptrace.c:21:
   include/linux/seccomp.h:70:48: note: expected 'struct seccomp *' but argument is of type 'struct seccomp *'
      70 | static inline int seccomp_mode(struct seccomp *s)
         |                                ~~~~~~~~~~~~~~~~^
   cc1: some warnings being treated as errors
--
   In file included from include/linux/ptrace.h:12,
                    from include/linux/ftrace.h:16,
                    from include/linux/kprobes.h:28,
                    from include/linux/kgdb.h:19,
                    from kernel/panic.c:15:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from kernel/panic.c:14:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
   kernel/panic.c: In function '__warn':
   kernel/panic.c:670:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     670 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~
--
   In file included from include/linux/ptrace.h:12,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from kernel/audit.c:44:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from include/linux/mm.h:28,
                    from kernel/audit.c:38:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
   kernel/audit.c: In function 'audit_log_vformat':
   kernel/audit.c:1962:9: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1962 |         len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args);
         |         ^~~
   kernel/audit.c:1971:17: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1971 |                 len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args2);
         |                 ^~~
--
   In file included from include/linux/ptrace.h:12,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from kernel/bpf/btf.c:6:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from include/linux/ptrace.h:6,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from kernel/bpf/btf.c:6:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
   kernel/bpf/btf.c: In function 'btf_seq_show':
   kernel/bpf/btf.c:7094:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7094 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
         |                             ^~~~~~~~
   kernel/bpf/btf.c: In function 'btf_snprintf_show':
   kernel/bpf/btf.c:7131:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7131 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
         |         ^~~
--
   In file included from include/linux/ptrace.h:12,
                    from include/linux/audit.h:13,
                    from include/net/xfrm.h:15,
                    from net/ipv4/route.c:97:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from net/ipv4/route.c:63:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
   net/ipv4/route.c: In function 'ip_rt_send_redirect':
   net/ipv4/route.c:880:13: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
     880 |         int log_martians;
         |             ^~~~~~~~~~~~
--
   In file included from include/linux/ptrace.h:12,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/fair.c:54:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/energy_model.h:5,
                    from kernel/sched/fair.c:23:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
   kernel/sched/fair.c:13041:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   13041 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13043:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   13043 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13048:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   13048 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13050:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   13050 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/ptrace.h:12,
                    from include/linux/ftrace.h:16,
                    from include/linux/kprobes.h:28,
                    from include/linux/kgdb.h:19,
                    from include/linux/fb.h:6,
                    from include/linux/platform_data/simplefb.h:12,
                    from include/linux/sysfb.h:11,
                    from drivers/firmware/efi/sysfb_efi.c:26:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/dmi.h:6,
                    from drivers/firmware/efi/sysfb_efi.c:16:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
   drivers/firmware/efi/sysfb_efi.c:345:39: warning: 'efifb_fwnode_ops' defined but not used [-Wunused-const-variable=]
     345 | static const struct fwnode_operations efifb_fwnode_ops = {
         |                                       ^~~~~~~~~~~~~~~~
   drivers/firmware/efi/sysfb_efi.c:238:35: warning: 'efifb_dmi_swap_width_height' defined but not used [-Wunused-const-variable=]
     238 | static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/sysfb_efi.c:188:35: warning: 'efifb_dmi_system_table' defined but not used [-Wunused-const-variable=]
     188 | static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/ptrace.h:12,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from kernel/time/hrtimer.c:30:
>> include/linux/seccomp.h:49:8: error: redefinition of 'struct seccomp'
      49 | struct seccomp { };
         |        ^~~~~~~
   In file included from include/linux/sched.h:22,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/seccomp_types.h:20:8: note: originally defined here
      20 | struct seccomp {
         |        ^~~~~~~
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')


vim +49 include/linux/seccomp.h

42a17ad2762f465 Ralf Baechle    2009-04-18  48  
932ecebb0405b9a Will Drewry     2012-04-12 @49  struct seccomp { };
e2cfabdfd075648 Will Drewry     2012-04-12  50  struct seccomp_filter { };
3135f5b73592988 Thomas Gleixner 2020-07-26  51  struct seccomp_data;
^1da177e4c3f415 Linus Torvalds  2005-04-16  52  

:::::: The code at line 49 was first introduced by commit
:::::: 932ecebb0405b9a41cd18946e6cff8a17d434e23 seccomp: kill the seccomp_t typedef

:::::: TO: Will Drewry <wad@chromium.org>
:::::: CC: James Morris <james.l.morris@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
