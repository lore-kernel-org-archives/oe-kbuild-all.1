Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F3B3264E3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410780; cv=none; b=hBzNh4xfLz4qIYEgGwNKxkwIc/qkNiqYijqtxOagfUDaAMdASBbkJrSpICCRrDEEtAwgXo7S4vmL0FMyZZGe96n4DsssVxE3QQvSyUr9Maeo/qmHBaEBcKRe7KY9A8mzlnIqpP4N0mhmECQjO6VYD3J7kPbMbtwhUD76jc5cZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410780; c=relaxed/simple;
	bh=rSsXh1omzohuNmHLwbLnZaFaYvYvRD0MlUSLczQS/xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISV3bllrRW8USh6BF4VddOTDDo70dQXUqefgkewt41DC9ydISdC316SFWIXZfPY7cnCYJTIMhPW4p8cfB7qQDv8OtnbLhqpJO6FbBpmZ0b8Si4ez3pm5osHyJde2DcZI3PIAF6MuWdb5G+vfUJPNeZvM7dmdlkFru2ACapedxZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUXnY63J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUXnY63J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773410779; x=1804946779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSsXh1omzohuNmHLwbLnZaFaYvYvRD0MlUSLczQS/xM=;
  b=dUXnY63JaT+a97B5skrSSpZ7Vxfu0O6lPvAJUh1TMCYlgIGW6meqr/uU
   hhNPDqLKZZC9OhNHkTmjleV/7l5M87WkT7H4FuSU5ItVnKUeB5VQFP4VO
   vAxschVvRaGNlfKorIPcf0qSM1koJbHz/iu7Mhx2ZWjUYFbgZsNue3m2V
   rG1T0TvAkMO0bZxpH9XQfCXKW6bURIM6+UJUmS0loV8D1ifsJ7TyMVfTV
   KIHMuZ1jr/Kwrheql19NKaN9N8FqL+ZF7rRFO8oGHZ3U2LTH7LoQBDSJF
   Dru5vPVoByUV6h8Jaz9RZVdR6/bKIunyEN0NbskzGjnB4fOXGuSKWDF5S
   g==;
X-CSE-ConnectionGUID: TKI0biA+TfCNiIdzAhuysA==
X-CSE-MsgGUID: MgffiOUzT5mitn3Y9fGxoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="97129183"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="97129183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 07:06:18 -0700
X-CSE-ConnectionGUID: jG87cMOfTwWDaFkThVcYIA==
X-CSE-MsgGUID: zf38qCqeTVGMC75cr7lWSA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 07:06:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w139W-000000003f7-2fKA;
	Fri, 13 Mar 2026 14:06:10 +0000
Date: Fri, 13 Mar 2026 15:05:25 +0100
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
Message-ID: <202603131550.oPNriwx0-lkp@intel.com>
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
[also build test WARNING on tip/sched/core linus/master v7.0-rc3 next-20260312]
[cannot apply to tip/x86/core aegl/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/fs-resctrl-Add-kernel-mode-kmode-data-structures-and-arch-hook/20260313-132937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/f3ab034a465877d7f37129e13074a0e4f5d5d735.1773347820.git.babu.moger%40amd.com
patch subject: [PATCH v2 09/16] x86,fs/resctrl: Add the functionality to configure PLZA
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260313/202603131550.oPNriwx0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603131550.oPNriwx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603131550.oPNriwx0-lkp@intel.com/

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
