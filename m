Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F73FE7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749929854; cv=none; b=qfJZmkdQpMtvuHGxugaoPIWFQYDjB6PM6HyqcyUBpTGkgMAxPYqIUXPRuPJOQbDtuqcoiEa9VELHAqlJPdANcm8SQM7PBOuH2Fhe0uc4+S4qi0lEKg7BRaoVJO6CquqObhYhie8BQlvHuHPeT9SYMu+T0Ls6ln0uMC9KyA+yg4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749929854; c=relaxed/simple;
	bh=kM5Y6FXIsq00ny2HfijHKHMZlL4eehDWp0cjgPFqwzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWaidrU1emP1slANXToutI+bd8IL4iWuYRviAEK+ZzSRTnLOYoJxA1Czb9ij0SOQWMPJSQLzbTf0Q5y7MnP9Fao4IPG/0OhpRZpy5RzoArvG6+1kEFX5D3VHZZii21ROLy/MkMkAmd4GMt3E0aUG2Napx8gUgQfJUb+xkU/mdo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EF0KKgRj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EF0KKgRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749929853; x=1781465853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kM5Y6FXIsq00ny2HfijHKHMZlL4eehDWp0cjgPFqwzQ=;
  b=EF0KKgRjsQvmDqugdQq8H1c5LqiosNjoqgIitNSr3rPPFEd8vgi8iSyM
   YQ95BGBbYhfm5DytnOkeALwU40H+buimyopZgi+CA8QQ0SbFfb7XGW6Kb
   mblHgaMj99lsfi7caKKH6HcuX4yZLFvkHkScRXd2ysOBGsHXC4x2dxOox
   D38Vgtct57vfsb5/S5UYrLXZcUUTeJFcTy94dRiYymc+IkqHmAKTpswkB
   n5kTiutxpb3thk+7gNGT5DjFG53h9vkgSn9j28Qd7VL0WKHpJHNNNJF7N
   n86jTM8o7kWs+qZmNiTMIBNjByaLRIR7heqZ2CEPj4rlNLu83EZNnwuqS
   Q==;
X-CSE-ConnectionGUID: IWCz2RjbTs2NIMMbIcwMqA==
X-CSE-MsgGUID: wZEG9gEqStqfgxRBsN61fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="74651347"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="74651347"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 12:37:32 -0700
X-CSE-ConnectionGUID: RNVitr5CSJCgQx6DdRBfwg==
X-CSE-MsgGUID: 3Yw62vXYRV+rMCc1mRqImg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="153073410"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2025 12:37:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQWgr-000DoE-2g;
	Sat, 14 Jun 2025 19:37:21 +0000
Date: Sun, 15 Jun 2025 03:37:15 +0800
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
Subject: Re: [PATCH v14 23/32] fs/resctrl: Add definitions for MBM event
 configuration
Message-ID: <202506150322.cKDFII8O-lkp@intel.com>
References: <dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger@amd.com>

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
patch link:    https://lore.kernel.org/r/dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger%40amd.com
patch subject: [PATCH v14 23/32] fs/resctrl: Add definitions for MBM event configuration
config: x86_64-randconfig-123-20250614 (https://download.01.org/0day-ci/archive/20250615/202506150322.cKDFII8O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150322.cKDFII8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150322.cKDFII8O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/resctrl/rdtgroup.c:82:25: sparse: sparse: symbol 'mbm_config_values' was not declared. Should it be static?

vim +/mbm_config_values +82 fs/resctrl/rdtgroup.c

    80	
    81	/* Decoded values for each type of memory transactions */
  > 82	struct mbm_config_value mbm_config_values[NUM_MBM_EVT_VALUES] = {
    83		{"local_reads", READS_TO_LOCAL_MEM},
    84		{"remote_reads", READS_TO_REMOTE_MEM},
    85		{"local_non_temporal_writes", NON_TEMP_WRITE_TO_LOCAL_MEM},
    86		{"remote_non_temporal_writes", NON_TEMP_WRITE_TO_REMOTE_MEM},
    87		{"local_reads_slow_memory", READS_TO_LOCAL_S_MEM},
    88		{"remote_reads_slow_memory", READS_TO_REMOTE_S_MEM},
    89		{"dirty_victim_writes_all", DIRTY_VICTIMS_TO_ALL_MEM},
    90	};
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
