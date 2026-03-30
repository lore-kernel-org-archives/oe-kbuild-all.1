Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00373D6CC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880719; cv=none; b=Eh8MQko7DGLrO/Vfjn9dwBwRXyqgPfg4XR0I6S6CKCVU3IAKkzou04pquYlE9kIiT0bAPshQiIpTMEsjCI8CXAPGrJEJZ5ao0qUQb/93XKK2ifgYd0JqTWGuYm0mwOaz+7gmSRtjj5c2zc1bsYYWnQWVHTp6wGLvEi/TUgH5nhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880719; c=relaxed/simple;
	bh=olKY+95pMAh99xIg89zN503QPy6Bor6faDv+kQav80g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LBqBUL0zF+qtR/d1YAiU2nxFaiXOPjJ4hOFxxp4afZQLIzo7zPX+jnj/+m0PO6dV1YeqnZcuy9cIXy42tsaPEDy1HspK4tbyF0ULPUVzzojQMjrO99eA6TBLV287zzPo1EKUmpzm+RK5hltKS5WrrJuD2yzOTcZzQCucAIjsAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6tyHtAD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6tyHtAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774880718; x=1806416718;
  h=date:from:to:cc:subject:message-id;
  bh=olKY+95pMAh99xIg89zN503QPy6Bor6faDv+kQav80g=;
  b=j6tyHtADr6xLgvL3NlhL1/trrVSdsp25cU4gfTtdxsnHRiOm178oPatx
   +LFM1tHioV29Dsix8OHqtuMYbyO+FkcZY1WmIodVL9lY2vEDSITOzabvJ
   kXPfquVSor9WpsN6j/gl/crBZgRE04f3gd3XgMSNS5rBRdpwoImDurUte
   kPfJVAgkCPkbB+Ia+IiIcV7SOnTdRez+h6yxOEAIELUuX/XQTRNHRKWLy
   51BXSVnJhagKNLKPqc0TmM1uLzDoIJvXdre+861Z3ra9ZyZJucVF4zjvV
   E9uID+ezzhtnnuOmFxKYdNx/SphMrPp3dUJrJ5sYB+xyBjvq39ReGvj7J
   w==;
X-CSE-ConnectionGUID: 38Xge4IEQMiCDGw/A5LGkA==
X-CSE-MsgGUID: 2tHdwab3RVOKRsD0F2IU2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86492788"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86492788"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 07:25:17 -0700
X-CSE-ConnectionGUID: 2uzBGJgrQ9SBLaef0GVQpA==
X-CSE-MsgGUID: Yj0x2yaURty85QNZHFFA7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="226051125"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Mar 2026 07:25:15 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7DYH-000000001CR-1oa7;
	Mon, 30 Mar 2026 14:25:13 +0000
Date: Mon, 30 Mar 2026 22:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 5/5]
 arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for
 function '__hyp_trace_find_event_name'
Message-ID: <202603302257.iLN6vQva-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [5/5] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603302257.iLN6vQva-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302257.iLN6vQva-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302257.iLN6vQva-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for function '__hyp_trace_find_event_name' [-Wmissing-prototypes]
     235 | struct hyp_event *__hyp_trace_find_event_name(const char *name,
         |                   ^
   arch/arm64/kvm/hyp_events.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | struct hyp_event *__hyp_trace_find_event_name(const char *name,
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:247:19: warning: no previous prototype for function 'hyp_trace_find_event_name' [-Wmissing-prototypes]
     247 | struct hyp_event *hyp_trace_find_event_name(const char *name)
         |                   ^
   arch/arm64/kvm/hyp_events.c:247:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     247 | struct hyp_event *hyp_trace_find_event_name(const char *name)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__hyp_trace_find_event_name +235 arch/arm64/kvm/hyp_events.c

   231	
   232	#define nr_events(__start, __stop) \
   233		(((unsigned long)__stop - (unsigned long)__start) / sizeof(*__start))
   234	
 > 235	struct hyp_event *__hyp_trace_find_event_name(const char *name,
   236						      struct hyp_event *start,
   237						      struct hyp_event *end)
   238	{
   239		for (; start < end; start++) {
   240			if (!strncmp(name, start->name, HYP_EVENT_NAME_MAX))
   241				return start;
   242		}
   243	
   244		return NULL;
   245	}
   246	
 > 247	struct hyp_event *hyp_trace_find_event_name(const char *name)
   248	{
   249		struct hyp_event_table *table;
   250		struct hyp_event *event =
   251			__hyp_trace_find_event_name(name, __hyp_events_start,
   252						    __hyp_events_end);
   253	
   254		if (event)
   255			return event;
   256	
   257		rcu_read_lock();
   258		table = rcu_dereference(mod_event_tables.tables);
   259	
   260		for (int i = 0; i < mod_event_tables.nr_tables; i++) {
   261			struct hyp_event *end = table->start + table->nr_events;
   262	
   263			event = __hyp_trace_find_event_name(name, table->start, end);
   264			if (event)
   265				break;
   266		}
   267	
   268		rcu_read_unlock();
   269	
   270		return event;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
