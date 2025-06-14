Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1FE14A4C7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749901666; cv=none; b=r0ekhpo+XDdkFG0Ov71pX10vEOqbwU8qOOQ5oABIPuz7tjCbO5Vcor/MWFTHTFcBabuIz/fJrXhiDl2W4VTEQp0jaHS2eOC5GhGRqvwvmpCdIHxwvWgsb/YONA4SFphcG+5rlwhilB1BNoC2TaDPsen0lMGVWJj3zVF1CVnv904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749901666; c=relaxed/simple;
	bh=fbPPGkDiZpEuIwXWh5ekqMfmQTvM/LLY+Mpvxcj5+BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGxUc0c7nNV+kZk6KtZQUEitM9SiqgIJhbGDNhAEda3dML8FedoykFxFw/ynOmCfXxBEyrSFjazEVtJ0CMv+8x0FsQnM+0p2RTdFUV9hIoIJId1M3AWhoCdlpzmWwkZpfaA6a+/xA4LEWDBxmaz8tfJBhjgATw0mtZUVvyTijtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbVsFqjA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbVsFqjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749901665; x=1781437665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fbPPGkDiZpEuIwXWh5ekqMfmQTvM/LLY+Mpvxcj5+BI=;
  b=JbVsFqjAdXE7Y+pPzwdXQxHooFnAdkrKQwsQbLCMjxm1T4oHghGHyUrW
   zAw4cGf4t4qWO3PgtLOAVOVhUlDH8c4e3wOP5FWIjHOlu1OytbghnTHJQ
   sQIf1kDjlK+CVpsnKSTFi06bGH/x/p0HDIGGyeDlgQk63a46aJCfuHCzo
   cEd8HmrEzCWpPLC1n9kwXUx6txORww+hMNAgdI2wYPjUjNXZjdxoPZX7P
   MfeRd+q8C1/kqc+FnQ69VWYZI2W77LvHKHMNPBj7M43g5lU2Z1OG91f/N
   dw24K4cEUAa4iHruPYE/ypNKL100BGQriqVJ6ekmJRTSgmnZNbcnnPPPA
   Q==;
X-CSE-ConnectionGUID: aiNLssDlRSiDqkDY3sjd3g==
X-CSE-MsgGUID: TxRd9d1KRm+aSzyz2NjIMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55908643"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="55908643"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 04:47:44 -0700
X-CSE-ConnectionGUID: tY1VzwJzT/uuwta0IcP79Q==
X-CSE-MsgGUID: ZHunXiBbQSaXzAMXTlmX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148035261"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2025 04:47:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQPME-000DUE-27;
	Sat, 14 Jun 2025 11:47:34 +0000
Date: Sat, 14 Jun 2025 19:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
	reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, rostedt@goodmis.org, paulmck@kernel.org,
	thuth@redhat.com, ardb@kernel.org, gregkh@linuxfoundation.org,
	seanjc@google.com, thomas.lendacky@amd.com,
	pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
	perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
	xiaoyao.li@intel.com, kan.liang@linux.intel.com,
	mario.limonciello@amd.com, xin3.li@intel.com,
	gautham.shenoy@amd.com
Subject: Re: [PATCH v14 18/32] fs/resctrl: Add the functionality to assign
 MBM events
Message-ID: <202506141914.e8wkbP3Z-lkp@intel.com>
References: <eea2cfb5b6231b322ab2194abfcd1ce335e2bdf5.1749848715.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eea2cfb5b6231b322ab2194abfcd1ce335e2bdf5.1749848715.git.babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.16-rc1 next-20250613]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-fs-resctrl-Remove-unappropriate-references-to-cacheinfo-in-the-resctrl-subsystem/20250614-051344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/eea2cfb5b6231b322ab2194abfcd1ce335e2bdf5.1749848715.git.babu.moger%40amd.com
patch subject: [PATCH v14 18/32] fs/resctrl: Add the functionality to assign MBM events
config: x86_64-buildonly-randconfig-003-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141914.e8wkbP3Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141914.e8wkbP3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141914.e8wkbP3Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/resctrl/monitor.c:963 function parameter 'r' not described in 'resctrl_config_cntr'
>> Warning: fs/resctrl/monitor.c:963 function parameter 'd' not described in 'resctrl_config_cntr'
>> Warning: fs/resctrl/monitor.c:963 function parameter 'evtid' not described in 'resctrl_config_cntr'
>> Warning: fs/resctrl/monitor.c:963 function parameter 'rmid' not described in 'resctrl_config_cntr'
>> Warning: fs/resctrl/monitor.c:963 function parameter 'closid' not described in 'resctrl_config_cntr'
>> Warning: fs/resctrl/monitor.c:963 function parameter 'cntr_id' not described in 'resctrl_config_cntr'
>> Warning: fs/resctrl/monitor.c:963 function parameter 'assign' not described in 'resctrl_config_cntr'
>> Warning: fs/resctrl/monitor.c:981 function parameter 'r' not described in 'mbm_cntr_get'
>> Warning: fs/resctrl/monitor.c:981 function parameter 'd' not described in 'mbm_cntr_get'
>> Warning: fs/resctrl/monitor.c:981 function parameter 'rdtgrp' not described in 'mbm_cntr_get'
>> Warning: fs/resctrl/monitor.c:981 function parameter 'evtid' not described in 'mbm_cntr_get'
>> Warning: fs/resctrl/monitor.c:1004 function parameter 'r' not described in 'mbm_cntr_alloc'
>> Warning: fs/resctrl/monitor.c:1004 function parameter 'd' not described in 'mbm_cntr_alloc'
>> Warning: fs/resctrl/monitor.c:1004 function parameter 'rdtgrp' not described in 'mbm_cntr_alloc'
>> Warning: fs/resctrl/monitor.c:1004 function parameter 'evtid' not described in 'mbm_cntr_alloc'
>> Warning: fs/resctrl/monitor.c:1027 function parameter 'r' not described in 'resctrl_alloc_config_cntr'
>> Warning: fs/resctrl/monitor.c:1027 function parameter 'd' not described in 'resctrl_alloc_config_cntr'
>> Warning: fs/resctrl/monitor.c:1027 function parameter 'rdtgrp' not described in 'resctrl_alloc_config_cntr'
>> Warning: fs/resctrl/monitor.c:1027 function parameter 'mevt' not described in 'resctrl_alloc_config_cntr'
>> Warning: fs/resctrl/monitor.c:1071 function parameter 'r' not described in 'resctrl_assign_cntr_event'
   Warning: fs/resctrl/monitor.c:1071 function parameter 'd' not described in 'resctrl_assign_cntr_event'
   Warning: fs/resctrl/monitor.c:1071 function parameter 'rdtgrp' not described in 'resctrl_assign_cntr_event'
   Warning: fs/resctrl/monitor.c:1071 function parameter 'mevt' not described in 'resctrl_assign_cntr_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
