Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6C22B667
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729807710; cv=none; b=UrqOZ0L+4szDLT8/xKezYtTcu3wgvp/7jarbdufm8ej3Hykvc+A0gK2ZJCbW2YOF/pG2cvvczQ+fDAz3AoUtXeAGfgcQyZ5bEuJ3pT4K0H6svA7K/6xDDXZZuBl8dl39ryV9kWnsIsaQI+AAVVps8CQZhimLqW0ajqDJP6gzpA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729807710; c=relaxed/simple;
	bh=U+/TrNxggrahKii8ukvItrj340IDkKfrFOybmnK/DNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DStCqTZdMM5/skUq7jKLaeZf7poaTKW92NIGW7FIguE/OV0vOTuUvu3UItDVx9DntUwNXSDoiPHAef0gtixJGJWwxei9E6zA01jmPLTMEerj0n3l+8Sx3w2Diz3cuZJ2Gaw67l72qwkEFYkM3y7vWI7umu0UsRjAoEUKkYJBeq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFqb3aFi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFqb3aFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729807708; x=1761343708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+/TrNxggrahKii8ukvItrj340IDkKfrFOybmnK/DNA=;
  b=gFqb3aFieMQAjpWnEv+AnJP4+UUBLSnT35OeR2xYbNRpfwQSbf4LnW2i
   Hwc/EgVEOhVAFmV0OtDoZKh/QPIzRgXcDZSqlco4JKGZBWdeX+rQ5FcwV
   A+N8HCITQ7HXVxTjFYIbpJiOpPQLM3OepFEXmvHYFcqxYnZZ81Qr0LmoX
   McWgiRsvmYaIP+VhfnMKyrrH351C66zMPL1ZelZcIsy9LXXTf5FR76vaU
   fnxN99jZm0xt67ECmWubYjjIzN+pGfukhOR4kbIMhyUFAc5oPAVHgy1q/
   DRfTiCRRlK71Ur7xUP2h32nejEeOmMOwMl02q/LrT+qpmKMIYrUa0dNCy
   Q==;
X-CSE-ConnectionGUID: HMfNJVExRr6HXDJAPfGgFg==
X-CSE-MsgGUID: fIDbbhOLTqua8jJnrEXwNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40860456"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="40860456"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 15:08:26 -0700
X-CSE-ConnectionGUID: oyiLaJ3RQYGwvuWDQGCOcw==
X-CSE-MsgGUID: qaDYhTDCTd+7maTRL7dtqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80638295"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2024 15:08:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t460E-000XCE-17;
	Thu, 24 Oct 2024 22:08:22 +0000
Date: Fri, 25 Oct 2024 06:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 10/24]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous
 prototype for 'hyp_event_trace___hyp_printk'
Message-ID: <202410250637.MwQSWyQZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   62a6e357a87f69fec728ecd9215da6b38b84c2e3
commit: 35cb80a22a73eff43226ffd5e13406de2167a216 [10/24] ANDROID: KVM: arm64: trace_hyp_printk()
config: arm64-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250637.MwQSWyQZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250637.MwQSWyQZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250637.MwQSWyQZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:14:
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
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: in expansion of macro 'HYP_EVENT'
      61 | HYP_EVENT(host_mem_abort,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace___hyp_printk' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:75:1: note: in expansion of macro 'HYP_EVENT'
      75 | HYP_EVENT(__hyp_printk,
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


vim +/hyp_event_trace___hyp_printk +17 arch/arm64/include/asm/kvm_define_hypevents.h

f6dbfc683cf5fb Vincent Donnefort 2023-01-26  14  
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  15  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  16  	HYP_EVENT_FORMAT(__name, __struct);					\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26 @17  	void hyp_event_trace_##__name(struct ht_iterator *iter)			\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  18  	{									\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  19  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  20  			(struct trace_hyp_format_##__name *)iter->ent;		\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  21  		trace_seq_puts(&iter->seq, #__name);				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  22  		trace_seq_putc(&iter->seq, ' ');				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  23  		trace_seq_printf(&iter->seq, __printk);				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  24  		trace_seq_putc(&iter->seq, '\n');				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  25  	}
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  26  #define HYP_EVENT_MULTI_READ
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  27  #include __HYP_EVENT_FILE
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  28  

:::::: The code at line 17 was first introduced by commit
:::::: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
