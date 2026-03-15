Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE41B146D5A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Mar 2026 04:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773550623; cv=none; b=M2/H7UKZPTUZtavUKK2jrQ1u8tmcNJHrt8o3gT5zu5qb6NIcKsjsurZxRGrURpSgoaISYgwHuqTVwU0EmYcgM7qV9uMufLCP8W7L4cCRDbnNKRZwCpu1tGoV1ND0/XjS9whEfFloBqqKFO4fXBkeC+Rl6KH5c+P4AzbZeRblvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773550623; c=relaxed/simple;
	bh=WLDhs9H0gTO0Ct/7ZAElygz0h7179UVff6jJioxO2Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cq/jhON4oZVkfpJEV3S2LfizfsetVS5L1kCnWii+1lw4D9XygVnI0vECIopbLenTgYpGko2KCeZ07ccob/gbNepc6Ysbr+bUFNDdHffKZlT/GX08FKecDKl/P8Cv0Px+0Wj/WUAWsdugkzW5y+Iw5NUAXdcpHdp+6FR/y5uCdF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqYV4lZE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqYV4lZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773550622; x=1805086622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WLDhs9H0gTO0Ct/7ZAElygz0h7179UVff6jJioxO2Nc=;
  b=lqYV4lZEHbYspxW5CPPH2roAPQWI/gMt4+9VolUHHJi27ohBd3fYFS12
   DLgPC4s8CuQNBXTNiw1RLJ+uOV0K+4ctb0PzNCJukIiP34Z/gf8Qyoq8y
   wm8aw8yKSRxp8ldwncBWS7pGRCUiDIe3Euoz/T9ZJDgeZkkaglggHWzvT
   jtImrtzNqHDuM190zfrMA6hqSOW/hgrJn4SGhUbrTXPFik6N2P6xgLcbh
   /o0P5WdZKGLugbFyM3/jJW54dYrBUHADRI31lvNffNG6bvzogjV/f/Kcy
   HRKRplPxtO9IjkwgMkiaWQq3XawH1OkaIib7hzkLyo8uoN5IOa3G2tHpD
   w==;
X-CSE-ConnectionGUID: r9l9ucb2S3K92MNA5sk2lg==
X-CSE-MsgGUID: Y3XvXrrQSnSAO5d9dWWqIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="84920032"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="84920032"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 21:57:01 -0700
X-CSE-ConnectionGUID: hwExrkvbQsKhdCVMMjgmTw==
X-CSE-MsgGUID: mXORLmtBSHGSx7a3W2HhQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="246584627"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2026 21:56:55 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1dX0-000000006BP-0eBl;
	Sun, 15 Mar 2026 04:56:50 +0000
Date: Sun, 15 Mar 2026 12:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
	reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
	babu.moger@amd.com, x86@kernel.org, hpa@zytor.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	akpm@linux-foundation.org, pmladek@suse.com, rdunlap@infradead.org,
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
	paulmck@kernel.org
Subject: Re: [PATCH v2 09/16] x86,fs/resctrl: Add the functionality to
 configure PLZA
Message-ID: <202603151231.7EP13EwZ-lkp@intel.com>
References: <f3ab034a465877d7f37129e13074a0e4f5d5d735.1773347820.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3ab034a465877d7f37129e13074a0e4f5d5d735.1773347820.git.babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on tip/sched/core linus/master v7.0-rc3 next-20260311]
[cannot apply to tip/x86/core aegl/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/fs-resctrl-Add-kernel-mode-kmode-data-structures-and-arch-hook/20260313-132937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/f3ab034a465877d7f37129e13074a0e4f5d5d735.1773347820.git.babu.moger%40amd.com
patch subject: [PATCH v2 09/16] x86,fs/resctrl: Add the functionality to configure PLZA
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260315/202603151231.7EP13EwZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603151231.7EP13EwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603151231.7EP13EwZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/kernel/cpu/resctrl/ctrlmondata.c:154 function parameter 'r' not described in 'resctrl_arch_configure_kmode'
>> Warning: arch/x86/kernel/cpu/resctrl/ctrlmondata.c:154 function parameter 'kcfg' not described in 'resctrl_arch_configure_kmode'
>> Warning: arch/x86/kernel/cpu/resctrl/ctrlmondata.c:154 function parameter 'closid' not described in 'resctrl_arch_configure_kmode'
>> Warning: arch/x86/kernel/cpu/resctrl/ctrlmondata.c:154 function parameter 'rmid' not described in 'resctrl_arch_configure_kmode'
>> Warning: arch/x86/kernel/cpu/resctrl/ctrlmondata.c:154 function parameter 'r' not described in 'resctrl_arch_configure_kmode'
>> Warning: arch/x86/kernel/cpu/resctrl/ctrlmondata.c:154 function parameter 'kcfg' not described in 'resctrl_arch_configure_kmode'
>> Warning: arch/x86/kernel/cpu/resctrl/ctrlmondata.c:154 function parameter 'closid' not described in 'resctrl_arch_configure_kmode'
>> Warning: arch/x86/kernel/cpu/resctrl/ctrlmondata.c:154 function parameter 'rmid' not described in 'resctrl_arch_configure_kmode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
