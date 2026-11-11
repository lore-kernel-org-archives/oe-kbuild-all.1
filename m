Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394719;
	b=gW7qFymlavBDm5PC9RuDxLoexqNcwz6Byhh3H/fXhckC4ZzmxxLOcbJS3mRmjSERSAVw
	 wq0HGLT8bqXH3YGbG6ERTRAqsVJHnPnd+mNzMI+u4oE9mqRtmUQSfiWYk0re9EtTblhiZ
	 v6/CTbe9UBuXtGNzuXBWriM6FTqxcv4fxfovRP8mQeAXg+r/DivnJLKcHSqib/L/Rn0T/
	 qYuOMOMu4EubMPxnccQ/8LEgL8qMOZA96D4W2PHe21GPoignOBSpY/MfOMvxxhdvX8NKy
	 nvt0p0r9uT88Du2iCu+AFeVrfd8MUSeRHHUT3hWljvbi3CEqzZEBtoBTDs4S1NU25lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394719;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kSmKORHIznP2iEfvaiO4HINHU9HMAOlzpvFwaH8xUzk=;
	b=NFrcmdY+OdYcbagxqJi+pMtws4sr8pX89dYMhLUqgY4ePMXph9Jk3t342R/PFjVZsgm6
	 ZSL/pWXUw0wUI77uS5onTZ+NavSyAoInDa+ugOmemDgaBoCGHT9oAa+l9tw6JgfWmpBWZ
	 EndzOPtei6vWOEDhMTJL1UkFPZkTu0qSGxzg3o+5YIAorsZoXcDtDV2JxsIW7AxZO7f90
	 jnRsrBifctpMCBHLQZb/3OPJS/DsykTv7c6W58gcDGaVSMoYCzv3OYTddS8aDCq36IsH7
	 6JxsFXbOo1kL/UhvfC/ToVwacugz9LiCvI8TM6b0AWjMcamn4+ExNeIeMdnGIjejmpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DL21XwfJ;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86094606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 10:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86094606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DL21XwfJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794394719; x=1825930719;
  h=date:from:to:cc:subject:message-id;
  bh=751en+njc4XTTqqDYBpcKPs0cAembFxHBQbr0DS4SWg=;
  b=DL21XwfJJdu6bAL+xUlJgegRgsH75Jj8EGSoOeGtjXaGROgIMQzjsMUW
   T6jsLdNMnZv2hC480xuzAf589e/aB62qAX0bRD16Gz04DyBYjVQgFBIIg
   mgNxrwg2o8K7hgbFJQTUt+zNDp7NNMicPzYo4E9HNifuKQqOY57Oe/HZX
   6EgEdqCIvQl7zylKFH8GZWxIqRETNM3DSPxJEqn5vqRvha+qnU3zJps5K
   GLbzeoM5eBsCLj5mSWW/A8oR4jRDpXmAjURjNmaxVZAZVzUlgD/zxk7CP
   VmUZcoA4uE7LM9IRAKdgsp4zorBcy9s88G2lHB09kProoc1mcp5Q07bHz
   A==;
X-CSE-ConnectionGUID: Eqb1E8ZTRe68FMWB2JgmAQ==
X-CSE-MsgGUID: bqTqunCbQO2URUUJ0BjWGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3193755"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3193755"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 02:58:38 -0800
X-CSE-ConnectionGUID: mjW7Y8VzQyad1qnTGqIPWg==
X-CSE-MsgGUID: VI0x2WrgRZqVcPRPKgPIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8369715"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Nov 2026 02:58:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR62E-000000000Yx-1cT5;
	Wed, 11 Nov 2026 10:58:34 +0000
Date: Wed, 11 Nov 2026 11:57:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for
 '__hyp_trace_find_event_name'
Message-ID: <202611111121.fzhlxS0p-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   153de33f91d69c9aa60925e5e2d0949a4318591f
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [1/1] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-randconfig-r2305-20261111 (https://download.01.org/0day-ci/archive/20261111/202611111121.fzhlxS0p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111121.fzhlxS0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111121.fzhlxS0p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for '__hyp_trace_find_event_name' [-Wmissing-prototypes]
     235 | struct hyp_event *__hyp_trace_find_event_name(const char *name,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:247:19: warning: no previous prototype for 'hyp_trace_find_event_name' [-Wmissing-prototypes]
     247 | struct hyp_event *hyp_trace_find_event_name(const char *name)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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
