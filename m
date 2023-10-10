Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4D418AED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAiWnHYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696948400; x=1728484400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hxVWrMkYZc4A/RbVrzYpUag2yHuVdlVEDh5Y/0czaFs=;
  b=FAiWnHYwzxI0mxO2UXVVLYSXh68SMbodj6LPqeHQ6ZRsTVmzLJB0/7mB
   uzJlbABm9h5o4taq7+phFiLm19Z+f4+0ayQeMtai3pR64cGG3QZfVGbaK
   zYGD0W76e+t/B6WHXCI0iucQAeJPfQI+/3VJqcy8mPyJSZLofLI4jUBh4
   Ok9Z7iuN28xHOe3yHaWaIa0f+QUjzZxAld2fVF4g83uAZ0pKUf4n6dUuU
   Y9R2KoWmt+YKVy4eYvp8UN2u88CPQjaeEDyipTr1B54LL5JP0QMT28KWU
   Vz6rXRLEW+q80ncJSVh/CXlguVBgegO3ulw3JL5STpszC0ZvU60CtBvJS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="383281381"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="383281381"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897209776"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="897209776"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2023 07:31:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqDnO-0000Zs-1T;
	Tue, 10 Oct 2023 14:33:15 +0000
Date: Tue, 10 Oct 2023 22:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gray <bgray@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] powerpc/dexcr: Add sysctl entry for SBHE system
 override
Message-ID: <202310102226.isMNaOp9-lkp@intel.com>
References: <20231009055406.142940-6-bgray@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009055406.142940-6-bgray@linux.ibm.com>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.6-rc5 next-20231010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gray/powerpc-dexcr-Make-all-aspects-CPU-features/20231009-140047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231009055406.142940-6-bgray%40linux.ibm.com
patch subject: [RFC PATCH 5/6] powerpc/dexcr: Add sysctl entry for SBHE system override
config: powerpc64-randconfig-003-20231010 (https://download.01.org/0day-ci/archive/20231010/202310102226.isMNaOp9-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310102226.isMNaOp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102226.isMNaOp9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/dexcr.c:65:13: error: 'update_dexcr_on_cpu' defined but not used [-Werror=unused-function]
      65 | static void update_dexcr_on_cpu(void *_info)
         |             ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/update_dexcr_on_cpu +65 arch/powerpc/kernel/dexcr.c

    64	
  > 65	static void update_dexcr_on_cpu(void *_info)
    66	{
    67		/* ensure the spec_branch_hint_enable write propagated to this CPU */
    68		smp_mb();
    69	
    70		mtspr(SPRN_DEXCR, get_thread_dexcr(&current->thread));
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
