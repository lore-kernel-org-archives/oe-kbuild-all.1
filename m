Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE6EEBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893392; cv=none; b=LFnW/qXUQPfr4TfbW4qFUAL26AfZgmr2P3HYyFHPgaTqNhkbxlZy6mB+5YttFthIoh7m3N77ypSSFFTYri1z72EMVKsBdftqbSuPClRg/KEcRZANuvozJyf5JMuj9f6bsTHOx0CofdcjAHzSwZZUCQNNMj1tvrNsL8Z142SSgTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893392; c=relaxed/simple;
	bh=hldgK4fwRYAbFmpTwDrKTvmfP8LlOOStdXf5lHuM52o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DqIotsOnxmhML82Fw7lX5BpuR565+uIFIkPO2TRx7RnFeb0NboF62elvqVdUPiwuz8FhsssrBUHRvX8sv1+I4SSVJSNwCsbBA3LC4Ghd9Vs/XztF3dWO+EySxfdwROgVwD0jsXw94qqQLYhF3ait7DKCLZTN2i9BELXNehKeacE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNxP7FZN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNxP7FZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786893391; x=1818429391;
  h=date:from:to:cc:subject:message-id;
  bh=hldgK4fwRYAbFmpTwDrKTvmfP8LlOOStdXf5lHuM52o=;
  b=BNxP7FZNMLSVqWyw2S75WUxUps4OX3yBZd7T/HvivlFwJn9LC1Ws2AAz
   oWOSDUm4T34G8CITMCJK5m06T5gogwUAU+8pbAgi8kltlAQlCHNjudjez
   PIvWr8D4+a/mUV/YtsMqj0E1cX/63P9eVdi8lYdsGE5UWXaV+664EgZCJ
   ttw9N/OMeGpnO949WbGu2jiw2a3BdNwEOJC/oP1s04O1APfRl4RPsrqc6
   9KDYC5XBhlaWlXiLJCUCjJn7DTyL/KlkpAZ+rrOoLC7jbnxUR81Bwucqo
   tkMBD1M7Cdijqrqa2NdcHbjzBu8myF77eiZESuLIi0XyA+xZAEpey5wkW
   A==;
X-CSE-ConnectionGUID: V4QiEN5nSPWXASHIG92/QQ==
X-CSE-MsgGUID: fXXXTjDpRnynzsJsEte+RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86347717"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="86347717"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 08:16:30 -0700
X-CSE-ConnectionGUID: nDGR1mIqSZqE29Htf9RLnQ==
X-CSE-MsgGUID: BIZAlDhZSoeDnTdV8o813A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="266681588"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2026 08:16:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvcb4-00000000cyA-1eMu;
	Sun, 16 Aug 2026 15:16:26 +0000
Date: Sun, 16 Aug 2026 23:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous
 prototype for 'hyp_event_trace_hyp_enter'
Message-ID: <202608162351.tLYdgVIK-lkp@intel.com>
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
commit: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 [2/2] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260816/202608162351.tLYdgVIK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608162351.tLYdgVIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608162351.tLYdgVIK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:100:6: warning: no previous prototype for 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     100 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:130:19: warning: no previous prototype for 'hyp_trace_find_event' [-Wmissing-prototypes]
     130 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:143:5: warning: no previous prototype for 'hyp_trace_init_events' [-Wmissing-prototypes]
     143 | int hyp_trace_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/hyp_event_trace_hyp_enter +17 arch/arm64/include/asm/kvm_define_hypevents.h

    14	
    15	#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
    16		HYP_EVENT_FORMAT(__name, __struct);					\
  > 17		void hyp_event_trace_##__name(struct ht_iterator *iter)			\
    18		{									\
    19			struct trace_hyp_format_##__name __maybe_unused *__entry =	\
    20				(struct trace_hyp_format_##__name *)iter->ent;		\
    21			trace_seq_puts(&iter->seq, #__name);				\
    22			trace_seq_putc(&iter->seq, ' ');				\
    23			trace_seq_printf(&iter->seq, __printk);				\
    24			trace_seq_putc(&iter->seq, '\n');				\
    25		}
    26	#define HYP_EVENT_MULTI_READ
    27	#include __HYP_EVENT_FILE
    28	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
