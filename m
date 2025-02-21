Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F043C2F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131428; cv=none; b=d0YVWk8uB2204MIIoHd9JcSRvLVeYKe6M+fDYfhzcE5XEm2N7MP6xMU3uRmFj+EyQ00o69GGDa0fWtR0V9+qH90KOT+vM9rLWFebJtPLDSyhqtuCsrY31LHk+GDMa3Z7TL0sUUudxjpVSNGzD4GCNVN3egYpESrsTn8sbpGwI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131428; c=relaxed/simple;
	bh=dsFtSkYG0FAfESl/sZHzNE2SWdPD8BP8zwcOnUGZCUs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eX1gPrBso39Fnfof3kD34Koczp1Zr3M9bQwyHATXsEfesGDSOoGfpUSA7KwtVDEObMBC8xujJIVn10ZgBcUHKhQKRm9qxZ+lmN4xQGchwSJO3P8EPVB7RaVrgDxy7+RHvePnaYpGS99HovlvM+A9CXS93W51vP4Whsqcpbs5P4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0q9hQBR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0q9hQBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740131426; x=1771667426;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dsFtSkYG0FAfESl/sZHzNE2SWdPD8BP8zwcOnUGZCUs=;
  b=n0q9hQBRevwX5adfjcmu7mHFwpBw9p+StwPncxw42C8Wkoc4XVLZp0eT
   4qKsvq0T8uF7a/+vTSkmuZ+fqCTm6USxs46xJhU6yF/DT0uZ4Y4tgvpSE
   J3Jz1y8oTWUV/OQU0sg2bAGUsUqEf2qW2APzzCRJq8WlvO9ZlfB2+/J2U
   z339US44tw/dF2mIN5/OnBKpSIrhWTPE52VkZFvvG5nDccqquYWCCZC+a
   fERN1qV0s/D+eEu0z+jBXdiuHz+MPvajInjOPtWKLTRYa65LLpNue5ESo
   U/l+6xn8KSfksOHV3HnwTBJNsRrROQD5rf90TRVa2FDvJRUJ68NbudZoQ
   Q==;
X-CSE-ConnectionGUID: VyYF89CGRsKEieC/uoIjrw==
X-CSE-MsgGUID: glP5+J+TS1qzunSBXRjEtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="52350300"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="52350300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 01:50:19 -0800
X-CSE-ConnectionGUID: VZU8rZXjT76+yJLux7bQlg==
X-CSE-MsgGUID: KBqb4IBsQmyUMi6Lwqwvdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="119948576"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Feb 2025 01:50:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlPfi-0005Me-1t
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 09:50:15 +0000
Date: Fri, 21 Feb 2025 17:49:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:696:24: warning:
 variable 'v_tc_info' set but not used
Message-ID: <202502211736.Zs00eKr2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 15e8e5ffd624702ba2fa0d27566069922561ae95 [1/1] net: hns3: Add HNS3 driver to kernel build framework & MAINTAINERS
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250221/202502211736.Zs00eKr2-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211736.Zs00eKr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211736.Zs00eKr2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:23,
                    from include/linux/etherdevice.h:25,
                    from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:10:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:175:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:331:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:331:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c: In function 'hclge_tm_pri_vnet_base_shaper_qs_cfg':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:696:24: warning: variable 'v_tc_info' set but not used [-Wunused-but-set-variable]
     struct hnae3_tc_info *v_tc_info;
                           ^~~~~~~~~


vim +/v_tc_info +696 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c

848440544b41fbe Salil 2017-08-02  691  
848440544b41fbe Salil 2017-08-02  692  static int hclge_tm_pri_vnet_base_shaper_qs_cfg(struct hclge_vport *vport)
848440544b41fbe Salil 2017-08-02  693  {
848440544b41fbe Salil 2017-08-02  694  	struct hnae3_knic_private_info *kinfo = &vport->nic.kinfo;
848440544b41fbe Salil 2017-08-02  695  	struct hclge_dev *hdev = vport->back;
848440544b41fbe Salil 2017-08-02 @696  	struct hnae3_tc_info *v_tc_info;
848440544b41fbe Salil 2017-08-02  697  	u8 ir_u, ir_b, ir_s;
848440544b41fbe Salil 2017-08-02  698  	u32 i;
848440544b41fbe Salil 2017-08-02  699  	int ret;
848440544b41fbe Salil 2017-08-02  700  
848440544b41fbe Salil 2017-08-02  701  	for (i = 0; i < kinfo->num_tc; i++) {
848440544b41fbe Salil 2017-08-02  702  		v_tc_info = &kinfo->tc_info[i];
848440544b41fbe Salil 2017-08-02  703  		ret = hclge_shaper_para_calc(
848440544b41fbe Salil 2017-08-02  704  					hdev->tm_info.tc_info[i].bw_limit,
848440544b41fbe Salil 2017-08-02  705  					HCLGE_SHAPER_LVL_QSET,
848440544b41fbe Salil 2017-08-02  706  					&ir_b, &ir_u, &ir_s);
848440544b41fbe Salil 2017-08-02  707  		if (ret)
848440544b41fbe Salil 2017-08-02  708  			return ret;
848440544b41fbe Salil 2017-08-02  709  	}
848440544b41fbe Salil 2017-08-02  710  
848440544b41fbe Salil 2017-08-02  711  	return 0;
848440544b41fbe Salil 2017-08-02  712  }
848440544b41fbe Salil 2017-08-02  713  

:::::: The code at line 696 was first introduced by commit
:::::: 848440544b41fbe21f36072ee7dc7c3c59ce62e2 net: hns3: Add support of TX Scheduler & Shaper to HNS3 driver

:::::: TO: Salil <salil.mehta@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
