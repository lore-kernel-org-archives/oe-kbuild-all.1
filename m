Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A18612F6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709574507; cv=none; b=uktn9Q8MDpRK6898J5EcxUCo5eU3PuXBu+Vc1y/c2MvSO7x0pU3SbjvMNpvL+D8DYGAVMtSB+8Qy9o8zJmp9nenK9dnQktqYdT66h/wBqa2GHWJZcDji1LMUNHctxOsrjq/wXJKW88e0eCxVkChSkbDRVrL+Auc+63CzLDOOBm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709574507; c=relaxed/simple;
	bh=RwN73zyBb6vkbiMZFV3YrkOYMlg+LQj1eKp5Jy9hYwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdXkthbacKkkFFyyPZMdCxxyo1ZO61HvtSLiU3/6IJFE9b+qnec7Dwfp87Ob+3/QfmMFLtDlysbJeqYAHk44JIgZv9JXAKEMDGRzNsWeaQW0U8LyQGtv1+33UWxLIK5RJob9Op3t+BaKXzCsBiqjviZ/Z2icde5LY6HjX3l3qC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbaaRDIZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbaaRDIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709574506; x=1741110506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RwN73zyBb6vkbiMZFV3YrkOYMlg+LQj1eKp5Jy9hYwY=;
  b=JbaaRDIZCgxyiFerCw9ftCK0QvAbuwzvVfLVJF9NhoJUvAqVtBEC+IJY
   uDlKnpdX2PrRsMm/5aSRWxTk2gAqs5aEEwllOHzlV4a6XlTfC+2/3UUJY
   UdSwO9uLb/6pA7000uTgpjDkY1kTJdLDLe+/+GRNvp3voJT4h2EU5uq15
   PCBK7JsnFpfzH/3CtSR2wplhNvNUYElvE0nOY8xS0ms85m5G/99aSLsGY
   QwsuukvPqrswjCQ1quKZgjocNDIkIVettrFTfftCeTxrr+pMUe+ek05CD
   sqlpfurYtgmKYRu6ymxYeMW1xC4IUsF/1vwVmxR+Gq8TS2B8gSnAVX88o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4007902"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4007902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 09:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13773763"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 09:48:19 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhCQC-0002g5-06;
	Mon, 04 Mar 2024 17:48:16 +0000
Date: Tue, 5 Mar 2024 01:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma
 expression has no effect
Message-ID: <202403050153.l8ChdUsk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 4a9714aa8fd6f64bfb6f213bf613d012ca810daa iommu: Move fwspec->iommu_priv to struct dev_iommu
date:   9 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240305/202403050153.l8ChdUsk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050153.l8ChdUsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050153.l8ChdUsk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm-smmu.c: In function 'arm_smmu_master_alloc_smes':
   drivers/iommu/arm-smmu.c:1016:49: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1016 |         struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
         |                                                 ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1024:9: note: in expansion of macro 'for_each_cfg_sme'
    1024 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1024:9: note: in expansion of macro 'for_each_cfg_sme'
    1024 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1057:9: note: in expansion of macro 'for_each_cfg_sme'
    1057 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1057:9: note: in expansion of macro 'for_each_cfg_sme'
    1057 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_master_free_smes':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1076:40: note: in expansion of macro 'fwspec_smmu'
    1076 |         struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
         |                                        ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1077:49: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1077 |         struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
         |                                                 ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1081:9: note: in expansion of macro 'for_each_cfg_sme'
    1081 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1081:9: note: in expansion of macro 'for_each_cfg_sme'
    1081 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_domain_add_master':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1103:9: note: in expansion of macro 'for_each_cfg_sme'
    1103 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1103:9: note: in expansion of macro 'for_each_cfg_sme'
    1103 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_attach_dev':
   drivers/iommu/arm-smmu.c:1134:20: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1134 |         if (!fwspec->iommu_priv)
         |                    ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1137:16: note: in expansion of macro 'fwspec_smmu'
    1137 |         smmu = fwspec_smmu(fwspec);
         |                ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_add_device':
   drivers/iommu/arm-smmu.c:1379:15: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1379 |         fwspec->iommu_priv = cfg;
         |               ^~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_remove_device':
   drivers/iommu/arm-smmu.c:1417:22: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1417 |         cfg  = fwspec->iommu_priv;
         |                      ^~
   drivers/iommu/arm-smmu.c:1430:21: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1430 |         kfree(fwspec->iommu_priv);
         |                     ^~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_device_group':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1437:40: note: in expansion of macro 'fwspec_smmu'
    1437 |         struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
         |                                        ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1441:9: note: in expansion of macro 'for_each_cfg_sme'
    1441 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1441:9: note: in expansion of macro 'for_each_cfg_sme'
    1441 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: At top level:
   drivers/iommu/arm-smmu.c:1586:35: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1586 |         .map                    = arm_smmu_map,
         |                                   ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1586:35: note: (near initialization for 'arm_smmu_ops.map')
   cc1: some warnings being treated as errors
--
   drivers/iommu/qcom_iommu.c: In function 'to_iommu':
   drivers/iommu/qcom_iommu.c:81:22: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
      81 |         return fwspec->iommu_priv;
         |                      ^~
   drivers/iommu/qcom_iommu.c: In function 'qcom_iommu_of_xlate':
   drivers/iommu/qcom_iommu.c:587:20: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     587 |         if (!fwspec->iommu_priv) {
         |                    ^~
   drivers/iommu/qcom_iommu.c:588:23: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     588 |                 fwspec->iommu_priv = qcom_iommu;
         |                       ^~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:19,
                    from arch/arm64/include/asm/processor.h:31,
                    from include/linux/mutex.h:19,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/iommu/qcom_iommu.c:11:
   drivers/iommu/qcom_iommu.c:594:49: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     594 |                 if (WARN_ON(qcom_iommu != fwspec->iommu_priv))
         |                                                 ^~
   include/asm-generic/bug.h:114:32: note: in definition of macro 'WARN_ON'
     114 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/qcom_iommu.c: At top level:
   drivers/iommu/qcom_iommu.c:607:27: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     607 |         .map            = qcom_iommu_map,
         |                           ^~~~~~~~~~~~~~
   drivers/iommu/qcom_iommu.c:607:27: note: (near initialization for 'qcom_iommu_ops.map')
   drivers/iommu/qcom_iommu.c: In function 'to_iommu':
>> drivers/iommu/qcom_iommu.c:82:1: warning: control reaches end of non-void function [-Wreturn-type]
      82 | }
         | ^
   cc1: some warnings being treated as errors


vim +116 drivers/iommu/arm-smmu.c

^590eaf1fec755 Kaixu Xia 2021-03-16  105  
^590eaf1fec755 Kaixu Xia 2021-03-16  106  struct arm_smmu_master_cfg {
^590eaf1fec755 Kaixu Xia 2021-03-16  107  	struct arm_smmu_device		*smmu;
^590eaf1fec755 Kaixu Xia 2021-03-16  108  	s16				smendx[];
^590eaf1fec755 Kaixu Xia 2021-03-16  109  };
^590eaf1fec755 Kaixu Xia 2021-03-16  110  #define INVALID_SMENDX			-1
^590eaf1fec755 Kaixu Xia 2021-03-16  111  #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
^590eaf1fec755 Kaixu Xia 2021-03-16  112  #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
^590eaf1fec755 Kaixu Xia 2021-03-16  113  #define fwspec_smendx(fw, i) \
^590eaf1fec755 Kaixu Xia 2021-03-16  114  	(i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
^590eaf1fec755 Kaixu Xia 2021-03-16  115  #define for_each_cfg_sme(fw, i, idx) \
^590eaf1fec755 Kaixu Xia 2021-03-16 @116  	for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
^590eaf1fec755 Kaixu Xia 2021-03-16  117  

:::::: The code at line 116 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
