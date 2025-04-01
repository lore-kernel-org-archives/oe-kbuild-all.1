Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80EA1EA7EB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 22:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743545652; cv=none; b=UA1LaB4VBlahWgL60JWXk+l/x3yAymee37pftz9m22VrTnDpA3teWmCtJu/euu3z+4YXeXXs3dyHntS48Kb/x7WP8JgWRnD1+H35WsBGBxcBoIMsJv8zIAoz7dGR43uUnmIcUHbyK6fT8SqExyXtVukqsRWWxL2U9hJkqYdme74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743545652; c=relaxed/simple;
	bh=0x3b3VTne7DOIVxbDURRu7uj6WMBQoODkguweG9Ltlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3sK+vScXF6ah8KbpI2FvIboTRskz1rPI58qwDB+PhnGzlccekMHTQ68zokIhyPGG44F41dSSAHitFVuzBdoOOrQDRA1fUSkPrQemyliKd+EvSZUt7RRRzU5QiVMXsFZy3MhmXf4AgTZsmf/QA4gH9rTexn3Q1CK9wPQA/0ZgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZg3ZNs0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZg3ZNs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743545650; x=1775081650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0x3b3VTne7DOIVxbDURRu7uj6WMBQoODkguweG9Ltlg=;
  b=WZg3ZNs06REGIGdsDuKR6pvRrcfyNJJGfqNeCFhLWDPkU1A2jLcu4ibn
   QJLgt/zmXQZ4O5LJz5CUiv4TSM0fHYeE1aH1R+anazBmJHNgPm6VG3Yem
   ApKAnZyb6tczPTm819KlpUYQ2Osg7QejCmm0aoD8jtaYrmKXV5rcvZjAK
   QcjM7n+mtXK3SaonF/gV/47WR6nP77ZQpQICRMZ+8L8Uw9erSayOAnCGh
   xk8oOR+vFs5eCHG3zFlZjy1V6sU72ZtxTp4mH5fAIgiEVU7mpyw579pvV
   qeQgB9GxpfgUipL1lyNXmYuKbhVm8elILhAW7maQQCImBl9TsbKZCmCbw
   w==;
X-CSE-ConnectionGUID: rB5/HXIlSAC7apD7Jr7fIw==
X-CSE-MsgGUID: 6pLOp528RbGxJHftFvHE/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44599042"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="44599042"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 15:14:10 -0700
X-CSE-ConnectionGUID: Co/eInsKShu3eu01lDGAvg==
X-CSE-MsgGUID: m3AM08yoQ2+sTYRXrHKXTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126762992"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Apr 2025 15:14:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzjrw-000ABM-01;
	Tue, 01 Apr 2025 22:14:04 +0000
Date: Wed, 2 Apr 2025 06:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_any_andnot 13/13] include/linux/sched/user.h:41:15:
 warning: parameter names (without types) in function declaration
Message-ID: <202504020603.g3IQ5yCW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_any_andnot
head:   d18e9bef696af868ef6afafb5d50ca9732a089cd
commit: d18e9bef696af868ef6afafb5d50ca9732a089cd [13/13] cpumask_any_andnot_but
config: sh-randconfig-001-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020603.g3IQ5yCW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020603.g3IQ5yCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020603.g3IQ5yCW-lkp@intel.com/

All warnings (new ones prefixed by >>):

    extern struct key *keyring_alloc(const char *description, kuid_t uid, kgid_t gid,
                                                              ^~~~~~
   include/linux/key.h:421:71: error: expected declaration specifiers or '...' before 'kgid_t'
    extern struct key *keyring_alloc(const char *description, kuid_t uid, kgid_t gid,
                                                                          ^~~~~~
   include/linux/key.h:423:6: error: expected declaration specifiers or '...' before 'key_perm_t'
         key_perm_t perm,
         ^~~~~~~~~~
   include/linux/key.h:428:12: error: storage class specified for parameter 'restrict_link_reject'
    extern int restrict_link_reject(struct key *keyring,
               ^~~~~~~~~~~~~~~~~~~~
   include/linux/key.h:433:12: error: storage class specified for parameter 'keyring_clear'
    extern int keyring_clear(struct key *keyring);
               ^~~~~~~~~~~~~
   include/linux/key.h:435:18: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'keyring_search'
    extern key_ref_t keyring_search(key_ref_t keyring,
                     ^~~~~~~~~~~~~~
   include/linux/key.h:440:29: error: expected declaration specifiers or '...' before 'key_ref_t'
    extern int keyring_restrict(key_ref_t keyring, const char *type,
                                ^~~~~~~~~
   include/linux/key.h:443:31: error: expected declaration specifiers or '...' before 'key_serial_t'
    extern struct key *key_lookup(key_serial_t id);
                                  ^~~~~~~~~~~~
   include/linux/key.h:445:28: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'key_serial'
    static inline key_serial_t key_serial(const struct key *key)
                               ^~~~~~~~~~
   include/linux/key.h:450:13: error: storage class specified for parameter 'key_set_timeout'
    extern void key_set_timeout(struct key *, unsigned);
                ^~~~~~~~~~~~~~~
   include/linux/key.h:452:18: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'lookup_user_key'
    extern key_ref_t lookup_user_key(key_serial_t id, unsigned long flags,
                     ^~~~~~~~~~~~~~~
   include/linux/key.h:454:13: error: storage class specified for parameter 'key_free_user_ns'
    extern void key_free_user_ns(struct user_namespace *);
                ^~~~~~~~~~~~~~~~
   include/linux/key.h:457:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/key.h:470:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/key.h:475:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/key.h:494:12: error: storage class specified for parameter 'install_thread_keyring_to_cred'
    extern int install_thread_keyring_to_cred(struct cred *cred);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/key.h:495:13: error: storage class specified for parameter 'key_fsuid_changed'
    extern void key_fsuid_changed(struct cred *new_cred);
                ^~~~~~~~~~~~~~~~~
   include/linux/key.h:496:13: error: storage class specified for parameter 'key_fsgid_changed'
    extern void key_fsgid_changed(struct cred *new_cred);
                ^~~~~~~~~~~~~~~~~
   include/linux/key.h:497:13: error: storage class specified for parameter 'key_init'
    extern void key_init(void);
                ^~~~~~~~
   In file included from include/linux/sched/user.h:9:0,
                    from include/linux/cred.h:18,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1133,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/ratelimit.h:11:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/ratelimit.h:20:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/ratelimit.h:26:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/ratelimit.h:39:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/ratelimit.h:43:31: error: storage class specified for parameter 'printk_ratelimit_state'
    extern struct ratelimit_state printk_ratelimit_state;
                                  ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cred.h:18:0,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1133,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/sched/user.h:15:2: error: expected specifier-qualifier-list before 'refcount_t'
     refcount_t __count; /* reference count */
     ^~~~~~~~~~
   include/linux/sched/user.h:14:1: warning: empty declaration
    struct user_struct {
    ^~~~~~
   include/linux/sched/user.h:39:12: error: storage class specified for parameter 'uids_sysfs_init'
    extern int uids_sysfs_init(void);
               ^~~~~~~~~~~~~~~
   include/linux/sched/user.h:41:28: error: storage class specified for parameter 'find_user'
    extern struct user_struct *find_user(kuid_t);
                               ^~~~~~~~~
>> include/linux/sched/user.h:41:15: warning: parameter names (without types) in function declaration
    extern struct user_struct *find_user(kuid_t);
                  ^~~~~~~~~~~
   include/linux/sched/user.h:43:27: error: storage class specified for parameter 'root_user'
    extern struct user_struct root_user;
                              ^~~~~~~~~
   include/linux/sched/user.h:48:29: error: storage class specified for parameter 'alloc_uid'
    extern struct user_struct * alloc_uid(kuid_t);
                                ^~~~~~~~~
   include/linux/sched/user.h:48:15: warning: parameter names (without types) in function declaration
    extern struct user_struct * alloc_uid(kuid_t);
                  ^~~~~~~~~~~
   include/linux/sched/user.h:50:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/sched/user.h:54:13: error: storage class specified for parameter 'free_uid'
    extern void free_uid(struct user_struct *);
                ^~~~~~~~
   In file included from include/linux/sched/signal.h:10:0,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1133,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/cred.h:20:1: warning: empty declaration
    struct cred;
    ^~~~~~
   include/linux/cred.h:21:1: warning: empty declaration
    struct inode;
    ^~~~~~
   include/linux/cred.h:27:2: error: expected specifier-qualifier-list before 'refcount_t'
     refcount_t usage;
     ^~~~~~~~~~
   include/linux/cred.h:26:1: warning: empty declaration
    struct group_info {
    ^~~~~~
   include/linux/cred.h:42:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/cred.h:58:27: error: storage class specified for parameter 'groups_alloc'
    extern struct group_info *groups_alloc(int);
                              ^~~~~~~~~~~~
   include/linux/cred.h:59:13: error: storage class specified for parameter 'groups_free'
    extern void groups_free(struct group_info *);
                ^~~~~~~~~~~
   include/linux/cred.h:61:12: error: storage class specified for parameter 'in_group_p'
    extern int in_group_p(kgid_t);
               ^~~~~~~~~~
>> include/linux/cred.h:61:1: warning: parameter names (without types) in function declaration
    extern int in_group_p(kgid_t);
    ^~~~~~
   include/linux/cred.h:62:12: error: storage class specified for parameter 'in_egroup_p'
    extern int in_egroup_p(kgid_t);
               ^~~~~~~~~~~
   include/linux/cred.h:62:1: warning: parameter names (without types) in function declaration
    extern int in_egroup_p(kgid_t);
    ^~~~~~
   include/linux/cred.h:63:53: error: expected declaration specifiers or '...' before 'kgid_t'
    extern int groups_search(const struct group_info *, kgid_t);
                                                        ^~~~~~
   include/linux/cred.h:65:12: error: storage class specified for parameter 'set_current_groups'
    extern int set_current_groups(struct group_info *);
               ^~~~~~~~~~~~~~~~~~
   include/linux/cred.h:66:13: error: storage class specified for parameter 'set_groups'
    extern void set_groups(struct cred *, struct group_info *);
                ^~~~~~~~~~
   include/linux/cred.h:67:13: error: storage class specified for parameter 'may_setgroups'
    extern bool may_setgroups(void);
                ^~~~~~~~~~~~~
   include/linux/cred.h:68:13: error: storage class specified for parameter 'groups_sort'
    extern void groups_sort(struct group_info *);
                ^~~~~~~~~~~
   include/linux/cred.h:113:2: error: expected specifier-qualifier-list before 'kuid_t'
     kuid_t  uid;  /* real UID of the task */
     ^~~~~~
   include/linux/cred.h:111:1: warning: empty declaration
    struct cred {
    ^~~~~~
   include/linux/cred.h:149:13: error: storage class specified for parameter '__put_cred'
    extern void __put_cred(struct cred *);
                ^~~~~~~~~~
   include/linux/cred.h:150:13: error: storage class specified for parameter 'exit_creds'
    extern void exit_creds(struct task_struct *);
                ^~~~~~~~~~
   include/linux/cred.h:151:12: error: storage class specified for parameter 'copy_creds'
    extern int copy_creds(struct task_struct *, unsigned long);
               ^~~~~~~~~~
   include/linux/cred.h:152:27: error: storage class specified for parameter 'get_task_cred'
    extern const struct cred *get_task_cred(struct task_struct *);
                              ^~~~~~~~~~~~~
   include/linux/cred.h:153:21: error: storage class specified for parameter 'cred_alloc_blank'
    extern struct cred *cred_alloc_blank(void);
                        ^~~~~~~~~~~~~~~~
   include/linux/cred.h:154:21: error: storage class specified for parameter 'prepare_creds'
    extern struct cred *prepare_creds(void);
                        ^~~~~~~~~~~~~
   include/linux/cred.h:155:21: error: storage class specified for parameter 'prepare_exec_creds'
    extern struct cred *prepare_exec_creds(void);
                        ^~~~~~~~~~~~~~~~~~
   include/linux/cred.h:156:12: error: storage class specified for parameter 'commit_creds'
    extern int commit_creds(struct cred *);
               ^~~~~~~~~~~~
   include/linux/cred.h:157:13: error: storage class specified for parameter 'abort_creds'
    extern void abort_creds(struct cred *);
                ^~~~~~~~~~~
   include/linux/cred.h:158:21: error: storage class specified for parameter 'prepare_kernel_cred'
    extern struct cred *prepare_kernel_cred(struct task_struct *);
                        ^~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:159:12: error: storage class specified for parameter 'set_security_override'
    extern int set_security_override(struct cred *, u32);
               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:160:12: error: storage class specified for parameter 'set_security_override_from_ctx'
    extern int set_security_override_from_ctx(struct cred *, const char *);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:161:12: error: storage class specified for parameter 'set_create_files_as'
    extern int set_create_files_as(struct cred *, struct inode *);
               ^~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:162:12: error: storage class specified for parameter 'cred_fscmp'
    extern int cred_fscmp(const struct cred *, const struct cred *);
               ^~~~~~~~~~
   include/linux/cred.h:163:20: error: storage class specified for parameter 'cred_init'
    extern void __init cred_init(void);
                       ^~~~~~~~~
   include/linux/cred.h:163:20: error: section attribute not allowed for 'cred_init'
   include/linux/cred.h:163:1: warning: '__cold__' attribute ignored [-Wattributes]
    extern void __init cred_init(void);
    ^~~~~~
   include/linux/cred.h:164:12: error: storage class specified for parameter 'set_cred_ucounts'
    extern int set_cred_ucounts(struct cred *);
               ^~~~~~~~~~~~~~~~
   include/linux/cred.h:167:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/cred.h:174:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/cred.h:179:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/cred.h:198:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/cred.h:217:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/cred.h:222:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/cred.h:245:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
--
    {
    ^
   include/linux/irqdesc.h:247:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/irqdesc.h:252:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/irqdesc.h:261:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   In file included from arch/sh/include/asm/hw_irq.h:6:0,
                    from include/linux/irq.h:583,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sh/include/asm/hardirq.h:9,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/sh/kernel/asm-offsets.c:16:
   include/linux/sh_intc.h:24:23: error: storage class specified for parameter 'intc_enum'
    typedef unsigned char intc_enum;
                          ^~~~~~~~~
   include/linux/sh_intc.h:27:2: error: expected specifier-qualifier-list before 'intc_enum'
     intc_enum enum_id;
     ^~~~~~~~~
   include/linux/sh_intc.h:26:1: warning: empty declaration
    struct intc_vect {
    ^~~~~~
   include/linux/sh_intc.h:35:2: error: expected specifier-qualifier-list before 'intc_enum'
     intc_enum enum_id;
     ^~~~~~~~~
   include/linux/sh_intc.h:34:1: warning: empty declaration
    struct intc_group {
    ^~~~~~
   include/linux/sh_intc.h:43:2: error: expected specifier-qualifier-list before 'intc_enum'
     intc_enum parent_id;
     ^~~~~~~~~
   include/linux/sh_intc.h:41:1: warning: empty declaration
    struct intc_subgroup {
    ^~~~~~
   include/linux/sh_intc.h:49:2: error: expected specifier-qualifier-list before 'intc_enum'
     intc_enum enum_ids[32];
     ^~~~~~~~~
   include/linux/sh_intc.h:47:1: warning: empty declaration
    struct intc_mask_reg {
    ^~~~~~
   include/linux/sh_intc.h:60:2: error: expected specifier-qualifier-list before 'intc_enum'
     intc_enum enum_ids[16];
     ^~~~~~~~~
   include/linux/sh_intc.h:58:1: warning: empty declaration
    struct intc_prio_reg {
    ^~~~~~
   include/linux/sh_intc.h:68:2: error: expected specifier-qualifier-list before 'intc_enum'
     intc_enum enum_ids[16];
     ^~~~~~~~~
   include/linux/sh_intc.h:66:1: warning: empty declaration
    struct intc_sense_reg {
    ^~~~~~
   include/linux/sh_intc.h:83:1: warning: empty declaration
    struct intc_hw_desc {
    ^~~~~~
   include/linux/sh_intc.h:117:2: error: expected specifier-qualifier-list before 'intc_enum'
     intc_enum force_enable;
     ^~~~~~~~~
   include/linux/sh_intc.h:113:1: warning: empty declaration
    struct intc_desc {
    ^~~~~~
   include/linux/sh_intc.h:141:43: error: expected declaration specifiers or '...' before 'intc_enum'
    int intc_irq_lookup(const char *chipname, intc_enum enum_id);
                                              ^~~~~~~~~
   include/linux/sh_intc.h:148:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   In file included from include/linux/irq.h:583:0,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sh/include/asm/hardirq.h:9,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/sh/kernel/asm-offsets.c:16:
   arch/sh/include/asm/hw_irq.h:9:17: error: storage class specified for parameter 'irq_err_count'
    extern atomic_t irq_err_count;
                    ^~~~~~~~~~~~~
   arch/sh/include/asm/hw_irq.h:11:1: warning: empty declaration
    struct ipr_data {
    ^~~~~~
   arch/sh/include/asm/hw_irq.h:18:1: warning: empty declaration
    struct ipr_desc {
    ^~~~~~
   arch/sh/include/asm/hw_irq.h:28:13: error: section attribute not allowed for 'plat_irq_setup'
    void __init plat_irq_setup(void);
                ^~~~~~~~~~~~~~
>> arch/sh/include/asm/hw_irq.h:28:1: warning: '__cold__' attribute ignored [-Wattributes]
    void __init plat_irq_setup(void);
    ^~~~
   arch/sh/include/asm/hw_irq.h:29:13: error: section attribute not allowed for 'plat_irq_setup_sh3'
    void __init plat_irq_setup_sh3(void);
                ^~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/hw_irq.h:29:1: warning: '__cold__' attribute ignored [-Wattributes]
    void __init plat_irq_setup_sh3(void);
    ^~~~
   arch/sh/include/asm/hw_irq.h:30:13: error: section attribute not allowed for 'plat_irq_setup_pins'
    void __init plat_irq_setup_pins(int mode);
                ^~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/hw_irq.h:30:1: warning: '__cold__' attribute ignored [-Wattributes]
    void __init plat_irq_setup_pins(int mode);
    ^~~~
   arch/sh/include/asm/hw_irq.h:32:1: warning: empty declaration
    enum { IRQ_MODE_IRQ, IRQ_MODE_IRQ7654, IRQ_MODE_IRQ3210,
    ^~~~
   In file included from include/asm-generic/hardirq.h:17:0,
                    from arch/sh/include/asm/hardirq.h:9,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/sh/kernel/asm-offsets.c:16:
   include/linux/irq.h:595:1: warning: empty declaration
    struct irqaction;
    ^~~~~~
   include/linux/irq.h:596:12: error: storage class specified for parameter 'setup_percpu_irq'
    extern int setup_percpu_irq(unsigned int irq, struct irqaction *new);
               ^~~~~~~~~~~~~~~~
   include/linux/irq.h:597:13: error: storage class specified for parameter 'remove_percpu_irq'
    extern void remove_percpu_irq(unsigned int irq, struct irqaction *act);
                ^~~~~~~~~~~~~~~~~
   include/linux/irq.h:603:12: error: storage class specified for parameter 'irq_set_affinity_locked'
    extern int irq_set_affinity_locked(struct irq_data *data,
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:605:12: error: storage class specified for parameter 'irq_set_vcpu_affinity'
    extern int irq_set_vcpu_affinity(unsigned int irq, void *vcpu_info);
               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:624:56: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    static inline void irq_move_irq(struct irq_data *data) { }
                                                           ^
   include/linux/irq.h:625:63: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    static inline void irq_move_masked_irq(struct irq_data *data) { }
                                                                  ^
   include/linux/irq.h:626:67: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    static inline void irq_force_complete_move(struct irq_desc *desc) { }
                                                                      ^
   include/linux/irq.h:629:12: error: storage class specified for parameter 'no_irq_affinity'
    extern int no_irq_affinity;
               ^~~~~~~~~~~~~~~
   include/linux/irq.h:635:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   include/linux/irq.h:644:13: error: storage class specified for parameter 'handle_level_irq'
    extern void handle_level_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~
   include/linux/irq.h:645:13: error: storage class specified for parameter 'handle_fasteoi_irq'
    extern void handle_fasteoi_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~~~
   include/linux/irq.h:646:13: error: storage class specified for parameter 'handle_edge_irq'
    extern void handle_edge_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~
   include/linux/irq.h:647:13: error: storage class specified for parameter 'handle_edge_eoi_irq'
    extern void handle_edge_eoi_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:648:13: error: storage class specified for parameter 'handle_simple_irq'
    extern void handle_simple_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~~
   include/linux/irq.h:649:13: error: storage class specified for parameter 'handle_untracked_irq'
    extern void handle_untracked_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:650:13: error: storage class specified for parameter 'handle_percpu_irq'
    extern void handle_percpu_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~~
   include/linux/irq.h:651:13: error: storage class specified for parameter 'handle_percpu_devid_irq'
    extern void handle_percpu_devid_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:652:13: error: storage class specified for parameter 'handle_bad_irq'
    extern void handle_bad_irq(struct irq_desc *desc);
                ^~~~~~~~~~~~~~
   include/linux/irq.h:653:13: error: storage class specified for parameter 'handle_nested_irq'
    extern void handle_nested_irq(unsigned int irq);
                ^~~~~~~~~~~~~~~~~
   include/linux/irq.h:655:13: error: storage class specified for parameter 'handle_fasteoi_nmi'
    extern void handle_fasteoi_nmi(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~~~
   include/linux/irq.h:656:13: error: storage class specified for parameter 'handle_percpu_devid_fasteoi_nmi'
    extern void handle_percpu_devid_fasteoi_nmi(struct irq_desc *desc);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:658:12: error: storage class specified for parameter 'irq_chip_compose_msi_msg'
    extern int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg);
               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irq.h:659:12: error: storage class specified for parameter 'irq_chip_pm_get'
    extern int irq_chip_pm_get(struct irq_data *data);
               ^~~~~~~~~~~~~~~
   include/linux/irq.h:660:12: error: storage class specified for parameter 'irq_chip_pm_put'
..


vim +41 include/linux/sched/user.h

bcbb6a5bf7df6e Ingo Molnar 2017-02-02  40  
bcbb6a5bf7df6e Ingo Molnar 2017-02-02 @41  extern struct user_struct *find_user(kuid_t);
bcbb6a5bf7df6e Ingo Molnar 2017-02-02  42  

:::::: The code at line 41 was first introduced by commit
:::::: bcbb6a5bf7df6e37ba652d1f426eab042ec4f56b sched/headers: Move 'struct user_struct' definition and APIs to the new <linux/sched/user.h> header

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
