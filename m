Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A13B8D62
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 14:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765116466; cv=none; b=ENDAP4YlKWhNH85qNl9WOK75AEzjZTviRgHSY7REr2D5b/7Hm7Kp04tA7XnY6AxcdlgbdvNytyyDLKRmj/8RaB6IXXzfgFbbmeWxxjlbclUsWCb7adO1y4Zgkw0VEjTKXyibsqvfO3dVlXE0fxeKHWOdr684JmDi8tCDi38abDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765116466; c=relaxed/simple;
	bh=wv10A6VVbg/xk7EEdpfr7sYadTFFx9rEnI/BeO3fV3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emxjlBfKquGFGoGEvC8XWsFoMqY+ZBNLnsFInvDc2EQBbFY/wrS6QtAlIx07cxpr5VRj/rkBpj4sy4fxVjOcVLLYLpFz9UH4H0z9vu7nBtd6pMJGLHs5YXJxWIVg96fWsBOYfXot+dhsApIaKlALWuShyKB9K9tv9AZz6vyErFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtB9iiH/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtB9iiH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765116466; x=1796652466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wv10A6VVbg/xk7EEdpfr7sYadTFFx9rEnI/BeO3fV3E=;
  b=DtB9iiH/4LvTUKmqraGYbZx+DIrfP+JmWAGr+RjRlSX0UpL46EYi90jJ
   jDLTnwgySr6BKVigUMbSC3NVmO1l6eist5HzOCnFB2gDb9wQvT19yp3+f
   8gA5V94yAgwsm4grx3wlDzs3HP5d3P9Ffd1Wt0HCUVmn/gogT30v0CPD8
   Exxkb3aKoFg57BuRer3RmKeGhyBZSyZ8twjx8J2H9Od7a2ZtYQYxW8Fdq
   iYoilSOh24L6oztYDlqaVl8bbHCFA/+4Rpt8VsBq2/9lZiJhtn2O8VjXs
   63+ys0t3Dk0lWu2DB1kvleFGlIIZn6O2EZlwAxmwE347j/kK0B2g52XRF
   w==;
X-CSE-ConnectionGUID: twMsXv10Q6ic4IUUxBUT/A==
X-CSE-MsgGUID: VcI2kjJTRK6owyYTGPojfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67120349"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67120349"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 06:07:45 -0800
X-CSE-ConnectionGUID: X68OPOWnT/StEcqjeaXxag==
X-CSE-MsgGUID: fGJ2VVygQ9SA8rkkTmsS5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="226376435"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2025 06:07:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSFQL-00000000JGT-3dWf;
	Sun, 07 Dec 2025 14:07:41 +0000
Date: Sun, 7 Dec 2025 22:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoly Stepanov <stepanov.anatoly@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/5] lockref: use hq-spinlock
Message-ID: <202512072120.d2mJ5zeQ-lkp@intel.com>
References: <20251206062106.2109014-5-stepanov.anatoly@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206062106.2109014-5-stepanov.anatoly@huawei.com>

Hi Anatoly,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on tip/x86/core arnd-asm-generic/master v6.18]
[cannot apply to linus/master next-20251205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anatoly-Stepanov/kernel-introduce-Hierarchical-Queued-spinlock/20251206-070428
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20251206062106.2109014-5-stepanov.anatoly%40huawei.com
patch subject: [RFC PATCH v2 4/5] lockref: use hq-spinlock
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251207/202512072120.d2mJ5zeQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512072120.d2mJ5zeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512072120.d2mJ5zeQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__raw_spin_lock_init_hq" [fs/gfs2/gfs2.ko] undefined!
>> ERROR: modpost: "__raw_spin_lock_init_hq" [fs/erofs/erofs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
