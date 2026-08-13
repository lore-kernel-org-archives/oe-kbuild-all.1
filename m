Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261211F8691
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786581978; cv=none; b=hC+5a0x5HNuo3GVxhSDTNkY1FhGTQohSW14T748spF/lDq//JLa/r0qwKXD7lo8ODbCASmbaQ1AoE2OluW1PqVXQ/5DAteIV1oj9JZbaGqJWQWAbIr8v72GbzvrLK47t4qnNdNWL91ixiZZhS6G+z/ULdyZzhfiRtX86axARcZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786581978; c=relaxed/simple;
	bh=ZFIbVlc6kcHAjuZzvBOiQ3oqtFKA4HhdR5Hl9Gcx3SY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HOM+Ur5Wk3lisa7ySBsSPJX/8KzvrND0w7Y3aET7S8I9BwaLphwxMjCpwpcbcs/QM0GfNSQd6psHwzoteI5MAdKa4p86aK2ZRbH0yumTpj1V9QOuH8nT+AOb7okrg4C4S1nosXQGpiNwPOCZoTzIKBReU7ntYv0ED8IhVOcwOXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtDQ56v1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtDQ56v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786581976; x=1818117976;
  h=date:from:to:cc:subject:message-id;
  bh=ZFIbVlc6kcHAjuZzvBOiQ3oqtFKA4HhdR5Hl9Gcx3SY=;
  b=OtDQ56v1rvdO8TetDQSrKPbSKtmV0Ly2Safn+Ski9cHxrFcN+fc3xwHw
   SUdRBVBmVHBNFIAaPjpHPtbGw8Jtmxb2J3UHeP9nGsPWosv5SIcNKMzy5
   AaI/CF08oKbZYD/tlHh6IaqiZCR13+KWO1EdL0is5csXWfURZXp0yG5Rq
   0oEMhXJFbCdTI1ZjSVHtSmE6jhfOdTwPBnKfYVuqrBzYdwSJ95lPg+Axq
   TfoxWMyKyijZFQE8ITcGs2NTrNzWhWNABLw5Wh+hzeGjSU3QqbkTvqFS8
   K9Y3UbtyoGz68rVBZI0nJQ+tYQIQxPxPLOCyqnZlhQcR2EgaVy+saYAIL
   w==;
X-CSE-ConnectionGUID: vxR0q2p5T1q4a1SGgEVvkw==
X-CSE-MsgGUID: +4DukWHKTe68pfndsmmlmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90830457"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="90830457"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 17:46:15 -0700
X-CSE-ConnectionGUID: RpFu17MxSf2KO8jehboDkQ==
X-CSE-MsgGUID: MP+tgtqwQESd7uP/1+i+PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="259537287"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2026 17:46:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuJaE-00000000SJi-3FEZ;
	Thu, 13 Aug 2026 00:46:10 +0000
Date: Thu, 13 Aug 2026 08:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 9410/14447]
 arch/s390/include/asm/io.h:30:22: warning: initialization of 'void *' from
 'int' makes pointer from integer without a cast
Message-ID: <202608130820.nc4XnOyu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e6de6a2b522f659defacb1551d0465ba6ce13cf
commit: 0b0379fcf9ce395bb51cadb6552ec3b1380436bb [9410/14447] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
config: s390-randconfig-r122-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130820.nc4XnOyu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130820.nc4XnOyu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130820.nc4XnOyu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/firmware/qcom/qcom_scm.c:13:
   include/linux/firmware/qcom/qcom_pas.h: In function 'qcom_pas_ctx_map':
   arch/s390/include/asm/io.h:30:22: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_np'? [-Werror=implicit-function-declaration]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:9: note: in expansion of macro 'ioremap_prot'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_pas.h:29:29: note: in expansion of macro 'ioremap_wc'
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^~~~~~~~~~
>> arch/s390/include/asm/io.h:30:22: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:9: note: in expansion of macro 'ioremap_prot'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_pas.h:29:29: note: in expansion of macro 'ioremap_wc'
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +30 arch/s390/include/asm/io.h

cd24834130ac65 Jan Glauber 2012-11-29  26  
b43b3fff042d08 Baoquan He  2023-07-06  27  /*
b43b3fff042d08 Baoquan He  2023-07-06  28   * I/O memory mapping functions.
b43b3fff042d08 Baoquan He  2023-07-06  29   */
b43b3fff042d08 Baoquan He  2023-07-06 @30  #define ioremap_prot ioremap_prot
b43b3fff042d08 Baoquan He  2023-07-06  31  #define iounmap iounmap
b43b3fff042d08 Baoquan He  2023-07-06  32  

:::::: The code at line 30 was first introduced by commit
:::::: b43b3fff042d08a0bcc0a6d87c3216b44860298e s390: mm: convert to GENERIC_IOREMAP

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
