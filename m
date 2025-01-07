Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBA8632B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 01:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736215118; cv=none; b=IuPUKTQ9YwnYL0qxgxXLhyxU+W13xm81PgdXf9TcLxoKYGcgDtYZbEJGoPai6c10qUJt0CtQ2ZhytMJ5xF8dpt4EuqJXZycWuTuZMmPWPFxtR/vApRs8OSTec6HOx+zgVolvTGeFfTsq+53pyJnlBJZaCPYXhgUjZROj0idywCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736215118; c=relaxed/simple;
	bh=SR1U6et2sgAocYVGORZ6wFR+mPnH34yScpjI0jeidIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJMHSMlIydSCA7yK4XaEdIYwuOzYeqNtZzwNsHFVxoGNKqc/F+wUTuApZOqe5dUKs8TB9pLweRl1MABmEUNFGTid8aP6DYrDf4haMMcaRLiSIC3Ff/GSuaqk5tbCozA6PFiuO711VRXGBvtYFm8IzSAoeKKOb+b5S1bZn0OnPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8EG7HAL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8EG7HAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736215115; x=1767751115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SR1U6et2sgAocYVGORZ6wFR+mPnH34yScpjI0jeidIc=;
  b=m8EG7HALWW3hlGlGld74Kymkh2t1qYBfBfp2S8AZP5TucCH4re+Nzemd
   YNe0hpJguXa9kJJGgeu24YDlV/dtS2xrT8YdmpRBioS4eVWzHf0NjdeZy
   Bl9qGt/Nx7CpoZsG0P/zNF/DkoIA4FSUIIWhfIki6MZFvJpY0B0EfYm6/
   eK6S0YqScaBFedJcJROW4QxCoq4y/AvkmTzrnZmRblC2+Vf53q+S+TlD7
   UZpiN8CKVxc6rdqTe4+w8cmWzGFszOfhESokpRxu1nz1BVzJMjvuLxZ3p
   SRPIy/8evNbhsotYIVyZsPgzL0GZfUYS/PH5LbNxRSRlkmzGdGXiM6sVY
   A==;
X-CSE-ConnectionGUID: N6TrvXg0TMajkoMnDwAJdQ==
X-CSE-MsgGUID: a1LBdOt/RYOZdWhDpz7fTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36076033"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36076033"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:58:35 -0800
X-CSE-ConnectionGUID: B4pAxmz5S0OCm980QnguXA==
X-CSE-MsgGUID: l5k5mNK5QxqD9MDCR5Mszg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102480911"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2025 17:58:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUyrX-000E75-0r;
	Tue, 07 Jan 2025 01:58:31 +0000
Date: Tue, 7 Jan 2025 09:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/powerpc/platforms/44x/warp.c:316:22: sparse: sparse: incorrect
 type in argument 1 (incompatible argument 1 (different address spaces))
Message-ID: <202501070924.pFM8uHGJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 5b9e00a6004cf837c43fdb8d5290df619de78024 powerpc/4xx: Fix warp_gpio_leds build failure
date:   10 months ago
config: powerpc-randconfig-r131-20250107 (https://download.01.org/0day-ci/archive/20250107/202501070924.pFM8uHGJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250107/202501070924.pFM8uHGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070924.pFM8uHGJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/44x/warp.c:316:22: sparse: sparse: incorrect type in argument 1 (incompatible argument 1 (different address spaces)) @@     expected int ( *threadfn )( ... ) @@     got int ( * )( ... ) @@
   arch/powerpc/platforms/44x/warp.c:316:22: sparse:     expected int ( *threadfn )( ... )
   arch/powerpc/platforms/44x/warp.c:316:22: sparse:     got int ( * )( ... )
>> arch/powerpc/platforms/44x/warp.c:316:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *data @@     got void [noderef] __iomem *static [assigned] [toplevel] dtm_fpga @@
   arch/powerpc/platforms/44x/warp.c:316:22: sparse:     expected void *data
   arch/powerpc/platforms/44x/warp.c:316:22: sparse:     got void [noderef] __iomem *static [assigned] [toplevel] dtm_fpga
   arch/powerpc/platforms/44x/warp.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +316 arch/powerpc/platforms/44x/warp.c

f9bdedb2c5f2952 Sean MacLennan 2008-01-22  298  
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  299  static int __init pika_dtm_start(void)
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  300  {
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  301  	struct task_struct *dtm_thread;
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  302  	struct device_node *np;
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  303  
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  304  	np = of_find_compatible_node(NULL, NULL, "pika,fpga");
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  305  	if (np == NULL)
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  306  		return -ENOENT;
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  307  
4ebef31fa6e013e Sean MacLennan 2008-05-20  308  	dtm_fpga = of_iomap(np, 0);
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  309  	of_node_put(np);
4ebef31fa6e013e Sean MacLennan 2008-05-20  310  	if (dtm_fpga == NULL)
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  311  		return -ENOENT;
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  312  
805e324b7fbddf9 Sean MacLennan 2009-04-06  313  	/* Must get post info before thread starts. */
805e324b7fbddf9 Sean MacLennan 2009-04-06  314  	warp_post_info();
805e324b7fbddf9 Sean MacLennan 2009-04-06  315  
4ebef31fa6e013e Sean MacLennan 2008-05-20 @316  	dtm_thread = kthread_run(pika_dtm_thread, dtm_fpga, "pika-dtm");
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  317  	if (IS_ERR(dtm_thread)) {
4ebef31fa6e013e Sean MacLennan 2008-05-20  318  		iounmap(dtm_fpga);
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  319  		return PTR_ERR(dtm_thread);
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  320  	}
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  321  
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  322  	return 0;
f9bdedb2c5f2952 Sean MacLennan 2008-01-22  323  }
4ebef31fa6e013e Sean MacLennan 2008-05-20  324  machine_late_initcall(warp, pika_dtm_start);
4ebef31fa6e013e Sean MacLennan 2008-05-20  325  

:::::: The code at line 316 was first introduced by commit
:::::: 4ebef31fa6e013e5cd3d4522e6018eb6d55046be [POWERPC] PIKA Warp: Update platform code to support Rev B boards

:::::: TO: Sean MacLennan <smaclennan@pikatech.com>
:::::: CC: Josh Boyer <jwboyer@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
