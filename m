Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D362EDD70
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784361017; cv=none; b=JacJnkVZQv9GI/qkehNfIZZUmdhTRQfnpAUqoLeMlnhYKNxSkvCL2NaowjtZzZLbulsLOBZDt7EcdAp6HxdtPJcTAXzm9JK6ZblwaCOPEs1v+THzP0FH0vHHEfRcTqPm8+YzQ0VvqmXbi4TDhDYOQIPv6j+JAwiC0PJjHIkA2WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784361017; c=relaxed/simple;
	bh=1Ti9yGLVdWdy7nOUN26Pz7Vh6Wz4WOwmRvoyayEgHEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q7UbyLeGLARJr0oZ+7Dcov/g8l7hdxmZ/LUMEOle/ExiX8TZF4S/ScT6d97mXcuserjS+VeggSIz1E3nsZgL03RS3etqt+0xir2138rSkIkmSfeG/A1jQCksI6OXRKXuys6n718Vp+H40wAv5XCwPR36rvozpjo5qZaGMlCeZ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXAiA+Qh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXAiA+Qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784361015; x=1815897015;
  h=date:from:to:cc:subject:message-id;
  bh=1Ti9yGLVdWdy7nOUN26Pz7Vh6Wz4WOwmRvoyayEgHEk=;
  b=bXAiA+Qh1hIiv64YV+xClPcjdhSeKtmDovG0j9lKF9k9m6odc0pa0kk3
   tk77CtDrEl6+RhowQ6PyuhQau5kiAbrhlwFZrEVLDk6czVkhXf9gCiMep
   u38mfu7Z9PMv6bb5r5IqawSGVGoyk5HtO8AMZnHLeeqT8U/bjQa5VMVmi
   J9SjSKEAGTz15NidJc88KnGOSnJaimyt9Ghi8kgC1v3Sf7EcZWXfD6LCD
   G18uyNPHibW47Xy+v22I/F+1mtpZLf0XCpT/sJBua2Ai/rWeOmeP2+RCX
   HHOktte8MCuyZg3+evnFyXMgK4/cqKFIpeQ53+ok7enzoZwyftjOSQfWI
   A==;
X-CSE-ConnectionGUID: FUvuEt9ISE+ViRqvLnYsWQ==
X-CSE-MsgGUID: K/ABR26zRgqrY3mxN/8Enw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84003488"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84003488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:50:14 -0700
X-CSE-ConnectionGUID: VO0VWf6YRLWqs2Op2+u+ng==
X-CSE-MsgGUID: U73NMMf9QtabBTNkKhHqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255210872"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Jul 2026 00:50:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzoI-00000000TYh-21Bs;
	Sat, 18 Jul 2026 07:50:10 +0000
Date: Sat, 18 Jul 2026 15:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 192/192]
 arch/arm64/kvm/hyp_events.c:166:6: warning: no previous prototype for
 function 'kvm_hyp_init_events_tracefs'
Message-ID: <202607181507.7QBomPBy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   15bdff0dd01eed4ffc4ae138c5a611d8b102a4b6
commit: 09014fb1f2df192b186cd253fa990925f262f308 [192/192] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607181507.7QBomPBy-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181507.7QBomPBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181507.7QBomPBy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:34:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/kvm/hyp_events.c:22:20: note: expanded from macro 'HYP_EVENT'
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^
   <scratch space>:45:1: note: expanded from here
      45 | hyp_event_trace_hyp_enter
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:22:2: note: expanded from macro 'HYP_EVENT'
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:34:
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      23 | HYP_EVENT(hyp_exit,
         | ^
   arch/arm64/kvm/hyp_events.c:22:20: note: expanded from macro 'HYP_EVENT'
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^
   <scratch space>:50:1: note: expanded from here
      50 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:22:2: note: expanded from macro 'HYP_EVENT'
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |         ^
>> arch/arm64/kvm/hyp_events.c:166:6: warning: no previous prototype for function 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
     166 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     166 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:198:5: warning: no previous prototype for function 'kvm_hyp_init_events' [-Wmissing-prototypes]
     198 | int kvm_hyp_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     198 | int kvm_hyp_init_events(void)
         | ^
         | static 
   5 warnings generated.


vim +/kvm_hyp_init_events_tracefs +166 arch/arm64/kvm/hyp_events.c

    19	
    20	#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
    21		HYP_EVENT_FORMAT(__name, __struct);					\
  > 22		enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter,	\
    23						  int flags, struct trace_event *event) \
    24		{									\
    25			struct ht_iterator *ht_iter = (struct ht_iterator *)iter;	\
    26			struct trace_hyp_format_##__name __maybe_unused *__entry =	\
    27				(struct trace_hyp_format_##__name *)ht_iter->ent;	\
    28			trace_seq_puts(&ht_iter->seq, #__name);				\
    29			trace_seq_putc(&ht_iter->seq, ' ');				\
    30			trace_seq_printf(&ht_iter->seq, __printk);			\
    31			trace_seq_putc(&ht_iter->seq, '\n');				\
    32			return TRACE_TYPE_HANDLED;					\
    33		}
    34	#include <asm/kvm_hypevents.h>
    35	
    36	#undef he_field
    37	#define he_field(_type, _item)						\
    38		{								\
    39			.type = #_type, .name = #_item,				\
    40			.size = sizeof(_type), .align = __alignof__(_type),	\
    41			.is_signed = is_signed_type(_type),			\
    42		},
    43	#undef HYP_EVENT
    44	#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
    45		static struct trace_event_fields hyp_event_fields_##__name[] = {	\
    46			__struct							\
    47			{}								\
    48		};									\
    49	
    50	#undef __ARM64_KVM_HYPEVENTS_H_
    51	#include <asm/kvm_hypevents.h>
    52	
    53	#undef HYP_EVENT
    54	#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
    55		static struct trace_event_functions hyp_event_funcs_##__name = {	\
    56			.trace = &hyp_event_trace_##__name,				\
    57		};									\
    58		static struct trace_event_class hyp_event_class_##__name = {		\
    59			.system		= "nvhe-hypervisor",				\
    60			.fields_array	= hyp_event_fields_##__name,			\
    61			.fields		= LIST_HEAD_INIT(hyp_event_class_##__name.fields),\
    62		};									\
    63		static struct trace_event_call hyp_event_call_##__name = {		\
    64			.class = &hyp_event_class_##__name,				\
    65			.event.funcs = &hyp_event_funcs_##__name,			\
    66		};									\
    67		static bool hyp_event_enabled_##__name;					\
    68		struct hyp_event __section("_hyp_events") hyp_event_##__name = {	\
    69			.name = #__name,						\
    70			.call = &hyp_event_call_##__name,				\
    71			.enabled = &hyp_event_enabled_##__name,				\
    72		}
    73	
    74	#undef __ARM64_KVM_HYPEVENTS_H_
    75	#include <asm/kvm_hypevents.h>
    76	
    77	extern struct hyp_event __start_hyp_events[];
    78	extern struct hyp_event __stop_hyp_events[];
    79	
    80	/* hyp_event section used by the hypervisor */
    81	extern struct hyp_event_id __hyp_event_ids_start[];
    82	extern struct hyp_event_id __hyp_event_ids_end[];
    83	
    84	static ssize_t
    85	hyp_event_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
    86	{
    87		struct seq_file *seq_file = (struct seq_file *)filp->private_data;
    88		struct hyp_event *evt = (struct hyp_event *)seq_file->private;
    89		unsigned short id = evt->call->event.type;
    90		bool enabling;
    91		int ret;
    92		char c;
    93	
    94		if (cnt != 2)
    95			return -EINVAL;
    96	
    97		if (get_user(c, ubuf))
    98			return -EFAULT;
    99	
   100		switch (c) {
   101		case '1':
   102			enabling = true;
   103			break;
   104		case '0':
   105			enabling = false;
   106			break;
   107		default:
   108			return -EINVAL;
   109		}
   110	
   111		if (enabling != *evt->enabled) {
   112			ret = kvm_call_hyp_nvhe(__pkvm_enable_event, id, enabling);
   113			if (ret)
   114				return ret;
   115		}
   116	
   117		*evt->enabled = enabling;
   118	
   119		return cnt;
   120	}
   121	
   122	static int hyp_event_show(struct seq_file *m, void *v)
   123	{
   124		struct hyp_event *evt = (struct hyp_event *)m->private;
   125	
   126		/* lock ?? Ain't no time for that ! */
   127		seq_printf(m, "%d\n", *evt->enabled);
   128	
   129		return 0;
   130	}
   131	
   132	static int hyp_event_open(struct inode *inode, struct file *filp)
   133	{
   134		return single_open(filp, hyp_event_show, inode->i_private);
   135	}
   136	
   137	static const struct file_operations hyp_event_fops = {
   138		.open		= hyp_event_open,
   139		.write		= hyp_event_write,
   140		.read		= seq_read,
   141		.llseek		= seq_lseek,
   142		.release	= single_release,
   143	};
   144	
   145	static int hyp_event_id_show(struct seq_file *m, void *v)
   146	{
   147		struct hyp_event *evt = (struct hyp_event *)m->private;
   148	
   149		seq_printf(m, "%d\n", evt->call->event.type);
   150	
   151		return 0;
   152	}
   153	
   154	static int hyp_event_id_open(struct inode *inode, struct file *filp)
   155	{
   156		return single_open(filp, hyp_event_id_show, inode->i_private);
   157	}
   158	
   159	static const struct file_operations hyp_event_id_fops = {
   160		.open = hyp_event_id_open,
   161		.read = seq_read,
   162		.llseek = seq_lseek,
   163		.release = single_release,
   164	};
   165	
 > 166	void kvm_hyp_init_events_tracefs(struct dentry *parent)
   167	{
   168		struct hyp_event *event = __start_hyp_events;
   169		struct dentry *d, *event_dir;
   170	
   171		parent = tracefs_create_dir("events", parent);
   172		if (!parent) {
   173			pr_err("Failed to create tracefs folder for hyp events\n");
   174			return;
   175		}
   176	
   177		for (; (unsigned long)event < (unsigned long)__stop_hyp_events; event++) {
   178			event_dir = tracefs_create_dir(event->name, parent);
   179			if (!event_dir) {
   180				pr_err("Failed to create events/hyp/%s\n", event->name);
   181				continue;
   182			}
   183			d = tracefs_create_file("enable", 0700, event_dir, (void *)event,
   184					&hyp_event_fops);
   185			if (!d)
   186				pr_err("Failed to create events/hyp/%s/enable\n", event->name);
   187	
   188			d = tracefs_create_file("id", 0400, event_dir, (void *)event,
   189					&hyp_event_id_fops);
   190			if (!d)
   191				pr_err("Failed to create events/hyp/%s/id\n", event->name);
   192		}
   193	}
   194	
   195	/*
   196	 * Register hyp events and write their id into the hyp section _hyp_event_ids.
   197	 */
 > 198	int kvm_hyp_init_events(void)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
