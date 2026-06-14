Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ACC37E31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 23:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781481060; cv=none; b=Sz56uJ3RKmRbaxRBY/XItIwk8xRXE3dvrV3BnS36qIlpuRhBdb+QAlAwiTKVOHvS4zPFB84Glnb38T3NlRlf2ozUYHqky9Y99P4LXB9wOnKTcm1V/u7zM3LIfP4QN831ukVqs/JNIgENJLbw4eAERrO6Xl+mpcoVeNc4+HsukZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781481060; c=relaxed/simple;
	bh=OPiiRXL3NHK65DOA/6BYm9Mx5IhcKUKsaze5uQO4bJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QB2OWdXw0KQSWbwacPyAv7jInvjtSdzAvTEUGYNmq6B3Cg+IbJ35rOhtfd5BNEJ3BmDtIHmNsx7eyIYShniV6uWum+GSf0xI3u9+EpwziMU5yXvmqdgt9cnix9dCgfSIhjK2JwHrJhVDmTPqqukdxqGvProKNaq1wzg/AfEJj0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moz8dj6n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moz8dj6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781481059; x=1813017059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OPiiRXL3NHK65DOA/6BYm9Mx5IhcKUKsaze5uQO4bJ0=;
  b=moz8dj6ng873wuL0SJ4AOXDcQL9v1uM6aKgi/xisAGLCWNZ2KvzjEtUe
   HlAi8YyXgY9Im6PhF8fwj07p40pofa+10aalM1WY98G6blLRbs9spOiWZ
   wXIeQ3Kj7EOXR6AJbxpFC7DKKZG99ywLtPqwf8qUsa2onDfUuDO8QUmrg
   Xzdid1Y+8+ufcEIZxf4ARFl0R9pYlejRZIwZRjJgcy71+cOKXvJZt5pDD
   IP/BjZNHstNDbGb8I+FPI7RpwGS9fU7u/ADbl7r25MJoa/oM0Az042+RG
   eRxz8WN/sjCASsggo3i7kiWPxm4/f7oPv4rl+PVn4OY2PLNY3lUObWuQd
   A==;
X-CSE-ConnectionGUID: RuP0x7yfTdOz6sejECoOzw==
X-CSE-MsgGUID: i3vjf8hDRz+EoEe6htZZvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82283849"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82283849"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 16:50:57 -0700
X-CSE-ConnectionGUID: fEpnfEg0T3uy2e02nirYGw==
X-CSE-MsgGUID: ms18cdfvQ3G3zIyAU73v7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="271395499"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jun 2026 16:50:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYubM-00000000RHu-3IHC;
	Sun, 14 Jun 2026 23:50:52 +0000
Date: Mon, 15 Jun 2026 07:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>, tglx <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, x86 <x86@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/acpi: remove unused ACPI_FLUSH_CPU_CACHE macro
Message-ID: <202606150752.I0Au8al5-lkp@intel.com>
References: <19ec69410f9.1df26e0036083.1465238188751484552@zohomail.in>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19ec69410f9.1df26e0036083.1465238188751484552@zohomail.in>

Hi Ashwin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/auto-latest tip/x86/core linus/master v7.1 next-20260612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashwin-Gundarapu/x86-acpi-remove-unused-ACPI_FLUSH_CPU_CACHE-macro/20260614-224607
base:   tip/master
patch link:    https://lore.kernel.org/r/19ec69410f9.1df26e0036083.1465238188751484552%40zohomail.in
patch subject: [PATCH] x86/acpi: remove unused ACPI_FLUSH_CPU_CACHE macro
config: x86_64-randconfig-011-20260615 (https://download.01.org/0day-ci/archive/20260615/202606150752.I0Au8al5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150752.I0Au8al5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150752.I0Au8al5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/processor_idle.c: In function 'acpi_idle_enter':
>> drivers/acpi/processor_idle.c:699:39: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     699 |                 ACPI_FLUSH_CPU_CACHE();
         |                                       ^


vim +/if +699 drivers/acpi/processor_idle.c

6491bc0c616969 Rafael J. Wysocki    2015-02-03  676  
409dfdcaffb266 Guilherme G. Piccoli 2022-06-07  677  static int __cpuidle acpi_idle_enter(struct cpuidle_device *dev,
6491bc0c616969 Rafael J. Wysocki    2015-02-03  678  			   struct cpuidle_driver *drv, int index)
6491bc0c616969 Rafael J. Wysocki    2015-02-03  679  {
6491bc0c616969 Rafael J. Wysocki    2015-02-03  680  	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
6491bc0c616969 Rafael J. Wysocki    2015-02-03  681  	struct acpi_processor *pr;
6491bc0c616969 Rafael J. Wysocki    2015-02-03  682  
6491bc0c616969 Rafael J. Wysocki    2015-02-03  683  	pr = __this_cpu_read(processors);
6491bc0c616969 Rafael J. Wysocki    2015-02-03  684  	if (unlikely(!pr))
6491bc0c616969 Rafael J. Wysocki    2015-02-03  685  		return -EINVAL;
6491bc0c616969 Rafael J. Wysocki    2015-02-03  686  
6491bc0c616969 Rafael J. Wysocki    2015-02-03  687  	if (cx->type != ACPI_STATE_C1) {
1fecfdbb7acc66 Peter Zijlstra       2020-09-15  688  		if (cx->type == ACPI_STATE_C3 && pr->flags.bm_check)
1fecfdbb7acc66 Peter Zijlstra       2020-09-15  689  			return acpi_idle_enter_bm(drv, pr, cx, index);
1fecfdbb7acc66 Peter Zijlstra       2020-09-15  690  
1fecfdbb7acc66 Peter Zijlstra       2020-09-15  691  		/* C2 to C1 demotion. */
5f5081852038d9 Rafael J. Wysocki    2015-02-11  692  		if (acpi_idle_fallback_to_c1(pr) && num_online_cpus() > 1) {
dc2251bf98c66d Rafael J. Wysocki    2017-08-23  693  			index = ACPI_IDLE_STATE_START;
6491bc0c616969 Rafael J. Wysocki    2015-02-03  694  			cx = per_cpu(acpi_cstate[index], dev->cpu);
6491bc0c616969 Rafael J. Wysocki    2015-02-03  695  		}
6491bc0c616969 Rafael J. Wysocki    2015-02-03  696  	}
6491bc0c616969 Rafael J. Wysocki    2015-02-03  697  
6491bc0c616969 Rafael J. Wysocki    2015-02-03  698  	if (cx->type == ACPI_STATE_C3)
6491bc0c616969 Rafael J. Wysocki    2015-02-03 @699  		ACPI_FLUSH_CPU_CACHE();
6491bc0c616969 Rafael J. Wysocki    2015-02-03  700  
6491bc0c616969 Rafael J. Wysocki    2015-02-03  701  	acpi_idle_do_entry(cx);
6491bc0c616969 Rafael J. Wysocki    2015-02-03  702  
e978aa7d7d57d0 Deepthi Dharwar      2011-10-28  703  	return index;
4f86d3a8e29720 Len Brown            2007-10-03  704  }
4f86d3a8e29720 Len Brown            2007-10-03  705  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
