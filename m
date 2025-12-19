Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612BA84039
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766102863; cv=none; b=aG3D0ocvJbh9WNE7g1ql0mhJFkTwKsd4etAm+2oZEvPG07nZ31R4pEBmxmExOx/gzh19BPUN2wNBOR2k8O4EibQZ/cgF+16kpdP74BPEm85U9dQrmIJYd7c+sDZoJKdwSRklhThVzn032veHgpTbZAKLcGflyYaCn4F5AEEnpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766102863; c=relaxed/simple;
	bh=AMlj+DH8HhPkkaxziT9pDky9amwe1MKBXcLEMN2p4cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4XVlRAYPAVn2fNUXJa4+kf7kIPoT3upmCBuap78a7U0fVjVMpbM1+/iBqmOxC/MADLcopmUz2C4TiyieJYdVLre6joMlLhLFswwtyclJIzUHdEX+RNtoH9I9SRthpaOomCvJ3qTIO9gAWmMBYb5/foYZDU+pBP1tk6FqPTuNZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBRPRQHI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBRPRQHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766102860; x=1797638860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AMlj+DH8HhPkkaxziT9pDky9amwe1MKBXcLEMN2p4cA=;
  b=NBRPRQHItExy/XkdpAXM7m9odcNaIxQsbv+QzDa5FznnsJqkCD4AewEx
   ZUx5WP/df1n3436qMVDVcOYQI2H0xMZHYh9sRBdXC8YyKsaHVIHlnupfd
   tovPajR8u41WGHSmIPPG8W/1gbLPFlbLGXZBTVeBNTAuLCGYOVCnW7rCV
   T1p7/0OdBTq9+Lm/HrJg4apkjkvjXUyA/BK2Iz5fuh25PQfM4uk8JCGwZ
   X5Uus994tW3f+SUJNcIzo3zgJFhqB+zNKz102AQtbkwSV+gKJuKrcmC8p
   0mlrlwCFpT3Xp8ZZ+mqRxILacPIfNyGuxIx5iKphmC8Cz7n85YQ76wtZx
   w==;
X-CSE-ConnectionGUID: m8x0OM8sQzKBbxA8US8BLw==
X-CSE-MsgGUID: HxbkA8PVQ7m1bLJ5qMJB7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71697393"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="71697393"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 16:07:37 -0800
X-CSE-ConnectionGUID: 7RntzhyXQ0O1XrCpMDSr/Q==
X-CSE-MsgGUID: GZdAOeqERZq4DuI9D4drMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198732727"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Dec 2025 16:07:36 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWO1t-000000002mz-3aDY;
	Fri, 19 Dec 2025 00:07:33 +0000
Date: Fri, 19 Dec 2025 08:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for
 'hyp_event_trace_host_hcall'
Message-ID: <202512190855.CkeFJE1z-lkp@intel.com>
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
commit: 508af69a745a81d6fedd161b4d5d614a9d1f9788 [43/43] ANDROID: KVM: arm64: Add EL2 wakeup cause hyp events
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251219/202512190855.CkeFJE1z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190855.CkeFJE1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190855.CkeFJE1z-lkp@intel.com/

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
>> arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
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


vim +/hyp_event_trace_host_hcall +25 arch/arm64/kvm/hyp_events.c

09014fb1f2df19 Vincent Donnefort 2023-01-26  22  
09014fb1f2df19 Vincent Donnefort 2023-01-26  23  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
09014fb1f2df19 Vincent Donnefort 2023-01-26  24  	HYP_EVENT_FORMAT(__name, __struct);					\
09014fb1f2df19 Vincent Donnefort 2023-01-26 @25  	enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter,	\
09014fb1f2df19 Vincent Donnefort 2023-01-26  26  					  int flags, struct trace_event *event) \
09014fb1f2df19 Vincent Donnefort 2023-01-26  27  	{									\
09014fb1f2df19 Vincent Donnefort 2023-01-26  28  		struct ht_iterator *ht_iter = (struct ht_iterator *)iter;	\
09014fb1f2df19 Vincent Donnefort 2023-01-26  29  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
09014fb1f2df19 Vincent Donnefort 2023-01-26  30  			(struct trace_hyp_format_##__name *)ht_iter->ent;	\
09014fb1f2df19 Vincent Donnefort 2023-01-26  31  		trace_seq_puts(&ht_iter->seq, #__name);				\
09014fb1f2df19 Vincent Donnefort 2023-01-26  32  		trace_seq_putc(&ht_iter->seq, ' ');				\
09014fb1f2df19 Vincent Donnefort 2023-01-26  33  		trace_seq_printf(&ht_iter->seq, __printk);			\
09014fb1f2df19 Vincent Donnefort 2023-01-26  34  		trace_seq_putc(&ht_iter->seq, '\n');				\
09014fb1f2df19 Vincent Donnefort 2023-01-26  35  		return TRACE_TYPE_HANDLED;					\
09014fb1f2df19 Vincent Donnefort 2023-01-26  36  	}
09014fb1f2df19 Vincent Donnefort 2023-01-26  37  #include <asm/kvm_hypevents.h>
09014fb1f2df19 Vincent Donnefort 2023-01-26  38  

:::::: The code at line 25 was first introduced by commit
:::::: 09014fb1f2df192b186cd253fa990925f262f308 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
