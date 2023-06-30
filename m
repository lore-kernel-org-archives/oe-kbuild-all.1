Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEBE15AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 02:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688090650; x=1719626650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Du8/tIsdY1bnW0EeAbqhwPYBcLwTk5IjgQcZKeTzjoQ=;
  b=RC3l03hnZRT983DaiCTNRl5si7MoV2eTj1OdG3gRqoVn3s6CnXEuyGbD
   WhQGfmP76B6uFchrZ73WuByz4DOFIlZWVBBYnqF/QVFFnPj3fDRqGWi5B
   9vCJXGhkUxFdGVxIwlMeYoFXGI/UR0+oyVyrirmKFm4zwKH1DGHumonPL
   o1pLM748dRlt21/YtaaDZmoPiqHQet+0ngrwRxEM0HZDYbD11W3zs5AiT
   4zxX5ZlAKG9nRxcB3ZIX1PiG7U0grN6y8HpxTcLKKMkVUNkVgz2CvUC/o
   jNw0Svj26ExKarAbVG+FI+VS9e5R+Ow//80JH1UXBxNjtMtgudnUNC756
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352108763"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="352108763"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 19:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="752848543"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="752848543"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Jun 2023 19:04:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF3UV-000EbD-10;
	Fri, 30 Jun 2023 02:04:07 +0000
Date: Fri, 30 Jun 2023 10:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split 20/26]
 fs/binfmt_elf.c:1402:52: error: 'struct file' has no member named 'name'
Message-ID: <202306300926.aYfRqO7s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split
head:   d0cf2fe7497259ee8a7308da99a8cbafaab5e5b5
commit: 8560cbc95c9fafe667f0faf076bba96cc2f4c717 [20/26] debug prints
config: arc-randconfig-r043-20230630 (https://download.01.org/0day-ci/archive/20230630/202306300926.aYfRqO7s-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300926.aYfRqO7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300926.aYfRqO7s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:30,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from fs/binfmt_elf.c:13:
   fs/binfmt_elf.c: In function 'load_elf_binary':
   include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   fs/binfmt_elf.c:1371:9: note: in expansion of macro 'pr_info'
    1371 |         pr_info("%s: call START_THREAD() entry at 0x%08x\n", __func__, elf_entry);
         |         ^~~~~~~
   fs/binfmt_elf.c: In function 'load_elf_library':
>> fs/binfmt_elf.c:1402:52: error: 'struct file' has no member named 'name'
    1402 |         pr_info("trying %s on %s\n", __func__, file->name);
         |                                                    ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   fs/binfmt_elf.c:1402:9: note: in expansion of macro 'pr_info'
    1402 |         pr_info("trying %s on %s\n", __func__, file->name);
         |         ^~~~~~~


vim +1402 fs/binfmt_elf.c

  1390	
  1391	#ifdef CONFIG_USELIB
  1392	/* This is really simpleminded and specialized - we are loading an
  1393	   a.out library that is given an ELF header. */
  1394	static int load_elf_library(struct file *file)
  1395	{
  1396		struct elf_phdr *elf_phdata;
  1397		struct elf_phdr *eppnt;
  1398		unsigned long elf_bss, bss, len;
  1399		int retval, error, i, j;
  1400		struct elfhdr elf_ex;
  1401	
> 1402		pr_info("trying %s on %s\n", __func__, file->name);
  1403		error = -ENOEXEC;
  1404		retval = elf_read(file, &elf_ex, sizeof(elf_ex), 0);
  1405		if (retval < 0)
  1406			goto out;
  1407	
  1408		if (memcmp(elf_ex.e_ident, ELFMAG, SELFMAG) != 0)
  1409			goto out;
  1410	
  1411		/* First of all, some simple consistency checks */
  1412		if (elf_ex.e_type != ET_EXEC || elf_ex.e_phnum > 2 ||
  1413		    !elf_check_arch(&elf_ex) || !file->f_op->mmap)
  1414			goto out;
  1415		if (elf_check_fdpic(&elf_ex))
  1416			goto out;
  1417	
  1418		/* Now read in all of the header information */
  1419	
  1420		j = sizeof(struct elf_phdr) * elf_ex.e_phnum;
  1421		/* j < ELF_MIN_ALIGN because elf_ex.e_phnum <= 2 */
  1422	
  1423		error = -ENOMEM;
  1424		elf_phdata = kmalloc(j, GFP_KERNEL);
  1425		if (!elf_phdata)
  1426			goto out;
  1427	
  1428		eppnt = elf_phdata;
  1429		error = -ENOEXEC;
  1430		retval = elf_read(file, eppnt, j, elf_ex.e_phoff);
  1431		if (retval < 0)
  1432			goto out_free_ph;
  1433	
  1434		for (j = 0, i = 0; i<elf_ex.e_phnum; i++)
  1435			if ((eppnt + i)->p_type == PT_LOAD)
  1436				j++;
  1437		if (j != 1)
  1438			goto out_free_ph;
  1439	
  1440		while (eppnt->p_type != PT_LOAD)
  1441			eppnt++;
  1442	
  1443		/* Now use mmap to map the library into memory. */
  1444		error = vm_mmap(file,
  1445				ELF_PAGESTART(eppnt->p_vaddr),
  1446				(eppnt->p_filesz +
  1447				 ELF_PAGEOFFSET(eppnt->p_vaddr)),
  1448				PROT_READ | PROT_WRITE | PROT_EXEC,
  1449				MAP_FIXED_NOREPLACE | MAP_PRIVATE,
  1450				(eppnt->p_offset -
  1451				 ELF_PAGEOFFSET(eppnt->p_vaddr)));
  1452		if (error != ELF_PAGESTART(eppnt->p_vaddr))
  1453			goto out_free_ph;
  1454	
  1455		elf_bss = eppnt->p_vaddr + eppnt->p_filesz;
  1456		if (padzero(elf_bss)) {
  1457			error = -EFAULT;
  1458			goto out_free_ph;
  1459		}
  1460	
  1461		len = ELF_PAGEALIGN(eppnt->p_filesz + eppnt->p_vaddr);
  1462		bss = ELF_PAGEALIGN(eppnt->p_memsz + eppnt->p_vaddr);
  1463		if (bss > len) {
  1464			error = vm_brk(len, bss - len);
  1465			if (error)
  1466				goto out_free_ph;
  1467		}
  1468		error = 0;
  1469	
  1470	out_free_ph:
  1471		kfree(elf_phdata);
  1472	out:
  1473		return error;
  1474	}
  1475	#endif /* #ifdef CONFIG_USELIB */
  1476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
