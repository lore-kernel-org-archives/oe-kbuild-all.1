Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9D53E04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 18:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsEDNt5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704997355; x=1736533355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QDm03DFZtSPGHiYZc92XtKQQomQCGq1nZbHPJ/Z+ZmU=;
  b=MsEDNt5nXPlGa5qsLrRD4s/53jLgLV8MPUjRiM6LZtn8JjFejiLXc7vw
   K4oUBmfQI8f1Y2BztxDEYbq2DJ1jIDq8wFO+fQ7tjOd40tgdU/FPKUhgd
   vbUV4/s+/A10FQDq3WvOtVy7Q1sb7YRBHTTknULxF7SAN8oBKnGAVaIET
   9Wkp9999S6nBfS2GEjuxjkBo+c+S1ZVDMdazU8TfP+tS2Mw4phAZrYrjH
   O31nXjpD74VbkO9IIMF7ottYFnfMfMTmvG00nIQs6HBrPc7lBTBru1mm5
   f0sAT7ycVE0FjGud/m67qLCk25WhEY4XpCl5b0LIJK3dq1Nyq4iveEGh9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="398627324"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="398627324"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 10:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="31101352"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2024 10:22:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNzhG-0008b5-06;
	Thu, 11 Jan 2024 18:22:30 +0000
Date: Fri, 12 Jan 2024 02:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: [linux-next:master 12997/13245] kernel/crash_core.c:751:58: warning:
 format '%lx' expects argument of type 'long unsigned int', but argument 2
 has type 'int'
Message-ID: <202401120218.y469Puyf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: 9bdb180b2db685e42841d138600491fbea20ae0f [12997/13245] mm/vmalloc: remove vmap_area_list
config: m68k-sun3_defconfig (https://download.01.org/0day-ci/archive/20240112/202401120218.y469Puyf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120218.y469Puyf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120218.y469Puyf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/crash_core.c: In function 'crash_save_vmcoreinfo_init':
>> kernel/crash_core.c:751:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
     751 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
         |                                                        ~~^
         |                                                          |
         |                                                          long unsigned int
         |                                                        %x


vim +751 kernel/crash_core.c

   722	
   723	static int __init crash_save_vmcoreinfo_init(void)
   724	{
   725		vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);
   726		if (!vmcoreinfo_data) {
   727			pr_warn("Memory allocation for vmcoreinfo_data failed\n");
   728			return -ENOMEM;
   729		}
   730	
   731		vmcoreinfo_note = alloc_pages_exact(VMCOREINFO_NOTE_SIZE,
   732							GFP_KERNEL | __GFP_ZERO);
   733		if (!vmcoreinfo_note) {
   734			free_page((unsigned long)vmcoreinfo_data);
   735			vmcoreinfo_data = NULL;
   736			pr_warn("Memory allocation for vmcoreinfo_note failed\n");
   737			return -ENOMEM;
   738		}
   739	
   740		VMCOREINFO_OSRELEASE(init_uts_ns.name.release);
   741		VMCOREINFO_BUILD_ID();
   742		VMCOREINFO_PAGESIZE(PAGE_SIZE);
   743	
   744		VMCOREINFO_SYMBOL(init_uts_ns);
   745		VMCOREINFO_OFFSET(uts_namespace, name);
   746		VMCOREINFO_SYMBOL(node_online_map);
   747	#ifdef CONFIG_MMU
   748		VMCOREINFO_SYMBOL_ARRAY(swapper_pg_dir);
   749	#endif
   750		VMCOREINFO_SYMBOL(_stext);
 > 751		vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
