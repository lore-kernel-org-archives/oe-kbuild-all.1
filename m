Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD33B661
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050147; cv=none; b=qi5l886WMYLbSykKMwDv2jmhb94bfVqixX2W8nSFEFytY0m699yE6sxwszEMMFWGp2lt3qcBOEn9Stm4V2GM2qqIRnB5Yn0Eiq7ENXcuOgBSprpqVX5040s/oLlri/OPkLn+GAzc064crIRNueBRzHJ80LA88jCAAGkvbG0Uq/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050147; c=relaxed/simple;
	bh=4dzf4BgulpOVhuLxUHDVKjDNXVzii21Vod2bFdwiaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXqVw1X0a+4hJXb78s1wpDW1oyTpNjWv/Qjn+/qDJNiD1CzEJ1TAij053NXzvN9wWFPGrUxU04YYw2zMIvUXW08J/I2/hdJT0VTpDXLUdUoM42ldc5u12es0RG1B1SkjF5210IOTx4mUxlEOQ8IPX8DWLZtDAzH3kQlWC58GfOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fk69vtzv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fk69vtzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758050145; x=1789586145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4dzf4BgulpOVhuLxUHDVKjDNXVzii21Vod2bFdwiaLM=;
  b=Fk69vtzv6bTRXCVj8FDt/LTTIt940GeWiBa8p5ZiY1mGmAcdJBqrZaI1
   y6QJMiWuhicNgaFtGXL4t/ERLt0mO7NdNNZXBNsXBeLmlcWyXphPAf6KK
   RSvpNmt6qguzVFBpy9d7rbpUqM7RiwfnxYZvYuDCjhxCszwdNTPEy+4dp
   dxrEHvnAhdFO4jY+9LdtenVyyU/04F8wK5+bDx2hKAD1DT2SShuvvYgiL
   1g2Kx07GPPZ4cz+c3Rek/Fm59AXBLT9xpFmXwPR0xIFs2IxnWVNsWRBBh
   s3oef6tGrpKL/n7FqTsP6dlB8HbJpMHY/jVnkamEnOqj8xaGv8vtAiIlL
   A==;
X-CSE-ConnectionGUID: i/USWkENRfWP4f6ow7cLrQ==
X-CSE-MsgGUID: PaOUm1RTTperkiwvtV/VSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60037455"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="60037455"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 12:15:45 -0700
X-CSE-ConnectionGUID: Acjvlx+6QVqUyJF3O0ItXA==
X-CSE-MsgGUID: JVQGj2DrQROhw6Gh/dre6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174961608"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Sep 2025 12:15:44 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyb9R-0000g7-2j;
	Tue, 16 Sep 2025 19:15:41 +0000
Date: Wed, 17 Sep 2025 03:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 03/12] mm/cma: add flags argument to init functions
Message-ID: <202509170246.vvYGbLGy-lkp@intel.com>
References: <20250915195153.462039-4-fvdl@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915195153.462039-4-fvdl@google.com>

Hi Frank,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes powerpc/topic/ppc-kvm s390/features trace/for-next linus/master v6.17-rc6 next-20250916]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-van-der-Linden/mm-cma-add-tunable-for-CMA-fallback-limit/20250916-035514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250915195153.462039-4-fvdl%40google.com
patch subject: [RFC PATCH 03/12] mm/cma: add flags argument to init functions
config: i386-buildonly-randconfig-001-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170246.vvYGbLGy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170246.vvYGbLGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170246.vvYGbLGy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/cma.c:271 function parameter 'flags' not described in 'cma_init_reserved_mem'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
