Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160D014F132
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736587647; cv=none; b=XpHk1qTcTD691fJfQzBW7xZFVxETeFOVrvqaq0ImdcIaW/+gwIu2yAZZWwbMRw9gnYpfFVIT2S0X5zasA6L/3IHQHozF84brmvRa7tuuwzK/+5DO1d2pvQIBTJi1O2w5HlBVi0f6B4yS9b3VW9hw7zDXFjtwtD3UUNss1yksBOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736587647; c=relaxed/simple;
	bh=0mUiFtRpqeW2+eMcPIZuLGeaY2RvHqLBtDs/LsLyRFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1btliuIEfMTxFvoXxnOQGq+dhveuIls0bZRijMn05kr/njukbOHvJQleC1G9QFq1FAoGKH7WK12SIHhIrl48itzdF9WNdG5oTUbL+9XWOFdaAGm8Dvmq+jVherVyNv326AFaNV0KMw62xR115u8WfnnogK8HQwj2VJNPTc1aVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fu74IFel; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fu74IFel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736587646; x=1768123646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0mUiFtRpqeW2+eMcPIZuLGeaY2RvHqLBtDs/LsLyRFs=;
  b=fu74IFelVzQeYkFpZQJUml9/TJJtvswHB3/y2yr5U3la2RRe1nI7StJf
   +KZL+6I5jYQPOjmsueHYyrWAO91XBouWFRR2X8u703dBRwIvXoVceYzxv
   HTs7w5pc9hoZjtaWRwXr0dzjFr7lI375cdDH4qur2VgcNsTK5N+vF21y4
   B6O47WO1SaSNynOZM+ml3kKZM7TdRq46WrLmyfDAXnNeNCsHYBKEJ2wPk
   A1lQj3M12D2fY6fqQxfl8B5AJCcLXF1lY+HML1dsBzcBu78/Lr/BUVl9Y
   1Cutma4ubJ9MNt71J/DAPf+B8gwGlKqaRMUHyeubetlPNcXB68tnCptgf
   w==;
X-CSE-ConnectionGUID: rcBqWUs9Qn2x8e9wlnmHVg==
X-CSE-MsgGUID: /bowomUMQKSnoIZlMctymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36781787"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36781787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 01:27:25 -0800
X-CSE-ConnectionGUID: /qkht62VR6+hZtmbXIrZ+w==
X-CSE-MsgGUID: TbsMby1ZSa2bzz+SI4eY5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108988528"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2025 01:27:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWXm5-000KQz-2Y;
	Sat, 11 Jan 2025 09:27:21 +0000
Date: Sat, 11 Jan 2025 17:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] sched/fair: Encapsulate set custom slice in a
 __setparam_fair() function
Message-ID: <202501111759.lr8LHoZu-lkp@intel.com>
References: <20250110144656.484601-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110144656.484601-1-vincent.guittot@linaro.org>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.13-rc6 next-20250110]
[cannot apply to peterz-queue/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Guittot/sched-fair-Encapsulate-set-custom-slice-in-a-__setparam_fair-function/20250110-225327
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250110144656.484601-1-vincent.guittot%40linaro.org
patch subject: [PATCH] sched/fair: Encapsulate set custom slice in a __setparam_fair() function
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20250111/202501111759.lr8LHoZu-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111759.lr8LHoZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111759.lr8LHoZu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: kernel/sched/build_policy.o: in function `__sched_setscheduler':
   build_policy.c:(.text+0x41be): undefined reference to `__setparam_fair'
>> arc-elf-ld: build_policy.c:(.text+0x41be): undefined reference to `__setparam_fair'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
