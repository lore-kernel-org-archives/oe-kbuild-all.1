Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C06748E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694293374; x=1725829374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9lrNQteyKOAJJELr4jxEhnMwB8i2qCKnMbPKbW6s/o=;
  b=kloiF2tlqrPF/br9D//kW3RMYL2uHARMSlKmuJ8i6aa2KyPIwmFGjHlJ
   jsg1EX5+XxR+kTOjryocvzKWJ+ZgGCi08ixbBQ+6wHmhgpJJ5f2yj/LpP
   gxB69JRQNSGzh4iOrvN3RMiSr7U0+txfSXXfc42l/Z2zkfsFrdXZPJYr2
   uywL1OvBrdBud2iazCmwRnNAZVTk3Stx6VMg9Ejhq39P/YlSa9OxJQXMn
   xo7BHxGpNMnFUQtSNKT+ot+858b5Uuw/QgN2qb0Y12I/7XNnAv1eXo/dS
   RJMTbRHxaEoyKhZrK1Jbz1a8nEaH0KeC/VXEWZI2TeJDwYd1/vFy12BVJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376754685"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="376754685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 14:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="886026757"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="886026757"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 14:02:31 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf56N-0003w0-0u;
	Sat, 09 Sep 2023 21:02:47 +0000
Date: Sun, 10 Sep 2023 05:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 4580/25020]
 drivers/staging/fsl_ppfe/pfe_hal.c:617:19: error: 'else' without a previous
 'if'
Message-ID: <202309100416.p7i6I2sX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chaitanya,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: ff6153888606f89c400db1716d3f464aab81fde7 [4580/25020] staging: fsl_ppfe/eth: LF-27 enabling PFE firmware load from FDT
config: sh-randconfig-r004-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100416.p7i6I2sX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100416.p7i6I2sX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100416.p7i6I2sX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   cc1: warning: arch/sh/include/mach-rsk: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-rsk: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/staging/fsl_ppfe/pfe_mod.h:10,
                    from drivers/staging/fsl_ppfe/pfe_hal.c:7:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/staging/fsl_ppfe/pfe_hal.c: At top level:
   drivers/staging/fsl_ppfe/pfe_hal.c:123:6: warning: no previous prototype for 'pe_mem_memcpy_to32' [-Wmissing-prototypes]
     123 | void pe_mem_memcpy_to32(int id, u32 mem_access_addr, const void *src, unsigned
         |      ^~~~~~~~~~~~~~~~~~
   drivers/staging/fsl_ppfe/pfe_hal.c: In function 'pe_load_ddr_section':
>> drivers/staging/fsl_ppfe/pfe_hal.c:617:19: error: 'else' without a previous 'if'
     617 |                 } else {
         |                   ^~~~
>> drivers/staging/fsl_ppfe/pfe_hal.c:622:17: error: break statement not within loop or switch
     622 |                 break;
         |                 ^~~~~
>> drivers/staging/fsl_ppfe/pfe_hal.c:624:9: error: case label not within a switch statement
     624 |         case SHT_NOBITS:
         |         ^~~~
   drivers/staging/fsl_ppfe/pfe_hal.c:627:17: error: break statement not within loop or switch
     627 |                 break;
         |                 ^~~~~
>> drivers/staging/fsl_ppfe/pfe_hal.c:629:9: error: 'default' label not within a switch statement
     629 |         default:
         |         ^~~~~~~
   drivers/staging/fsl_ppfe/pfe_hal.c: At top level:
>> drivers/staging/fsl_ppfe/pfe_hal.c:635:9: error: expected identifier or '(' before 'return'
     635 |         return 0;
         |         ^~~~~~
>> drivers/staging/fsl_ppfe/pfe_hal.c:636:1: error: expected identifier or '(' before '}' token
     636 | }
         | ^
   drivers/staging/fsl_ppfe/pfe_hal.c:1052:6: warning: no previous prototype for 'gemac_enable_pause_tx' [-Wmissing-prototypes]
    1052 | void gemac_enable_pause_tx(void *base)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fsl_ppfe/pfe_hal.c:1060:6: warning: no previous prototype for 'gemac_disable_pause_tx' [-Wmissing-prototypes]
    1060 | void gemac_disable_pause_tx(void *base)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   cc1: warning: arch/sh/include/mach-rsk: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-rsk: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/staging/fsl_ppfe/pfe_sysfs.c:7:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   drivers/staging/fsl_ppfe/pfe_sysfs.c: In function 'pfe_set_util':
>> include/linux/stddef.h:8:14: warning: passing argument 2 of 'kstrtoul' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/staging/fsl_ppfe/pfe_sysfs.c:538:39: note: in expansion of macro 'NULL'
     538 |         util_do_clear = kstrtoul(buf, NULL, 0);
         |                                       ^~~~
   In file included from include/linux/kernel.h:13,
                    from include/linux/list.h:9:
   include/linux/kstrtox.h:30:69: note: expected 'unsigned int' but argument is of type 'void *'
      30 | static inline int __must_check kstrtoul(const char *s, unsigned int base, unsigned long *res)
         |                                                        ~~~~~~~~~~~~~^~~~


vim +617 drivers/staging/fsl_ppfe/pfe_hal.c

dcf8d04096aa55 Calvin Johnson 2017-09-16  522  
dcf8d04096aa55 Calvin Johnson 2017-09-16  523  /* Loads an elf section into DDR
dcf8d04096aa55 Calvin Johnson 2017-09-16  524   * Data needs to be at least 32bit aligned, NOBITS sections are correctly
dcf8d04096aa55 Calvin Johnson 2017-09-16  525   * initialized to 0
dcf8d04096aa55 Calvin Johnson 2017-09-16  526   *
dcf8d04096aa55 Calvin Johnson 2017-09-16  527   * @param[in] id		PE identification (CLASS0_ID, ..., TMU0_ID,
dcf8d04096aa55 Calvin Johnson 2017-09-16  528   * ..., UTIL_ID)
dcf8d04096aa55 Calvin Johnson 2017-09-16  529   * @param[in] data		pointer to the elf firmware
dcf8d04096aa55 Calvin Johnson 2017-09-16  530   * @param[in] shdr		pointer to the elf section header
dcf8d04096aa55 Calvin Johnson 2017-09-16  531   *
dcf8d04096aa55 Calvin Johnson 2017-09-16  532   */
dcf8d04096aa55 Calvin Johnson 2017-09-16  533  static int pe_load_ddr_section(int id, const void *data,
dcf8d04096aa55 Calvin Johnson 2017-09-16  534  			       struct elf32_shdr *shdr,
dcf8d04096aa55 Calvin Johnson 2017-09-16  535  			       struct device *dev) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  536  	u32 offset = be32_to_cpu(shdr->sh_offset);
dcf8d04096aa55 Calvin Johnson 2017-09-16  537  	u32 addr = be32_to_cpu(shdr->sh_addr);
dcf8d04096aa55 Calvin Johnson 2017-09-16  538  	u32 size = be32_to_cpu(shdr->sh_size);
dcf8d04096aa55 Calvin Johnson 2017-09-16  539  	u32 type = be32_to_cpu(shdr->sh_type);
dcf8d04096aa55 Calvin Johnson 2017-09-16  540  	u32 flags = be32_to_cpu(shdr->sh_flags);
dcf8d04096aa55 Calvin Johnson 2017-09-16  541  
dcf8d04096aa55 Calvin Johnson 2017-09-16  542  	switch (type) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  543  	case SHT_PROGBITS:
dcf8d04096aa55 Calvin Johnson 2017-09-16  544  		if (flags & SHF_EXECINSTR) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  545  			if (id <= CLASS_MAX_ID) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  546  				/* DO the loading only once in DDR */
dcf8d04096aa55 Calvin Johnson 2017-09-16  547  				if (id == CLASS0_ID) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  548  					pr_err(
dcf8d04096aa55 Calvin Johnson 2017-09-16  549  						"%s: load address(%x) and elf file address(%lx) rcvd\n",
dcf8d04096aa55 Calvin Johnson 2017-09-16  550  						__func__, addr,
dcf8d04096aa55 Calvin Johnson 2017-09-16  551  						(unsigned long)data + offset);
dcf8d04096aa55 Calvin Johnson 2017-09-16  552  					if (((unsigned long)(data + offset)
dcf8d04096aa55 Calvin Johnson 2017-09-16  553  						& 0x3) != (addr & 0x3)) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  554  						pr_err(
dcf8d04096aa55 Calvin Johnson 2017-09-16  555  							"%s: load address(%x) and elf file address(%lx) don't have the same alignment\n"
dcf8d04096aa55 Calvin Johnson 2017-09-16  556  							, __func__, addr,
dcf8d04096aa55 Calvin Johnson 2017-09-16  557  						(unsigned long)data + offset);
dcf8d04096aa55 Calvin Johnson 2017-09-16  558  
dcf8d04096aa55 Calvin Johnson 2017-09-16  559  						return -EINVAL;
dcf8d04096aa55 Calvin Johnson 2017-09-16  560  					}
dcf8d04096aa55 Calvin Johnson 2017-09-16  561  
dcf8d04096aa55 Calvin Johnson 2017-09-16  562  					if (addr & 0x1) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  563  						pr_err(
dcf8d04096aa55 Calvin Johnson 2017-09-16  564  							"%s: load address(%x) is not 16bit aligned\n"
dcf8d04096aa55 Calvin Johnson 2017-09-16  565  							, __func__, addr);
dcf8d04096aa55 Calvin Johnson 2017-09-16  566  						return -EINVAL;
dcf8d04096aa55 Calvin Johnson 2017-09-16  567  					}
dcf8d04096aa55 Calvin Johnson 2017-09-16  568  
dcf8d04096aa55 Calvin Johnson 2017-09-16  569  					if (size & 0x1) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  570  						pr_err(
dcf8d04096aa55 Calvin Johnson 2017-09-16  571  							"%s: load length(%x) is not 16bit aligned\n"
dcf8d04096aa55 Calvin Johnson 2017-09-16  572  							, __func__, size);
dcf8d04096aa55 Calvin Johnson 2017-09-16  573  						return -EINVAL;
dcf8d04096aa55 Calvin Johnson 2017-09-16  574  					}
dcf8d04096aa55 Calvin Johnson 2017-09-16  575  					memcpy(DDR_PHYS_TO_VIRT(
dcf8d04096aa55 Calvin Johnson 2017-09-16  576  						DDR_PFE_TO_PHYS(addr)),
dcf8d04096aa55 Calvin Johnson 2017-09-16  577  						data + offset, size);
dcf8d04096aa55 Calvin Johnson 2017-09-16  578  				}
dcf8d04096aa55 Calvin Johnson 2017-09-16  579  #if !defined(CONFIG_FSL_PPFE_UTIL_DISABLED)
dcf8d04096aa55 Calvin Johnson 2017-09-16  580  			} else if (id == UTIL_ID) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  581  				if (((unsigned long)(data + offset) & 0x3)
dcf8d04096aa55 Calvin Johnson 2017-09-16  582  					!= (addr & 0x3)) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  583  					pr_err(
dcf8d04096aa55 Calvin Johnson 2017-09-16  584  						"%s: load address(%x) and elf file address(%lx) don't have the same alignment\n"
dcf8d04096aa55 Calvin Johnson 2017-09-16  585  						, __func__, addr,
dcf8d04096aa55 Calvin Johnson 2017-09-16  586  						(unsigned long)data + offset);
dcf8d04096aa55 Calvin Johnson 2017-09-16  587  
dcf8d04096aa55 Calvin Johnson 2017-09-16  588  					return -EINVAL;
dcf8d04096aa55 Calvin Johnson 2017-09-16  589  				}
dcf8d04096aa55 Calvin Johnson 2017-09-16  590  
dcf8d04096aa55 Calvin Johnson 2017-09-16  591  				if (addr & 0x1) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  592  					pr_err(
dcf8d04096aa55 Calvin Johnson 2017-09-16  593  						"%s: load address(%x) is not 16bit aligned\n"
dcf8d04096aa55 Calvin Johnson 2017-09-16  594  						, __func__, addr);
dcf8d04096aa55 Calvin Johnson 2017-09-16  595  					return -EINVAL;
dcf8d04096aa55 Calvin Johnson 2017-09-16  596  				}
dcf8d04096aa55 Calvin Johnson 2017-09-16  597  
dcf8d04096aa55 Calvin Johnson 2017-09-16  598  				if (size & 0x1) {
dcf8d04096aa55 Calvin Johnson 2017-09-16  599  					pr_err(
dcf8d04096aa55 Calvin Johnson 2017-09-16  600  						"%s: load length(%x) is not 16bit aligned\n"
dcf8d04096aa55 Calvin Johnson 2017-09-16  601  						, __func__, size);
dcf8d04096aa55 Calvin Johnson 2017-09-16  602  					return -EINVAL;
dcf8d04096aa55 Calvin Johnson 2017-09-16  603  				}
dcf8d04096aa55 Calvin Johnson 2017-09-16  604  
dcf8d04096aa55 Calvin Johnson 2017-09-16  605  				util_pmem_memcpy(DDR_PHYS_TO_VIRT(
dcf8d04096aa55 Calvin Johnson 2017-09-16  606  							DDR_PFE_TO_PHYS(addr)),
dcf8d04096aa55 Calvin Johnson 2017-09-16  607  							data + offset, size);
dcf8d04096aa55 Calvin Johnson 2017-09-16  608  			}
dcf8d04096aa55 Calvin Johnson 2017-09-16  609  #endif
dcf8d04096aa55 Calvin Johnson 2017-09-16  610  			} else {
dcf8d04096aa55 Calvin Johnson 2017-09-16  611  				pr_err(
dcf8d04096aa55 Calvin Johnson 2017-09-16  612  					"%s: unsupported ddr section type(%x) for PE(%d)\n"
dcf8d04096aa55 Calvin Johnson 2017-09-16  613  						, __func__, type, id);
dcf8d04096aa55 Calvin Johnson 2017-09-16  614  				return -EINVAL;
dcf8d04096aa55 Calvin Johnson 2017-09-16  615  			}
dcf8d04096aa55 Calvin Johnson 2017-09-16  616  
dcf8d04096aa55 Calvin Johnson 2017-09-16 @617  		} else {
dcf8d04096aa55 Calvin Johnson 2017-09-16  618  			memcpy(DDR_PHYS_TO_VIRT(DDR_PFE_TO_PHYS(addr)), data
dcf8d04096aa55 Calvin Johnson 2017-09-16  619  				+ offset, size);
dcf8d04096aa55 Calvin Johnson 2017-09-16  620  		}
dcf8d04096aa55 Calvin Johnson 2017-09-16  621  
dcf8d04096aa55 Calvin Johnson 2017-09-16 @622  		break;
dcf8d04096aa55 Calvin Johnson 2017-09-16  623  
dcf8d04096aa55 Calvin Johnson 2017-09-16 @624  	case SHT_NOBITS:
dcf8d04096aa55 Calvin Johnson 2017-09-16  625  		memset(DDR_PHYS_TO_VIRT(DDR_PFE_TO_PHYS(addr)), 0, size);
dcf8d04096aa55 Calvin Johnson 2017-09-16  626  
dcf8d04096aa55 Calvin Johnson 2017-09-16  627  		break;
dcf8d04096aa55 Calvin Johnson 2017-09-16  628  
dcf8d04096aa55 Calvin Johnson 2017-09-16 @629  	default:
dcf8d04096aa55 Calvin Johnson 2017-09-16  630  		pr_err("%s: unsupported section type(%x)\n", __func__,
dcf8d04096aa55 Calvin Johnson 2017-09-16  631  		       type);
dcf8d04096aa55 Calvin Johnson 2017-09-16  632  		return -EINVAL;
dcf8d04096aa55 Calvin Johnson 2017-09-16  633  	}
dcf8d04096aa55 Calvin Johnson 2017-09-16  634  
dcf8d04096aa55 Calvin Johnson 2017-09-16 @635  	return 0;
dcf8d04096aa55 Calvin Johnson 2017-09-16 @636  }
dcf8d04096aa55 Calvin Johnson 2017-09-16  637  

:::::: The code at line 617 was first introduced by commit
:::::: dcf8d04096aa550828e91a7c11b454ea131b081e staging: fsl_ppfe/eth: introduce pfe driver

:::::: TO: Calvin Johnson <calvin.johnson@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
