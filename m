Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E631A16D9C2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725092334; cv=none; b=ETnQApYAjJBdSZCvUFcRM17p3FZMrUvY97KQLXQrO+3O4477zmoXzRj/9hfyqVTNWvpxIKTBYFyO6DokGbSHcY3EetPVHiDJes7/yiolwG/2agO3gjDl5hgrCl4iVgTJ77pLQP0cbjSf/cDOfwIAPQrUJq6N4eDBRuMUxzBec2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725092334; c=relaxed/simple;
	bh=f5KKYnctUcVn6XNtZ3guTn8j4LZV12rZXbkUiPCchaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dTmWX4xAQrP5rUm5e9R317JLi1uc9exTGLtLzQa/Cm9kp4jaOuN3Wa6742zSqIprYdaxUAEmSQ7/gtzsggY235rby0LMMYG6dZO92txkKSmVE7SeXCW4H6s3oILkmb2nPwI79TA1aNmT6vNAGewL6CQrapvglOkLq4TxbwT7zzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSs/KFuv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSs/KFuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725092333; x=1756628333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f5KKYnctUcVn6XNtZ3guTn8j4LZV12rZXbkUiPCchaY=;
  b=iSs/KFuvw37R2z/AknDV0j/uu/2Bmbllx5v/MPtAWRWXKw8rHwtL91Ig
   fAKc7sDewVJJRyhzJH1S+31isgQFscRWrfFyN3OMuLQqD1J9im9Ed/uBg
   EzswcOlzq4zzpApJBuDRQNctEMwmzu4zs+VMCX8chE7eKiApYsKES6LL5
   +Uffwk2G+CbWharkJ9tEntZo8i1THe74jRoK/ex4Fi+nAZMcZsD5J7gwv
   oc4VztjC10a2jCEAfaEObkw5LjAi+YYt/0M3RyBUQw4iHgCaQnAjPExQT
   sLQ2XEQifAverNxTfdmrhFAQI9ILxrn7hSviJ+tz63suzlp4E08lw7dlK
   w==;
X-CSE-ConnectionGUID: h+mCoeNoQ6iFy5KBhVodow==
X-CSE-MsgGUID: tQrqPanlRYOn5RoGqOWUVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="27531347"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="27531347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 01:18:52 -0700
X-CSE-ConnectionGUID: 2dBnMPleS8yp+DRdvOlokA==
X-CSE-MsgGUID: lWQ4iPm3TH+Z7w4vA8pzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64620752"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2024 01:18:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skJJp-0002S9-0V;
	Sat, 31 Aug 2024 08:18:49 +0000
Date: Sat, 31 Aug 2024 16:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:mm-generic-shadow-stack-guard 2/4]
 arch/mips/mm/mmap.c:100:15: error: conflicting types for
 'arch_get_unmapped_area'; have 'long unsigned int(struct file *, long
 unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'
Message-ID: <202408311630.zoXDd1pQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git mm-generic-shadow-stack-guard
head:   cee7666d4399dc5fc380d4bccf0ea2765ca0f475
commit: 188eb913ab0dd50e2b8210b1d716edeaa38dfa3e [2/4] mm: Make arch_get_unmapped_area() take vm_flags by default
config: mips-randconfig-r073-20240831 (https://download.01.org/0day-ci/archive/20240831/202408311630.zoXDd1pQ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311630.zoXDd1pQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311630.zoXDd1pQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/mm/mmap.c:100:15: error: conflicting types for 'arch_get_unmapped_area'; have 'long unsigned int(struct file *, long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'
     100 | unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
         |               ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/xarray.h:21,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1127,
                    from arch/mips/mm/mmap.c:12:
   include/linux/sched/mm.h:184:1: note: previous declaration of 'arch_get_unmapped_area' with type 'long unsigned int(struct file *, long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  vm_flags_t)' {aka 'long unsigned int(struct file *, long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'}
     184 | arch_get_unmapped_area(struct file *filp, unsigned long addr,
         | ^~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/mm/mmap.c:111:15: error: conflicting types for 'arch_get_unmapped_area_topdown'; have 'long unsigned int(struct file *, long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'
     111 | unsigned long arch_get_unmapped_area_topdown(struct file *filp,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:188:1: note: previous declaration of 'arch_get_unmapped_area_topdown' with type 'long unsigned int(struct file *, long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  vm_flags_t)' {aka 'long unsigned int(struct file *, long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'}
     188 | arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +100 arch/mips/mm/mmap.c

d0be89f6c2570a Jian Peng      2011-05-17   99  
d0be89f6c2570a Jian Peng      2011-05-17 @100  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
d0be89f6c2570a Jian Peng      2011-05-17  101  	unsigned long len, unsigned long pgoff, unsigned long flags)
d0be89f6c2570a Jian Peng      2011-05-17  102  {
16650107579aed Kevin Cernekee 2011-06-18  103  	return arch_get_unmapped_area_common(filp,
d0be89f6c2570a Jian Peng      2011-05-17  104  			addr0, len, pgoff, flags, UP);
d0be89f6c2570a Jian Peng      2011-05-17  105  }
d0be89f6c2570a Jian Peng      2011-05-17  106  
d0be89f6c2570a Jian Peng      2011-05-17  107  /*
d0be89f6c2570a Jian Peng      2011-05-17  108   * There is no need to export this but sched.h declares the function as
d0be89f6c2570a Jian Peng      2011-05-17  109   * extern so making it static here results in an error.
d0be89f6c2570a Jian Peng      2011-05-17  110   */
d0be89f6c2570a Jian Peng      2011-05-17 @111  unsigned long arch_get_unmapped_area_topdown(struct file *filp,
d0be89f6c2570a Jian Peng      2011-05-17  112  	unsigned long addr0, unsigned long len, unsigned long pgoff,
d0be89f6c2570a Jian Peng      2011-05-17  113  	unsigned long flags)
d0be89f6c2570a Jian Peng      2011-05-17  114  {
16650107579aed Kevin Cernekee 2011-06-18  115  	return arch_get_unmapped_area_common(filp,
d0be89f6c2570a Jian Peng      2011-05-17  116  			addr0, len, pgoff, flags, DOWN);
6f6c3c33c027f2 Ralf Baechle   2011-05-19  117  }
6f6c3c33c027f2 Ralf Baechle   2011-05-19  118  

:::::: The code at line 100 was first introduced by commit
:::::: d0be89f6c2570a63ac44ccdd12473a54243cd296 MIPS: topdown mmap support

:::::: TO: Jian Peng <jipeng2005@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
