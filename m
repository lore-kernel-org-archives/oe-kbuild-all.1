Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0AD24EF9F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741187935; cv=none; b=pDDR/RavV5VqOFs9gnURMaG/cGuQT77Czr7kbPqU8RtdUdqJ36Hn9vZfrvogGrDUx9FvFU07vDH+7alKPnGer4Nifj09I7C0cBKUvtp3gNdUKvshkyjHe+PeZEuHi0dLF+ROfGqQxPaf4PlAHSoZbG+vS0cyy1W07iLCttOnMas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741187935; c=relaxed/simple;
	bh=06z2MfmCLKWa5lyCd9myqG9VE/urHoRFK8MhaqA9aCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxLlEfftxgxvBcCg8i/3kILUxApstH5GUkwfFnbkXOwDUD9bRpXx+ZEGEkrXgtg+nQMUyl+b3pIMzFeiBWqy+ea2IFLmh7S55eGZeBQ6tuXz7TliE1VNfJ3YK9TGzOBS7ddiyCH1mK312oXnr03P8Rp3Jw+uy+0MaGFpikXGww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ha3fGy9x; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ha3fGy9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741187933; x=1772723933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06z2MfmCLKWa5lyCd9myqG9VE/urHoRFK8MhaqA9aCE=;
  b=Ha3fGy9xqnPelQOcdC8pCWBqtK9kC25vae5CPpe3OWZWDZ+PhHMk6kI+
   RWo2TOArTbon20IB6FJnQqscvqn/PbLWSQvHAufE66l9ER6hzXP6dcLmw
   mwt5x/UPYiPmSTHF0lMiUaGEXubzOfEQDmpqLllwt3e8iGuhZwhO3HVeP
   MEz5o71ZkxZtNTFiB2Imof/S9aARvq4dFzatO8FnrElTPHU0oZGEwg2hN
   OyDR2vZbUApseG+u0/466t+m6W+5yClS89ZZ0RZesKgSBZ1/Om5eJbCKP
   gIwX50j9Cq7KO6oHtKCZQeD+NojQ2GnZIhppdhv/aeBZW0E350DnKeQ1d
   w==;
X-CSE-ConnectionGUID: x/EShwXUSUOI0UWOvICV0w==
X-CSE-MsgGUID: f6CBm/cWSSydy8ChK+NcHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29737365"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="29737365"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 07:18:53 -0800
X-CSE-ConnectionGUID: s0R+h2iwQbKhtm5ktvU1QQ==
X-CSE-MsgGUID: tdBNK4yASl6bJXAaZ2lFIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="123816758"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2025 07:18:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpqWH-000L8e-23;
	Wed, 05 Mar 2025 15:18:49 +0000
Date: Wed, 5 Mar 2025 23:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 drivers/cpufreq/amd-pstate.c:104: warning: Function parameter or member
 'req' not described in 'amd_cpudata'
Message-ID: <202503052358.NxtHGOSU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Huang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   9617212effd9a3b60c088190776217de5db549a4
commit: d86c89cda7bc4b35fa412bc53f8656eeee39a73c [1/1] cpufreq: amd-pstate: Add boost mode support for AMD P-State
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250305/202503052358.NxtHGOSU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503052358.NxtHGOSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503052358.NxtHGOSU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate.c:104: warning: Function parameter or member 'req' not described in 'amd_cpudata'
>> drivers/cpufreq/amd-pstate.c:104: warning: Function parameter or member 'boost_supported' not described in 'amd_cpudata'


vim +104 drivers/cpufreq/amd-pstate.c

174aa8cb9d486e Huang Rui 2021-12-24   67  
174aa8cb9d486e Huang Rui 2021-12-24   68  /**
174aa8cb9d486e Huang Rui 2021-12-24   69   * struct amd_cpudata - private CPU data for AMD P-State
174aa8cb9d486e Huang Rui 2021-12-24   70   * @cpu: CPU number
174aa8cb9d486e Huang Rui 2021-12-24   71   * @cppc_req_cached: cached performance request hints
174aa8cb9d486e Huang Rui 2021-12-24   72   * @highest_perf: the maximum performance an individual processor may reach,
174aa8cb9d486e Huang Rui 2021-12-24   73   *		  assuming ideal conditions
174aa8cb9d486e Huang Rui 2021-12-24   74   * @nominal_perf: the maximum sustained performance level of the processor,
174aa8cb9d486e Huang Rui 2021-12-24   75   *		  assuming ideal operating conditions
174aa8cb9d486e Huang Rui 2021-12-24   76   * @lowest_nonlinear_perf: the lowest performance level at which nonlinear power
174aa8cb9d486e Huang Rui 2021-12-24   77   *			   savings are achieved
174aa8cb9d486e Huang Rui 2021-12-24   78   * @lowest_perf: the absolute lowest performance level of the processor
174aa8cb9d486e Huang Rui 2021-12-24   79   * @max_freq: the frequency that mapped to highest_perf
174aa8cb9d486e Huang Rui 2021-12-24   80   * @min_freq: the frequency that mapped to lowest_perf
174aa8cb9d486e Huang Rui 2021-12-24   81   * @nominal_freq: the frequency that mapped to nominal_perf
174aa8cb9d486e Huang Rui 2021-12-24   82   * @lowest_nonlinear_freq: the frequency that mapped to lowest_nonlinear_perf
174aa8cb9d486e Huang Rui 2021-12-24   83   *
174aa8cb9d486e Huang Rui 2021-12-24   84   * The amd_cpudata is key private data for each CPU thread in AMD P-State, and
174aa8cb9d486e Huang Rui 2021-12-24   85   * represents all the attributes and goals that AMD P-State requests at runtime.
174aa8cb9d486e Huang Rui 2021-12-24   86   */
174aa8cb9d486e Huang Rui 2021-12-24   87  struct amd_cpudata {
174aa8cb9d486e Huang Rui 2021-12-24   88  	int	cpu;
174aa8cb9d486e Huang Rui 2021-12-24   89  
d86c89cda7bc4b Huang Rui 2021-12-24   90  	struct	freq_qos_request req[2];
174aa8cb9d486e Huang Rui 2021-12-24   91  	u64	cppc_req_cached;
174aa8cb9d486e Huang Rui 2021-12-24   92  
174aa8cb9d486e Huang Rui 2021-12-24   93  	u32	highest_perf;
174aa8cb9d486e Huang Rui 2021-12-24   94  	u32	nominal_perf;
174aa8cb9d486e Huang Rui 2021-12-24   95  	u32	lowest_nonlinear_perf;
174aa8cb9d486e Huang Rui 2021-12-24   96  	u32	lowest_perf;
174aa8cb9d486e Huang Rui 2021-12-24   97  
174aa8cb9d486e Huang Rui 2021-12-24   98  	u32	max_freq;
174aa8cb9d486e Huang Rui 2021-12-24   99  	u32	min_freq;
174aa8cb9d486e Huang Rui 2021-12-24  100  	u32	nominal_freq;
174aa8cb9d486e Huang Rui 2021-12-24  101  	u32	lowest_nonlinear_freq;
d86c89cda7bc4b Huang Rui 2021-12-24  102  
d86c89cda7bc4b Huang Rui 2021-12-24  103  	bool	boost_supported;
174aa8cb9d486e Huang Rui 2021-12-24 @104  };
174aa8cb9d486e Huang Rui 2021-12-24  105  

:::::: The code at line 104 was first introduced by commit
:::::: 174aa8cb9d486ed632ed6d6bbbafe39306f1a7f7 cpufreq: amd-pstate: Introduce a new AMD P-State driver to support future processors

:::::: TO: Huang Rui <ray.huang@amd.com>
:::::: CC: Xunlei Pang <xlpang@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
