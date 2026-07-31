Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDA5445AFF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518265; cv=none; b=KIaMWAxFgT8IraQh0dHZ0potlzc+v8NYrTXAVJRlD/JNanJc1Soa7ksio1NLhVCfSPCY53G88jjNte+j8AAzAnaaZl/ZINdGl8H/S2veYQz7EhwIQMMyTOq3C8Q8JfOroUCrk5HjlrPbuhC5TQAOt15DRv8wr+z6WFV+qnlQL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518265; c=relaxed/simple;
	bh=bfzRX+DfWl4figuQ9xk0xXeOQ0q1Z7WOJ69bzbKMMLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bBgregimpfSDRpQckiEEb8XB8GEHeZHLinGF4YBMthLUPA3GrHn4Q7XH82sgsPfqCCID6/VnObFu6JTSh8sfHlQYWYe09iJqI+8hqP9Jb9FMYlWRJniR+gyRAgUHWRJO+PbMrIOoFtgZYHMv67z0s2oj9r7MwMq8qkG9fGn+RVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZYkIy2y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZYkIy2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785518264; x=1817054264;
  h=date:from:to:cc:subject:message-id;
  bh=bfzRX+DfWl4figuQ9xk0xXeOQ0q1Z7WOJ69bzbKMMLo=;
  b=OZYkIy2ymxM02CVGTOdyVYtG/N9J126rsNtS/F4DfxzxyUtc9BDe8O3+
   UwcEZcpjOSCOM9SuLSkZYP0L5kJl7A7aH0QTeorOyiBOdnKM2ptymIla5
   hmchg4Jw+LrUodUXXVaiWGMRA4PqTjvV9CGlofrwyeGx0A67QMTRLc2IG
   ZmKsN+oROhl801kMzCPbHu7gYlq+jZxYyXQFloXJ1ulf3tT+eX2w0r6wp
   jJJ7C4Gh35jSbZmqGgcouBBtBd8vtRSdmcdgjJyqJodHwEbwB9Uq3x7Bu
   RuzSQPfl3Cl9xuNRPD+GVMOvEGjcw01r501/EHyULEsvXRaiYcOJPASPb
   w==;
X-CSE-ConnectionGUID: howjEWFUT/eLZkGsl06gBg==
X-CSE-MsgGUID: RrmBiOZnTKyTcYszA5OFmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="73685143"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="73685143"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 10:17:43 -0700
X-CSE-ConnectionGUID: DCkGfcDCRbi2OV+WIv418A==
X-CSE-MsgGUID: jrTvKMQOQyCKkY/qhyYxSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="285233382"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 10:17:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpqrb-000000001kT-3QwW;
	Fri, 31 Jul 2026 17:17:39 +0000
Date: Sat, 01 Aug 2026 01:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 5/5]
 arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for
 '__hyp_trace_find_event_name'
Message-ID: <202608010117.DX3FxzYM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   d32bfdf6c3d809458c048ad6694ba52e9b6c7440
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [5/5] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-randconfig-004-20260731 (https://download.01.org/0day-ci/archive/20260801/202608010117.DX3FxzYM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010117.DX3FxzYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010117.DX3FxzYM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for '__hyp_trace_find_event_name' [-Wmissing-prototypes]
     235 | struct hyp_event *__hyp_trace_find_event_name(const char *name,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:247:19: warning: no previous prototype for 'hyp_trace_find_event_name' [-Wmissing-prototypes]
     247 | struct hyp_event *hyp_trace_find_event_name(const char *name)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~


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
