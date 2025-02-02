Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464BE182D7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Feb 2025 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738511346; cv=none; b=JVuhkYgJslYWJyzuEulwv7Y839n1J4PiFZG4qi/QLpHzlcx6+VB8bb+JOmxZYamSodg9xieEdfHt//2LJLZwrjhUZ0UcjSksFc0Jfti6Jv88x/KXmrV71K0T2xcA3BdPJBow/yV3GahLNqESzoMMYhanS3k1gkpTFGOLQUUTm7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738511346; c=relaxed/simple;
	bh=cT52G+hvK0/Ryd1+cz0K8gGPvTn6a4tyRdbVxatHbaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PP6Jcq2OeX1FfQkwMNBXTTQIcuW+pQQnta1aUQLX3q8Y6HaSBtsPeV5KfipZDWRsHow3odUAAqTh94A4WU1LGlfqScz8dhZOsn3TXGcFQ4TSDjUe7eGcPSmkXZiN4KOuaDidtY3dZViDV4LKu9nPHF8qCHloKlTkOb9Ir4Yc4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHqR2Y/G; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHqR2Y/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738511344; x=1770047344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cT52G+hvK0/Ryd1+cz0K8gGPvTn6a4tyRdbVxatHbaI=;
  b=FHqR2Y/GX+3OW+hNvHXAfPvPCqVeDLe0p76Wxsf2Fj9cfGDYQTGcygbN
   3/AMvwNuBw5v2LwReO3EvVNUZBBLVV5Bfel5TttQpru4KTDh1jHvlPenv
   kf8WtVLi8BpXw2nDY2F5dFfsGciEp5ehckFUlad+hZYOOk+IuA0AiLF89
   c3IAofynkb/eDVTA7JFRjE+k86N8uBqCskm7k+2PY6XvQbm+z8NdIBAzy
   3LYuyb3kf6qi9/cFZJJvwCs9l36nwcdPUZ+uVDyJjkQylJJtm991bU5eG
   VBGRM8V5q5nj3S/wcOaQPk7b07HIQsVdBwEW7h1LqV4jnZq68Q/Vt+CU1
   w==;
X-CSE-ConnectionGUID: wW1m1A2jTeie4zfYf2zHAw==
X-CSE-MsgGUID: 1WD48+RGTkKZX7fWZNOU4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50430431"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50430431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 07:49:03 -0800
X-CSE-ConnectionGUID: Vg8T/LJUQYGPTA1mtrvZSg==
X-CSE-MsgGUID: VJf/4fwLRqiwwrR9ruEZhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133342455"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Feb 2025 07:49:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tecDU-000pol-0G;
	Sun, 02 Feb 2025 15:49:00 +0000
Date: Sun, 2 Feb 2025 23:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 16/16]
 drivers/remoteproc/mtk_vcp_rproc.c:891:9: warning: variable
 'mblock_start_size' set but not used
Message-ID: <202502022322.9lLmWfKN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   65b501d72807a421824c8b0da783b7f0c4f92d0c
commit: 65b501d72807a421824c8b0da783b7f0c4f92d0c [16/16] CHROMIUM: remoteproc: vcp: add vcp kernel driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250202/202502022322.9lLmWfKN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502022322.9lLmWfKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502022322.9lLmWfKN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/mtk_vcp_rproc.c:891:9: warning: variable 'mblock_start_size' set but not used [-Wunused-but-set-variable]
     891 |         size_t mblock_start_size;
         |                ^
>> drivers/remoteproc/mtk_vcp_rproc.c:1077:29: warning: cast to smaller integer type 'enum vcp_core_id' from 'void *' [-Wvoid-pointer-to-enum-cast]
    1077 |         enum vcp_core_id core_id = (enum vcp_core_id) vcp_core_id;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/mtk_vcp_rproc.c:1108:29: warning: cast to smaller integer type 'enum vcp_core_id' from 'void *' [-Wvoid-pointer-to-enum-cast]
    1108 |         enum vcp_core_id core_id = (enum vcp_core_id) vcp_core_id;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/remoteproc/mtk_vcp_rproc.c:80:18: warning: unused variable 'vcp_reserve_mblock_remap' [-Wunused-const-variable]
      80 | static const int vcp_reserve_mblock_remap[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
--
>> drivers/remoteproc/mtk_vcp_loader.c:77:16: warning: variable 'ld_ptr' set but not used [-Wunused-but-set-variable]
      77 |         void __iomem *ld_ptr;
         |                       ^
>> drivers/remoteproc/mtk_vcp_loader.c:79:16: warning: variable 'dram_img_backup_ptr' set but not used [-Wunused-but-set-variable]
      79 |         void __iomem *dram_img_backup_ptr;
         |                       ^
>> drivers/remoteproc/mtk_vcp_loader.c:80:14: warning: variable 'ld_ptr_phy' set but not used [-Wunused-but-set-variable]
      80 |         phys_addr_t ld_ptr_phy;
         |                     ^
>> drivers/remoteproc/mtk_vcp_loader.c:81:14: warning: variable 'dram_img_ptr_phy' set but not used [-Wunused-but-set-variable]
      81 |         phys_addr_t dram_img_ptr_phy;
         |                     ^
   drivers/remoteproc/mtk_vcp_loader.c:170:16: warning: variable 'ld_ptr' set but not used [-Wunused-but-set-variable]
     170 |         void __iomem *ld_ptr;
         |                       ^
   drivers/remoteproc/mtk_vcp_loader.c:172:16: warning: variable 'dram_img_backup_ptr' set but not used [-Wunused-but-set-variable]
     172 |         void __iomem *dram_img_backup_ptr;
         |                       ^
   drivers/remoteproc/mtk_vcp_loader.c:173:14: warning: variable 'ld_ptr_phy' set but not used [-Wunused-but-set-variable]
     173 |         phys_addr_t ld_ptr_phy;
         |                     ^
   drivers/remoteproc/mtk_vcp_loader.c:174:14: warning: variable 'dram_img_ptr_phy' set but not used [-Wunused-but-set-variable]
     174 |         phys_addr_t dram_img_ptr_phy;
         |                     ^
>> drivers/remoteproc/mtk_vcp_loader.c:260:6: warning: variable 'img_buf_size' set but not used [-Wunused-but-set-variable]
     260 |         u32 img_buf_size;
         |             ^
   9 warnings generated.
--
>> drivers/remoteproc/mtk_vcp_rproc.c:195: warning: Function parameter or member 'vcp' not described in 'vcp_put'
>> drivers/remoteproc/mtk_vcp_rproc.c:195: warning: Excess function parameter 'scp' description in 'vcp_put'


vim +/mblock_start_size +891 drivers/remoteproc/mtk_vcp_rproc.c

   873	
   874	#if IS_ENABLED(CONFIG_OF_RESERVED_MEM)
   875	static int vcp_reserve_memory_ioremap(struct mtk_vcp_device *vcp)
   876	{
   877	#define MEMORY_TBL_ELEM_NUM (2)
   878		u32 num = (u32)(sizeof(vcp_reserve_mblock)
   879				/ sizeof(vcp_reserve_mblock[0]));
   880		enum vcp_reserve_mem_id_t id;
   881		u32 vcp_mem_num = 0;
   882		u32 i = 0, m_idx = 0, m_size = 0;
   883		u32 offset;
   884		struct device_node *rmem_node;
   885		struct resource res;
   886		struct iommu_domain *domain;
   887		void __iomem *share_memory_virt;
   888		phys_addr_t mblock_start_phys;
   889		dma_addr_t share_memory_iova;
   890		size_t share_memory_size;
 > 891		size_t mblock_start_size;
   892		int ret;
   893	
   894		if (num != NUMS_MEM_ID) {
   895			dev_err(vcp->dev, "actual memory num(%u) is not match mem ID table (%u)\n",
   896				num, NUMS_MEM_ID);
   897			WARN_ON(1);
   898			return -EINVAL;
   899		}
   900	
   901		rmem_node = of_parse_phandle(vcp->dev->of_node, "memory-region", 0);
   902		if (!rmem_node) {
   903			dev_err(vcp->dev, "No reserved memory region found.\n");
   904			return -EINVAL;
   905		}
   906	
   907		ret = of_address_to_resource(rmem_node, 0, &res);
   908		if (ret) {
   909			dev_err(vcp->dev, "failed to parse reserved memory: %d\n", ret);
   910			return ret;
   911		}
   912	
   913		mblock_start_phys = (phys_addr_t)res.start;
   914		mblock_start_size = (u32)resource_size(&res);
   915	
   916		/* Set reserved memory table */
   917		vcp_mem_num = of_property_count_u32_elems(vcp->dev->of_node, "vcp-mem-tbl")
   918			      / MEMORY_TBL_ELEM_NUM;
   919		if (vcp_mem_num <= 0) {
   920			dev_info(vcp->dev, "vcp-mem-tbl not found\n");
   921			vcp_mem_num = 0;
   922		}
   923	
   924		for (i = 0; i < vcp_mem_num; i++) {
   925			ret = of_property_read_u32_index(vcp->dev->of_node, "vcp-mem-tbl",
   926							 i * MEMORY_TBL_ELEM_NUM, &m_idx);
   927			if (ret) {
   928				dev_err(vcp->dev, "cannot get memory index(%d)\n", i);
   929				return -EINVAL;
   930			}
   931	
   932			ret = of_property_read_u32_index(vcp->dev->of_node, "vcp-mem-tbl",
   933							 (i * MEMORY_TBL_ELEM_NUM) + 1, &m_size);
   934			if (ret) {
   935				dev_err(vcp->dev, "Cannot get memory size(%d)(%d)\n", i, m_idx);
   936				return -EINVAL;
   937			}
   938	
   939			if (m_idx >= NUMS_MEM_ID) {
   940				dev_dbg(vcp->dev, "skip unexpected index, %d\n", m_idx);
   941				continue;
   942			}
   943	
   944			vcp_reserve_mblock[m_idx].size = m_size;
   945			dev_dbg(vcp->dev, "reserved: <%d  %d>\n", m_idx, m_size);
   946		}
   947	
   948		vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys = mblock_start_phys;
   949		vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_virt = devm_ioremap(vcp->dev,
   950					vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys,
   951					vcp_reserve_mblock[VCP_RTOS_MEM_ID].size);
   952		domain = iommu_get_domain_for_dev(vcp->dev);
   953		ret = iommu_map(domain, IMG_MEMORY_STATIC_IOVA,
   954				vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys,
   955				vcp_reserve_mblock[VCP_RTOS_MEM_ID].size,
   956				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
   957		if (ret) {
   958			dev_err(vcp->dev, "%s iommu map fail, ret:%d.\n", __func__, ret);
   959			return ret;
   960		}
   961		vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_iova = IMG_MEMORY_STATIC_IOVA;
   962	
   963		share_memory_size = 0;
   964		for (id = VDEC_MEM_ID; id < NUMS_MEM_ID; id++) {
   965			if (vcp_reserve_mblock[id].size == 0)
   966				continue;
   967			share_memory_size += vcp_reserve_mblock[id].size;
   968		}
   969	
   970		ret = dma_set_mask_and_coherent(vcp->dev, DMA_BIT_MASK(DMA_MAX_MASK_BIT));
   971		if (ret) {
   972			dev_err(vcp->dev, "64-bit DMA enable failed\n");
   973			return ret;
   974		}
   975	
   976		if (!vcp->dev->dma_parms) {
   977			vcp->dev->dma_parms = devm_kzalloc(vcp->dev, sizeof(*vcp->dev->dma_parms), GFP_KERNEL);
   978			if (vcp->dev->dma_parms) {
   979				ret = dma_set_max_seg_size(vcp->dev, (u32)DMA_BIT_MASK(33));
   980				if (ret) {
   981					dev_err(vcp->dev, "Failed to set DMA segment size\n");
   982					return ret;
   983				}
   984			} else {
   985				dev_err(vcp->dev, "Failed to set DMA parms\n");
   986				return -EINVAL;
   987			}
   988		}
   989		share_memory_virt = dma_alloc_coherent(vcp->dev, share_memory_size,
   990						       &share_memory_iova, GFP_KERNEL);
   991		if (!share_memory_virt)
   992			return -ENOMEM;
   993		offset = 0;
   994		for (id = VDEC_MEM_ID; id < NUMS_MEM_ID; id++)  {
   995			if (vcp_reserve_mblock[id].size == 0)
   996				continue;
   997	
   998			vcp_reserve_mblock[id].start_phys = vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys +
   999							    vcp_reserve_mblock[VCP_RTOS_MEM_ID].size + offset;
  1000			vcp_reserve_mblock[id].start_iova = share_memory_iova + offset;
  1001			vcp_reserve_mblock[id].start_virt = share_memory_virt + offset;
  1002			offset += (u32)vcp_reserve_mblock[id].size;
  1003	
  1004			dev_dbg(vcp->dev, "share memory [%d] pa:%pa, iova:%pa, virt:%p, len:0x%zx\n",
  1005				id, &vcp_reserve_mblock[id].start_phys,
  1006				&vcp_reserve_mblock[id].start_iova,
  1007				vcp_reserve_mblock[id].start_virt,
  1008				vcp_reserve_mblock[id].size);
  1009		}
  1010	
  1011		vcp_mem_base_iova = share_memory_iova;
  1012		vcp_mem_size = share_memory_size;
  1013		vcp_mem_logger_iova = vcp_reserve_mblock[VCP_A_LOGGER_MEM_ID].start_iova;
  1014		vcp_mem_logger_size = vcp_reserve_mblock[VCP_A_LOGGER_MEM_ID].size;
  1015	
  1016		return 0;
  1017	}
  1018	#endif
  1019	
  1020	static int vcp_A_register_feature(struct mtk_vcp_device *vcp, enum feature_id id)
  1021	{
  1022		u32 i;
  1023		int ret = 0;
  1024	
  1025		if (id >= NUM_FEATURE_ID) {
  1026			dev_info(vcp->dev, "%s unsupported feature id %d\n",
  1027				__func__, id);
  1028			return -EINVAL;
  1029		}
  1030		mutex_lock(&vcp_feature_mutex);
  1031		for (i = 0; i < NUM_FEATURE_ID; i++) {
  1032			if (feature_table[i].feature == id)
  1033				feature_table[i].enable++;
  1034		}
  1035		ret = vcp_enable_pm_clk(vcp, id);
  1036		mutex_unlock(&vcp_feature_mutex);
  1037	
  1038		return ret;
  1039	}
  1040	
  1041	static int vcp_A_deregister_feature(struct mtk_vcp_device *vcp, enum feature_id id)
  1042	{
  1043		u32 i;
  1044		int ret = 0;
  1045	
  1046		if (id >= NUM_FEATURE_ID) {
  1047			dev_info(vcp->dev, "%s unsupported feature id %d\n",
  1048				__func__, id);
  1049			return -EINVAL;
  1050		}
  1051		mutex_lock(&vcp_feature_mutex);
  1052		for (i = 0; i < NUM_FEATURE_ID; i++) {
  1053			if (feature_table[i].feature == id) {
  1054				if (feature_table[i].enable == 0) {
  1055					dev_warn(vcp->dev, "%s unbalanced feature id %d enable cnt %d\n",
  1056						__func__, id, feature_table[i].enable);
  1057					mutex_unlock(&vcp_feature_mutex);
  1058					return -EINVAL;
  1059				}
  1060				feature_table[i].enable--;
  1061			}
  1062		}
  1063		ret = vcp_disable_pm_clk(vcp, id);
  1064		mutex_unlock(&vcp_feature_mutex);
  1065	
  1066		return ret;
  1067	}
  1068	
  1069	/*
  1070	 * acquire vcp lock flag, keep vcp awake
  1071	 * @param vcp_core_id: vcp core id
  1072	 * return  0 :get lock success
  1073	 *        -EINVAL :get lock timeout
  1074	 */
  1075	int vcp_awake_lock(void *vcp_core_id)
  1076	{
> 1077		enum vcp_core_id core_id = (enum vcp_core_id) vcp_core_id;
  1078		unsigned long spin_flags;
  1079		int *vcp_awake_count;
  1080	
  1081		if (core_id >= VCP_CORE_TOTAL)
  1082			return -EINVAL;
  1083	
  1084		vcp_awake_count = (int *)&vcp_awake_counts[core_id];
  1085	
  1086		if (is_vcp_ready_by_coreid(core_id) == false)
  1087			return -EINVAL;
  1088	
  1089		/* vcp unlock awake */
  1090		spin_lock_irqsave(&vcp_awake_spinlock, spin_flags);
  1091	
  1092		/* vcp lock awake success*/
  1093		*vcp_awake_count = *vcp_awake_count + 1;
  1094	
  1095		spin_unlock_irqrestore(&vcp_awake_spinlock, spin_flags);
  1096	
  1097		return 0;
  1098	}
  1099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
