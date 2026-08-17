Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473AD3FAE1B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964986; cv=none; b=Ljei6D2Lit22l9gIo5evB/ZW6JBncG6BstnMTiITcBbwRSQXdCjtRrBht6UBi5X9Z7YmgUMdD8RY+PjHUDpun6pnT8k3qTHweG1sRqFh0NBia/DbYKuALbyq1c9adpRMVMpzmPAA3p2wx+RcwX/ed4jfvZGg4iSJsKBM+yaf/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964986; c=relaxed/simple;
	bh=R5RWFrEkPLsupnHmSzpb7k54d8794WILQCgey6h/NBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pCmgDKNAZ2rcSLlUqUKwt7v6Ko0whY+wyzasWPfQLPcEN5np8EL2lYyQYfOeT25+XPm1E6OfSm2G4w9Fl4FSR3ZHetV8T3oBk56Z3DSOdhcaq6qMvOxdq/Jka8dqO3ovjK0tTNdbRamGo/1iR+LXais3G0exFazWsb7pwKbaGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsdXXklp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsdXXklp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786964985; x=1818500985;
  h=date:from:to:cc:subject:message-id;
  bh=R5RWFrEkPLsupnHmSzpb7k54d8794WILQCgey6h/NBI=;
  b=nsdXXklpJA35p7fSov7AdK0t3F3k6wcXOktSET1mtf2HfYytAQNovlVB
   zyM3kk6Np7AQZGo0BQZzSe7dJ4bkN27to3C6R9C3TJ7SwHEpaAZRhEDzo
   JZ3lf3esFjsNCGvszQnFyzMKJFpHoQsp+r7AZMNNPnxJNQArMPiCSvUiu
   ycl7sY2XuG3fpHdm+rQfQZwSMaYCuSezdeTwBSMkRy5pVuL+jCD4Bj4qx
   Qk1bHuN3ItEFx4rpDK/s7TeeiHdqyixfpSHxDp5560ELbuWN1J7uABBL9
   Qv7/RbrOjSXu+HO2nBbCsoVOM8gCsvWu0MjkEw6eYiQg0gKfCkb+JHtLB
   g==;
X-CSE-ConnectionGUID: +JrrWUbdSpWKUBhvrS4aNA==
X-CSE-MsgGUID: gNN36a1XSKGiBxC8+EcmHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98591543"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98591543"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 04:09:45 -0700
X-CSE-ConnectionGUID: xBRKPwC+QpSdKfxVNZFBug==
X-CSE-MsgGUID: 46bw5RrLQo2UHNQAxn3+0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="263120662"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Aug 2026 04:09:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvvDn-00000000dQs-3ZUI;
	Mon, 17 Aug 2026 11:09:39 +0000
Date: Mon, 17 Aug 2026 19:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous
 prototype for 'hyp_event_trace_host_ffa_call'
Message-ID: <202608171832.B1XhLy5o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   24c059d9e217f32d61570fdbd7eb66bc999657a9
commit: 107000fef3c7d0562e234da7033f35b53d0e8b3d [2/2] ANDROID: KVM: arm64: Add FF-A trace event
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260817/202608171832.B1XhLy5o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171832.B1XhLy5o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608171832.B1XhLy5o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:14:
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: in expansion of macro 'HYP_EVENT'
      61 | HYP_EVENT(host_mem_abort,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace___hyp_printk' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:75:1: note: in expansion of macro 'HYP_EVENT'
      75 | HYP_EVENT(__hyp_printk,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_ffa_call' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:95:1: note: in expansion of macro 'HYP_EVENT'
      95 | HYP_EVENT(host_ffa_call,
         | ^~~~~~~~~
   arch/arm64/kvm/hyp_events.c:215:6: warning: no previous prototype for 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     215 | bool hyp_trace_init_event_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:265:19: warning: no previous prototype for 'hyp_trace_find_event' [-Wmissing-prototypes]
     265 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:339:6: warning: no previous prototype for 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     339 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:361:5: warning: no previous prototype for 'hyp_trace_init_events' [-Wmissing-prototypes]
     361 | int hyp_trace_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:378:5: warning: no previous prototype for 'hyp_trace_init_mod_events' [-Wmissing-prototypes]
     378 | int hyp_trace_init_mod_events(struct hyp_event *event,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_event_trace_host_ffa_call +17 arch/arm64/include/asm/kvm_define_hypevents.h

f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  14  
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  15  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  16  	HYP_EVENT_FORMAT(__name, __struct);					\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26 @17  	void hyp_event_trace_##__name(struct ht_iterator *iter)			\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  18  	{									\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  19  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  20  			(struct trace_hyp_format_##__name *)iter->ent;		\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  21  		trace_seq_puts(&iter->seq, #__name);				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  22  		trace_seq_putc(&iter->seq, ' ');				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  23  		trace_seq_printf(&iter->seq, __printk);				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  24  		trace_seq_putc(&iter->seq, '\n');				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  25  	}
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  26  #define HYP_EVENT_MULTI_READ
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  27  #include __HYP_EVENT_FILE
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  28  

:::::: The code at line 17 was first introduced by commit
:::::: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
