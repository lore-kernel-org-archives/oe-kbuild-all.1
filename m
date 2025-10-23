Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28703189F43
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761179139; cv=none; b=oM7tVKftQNALuHmek9MwJh8TZOatkPgHTC+LWC+/FNgKzhkpfk4X9DTneha7lI6frZfR1awfILK7LtWr5x6XAc75DDIooWYDst4rW8XnD0oNK3ZGHF6TaIF21Rc9s/zN8IwVsJpAWxdELavSVoZPc6wRsMjcaPQ1P4LFMISLcXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761179139; c=relaxed/simple;
	bh=u39zB8DoqW+d3c/PCARd9B+XH0IAT0xW8YupK0LYr/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHyrIjMWEqVsGstke4qUQvbVs6XwMKJcEb66PHHLXY3haIyBE7LKYkGk05W5rkAjM7VIEWyC51PkY9mRfBpkDsTaZhu2KhZvfk+Nw8BEZewZjHcpWgl3HvCku+lKuLz9kGn1KNNY7JzUjQJYuHZOae591b/fUbsQw8A4Kei+oRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2KSdHCH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2KSdHCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761179137; x=1792715137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u39zB8DoqW+d3c/PCARd9B+XH0IAT0xW8YupK0LYr/Y=;
  b=I2KSdHCHJUyS1PDfmjgX9r5ZwOS5mYwU57gMbQSRZL0+EpT5BUStvzbD
   sRQAGWX2R6jX5AmBwdIpMp7x8wi0qlV5y5AWGAYzBK65R/nPK80M1Q9vW
   1gB/3fcRDUZodyIvYGMEKXOtnAfwTrxyJ8eCRHXgW2h6z9FutWl0KgDFu
   Nj8g5VriZwaMgri9W4dGHtVzuv69zW7SkLHQNgPbagipLKWczTPQlqBBO
   TDG6qd2WWOJrXGYmD4FNezDZc2chYqoNB7YpK5aNVHnPKA2kLDl1PoOQQ
   kOT6LXVKZGzIJP9fb2Xxa0N3324dc10VIYJhoAIgJ+iEveV17JRG6xNWd
   Q==;
X-CSE-ConnectionGUID: R7ZsPxkNT4+PU2w04iZmkg==
X-CSE-MsgGUID: CqOcxSddRE68pXjo7UMYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74457861"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74457861"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:25:36 -0700
X-CSE-ConnectionGUID: MH3z9HdyQJaZJhSDY1AjMg==
X-CSE-MsgGUID: 0jCOLzenRni+yqQbQuYPvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183231508"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2025 17:25:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBj91-000CrB-23;
	Thu, 23 Oct 2025 00:25:31 +0000
Date: Thu, 23 Oct 2025 08:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <202510230817.h1gNa0VV-lkp@intel.com>
References: <20251022102531.657147-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102531.657147-1-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kdump-Add-support-for-crashkernel-CMA-reservation/20251022-182711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251022102531.657147-1-sourabhjain%40linux.ibm.com
patch subject: [PATCH] powerpc/kdump: Add support for crashkernel CMA reservation
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251023/202510230817.h1gNa0VV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230817.h1gNa0VV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230817.h1gNa0VV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/setup-common.c: In function 'setup_arch':
>> arch/powerpc/kernel/setup-common.c:1004:9: error: implicit declaration of function 'kdump_cma_reserve'; did you mean 'kvm_cma_reserve'? [-Wimplicit-function-declaration]
    1004 |         kdump_cma_reserve();
         |         ^~~~~~~~~~~~~~~~~
         |         kvm_cma_reserve


vim +1004 arch/powerpc/kernel/setup-common.c

   976	
   977		/* Print various info about the machine that has been gathered so far. */
   978		print_system_info();
   979	
   980		klp_init_thread_info(&init_task);
   981	
   982		setup_initial_init_mm(_stext, _etext, _edata, _end);
   983		/* sched_init() does the mmgrab(&init_mm) for the primary CPU */
   984		VM_WARN_ON(cpumask_test_cpu(smp_processor_id(), mm_cpumask(&init_mm)));
   985		cpumask_set_cpu(smp_processor_id(), mm_cpumask(&init_mm));
   986		inc_mm_active_cpus(&init_mm);
   987		mm_iommu_init(&init_mm);
   988	
   989		irqstack_early_init();
   990		exc_lvl_early_init();
   991		emergency_stack_init();
   992	
   993		mce_init();
   994		smp_release_cpus();
   995	
   996		initmem_init();
   997	
   998		/*
   999		 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
  1000		 * hugetlb. These must be called after initmem_init(), so that
  1001		 * pageblock_order is initialised.
  1002		 */
  1003		fadump_cma_init();
> 1004		kdump_cma_reserve();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
