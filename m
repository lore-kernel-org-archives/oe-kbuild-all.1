Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32AA228B3E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066641; cv=none; b=RBW1HkUU5EEx9THcXSMwFqMf9rnibN51ijiS3MuJkJXaJW0Wrk5gJYPZD65jdCRrUjz8e7z/SZo9TC6J9HfT4a583t3kGy35o2Ojh1ZWLcETTepz3wUu5ySDEsbnVeR6nYAhgw+EzZm2m5OUf25jvgvKpyKJgvWCcNjkii6kyPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066641; c=relaxed/simple;
	bh=IeectrcAmahCkETXsMyKcnFMa9aLHclyq34pbQ3PAMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzkPiPDGUv7ldfkD1LGMPhHaoYqYQZi0RlFsrVERCyBB8ZeGeL7Uzs5VbyUzZ+cBi6H494rw04bm+u0mZ3LvZm3CXTAobcxYd0ed0eFvjmS1Stzfp4YQEg/NKf+JXMsuhWcrinZQnyGcjXP8Q7pruqCQ2sRTWYo77Nz/2usdwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3UEG8hu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3UEG8hu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728066640; x=1759602640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IeectrcAmahCkETXsMyKcnFMa9aLHclyq34pbQ3PAMM=;
  b=S3UEG8huvG3IGob7I9yGjjY75RfMkiaxjqfW0n3/cAgDue89zBOiAh2n
   NuahyqzRYiAC3SVnAMOwKJMFrBErTBToiGwbNyPB1fuI6S3TmnmMQB4Bh
   bI7ANykbFOxYSQZNmdc6FbUK5te9Ut0c7VMhsr5UVX/p/5U0It4Uy3Z2m
   JItZLjAWxUhB6S0zMvLFy4cGvxi2owLj7Udwf+TU5LH17r9jlXR9R6Eau
   AnnKMGjNOj/fZplkaPqc1B3jImYBaInpd9Uast+ei3ziDoIIbxY+lGo6/
   bJDlCTBGksnVWAfqn3MAO0j2b1DN3aFUGZBMxCOVDcNDWGDlOxf2iTn0V
   Q==;
X-CSE-ConnectionGUID: 9OdqjiXCRb28afPIQcxRuA==
X-CSE-MsgGUID: ZV2Zyh4OT7aXZHYfrKBLZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38691106"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="38691106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 11:30:36 -0700
X-CSE-ConnectionGUID: 3ZGpg4fwQPqtR7HzpMQuXA==
X-CSE-MsgGUID: Ms/YomiYSFCs6y2f5KFnxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="112252630"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Oct 2024 11:30:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swn4S-00024O-0H;
	Fri, 04 Oct 2024 18:30:32 +0000
Date: Sat, 5 Oct 2024 02:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Zong Li <zong.li@sifive.com>
Subject: [avpatel:riscv_sbi_nested_v2 20/33]
 drivers/iommu/riscv/iommu.c:792:26: sparse: sparse: dubious one-bit signed
 bitfield
Message-ID: <202410050252.2nFYIUXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v2
head:   5a44a9b6d41385ad478276867454bf0b460bc198
commit: 345c59795f11af97ca737e8316ad347f67dc4929 [20/33] iommu/riscv: Paging domain support
config: riscv-randconfig-r132-20241004 (https://download.01.org/0day-ci/archive/20241005/202410050252.2nFYIUXV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410050252.2nFYIUXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050252.2nFYIUXV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/riscv/iommu.c:1606:13: sparse: sparse: too long token expansion
   drivers/iommu/riscv/iommu.c:1606:13: sparse: sparse: too long token expansion
>> drivers/iommu/riscv/iommu.c:792:26: sparse: sparse: dubious one-bit signed bitfield

vim +792 drivers/iommu/riscv/iommu.c

   785	
   786	/* This struct contains protection domain specific IOMMU driver data. */
   787	struct riscv_iommu_domain {
   788		struct iommu_domain domain;
   789		struct list_head bonds;
   790		spinlock_t lock;		/* protect bonds list updates. */
   791		int pscid;
 > 792		int amo_enabled:1;
   793		int numa_node;
   794		unsigned int pgd_mode;
   795		unsigned long *pgd_root;
   796	};
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
