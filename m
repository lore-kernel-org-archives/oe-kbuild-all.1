Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1EB189BBB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737212183; cv=none; b=WqUv5KEu/z6vn2iwWhAxy5+jt0DYBKiViSch4H8FX76mi3yIH0RaPm44DZkPOQS6+P6g/XgiLeU4lUQlnzj9eFjsd3Ry1P9FI/kWL0V0dAi8L74cS92keeAsjW+9rNykaJ1hxNL2NS8kioYYPyDuhI3ce3kWd7ZGWTEPKoABlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737212183; c=relaxed/simple;
	bh=yFZ+IHVrlafn9h7k+NVX3f8cr05esynCqqIBuWDzMkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBxWgAOhWFtuEaIn62Ihq8W8hC9gLdQHywi3MH2U5+MwKUTi4KWt7SbSp8DON1JaGNPtFWwXo8NdejQXngQksDqHXT9H3xMVTu7TUZfSPIT+KSaSJVQFr5NmhOqp/rDd2PUxBXvzY3YAgakuBcAWXtzlw2pouv/Op9tVdmYfs5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5pD2NE+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5pD2NE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737212182; x=1768748182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yFZ+IHVrlafn9h7k+NVX3f8cr05esynCqqIBuWDzMkQ=;
  b=c5pD2NE+LaVt4memVjzmCzjthK++VfkwoCk8A10yRDUZISqmIjG/oXPC
   Fby7rUtmqWEemz5CIZdK47ROGuv1hRJQfAJSU5LVY8rFzBTzL/xuIM/JR
   /T6FyNQRgJ0lKKv86303b9asN2hKvMW4KeuARHEJG2C9ptnMK3rnIVmJu
   zssLHMI0Um25K0GpO+uSq0byD1YKaSdLy1jZ526swFkXmJKLNrp3OYqyX
   u+A4mqf9KNhMJx+O8RIgtQqcNc5waUs1jiNnOf9+kkGFDKUsnRUnvvCPa
   ATwosX05vgYAJgIuWqlUS6eHgnEMPQ7shBg7NvNMCQl1VLO5JyfcmQa3J
   g==;
X-CSE-ConnectionGUID: K2x71vgDRReq1CLxGFPYoQ==
X-CSE-MsgGUID: DrkjKVCxQDGNZeifiabK/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="41310419"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="41310419"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 06:56:22 -0800
X-CSE-ConnectionGUID: buRHBNrhRGuzOH6tlBBxig==
X-CSE-MsgGUID: T7ibUTAvRviGE4wo9SRcEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="106109357"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2025 06:56:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZAFG-000UX1-1R;
	Sat, 18 Jan 2025 14:56:18 +0000
Date: Sat, 18 Jan 2025 22:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 04/11] fs/resctrl: Add arch hook to set up the
 default CLOSID
Message-ID: <202501182233.yCf4NXgd-lkp@intel.com>
References: <20250117151033.1517882-5-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117151033.1517882-5-Dave.Martin@arm.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4d17b37b670795954fd7a70c8ec83fb705a5e2ad]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Martin/arm_mpam-Fix-read-back-of-cloned-resource-controls-under-CDP-emulation/20250118-031759
base:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
patch link:    https://lore.kernel.org/r/20250117151033.1517882-5-Dave.Martin%40arm.com
patch subject: [RFC PATCH v2 04/11] fs/resctrl: Add arch hook to set up the default CLOSID
config: x86_64-buildonly-randconfig-004-20250118 (https://download.01.org/0day-ci/archive/20250118/202501182233.yCf4NXgd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182233.yCf4NXgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182233.yCf4NXgd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/resctrl.h:13,
                    from arch/x86/kernel/cpu/resctrl/monitor.c:22:
>> arch/x86/include/asm/resctrl.h:60:52: warning: 'struct rdt_resource' declared inside parameter list will not be visible outside of this definition or declaration
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                                                    ^~~~~~~~~~~~
>> include/linux/resctrl.h:375:5: error: conflicting types for 'resctrl_arch_init_domains'; have 'int(struct rdt_resource *, u32)' {aka 'int(struct rdt_resource *, unsigned int)'}
     375 | int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/resctrl.h:60:19: note: previous definition of 'resctrl_arch_init_domains' with type 'int(struct rdt_resource *, u32)' {aka 'int(struct rdt_resource *, unsigned int)'}
      60 | static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +375 include/linux/resctrl.h

   371	
   372	struct rdt_domain_hdr *resctrl_arch_find_domain(struct list_head *domain_list,
   373							int id);
   374	bool resctrl_arch_default_closid_needs_init(void);
 > 375	int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid);
   376	int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
