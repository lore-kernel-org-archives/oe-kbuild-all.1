Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD5C1D54FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327802; cv=none; b=f2sBs19SnHpDtOVjz7trtgeiI50qiB9B0aMrD5bGre01gEPuE89VkLPsgDgqBKgZEbNGtQ7dI4iRTMEeEMRzXMGZ1nXwjH9/1OLz3tSjJS39j+rGQ3G7ebSex5nyIelkLd7TE3Oj3FfZ1nk71jYnkCTNH1YEpe7wpkikxtpSdXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327802; c=relaxed/simple;
	bh=+YuohgUg7g2Lp5AXvEWa6NAW7pKxJFSB3KGRaGx/hM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZMLF1aW8r/JMQciIO4THUpUGFzxeqLiThPBIfeaGwnWZQRS5MRvLVW2beDRGkBrHbDHtLsqa9IiwFHyiZmZiJ6Jc1S6Rju0M9R3bfWHvHQqwVdNXR/4YY9wtm76HxD7NnDSBbRVkwqdUBZdNJkGr7nxW3v3mLXxMjgCwvr3qWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gG3+mn52; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gG3+mn52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327800; x=1779863800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YuohgUg7g2Lp5AXvEWa6NAW7pKxJFSB3KGRaGx/hM4=;
  b=gG3+mn52J63ZEwhI+MZa7pSiqABn57hpLxjKwhrggwzmw11HsOJmpuh3
   JCVInK6a9smajw3G2ywK2lqtINxSPKkKo8VfH4Hxf5LMrp2A5s1g4waaM
   fVsL7Zy2lbfsuSj4QmuePwgE4UofkpJQMfefrfhoSy+xAaHqkkZPCF7Nv
   sNKjZU/biBybcTaZixMdmZu43MDcuii1Buh78YE0W9gTYN2/NrodDBIAr
   TDTeC9Xv16kRcX7dM4dkSKhzxbGdu8bVn1YM2WJC8WdSqrBBpaKeNZAGJ
   3K/MD9CpL/tHjp+rYg+kZYDpUbskdmJoBG5D9WegehaSrbCIuv65Trfkt
   Q==;
X-CSE-ConnectionGUID: le1ftIyaT3q+xx+Myq5MgA==
X-CSE-MsgGUID: OjXBzfynS9iXjVMgT9Yf/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53957505"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="53957505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:36:37 -0700
X-CSE-ConnectionGUID: c554XoYbS4OeHk/z/Fs2qg==
X-CSE-MsgGUID: VuhnkBilTAGhn+J7Ji/fAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="179859123"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2025 23:36:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJnvO-000Sy6-0h;
	Tue, 27 May 2025 06:36:34 +0000
Date: Tue, 27 May 2025 14:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/soc/mediatek/mtk-mmdvfs-v3.c:481:6: warning: no previous prototype
 for function 'vmm_notify_work_func'
Message-ID: <202505271455.WmEBLxW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: 1cc9e9ca2d2e26a6b7e9b650ba61a261506201ee [133/133] CHROMIUM: mmdvfs: add basic driver to support mmdvfs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250527/202505271455.WmEBLxW4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271455.WmEBLxW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271455.WmEBLxW4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/mediatek/mtk-mmdvfs-v3.c:9:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:132:24: error: no member named 'vcp_is_suspending' in 'struct mtk_vcp_of_data'
     132 |         if (vcp_device->data->vcp_is_suspending(vcp_device))
         |             ~~~~~~~~~~~~~~~~  ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:274:20: error: no member named 'ipi_ops' in 'struct mtk_vcp_device'
     274 |         ret = vcp_device->ipi_ops->ipi_send(vcp_ipi_dev,
         |               ~~~~~~~~~~  ^
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:481:6: warning: no previous prototype for function 'vmm_notify_work_func' [-Wmissing-prototypes]
     481 | void vmm_notify_work_func(struct work_struct *work)
         |      ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:481:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     481 | void vmm_notify_work_func(struct work_struct *work)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:535:5: warning: no previous prototype for function 'vmm_avs_debug_dump' [-Wmissing-prototypes]
     535 | int vmm_avs_debug_dump(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:535:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     535 | int vmm_avs_debug_dump(char *buf, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:692:5: warning: no previous prototype for function 'mmdvfs_vmm_ceil_step' [-Wmissing-prototypes]
     692 | int mmdvfs_vmm_ceil_step(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:692:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     692 | int mmdvfs_vmm_ceil_step(const char *val, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:717:5: warning: no previous prototype for function 'mmdvfs_rst_clk_rate' [-Wmissing-prototypes]
     717 | int mmdvfs_rst_clk_rate(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:717:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     717 | int mmdvfs_rst_clk_rate(const char *val, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:756:5: warning: no previous prototype for function 'mmdvfs_get_vcp_log' [-Wmissing-prototypes]
     756 | int mmdvfs_get_vcp_log(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     756 | int mmdvfs_get_vcp_log(char *buf, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:784:5: warning: no previous prototype for function 'mmdvfs_set_vcp_log' [-Wmissing-prototypes]
     784 | int mmdvfs_set_vcp_log(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:784:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     784 | int mmdvfs_set_vcp_log(const char *val, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:813:5: warning: no previous prototype for function 'mmdvfs_get_vmrc_log' [-Wmissing-prototypes]
     813 | int mmdvfs_get_vmrc_log(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:813:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     813 | int mmdvfs_get_vmrc_log(char *buf, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:841:5: warning: no previous prototype for function 'mmdvfs_set_vmrc_log' [-Wmissing-prototypes]
     841 | int mmdvfs_set_vmrc_log(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:841:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     841 | int mmdvfs_set_vmrc_log(const char *val, const struct kernel_param *kp)
         | ^
         | static 
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1581:23: error: no member named 'vcp_get_sram_virt' in 'struct mtk_vcp_of_data'; did you mean 'vcp_get_mem_virt'?
    1581 |                                 vcp_device->data->vcp_get_sram_virt(vcp_device) +
         |                                                   ^~~~~~~~~~~~~~~~~
         |                                                   vcp_get_mem_virt
   include/linux/remoteproc/mtk_vcp_public.h:97:18: note: 'vcp_get_mem_virt' declared here
      97 |         void __iomem *(*vcp_get_mem_virt)(enum vcp_reserve_mem_id_t id);
         |                         ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1693:68: error: use of undeclared identifier 'MMDVFS_MMUP_MEM_ID'; did you mean 'MMDVFS_MMUP_FEATURE_ID'?
    1693 |         mmdvfs_dev->mmdvfs_mmup_iova = vcp_device->data->vcp_get_mem_iova(MMDVFS_MMUP_MEM_ID);
         |                                                                           ^~~~~~~~~~~~~~~~~~
         |                                                                           MMDVFS_MMUP_FEATURE_ID
   include/linux/remoteproc/mtk_vcp_public.h:38:2: note: 'MMDVFS_MMUP_FEATURE_ID' declared here
      38 |         MMDVFS_MMUP_FEATURE_ID,
         |         ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1693:68: warning: implicit conversion from enumeration type 'enum feature_id' to different enumeration type 'enum vcp_reserve_mem_id_t' [-Wenum-conversion]
    1693 |         mmdvfs_dev->mmdvfs_mmup_iova = vcp_device->data->vcp_get_mem_iova(MMDVFS_MMUP_MEM_ID);
         |                                        ~~~~~~~~~~                         ^~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1694:74: error: use of undeclared identifier 'MMDVFS_MMUP_MEM_ID'; did you mean 'MMDVFS_MMUP_FEATURE_ID'?
    1694 |         mmdvfs_dev->mmdvfs_mmup_va = (void *)vcp_device->data->vcp_get_mem_virt(MMDVFS_MMUP_MEM_ID);
         |                                                                                 ^~~~~~~~~~~~~~~~~~
         |                                                                                 MMDVFS_MMUP_FEATURE_ID
   include/linux/remoteproc/mtk_vcp_public.h:38:2: note: 'MMDVFS_MMUP_FEATURE_ID' declared here
      38 |         MMDVFS_MMUP_FEATURE_ID,
         |         ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1694:74: warning: implicit conversion from enumeration type 'enum feature_id' to different enumeration type 'enum vcp_reserve_mem_id_t' [-Wenum-conversion]
    1694 |         mmdvfs_dev->mmdvfs_mmup_va = (void *)vcp_device->data->vcp_get_mem_virt(MMDVFS_MMUP_MEM_ID);
         |                                              ~~~~~~~~~~                         ^~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1696:67: error: use of undeclared identifier 'MMDVFS_VCP_MEM_ID'; did you mean 'MMDVFS_VCP_FEATURE_ID'?
    1696 |         mmdvfs_dev->mmdvfs_vcp_iova = vcp_device->data->vcp_get_mem_iova(MMDVFS_VCP_MEM_ID);
         |                                                                          ^~~~~~~~~~~~~~~~~
         |                                                                          MMDVFS_VCP_FEATURE_ID
   include/linux/remoteproc/mtk_vcp_public.h:39:2: note: 'MMDVFS_VCP_FEATURE_ID' declared here
      39 |         MMDVFS_VCP_FEATURE_ID,
         |         ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1696:67: warning: implicit conversion from enumeration type 'enum feature_id' to different enumeration type 'enum vcp_reserve_mem_id_t' [-Wenum-conversion]
    1696 |         mmdvfs_dev->mmdvfs_vcp_iova = vcp_device->data->vcp_get_mem_iova(MMDVFS_VCP_MEM_ID);
         |                                       ~~~~~~~~~~                         ^~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1697:73: error: use of undeclared identifier 'MMDVFS_VCP_MEM_ID'; did you mean 'MMDVFS_VCP_FEATURE_ID'?
    1697 |         mmdvfs_dev->mmdvfs_vcp_va = (void *)vcp_device->data->vcp_get_mem_virt(MMDVFS_VCP_MEM_ID);
         |                                                                                ^~~~~~~~~~~~~~~~~
         |                                                                                MMDVFS_VCP_FEATURE_ID
   include/linux/remoteproc/mtk_vcp_public.h:39:2: note: 'MMDVFS_VCP_FEATURE_ID' declared here
      39 |         MMDVFS_VCP_FEATURE_ID,
         |         ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:1697:73: warning: implicit conversion from enumeration type 'enum feature_id' to different enumeration type 'enum vcp_reserve_mem_id_t' [-Wenum-conversion]
    1697 |         mmdvfs_dev->mmdvfs_vcp_va = (void *)vcp_device->data->vcp_get_mem_virt(MMDVFS_VCP_MEM_ID);
         |                                             ~~~~~~~~~~                         ^~~~~~~~~~~~~~~~~
   16 warnings and 7 errors generated.
--
>> drivers/soc/mediatek/mtk-mmdvfs-v3-user.c:34:5: warning: no previous prototype for function 'mmdvfs_user_set_rate' [-Wmissing-prototypes]
      34 | int mmdvfs_user_set_rate(u8 idx, u64 freq)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3-user.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | int mmdvfs_user_set_rate(u8 idx, u64 freq)
         | ^
         | static 
   1 warning generated.


vim +/vmm_notify_work_func +481 drivers/soc/mediatek/mtk-mmdvfs-v3.c

   480	
 > 481	void vmm_notify_work_func(struct work_struct *work)
   482	{
   483		struct mmdvfs_vmm_notify_work *vmm_notify_work =
   484			container_of(work, struct mmdvfs_vmm_notify_work, vmm_notify_work);
   485	
   486		mtk_mmdvfs_enable_vcp(vmm_notify_work->enable, VCP_PWR_USR_MMDVFS_GENPD);
   487		kfree(vmm_notify_work);
   488	}
   489	
   490	int mtk_mmdvfs_genpd_notify(const u8 idx, const bool enable)
   491	{
   492		struct mtk_mmdvfs_dev *mmdvfs_dev = mtk_mmdvfs_get_drv_data();
   493		struct mmdvfs_vmm_notify_work *work;
   494	
   495		if (IS_ERR_OR_NULL(mmdvfs_dev))
   496			return -ENODEV;
   497	
   498		if (!mmdvfs_is_init_done())
   499			return 0;
   500	
   501		mmdvfs_vcp_ipi_send(mmdvfs_dev, FUNC_VMM_GENPD_NOTIFY, idx, enable ? 1 : 0, NULL);
   502	
   503		if (!mmdvfs_dev->vmm_notify_wq)
   504			return 0;
   505	
   506		work = kzalloc(sizeof(*work), GFP_KERNEL);
   507		if (!work)
   508			return -ENOMEM;
   509	
   510		work->enable = enable;
   511		INIT_WORK(&work->vmm_notify_work, vmm_notify_work_func);
   512		queue_work(mmdvfs_dev->vmm_notify_wq, &work->vmm_notify_work);
   513	
   514		return 0;
   515	}
   516	EXPORT_SYMBOL_GPL(mtk_mmdvfs_genpd_notify);
   517	
   518	int mtk_mmdvfs_set_avs(const u8 idx, const u32 aging, const u32 fresh)
   519	{
   520		struct mtk_mmdvfs_dev *mmdvfs_dev = mtk_mmdvfs_get_drv_data();
   521		u32 data[2] = {aging, fresh};
   522		int ret;
   523	
   524		if (IS_ERR_OR_NULL(mmdvfs_dev))
   525			return -ENODEV;
   526	
   527		ret = mmdvfs_vcp_ipi_send(mmdvfs_dev, FUNC_VMM_AVS_UPDATE, idx, MMDVFS_MAX_OPP, (u32 *)&data);
   528		mtk_mmdvfs_debug(mmdvfs_dev->pdev, LOG_PWR, "ret:%d idx:%u aging:%u fresh:%u",
   529				 ret, idx, aging, fresh);
   530	
   531		return ret;
   532	}
   533	EXPORT_SYMBOL_GPL(mtk_mmdvfs_set_avs);
   534	
 > 535	int vmm_avs_debug_dump(char *buf, const struct kernel_param *kp)
   536	{
   537		int len = 0;
   538		u32 avs, i;
   539	
   540		if (!MEM_BASE)
   541			return 0;
   542	
   543		/* power opp */
   544		len += scnprintf(buf + len, PAGE_SIZE - len, "efuse_low:%#x, efuse_high:%#x\n",
   545				readl(MEM_VMM_EFUSE_LOW), readl(MEM_VMM_EFUSE_HIGH));
   546		for (i = 0; i < 8; i++)
   547			len += scnprintf(buf + len, PAGE_SIZE - len, "opp_level%u: %u\n", i,
   548					readl(MEM_VMM_OPP_VOLT(i)));
   549	
   550		i = readl(MEM_REC_VMM_DBG_CNT);
   551		if (i > 0)
   552			i = (i - 1) % MEM_REC_CNT_MAX;
   553	
   554		avs = readl(MEM_REC_VMM_AVS(i));
   555		len += scnprintf(buf + len, PAGE_SIZE - len,
   556				"temp:%#x volt:%u zone:%u opp_level:%u vde_on:%u isp_on:%u\n",
   557				readl(MEM_REC_VMM_TEMP(i)), readl(MEM_REC_VMM_VOLT(i)),
   558				avs & 0xff, (avs >> 8) & 0xff, (avs >> 16) & 0x1, (avs >> 17) & 0x1);
   559	
   560		return len;
   561	}
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
