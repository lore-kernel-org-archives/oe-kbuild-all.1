Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469123BF684
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 22:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786920210; cv=none; b=YC4g3uwCFe7Yrg8yK272an6Fxoj5nM/KWMTm/FxiWQGp7WMIPIpnHRXv5cEMqIAW/tBBHq3j0sxh2GmtTbqSna5iftjHWkOZqNYQhZanrdyNAbpIHb85XyL06KJUtfb979/V2baDXolWj2K8Mnzh5/8J6ucS51vFeV5iSo2jYNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786920210; c=relaxed/simple;
	bh=qZJciOu2pCov4l/T8xp4iR5E4Lr327oi47gDyUs/ZsU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RUdambKCasIxq5rdbrdwn13UG9JtM88zVdRz1RCl6KzlzXvq8/68JAuBFwNxJxc/BEtO11ymt7o1oKBfZmaeu72QRO4yOaS6WfQx4h5fB0eB8wU9bip/IHCMKW/NT+SWM5TTZval+KENmtPbTnW02vPbYO6M1mWjADgvl1I/Rs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPguqfMn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPguqfMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786920208; x=1818456208;
  h=date:from:to:cc:subject:message-id;
  bh=qZJciOu2pCov4l/T8xp4iR5E4Lr327oi47gDyUs/ZsU=;
  b=nPguqfMnStu3kC2wFCqRJB0oBOypb4HmiOPakJ21IBuhnjozcXL1RkoS
   qwPubwdfjpVManII95uIVXDpHWJUPyqPDBo8hFZOaBdhGZECvR5bt7aIi
   NVlQdzqaaCGb1I3aQvO3YfXadccao8Zy+EPx0iy27j3zsLj3oKzkvOvCH
   GWXFaYNRCNmfHnAjIW4aKL6vlHX10xaVfKKoRAWChEBL1UDJpe7ETBHpK
   AiiiHSgP57KX0uXNCpmK/VFoEPjwJe1DS3biNcZCFKV98GpVjN4zNm5Jf
   xUoW4n2EBbrPbcFzuY3gE1Oer9Egwh88mNHiWoZznEgtSXDu5Ed10WLIq
   Q==;
X-CSE-ConnectionGUID: MFaHaotgSDmmvZ+0nezfHg==
X-CSE-MsgGUID: fLfQLQBSQPeW1hGlD2Rx2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86518076"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="86518076"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 15:43:27 -0700
X-CSE-ConnectionGUID: EXqsCrFJTk+iJmU27Qbs7w==
X-CSE-MsgGUID: ImNf9fEVRxuLRiaxN4k+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="265361682"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Aug 2026 15:43:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvjZb-00000000d8g-3RB0;
	Sun, 16 Aug 2026 22:43:23 +0000
Date: Mon, 17 Aug 2026 06:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous
 prototype for 'hyp_event_trace_host_hcall'
Message-ID: <202608170627.XZhNfyRA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   24c059d9e217f32d61570fdbd7eb66bc999657a9
commit: 21219611de5b7057f779bc35ec6e09821942e7f4 [2/2] ANDROID: KVM: arm64: Add EL2 wakeup cause hyp events
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260817/202608170627.XZhNfyRA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170627.XZhNfyRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170627.XZhNfyRA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
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
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: in expansion of macro 'HYP_EVENT'
      61 | HYP_EVENT(host_mem_abort,
         | ^~~~~~~~~
   arch/arm64/kvm/hyp_events.c:198:6: warning: no previous prototype for 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     198 | bool hyp_trace_init_event_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:233:6: warning: no previous prototype for 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     233 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:268:19: warning: no previous prototype for 'hyp_trace_find_event' [-Wmissing-prototypes]
     268 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:281:5: warning: no previous prototype for 'hyp_trace_init_events' [-Wmissing-prototypes]
     281 | int hyp_trace_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/hyp_event_trace_host_hcall +17 arch/arm64/include/asm/kvm_define_hypevents.h

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
