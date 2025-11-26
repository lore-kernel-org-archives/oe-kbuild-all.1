Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB633EAE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764175992; cv=none; b=pqKasw9IL/wdWAWQ17DK/GsSI8msSBE3P4ZSbID1sDvP+qP0xoIeH6Q/hDemRImQK764KTEG8FAWnre4JuKjsvCVqz68w6Ts2zfQXyJwKrKT1Qwry8FxTVW8jQ0IqY3n4cWiLKBIhmBIBK3e5nRg73AIipSOzawm6Ufr6QHvQHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764175992; c=relaxed/simple;
	bh=vFWDx4cnBeY0Uc+KH6ZPIqx47sAlSxDOJsb15IQK6ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbNub5lLfoQMqhEo33wc8qckkvNvwUstJ9XCFsm2S45szY6IWWu770SwwSpRc56jOQ/fDFHGRflmun7tupQpCmFDrOTRLj28mDj23BD5/5dSSwe2pT1jq7o5iNZ5ZXh8Jh8odWq25StUk2LrWgh34yIklGyksztXd/0DmbIdHvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOu4gJ2f; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOu4gJ2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764175992; x=1795711992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vFWDx4cnBeY0Uc+KH6ZPIqx47sAlSxDOJsb15IQK6ds=;
  b=KOu4gJ2fuAl4DHN8JjUuhL2vYcuT4c4C1jB6TRU+V3uxQ/RNe8rcTEa6
   YZlHh7NsE+NjDBgvdP4CF+oFtcrrN+ImvvpFrJ4d6fuzK9wElWSfLPqIj
   UMrQT9NRaeKyElxp3GMK21Z1w5XMp01tk9Sjzf3yhw6w3z9MyFhIaQnGk
   wksvzTidZ2cTQQqRNnCMCtnGK9orTI6khq4AVHwrfVhDOMgdaEyFA6QAj
   0B/4hc2d8LTUIWk/a8Sls4oIvZ1jsKlIiRnTbEXqy83pwJS1/UsvyrmPM
   AhRsT5I4qfDTW8rBOKeiW2QCnD6r1xX3BMCPvpszomD9bgaoiCZfrJv//
   w==;
X-CSE-ConnectionGUID: YQ4TivCQRsG9FyMUQYXByQ==
X-CSE-MsgGUID: Z/EEodD8R36zXI+yLsomdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69841145"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="69841145"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:53:11 -0800
X-CSE-ConnectionGUID: zbCV1WflTN+D7kiQqTmNKQ==
X-CSE-MsgGUID: bhxj2BGjSSGGqDbnStJaTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197476490"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2025 08:53:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOIlO-0000000038f-3J8z;
	Wed, 26 Nov 2025 16:53:06 +0000
Date: Thu, 27 Nov 2025 00:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] drivers/android/binder.c:7481:
 undefined reference to `event_mutex'
Message-ID: <202511270055.wPwH4Kzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e436c77f5ed5017e5bd134f69e51a2e0a6550d4b
commit: 43c26111cafa87d81570c63d96c497e13ec883da [1/1] ANDROID: binder: unload C Binder trace events
config: arm64-randconfig-r112-20251126 (https://download.01.org/0day-ci/archive/20251127/202511270055.wPwH4Kzq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270055.wPwH4Kzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270055.wPwH4Kzq-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/android/binder.o: in function `binder_remove_trace_events':
>> drivers/android/binder.c:7481: undefined reference to `event_mutex'
   aarch64-linux-ld: drivers/android/binder.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `event_mutex' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> drivers/android/binder.c:7481:(.text+0x4ecc): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/android/binder.c:7481: undefined reference to `event_mutex'
>> aarch64-linux-ld: drivers/android/binder.c:7482: undefined reference to `trace_types_lock'
   aarch64-linux-ld: drivers/android/binder.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `trace_types_lock' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/android/binder.c:7482:(.text+0x4ed4): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/android/binder.c:7482: undefined reference to `trace_types_lock'
>> aarch64-linux-ld: drivers/android/binder.c:7484: undefined reference to `ftrace_events'
   aarch64-linux-ld: drivers/android/binder.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `ftrace_events' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/android/binder.c:7484:(.text+0x4ee0): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/android/binder.c:7484: undefined reference to `ftrace_events'
>> aarch64-linux-ld: drivers/android/binder.c:7483: undefined reference to `trace_event_sem'
   aarch64-linux-ld: drivers/android/binder.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `trace_event_sem' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/android/binder.c:7483:(.text+0x4efc): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/android/binder.c:7483: undefined reference to `trace_event_sem'
>> aarch64-linux-ld: drivers/android/binder.c:7484: undefined reference to `ftrace_events'
>> aarch64-linux-ld: drivers/android/binder.c:7490: undefined reference to `remove_event_from_tracers'


vim +7481 drivers/android/binder.c

  7475	
  7476	void binder_remove_trace_events(struct module *module)
  7477	{
  7478		struct trace_event_call *call, *tmp;
  7479		const char *name;
  7480	
> 7481		mutex_lock(&event_mutex);
> 7482		mutex_lock(&trace_types_lock);
> 7483		down_write(&trace_event_sem);
> 7484		list_for_each_entry_safe(call, tmp, &ftrace_events, list) {
  7485			name = trace_event_name(call);
  7486			if (!name || strncmp(name, "binder_", 7))
  7487				continue;
  7488			if (call->module != module)
  7489				continue;
> 7490			remove_event_from_tracers(call);
  7491			list_del_init(&call->list);
  7492		}
  7493		up_write(&trace_event_sem);
  7494		mutex_unlock(&trace_types_lock);
  7495		mutex_unlock(&event_mutex);
  7496	}
  7497	EXPORT_SYMBOL_GPL(binder_remove_trace_events);
  7498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
