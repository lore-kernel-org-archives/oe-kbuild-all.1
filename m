Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14EE75801
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833200; cv=none; b=GprJb316e9zzhaSivwFGNyffILzbM+vXWw4EvrfcsJU5MiRCnXafKcjVjjQxPlw8fVJU5ns/YI8nQ/tc0W8T5Pl+SpQVRKPGjEYyWSRl5jUmBBoXtioeW/dtgaxgGJdiyR0jUH7KnQesyEUxzGgc7kZTDCLKIxgCGSsQVUqAE8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833200; c=relaxed/simple;
	bh=sbWUA6KmaBewwYduB0yHnWnv/N+FYn+YY461LOO1wec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lto1d3DyVeOs0bvzB5Q02ndOvWTStfSbW0aST98RKmrx8hWEZUH81iMPROZUPfm/Fbt27vMzS4ps/AT0inIccXnwCQQMDol/kcimcVcyg/GPVgXlFiCsnrGBWdsByRv9H3mMHra2OWJ8Sytr7js5cWVWLeHABIj+unDiX0GGeOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yra5fnKq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yra5fnKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785833199; x=1817369199;
  h=date:from:to:cc:subject:message-id;
  bh=sbWUA6KmaBewwYduB0yHnWnv/N+FYn+YY461LOO1wec=;
  b=Yra5fnKq6ToVs5n0K3CnKr7gyu0fY9zS66vNldNs9qG23iZ90UdRy4Ag
   motJjpOZ/F4Qmq/ViUmIeJfTUBZsfNEb9vYqsxFjMvAjBEqB4HE3YZ+fW
   sZxFbDaoCVyTLj8ULdU3s6zwKZp1cmuIiKv0XP6jjGFY7AN4zkkqmO5r5
   vz0MFMPrk6DJpFJzPm9liUM+BfEQrFE36XsN/8NX30XaYV8ZqdZA45xrj
   opvxN0c3RUnzIp9uDpQmGCqoOjac5K4oBb5W7+TYrmJNTDTUxxGCdkT1P
   Jbra7W25jSBMxH3WGVW2HT7/RPOXgVfKfND0QhFtj6fQX7AIrrBo5HOyB
   A==;
X-CSE-ConnectionGUID: 8OzeZpKKQhyHLZO4kZ2MlA==
X-CSE-MsgGUID: 8tvaWQS6R5CNnYkevj3uyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85508761"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="85508761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:46:35 -0700
X-CSE-ConnectionGUID: kAynEZtTR9WQWKU1VIo3aQ==
X-CSE-MsgGUID: 0dxGFllqQi+d9kuUXOp+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="265704556"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2026 01:46:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrAn3-000000009ST-42vx;
	Tue, 04 Aug 2026 08:46:25 +0000
Date: Tue, 04 Aug 2026 16:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 9937/12137]
 include/linux/firmware/qcom/qcom_pas.h:29:22: error: call to undeclared
 function 'ioremap_prot'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608041612.46Ufbn5W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
commit: 0b0379fcf9ce395bb51cadb6552ec3b1380436bb [9937/12137] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
config: s390-randconfig-r061-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041612.46Ufbn5W-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041612.46Ufbn5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041612.46Ufbn5W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/qcom/qcom_scm.c:16:
>> include/linux/firmware/qcom/qcom_pas.h:29:22: error: call to undeclared function 'ioremap_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^
   arch/s390/include/asm/io.h:36:2: note: expanded from macro 'ioremap_wc'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^
   arch/s390/include/asm/io.h:30:22: note: expanded from macro 'ioremap_prot'
      30 | #define ioremap_prot ioremap_prot
         |                      ^
   In file included from drivers/firmware/qcom/qcom_scm.c:16:
>> include/linux/firmware/qcom/qcom_pas.h:29:16: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/ioremap_prot +29 include/linux/firmware/qcom/qcom_pas.h

    26	
    27	static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
    28	{
  > 29		void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
    30	
    31		if (!ptr)
    32			dev_err(ctx->dev, "unable to map memory region: %pa+%zx\n",
    33				&ctx->mem_phys, ctx->mem_size);
    34		return ptr;
    35	}
    36	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
