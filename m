Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9F24BBEE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974403; cv=none; b=Kh4uLhy6D4EgdcBmfaNRgnbkW0wkNz8z2Ap5WVP9WFv+6EXiVQJedua55XeVLQa3ij56491/WGab+NgGkJmtxGIp6KJB4TwXxLVkt5PgdsdlVYDjbiJbdR8CPwMRtl2VX7OoTtXZXFapmf9gGfiX2wAOoI8r9EnnX2E/mLwmVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974403; c=relaxed/simple;
	bh=OCPbF354vmG9PkJGS47q2uijd3COkvmdyPBKqEPGRgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=br+H3NBzF3cqD1BLz+Sz9/TbzLxWYhiV3uIoRukx8/wPUSHud+rhVWzMlJNjkMpPyuRvgifVvzREbKaELTuTuS0lofTQEpCDNQ3yjxJ8doex+FP66ANsPgc7JJOz4d08dUNsw8CkcfNzfSjQc8sjRYCFFzW3X6dQz1BwAwyN4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NX36Wikc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NX36Wikc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765974399; x=1797510399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OCPbF354vmG9PkJGS47q2uijd3COkvmdyPBKqEPGRgo=;
  b=NX36Wikck+IsgBAazv5kw1bMYu79woX527a51LdC8dJv/LHbXZNRejqR
   vMWAJwui5wsnQx+oSnGPDX1gH1N0nK/AWqGeJPO/MdA19PdTPuJ9jforp
   26q59b8kSkuDpbCo/CGpQZnUbf5llQra+oziJ1bZCIs9E+mxcNecpdAYf
   nRq/lHrB5JbcxyJKgG9oNwYad4ZAfZ2dXfciz3QOXo/MKWPK/tp2hJpxD
   q3uixOFiGqsBHqDLBaNiLmFMauXR38VrkOGbQ3AfgzwswZGhhDMz40zV2
   NmJ6G/gdfY4LckeCo0he/o/BakmSKrfj9tnNXJmjxuKd60oreV4O6XsEw
   w==;
X-CSE-ConnectionGUID: nhG1EBU8Sj2d86zOtU++zQ==
X-CSE-MsgGUID: LfbOcICDTVS9djHEU/+0jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78548223"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78548223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 04:26:37 -0800
X-CSE-ConnectionGUID: C9zjcyTEQlim5xfjZ4prdA==
X-CSE-MsgGUID: rCSSqCwDTs2O7kj4j6lYLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="199099465"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Dec 2025 04:26:36 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVqby-000000000X3-1P9c;
	Wed, 17 Dec 2025 12:26:34 +0000
Date: Wed, 17 Dec 2025 20:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 2/2]
 arch/arm64/kvm/hyp_events.c:166:6: warning: no previous prototype for
 function 'kvm_hyp_init_events_tracefs'
Message-ID: <202512172047.zaUCCYWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-05
head:   ba1ec287446a6073710b310cc18a37b90b5d2910
commit: 09014fb1f2df192b186cd253fa990925f262f308 [2/2] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-randconfig-002-20251217 (https://download.01.org/0day-ci/archive/20251217/202512172047.zaUCCYWo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172047.zaUCCYWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172047.zaUCCYWo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:34:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/kvm/hyp_events.c:22:20: note: expanded from macro 'HYP_EVENT'
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^
   <scratch space>:84:1: note: expanded from here
      84 | hyp_event_trace_hyp_enter
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:22:2: note: expanded from macro 'HYP_EVENT'
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:34:
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      23 | HYP_EVENT(hyp_exit,
         | ^
   arch/arm64/kvm/hyp_events.c:22:20: note: expanded from macro 'HYP_EVENT'
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^
   <scratch space>:89:1: note: expanded from here
      89 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:22:2: note: expanded from macro 'HYP_EVENT'
      22 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |         ^
>> arch/arm64/kvm/hyp_events.c:166:6: warning: no previous prototype for function 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
     166 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     166 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:198:5: warning: no previous prototype for function 'kvm_hyp_init_events' [-Wmissing-prototypes]
     198 | int kvm_hyp_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     198 | int kvm_hyp_init_events(void)
         | ^
         | static 
   4 warnings generated.


vim +/kvm_hyp_init_events_tracefs +166 arch/arm64/kvm/hyp_events.c

   165	
 > 166	void kvm_hyp_init_events_tracefs(struct dentry *parent)
   167	{
   168		struct hyp_event *event = __start_hyp_events;
   169		struct dentry *d, *event_dir;
   170	
   171		parent = tracefs_create_dir("events", parent);
   172		if (!parent) {
   173			pr_err("Failed to create tracefs folder for hyp events\n");
   174			return;
   175		}
   176	
   177		for (; (unsigned long)event < (unsigned long)__stop_hyp_events; event++) {
   178			event_dir = tracefs_create_dir(event->name, parent);
   179			if (!event_dir) {
   180				pr_err("Failed to create events/hyp/%s\n", event->name);
   181				continue;
   182			}
   183			d = tracefs_create_file("enable", 0700, event_dir, (void *)event,
   184					&hyp_event_fops);
   185			if (!d)
   186				pr_err("Failed to create events/hyp/%s/enable\n", event->name);
   187	
   188			d = tracefs_create_file("id", 0400, event_dir, (void *)event,
   189					&hyp_event_id_fops);
   190			if (!d)
   191				pr_err("Failed to create events/hyp/%s/id\n", event->name);
   192		}
   193	}
   194	
   195	/*
   196	 * Register hyp events and write their id into the hyp section _hyp_event_ids.
   197	 */
 > 198	int kvm_hyp_init_events(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
