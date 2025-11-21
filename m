Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD292C21EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 21:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763759625; cv=none; b=XnWTiyvFmirKPVR5wJxmG2Pv7tEXtaEyisCFZasmen5IJnqk/lrtXbDkHW6fdeGl2dE6DHg1PZeiLPnvLmKNiCS6cZan7tqFBaDgh/u0yHezQ3j9tLvNW5DSV8qKuaiHTLCRVljtZBP27izrsiBXvgN0fklVGELY0Wq47AUeX84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763759625; c=relaxed/simple;
	bh=SAbnprsdtXOmX+JhzhDyaE7FaQC/68ze4qK13OGbtkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ijx3IqKmmDU44bH9PqdxdEqD1j3ah0G/m1tLKfRaThMY0RUAfnoiPg3Q7ePBhwE+mjt7YxqZrfo9MWuFdNxpc9R65ep9VqAbD5BjIEKkOhQWxLdjFUZLzLMjIHdNRnFob3ifzsHy7YTXhkChtD9KJeN2pFM5XqCqYxtn7YwSm/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjLYtZ1/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjLYtZ1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763759624; x=1795295624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SAbnprsdtXOmX+JhzhDyaE7FaQC/68ze4qK13OGbtkQ=;
  b=EjLYtZ1/N91RhAfZKpjfWg6zNgG/0Kt4ktHaPAQ5nIWaXf1FpLbUJMq6
   4PA9oRWF4IMx4ZF439fRT5uS2cgzDBKqOQ3MPcK4sgWKhFTxR+qQ8YUTy
   PXM4lKEseigaB/IDwxERLVBUXLgaW8pCiJ/i8mrwrhI5XbhRSpB4oBqS0
   ZtYWqLDQIh7344LfbXsqrfQVRFZ53Kuo2WPDkI5gbVjaC+J8XDvHe9+1L
   xAkmDoHULZaWNCKmbG0VDZZcOiLXhGGmpm28n+vT1fOVFgn5aEECB7HRs
   RVJ9YJoP+jV48wnnHtpWsJl6gGPmccqNz4qLqVRuZ3opiquU7cGAElKfR
   Q==;
X-CSE-ConnectionGUID: ef8FRKvEQD6Dw/SXFnok3A==
X-CSE-MsgGUID: POLP0x1MQie7JMtdZyEjLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69718367"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69718367"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 13:13:43 -0800
X-CSE-ConnectionGUID: 7vX+jFddSl+3E0sdQebKWA==
X-CSE-MsgGUID: I2wL4xQfQ2KDV7GzIMQlOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191469065"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2025 13:13:42 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMYRn-0006sh-1J;
	Fri, 21 Nov 2025 21:13:39 +0000
Date: Sat, 22 Nov 2025 05:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v5 5/8] x86/mm: Introduce Remote Action Request
Message-ID: <202511220416.bC2ZcjJq-lkp@intel.com>
References: <20251121185530.21876-6-riel@surriel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121185530.21876-6-riel@surriel.com>

Hi Rik,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/mm]
[also build test ERROR on tip/master linus/master v6.18-rc6 next-20251121]
[cannot apply to tip/x86/core tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/x86-mm-Introduce-Remote-Action-Request-MSRs/20251122-025719
base:   tip/x86/mm
patch link:    https://lore.kernel.org/r/20251121185530.21876-6-riel%40surriel.com
patch subject: [RFC v5 5/8] x86/mm: Introduce Remote Action Request
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251122/202511220416.bC2ZcjJq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220416.bC2ZcjJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220416.bC2ZcjJq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/intel.o: in function `intel_detect_tlb':
>> intel.c:(.text+0x2c3): undefined reference to `rar_boot_cpu_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
