Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EEE2561
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 13:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675861207; x=1707397207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uJyQp7HtQtuAebErXc861HptsIOcLs2nxdUa//s8YVs=;
  b=VzEGS9c/LSbMOl5w7PjFrHLSRRKXRDcPcfRqDsVGC+5paFrWjgpJPSCf
   jtxMfgBjehkBNbBiavctCwZIlqjRHbS86ZnWwOZRKxgu+kPWbt32j+m0G
   a0g89gD0CSQgcRXTHOOIHqyZJW6z5BGZHEWg7NgJqUGdmy7moLZcoTEcw
   FXiT+T6f0DsVAzPsjms3crA4eH2mpzA76HSxHdKMOZtvuYu9de971Zt8w
   s//N/fYgg1XpHp04d6s3JIIEVtl1Ic1ytS5Vuo5UWMspxbJSTrSZLc2Pu
   dCrx5YNd4NZ+fTytGjEFHjgB1pXnKWQRLpIAZMfH5kR7qIj2iLHt+O+E6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="329813912"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="329813912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 05:00:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="644855934"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="644855934"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 05:00:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPk3P-0004S5-2f;
	Wed, 08 Feb 2023 13:00:03 +0000
Date: Wed, 8 Feb 2023 20:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 30/31]
 fs/binfmt_elf.c:1397:52: error: 'struct file' has no member named 'name'
Message-ID: <202302082038.ccyUJ4Bg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   e6fc25ec2770c9db62486fb1f291b99531f86533
commit: 269949ccfda3ce7d938f14116dbd903b0216c98b [30/31] debug prints
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230208/202302082038.ccyUJ4Bg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=269949ccfda3ce7d938f14116dbd903b0216c98b
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 269949ccfda3ce7d938f14116dbd903b0216c98b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
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
