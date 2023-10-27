Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4707A10EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 01:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bx5fgYpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698370916; x=1729906916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9tQHN4VzqlDYiXuXFMzG3XzF1LDc4vyjxX8lqPpLow=;
  b=bx5fgYpOxFgG4uuoh/1Iu+fI2AyFGz0pefK1tCl+1/4ICmHWlgLU4K7R
   vBKLFcoCq86zmUM1VszyLjpo1iI/zYB+jzIEtTGBleYTmWNz79wtRcn3b
   ILx3FCHE0I33lBynuF0UdrId6uZqE0fPluiiR0wfoa6ykiRTN02Kc+qjr
   S4zm+L2vOXQDJ++zsY1n7RpEcpE6TGiYOz/UOifeRkN8FUR+d5FIuFWVk
   aUd7Uu246jIaXGqUWDRaXJAnj4r21r1DD93YCfZNkFa8sclRaxjvGycK1
   Gmm9j/l1haZCCKYfWENTFqg1rS7uNsL+XBZHIlN8BlWRwoe7ff7w+mVDq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="503481"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="503481"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 18:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="829814654"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="829814654"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2023 18:41:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwBrD-000AJZ-2z;
	Fri, 27 Oct 2023 01:41:51 +0000
Date: Fri, 27 Oct 2023 09:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:not-for-next 29/31] arch/riscv/mm/tlbflush.c:52:22: warning:
 variable 'cpuid' set but not used
Message-ID: <202310270904.BLURg3Fw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git not-for-next
head:   d48a31c4c94d60298ff5b565d0fdf11878118fe1
commit: 4957b7691399c5a20541ba717d9f51ab2ae14695 [29/31] riscv: mm: Combine the SMP and non-SMP TLB flushing code
config: riscv-randconfig-002-20231027 (https://download.01.org/0day-ci/archive/20231027/202310270904.BLURg3Fw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270904.BLURg3Fw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270904.BLURg3Fw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/mm/tlbflush.c: In function '__flush_tlb_range':
>> arch/riscv/mm/tlbflush.c:52:22: warning: variable 'cpuid' set but not used [-Wunused-but-set-variable]
      52 |         unsigned int cpuid;
         |                      ^~~~~


vim +/cpuid +52 arch/riscv/mm/tlbflush.c

18d2199d81054f4 Anup Patel        2023-03-28  46  
18d2199d81054f4 Anup Patel        2023-03-28  47  static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
c3b2d67046d236e Nanyong Sun       2021-04-30  48  			      unsigned long size, unsigned long stride)
95594cb40c6e013 Christoph Hellwig 2019-08-21  49  {
7c486a58ec2be19 Samuel Holland    2023-09-09  50  	unsigned long asid = cntx2asid(atomic_long_read(&mm->context.id));
70c7605c08c5979 Christoph Hellwig 2021-06-06  51  	struct cpumask *cmask = mm_cpumask(mm);
31738ede9b339c9 Atish Patra       2019-08-22 @52  	unsigned int cpuid;
95594cb40c6e013 Christoph Hellwig 2019-08-21  53  
6384423f49c804d Atish Patra       2019-08-22  54  	if (cpumask_empty(cmask))
6384423f49c804d Atish Patra       2019-08-22  55  		return;
6384423f49c804d Atish Patra       2019-08-22  56  
31738ede9b339c9 Atish Patra       2019-08-22  57  	cpuid = get_cpu();
4957b7691399c5a Samuel Holland    2023-09-09  58  #ifdef CONFIG_SMP
3f1e782998cdf6d Guo Ren           2021-06-06  59  	/* check if the tlbflush needs to be sent to other CPUs */
7c486a58ec2be19 Samuel Holland    2023-09-09  60  	if (cpumask_any_but(cmask, cpuid) < nr_cpu_ids) {
18d2199d81054f4 Anup Patel        2023-03-28  61  		if (riscv_use_ipi_for_rfence()) {
4957b7691399c5a Samuel Holland    2023-09-09  62  			struct flush_tlb_range_data ftd;
4957b7691399c5a Samuel Holland    2023-09-09  63  
18d2199d81054f4 Anup Patel        2023-03-28  64  			ftd.asid = asid;
18d2199d81054f4 Anup Patel        2023-03-28  65  			ftd.start = start;
18d2199d81054f4 Anup Patel        2023-03-28  66  			ftd.size = size;
18d2199d81054f4 Anup Patel        2023-03-28  67  			ftd.stride = stride;
18d2199d81054f4 Anup Patel        2023-03-28  68  			on_each_cpu_mask(cmask,
18d2199d81054f4 Anup Patel        2023-03-28  69  					 __ipi_flush_tlb_range_asid,
18d2199d81054f4 Anup Patel        2023-03-28  70  					 &ftd, 1);
18d2199d81054f4 Anup Patel        2023-03-28  71  		} else
18d2199d81054f4 Anup Patel        2023-03-28  72  			sbi_remote_sfence_vma_asid(cmask,
18d2199d81054f4 Anup Patel        2023-03-28  73  						   start, size, asid);
18d2199d81054f4 Anup Patel        2023-03-28  74  	} else
4957b7691399c5a Samuel Holland    2023-09-09  75  #endif
7c486a58ec2be19 Samuel Holland    2023-09-09  76  		local_flush_tlb_range_asid(start, size, stride, asid);
31738ede9b339c9 Atish Patra       2019-08-22  77  	put_cpu();
95594cb40c6e013 Christoph Hellwig 2019-08-21  78  }
95594cb40c6e013 Christoph Hellwig 2019-08-21  79  

:::::: The code at line 52 was first introduced by commit
:::::: 31738ede9b339c90216b8fd10da0b1567a041f06 RISC-V: Issue a local tlbflush if possible.

:::::: TO: Atish Patra <atish.patra@wdc.com>
:::::: CC: Paul Walmsley <paul.walmsley@sifive.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
