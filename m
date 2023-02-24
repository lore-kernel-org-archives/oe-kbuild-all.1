Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B1AAD58
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 19:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677266472; x=1708802472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7X9O9NBSme/L3e3jH54htVmOapTAkrJyzUeruXaGN8U=;
  b=UxV+stNig3fYZgnF/4fup0MENVUgq0uC1WUBkVe6xjU3JRbA+SrPBzJv
   GLuKItQoXtaEt4HSnlPETUNC+xPt3gXv4pivcGH7S+xnSZHIu6xztgrCq
   6offkfNDB05Sc3BpyopVJSrBIYeTT8Lx0qJaGntMWD3IcRHtCF90iu+/F
   AV0zx9Ayvgu5pD9SIyKEtI9SfkPoKl63FLXuj7ZjIB/4KaGcPQm7ray7I
   znPhKcyiucbMsCP5aeWVuvKswaV2cjx+rtUe4aHIBd4HYqbp4WBSOUUDC
   4CweSN/pliHXcCeNJOTStSOIxKJyuMggBn581gI3UJstn8caTh4wk6hz2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="398293914"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="398293914"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 11:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="782473837"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="782473837"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 11:21:04 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVdct-0002ft-3A;
	Fri, 24 Feb 2023 19:21:03 +0000
Date: Sat, 25 Feb 2023 03:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 28/30]
 fs/binfmt_elf.c:1397:52: error: 'struct file' has no member named 'name'
Message-ID: <202302250327.4nRpPL5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   35ac5a9a53d2554bda395cdfa3236d278715caac
commit: 764a42eab1bbf21d84c3a32570df9a390af20d43 [28/30] debug prints
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230225/202302250327.4nRpPL5q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=764a42eab1bbf21d84c3a32570df9a390af20d43
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 764a42eab1bbf21d84c3a32570df9a390af20d43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250327.4nRpPL5q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/binfmt_elf.c:13:
   fs/binfmt_elf.c: In function 'load_elf_library':
>> fs/binfmt_elf.c:1397:52: error: 'struct file' has no member named 'name'
    1397 |         pr_info("trying %s on %s\n", __func__, file->name);
         |                                                    ^~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:530:9: note: in expansion of macro 'printk'
     530 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   fs/binfmt_elf.c:1397:9: note: in expansion of macro 'pr_info'
    1397 |         pr_info("trying %s on %s\n", __func__, file->name);
         |         ^~~~~~~


vim +1397 fs/binfmt_elf.c

  1385	
  1386	#ifdef CONFIG_USELIB
  1387	/* This is really simpleminded and specialized - we are loading an
  1388	   a.out library that is given an ELF header. */
  1389	static int load_elf_library(struct file *file)
  1390	{
  1391		struct elf_phdr *elf_phdata;
  1392		struct elf_phdr *eppnt;
  1393		unsigned long elf_bss, bss, len;
  1394		int retval, error, i, j;
  1395		struct elfhdr elf_ex;
  1396	
> 1397		pr_info("trying %s on %s\n", __func__, file->name);
  1398		error = -ENOEXEC;
  1399		retval = elf_read(file, &elf_ex, sizeof(elf_ex), 0);
  1400		if (retval < 0)
  1401			goto out;
  1402	
  1403		if (memcmp(elf_ex.e_ident, ELFMAG, SELFMAG) != 0)
  1404			goto out;
  1405	
  1406		/* First of all, some simple consistency checks */
  1407		if (elf_ex.e_type != ET_EXEC || elf_ex.e_phnum > 2 ||
  1408		    !elf_check_arch(&elf_ex) || !file->f_op->mmap)
  1409			goto out;
  1410		if (elf_check_fdpic(&elf_ex))
  1411			goto out;
  1412	
  1413		/* Now read in all of the header information */
  1414	
  1415		j = sizeof(struct elf_phdr) * elf_ex.e_phnum;
  1416		/* j < ELF_MIN_ALIGN because elf_ex.e_phnum <= 2 */
  1417	
  1418		error = -ENOMEM;
  1419		elf_phdata = kmalloc(j, GFP_KERNEL);
  1420		if (!elf_phdata)
  1421			goto out;
  1422	
  1423		eppnt = elf_phdata;
  1424		error = -ENOEXEC;
  1425		retval = elf_read(file, eppnt, j, elf_ex.e_phoff);
  1426		if (retval < 0)
  1427			goto out_free_ph;
  1428	
  1429		for (j = 0, i = 0; i<elf_ex.e_phnum; i++)
  1430			if ((eppnt + i)->p_type == PT_LOAD)
  1431				j++;
  1432		if (j != 1)
  1433			goto out_free_ph;
  1434	
  1435		while (eppnt->p_type != PT_LOAD)
  1436			eppnt++;
  1437	
  1438		/* Now use mmap to map the library into memory. */
  1439		error = vm_mmap(file,
  1440				ELF_PAGESTART(eppnt->p_vaddr),
  1441				(eppnt->p_filesz +
  1442				 ELF_PAGEOFFSET(eppnt->p_vaddr)),
  1443				PROT_READ | PROT_WRITE | PROT_EXEC,
  1444				MAP_FIXED_NOREPLACE | MAP_PRIVATE,
  1445				(eppnt->p_offset -
  1446				 ELF_PAGEOFFSET(eppnt->p_vaddr)));
  1447		if (error != ELF_PAGESTART(eppnt->p_vaddr))
  1448			goto out_free_ph;
  1449	
  1450		elf_bss = eppnt->p_vaddr + eppnt->p_filesz;
  1451		if (padzero(elf_bss)) {
  1452			error = -EFAULT;
  1453			goto out_free_ph;
  1454		}
  1455	
  1456		len = ELF_PAGEALIGN(eppnt->p_filesz + eppnt->p_vaddr);
  1457		bss = ELF_PAGEALIGN(eppnt->p_memsz + eppnt->p_vaddr);
  1458		if (bss > len) {
  1459			error = vm_brk(len, bss - len);
  1460			if (error)
  1461				goto out_free_ph;
  1462		}
  1463		error = 0;
  1464	
  1465	out_free_ph:
  1466		kfree(elf_phdata);
  1467	out:
  1468		return error;
  1469	}
  1470	#endif /* #ifdef CONFIG_USELIB */
  1471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
