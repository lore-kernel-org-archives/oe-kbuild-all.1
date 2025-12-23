Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB81214A64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766452010; cv=none; b=HePkb1EuTroysmXYKWyFuZQAfAhbtmhONqah6pPjpOceUGY5YSAbBZ/J5PJCOxGSQT4zpaPKdXlgkdsHpncQGlllskcUtQ+OwaydTvXs7wjbhNiidafhQ/fsSyAd3BlnNuZOTlG+H/gcpRzVeft/bl7KKg9Xg0c9A0GjDps5FAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766452010; c=relaxed/simple;
	bh=7iFCpUMKDCIrPCxuUydHTuqA5E2bwhEMen3Y0DD3QHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfDR1RLmVvbORjnBhfgk2FaWUPqCjcHRsXnhn6kFS3g3Y8P0VKA6jkPHfLfMLJ8LfsXHg9K7ksm7RAYQhyds1dpUViK44/BRuEeLPoFluADbk1JngBXu9MomdRsqPpuSnChtxojp6Vk1g/+3aXb2yxHkNUp/xUK8tRhByWuuRWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ow6zphaL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ow6zphaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766452009; x=1797988009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7iFCpUMKDCIrPCxuUydHTuqA5E2bwhEMen3Y0DD3QHw=;
  b=Ow6zphaLrCF+o+8JZbM+8y5qE7w+QidIJdYG9BsZeGe1W+Wn8uN8zWjy
   qrxfwwQzxMEBc7mkemO9PfWDIOKyGVfMDKEBJsbSG069Tw/7hQA8nO61d
   dFcKF85d3Jd/x6Elb5QAFVByIxW2zdXons7JYgZTzrNxpxwrsRmGgM36M
   H0oDBko+S6s+4EN0CAZw+xQRlD9B/YE+Clwy3bM+oiHP59SubHaKWRnR6
   vrsy5+Q518CfGQKtU6/FAMy2GLMdX7d2twINoMD9t8AB3CBfVZ9OLPEXr
   uuoHE9AfhOOesX9BO+00yc0MuexByZto6Mxi7a2mFgTXb1dKCD+A53C9N
   A==;
X-CSE-ConnectionGUID: n0TNjaS2QTid9zvz+SfovA==
X-CSE-MsgGUID: DdEF1YPxQWi1SrlFhUPANQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72156401"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="72156401"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:06:47 -0800
X-CSE-ConnectionGUID: T1qmSfjsTiieBk5lKZvelg==
X-CSE-MsgGUID: gF96pRZMRN+tHCSugKak4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237061232"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 17:06:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqrK-000000001HJ-44GC;
	Tue, 23 Dec 2025 01:06:42 +0000
Date: Tue, 23 Dec 2025 09:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] x86/apic: Inline __x2apic_send_IPI_dest()
Message-ID: <202512230859.jl2eLtLj-lkp@intel.com>
References: <20251222092208.770136-1-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222092208.770136-1-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on tip/x86/core linus/master v6.19-rc2 next-20251219]
[cannot apply to tip/auto-latest bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/x86-apic-Inline-__x2apic_send_IPI_dest/20251222-172515
base:   tip/master
patch link:    https://lore.kernel.org/r/20251222092208.770136-1-edumazet%40google.com
patch subject: [PATCH] x86/apic: Inline __x2apic_send_IPI_dest()
config: i386-randconfig-141-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230859.jl2eLtLj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230859.jl2eLtLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230859.jl2eLtLj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/apic/apic.c:71:
>> arch/x86/kernel/apic/local.h:48:2: error: call to undeclared function 'native_x2apic_icr_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      48 |         native_x2apic_icr_write(cfg, apicid);
         |         ^
   arch/x86/kernel/apic/local.h:48:2: note: did you mean 'native_apic_icr_write'?
   arch/x86/include/asm/apic.h:116:13: note: 'native_apic_icr_write' declared here
     116 | extern void native_apic_icr_write(u32 low, u32 id);
         |             ^
   1 error generated.


vim +/native_x2apic_icr_write +48 arch/x86/kernel/apic/local.h

    43	
    44	static inline void __x2apic_send_IPI_dest(unsigned int apicid, int vector,
    45						  unsigned int dest)
    46	{
    47		unsigned long cfg = __prepare_ICR(0, vector, dest);
  > 48		native_x2apic_icr_write(cfg, apicid);
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
