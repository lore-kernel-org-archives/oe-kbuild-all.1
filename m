Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613851DED63
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377823; cv=none; b=ANIcPmUhFjXfBQ6OHY7uIP1eyvsefG8HbPx0aPwqU15Lgf6DNsAPUIINez535EdHWoCMBZ1jXsa8f2MgxgyqnJR0rnIWGpkMMfPcezDAd2F/hjgrkhhgVrXWWxliGjthrhBY+7cVo2XUCo8bRf227Plc7ygKOGrOBd7tjWVWIiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377823; c=relaxed/simple;
	bh=Xdhy2org3ssbi9e3v8EgFb8vrM0isMB0RNclzGBM0Yg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mCfFdF34EdDoIM0B0TXH+ByX1T9PTDbJLiiYchSDoMGQWDCIRf7OfytRz2VCOoEiAVQqZWUlpMQMCiDEJ4C6Us92BjphKoWYbsWQF8LifddgOzUjdu7DioMokWDPrSDaRbFJGDbfzJh+PxvX2ttYbQNNbcevfOP3t3VkCbWZq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxLfN3xF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxLfN3xF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784377822; x=1815913822;
  h=date:from:to:cc:subject:message-id;
  bh=Xdhy2org3ssbi9e3v8EgFb8vrM0isMB0RNclzGBM0Yg=;
  b=mxLfN3xFwtoXxwYSwCCDfjp5c9cyhx1DgqgmqUIB4FiHdV0ccUDyVkHF
   bjl6hw9bRcyHHE/3V9P/peHEYt9K0Y+XAQzdFMebBJ79W6z2ITks0FUQ0
   9FbKMwd5ZM6wXYxW/+I/+uthiSFw7Kxixl/DixIg4hij4v/ZwlwSZQJXi
   yN+AHct2EfnkHW1iDqur6oMsRDybVLKocndar+WTqPsIY8vQTqQWX8tQI
   BhJtcPATVIFyJuI1zondWxOZKnNgBPBRUCfT2ysW2ncdTyA7s7X/gl1nC
   76OkUWagcTkj+5EXXbx33DKiST6atC/kb5x9p6fZOFF6C2712HsMDr6xD
   w==;
X-CSE-ConnectionGUID: VKfG5VmqTtaNWPM9kcLryg==
X-CSE-MsgGUID: rpybsZKqSV6BwkCL/UO/rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96163275"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96163275"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 05:30:22 -0700
X-CSE-ConnectionGUID: hduEBXgcQXaALPFKFeicoQ==
X-CSE-MsgGUID: n7tc56HoROikm9wjwmDIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="280297904"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2026 05:30:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl4BJ-00000000UlW-28CS;
	Sat, 18 Jul 2026 12:30:14 +0000
Date: Sat, 18 Jul 2026 20:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 192/192]
 arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for
 function 'kvm_hyp_events_enable_early'
Message-ID: <202607182057.0DrDe7ve-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   15bdff0dd01eed4ffc4ae138c5a611d8b102a4b6
commit: 605d8f6940c38faeaa0aa91a8c793d1d8cd5eab5 [192/192] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607182057.0DrDe7ve-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607182057.0DrDe7ve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607182057.0DrDe7ve-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:37:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/kvm/hyp_events.c:25:20: note: expanded from macro 'HYP_EVENT'
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^
   <scratch space>:45:1: note: expanded from here
      45 | hyp_event_trace_hyp_enter
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:25:2: note: expanded from macro 'HYP_EVENT'
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:37:
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      23 | HYP_EVENT(hyp_exit,
         | ^
   arch/arm64/kvm/hyp_events.c:25:20: note: expanded from macro 'HYP_EVENT'
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^
   <scratch space>:50:1: note: expanded from here
      50 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:25:2: note: expanded from macro 'HYP_EVENT'
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |         ^
>> arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for function 'kvm_hyp_events_enable_early' [-Wmissing-prototypes]
     204 | bool kvm_hyp_events_enable_early(void)
         |      ^
   arch/arm64/kvm/hyp_events.c:204:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     204 | bool kvm_hyp_events_enable_early(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:239:6: warning: no previous prototype for function 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
     239 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:239:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     239 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:271:5: warning: no previous prototype for function 'kvm_hyp_init_events' [-Wmissing-prototypes]
     271 | int kvm_hyp_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:271:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     271 | int kvm_hyp_init_events(void)
         | ^
         | static 
   6 warnings generated.


vim +/kvm_hyp_events_enable_early +204 arch/arm64/kvm/hyp_events.c

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
