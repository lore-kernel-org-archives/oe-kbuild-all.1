Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC51FA6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677672378; x=1709208378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8078ajoEHJ8sUKIkamPIQHFKYwXH/I3iSdqDNubxNys=;
  b=D0QdIdL7CgdufFCkNvhhGDFue9ml6PId8vXWWrnteeKpn7vNn76oCt/I
   QdGDM2dR+KZPz/o7iMOOiFKuD/o7EPfZIDaLQTS/HtLspYygHO57MKef6
   +S6XjOOCB7Y64uxNt0T55ox4/KfYit3RYQ4njeZ++demr3058pOlA0ZLQ
   guJLI+HMnQfs52mPs6V4uRIBoyZlRNhKe5rxg9Htf5zubIYc5foiWHk+O
   VIlOtEz97LMv9WmvdsybDYgOMvWPmG/YkXhORyooHknGOP92Sf4bnX7TT
   bm871BpZFikUSM0QLli/j33YOE3DMbJjLPWZIwN07+IgbLrYd8zbRicYH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="420649182"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="420649182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 04:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="674538250"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="674538250"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Mar 2023 04:06:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXLDs-00068B-0c;
	Wed, 01 Mar 2023 12:06:16 +0000
Date: Wed, 1 Mar 2023 20:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/soc/qcom/qcom_minidump.c:272:31: error: implicit declaration
 of function 'virt_to_phys'; did you mean 'virt_to_page'?
Message-ID: <202303011938.h2FmiGI4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/firmware-qcom_scm-Clear-download-bit-during-reboot/20230301-183309
head:   a99ae10e91ff613554ccd5e93d2ad2ba087bcbc9
commit: b716fb4bf431d2b258156d38ae5c98a54c36e0c5 soc: qcom: Add Qualcomm minidump kernel driver
date:   82 minutes ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230301/202303011938.h2FmiGI4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b716fb4bf431d2b258156d38ae5c98a54c36e0c5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mukesh-Ojha/firmware-qcom_scm-Clear-download-bit-during-reboot/20230301-183309
        git checkout b716fb4bf431d2b258156d38ae5c98a54c36e0c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/soc/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303011938.h2FmiGI4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/qcom/qcom_minidump.c: In function 'minidump_add_elf_header':
>> drivers/soc/qcom/qcom_minidump.c:272:31: error: implicit declaration of function 'virt_to_phys'; did you mean 'virt_to_page'? [-Werror=implicit-function-declaration]
     272 |         elfregion.phys_addr = virt_to_phys(minidump.elf.ehdr);
         |                               ^~~~~~~~~~~~
         |                               virt_to_page
   cc1: some warnings being treated as errors


vim +272 drivers/soc/qcom/qcom_minidump.c

   235	
   236	#define MAX_STRTBL_SIZE	   (MAX_NUM_ENTRIES * MAX_REGION_NAME_LENGTH)
   237	static int minidump_add_elf_header(void)
   238	{
   239		struct qcom_minidump_region elfregion;
   240		struct elfhdr *ehdr;
   241		struct elf_shdr *shdr;
   242		struct elf_phdr *phdr;
   243		unsigned int  elfh_size;
   244		unsigned int strtbl_off;
   245		unsigned int phdr_off;
   246		char *banner;
   247		unsigned int banner_len;
   248	
   249		banner_len = strlen(linux_banner);
   250		/*
   251		 * Header buffer contains:
   252		 * ELF header, (MAX_NUM_ENTRIES + 4) of Section and Program ELF headers,
   253		 * where, 4 additional entries, one for empty header, one for string table
   254		 * one for minidump table and one for linux banner.
   255		 *
   256		 * Linux banner is stored in minidump to aid post mortem tools to determine
   257		 * the kernel version.
   258		 */
   259		elfh_size = sizeof(*ehdr);
   260		elfh_size += MAX_STRTBL_SIZE;
   261		elfh_size += banner_len + 1;
   262		elfh_size += ((sizeof(*shdr) + sizeof(*phdr)) * (MAX_NUM_ENTRIES + 4));
   263		elfh_size = ALIGN(elfh_size, 4);
   264	
   265		minidump.elf.ehdr = kzalloc(elfh_size, GFP_KERNEL);
   266		if (!minidump.elf.ehdr)
   267			return -ENOMEM;
   268	
   269		/* Register ELF header as first region */
   270		strscpy(elfregion.name, "KELF_HEADER", sizeof(elfregion.name));
   271		elfregion.virt_addr = minidump.elf.ehdr;
 > 272		elfregion.phys_addr = virt_to_phys(minidump.elf.ehdr);
   273		elfregion.size = elfh_size;
   274		minidump_ss_add_region(&elfregion);
   275	
   276		ehdr = minidump.elf.ehdr;
   277		/* Assign Section/Program headers offset */
   278		minidump.elf.shdr = shdr = (struct elf_shdr *)(ehdr + 1);
   279		minidump.elf.phdr = phdr = (struct elf_phdr *)(shdr + MAX_NUM_ENTRIES);
   280		phdr_off = sizeof(*ehdr) + (sizeof(*shdr) * MAX_NUM_ENTRIES);
   281	
   282		memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
   283		ehdr->e_ident[EI_CLASS] = ELF_CLASS;
   284		ehdr->e_ident[EI_DATA] = ELF_DATA;
   285		ehdr->e_ident[EI_VERSION] = EV_CURRENT;
   286		ehdr->e_ident[EI_OSABI] = ELF_OSABI;
   287		ehdr->e_type = ET_CORE;
   288		ehdr->e_machine  = ELF_ARCH;
   289		ehdr->e_version = EV_CURRENT;
   290		ehdr->e_ehsize = sizeof(*ehdr);
   291		ehdr->e_phoff = phdr_off;
   292		ehdr->e_phentsize = sizeof(*phdr);
   293		ehdr->e_shoff = sizeof(*ehdr);
   294		ehdr->e_shentsize = sizeof(*shdr);
   295		ehdr->e_shstrndx = 1;
   296	
   297		minidump.elf.elf_offset = elfh_size;
   298	
   299		/*
   300		 * The zeroth index of the section header is reserved and is rarely used.
   301		 * Set the section header as null (SHN_UNDEF) and move to the next one.
   302		 * 2nd Section is String table.
   303		 */
   304		minidump.elf.strtable_idx = 1;
   305		strtbl_off = sizeof(*ehdr) + ((sizeof(*phdr) + sizeof(*shdr)) * MAX_NUM_ENTRIES);
   306		shdr++;
   307		shdr->sh_type = SHT_STRTAB;
   308		shdr->sh_offset = (elf_addr_t)strtbl_off;
   309		shdr->sh_size = MAX_STRTBL_SIZE;
   310		shdr->sh_entsize = 0;
   311		shdr->sh_flags = 0;
   312		shdr->sh_name = append_str_to_strtable("STR_TBL");
   313		shdr++;
   314	
   315		/* 3rd Section is for Minidump_table VA, used by parsers */
   316		shdr->sh_type = SHT_PROGBITS;
   317		shdr->sh_entsize = 0;
   318		shdr->sh_flags = 0;
   319		shdr->sh_addr = (elf_addr_t)&minidump;
   320		shdr->sh_name = append_str_to_strtable("minidump_table");
   321		shdr++;
   322	
   323		/* 4th Section is Linux banner */
   324		banner = (char *)ehdr + strtbl_off + MAX_STRTBL_SIZE;
   325		memcpy(banner, linux_banner, banner_len);
   326	
   327		shdr->sh_type = SHT_PROGBITS;
   328		shdr->sh_offset = (elf_addr_t)(strtbl_off + MAX_STRTBL_SIZE);
   329		shdr->sh_size = banner_len + 1;
   330		shdr->sh_addr = (elf_addr_t)linux_banner;
   331		shdr->sh_entsize = 0;
   332		shdr->sh_flags = SHF_WRITE;
   333		shdr->sh_name = append_str_to_strtable("linux_banner");
   334	
   335		phdr->p_type = PT_LOAD;
   336		phdr->p_offset = (elf_addr_t)(strtbl_off + MAX_STRTBL_SIZE);
   337		phdr->p_vaddr = (elf_addr_t)linux_banner;
   338		phdr->p_paddr = virt_to_phys(linux_banner);
   339		phdr->p_filesz = phdr->p_memsz = banner_len + 1;
   340		phdr->p_flags = PF_R | PF_W;
   341	
   342		/* Update headers count*/
   343		ehdr->e_phnum = 1;
   344		ehdr->e_shnum = 4;
   345		return 0;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
