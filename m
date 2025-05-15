Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B57E29A9F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310798; cv=none; b=gwUgr3+P0yxIJVXKhHJ1OlHCkf61gaE1yOqq2ASxKB/pEzqEnRvHuesbYYFwIVbuDgR0iZ6XoMIvU3sM1usp7vRlUxRw6gxYHA99dM3KjEnWnH6hdw8fgDWL+oHNcwaRerS19RVstUkQITZNPVCcsj0AFJQDNskjXbvxsPRzlY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310798; c=relaxed/simple;
	bh=RPw4bWY2eDaukMu5UsX71j/dyZC90gVLqB6qDf8/haI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ap+NteFNmSP+XAccYdhV14rbCB5Z8bu4D0DznBUkb6v8l8Q3j99Wf+rV8Ychv4W3y9ltnDiKrzZ+t/CNQeeO42SGbCu8Ac4imYrH+6TCw8T72Qy2xLFhzHPbqSKIlMAUvi0VKloGfBdrKKgkFfutjoCi5FaEw1O+YAJz1bwIgvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CG/ej8kg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CG/ej8kg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747310796; x=1778846796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RPw4bWY2eDaukMu5UsX71j/dyZC90gVLqB6qDf8/haI=;
  b=CG/ej8kgqacxz2at+viU2jJRdIPfsFOUJznSLGcZeaiLPPrBEZsPAwyS
   CRM/pytAMyPLaz0vtwTh0v2KVLEQydAqnppNj+4MZUMIVaRIqzlPAJ9DI
   bEXhGt/0zHPzTaVgPtidutSAq8lpP4ZeEqgAk4eXcfnmASE/H465meUxX
   JVworM5nQc2MLE1T4LZYJCD/mHehmweD7Ms/Ox8NQpC0ds5nMF6VR6VTm
   GaB7wPoN7wfP4QthKPLB0740yVn064jLDb8/w0Xf6kTmBKMuDa3SsyGQS
   G7u/W29oDmSVvmbKUnWhSf+/OZI55OXwfXPPEaIeN15Kj+zNbp5zePm9I
   Q==;
X-CSE-ConnectionGUID: MSXdi/6eStOXIX/ZixosIw==
X-CSE-MsgGUID: 3CuPgmeDRYe/LZB7DU/NCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49401340"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49401340"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:06:35 -0700
X-CSE-ConnectionGUID: rlL8D/fcQUia/VZ9ZlH4Jg==
X-CSE-MsgGUID: xqXsZT9BQviMLKDGvIXMUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143116679"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2025 05:06:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFXM8-000ILr-23;
	Thu, 15 May 2025 12:06:32 +0000
Date: Thu, 15 May 2025 20:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10914/11408] fair.c:undefined reference to
 `__lshrti3'
Message-ID: <202505152053.FrKekjCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   484803582c77061b470ac64a634f25f89715be3f
commit: c66d7ebbe2fa14e41913adb421090a7426f59786 [10914/11408] crypto: powerpc/poly1305 - Add SIMD fallback
config: powerpc64-randconfig-002-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152053.FrKekjCe-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152053.FrKekjCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505152053.FrKekjCe-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: kernel/sched/fair.o: in function `calc_delta_fair':
>> fair.c:(.text+0x2224): undefined reference to `__lshrti3'
   powerpc64-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_safe':
>> timekeeping.c:(.text+0x108): undefined reference to `__lshrti3'
   powerpc64-linux-ld: kernel/time/clocksource.o: in function `cycles_to_nsec_safe':
>> clocksource.c:(.text+0xa4): undefined reference to `__lshrti3'
   powerpc64-linux-ld: lib/ubsan.o: in function `get_signed_val':
>> ubsan.c:(.text+0x1f8): undefined reference to `__ashlti3'
>> powerpc64-linux-ld: ubsan.c:(.text+0x204): undefined reference to `__ashrti3'
   powerpc64-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_cpg_pll_clk_recalc_rate':
>> rzg2l-cpg.c:(.text+0x820): undefined reference to `__lshrti3'
   powerpc64-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_pll_clk_recalc_rate':
>> rzv2h-cpg.c:(.text+0x3e8): undefined reference to `__lshrti3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
