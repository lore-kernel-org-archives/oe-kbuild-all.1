Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E26FBB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674928547; x=1706464547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bm3epk83gMc7q4L3ZmwyBH4Hb9eHzf1L6Ls9lywhgqs=;
  b=R2hSB05rs2QjKBQKDTgNvuOv2eXLnx4q+cn+MSvCBGleALaxQQeGaBCS
   pLvaGj++vU+RNPCvqLI3Z21GDhBj4RLzcHyWnod4QvcD8pQkvBVhRLcP8
   BTHa93Pxju9FVKNXxd3KlJLxMz/idFjhWMhJ09rOStAYuVYHKdX67YtDu
   vVwo03mkHgEe1ihWrxK32uXp2kTvy0I3PRMOi36Dt/fq1XPWGvx1AMhbW
   YPNk7So4Vc88rDMFlwySb76k+xm/0ixyEdF9TCFO42Zj6FjTscgxQpf34
   faCLiH3RfiHE3a3lsCjKiLGktNg0ZIkuZ7qjjXEBKPbt665jgpmJBwdfB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="328601878"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="328601878"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 09:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="909017094"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="909017094"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2023 09:55:45 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLpQW-0000xx-35;
	Sat, 28 Jan 2023 17:55:44 +0000
Date: Sun, 29 Jan 2023 01:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6544/6550]
 arch/arm64/kvm/hyp_events.c:22:27: warning: no previous prototype for
 'hyp_event_trace_hyp_enter'
Message-ID: <202301290108.xEdyksH8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5a5282ca964178e46d1adb96ea1c3341303e94b
commit: 09014fb1f2df192b186cd253fa990925f262f308 [6544/6550] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301290108.xEdyksH8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 09014fb1f2df192b186cd253fa990925f262f308
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_events.c:22:27: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:22:27: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:166:6: warning: no previous prototype for 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
     166 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:198:5: warning: no previous prototype for 'kvm_hyp_init_events' [-Wmissing-prototypes]
     198 | int kvm_hyp_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/hyp_event_trace_hyp_enter +22 arch/arm64/kvm/hyp_events.c

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
https://github.com/intel/lkp-tests
