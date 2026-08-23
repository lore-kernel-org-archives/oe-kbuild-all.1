Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF44280018
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 20:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787517119; cv=none; b=I9RT8iLr46h2stnd9zdwoGQdf9zGnMB7rQtAaKNV1nNfm5EBEABkTajI4J/0B+d3AwR2duKDvI4IDO6O+wXsIPQqMq+4tq0Yf8Quvq26bTny2DQO9A71nio9IS4yvpuj7I51SsUCcZFMSA4IsW7Zn0MZ8hWWIQG91iY12lT+xLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787517119; c=relaxed/simple;
	bh=jidQnXzQ3Lyw8kGPZHe0o+30lp6PwsZ95HkAyZIU89I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVuqo8CF+eM8/y3BJI6pCBwXuMXQtn6eC89LEsDFkmFvDtdp91x51A7ipg83cifMWvQPZ/rIWOoayjrv0AyvNWZXXwe0ggWj7IjSxcBxOOeI5oBy+E/gmGhL6IzFxq8C+FvKCL4sooAnrLRqJDDGqbINYf7W7GpiUE6Cqddh4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN5HRBoB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN5HRBoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787517117; x=1819053117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jidQnXzQ3Lyw8kGPZHe0o+30lp6PwsZ95HkAyZIU89I=;
  b=PN5HRBoBU89RCoAm43wuGpRg0JlZphjokYNR6dL9u0PweFOibrYoSd7W
   PeZoZ2oFG2ipNJ6Tfq1DmAsRfJ3EH3PaMmTXPlxviMOhiG/krFurbndB1
   yM3Qp+PdIA+0HzJtJf6ynbuFi1dnRQ6hqsGxlv9RgbAvTCwVuXC77ASnW
   ilzvIiu5rcYxwhquoW/4JPHzQMvjihwMJHm91zQBJq6y7HzbUyEWVNUrP
   rZKdkJybHz3N4W0QSBKLDMseyiINxacj3fGRzsC7hn/ubWB4o9pBxh3+6
   crBXa5ARjVfBme4zkmBUXjAWfhMF9Pn5M8BgmsFdbdpiH1HT7ZSUOH3wH
   w==;
X-CSE-ConnectionGUID: a5bDfjo4TcWe1y11HLp6pQ==
X-CSE-MsgGUID: 74wJ7IXBRBCjuCb9aC4g/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87897026"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="87897026"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 13:31:57 -0700
X-CSE-ConnectionGUID: jCX7CDjsSp+tUaOvzFFCow==
X-CSE-MsgGUID: d5mPtgd8RYiuW69hsVdffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="290352896"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2026 13:31:55 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyEr4-0000000019T-2XH8;
	Sun, 23 Aug 2026 20:31:49 +0000
Date: Mon, 24 Aug 2026 04:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Borislav Petkov <bp@kernel.org>, X86 <x86@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] x86/CPU/AMD: Fix Zen5 TLB sizes reporting
Message-ID: <202608240450.3JNf2siz-lkp@intel.com>
References: <20260821022031.946311-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821022031.946311-1-bp@kernel.org>

Hi Borislav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master v7.2 next-20260821]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Borislav-Petkov/x86-CPU-AMD-Fix-Zen5-TLB-sizes-reporting/20260820-192031
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260821022031.946311-1-bp%40kernel.org
patch subject: [PATCH] x86/CPU/AMD: Fix Zen5 TLB sizes reporting
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608240450.3JNf2siz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240450.3JNf2siz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240450.3JNf2siz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/common.c: In function 'cpu_detect_cache_sizes':
>> arch/x86/kernel/cpu/common.c:860:55: warning: variable 'shift' set but not used [-Wunused-but-set-variable]
     860 |         unsigned int n, dummy, ebx, ecx, edx, l2size, shift;
         |                                                       ^~~~~


vim +/shift +860 arch/x86/kernel/cpu/common.c

   857	
   858	void cpu_detect_cache_sizes(struct cpuinfo_x86 *c)
   859	{
 > 860		unsigned int n, dummy, ebx, ecx, edx, l2size, shift;
   861	
   862		n = c->extended_cpuid_level;
   863	
   864		if (n >= 0x80000005) {
   865			cpuid(0x80000005, &dummy, &ebx, &ecx, &edx);
   866			c->x86_cache_size = (ecx>>24) + (edx>>24);
   867	#ifdef CONFIG_X86_64
   868			/* On K8 L1 TLB is inclusive, so don't count it */
   869			c->x86_tlbsize = 0;
   870	#endif
   871		}
   872	
   873		if (n < 0x80000006)	/* Some chips just has a large L1. */
   874			return;
   875	
   876		cpuid(0x80000006, &dummy, &ebx, &ecx, &edx);
   877		l2size = ecx >> 16;
   878		shift = !!cpu_has(c, X86_FEATURE_L2_TLB_SIZE_X32) * 5;
   879	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
