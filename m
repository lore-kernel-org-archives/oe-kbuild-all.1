Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCA61D9A54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766161991; cv=none; b=p8R9LlvWr5D00WAlAVXxkt4QG3VfVtZEz+cMUB9qlYIIzsB15OAgi9mcRxLDKjSb8nmO0DvkSSD57Zyna2aRpfCHHaMvqYysnvEBSHmBMpm91k1KRjy+CmNJxxUDnZGfElpP7RgWYPsCNUENGBelYQfK8dWNVD3koILFd3i/wS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766161991; c=relaxed/simple;
	bh=DFYXp9QuJ1YvuPHE//FJYuhShsFWQWVnPt5U6b5f1UY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TL++LyTgO7PEEyCw4bsRfx+X2ITTs//SXk0BvOmbUUGIHC+/8YAKmmdCZQ7OYtUzwxEE0cnl4JxcNVwMQWS7Dz7N5FSQCLsQEacEzOhFqofDH/Fnx3vs/AcrRCi/mtYjfGtGTzE2gOYJPwBwWhHurrtJJgqDJjGMwc8WHDKoD98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZQz2mO0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZQz2mO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766161987; x=1797697987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DFYXp9QuJ1YvuPHE//FJYuhShsFWQWVnPt5U6b5f1UY=;
  b=fZQz2mO0N6iNDuK6n5i/pprmEr6jeQOoQnehgi4d+1ZJlHWtKXkCDMAP
   ABa8YSN7rNZLX/LfqXTXM3dVtmM8YcTEBu2JmA3ACktcoQ82omX/JdlxR
   OqB6iYmiPRZ6ZdiJ4X9i37CRHfqMqB30LKDR8rUl3e+NoaBrorOpooym9
   r54i0WRKuKo+0dDcIQkTbinx587lil923rGZFHSXibOPT6ciVUaaaURUX
   4xkegNHP9805C6wjB7sOUIPXcGM94PPzs2xXfIWDTLMYuErKT7xXQZedh
   +zAWICwlHsmLwGN1a5xuFX/cfnljorozSh27g7A5r6a6VXaeFnUcE81ps
   A==;
X-CSE-ConnectionGUID: Y/c+W+9XT3uzSS3f9U20Bg==
X-CSE-MsgGUID: QyVrjBq7TGaI6p7FGbr29g==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78837018"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="78837018"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 08:33:03 -0800
X-CSE-ConnectionGUID: P4R7U3wQQeC+jGBRn/WlTw==
X-CSE-MsgGUID: ESiAVX/0TRCHsE/pQ1hGbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="199144975"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Dec 2025 08:33:03 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWdPY-000000003k1-252J;
	Fri, 19 Dec 2025 16:33:00 +0000
Date: Sat, 20 Dec 2025 00:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1]
 drivers/cpufreq/amd-pstate.c:104: warning: Function parameter or member
 'req' not described in 'amd_cpudata'
Message-ID: <202512200014.uDRL9fG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Huang,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7d06d639106cda70074fdaa0e0910c92274e47fc
commit: d86c89cda7bc4b35fa412bc53f8656eeee39a73c [0/1] cpufreq: amd-pstate: Add boost mode support for AMD P-State
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251220/202512200014.uDRL9fG2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200014.uDRL9fG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200014.uDRL9fG2-lkp@intel.com/

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
