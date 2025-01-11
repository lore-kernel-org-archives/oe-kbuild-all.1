Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88711494D9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736588969; cv=none; b=M9F4pxPk/FM+e7VwABoNeW2XFQwleI/wC8ynt/NIG3gJTgpt6vXzG10hFKHRyyxJjeRGUqxwA5OgQ12jSkGY40hiFqWEMb3a5KYaWNstHUSWmYTX6imwoL/8B43dWBsZLVz3qRxwd1gdFsZ4W6IKjaw7h4nun2nGw6wMxIRDTX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736588969; c=relaxed/simple;
	bh=Q+Uw/WbxHnYZMO17W5ZHkM69KFe0HWgbxZ7L7XFo/DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdgX31fvhHaHkp7fX9YPi9uOjaH7GFZSXx+jU9v9qwgzETben+N0Ukv7RQyFi9+UfI8AonN/buqfjRa+3BIkiAY2HYTcojnHDeV/Y5jpzaqUe7KI4NSf5CkToZmkG3uKQBnGN+ARyz7q1pSoTVnLycijld6BJYGkx1vBzeJI0Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPAG2Nph; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPAG2Nph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736588968; x=1768124968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q+Uw/WbxHnYZMO17W5ZHkM69KFe0HWgbxZ7L7XFo/DI=;
  b=PPAG2NphzsC+UiMRfr/nEGNasHSIOp08cQc7jwXygUHSYz5+3SxFlNwv
   aZUudjspT661w6Zgw5ddVDeQ/6Ti0scf5fzXm39oAZZqXVFIl7YQ0TkTa
   3KRGKAsEY5gdnuSdMIiFGW8x5S5pTwnbc0Z7Y0xikHACMwR4iK2e0yFHK
   +NfSbny39Pp7Yc0iJrk6NOlyni0E1Lot9/1gjHWexb6DfR53hTBDVfNQi
   hQDODom0rqoEwYiTipYO6TdkH8xC/wN5pGgiXN0jjXlw6inSACv18cyt9
   /ItIWUhcaohYD1MJ5Ald8ofe+iGDcQxt1L03SJQmCYXpJgk5sVK9PLiyR
   A==;
X-CSE-ConnectionGUID: oTZmgnVKSK2Lu27yOWYLCQ==
X-CSE-MsgGUID: 522wx0Z1SIqCfoQJQKFvmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37040782"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="37040782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 01:49:27 -0800
X-CSE-ConnectionGUID: 4PNuOVSGQimyChwkixpZnQ==
X-CSE-MsgGUID: RrgZCmQQRX688Ikoe+7xBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="108965438"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2025 01:49:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWY7Q-000KSM-0a;
	Sat, 11 Jan 2025 09:49:24 +0000
Date: Sat, 11 Jan 2025 17:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] sched/fair: Encapsulate set custom slice in a
 __setparam_fair() function
Message-ID: <202501111705.sBZc8voZ-lkp@intel.com>
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
config: openrisc-alldefconfig (https://download.01.org/0day-ci/archive/20250111/202501111705.sBZc8voZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111705.sBZc8voZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111705.sBZc8voZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: kernel/sched/build_policy.o: in function `__sched_setscheduler':
   build_policy.c:(.text+0x8128): undefined reference to `__setparam_fair'
>> build_policy.c:(.text+0x8128): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `__setparam_fair'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
