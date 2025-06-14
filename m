Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE02D1925
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749909242; cv=none; b=J0QifcDCubWjw6/00vjxDJHYE6nLQlmqsxeWjJ59vtUMuRJ3ZMzyMI2GXUgWE1yFLD2aob0ixYxNJiv9G+TeI1T/O0X/aJLY3gu4W+nhwhgfbFIwp+3irFx0o3+zW0L2TCv7NnkcGkqs5ykGo7g9PajIJHUDUiSOdOJz0SS1f/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749909242; c=relaxed/simple;
	bh=ZnRdgltemHlAKja8j5RiYAwmic0u+k/SjK6QYxNVXWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYEN7LNj7iC1CwLuqUze+vsBqI1sBBxv4/8Hqq9RNrsn+EA4J0c91WhAG8XqE5FMkkI4GThCGoAuBNBDljUDnyz7NOZZ7bIEREGD0yBZ6vMeC4nVbutdLFaZfa8ZCHi5PpR0LEfFNTg+IiT67jGZhpKj2ji81hoJXDkvKTzYo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXWnkEzK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXWnkEzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749909241; x=1781445241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZnRdgltemHlAKja8j5RiYAwmic0u+k/SjK6QYxNVXWw=;
  b=fXWnkEzKKMDhK2AjkI7RixqvFF5lp7jmYbLBI9wsAlvbkrlQMCnQYWnd
   1IwWG/NLy21mVlzc1uP9EudVMpu9gfZWK1N0I32Sn2MARv3qXvq8i4VxE
   uA7GOzZdsdQSPSIUkdl+EB+a1f2MDNX6KLOtYBaV/12aJgGvQWqNGllsG
   yNMKOYAe1LP97HM8ms3HGTZ9R/ClUg+LGRnGLb459zpxVxaI6gbYn+ZEp
   wmqSKKrNSkF1+Y1c1MKY8y1Ii5dVp4lFa5o4FKPTssUp9OYjRUTW5tngA
   s53Ub2Oe7h9zwnkmgxzt1cDglAjP6L1ZUEIUfJQRWYwhQfIRxCAPiQoUa
   w==;
X-CSE-ConnectionGUID: rY6oJu92R/yuZJYTOu2MhQ==
X-CSE-MsgGUID: 9D2SCLCcRJGQQ+j4Jf5q5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="63521712"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="63521712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 06:54:00 -0700
X-CSE-ConnectionGUID: 697mMPSpTdCE2B6dGNnlPA==
X-CSE-MsgGUID: wP22LGRdTTSSaroFP6W5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148968667"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2025 06:53:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQRKR-000DXq-03;
	Sat, 14 Jun 2025 13:53:51 +0000
Date: Sat, 14 Jun 2025 21:53:28 +0800
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
Subject: Re: [PATCH v14 19/32] fs/resctrl: Add the functionality to unassign
 MBM events
Message-ID: <202506142152.umez5Ekn-lkp@intel.com>
References: <83d54b00cc873d7d4dec433b7f528da10963d025.1749848715.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83d54b00cc873d7d4dec433b7f528da10963d025.1749848715.git.babu.moger@amd.com>

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
patch link:    https://lore.kernel.org/r/83d54b00cc873d7d4dec433b7f528da10963d025.1749848715.git.babu.moger%40amd.com
patch subject: [PATCH v14 19/32] fs/resctrl: Add the functionality to unassign MBM events
config: x86_64-buildonly-randconfig-003-20250614 (https://download.01.org/0day-ci/archive/20250614/202506142152.umez5Ekn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142152.umez5Ekn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506142152.umez5Ekn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/resctrl/monitor.c:963 function parameter 'r' not described in 'resctrl_config_cntr'
   Warning: fs/resctrl/monitor.c:963 function parameter 'd' not described in 'resctrl_config_cntr'
   Warning: fs/resctrl/monitor.c:963 function parameter 'evtid' not described in 'resctrl_config_cntr'
   Warning: fs/resctrl/monitor.c:963 function parameter 'rmid' not described in 'resctrl_config_cntr'
   Warning: fs/resctrl/monitor.c:963 function parameter 'closid' not described in 'resctrl_config_cntr'
   Warning: fs/resctrl/monitor.c:963 function parameter 'cntr_id' not described in 'resctrl_config_cntr'
   Warning: fs/resctrl/monitor.c:963 function parameter 'assign' not described in 'resctrl_config_cntr'
   Warning: fs/resctrl/monitor.c:981 function parameter 'r' not described in 'mbm_cntr_get'
   Warning: fs/resctrl/monitor.c:981 function parameter 'd' not described in 'mbm_cntr_get'
   Warning: fs/resctrl/monitor.c:981 function parameter 'rdtgrp' not described in 'mbm_cntr_get'
   Warning: fs/resctrl/monitor.c:981 function parameter 'evtid' not described in 'mbm_cntr_get'
   Warning: fs/resctrl/monitor.c:1004 function parameter 'r' not described in 'mbm_cntr_alloc'
   Warning: fs/resctrl/monitor.c:1004 function parameter 'd' not described in 'mbm_cntr_alloc'
   Warning: fs/resctrl/monitor.c:1004 function parameter 'rdtgrp' not described in 'mbm_cntr_alloc'
   Warning: fs/resctrl/monitor.c:1004 function parameter 'evtid' not described in 'mbm_cntr_alloc'
>> Warning: fs/resctrl/monitor.c:1022 function parameter 'd' not described in 'mbm_cntr_free'
>> Warning: fs/resctrl/monitor.c:1022 function parameter 'cntr_id' not described in 'mbm_cntr_free'
   Warning: fs/resctrl/monitor.c:1035 function parameter 'r' not described in 'resctrl_alloc_config_cntr'
   Warning: fs/resctrl/monitor.c:1035 function parameter 'd' not described in 'resctrl_alloc_config_cntr'
   Warning: fs/resctrl/monitor.c:1035 function parameter 'rdtgrp' not described in 'resctrl_alloc_config_cntr'
   Warning: fs/resctrl/monitor.c:1035 function parameter 'mevt' not described in 'resctrl_alloc_config_cntr'
   Warning: fs/resctrl/monitor.c:1079 function parameter 'r' not described in 'resctrl_assign_cntr_event'
   Warning: fs/resctrl/monitor.c:1079 function parameter 'd' not described in 'resctrl_assign_cntr_event'
   Warning: fs/resctrl/monitor.c:1079 function parameter 'rdtgrp' not described in 'resctrl_assign_cntr_event'
   Warning: fs/resctrl/monitor.c:1079 function parameter 'mevt' not described in 'resctrl_assign_cntr_event'
>> Warning: fs/resctrl/monitor.c:1101 function parameter 'r' not described in 'resctrl_free_config_cntr'
>> Warning: fs/resctrl/monitor.c:1101 function parameter 'd' not described in 'resctrl_free_config_cntr'
>> Warning: fs/resctrl/monitor.c:1101 function parameter 'rdtgrp' not described in 'resctrl_free_config_cntr'
>> Warning: fs/resctrl/monitor.c:1101 function parameter 'mevt' not described in 'resctrl_free_config_cntr'
>> Warning: fs/resctrl/monitor.c:1125 function parameter 'r' not described in 'resctrl_unassign_cntr_event'
>> Warning: fs/resctrl/monitor.c:1125 function parameter 'd' not described in 'resctrl_unassign_cntr_event'
>> Warning: fs/resctrl/monitor.c:1125 function parameter 'rdtgrp' not described in 'resctrl_unassign_cntr_event'
>> Warning: fs/resctrl/monitor.c:1125 function parameter 'mevt' not described in 'resctrl_unassign_cntr_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
