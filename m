Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7084A848C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732086807; cv=none; b=luzwmjl/NsXJHGROiHitic6IqjVorAD12D8Se6GztEoyMzBN3n3e8aabkkyuXaV9gf8Yb3zm6QQI4bAdPAmd6IWrlvseO3/2QVfpX4sjo32NKuz6c4OmsQCGJUwuQkS/n9I8QOr7AjjNvX8DUQEcAa5nkTrn4gQ4GMxeGkJm+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732086807; c=relaxed/simple;
	bh=QflWwKkhX6Rza3/NJ7xJREyTiPsp7g6TzQpnm2A1BI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUEOlMLcdn1uZsH/lB3kSweScRpKNSkFcAdvogdcWUXlha/LJSCoA4gm6D07WWxseY1Qy6VmWexpM378LT5V0jjMgA+nwBcuFGge1HeZ/j9xS3z/2xTtOfumnD4CYE/a1nx4PevsghdEpJnmxnj2cENkiWMDqUpdR9jKthh28G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KG+buCHv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KG+buCHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732086806; x=1763622806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QflWwKkhX6Rza3/NJ7xJREyTiPsp7g6TzQpnm2A1BI0=;
  b=KG+buCHv38aFuob4U6dg5QxBLxC1AIvIGJQ2KeroCiiBJWs50iKlrHh7
   tHXTD3MuSbz8Hwb5RK9YGjzOOHCxarHX7mzr27KAaimT2hYfgi87RI4/P
   ZeK8jNHY9zB1JKAvuZy7vhYYUbFzs/n03r5X2Z5Ijua8Z2T5auCz1xvMZ
   ntKWAJTK+SS28QPLxVZLwZycgcsLKvOfonDd9ZouVjC0EbuVSiq5jTixU
   bcnDFLwr3bcwQH5jKYwNWC0MBbmSRRxPGCkCCyiJaealpXGuq5fvrcCuo
   BRUOUx4MRAUKVUl9yd9TleyFOnPRQsLlrMGsFxJRWfn2lhu1R+uvrR99B
   g==;
X-CSE-ConnectionGUID: FyNiWtKYSTm9yKp3goMy3A==
X-CSE-MsgGUID: gd076cpmQlGNQ+bQsR6s5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54630070"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="54630070"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 23:13:25 -0800
X-CSE-ConnectionGUID: cAW3VseFTMKiQ7pSVjRp8Q==
X-CSE-MsgGUID: O9lEqYr6SpeTecZiIHH2pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="93884831"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2024 23:13:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDetd-0000c5-0J;
	Wed, 20 Nov 2024 07:13:05 +0000
Date: Wed, 20 Nov 2024 15:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 203/328]
 arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for
 '__hyp_trace_find_event_name'
Message-ID: <202411201546.yhAgsY6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b8333d22a345c1f1d4e60484576bfc50227f4db6
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [203/328] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-randconfig-004-20241120 (https://download.01.org/0day-ci/archive/20241120/202411201546.yhAgsY6u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201546.yhAgsY6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201546.yhAgsY6u-lkp@intel.com/

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
