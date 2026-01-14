Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790CB231A30
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 02:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768357567; cv=none; b=HVIemwU1Q5UyAxuxlAVTg5NhirPRnDUD+XyGGXRmxQ3qgT0r2krNH0Svmu6DW7wUvMD+AhQjpV4Z6bjxlziRXWvH/KzMpsyPAFAg0bCAcjkVpoVSyU5N8XOXSxHIHDnHGT1p1RlLx3AGdKA4YnEDBCMmbca+qbBuA0kDqf9maRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768357567; c=relaxed/simple;
	bh=6FGNX7SUC1hVI0mJ4eI4bbSwWtwvzYUDN6Xf105OGeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyHFLQflUGj1hvE/ygDZkW8r+ZJfiUnneMbyUeermqq3SCl16/mQDHa7Z69h2/Q/W61pml7jb75uHb24YTizdsN28dOiL6LAFrCAGswPeW31L6OBMEaqu2oV8S0BCx+6jZNxPP26zAHk8t1VnBwzrAsAfh1StDgkQR7f+t4JOPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mo4sUQdl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mo4sUQdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768357565; x=1799893565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6FGNX7SUC1hVI0mJ4eI4bbSwWtwvzYUDN6Xf105OGeg=;
  b=mo4sUQdlCVQ+Xzp8u4R/W/AFpVvOjgKPc6P5awwUQ55rEpbJo8uGr/G8
   KyE3xvMQW0rMw3/xFvJeOLaYx1ox17prxk47BBuBr+1QNoKI5dRWAaGyv
   dA3J2jlKqepOK0D4Qwe9ptDr9MBXVGBGFw6M7pBAiy1/HlsOTI8PWBrqf
   opTsxOlqmsXKzBNVeRjMSNcsVxfKLz3XgUDubObEL6ec38O4dNHGqSm0h
   pZo0j7xlzx2KbJkz69hWDZIeppzj5ZyyEPF/XVzjhd4057fJQqY2S03hP
   l+OxxnoUL/dng/xFw2IZiiVP2mskUmDFq3996ITTvs41jpu0/+khPPZkr
   A==;
X-CSE-ConnectionGUID: MisGny4GR1eULgmnyv9XBQ==
X-CSE-MsgGUID: h8uM97tLRbixsQxVECdq6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81103226"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="81103226"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:26:05 -0800
X-CSE-ConnectionGUID: lIj9MRarSHWCSWdMeHN5Fw==
X-CSE-MsgGUID: 9EF3wqrhRvyGQuw+dOtm2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="235799047"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 18:26:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfqa8-00000000Ffk-2PQU;
	Wed, 14 Jan 2026 02:26:00 +0000
Date: Wed, 14 Jan 2026 10:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v2 3/3] mm: add WQ_PERCPU to alloc_workqueue users
Message-ID: <202601141042.qJuTeEP0-lkp@intel.com>
References: <20260113114630.152942-4-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113114630.152942-4-marco.crivellari@suse.com>

Hi Marco,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.19-rc5 next-20260113]
[cannot apply to vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Crivellari/mm-Replace-use-of-system_unbound_wq-with-system_dfl_wq/20260113-195017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260113114630.152942-4-marco.crivellari%40suse.com
patch subject: [PATCH v2 3/3] mm: add WQ_PERCPU to alloc_workqueue users
config: riscv-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141042.qJuTeEP0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141042.qJuTeEP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141042.qJuTeEP0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:8545: error: unterminated #ifndef
    8545 | #ifndef CONFIG_SLUB_TINY
         | 


vim +8545 mm/slub.c

  8542	
  8543	void __init kmem_cache_init_late(void)
  8544	{
> 8545	#ifndef CONFIG_SLUB_TINY
  8546		flushwq = alloc_workqueue("slub_flushwq", WQ_MEM_RECLAIM | WQ_PERCPU,
  8547					  0);
  8548		WARN_ON(!flushwq);
  8549	}
  8550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
