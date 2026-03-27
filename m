Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5A28C037
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 00:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774573001; cv=none; b=SOYmpyG3Dwa1eo7GeoHR88+LdI7dncPv1XHaGrtu0VJV3RylHVKOEM7V2/jV1HRkQv+iM6zbULk/xnfue0NlRtrCGcoMw2lLpXHNWNq/0uqpPwq/21E+KpYCkyMPN6jYt1ln/hBKgQT+lBijuSPJHDtI0MNmKRtPDf9bocfAefU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774573001; c=relaxed/simple;
	bh=P/gsTDeg+GZA7GnMedAr9Cl3dAhB/jIs6Nq7DT/QGoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6hetMCAr0caJ1klNMyINjnS5/P4Dbww697TKq4o1TNWN/4ipsjiuEFE+uAonoJlqu2cHZtQomuwGbzgPZyIL+cziRwTTryZFZbTiKbLwvq9WcUfEKdEBmvho+6jdlUM4ChOZ6xYNTtZm5QaLHhBk3whBrwfIhGG8YyNeX1tv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUWLn5az; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUWLn5az"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774573000; x=1806109000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P/gsTDeg+GZA7GnMedAr9Cl3dAhB/jIs6Nq7DT/QGoI=;
  b=CUWLn5azBZiIXL5cVO2s2ZcDYDwslaX6sYPpyYf/LP1JOdT1e9rb28zo
   xj7CvqGufGSmEMKP5jdd/2hnNJp8e+3TwqQyxA2k54Px1yArQXCi+DxFT
   hWsCSaD9o8glbkkyfjjJnJh8gwsA24h9Od4/wyOpHku37lhewGWpJ+m0c
   ugnCuWqKsNYonTqmZIwEBL5jwnYkCbjazYOinFYT50x+X8jr9CHeITz1f
   d3Q/6XdzHFJVRAJYWkWEgBaQM9oSe31faH2RANaT9Iw15KhOP8MhwG7lp
   FsVj0FvD3K/3GWVvLEAfEtoXPV0RCagum6rBjM27W+Ei1pb1BL61+d5rO
   w==;
X-CSE-ConnectionGUID: XgtlhjYSQfeYwOy8Mluniw==
X-CSE-MsgGUID: 0uc3tcE0SuaDvjQ2fLq9Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86721506"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="86721506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 17:56:37 -0700
X-CSE-ConnectionGUID: C2oE1qQ+Rve2Gbhx3J7vsg==
X-CSE-MsgGUID: GGZfUlcBT7Kh+DMiNy/BRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="226792303"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2026 17:56:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5vV3-000000009bh-1g0S;
	Fri, 27 Mar 2026 00:56:33 +0000
Date: Fri, 27 Mar 2026 08:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v6 4/5] mm: pghot: Precision mode for pghot
Message-ID: <202603270818.HEu7dmHY-lkp@intel.com>
References: <20260323095104.238982-5-bharata@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323095104.238982-5-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on a989fde763f4f24209e4702f50a45be572340e68]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA/20260325-092849
base:   a989fde763f4f24209e4702f50a45be572340e68
patch link:    https://lore.kernel.org/r/20260323095104.238982-5-bharata%40amd.com
patch subject: [RFC PATCH v6 4/5] mm: pghot: Precision mode for pghot
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270818.HEu7dmHY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270818.HEu7dmHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270818.HEu7dmHY-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pghot-precise.c: In function 'pghot_nid_valid':
   mm/pghot-precise.c:17:20: error: 'NUMA_NO_NODE' undeclared (first use in this function)
      17 |         if (nid != NUMA_NO_NODE && (nid < 0 || nid >= PGHOT_NID_MAX))
         |                    ^~~~~~~~~~~~
   mm/pghot-precise.c:17:20: note: each undeclared identifier is reported only once for each function it appears in
   In file included from mm/pghot-precise.c:9:
   mm/pghot-precise.c: In function 'pghot_access_latency':
   include/linux/pghot.h:59:41: error: implicit declaration of function 'GENMASK' [-Wimplicit-function-declaration]
      59 | #define PGHOT_TIME_MASK                 GENMASK(PGHOT_TIME_WIDTH - 1, 0)
         |                                         ^~~~~~~
   mm/pghot-precise.c:25:53: note: in expansion of macro 'PGHOT_TIME_MASK'
      25 |         return jiffies_to_msecs((time - old_time) & PGHOT_TIME_MASK);
         |                                                     ^~~~~~~~~~~~~~~
   mm/pghot-precise.c: In function 'pghot_update_record':
   mm/pghot-precise.c:33:23: error: 'NUMA_NO_NODE' undeclared (first use in this function)
      33 |         nid = (nid == NUMA_NO_NODE) ? pghot_target_nid : nid;
         |                       ^~~~~~~~~~~~
>> mm/pghot-precise.c:62:36: error: implicit declaration of function 'BIT' [-Wimplicit-function-declaration]
      62 |                         hotness |= BIT(PGHOT_MIGRATE_READY);
         |                                    ^~~
   In file included from include/linux/jump_label.h:77,
                    from include/linux/static_key.h:1,
                    from include/linux/pghot.h:13:
>> mm/pghot-precise.c:63:28: error: implicit declaration of function 'try_cmpxchg' [-Wimplicit-function-declaration]
      63 |         } while (unlikely(!try_cmpxchg(phi, &old_hotness, hotness)));
         |                            ^~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^


vim +/BIT +62 mm/pghot-precise.c

    27	
    28	bool pghot_update_record(phi_t *phi, int nid, unsigned long now)
    29	{
    30		phi_t freq, old_freq, hotness, old_hotness, old_time;
    31		phi_t time = now & PGHOT_TIME_MASK;
    32	
    33		nid = (nid == NUMA_NO_NODE) ? pghot_target_nid : nid;
    34		old_hotness = READ_ONCE(*phi);
    35	
    36		do {
    37			bool new_window = false;
    38	
    39			hotness = old_hotness;
    40			old_freq = (hotness >> PGHOT_FREQ_SHIFT) & PGHOT_FREQ_MASK;
    41			old_time = (hotness >> PGHOT_TIME_SHIFT) & PGHOT_TIME_MASK;
    42	
    43			if (pghot_access_latency(old_time, time) > sysctl_pghot_freq_window)
    44				new_window = true;
    45	
    46			if (new_window)
    47				freq = 1;
    48			else if (old_freq < PGHOT_FREQ_MAX)
    49				freq = old_freq + 1;
    50			else
    51				freq = old_freq;
    52	
    53			hotness &= ~(PGHOT_NID_MASK << PGHOT_NID_SHIFT);
    54			hotness &= ~(PGHOT_FREQ_MASK << PGHOT_FREQ_SHIFT);
    55			hotness &= ~(PGHOT_TIME_MASK << PGHOT_TIME_SHIFT);
    56	
    57			hotness |= (nid & PGHOT_NID_MASK) << PGHOT_NID_SHIFT;
    58			hotness |= (freq & PGHOT_FREQ_MASK) << PGHOT_FREQ_SHIFT;
    59			hotness |= (time & PGHOT_TIME_MASK) << PGHOT_TIME_SHIFT;
    60	
    61			if (freq >= pghot_freq_threshold)
  > 62				hotness |= BIT(PGHOT_MIGRATE_READY);
  > 63		} while (unlikely(!try_cmpxchg(phi, &old_hotness, hotness)));
    64		return !!(hotness & BIT(PGHOT_MIGRATE_READY));
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
