Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7F0A920
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 04:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752898953; cv=none; b=Uc5IwMFI1A/2TwAH2ZGGZY5GohPAqdo2A1zP2hjCdqKYWksp1fjtr2jFhpLhOS5GgMV5aNLZTkpUP+Ht1qvd9uwm7YeGzZfMnzu47KRWPlT1pWk5ONzLSKq7hgFoIDUATblxi30gTx/KNNjkLMDxwk0XDzh/0J+s/1LczLG+EJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752898953; c=relaxed/simple;
	bh=yhc+XTY8/OAYR3+ee9PjKRtX5CaYO7Uzj25l/G5Affo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVe51XeyzZEJwX+435y36mPm4eGnV5S/C9e3y1l6nsrsyLBWWUCHGj1dCl4o6/3N181TNHFIkX7jHVYXvfBZFJh2vIXdZzl9wpVwvJp6QFADNot+dIksZalLd3st7nVCuvR6DrfJNcEfxGK2b6J5wSMf3jRHKWKTk5tsQe1TeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXuq4PbD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXuq4PbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752898952; x=1784434952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yhc+XTY8/OAYR3+ee9PjKRtX5CaYO7Uzj25l/G5Affo=;
  b=lXuq4PbD1yrTU8RyaaMEbGfPTNP2qcx30wJDWy2wFHafUUT4OJwQ5vue
   AA3jxrBtiYGk8x49RhlrLAHoKHWKtiUnHVMlpKs+tm4kBw/Z9EsFBmr0y
   n3dKukg7my2NgSOpOvUhj0vpEWRn6QHhCgMo16uQse32/XETDqLsTsKf6
   6qm87x0ZtCiilHt9hEtSeYCG3VjZIa8wIHF/k6lMRWFCnRrBBsywi9jP9
   sMFsk34kjqaSQTvpf87zD+8CHVNATUI7moaz0ryiu7b0ClTigRtZqZ5jF
   dqkH9nkH0lKohv1HRGHJ6i6R40QsJDacK9p+xYx4XLJH2deetFG7Q/njO
   g==;
X-CSE-ConnectionGUID: ewX/zqCOQYKm5VJvTBFhvA==
X-CSE-MsgGUID: sb1XFWHbQO++m6b1zPpicw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55132510"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="55132510"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 21:22:31 -0700
X-CSE-ConnectionGUID: 8pf9VGTyRDOIPfaKeTWNxA==
X-CSE-MsgGUID: u9ivzaHPS+irQyA+JDzxWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="164027192"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jul 2025 21:22:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucz5g-000FEx-0K;
	Sat, 19 Jul 2025 04:22:28 +0000
Date: Sat, 19 Jul 2025 12:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 10/13] init.h: Disable sanitizer coverage for __init
 and __head
Message-ID: <202507191258.YeZXvo0U-lkp@intel.com>
References: <20250717232519.2984886-10-kees@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717232519.2984886-10-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on tip/x86/core arm64/for-next/core s390/features linus/master v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/stackleak-Rename-STACKLEAK-to-KSTACK_ERASE/20250718-072844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250717232519.2984886-10-kees%40kernel.org
patch subject: [PATCH v3 10/13] init.h: Disable sanitizer coverage for __init and __head
config: powerpc-randconfig-003-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191258.YeZXvo0U-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191258.YeZXvo0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191258.YeZXvo0U-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/char/hw_random/nomadik-rng.o: in function `nmk_rng_remove':
   nomadik-rng.c:(.text+0x60): undefined reference to `amba_release_regions'
   powerpc-linux-ld: drivers/char/hw_random/nomadik-rng.o: in function `nmk_rng_probe':
   nomadik-rng.c:(.text+0x128): undefined reference to `amba_request_regions'
>> powerpc-linux-ld: nomadik-rng.c:(.text+0x1a4): undefined reference to `amba_release_regions'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
