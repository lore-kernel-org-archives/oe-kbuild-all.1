Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2629D0D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 02:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729737934; cv=none; b=Q1bRErsjJcYEQocXygMcuALRgYa5rK3co7uxFCgNIDxvUXl8e+CKdhToHfMopPbDaMc1YCBZIeTNNmS3gTLvmqUdASArryRp09LT0a8Y3AywJFa550R/I9EGrNr02yKU4JqVR2Vki8qXzl5FI/0vTaLYueVRIGQXpYdFYOmaAuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729737934; c=relaxed/simple;
	bh=EecBDk7NqbEIo9wsmtq+9TipAZQuh/cZq6SU79ZX5vM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZXfqbKeAAhhcc3dzxuP/OTZW4yBgxd9HimYKz/EONVWQFJq1f3UMFEISKuXC3743wXGgTwkw1brWgFgm0lZSV+XKi7oQEOdbG/K+U1+2OoBdF4ZkdvdtSlcbqoZOgIw7ifzowgh5FxSRB7hg6phbEum8ptSJru252KTpmn0Lsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvY18iET; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvY18iET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729737932; x=1761273932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EecBDk7NqbEIo9wsmtq+9TipAZQuh/cZq6SU79ZX5vM=;
  b=bvY18iET2QNCufTBqJCH362u5pbsFKTZuvuu01ye8F2/Bb46cD1XXzuv
   wmsvpwICZRSItdLnBykCtglzV5i1nv5K6CWdtJ5xOLTwzUeZ5pPjRVEtR
   j9JEQQi0IHv1w5aNHxDt5xQhlWyVG1B7+rsZB+HCoyDsU/lZnLGkU8lAz
   2L/xZHInIMI2Fs219jrCQ86H8GDy8FYo155JOw+Cgm4vDs/Y83Vq4CIsj
   4Sud5fwZwKBrIdXHOyK8CGLTjM2GVJJv2qUKAjx50p0i/zryFegjFpxXd
   pktTrXTK98bLgmwIbjh33cpD9y0TSaP3WHQ6dFo4n3W/7Z/ZBN2ZRMAka
   g==;
X-CSE-ConnectionGUID: yjc1adHlRkGEM9Gf9AyxLQ==
X-CSE-MsgGUID: 6JM2xYHzTgOfACqEL7befQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29517000"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29517000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 19:45:31 -0700
X-CSE-ConnectionGUID: fnQHEv1SQEWX121T8FzRjA==
X-CSE-MsgGUID: xi46d6hIQeyRih9gGGbCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80761747"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2024 19:45:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3nqq-000Vqm-1B;
	Thu, 24 Oct 2024 02:45:28 +0000
Date: Thu, 24 Oct 2024 10:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 157/176]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous
 prototype for 'hyp_event_trace_hyp_enter'
Message-ID: <202410241026.VA7cCjBd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7f1ad2ebaa24958e3b0527f36d96e58f42cf3f0e
commit: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 [157/176] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241026.VA7cCjBd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241026.VA7cCjBd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241026.VA7cCjBd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
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
