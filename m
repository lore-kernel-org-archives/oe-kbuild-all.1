Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACF6446B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 20:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gurJZUhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700080233; x=1731616233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EJRoA2Bk2pAHRmaS5VA0/944ng8zhduEMM4+rlgX8eo=;
  b=gurJZUhwnX6pKjGat9eTWesfCgRrqnn+eUa3hY52rm/kekmdJ/QZso3p
   K7EzGG/dpU5/iLmhGh3BXlGxj+9iCo3JuYpjAHj02jpzEn/D3nSUIGMHj
   7YpG8U4I/FlO97Mw9kYq5P8BRBSBf7VI6hPI9G1vjeHWJjrm3zX1FKiND
   /wub7x+9kyzgob6JHxrOOaoRe/0rXbeN86KPudV3P/BIJp4As9/bap4It
   xYiw7w22t4lvQK0Tneht32/Imy08GUOH6/qTDtrGSiA/ZjR3MCWuD63rj
   5WUTWZz+pydZ3cO1K37MdEkfr3M8+XHfxEskp6uiwE93vNTyvZ2BKBo08
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="394869325"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="394869325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 12:30:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768700843"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="768700843"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2023 12:30:29 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3MWp-0000nc-1N;
	Wed, 15 Nov 2023 20:30:27 +0000
Date: Thu, 16 Nov 2023 04:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv3 14/14] x86/acpi: Add support for CPU offlining for ACPI
 MADT wakeup method
Message-ID: <202311160404.P79tKafL-lkp@intel.com>
References: <20231115120044.8034-15-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115120044.8034-15-kirill.shutemov@linux.intel.com>

Hi Kirill,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on tip/master linus/master v6.7-rc1 next-20231115]
[cannot apply to tip/x86/core rafael-pm/acpi-bus tip/smp/core tip/x86/mm rafael-pm/devprop tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-A-Shutemov/x86-acpi-Extract-ACPI-MADT-wakeup-code-into-a-separate-file/20231115-200533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231115120044.8034-15-kirill.shutemov%40linux.intel.com
patch subject: [PATCHv3 14/14] x86/acpi: Add support for CPU offlining for ACPI MADT wakeup method
config: x86_64-randconfig-004-20231116 (https://download.01.org/0day-ci/archive/20231116/202311160404.P79tKafL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160404.P79tKafL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160404.P79tKafL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/acpi/madt_wakeup.c: In function 'crash_nmi_callback':
>> arch/x86/kernel/acpi/madt_wakeup.c:67:9: error: implicit declaration of function 'crash_save_cpu' [-Werror=implicit-function-declaration]
      67 |         crash_save_cpu(regs, raw_smp_processor_id());
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/crash_save_cpu +67 arch/x86/kernel/acpi/madt_wakeup.c

    62	
    63	static int crash_nmi_callback(unsigned int val, struct pt_regs *regs)
    64	{
    65		local_irq_disable();
    66	
  > 67		crash_save_cpu(regs, raw_smp_processor_id());
    68	
    69		cpu_emergency_stop_pt();
    70	
    71		disable_local_APIC();
    72	
    73		/*
    74		 * Prepare the CPU for reboot _after_ invoking the callback so that the
    75		 * callback can safely use virtualization instructions, e.g. VMCLEAR.
    76		 */
    77		cpu_emergency_disable_virtualization();
    78	
    79		atomic_dec(&waiting_for_crash_ipi);
    80	
    81		asm_acpi_mp_play_dead(acpi_mp_reset_vector_paddr,
    82				      acpi_mp_pgd);
    83	
    84		return NMI_HANDLED;
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
