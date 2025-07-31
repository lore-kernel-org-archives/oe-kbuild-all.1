Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C0C29DB77
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753948043; cv=none; b=Su8pKtaQFoJxgL5oVcUexhO4Dxi9ET9lNdaDE8aD+BGJMlfl6KW9xZ3bwFRi/uKpWvTqqywV5uaZ1hOjUaLaeP258Hz/KudTRoqVK46OgLyTUs8XoMXX3eDzSTS/kDQuEds5k6VpNsnE9S+q+Y5ksB+AkooBHrn5pWO+4AjktCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753948043; c=relaxed/simple;
	bh=DVsfStuaLitWPIARUM55AA70XzDyRwpN+FN4HsuFD7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VP2Rade+DdN3nWN7XHwCGPvZ5R49NPlpobTqottSmA/j4C5D752quETWGQYuOWm09VX83mfLxanqlU1UOVSwAKmdm6xEXwI5Ov+WSqO6koJl0r61BWUqxCIDb+ILHWEqT9LML5Uz3mcOaEHVVqqsC1oW7SSG2XXKjWF4bNWPvg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuA3p6eL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuA3p6eL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753948041; x=1785484041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DVsfStuaLitWPIARUM55AA70XzDyRwpN+FN4HsuFD7Q=;
  b=ZuA3p6eLxZ8wW1ZvSW4RD20xIgaMdoNL/Q+nvUQBFcGk7XiQBovG9yDl
   lvxuy3TzyJhKdZ38kTHYeFhYjuGmi+m5Rw5LSt4eLUE9abONyjUZf/H7c
   k9MJM5QFG33jVitqDSGM/Qmof/ppdgBpeGQQPrb6sR7S7t3Ny5h6Go1xi
   55qOch7BiE6sSLf4ktDTzbpX+guPtDAS8Rc42bddp1e333q7eTEsBTqAO
   gQ3wdMrICCwXkFvx7HeXkcT/iq7IzzqaSrrMO8zG8rEcZX2aqMgonltmD
   idBZLI3BzHqEY+vnvzeEntYgyrQTM5nde7DGmuzo8Y65xlLMgOgviPjf9
   Q==;
X-CSE-ConnectionGUID: 22ulVFJQRY68b8lKkWjZ0w==
X-CSE-MsgGUID: MDux/H5BTgiqzXNMQ4d3UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56409995"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56409995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 00:47:17 -0700
X-CSE-ConnectionGUID: bMiFIubCQcmLFgFOhsKajw==
X-CSE-MsgGUID: OoJSjyT2T8CiCm0Jvk19AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="167367861"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2025 00:47:16 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhO0P-0003WY-1n;
	Thu, 31 Jul 2025 07:47:13 +0000
Date: Thu, 31 Jul 2025 15:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
	ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v3 3/3] drm/i915/edp: eDP Data Overrride
Message-ID: <202507311557.c6BFj3kd-lkp@intel.com>
References: <20250731051646.3009255-4-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731051646.3009255-4-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on linus/master v6.16 next-20250731]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-vbt-Add-eDP-Data-rate-overrride-field-in-VBT/20250731-131756
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250731051646.3009255-4-suraj.kandpal%40intel.com
patch subject: [PATCH v3 3/3] drm/i915/edp: eDP Data Overrride
config: arm64-randconfig-001-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311557.c6BFj3kd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311557.c6BFj3kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311557.c6BFj3kd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_dp.c: In function 'intel_edp_set_data_override_rates':
>> drivers/gpu/drm/i915/display/intel_dp.c:4280:43: error: dereferencing pointer to incomplete type 'const struct intel_bios_encoder_data'
     if (!encoder->devdata || encoder->devdata->display->vbt.version < 263)
                                              ^~
   In file included from include/asm-generic/bitops/hweight.h:6,
                    from arch/arm64/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/display/intel_dp.c:29:
>> drivers/gpu/drm/i915/display/intel_dp.c:4287:16: error: 'devdata' undeclared (first use in this function); did you mean '_edata'?
     if (hweight32(devdata->child.edp_data_rate_override) >= 11)
                   ^~~~~~~
   include/asm-generic/bitops/const_hweight.h:28:44: note: in definition of macro 'hweight32'
    #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
                                               ^
   drivers/gpu/drm/i915/display/intel_dp.c:4287:16: note: each undeclared identifier is reported only once for each function it appears in
     if (hweight32(devdata->child.edp_data_rate_override) >= 11)
                   ^~~~~~~
   include/asm-generic/bitops/const_hweight.h:28:44: note: in definition of macro 'hweight32'
    #define hweight32(w) (__builtin_constant_p(w) ? __const_hweight32(w) : __arch_hweight32(w))
                                               ^


vim +4280 drivers/gpu/drm/i915/display/intel_dp.c

  4272	
  4273	static void
  4274	intel_edp_set_data_override_rates(struct intel_dp *intel_dp)
  4275	{
  4276		struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
  4277		int *sink_rates = intel_dp->sink_rates;
  4278		int i, j = 0;
  4279	
> 4280		if (!encoder->devdata || encoder->devdata->display->vbt.version < 263)
  4281			return;
  4282	
  4283		/*
  4284		 * This means the VBT ends up asking us to override every possible rate
  4285		 * indicating the VBT is broken so skip this
  4286		 */
> 4287		if (hweight32(devdata->child.edp_data_rate_override) >= 11)
  4288			return;
  4289	
  4290		for (i = 0; i < intel_dp->num_sink_rates; i++) {
  4291			if (intel_bios_encoder_supports_edp_rate(encoder->devdata,
  4292								 intel_dp->sink_rates[i]))
  4293				continue;
  4294	
  4295			sink_rates[j++] = intel_dp->sink_rates[i];
  4296		}
  4297		intel_dp->num_sink_rates = j;
  4298	}
  4299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
