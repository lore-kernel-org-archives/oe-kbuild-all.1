Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75F31DF269
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616290; cv=none; b=b9v7pLMP4BDY3Gf8HQyKqJ/mhNf8NmqeultflDDjZaoQHjA/PEFhDXzGtTjJxl8pPUz4blCr3lT8qk+ymYmljwZHrAerfuNceNIPfVGWyaidsAt8vx6GlToNgwETtLw+RwYcxJezCV6mh209SFf4ipKVSYeP7IE72Bhr5wYppGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616290; c=relaxed/simple;
	bh=3GgqcjxuKlszhp/cv+H/LtI3cyOYeCFw3Y5GhFeAWTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLaJywN1HGbfco53k424Aq4AY591wGr1Pqd+TNxg/7uo0J499o7Q1xV8V1yOsRGwbJMYU2jolTDXYwXVuun0DbeuBCbNL/OPODts1u9CUNzCepAPFa/ZNgVghlqQhyHPtcrvp2vLPJZ95fHZqjCXlRfMe9NZW1bP0gtUsjpQc5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/WRYQxx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/WRYQxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746616289; x=1778152289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3GgqcjxuKlszhp/cv+H/LtI3cyOYeCFw3Y5GhFeAWTY=;
  b=I/WRYQxxc5hLU3Rl0coNrwh5G3Ul1Q4v4Ur213oQYBimpBRZBAMPRQ3K
   3HbMaFcFGDNib3kocuS6rZp6KYPkYfawnr81i/+ty11oOOEs6M+/y+ClA
   dNBhiSrB4at1wXOIPL4qQy9IINYzsNsylbHNOLhvxNcc4gwrUTd2qC4JS
   7aSkSHoU93HIiNToYHGh8lk1KaLtulJr5+blyKaoXWld+LOmTyIlo5VEv
   gw7qMkQDvUwemFu7nTwgoc2LFmqoade7rpVAyYzsidEAZK3F9FB5+7bt5
   r1qzoJqXQK1i0CFV2CIXSYxZHfSWvfR/kPfRgzlUZ6YjzhkuVal9g4UbS
   A==;
X-CSE-ConnectionGUID: 1Qwl4/plSbyrHkEilM47LA==
X-CSE-MsgGUID: R46XXFTESCKZ4cZxdjdM1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48475451"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48475451"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:11:28 -0700
X-CSE-ConnectionGUID: 0q+jlvqwS/6/pjAXeMK9OQ==
X-CSE-MsgGUID: q5SVS9pcT+uWyWADKEfMxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140671940"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 04:11:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcgN-0007er-2i;
	Wed, 07 May 2025 11:11:23 +0000
Date: Wed, 7 May 2025 19:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, npiggin@gmail.com, naveen@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 4/6] powerpc: fix sparse warnings
Message-ID: <202505071806.OPozZjqi-lkp@intel.com>
References: <20250422131040.374427-5-maddy@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422131040.374427-5-maddy@linux.ibm.com>

Hi Madhavan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes powerpc/topic/ppc-kvm linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-kvm-Fix-sparse-warning/20250422-211309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250422131040.374427-5-maddy%40linux.ibm.com
patch subject: [PATCH 4/6] powerpc: fix sparse warnings
config: powerpc64-randconfig-r053-20250424 (https://download.01.org/0day-ci/archive/20250507/202505071806.OPozZjqi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071806.OPozZjqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071806.OPozZjqi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/btext.c:43:22: warning: unused variable 'disp_BAT' [-Wunused-variable]
      43 | static unsigned long disp_BAT[2] __initdata = {0, 0};
         |                      ^~~~~~~~
   1 warning generated.


vim +/disp_BAT +43 arch/powerpc/kernel/btext.c

    42	
  > 43	static unsigned long disp_BAT[2] __initdata = {0, 0};
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
