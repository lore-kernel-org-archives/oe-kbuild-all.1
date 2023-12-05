Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D375FF19
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yzz1vEWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701785755; x=1733321755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HUtN95CBxY73WyhOnT1Lez/ETMiAOg2Qz+hvrK4nEdc=;
  b=Yzz1vEWKL/Tz8UmtVBQiHlDAh3vqaycaWQVxMJ0n2P6HgUH5EVONoXXA
   ur71ADc2CwRbrAACXYcw6qb5aJ5dQoQ1QjULS5dpfqh2sBBZzgwYP4TyQ
   68Rf7D3P+TS6nnAVrvd2WcuwPBWXCGSzARbBVzOgM4Xh5laEN/+9wibd8
   Qk8BdhSG2nyrDrrWg/Mp/84parY7e6b5fvV5j5+6iOTy4SHDWbz1pDbf1
   WQdCnKWTs587tX2rDe2J5YB7nqO5qB0/mfjMjsOnKOyXju1y1skl1WNJU
   G2Vx7X6wOwqXPQzgxm5UNZRnKZk31VaTfhB0yhJ3AWc//ERmsMOyEqcLv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="378924943"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="378924943"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 06:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="799984120"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="799984120"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 06:15:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAWCi-000994-33;
	Tue, 05 Dec 2023 14:15:16 +0000
Date: Tue, 5 Dec 2023 22:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Eric DeVolder <eric.devolder@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Baoquan He <bhe@redhat.com>, x86@kernel.org,
	Laurent Dufour <laurent.dufour@fr.ibm.com>,
	Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Akhil Raj <lf32.dev@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v13 5/6] powerpc: add crash CPU hotplug support
Message-ID: <202312052234.Oinhx3bT-lkp@intel.com>
References: <20231204053253.25305-6-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204053253.25305-6-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes tip/x86/core akpm-mm/mm-everything linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/crash-make-CPU-and-Memory-hotplug-support-reporting-flexible/20231204-143305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231204053253.25305-6-sourabhjain%40linux.ibm.com
patch subject: [PATCH v13 5/6] powerpc: add crash CPU hotplug support
config: powerpc64-randconfig-001-20231205 (https://download.01.org/0day-ci/archive/20231205/202312052234.Oinhx3bT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052234.Oinhx3bT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052234.Oinhx3bT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kexec/file_load_64.c: In function 'kexec_extra_fdt_size_ppc64':
>> arch/powerpc/kexec/file_load_64.c:953:52: error: 'threads_per_core' undeclared (first use in this function)
     953 |         possible_cpu_nodes = num_possible_cpus() / threads_per_core;
         |                                                    ^~~~~~~~~~~~~~~~
   arch/powerpc/kexec/file_load_64.c:953:52: note: each undeclared identifier is reported only once for each function it appears in


vim +/threads_per_core +953 arch/powerpc/kexec/file_load_64.c

   915	
   916		// Budget some space for the password blob. There's already extra space
   917		// for the key name
   918		if (plpks_is_available())
   919			extra_size += (unsigned int)plpks_get_passwordlen();
   920	
   921		if (image->type != KEXEC_TYPE_CRASH)
   922			return extra_size;
   923	
   924		/*
   925		 * For kdump kernel, account for linux,usable-memory and
   926		 * linux,drconf-usable-memory properties. Get an approximate on the
   927		 * number of usable memory entries and use for FDT size estimation.
   928		 */
   929		if (drmem_lmb_size()) {
   930			usm_entries = ((memory_hotplug_max() / drmem_lmb_size()) +
   931				       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
   932			extra_size += (unsigned int)(usm_entries * sizeof(u64));
   933		}
   934	
   935		/*
   936		 * Get the number of CPU nodes in the current DT. This allows to
   937		 * reserve places for CPU nodes added since the boot time.
   938		 */
   939		cpu_nodes = 0;
   940		for_each_node_by_type(dn, "cpu") {
   941			cpu_nodes++;
   942		}
   943	
   944		if (cpu_nodes > boot_cpu_node_count)
   945			extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
   946	
   947	#ifdef CONFIG_CRASH_HOTPLUG
   948		/*
   949		 * Make sure enough space is reserved to accommodate possible CPU nodes
   950		 * in the crash FDT. This allows packing possible CPU nodes which are
   951		 * not yet present in the system without regenerating the entire FDT.
   952		 */
 > 953		possible_cpu_nodes = num_possible_cpus() / threads_per_core;
   954		if (image->type == KEXEC_TYPE_CRASH && possible_cpu_nodes > cpu_nodes)
   955			extra_size += (possible_cpu_nodes - cpu_nodes) * cpu_node_size();
   956	#endif
   957	
   958		return extra_size;
   959	}
   960	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
