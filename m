Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A61A7253
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742770395; cv=none; b=nL6gS2AWOydkRvq0TpS0J1if3dlk3o9nb5bXcEaQa2SjZGlfUgcX9RLQkCb3LnbXckyfSO/fHCwl5HN5mjdffRcqpqFG/mrvNyToHJNd3h2FPfDXVdoYghKVKBzHD1VxeUUZ8072Wu7N7G/sZzuHAvzscbCe6y8IUvbv4Tn6I9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742770395; c=relaxed/simple;
	bh=KhSk1Wvn41RLE8OuIrS/dgnj4mzOEt2b86JUmA1AdQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFE/ERShXjzutXMegza1ExhVgdvjKvi+GR7PRbHDCsm7RSq0cF83TrajsGi/aufFV/GoNsdbfSxiC9nym5kGvfDKmjPUUV+xkAfpgiOgSBmfNs8S00j94FbxL3iAzg+sex1tRrGzHw18bbx7YxxHh37VWm+iRXJaOTPW5znkP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jrlzl7/w; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jrlzl7/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742770394; x=1774306394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhSk1Wvn41RLE8OuIrS/dgnj4mzOEt2b86JUmA1AdQU=;
  b=Jrlzl7/wMcpm8t9xkDupmIc05NQ0wkz1BpS0GB6WgxQqOWTGloCJgNgh
   cQAr7O1SNXa8UaDVT73n2KAwDPwjIYIPLorBL5gz3ZU0vT+N2rnZJf+L9
   yTB/ORKeWPa0QVvu8smi9+tG28gspizeZbYwhBWFEtJ9j08BPdf7bhxKz
   GU/NDmGxP7meEc4K/xtLGbqYtrzmqSiqmwUuLA3awKREUG9C6eMeQp5Tf
   0yMew1clWkHfaUH5k+FlIbSalfNCg95r9VCrGfJuCR/bCrIPTKmvBBPuv
   wbfsNdD0xXQVwkb4uw17qBeVoLhPvOBHh4sfzm9zjXG4QIGXwOu3HViAF
   Q==;
X-CSE-ConnectionGUID: n1MaN8z+RJq4bGUbATo0Iw==
X-CSE-MsgGUID: eU/HCoxuQEe+28Iv5BWGcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43126623"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="43126623"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 15:53:11 -0700
X-CSE-ConnectionGUID: +0cn+hIKQ8iIclIM6QNmXg==
X-CSE-MsgGUID: Fg+EMCiuSdiFWevV8B18Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="154783741"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2025 15:53:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twUBm-0002zq-0f;
	Sun, 23 Mar 2025 22:53:06 +0000
Date: Mon, 24 Mar 2025 06:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sahil Siddiq <icegambit91@gmail.com>, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, sahilcdq@proton.me,
	linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] openrisc: Add cacheinfo support
Message-ID: <202503240635.ir63jqTI-lkp@intel.com>
References: <20250323195544.152948-4-sahilcdq@proton.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323195544.152948-4-sahilcdq@proton.me>

Hi Sahil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea1413e5b53a8dd4fa7675edb23cdf828bbdce1e]

url:    https://github.com/intel-lab-lkp/linux/commits/Sahil-Siddiq/openrisc-Refactor-struct-cpuinfo_or1k-to-reduce-duplication/20250324-035738
base:   ea1413e5b53a8dd4fa7675edb23cdf828bbdce1e
patch link:    https://lore.kernel.org/r/20250323195544.152948-4-sahilcdq%40proton.me
patch subject: [PATCH v3 3/3] openrisc: Add cacheinfo support
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250324/202503240635.ir63jqTI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503240635.ir63jqTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503240635.ir63jqTI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/openrisc/kernel/setup.c: In function 'show_cpuinfo':
>> arch/openrisc/kernel/setup.c:266:30: warning: unused variable 'cpuinfo' [-Wunused-variable]
     266 |         struct cpuinfo_or1k *cpuinfo = v;
         |                              ^~~~~~~


vim +/cpuinfo +266 arch/openrisc/kernel/setup.c

9d02a4283e9ce4 Jonas Bonn          2011-06-04  260  
9d02a4283e9ce4 Jonas Bonn          2011-06-04  261  static int show_cpuinfo(struct seq_file *m, void *v)
9d02a4283e9ce4 Jonas Bonn          2011-06-04  262  {
8e6d08e0a15e7d Stefan Kristiansson 2014-05-11  263  	unsigned int vr, cpucfgr;
8e6d08e0a15e7d Stefan Kristiansson 2014-05-11  264  	unsigned int avr;
8e6d08e0a15e7d Stefan Kristiansson 2014-05-11  265  	unsigned int version;
8e6d08e0a15e7d Stefan Kristiansson 2014-05-11 @266  	struct cpuinfo_or1k *cpuinfo = v;
9d02a4283e9ce4 Jonas Bonn          2011-06-04  267  
9d02a4283e9ce4 Jonas Bonn          2011-06-04  268  	vr = mfspr(SPR_VR);
8e6d08e0a15e7d Stefan Kristiansson 2014-05-11  269  	cpucfgr = mfspr(SPR_CPUCFGR);
8e6d08e0a15e7d Stefan Kristiansson 2014-05-11  270  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
