Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D922E5B0E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428159; cv=none; b=BsdoOrCAwtgagFq/oo+6hMN9aCu/woPgQw0tWfWwrD/ywcgA2DQ1mXzfKCKRx555p2QsvEDXmd3iHso+WP8hV0aFkjjLYtQfqV9FhyIfq42M6zc9F+4cAwS09RdQ53iCGr/yqoSkd5VfCgH2dflM3cQCuqK7YsPgCcSatpU9lvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428159; c=relaxed/simple;
	bh=q+uLtJgaXMKgaG1nyr3ayCazOxSh0p4+fuGS7p79/FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i23EFQr1FCWivIui+ThHCIAH4htKhZjX5uW4WhddqRrzJkSfJWH/fhYG/yufqG41h+EWo2gjgdtJrfteSxFBRdGU5J1S8RgTZYPLoLSIoXiF9bToKxuwLqZVyBwiJxqhRvQJo03yKhiiKDh1ERjg4BWCjy5IwD8s05jDb4XGfC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsbvLhQ3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsbvLhQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762428157; x=1793964157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q+uLtJgaXMKgaG1nyr3ayCazOxSh0p4+fuGS7p79/FM=;
  b=EsbvLhQ3QBC19HqKOL90k/iqW/WO2vayOfqYvUYl2WtIZKDRKO600cQI
   k/k46rXQIC8FtK4Nh4c7BbkWDDnYJ9RLGOvhTJOlPW7iQhGri/5eodXbd
   b44CTDSUtgrW7SoaY9HzhXDgxzNSaiOGwxwLecL+GuflkMMjqx/hc2nHP
   LlfZXu1WHkPlxQ5uvNgGY+3dqtechq29R+rBF4V7uB8a/czrEdWjGG6E3
   Y0HYLAVLij41Uice9QdR93LVKRPdI4kIWhihBXmROJguUjlSvMNL3MVNc
   RGl+pn/njYcpMMc+VSoAt2MGFR1gxTcknNbUN8NyOPCYjbnHEWPYrN4DF
   w==;
X-CSE-ConnectionGUID: hzyLWEolQ0CkSDtdAVYt/w==
X-CSE-MsgGUID: o2ym6J67Q1uJZHIMKNUMKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64712354"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64712354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:22:37 -0800
X-CSE-ConnectionGUID: ZR8NXz5GS0i9/sqUznlI8A==
X-CSE-MsgGUID: YBlc8uEKSoe1H9BXiMNCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="191828580"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2025 03:22:36 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGy4S-000Tpc-1c;
	Thu, 06 Nov 2025 11:22:29 +0000
Date: Thu, 6 Nov 2025 19:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 7/7] timers: Exclude isolated cpus from timer
 migration
Message-ID: <202511061957.rIK5HZq6-lkp@intel.com>
References: <20251104104740.70512-8-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104104740.70512-8-gmonaco@redhat.com>

Hi Gabriele,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6146a0f1dfae5d37442a9ddcba012add260bceb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/timers-Rename-tmigr-online-bit-to-available/20251104-185437
base:   6146a0f1dfae5d37442a9ddcba012add260bceb0
patch link:    https://lore.kernel.org/r/20251104104740.70512-8-gmonaco%40redhat.com
patch subject: [PATCH v14 7/7] timers: Exclude isolated cpus from timer migration
config: s390-randconfig-r132-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061957.rIK5HZq6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061957.rIK5HZq6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061957.rIK5HZq6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/timer_migration.c:433:1: sparse: sparse: symbol 'tmigr_exclude_isolated' was not declared. Should it be static?
   kernel/time/timer_migration.c:903:9: sparse: sparse: context imbalance in 'tmigr_update_events' - different lock contexts for basic block

vim +/tmigr_exclude_isolated +433 kernel/time/timer_migration.c

   431	
   432	/* Enabled during late initcall */
 > 433	DEFINE_STATIC_KEY_FALSE(tmigr_exclude_isolated);
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
