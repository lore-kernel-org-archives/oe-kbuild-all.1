Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3933B774B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 21:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917090; cv=none; b=WMqqZjtz8E7D/ZnXCOGn7fSFIBovjDvk93NiSGcth2IZR3AY1zXIyw6aKO09pfnNwRg6RKx6hFIALz35MHcKipi4BMJ6aPn9dFuIrgMT5ZaWeTwyAI5ZHxn+J5Tty3bMyMPqLxo5krYFdNryWLCLIyK6uf6XQVtxrFlYiyKQ1n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917090; c=relaxed/simple;
	bh=RgqM6008/JzX+9sWOp2ctxaq2WloM/OCZxiuOuiT8Po=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pqbA0RZ7Rt9zjb7qTTtkA0eI1xGoGaUl5Xw3TFMY63s/Ey51CfJk3OawMErlYh4GG/mhAPDRriAYGHnROAz96U9GIWjPGAONMyTSli2ws68x1hDaGGIwUwe3HpRYfAY0Ucv1WMzbMZIhyi7TTEx78CIgWaaHArL/WF9YKxVDRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4tiQDQR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4tiQDQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786917089; x=1818453089;
  h=date:from:to:cc:subject:message-id;
  bh=RgqM6008/JzX+9sWOp2ctxaq2WloM/OCZxiuOuiT8Po=;
  b=L4tiQDQRMbRfJ+FoAIVqjvfDD+lQ3d6XSryqwKojCuztiBgIUGH3JqYt
   1Ku5SIwGCyTYkjjHE84K/Gp+nhKH8dkA+VNRfEVardbbNWtOrln2ACPTG
   ki9sawRmq5NHPeKAAH9uzpJCScRldba/qTDfKz8XugKD04eQTSezhi81U
   zYgCYzrXmZCzkuIc1/PiqpC6DmPMPdGkdDAAIkZmwLVg+PeYlcUuhGB5F
   xCfOypLOqdrm1BiVjTbfTc7jn+ZJ4pZr4Yc904BtVtA/oiQjabtSgOD2g
   g0vScm0Bzqk1ZbEGXxgMJY8SSD8o/QGe2RcCQXYHHUb+PRFds8S93bJUD
   g==;
X-CSE-ConnectionGUID: AM1tGdz/TR6nwVfiNZcupA==
X-CSE-MsgGUID: zKN5MMIvSpKqSXNrSWaHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87271796"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="87271796"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 14:51:28 -0700
X-CSE-ConnectionGUID: b6YY/EOKRkOjr0ZHn1vXIw==
X-CSE-MsgGUID: avpsXcSLSNGESt6MwZkZ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="264784833"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2026 14:51:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvilI-00000000d78-1Y4M;
	Sun, 16 Aug 2026 21:51:24 +0000
Date: Mon, 17 Aug 2026 05:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 216/216]
 arch/arm64/kvm/hyp_events.c:25:20: warning: no previous prototype for
 'hyp_event_trace_host_hcall'
Message-ID: <202608170540.5ZOV9Mna-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2926f30a02021448f3d5484967f2d01a4249e0c7
commit: 508af69a745a81d6fedd161b4d5d614a9d1f9788 [216/216] ANDROID: KVM: arm64: Add EL2 wakeup cause hyp events
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260817/202608170540.5ZOV9Mna-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170540.5ZOV9Mna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170540.5ZOV9Mna-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_events.c:25:20: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      25 |  enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                    ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/kvm/hyp_events.c:25:20: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      25 |  enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                    ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:25:20: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      25 |  enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                    ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:25:20: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      25 |  enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                    ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:25:20: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      25 |  enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                    ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: in expansion of macro 'HYP_EVENT'
      61 | HYP_EVENT(host_mem_abort,
         | ^~~~~~~~~
   arch/arm64/kvm/hyp_events.c:249:6: warning: no previous prototype for 'kvm_hyp_events_enable_early' [-Wmissing-prototypes]
     249 | bool kvm_hyp_events_enable_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:284:6: warning: no previous prototype for 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
     284 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:323:5: warning: no previous prototype for 'kvm_hyp_init_events' [-Wmissing-prototypes]
     323 | int kvm_hyp_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/hyp_event_trace_host_hcall +25 arch/arm64/kvm/hyp_events.c

09014fb1f2df192 Vincent Donnefort 2023-01-26  22  
09014fb1f2df192 Vincent Donnefort 2023-01-26  23  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
09014fb1f2df192 Vincent Donnefort 2023-01-26  24  	HYP_EVENT_FORMAT(__name, __struct);					\
09014fb1f2df192 Vincent Donnefort 2023-01-26 @25  	enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter,	\
09014fb1f2df192 Vincent Donnefort 2023-01-26  26  					  int flags, struct trace_event *event) \
09014fb1f2df192 Vincent Donnefort 2023-01-26  27  	{									\
09014fb1f2df192 Vincent Donnefort 2023-01-26  28  		struct ht_iterator *ht_iter = (struct ht_iterator *)iter;	\
09014fb1f2df192 Vincent Donnefort 2023-01-26  29  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
09014fb1f2df192 Vincent Donnefort 2023-01-26  30  			(struct trace_hyp_format_##__name *)ht_iter->ent;	\
09014fb1f2df192 Vincent Donnefort 2023-01-26  31  		trace_seq_puts(&ht_iter->seq, #__name);				\
09014fb1f2df192 Vincent Donnefort 2023-01-26  32  		trace_seq_putc(&ht_iter->seq, ' ');				\
09014fb1f2df192 Vincent Donnefort 2023-01-26  33  		trace_seq_printf(&ht_iter->seq, __printk);			\
09014fb1f2df192 Vincent Donnefort 2023-01-26  34  		trace_seq_putc(&ht_iter->seq, '\n');				\
09014fb1f2df192 Vincent Donnefort 2023-01-26  35  		return TRACE_TYPE_HANDLED;					\
09014fb1f2df192 Vincent Donnefort 2023-01-26  36  	}
09014fb1f2df192 Vincent Donnefort 2023-01-26  37  #include <asm/kvm_hypevents.h>
09014fb1f2df192 Vincent Donnefort 2023-01-26  38  

:::::: The code at line 25 was first introduced by commit
:::::: 09014fb1f2df192b186cd253fa990925f262f308 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
