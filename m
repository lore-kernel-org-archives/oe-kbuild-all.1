Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD84212B0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 17:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755191996; cv=none; b=ZrrZBk4AWkH6DabR8zPhDB+vdAtswXvlxAkB/UGwFe7pbowvB0NdZ5FXrSeCAFInCJjzXnGrZYzArMg1Wyfwz/CWV+rcZjsjcGOM7HDHNK+TVSejsb4cO639BzvEmEujMDbG6XfLkKnFiCs2FUeMiR7wAM7PlNuppmBqmMzjiGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755191996; c=relaxed/simple;
	bh=cYJk3lRPUN9EO9teftknbkyrMqbi+7Q+2LGs5MPUGnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NV7iEVuGYyQFayR9IXCf3LwJt7nUg3yM+wSVZB6mSpIkiQUqADF35RDrENHO5QGiSwOOl9dqNJpSdFyJdtG107AqCOEAV7BpGwVdc0qbd0BMiR3kppO/lTnl8dhNyQntKpaT4u2sA5cS9hQq16BLIEKOfz//3aMLu00o95okf6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHYjm+qL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHYjm+qL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755191995; x=1786727995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cYJk3lRPUN9EO9teftknbkyrMqbi+7Q+2LGs5MPUGnk=;
  b=oHYjm+qL9F0QktXLKGfEwZDsrK3VC3kYBpwHb6NPOZtWaCu3wNMWMW6C
   KnJznDaYsRpavqSepSSRMW8aw4US0umqB+7aMzjUD4s3BtQeW4mrDh4ED
   NatOqHFQOr86OKp9mJQySOWHnhRbUP+PkYcnBdIGG45SDS3QVEAPPoOp9
   CgU/FmIX1zrr2oDGLpO3q3RTKaw1dD+wAZAguzCXzZqYQ9t8ExfRCYUK3
   TXYClLIM2W3aEYFaLSEczVXl3CyZ54hKCWC3PDmhNQOIjeZWiWRNtigOW
   gmGT09nZwP8k0mEei98UOrMwqf0JGXcvWavG78vtZ+HbGYdrtH55ByRF1
   w==;
X-CSE-ConnectionGUID: zf3PpiDPSeSGC2PMnkrkNw==
X-CSE-MsgGUID: vkgLEykLSpOQR1AfsBqhpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57441911"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57441911"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 10:19:54 -0700
X-CSE-ConnectionGUID: ANnK8i8HRHKesrEjR1Si5w==
X-CSE-MsgGUID: qpNnBUSfQRKcU+GA2MA+gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="165998182"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2025 10:19:53 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umbcE-0000Ix-3A;
	Thu, 14 Aug 2025 17:19:50 +0000
Date: Thu, 14 Aug 2025 19:19:29 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for
 '__hyp_trace_find_event_name'
Message-ID: <202508141913.yZUjsGZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [4/4] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141913.yZUjsGZO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141913.yZUjsGZO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141913.yZUjsGZO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for '__hyp_trace_find_event_name' [-Wmissing-prototypes]
    struct hyp_event *__hyp_trace_find_event_name(const char *name,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:247:19: warning: no previous prototype for 'hyp_trace_find_event_name' [-Wmissing-prototypes]
    struct hyp_event *hyp_trace_find_event_name(const char *name)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~


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
