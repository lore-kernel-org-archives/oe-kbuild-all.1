Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279262D94A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 22:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766095776; cv=none; b=J6sLWeBqp1NnFjWAZU1HnO/KQwp7AcBePGwV4bE6leafKGFhvu+NcO993cJqBNKCMmbQWtbdF0JAb64pCxWE8dXmborL045W7tiztT27dEFfsvGgyarMJZ9QDPOJjwpYNzBPzvpANRbd0hhejbtzGElEBRitUSHKJKI5ax2e16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766095776; c=relaxed/simple;
	bh=kkfFy88XfoNdMC94H5hbO+SLlFw6GYjz0KmF91dr92g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B09iEFyOdpymynKnUX1WK/cUABsaEDTzHlFrrVGi78Okok/KBYxCt2v2v18pNlEsVAU+ps26lNUQqaHB58KvAqpgQp6oNLenOqpSsv/lOgtrtceW5o5hEYCXAaL2PmAwnvfZ/pJAOjb/7xr/Wv6Kw5U6xJRm4C2KcmKlQxlEJ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0DOSBt2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0DOSBt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766095774; x=1797631774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkfFy88XfoNdMC94H5hbO+SLlFw6GYjz0KmF91dr92g=;
  b=P0DOSBt2/Niy4ogECIt0OORe0xlyiFl090rwYYq7npxIervKPnCV9toc
   8pQzQyaq4VnvX+leu8ic3x68rpUNY50/oFRnBJa53C9bO/NoyMTNVWr1e
   w7HbgnY/xx11nTBPxTiC7LkjfWkU5Lr3h1F4uQvRKlqQKR5rBEsExmFp3
   2LlSW4x0Q31afyc2DjBwVEITKeoZZZIk3vt11tO4BoL7a62iEMDOV21SL
   C62Y1g41L2i+wo2wQIO+e58bvN3m3zqzpCyLpdgPUjwoeFUONRAhtn32l
   fnNF5+LCuxCTR+/88/bedGEr6DN3FWyF5oTCCIRb4Tmc7BLdREfzYIdcN
   Q==;
X-CSE-ConnectionGUID: fNA2vmpkSJOql1r6+HauOg==
X-CSE-MsgGUID: OdM17W1EQ8G5VW5mzLDc0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70631274"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="70631274"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 14:09:34 -0800
X-CSE-ConnectionGUID: JhZGy69xRL2jppaFxSOo0g==
X-CSE-MsgGUID: lJGzTi1KR/yqs44L4/kxBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="202875574"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Dec 2025 14:09:33 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWMBd-000000002ht-3D9p;
	Thu, 18 Dec 2025 22:09:29 +0000
Date: Fri, 19 Dec 2025 06:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for
 'kvm_hyp_events_enable_early'
Message-ID: <202512190637.JwjkRbPH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 605d8f6940c38faeaa0aa91a8c793d1d8cd5eab5 [43/43] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251219/202512190637.JwjkRbPH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190637.JwjkRbPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190637.JwjkRbPH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for 'kvm_hyp_events_enable_early' [-Wmissing-prototypes]
     204 | bool kvm_hyp_events_enable_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:239:6: warning: no previous prototype for 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
     239 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:271:5: warning: no previous prototype for 'kvm_hyp_init_events' [-Wmissing-prototypes]
     271 | int kvm_hyp_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/kvm_hyp_events_enable_early +204 arch/arm64/kvm/hyp_events.c

    22	
    23	#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
    24		HYP_EVENT_FORMAT(__name, __struct);					\
  > 25		enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter,	\
    26						  int flags, struct trace_event *event) \
    27		{									\
    28			struct ht_iterator *ht_iter = (struct ht_iterator *)iter;	\
    29			struct trace_hyp_format_##__name __maybe_unused *__entry =	\
    30				(struct trace_hyp_format_##__name *)ht_iter->ent;	\
    31			trace_seq_puts(&ht_iter->seq, #__name);				\
    32			trace_seq_putc(&ht_iter->seq, ' ');				\
    33			trace_seq_printf(&ht_iter->seq, __printk);			\
    34			trace_seq_putc(&ht_iter->seq, '\n');				\
    35			return TRACE_TYPE_HANDLED;					\
    36		}
    37	#include <asm/kvm_hypevents.h>
    38	
    39	#undef he_field
    40	#define he_field(_type, _item)						\
    41		{								\
    42			.type = #_type, .name = #_item,				\
    43			.size = sizeof(_type), .align = __alignof__(_type),	\
    44			.is_signed = is_signed_type(_type),			\
    45		},
    46	#undef HYP_EVENT
    47	#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
    48		static struct trace_event_fields hyp_event_fields_##__name[] = {	\
    49			__struct							\
    50			{}								\
    51		};									\
    52	
    53	#undef __ARM64_KVM_HYPEVENTS_H_
    54	#include <asm/kvm_hypevents.h>
    55	
    56	#undef HYP_EVENT
    57	#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
    58		static struct trace_event_functions hyp_event_funcs_##__name = {	\
    59			.trace = &hyp_event_trace_##__name,				\
    60		};									\
    61		static struct trace_event_class hyp_event_class_##__name = {		\
    62			.system		= "nvhe-hypervisor",				\
    63			.fields_array	= hyp_event_fields_##__name,			\
    64			.fields		= LIST_HEAD_INIT(hyp_event_class_##__name.fields),\
    65		};									\
    66		static struct trace_event_call hyp_event_call_##__name = {		\
    67			.class = &hyp_event_class_##__name,				\
    68			.event.funcs = &hyp_event_funcs_##__name,			\
    69		};									\
    70		static bool hyp_event_enabled_##__name;					\
    71		struct hyp_event __section("_hyp_events") hyp_event_##__name = {	\
    72			.name = #__name,						\
    73			.call = &hyp_event_call_##__name,				\
    74			.enabled = &hyp_event_enabled_##__name,				\
    75		}
    76	
    77	#undef __ARM64_KVM_HYPEVENTS_H_
    78	#include <asm/kvm_hypevents.h>
    79	
    80	extern struct hyp_event __start_hyp_events[];
    81	extern struct hyp_event __stop_hyp_events[];
    82	
    83	/* hyp_event section used by the hypervisor */
    84	extern struct hyp_event_id __hyp_event_ids_start[];
    85	extern struct hyp_event_id __hyp_event_ids_end[];
    86	
    87	static struct hyp_event *find_hyp_event(const char *name)
    88	{
    89		struct hyp_event *event = __start_hyp_events;
    90	
    91		for (; (unsigned long)event < (unsigned long)__stop_hyp_events;
    92			event++) {
    93			if (!strncmp(name, event->name, HYP_EVENT_NAME_MAX))
    94				return event;
    95		}
    96	
    97		return NULL;
    98	}
    99	
   100	static int enable_hyp_event(struct hyp_event *event, bool enable)
   101	{
   102		unsigned short id = event->call->event.type;
   103		int ret;
   104	
   105		if (enable == *event->enabled)
   106			return 0;
   107	
   108		ret = kvm_call_hyp_nvhe(__pkvm_enable_event, id, enable);
   109		if (ret)
   110			return ret;
   111	
   112		*event->enabled = enable;
   113	
   114		return 0;
   115	}
   116	
   117	static ssize_t
   118	hyp_event_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
   119	{
   120		struct seq_file *seq_file = (struct seq_file *)filp->private_data;
   121		struct hyp_event *evt = (struct hyp_event *)seq_file->private;
   122		bool enabling;
   123		int ret;
   124		char c;
   125	
   126		if (cnt != 2)
   127			return -EINVAL;
   128	
   129		if (get_user(c, ubuf))
   130			return -EFAULT;
   131	
   132		switch (c) {
   133		case '1':
   134			enabling = true;
   135			break;
   136		case '0':
   137			enabling = false;
   138			break;
   139		default:
   140			return -EINVAL;
   141		}
   142	
   143		ret = enable_hyp_event(evt, enabling);
   144		if (ret)
   145			return ret;
   146	
   147		return cnt;
   148	}
   149	
   150	static int hyp_event_show(struct seq_file *m, void *v)
   151	{
   152		struct hyp_event *evt = (struct hyp_event *)m->private;
   153	
   154		/* lock ?? Ain't no time for that ! */
   155		seq_printf(m, "%d\n", *evt->enabled);
   156	
   157		return 0;
   158	}
   159	
   160	static int hyp_event_open(struct inode *inode, struct file *filp)
   161	{
   162		return single_open(filp, hyp_event_show, inode->i_private);
   163	}
   164	
   165	static const struct file_operations hyp_event_fops = {
   166		.open		= hyp_event_open,
   167		.write		= hyp_event_write,
   168		.read		= seq_read,
   169		.llseek		= seq_lseek,
   170		.release	= single_release,
   171	};
   172	
   173	static int hyp_event_id_show(struct seq_file *m, void *v)
   174	{
   175		struct hyp_event *evt = (struct hyp_event *)m->private;
   176	
   177		seq_printf(m, "%d\n", evt->call->event.type);
   178	
   179		return 0;
   180	}
   181	
   182	static int hyp_event_id_open(struct inode *inode, struct file *filp)
   183	{
   184		return single_open(filp, hyp_event_id_show, inode->i_private);
   185	}
   186	
   187	static const struct file_operations hyp_event_id_fops = {
   188		.open = hyp_event_id_open,
   189		.read = seq_read,
   190		.llseek = seq_lseek,
   191		.release = single_release,
   192	};
   193	
   194	static char early_events[COMMAND_LINE_SIZE];
   195	
   196	static __init int setup_hyp_event_early(char *str)
   197	{
   198		strscpy(early_events, str, COMMAND_LINE_SIZE);
   199	
   200		return 1;
   201	}
   202	__setup("hyp_event=", setup_hyp_event_early);
   203	
 > 204	bool kvm_hyp_events_enable_early(void)
   205	{
   206		char *token, *buf = early_events;
   207		bool enabled = false;
   208	
   209		while (true) {
   210			token = strsep(&buf, ",");
   211	
   212			if (!token)
   213				break;
   214	
   215			if (*token) {
   216				struct hyp_event *event;
   217				int ret;
   218	
   219				event = find_hyp_event(token);
   220				if (event) {
   221					ret = enable_hyp_event(event, true);
   222					if (ret)
   223						pr_warn("Couldn't enable hyp event %s:%d\n",
   224							token, ret);
   225					else
   226						enabled = true;
   227				} else {
   228					pr_warn("Couldn't find hyp event %s\n", token);
   229				}
   230			}
   231	
   232			if (buf)
   233				*(buf - 1) = ',';
   234		}
   235	
   236		return enabled;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
