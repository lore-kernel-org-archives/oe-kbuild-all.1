Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EBA1DF723
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771224688; cv=none; b=gLdWRT0JR63YsPUmFdbANdk1ZyQKdnxWlOd49CTerI6yK/AaDKR/qFvMDjMgFYNp6X9yJztihD/2zi2++RydEH5WYki5k24P0NxTv4A3J16VktDKCAYO6wbnvRc23Vkmm/3IrVrHoLR3gQV/QLtgrqilXm4fGyli/W6b5nnvwFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771224688; c=relaxed/simple;
	bh=ENQ5LkQVvXWIWt/I8NFpAaKFGdWVBgwRObnDqpqaw5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dJBvb4Swyl69FD3v2Oj1jrxmZw8fxHDWcMAgXYoOdnINPqyB3bfBSFDo07PIJGX/bVoENxX3UTcUthK/5trgLE15U1HrI0VQaRu/aPMUR3gZ0JxNHL36iQ9TOyFPT34yaFQdP0sR3N3XFsSSJYxq+QBn6EYAQwaJBcHbqfVp2OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJVOu1p5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJVOu1p5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771224687; x=1802760687;
  h=date:from:to:cc:subject:message-id;
  bh=ENQ5LkQVvXWIWt/I8NFpAaKFGdWVBgwRObnDqpqaw5A=;
  b=KJVOu1p5Rxg9EvpAMUqLx+ipSqav16XnKLmy/mkRPc1N7Kmzz/4GYooe
   ultNh5h6MtKBDgeNjsrzT5est2EnobKgafcLoGJduBBECuegsjXFJx3tg
   1w8umhF30urPEChufgAOGxnt+ij2PGIy2aIHKGUSA0BLsoRQ1O1NS5+Ab
   0t+IXWXEZQ4yx/b7PfuT5vseY1svA/B4QJ1SVgXzNj9weH5wpYJwzY/xd
   dZ0OMvOKgyot6ln46etVufgDGH+5lVGdMoYszPUnrY5obY5KnTqXB9Hgs
   0tDawP42Aqq0EIf/P5tmjoZaJVkK0y+1CW6jNkD2pWnpKLL31gVo+T0ve
   w==;
X-CSE-ConnectionGUID: aHReDB/hRCeBeq/rl4p8gw==
X-CSE-MsgGUID: G/CdjR9WQv+1Qrc3X1AQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83742258"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="83742258"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 22:51:26 -0800
X-CSE-ConnectionGUID: RGhB03zYQgq4qiK+tdnIBg==
X-CSE-MsgGUID: X4N1u7m0Q6Gn4J8MWT1UBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="212834524"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2026 22:51:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrsS2-00000000zS8-0KMN;
	Mon, 16 Feb 2026 06:51:22 +0000
Date: Mon, 16 Feb 2026 14:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:5291:49: warning: diagnostic behavior may
 be improved by adding the 'format(printf, 3, 0)' attribute to the declaration
 of 'scx_vexit'
Message-ID: <202602161438.0gShzHai-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tejun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: c4c286d747971c410739afc216972f1cc0923270 sched_ext: Cleanup [__]scx_exit/error*()
date:   9 months ago
config: powerpc64-randconfig-r131-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161438.0gShzHai-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161438.0gShzHai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161438.0gShzHai-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c:1877:9: warning: default initialization of an object of type 'typeof (b->scx.dsq_vtime)' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    1877 |         return time_before64(a->scx.dsq_vtime, b->scx.dsq_vtime);
         |                ^
   include/linux/jiffies.h:212:28: note: expanded from macro 'time_before64'
     212 | #define time_before64(a,b)      time_after64(b,a)
         |                                 ^
   include/linux/jiffies.h:199:3: note: expanded from macro 'time_after64'
     199 |         (typecheck(__u64, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c:1877:9: warning: default initialization of an object of type 'typeof (a->scx.dsq_vtime)' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
   include/linux/jiffies.h:212:28: note: expanded from macro 'time_before64'
     212 | #define time_before64(a,b)      time_after64(b,a)
         |                                 ^
   include/linux/jiffies.h:200:3: note: expanded from macro 'time_after64'
     200 |          typecheck(__u64, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from kernel/sched/build_policy.c:63:
>> kernel/sched/ext.c:5291:49: warning: diagnostic behavior may be improved by adding the 'format(printf, 3, 0)' attribute to the declaration of 'scx_vexit' [-Wmissing-format-attribute]
    1139 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |                                                        ^
   kernel/sched/ext.c:1139:13: note: 'scx_vexit' declared here
    1139 | static void scx_vexit(enum scx_exit_kind kind, s64 exit_code, const char *fmt,
         |             ^
   kernel/sched/ext.c:7094:27: warning: diagnostic behavior may be improved by adding the 'format(printf, 4, 0)' attribute to the declaration of '__bstr_format' [-Wmissing-format-attribute]
    7068 |                           bprintf_data.bin_args);
         |                                                ^
   kernel/sched/ext.c:7068:12: note: '__bstr_format' declared here
    7068 | static s32 __bstr_format(u64 *data_buf, char *line_buf, size_t line_size,
         |            ^
   kernel/sched/ext.c:7108:28: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bstr_format' [-Wmissing-format-attribute]
    7104 | static s32 bstr_format(struct scx_bstr_buf *buf,
         | __attribute__((format(printf, 2, 0))) 
    7105 |                        char *fmt, unsigned long long *data, u32 data__sz)
    7106 | {
    7107 |         return __bstr_format(buf->data, buf->line, sizeof(buf->line),
    7108 |                              fmt, data, data__sz);
         |                                                 ^
   kernel/sched/ext.c:7104:12: note: 'bstr_format' declared here
    7104 | static s32 bstr_format(struct scx_bstr_buf *buf,
         |            ^
   kernel/sched/ext.c:7129:57: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'scx_bpf_exit_bstr' [-Wmissing-format-attribute]
    7123 | __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
         | __attribute__((format(printf, 2, 0))) 
    7124 |                                    unsigned long long *data, u32 data__sz)
    7125 | {
    7126 |         unsigned long flags;
    7127 | 
    7128 |         raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
    7129 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                                                ^
   kernel/sched/ext.c:7123:18: note: 'scx_bpf_exit_bstr' declared here
    7123 | __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
         |                  ^
   kernel/sched/ext.c:7149:57: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of 'scx_bpf_error_bstr' [-Wmissing-format-attribute]
    7143 | __bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
         | __attribute__((format(printf, 1, 0))) 
    7144 |                                     u32 data__sz)
    7145 | {
    7146 |         unsigned long flags;
    7147 | 
    7148 |         raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
    7149 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                                                ^
   kernel/sched/ext.c:7143:18: note: 'scx_bpf_error_bstr' declared here
    7143 | __bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
         |                  ^
   kernel/sched/ext.c:7180:59: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of 'scx_bpf_dump_bstr' [-Wmissing-format-attribute]
    7166 | __bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
         | __attribute__((format(printf, 1, 0))) 
    7167 |                                    u32 data__sz)
    7168 | {
    7169 |         struct scx_dump_data *dd = &scx_dump_data;
    7170 |         struct scx_bstr_buf *buf = &dd->buf;
    7171 |         s32 ret;
    7172 | 
    7173 |         if (raw_smp_processor_id() != dd->cpu) {
    7174 |                 scx_error("scx_bpf_dump() must only be called from ops.dump() and friends");
    7175 |                 return;
    7176 |         }
    7177 | 
    7178 |         /* append the formatted string to the line buf */
    7179 |         ret = __bstr_format(buf->data, buf->line + dd->cursor,
    7180 |                             sizeof(buf->line) - dd->cursor, fmt, data, data__sz);
         |                                                                                ^
   kernel/sched/ext.c:7166:18: note: 'scx_bpf_dump_bstr' declared here
    7166 | __bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
         |                  ^
   8 warnings generated.


vim +5291 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo    2024-06-18  5269  
c4c286d747971c Tejun Heo    2025-05-14  5270  static void scx_vexit(enum scx_exit_kind kind, s64 exit_code, const char *fmt,
c4c286d747971c Tejun Heo    2025-05-14  5271  		      va_list args)
f0e1a0643a59bf Tejun Heo    2024-06-18  5272  {
c8fafb34854af4 Andrea Righi 2025-04-30  5273  	struct scx_sched *sch;
c8fafb34854af4 Andrea Righi 2025-04-30  5274  	struct scx_exit_info *ei;
f0e1a0643a59bf Tejun Heo    2024-06-18  5275  	int none = SCX_EXIT_NONE;
f0e1a0643a59bf Tejun Heo    2024-06-18  5276  
c8fafb34854af4 Andrea Righi 2025-04-30  5277  	rcu_read_lock();
c8fafb34854af4 Andrea Righi 2025-04-30  5278  	sch = rcu_dereference(scx_root);
c8fafb34854af4 Andrea Righi 2025-04-30  5279  	if (!sch)
c8fafb34854af4 Andrea Righi 2025-04-30  5280  		goto out_unlock;
c8fafb34854af4 Andrea Righi 2025-04-30  5281  	ei = sch->exit_info;
c8fafb34854af4 Andrea Righi 2025-04-30  5282  
c8fafb34854af4 Andrea Righi 2025-04-30  5283  	if (!atomic_try_cmpxchg(&sch->exit_kind, &none, kind))
c8fafb34854af4 Andrea Righi 2025-04-30  5284  		goto out_unlock;
f0e1a0643a59bf Tejun Heo    2024-06-18  5285  
f0e1a0643a59bf Tejun Heo    2024-06-18  5286  	ei->exit_code = exit_code;
62d3726d4cd66f Tejun Heo    2024-09-23  5287  #ifdef CONFIG_STACKTRACE
f0e1a0643a59bf Tejun Heo    2024-06-18  5288  	if (kind >= SCX_EXIT_ERROR)
f0e1a0643a59bf Tejun Heo    2024-06-18  5289  		ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
62d3726d4cd66f Tejun Heo    2024-09-23  5290  #endif
f0e1a0643a59bf Tejun Heo    2024-06-18 @5291  	vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
f0e1a0643a59bf Tejun Heo    2024-06-18  5292  
07814a9439a3b0 Tejun Heo    2024-06-18  5293  	/*
07814a9439a3b0 Tejun Heo    2024-06-18  5294  	 * Set ei->kind and ->reason for scx_dump_state(). They'll be set again
1a2469403eb26c Tejun Heo    2025-04-04  5295  	 * in scx_disable_workfn().
07814a9439a3b0 Tejun Heo    2024-06-18  5296  	 */
07814a9439a3b0 Tejun Heo    2024-06-18  5297  	ei->kind = kind;
07814a9439a3b0 Tejun Heo    2024-06-18  5298  	ei->reason = scx_exit_reason(ei->kind);
07814a9439a3b0 Tejun Heo    2024-06-18  5299  
c8fafb34854af4 Andrea Righi 2025-04-30  5300  	irq_work_queue(&sch->error_irq_work);
c8fafb34854af4 Andrea Righi 2025-04-30  5301  out_unlock:
c8fafb34854af4 Andrea Righi 2025-04-30  5302  	rcu_read_unlock();
f0e1a0643a59bf Tejun Heo    2024-06-18  5303  }
f0e1a0643a59bf Tejun Heo    2024-06-18  5304  

:::::: The code at line 5291 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
