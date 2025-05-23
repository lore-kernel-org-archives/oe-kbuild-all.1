Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4111AF0B6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 23:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044248; cv=none; b=g9UmMycAnZSC7gj3Jgr2B0dFZq43wznv0gA4WDA1mbKwPm/eA9f+q8y35aAyL8t/Eg/Gk9MUX76ZpZa2QXoZV3mGDD4iEvLmjlbEjdrKh0poeV3ruR09BDndSady/8GVbna/M7QMcjD1DR9l6c3GeCYG5vsqPRLCN3gvaAzQf1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044248; c=relaxed/simple;
	bh=ENejiL0fq51p3Ex8sCtnRGekxIezB+elFgytCfzft/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkFktHuXaXHDvb/M9qqDf7qHsfkoRLMzzu+hClP/DM5fY9JUTG1725m2Gap3E6SG6s9LZzDYiuYemEsUwNBGTA8osCgx5383SNvFONGAcI7PerMJxtuvVUG3+2oW2DBK6yDoHnkJpsxUIwnhNZX2j8OBGuxd8oEPLtP8SGZGnb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxENsi1b; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxENsi1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748044247; x=1779580247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ENejiL0fq51p3Ex8sCtnRGekxIezB+elFgytCfzft/A=;
  b=lxENsi1bvYeLpxwn/1PO/1NquGJxiMX61+iLIlhnDDAbFRedOI88Hw78
   BWcGFTuWaEfibP3fvK22Y5j1f4wQ75C8OX9xjZx2y0TwpCgeC5oss09ZH
   v8mMnEo3hpWUceI1xBGY48eyXM4cYeuWN+GKnx0oit7faIj9tDDQ3o8/K
   GIpy4WG5Bl6p5+zigR91SglKn21Zqa2dMhhDwkIlqWkD+OVZu8WmkbXg7
   whu9HZ0z/giAjOl6gvHzttukpmyNpfqCGDosfTJLQroIZqUEpSmAQpD5i
   ZLrh6z+pfG4HkbDeheUutXx2GLZR5jZd6cq+A/7EYCik684HF3KBhXdwp
   A==;
X-CSE-ConnectionGUID: 50Da9MbaSnWMJPpyRbSqCQ==
X-CSE-MsgGUID: oJViOklhRWGLzMyD0uQqhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61514475"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61514475"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 16:50:46 -0700
X-CSE-ConnectionGUID: KyLM5XOsTsWZ1SYB8HXSlw==
X-CSE-MsgGUID: G56nVXbOQlWgSo3z4uXUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141841023"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2025 16:50:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIc9y-000QoK-2k;
	Fri, 23 May 2025 23:50:42 +0000
Date: Sat, 24 May 2025 07:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 07/59] KVM: SVM: Drop pointless masking of kernel page
 pa's with AVIC HPA masks
Message-ID: <202505240752.btrDAy0X-lkp@intel.com>
References: <20250523010004.3240643-8-seanjc@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523010004.3240643-8-seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3debd5461fba1dcb33e732b16153da0cf5d0c251]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/KVM-x86-Pass-new-routing-entries-and-irqfd-when-updating-IRTEs/20250523-091959
base:   3debd5461fba1dcb33e732b16153da0cf5d0c251
patch link:    https://lore.kernel.org/r/20250523010004.3240643-8-seanjc%40google.com
patch subject: [PATCH v2 07/59] KVM: SVM: Drop pointless masking of kernel page pa's with AVIC HPA masks
config: i386-randconfig-061-20250523 (https://download.01.org/0day-ci/archive/20250524/202505240752.btrDAy0X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240752.btrDAy0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240752.btrDAy0X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/svm/avic.c: note: in included file (through arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/fls64.h:24:20: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)

vim +24 include/asm-generic/bitops/fls64.h

a54baa1487c51c Akinobu Mita           2006-03-26   6  
d57594c203b1e7 Alexander van Heukelum 2008-03-15   7  /**
d57594c203b1e7 Alexander van Heukelum 2008-03-15   8   * fls64 - find last set bit in a 64-bit word
d57594c203b1e7 Alexander van Heukelum 2008-03-15   9   * @x: the word to search
d57594c203b1e7 Alexander van Heukelum 2008-03-15  10   *
d57594c203b1e7 Alexander van Heukelum 2008-03-15  11   * This is defined in a similar way as the libc and compiler builtin
d57594c203b1e7 Alexander van Heukelum 2008-03-15  12   * ffsll, but returns the position of the most significant set bit.
d57594c203b1e7 Alexander van Heukelum 2008-03-15  13   *
d57594c203b1e7 Alexander van Heukelum 2008-03-15  14   * fls64(value) returns 0 if value is 0 or the position of the last
d57594c203b1e7 Alexander van Heukelum 2008-03-15  15   * set bit if value is nonzero. The last (most significant) bit is
d57594c203b1e7 Alexander van Heukelum 2008-03-15  16   * at position 64.
d57594c203b1e7 Alexander van Heukelum 2008-03-15  17   */
d57594c203b1e7 Alexander van Heukelum 2008-03-15  18  #if BITS_PER_LONG == 32
c8399943bdb70f Andi Kleen             2009-01-12  19  static __always_inline int fls64(__u64 x)
2dfc383ad587bb Akinobu Mita           2006-03-26  20  {
2dfc383ad587bb Akinobu Mita           2006-03-26  21  	__u32 h = x >> 32;
2dfc383ad587bb Akinobu Mita           2006-03-26  22  	if (h)
2dfc383ad587bb Akinobu Mita           2006-03-26  23  		return fls(h) + 32;
2dfc383ad587bb Akinobu Mita           2006-03-26 @24  	return fls(x);
2dfc383ad587bb Akinobu Mita           2006-03-26  25  }
d57594c203b1e7 Alexander van Heukelum 2008-03-15  26  #elif BITS_PER_LONG == 64
c8399943bdb70f Andi Kleen             2009-01-12  27  static __always_inline int fls64(__u64 x)
d57594c203b1e7 Alexander van Heukelum 2008-03-15  28  {
d57594c203b1e7 Alexander van Heukelum 2008-03-15  29  	if (x == 0)
d57594c203b1e7 Alexander van Heukelum 2008-03-15  30  		return 0;
d57594c203b1e7 Alexander van Heukelum 2008-03-15  31  	return __fls(x) + 1;
d57594c203b1e7 Alexander van Heukelum 2008-03-15  32  }
d57594c203b1e7 Alexander van Heukelum 2008-03-15  33  #else
d57594c203b1e7 Alexander van Heukelum 2008-03-15  34  #error BITS_PER_LONG not 32 or 64
d57594c203b1e7 Alexander van Heukelum 2008-03-15  35  #endif
2dfc383ad587bb Akinobu Mita           2006-03-26  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
