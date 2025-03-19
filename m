Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0A10E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 20:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742417669; cv=none; b=Pr/Pyek8bdLkqO2MWJyDSyGXS2L0ltDHdWRC/J4XHcHT1dOtHTr7XgoYQ09DL6TAgrFq8WeJpg5VoXaO1o0XrgMpsgeYsdazJoRxoZwUWcN4UxseHgP9ZGutBx9TLNwyPZm+bZvzCDhzMxQPZQteAc/xs0VJ8NrCIoux4E0iLMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742417669; c=relaxed/simple;
	bh=QT8TD6n4H/LHcS6OGujULcSHsfSMTiGkxXO6/JDp+tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcqynKxBbQzmbBGJpdcvx3Qm4/Ci/xRlNBhHSMJwt2OP/CYmNJBGaN7sR3E1MYQepFvn34Ndh2X3jQqgA3Pe/T57IuLaC8KkCE9+hMOCpZVr7JPGRXCS5K0q/9CJq8jdqhV92x5+Rvl261gV27lvA3C6aTy1fVShXZDNTfn6Wfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nynYFDH3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nynYFDH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742417668; x=1773953668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QT8TD6n4H/LHcS6OGujULcSHsfSMTiGkxXO6/JDp+tY=;
  b=nynYFDH3a1b1p4nDdC8RJBgvII/57qBhuO4VaffwOA1IpXiGQINOjyF2
   CPtZsH7akkP9TbyuJLZJ8cqSyqw+8mc74BGDmyz1dvUSTH9Ytz9fUeZhH
   I289Q9/7JqdiV6UglUqr2cv6DCoazZIUc5/jTxx1hBkxnkcJRCXQWxJ4J
   XNdOWrJ0uLgDrRpYmMYCJ/232cxpxd5//uh/m1Y3Sez2jB1TAH35xOyMl
   DAxg05T9VrFbK7vDOufqwV+Yss0P7cj1nxvDDjIX3kDVots0yr9nQ3E3F
   DryrJ0iveaG5LQkziPckidNz8NxVQ/J2b82VB/RVUxIzeorilCy4jzmGe
   A==;
X-CSE-ConnectionGUID: X0lJc25ERx2lRaFeeTW4XA==
X-CSE-MsgGUID: ucIOrWXURtKT2Ypm3laEDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="68982920"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="68982920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 13:54:26 -0700
X-CSE-ConnectionGUID: 87dEETAISVuaUxGcQv4r8w==
X-CSE-MsgGUID: qQp/8ItKS7Cnqs+Xgj8FfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122808093"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Mar 2025 13:54:26 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv0Qh-000Feo-30;
	Wed, 19 Mar 2025 20:54:23 +0000
Date: Thu, 20 Mar 2025 04:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/3] x86/fred: Allow variable-sized event frame
Message-ID: <202503200401.1Aq0MGKm-lkp@intel.com>
References: <20250319071009.1390984-2-xin@zytor.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319071009.1390984-2-xin@zytor.com>

Hi Xin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 60c162a51180cb2b05d7505a565ab079bfa9cf12]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Li-Intel/x86-fred-Allow-variable-sized-event-frame/20250319-151307
base:   60c162a51180cb2b05d7505a565ab079bfa9cf12
patch link:    https://lore.kernel.org/r/20250319071009.1390984-2-xin%40zytor.com
patch subject: [PATCH v3 1/3] x86/fred: Allow variable-sized event frame
config: i386-buildonly-randconfig-001-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200401.1Aq0MGKm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200401.1Aq0MGKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200401.1Aq0MGKm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:60,
                    from include/linux/smp.h:118,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/init_task.h:5,
                    from init/init_task.c:2:
>> arch/x86/include/asm/thread_info.h:76:45: error: '__top_init_kernel_stack' undeclared here (not in a function)
      76 |         .user_pt_regs   = (struct pt_regs *)__top_init_kernel_stack,    \
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:68:27: note: in expansion of macro 'INIT_THREAD_INFO'
      68 |         .thread_info    = INIT_THREAD_INFO(init_task),
         |                           ^~~~~~~~~~~~~~~~


vim +/__top_init_kernel_stack +76 arch/x86/include/asm/thread_info.h

    72	
    73	#define INIT_THREAD_INFO(tsk)						\
    74	{									\
    75		.flags		= 0,						\
  > 76		.user_pt_regs	= (struct pt_regs *)__top_init_kernel_stack,	\
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
