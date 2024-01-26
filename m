Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934E71B7E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706254360; cv=none; b=SLOVEYb1OL3IEhUCzyd0P23LR/vbImeXTDGAEaZT3i2/iMvn8av/8XI6u9nElOBLVMHzlvYWpHEsSmeXs1nRomPFnK6QOJk7AofImOEwL7v34malEqebBSBS4M7vhESdCnozdaSlq5+ga3d0NA6bAtjecCoAeeqDybPpneNL5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706254360; c=relaxed/simple;
	bh=aM19VyWyPn68SdX+YYd/oTUjbiIvA5PNytjJ080SLG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyO9BHGHJJAE6VIqRTZCH++gjSrU9eVE/UiTblkSnQltFC7gLHuMaPKlhgvhw2mqkJ0doQsEV4kOzP7dMuhM9NiahfH0KAJ4HmNVe56aoboBthvAfzvwREZSieb3x5fKiWTDTlTU1NZcjxNDh7DDiSfMkisDdF3n0RpBMoJrnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Is+2OAuu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Is+2OAuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706254358; x=1737790358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aM19VyWyPn68SdX+YYd/oTUjbiIvA5PNytjJ080SLG4=;
  b=Is+2OAuudUNNW62fKOt23W0fAKEQtAEeK26kHCRSUIkBx4EenAAXNEQb
   WOAyph/xeC24PJFEIbprhlrFN7wxBH3CqK7Sp+D1USgoKEr5uDDJjPVJj
   i7FWbFMgN+/tXS0+Qi6PzLD6ZDzkgZ1fnKrXzeX12G5rj39/zHF9Kgd58
   I3egqSO75Feb8wcG/0j/0y9cxa/DaivxE3W3lAW9VW2K32tpy4K7XnHCm
   BCILY1jmjDUQyl5xAu5oQz7tYe52WyBY21XinZGHspFVHJuJvBiIB8mMI
   rdfpJNJekdkuIlqqmdtBIP2FJ5FI+24jwxR3ZM2oq8ZoUz75caKUdIv/P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9090314"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9090314"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 23:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906234795"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="906234795"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jan 2024 23:32:36 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTGhW-0000o8-2U;
	Fri, 26 Jan 2024 07:32:34 +0000
Date: Fri, 26 Jan 2024 15:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 162/175]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous
 prototype for 'hyp_event_trace_host_hcall'
Message-ID: <202401261557.lWaeWGk8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   e6b3285f8eb58473413c1f538d0cabedf2a6a11b
commit: 96454a30e1dda5ca95c5508ae15910cb26b535b6 [162/175] ANDROID: KVM: arm64: Add EL2 wakeup cause hyp events
config: arm64-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240126/202401261557.lWaeWGk8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261557.lWaeWGk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261557.lWaeWGk8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
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

92831dd9422c1f Vincent Donnefort 2023-01-26  14  
92831dd9422c1f Vincent Donnefort 2023-01-26  15  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
92831dd9422c1f Vincent Donnefort 2023-01-26  16  	HYP_EVENT_FORMAT(__name, __struct);					\
92831dd9422c1f Vincent Donnefort 2023-01-26 @17  	void hyp_event_trace_##__name(struct ht_iterator *iter)			\
92831dd9422c1f Vincent Donnefort 2023-01-26  18  	{									\
92831dd9422c1f Vincent Donnefort 2023-01-26  19  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
92831dd9422c1f Vincent Donnefort 2023-01-26  20  			(struct trace_hyp_format_##__name *)iter->ent;		\
92831dd9422c1f Vincent Donnefort 2023-01-26  21  		trace_seq_puts(&iter->seq, #__name);				\
92831dd9422c1f Vincent Donnefort 2023-01-26  22  		trace_seq_putc(&iter->seq, ' ');				\
92831dd9422c1f Vincent Donnefort 2023-01-26  23  		trace_seq_printf(&iter->seq, __printk);				\
92831dd9422c1f Vincent Donnefort 2023-01-26  24  		trace_seq_putc(&iter->seq, '\n');				\
92831dd9422c1f Vincent Donnefort 2023-01-26  25  	}
92831dd9422c1f Vincent Donnefort 2023-01-26  26  #define HYP_EVENT_MULTI_READ
92831dd9422c1f Vincent Donnefort 2023-01-26  27  #include __HYP_EVENT_FILE
92831dd9422c1f Vincent Donnefort 2023-01-26  28  

:::::: The code at line 17 was first introduced by commit
:::::: 92831dd9422c1f5f813254c9a1595e611e847b97 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
