Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFA01B0F18
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733299172; cv=none; b=usYizkhChrGSYnYBv0lxhvY2iCQ/LKZT2ei3XqzoKK4ZXCkUfgMFBNzHVSPny2UiW3/V3/X1KFI1HJlOH7/iBKS3Qn7S3li07WZUCDa55KwCNe3Es3C0g3f+Ntm4oVUNWFYB9KTfkWjFjdem1JTLmAeOEPdcrdYYBXzAWD1Rd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733299172; c=relaxed/simple;
	bh=uAns2edFoQjIIRGKfFgXUPhKebjt5ikg2K2YFavDKtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQfJxNuadpKRbnWfkMLA4QMYvv4GnRfil+edVN7Fup/Pvd/f76YP8Va30IzHvxwg5/+0fe0p9027TKeNkOsbJ8egtZeqxqvbKB814XTLotUslP5G2d44jGBoYL3+9MFOLR2BAEq6br5HeeIkseJBvsacqR2xdytj9RG/ua4eLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkbnQ2z5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkbnQ2z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733299170; x=1764835170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uAns2edFoQjIIRGKfFgXUPhKebjt5ikg2K2YFavDKtk=;
  b=OkbnQ2z5p7Ni1+jQq55FPm+FLzuhO3HF7DX7t+Qh/4dPusAIQN9VEjVH
   Xeup5nCy30I10brieY1aTO5MjI74EUfMKYvpEjTEnYecSBNZfXPfQJKVD
   HR+XijqYa7YDO/tHSjuLuXvWjtAdQOtSP12dc9LKPmmtwfq9rD3YBqxGx
   yEjhAslVBnvDDIwXHWMUhssMehP3wyHZ0RXLDFEhJjBoHbbh2io/QqZYE
   zynQAoXKLP/J05anMhSS65XU7RkHKtFIgY51g35B8qk/EIDquVdS1Y6Jp
   rj4eAa0KnTVDlCt1f07nqy3GyGpRBBkr6V7P+8ubuMQOLPkJO8mBWZaFv
   Q==;
X-CSE-ConnectionGUID: tl9x3K4DQme4j22lJDz5jw==
X-CSE-MsgGUID: M5jkuJlzSuurh5kzb1FLyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37489247"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="37489247"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:59:30 -0800
X-CSE-ConnectionGUID: 0I8DNCbYTO2mqE9iDweu9Q==
X-CSE-MsgGUID: 2t6nCoTuTB+oGeLYpVaV9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="98707743"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Dec 2024 23:59:28 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIkI1-0002jK-0S;
	Wed, 04 Dec 2024 07:59:19 +0000
Date: Wed, 4 Dec 2024 15:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Levi Yun <yeoreum.yun@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 1570/1720] include/linux/vtime.h:128:13: error:
 storage class specified for parameter 'irqtime_account_irq'
Message-ID: <202412041504.oq0bmWdd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c245a7a79602ccbee780c004c1e4abcda66aec32
commit: cc5d45d2f1eb624c0ca77ea4fc57edc611e0ec34 [1570/1720] firmware: arm_ffa: Fix the race around setting ffa_dev->properties
config: arm64-randconfig-003-20241204 (https://download.01.org/0day-ci/archive/20241204/202412041504.oq0bmWdd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041504.oq0bmWdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041504.oq0bmWdd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

      53 | {
         | ^
   include/linux/context_tracking_state.h:60:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      60 | {
         | ^
   include/linux/context_tracking_state.h:65:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      65 | {
         | ^
   include/linux/context_tracking_state.h:72:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      72 | {
         | ^
   include/linux/context_tracking_state.h:79:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      79 | {
         | ^
   include/linux/context_tracking_state.h:84:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      84 | {
         | ^
   include/linux/context_tracking_state.h:91:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      91 | {
         | ^
   include/linux/context_tracking_state.h:96:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      96 | {
         | ^
   include/linux/context_tracking_state.h:104:32: error: storage class specified for parameter 'context_tracking_key'
     104 | extern struct static_key_false context_tracking_key;
         |                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/context_tracking_state.h:107:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     107 | {
         | ^
   include/linux/context_tracking_state.h:112:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     112 | {
         | ^
   include/linux/context_tracking_state.h:117:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     117 | {
         | ^
   include/linux/context_tracking_state.h:129:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     129 | {
         | ^
   In file included from include/linux/hardirq.h:8:
   include/linux/ftrace_irq.h:16:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      16 | {
         | ^
   include/linux/ftrace_irq.h:28:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      28 | {
         | ^
   In file included from include/linux/hardirq.h:10:
   include/linux/vtime.h:12:13: error: storage class specified for parameter 'vtime_account_kernel'
      12 | extern void vtime_account_kernel(struct task_struct *tsk);
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/vtime.h:13:13: error: storage class specified for parameter 'vtime_account_idle'
      13 | extern void vtime_account_idle(struct task_struct *tsk);
         |             ^~~~~~~~~~~~~~~~~~
   include/linux/vtime.h:17:13: error: storage class specified for parameter 'vtime_user_enter'
      17 | extern void vtime_user_enter(struct task_struct *tsk);
         |             ^~~~~~~~~~~~~~~~
   include/linux/vtime.h:18:13: error: storage class specified for parameter 'vtime_user_exit'
      18 | extern void vtime_user_exit(struct task_struct *tsk);
         |             ^~~~~~~~~~~~~~~
   include/linux/vtime.h:19:13: error: storage class specified for parameter 'vtime_guest_enter'
      19 | extern void vtime_guest_enter(struct task_struct *tsk);
         |             ^~~~~~~~~~~~~~~~~
   include/linux/vtime.h:20:13: error: storage class specified for parameter 'vtime_guest_exit'
      20 | extern void vtime_guest_exit(struct task_struct *tsk);
         |             ^~~~~~~~~~~~~~~~
   include/linux/vtime.h:21:13: error: storage class specified for parameter 'vtime_init_idle'
      21 | extern void vtime_init_idle(struct task_struct *tsk, int cpu);
         |             ^~~~~~~~~~~~~~~
   include/linux/vtime.h:36:84: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      36 | static inline void vtime_account_irq(struct task_struct *tsk, unsigned int offset) { }
         |                                                                                    ^
   include/linux/vtime.h:37:67: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      37 | static inline void vtime_account_softirq(struct task_struct *tsk) { }
         |                                                                   ^
   include/linux/vtime.h:38:67: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      38 | static inline void vtime_account_hardirq(struct task_struct *tsk) { }
         |                                                                   ^
   include/linux/vtime.h:39:57: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      39 | static inline void vtime_flush(struct task_struct *tsk) { }
         |                                                         ^
   include/linux/vtime.h:71:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      71 | {
         | ^
   include/linux/vtime.h:76:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      76 | {
         | ^
   include/linux/vtime.h:81:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      81 | {
         | ^
   include/linux/vtime.h:85:13: error: storage class specified for parameter 'vtime_task_switch_generic'
      85 | extern void vtime_task_switch_generic(struct task_struct *prev);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vtime.h:88:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      88 | {
         | ^
   include/linux/vtime.h:94:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      94 | {
         | ^
   include/linux/vtime.h:102:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     102 | {
         | ^
>> include/linux/vtime.h:128:13: error: storage class specified for parameter 'irqtime_account_irq'
     128 | extern void irqtime_account_irq(struct task_struct *tsk, unsigned int offset);
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/vtime.h:134:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     134 | {
         | ^
   include/linux/vtime.h:140:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     140 | {
         | ^
   include/linux/vtime.h:146:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     146 | {
         | ^
   include/linux/vtime.h:152:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     152 | {
         | ^
   In file included from arch/arm64/include/asm/irq.h:9,
                    from arch/arm64/include/asm/hardirq.h:12,
                    from include/linux/hardirq.h:11:
   include/asm-generic/irq.h:15:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      15 | {
         | ^
   arch/arm64/include/asm/irq.h:14:1: warning: empty declaration
      14 | struct pt_regs;
         | ^~~~~~
   arch/arm64/include/asm/irq.h:21:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      21 | {
         | ^
   In file included from arch/arm64/include/asm/kvm_arm.h:10,
                    from arch/arm64/include/asm/hardirq.h:13:
   arch/arm64/include/asm/esr.h:419:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     419 | {
         | ^
   arch/arm64/include/asm/esr.h:424:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     424 | {
         | ^
   arch/arm64/include/asm/esr.h:431:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     431 | {
         | ^
   arch/arm64/include/asm/esr.h:437:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     437 | {
         | ^
   arch/arm64/include/asm/esr.h:448:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     448 | {
         | ^
   arch/arm64/include/asm/esr.h:458:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     458 | {
         | ^
   arch/arm64/include/asm/esr.h:469:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     469 | {
         | ^
   arch/arm64/include/asm/esr.h:475:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     475 | {
         | ^
   In file included from arch/arm64/include/asm/hardirq.h:17:
   include/asm-generic/hardirq.h:13:25: error: storage class specified for parameter 'irq_cpustat_t'
      13 | } ____cacheline_aligned irq_cpustat_t;
         |                         ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:87:40: error: storage class specified for parameter '__pcpu_scope_irq_stat'
      87 |         extern __PCPU_DUMMY_ATTRS char __pcpu_scope_##name;             \
         |                                        ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:147:9: note: in expansion of macro 'DECLARE_PER_CPU_SECTION'
     147 |         DECLARE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/hardirq.h:15:1: note: in expansion of macro 'DECLARE_PER_CPU_ALIGNED'
      15 | DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:87:40: error: section attribute not allowed for '__pcpu_scope_irq_stat'
      87 |         extern __PCPU_DUMMY_ATTRS char __pcpu_scope_##name;             \
         |                                        ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:147:9: note: in expansion of macro 'DECLARE_PER_CPU_SECTION'
     147 |         DECLARE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/hardirq.h:15:1: note: in expansion of macro 'DECLARE_PER_CPU_ALIGNED'
      15 | DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/hardirq.h:15:40: error: storage class specified for parameter 'irq_stat'
      15 | DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
         |                                        ^~~~~~~~
   include/linux/percpu-defs.h:88:51: note: in definition of macro 'DECLARE_PER_CPU_SECTION'
      88 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                                   ^~~~
   include/asm-generic/hardirq.h:15:1: note: in expansion of macro 'DECLARE_PER_CPU_ALIGNED'
      15 | DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/hardirq.h:15:40: error: alignment may not be specified for 'irq_stat'
      15 | DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
         |                                        ^~~~~~~~
   include/linux/percpu-defs.h:88:51: note: in definition of macro 'DECLARE_PER_CPU_SECTION'
      88 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                                   ^~~~
   include/asm-generic/hardirq.h:15:1: note: in expansion of macro 'DECLARE_PER_CPU_ALIGNED'
      15 | DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/hardirq.h:15:40: error: section attribute not allowed for 'irq_stat'
      15 | DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
         |                                        ^~~~~~~~
   include/linux/percpu-defs.h:88:51: note: in definition of macro 'DECLARE_PER_CPU_SECTION'
      88 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                                   ^~~~
   include/asm-generic/hardirq.h:15:1: note: in expansion of macro 'DECLARE_PER_CPU_ALIGNED'
      15 | DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
--
   include/linux/interrupt.h:772:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     772 | {
         | ^
   include/linux/interrupt.h:778:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     778 | {
         | ^
   include/linux/interrupt.h:788:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     788 | {
         | ^
   include/linux/interrupt.h:795:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     795 | {
         | ^
   include/linux/interrupt.h:802:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     802 | {
         | ^
   include/linux/interrupt.h:807:13: error: storage class specified for parameter 'tasklet_kill'
     807 | extern void tasklet_kill(struct tasklet_struct *t);
         |             ^~~~~~~~~~~~
   include/linux/interrupt.h:808:13: error: storage class specified for parameter 'tasklet_init'
     808 | extern void tasklet_init(struct tasklet_struct *t,
         |             ^~~~~~~~~~~~
   include/linux/interrupt.h:810:13: error: storage class specified for parameter 'tasklet_setup'
     810 | extern void tasklet_setup(struct tasklet_struct *t,
         |             ^~~~~~~~~~~~~
   include/linux/interrupt.h:855:22: error: storage class specified for parameter 'probe_irq_on'
     855 | extern unsigned long probe_irq_on(void);        /* returns 0 on failure */
         |                      ^~~~~~~~~~~~
   include/linux/interrupt.h:856:12: error: storage class specified for parameter 'probe_irq_off'
     856 | extern int probe_irq_off(unsigned long);        /* returns 0 or negative on failure */
         |            ^~~~~~~~~~~~~
   include/linux/interrupt.h:857:21: error: storage class specified for parameter 'probe_irq_mask'
     857 | extern unsigned int probe_irq_mask(unsigned long);      /* returns mask of ISA interrupts */
         |                     ^~~~~~~~~~~~~~
   include/linux/interrupt.h:865:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     865 | {
         | ^
   include/linux/interrupt.h:875:1: warning: empty declaration
     875 | struct seq_file;
         | ^~~~~~
   include/linux/interrupt.h:879:12: error: storage class specified for parameter 'early_irq_init'
     879 | extern int early_irq_init(void);
         |            ^~~~~~~~~~~~~~
   include/linux/interrupt.h:880:12: error: storage class specified for parameter 'arch_probe_nr_irqs'
     880 | extern int arch_probe_nr_irqs(void);
         |            ^~~~~~~~~~~~~~~~~~
   include/linux/interrupt.h:881:12: error: storage class specified for parameter 'arch_early_irq_init'
     881 | extern int arch_early_irq_init(void);
         |            ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm.h:8,
                    from drivers/firmware/arm_ffa/driver.c:36:
   include/linux/pgalloc_tag.h:240:58: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     240 | static inline void clear_page_tag_ref(struct page *page) {}
         |                                                          ^
   include/linux/pgalloc_tag.h:242:53: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     242 |                                    unsigned int nr) {}
         |                                                     ^
   include/linux/pgalloc_tag.h:243:72: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     243 | static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
         |                                                                        ^
   include/linux/pgalloc_tag.h:244:68: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     244 | static inline struct alloc_tag *pgalloc_tag_get(struct page *page) { return NULL; }
         |                                                                    ^
   include/linux/pgalloc_tag.h:245:82: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     245 | static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr) {}
         |                                                                                  ^
   include/linux/pgalloc_tag.h:246:45: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     246 | static inline void alloc_tag_sec_init(void) {}
         |                                             ^
   include/linux/pgalloc_tag.h:247:89: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     247 | static inline void pgalloc_tag_split(struct folio *folio, int old_order, int new_order) {}
         |                                                                                         ^
   include/linux/pgalloc_tag.h:248:75: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     248 | static inline void pgalloc_tag_copy(struct folio *new, struct folio *old) {}
         |                                                                           ^
   In file included from include/linux/mm.h:17:
   include/linux/range.h:6:1: warning: empty declaration
       6 | struct range {
         | ^~~~~~
   include/linux/range.h:12:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      12 | {
         | ^
   include/linux/range.h:19:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      19 | {
         | ^
   include/linux/range.h:26:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      26 | {
         | ^
   In file included from include/linux/mm.h:23:
   include/linux/page_ext.h:8:1: warning: empty declaration
       8 | struct pglist_data;
         | ^~~~~~
   include/linux/page_ext.h:24:1: warning: empty declaration
      24 | struct page_ext_operations {
         | ^~~~~~
   include/linux/page_ext.h:35:1: warning: empty declaration
      35 | enum page_ext_flags {
         | ^~~~
   include/linux/page_ext.h:51:1: warning: empty declaration
      51 | struct page_ext {
         | ^~~~~~
>> include/linux/page_ext.h:55:13: error: storage class specified for parameter 'early_page_ext'
      55 | extern bool early_page_ext;
         |             ^~~~~~~~~~~~~~
>> include/linux/page_ext.h:56:22: error: storage class specified for parameter 'page_ext_size'
      56 | extern unsigned long page_ext_size;
         |                      ^~~~~~~~~~~~~
>> include/linux/page_ext.h:57:13: error: storage class specified for parameter 'pgdat_page_ext_init'
      57 | extern void pgdat_page_ext_init(struct pglist_data *pgdat);
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/page_ext.h:60:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      60 | {
         | ^
   include/linux/page_ext.h:66:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      66 | {
         | ^
>> include/linux/page_ext.h:68:13: error: storage class specified for parameter 'page_ext_init'
      68 | extern void page_ext_init(void);
         |             ^~~~~~~~~~~~~
   include/linux/page_ext.h:70:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      70 | {
         | ^
>> include/linux/page_ext.h:80:25: error: storage class specified for parameter 'page_ext_get'
      80 | extern struct page_ext *page_ext_get(const struct page *page);
         |                         ^~~~~~~~~~~~
>> include/linux/page_ext.h:81:13: error: storage class specified for parameter 'page_ext_put'
      81 | extern void page_ext_put(struct page_ext *page_ext);
         |             ^~~~~~~~~~~~
   include/linux/page_ext.h:85:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      85 | {
         | ^
   include/linux/page_ext.h:90:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      90 | {
         | ^
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_set'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:10:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      10 | DECLARE_TRACEPOINT(page_ref_set);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_mod'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:11:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      11 | DECLARE_TRACEPOINT(page_ref_mod);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_mod_and_test'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:12:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      12 | DECLARE_TRACEPOINT(page_ref_mod_and_test);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_mod_and_return'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:13:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      13 | DECLARE_TRACEPOINT(page_ref_mod_and_return);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_mod_unless'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:14:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      14 | DECLARE_TRACEPOINT(page_ref_mod_unless);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_freeze'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:15:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      15 | DECLARE_TRACEPOINT(page_ref_freeze);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_unfreeze'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:16:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      16 | DECLARE_TRACEPOINT(page_ref_unfreeze);
         | ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm.h:26:
>> include/linux/page_ref.h:29:13: error: storage class specified for parameter '__page_ref_set'
      29 | extern void __page_ref_set(struct page *page, int v);
         |             ^~~~~~~~~~~~~~
>> include/linux/page_ref.h:30:13: error: storage class specified for parameter '__page_ref_mod'
      30 | extern void __page_ref_mod(struct page *page, int v);
         |             ^~~~~~~~~~~~~~
>> include/linux/page_ref.h:31:13: error: storage class specified for parameter '__page_ref_mod_and_test'
      31 | extern void __page_ref_mod_and_test(struct page *page, int v, int ret);
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/page_ref.h:32:13: error: storage class specified for parameter '__page_ref_mod_and_return'
      32 | extern void __page_ref_mod_and_return(struct page *page, int v, int ret);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/page_ref.h:33:13: error: storage class specified for parameter '__page_ref_mod_unless'
      33 | extern void __page_ref_mod_unless(struct page *page, int v, int u);
         |             ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/page_ref.h:34:13: error: storage class specified for parameter '__page_ref_freeze'
      34 | extern void __page_ref_freeze(struct page *page, int v, int ret);
         |             ^~~~~~~~~~~~~~~~~
>> include/linux/page_ref.h:35:13: error: storage class specified for parameter '__page_ref_unfreeze'
      35 | extern void __page_ref_unfreeze(struct page *page, int v);
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/page_ref.h:66:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      66 | {
         | ^
   include/linux/page_ref.h:88:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      88 | {
         | ^
   include/linux/page_ref.h:93:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      93 | {
         | ^
   include/linux/page_ref.h:98:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      98 | {
         | ^
   include/linux/page_ref.h:105:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     105 | {
         | ^
   include/linux/page_ref.h:114:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     114 | {
         | ^
   include/linux/page_ref.h:119:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     119 | {
         | ^
   include/linux/page_ref.h:126:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     126 | {
         | ^
   include/linux/page_ref.h:131:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     131 | {
         | ^
   include/linux/page_ref.h:138:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     138 | {
         | ^
   include/linux/page_ref.h:143:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     143 | {
         | ^
   include/linux/page_ref.h:152:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     152 | {
         | ^
   include/linux/page_ref.h:159:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     159 | {
         | ^
   include/linux/page_ref.h:164:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     164 | {
         | ^
   include/linux/page_ref.h:171:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     171 | {
         | ^
   include/linux/page_ref.h:176:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     176 | {
         | ^
   include/linux/page_ref.h:185:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     185 | {
         | ^
   include/linux/page_ref.h:190:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     190 | {
         | ^
   include/linux/page_ref.h:199:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     199 | {
         | ^
   include/linux/page_ref.h:204:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     204 | {
         | ^
   include/linux/page_ref.h:213:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     213 | {
         | ^
   include/linux/page_ref.h:218:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     218 | {
         | ^
   include/linux/page_ref.h:227:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     227 | {
         | ^
   include/linux/page_ref.h:232:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     232 | {
         | ^
   include/linux/page_ref.h:247:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     247 | {
         | ^
   include/linux/page_ref.h:263:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     263 | {
         | ^
   include/linux/page_ref.h:268:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     268 | {
         | ^
   include/linux/page_ref.h:273:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     273 | {
         | ^
   include/linux/page_ref.h:282:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     282 | {
         | ^
   include/linux/page_ref.h:287:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     287 | {
         | ^
   include/linux/page_ref.h:297:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     297 | {
         | ^
   In file included from include/linux/mm.h:32:
   include/linux/memremap.h:10:1: warning: empty declaration
      10 | struct resource;
         | ^~~~~~
   include/linux/memremap.h:11:1: warning: empty declaration
..


vim +/irqtime_account_irq +128 include/linux/vtime.h

8d495477d62e439 Frederic Weisbecker 2019-10-03   86  
8d495477d62e439 Frederic Weisbecker 2019-10-03   87  static inline void vtime_task_switch(struct task_struct *prev)
8d495477d62e439 Frederic Weisbecker 2019-10-03  @88  {
e44fcb4b7a29960 Frederic Weisbecker 2019-10-16   89  	if (vtime_accounting_enabled_this_cpu())
8d495477d62e439 Frederic Weisbecker 2019-10-03   90  		vtime_task_switch_generic(prev);
8d495477d62e439 Frederic Weisbecker 2019-10-03   91  }
8d495477d62e439 Frederic Weisbecker 2019-10-03   92  
6f922b89e551814 Sean Christopherson 2021-05-04   93  static __always_inline void vtime_account_guest_enter(void)
6f922b89e551814 Sean Christopherson 2021-05-04   94  {
6f922b89e551814 Sean Christopherson 2021-05-04   95  	if (vtime_accounting_enabled_this_cpu())
6f922b89e551814 Sean Christopherson 2021-05-04   96  		vtime_guest_enter(current);
6f922b89e551814 Sean Christopherson 2021-05-04   97  	else
6f922b89e551814 Sean Christopherson 2021-05-04   98  		current->flags |= PF_VCPU;
6f922b89e551814 Sean Christopherson 2021-05-04   99  }
6f922b89e551814 Sean Christopherson 2021-05-04  100  
6f922b89e551814 Sean Christopherson 2021-05-04  101  static __always_inline void vtime_account_guest_exit(void)
6f922b89e551814 Sean Christopherson 2021-05-04  102  {
6f922b89e551814 Sean Christopherson 2021-05-04  103  	if (vtime_accounting_enabled_this_cpu())
6f922b89e551814 Sean Christopherson 2021-05-04  104  		vtime_guest_exit(current);
6f922b89e551814 Sean Christopherson 2021-05-04  105  	else
6f922b89e551814 Sean Christopherson 2021-05-04  106  		current->flags &= ~PF_VCPU;
6f922b89e551814 Sean Christopherson 2021-05-04  107  }
6f922b89e551814 Sean Christopherson 2021-05-04  108  
8612f17ab99c1f0 Frederic Weisbecker 2016-07-13  109  #else /* !CONFIG_VIRT_CPU_ACCOUNTING */
8d495477d62e439 Frederic Weisbecker 2019-10-03  110  
e44fcb4b7a29960 Frederic Weisbecker 2019-10-16  111  static inline bool vtime_accounting_enabled_this_cpu(void) { return false; }
8d495477d62e439 Frederic Weisbecker 2019-10-03  112  static inline void vtime_task_switch(struct task_struct *prev) { }
b04934061330a4a Frederic Weisbecker 2013-07-12  113  
6f922b89e551814 Sean Christopherson 2021-05-04  114  static __always_inline void vtime_account_guest_enter(void)
6f922b89e551814 Sean Christopherson 2021-05-04  115  {
6f922b89e551814 Sean Christopherson 2021-05-04  116  	current->flags |= PF_VCPU;
6f922b89e551814 Sean Christopherson 2021-05-04  117  }
6f922b89e551814 Sean Christopherson 2021-05-04  118  
6f922b89e551814 Sean Christopherson 2021-05-04  119  static __always_inline void vtime_account_guest_exit(void)
6f922b89e551814 Sean Christopherson 2021-05-04  120  {
6f922b89e551814 Sean Christopherson 2021-05-04  121  	current->flags &= ~PF_VCPU;
6f922b89e551814 Sean Christopherson 2021-05-04  122  }
6f922b89e551814 Sean Christopherson 2021-05-04  123  
8d495477d62e439 Frederic Weisbecker 2019-10-03  124  #endif
b04934061330a4a Frederic Weisbecker 2013-07-12  125  
8612f17ab99c1f0 Frederic Weisbecker 2016-07-13  126  
3e1df4f506836e6 Frederic Weisbecker 2012-10-06  127  #ifdef CONFIG_IRQ_TIME_ACCOUNTING
d3759e7184f8f61 Frederic Weisbecker 2020-12-02 @128  extern void irqtime_account_irq(struct task_struct *tsk, unsigned int offset);
dcbf832e5823156 Frederic Weisbecker 2012-10-05  129  #else
d3759e7184f8f61 Frederic Weisbecker 2020-12-02  130  static inline void irqtime_account_irq(struct task_struct *tsk, unsigned int offset) { }
dcbf832e5823156 Frederic Weisbecker 2012-10-05  131  #endif
dcbf832e5823156 Frederic Weisbecker 2012-10-05  132  

:::::: The code at line 128 was first introduced by commit
:::::: d3759e7184f8f6187e62f8c4e7dcb1f6c47c075a irqtime: Move irqtime entry accounting after irq offset incrementation

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
