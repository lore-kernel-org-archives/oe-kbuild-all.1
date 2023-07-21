Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA1D7F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 03:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689911452; x=1721447452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JNp10Mt5clD02qyeJ6DeFQiC9FL/84T24RBmha8oF4M=;
  b=XITxK0bFcD6MedgQrpuzs0vLg2m5GrJp46uqVuPi0HVfEJH4gM8XOrRf
   FOZVjrI1O/PEwx5/7Aad4THygop/A5KFnKdFROQxgR9NhJa+/wXOnGbE3
   Oxs6Dsuv3oRyxOVJDwQsmIwTnEIZ6jiaZO6LGK5aooKJrKiGr9FjaS6za
   CwsAzHWY98uLEWL/co21EASBl+3HiYJ16kTZXfnwKFg0rQ5KghUWQ4Ep6
   tQt8Wa7i3g5ZFq+nGw2HcXf6RB3C94wQBUp6FnJx4z0WMgHelPLhUs7M3
   pI9WxiHXZ3oWM7Y93bEMfwHeOrgTpjCeuYIYYg2LMSA7jaluAyBLqbj8O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433155812"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="433155812"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 20:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838394843"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="838394843"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2023 20:50:50 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMhAC-0006ps-1l;
	Fri, 21 Jul 2023 03:50:45 +0000
Date: Fri, 21 Jul 2023 11:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, Hari Bathini <hbathini@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Sachin Sant <sachinp@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] kdump fix
Message-ID: <202307211100.UDh0FQ50-lkp@intel.com>
References: <2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc@umt35y2hmslm>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc@umt35y2hmslm>

Hi Mahesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mahesh-J-Salgaonkar/kdump-fix/20230720-021115
base:   linus/master
patch link:    https://lore.kernel.org/r/2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc%40umt35y2hmslm
patch subject: [PATCH] kdump fix
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230721/202307211100.UDh0FQ50-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211100.UDh0FQ50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211100.UDh0FQ50-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kexec_file.c: In function 'crash_prepare_elf64_headers':
>> kernel/kexec_file.c:1282:25: error: 'ELF_CORE_EFLAGS' undeclared (first use in this function)
    1282 |         ehdr->e_flags = ELF_CORE_EFLAGS;
         |                         ^~~~~~~~~~~~~~~
   kernel/kexec_file.c:1282:25: note: each undeclared identifier is reported only once for each function it appears in


vim +/ELF_CORE_EFLAGS +1282 kernel/kexec_file.c

  1236	
  1237	int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
  1238				  void **addr, unsigned long *sz)
  1239	{
  1240		Elf64_Ehdr *ehdr;
  1241		Elf64_Phdr *phdr;
  1242		unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
  1243		unsigned char *buf;
  1244		unsigned int cpu, i;
  1245		unsigned long long notes_addr;
  1246		unsigned long mstart, mend;
  1247	
  1248		/* extra phdr for vmcoreinfo ELF note */
  1249		nr_phdr = nr_cpus + 1;
  1250		nr_phdr += mem->nr_ranges;
  1251	
  1252		/*
  1253		 * kexec-tools creates an extra PT_LOAD phdr for kernel text mapping
  1254		 * area (for example, ffffffff80000000 - ffffffffa0000000 on x86_64).
  1255		 * I think this is required by tools like gdb. So same physical
  1256		 * memory will be mapped in two ELF headers. One will contain kernel
  1257		 * text virtual addresses and other will have __va(physical) addresses.
  1258		 */
  1259	
  1260		nr_phdr++;
  1261		elf_sz = sizeof(Elf64_Ehdr) + nr_phdr * sizeof(Elf64_Phdr);
  1262		elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
  1263	
  1264		buf = vzalloc(elf_sz);
  1265		if (!buf)
  1266			return -ENOMEM;
  1267	
  1268		ehdr = (Elf64_Ehdr *)buf;
  1269		phdr = (Elf64_Phdr *)(ehdr + 1);
  1270		memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
  1271		ehdr->e_ident[EI_CLASS] = ELFCLASS64;
  1272		ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
  1273		ehdr->e_ident[EI_VERSION] = EV_CURRENT;
  1274		ehdr->e_ident[EI_OSABI] = ELF_OSABI;
  1275		memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
  1276		ehdr->e_type = ET_CORE;
  1277		ehdr->e_machine = ELF_ARCH;
  1278		ehdr->e_version = EV_CURRENT;
  1279		ehdr->e_phoff = sizeof(Elf64_Ehdr);
  1280		ehdr->e_ehsize = sizeof(Elf64_Ehdr);
  1281		ehdr->e_phentsize = sizeof(Elf64_Phdr);
> 1282		ehdr->e_flags = ELF_CORE_EFLAGS;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
