Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDBD623
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 02:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677552375; x=1709088375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQAjfcqjiUWLUxmUr/GZHsI7B5K3XAGkE8HBwmYkcU8=;
  b=ljeY++MprMwhrnOMwMgl76+fvIEz/l5MjYnxXE6pcsek/yxqzivaEBIN
   JMI0C5jBEA6ipHpLq38pvLWwQNSxku0xAmbnzGeWX3UOYbVe0yf+Suj+j
   G0Uff8hrvd0WFNb2HL/q7RrHtGQGycU1VtPs8l6gINUXUpscKgWP+WhvY
   0Vjp+DOeWzFOlAFFb+BltAiekIqbNyXSzwggex0oiCC1rW6+1JqsqqMSl
   KZlW0YJ4hsr9mj3E2GLQKX8PL3GL+TeNplDpsGkroFalowaye2UXD3PjI
   fosB9HA1lvxz6Ov4WmQ6urU/Ld2/Ht0ZvoYurqUQg481FCqMQZnzXkK83
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313705292"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="313705292"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 18:46:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1003063784"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="1003063784"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2023 18:46:14 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWq0L-00051R-1U;
	Tue, 28 Feb 2023 02:46:13 +0000
Date: Tue, 28 Feb 2023 10:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 317/583]
 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1243:24: error:
 'dmac_inv_range' undeclared
Message-ID: <202302281042.lNKLNd2O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: f1442f2d4928f4c338ee1f404a8047c13ae3756f [317/583] staging: vc04_services: Add new vc-sm-cma driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230228/202302281042.lNKLNd2O-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/f1442f2d4928f4c338ee1f404a8047c13ae3756f
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout f1442f2d4928f4c338ee1f404a8047c13ae3756f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/gpio/ drivers/media/i2c/ drivers/staging/fbtft/ drivers/staging/vc04_services/vc-sm-cma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281042.lNKLNd2O-lkp@intel.com/

Note: the l1k/rpi-6.2.y-await-linktraining HEAD f3a9201f7f484c1295cdec53c1b9bd2a19ffb231 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:704:1: warning: no previous prototype for 'vc_sm_cma_import_dmabuf_internal' [-Wmissing-prototypes]
     704 | vc_sm_cma_import_dmabuf_internal(struct vc_sm_privdata_t *private,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1092:5: warning: no previous prototype for 'vc_sm_cma_ioctl_alloc' [-Wmissing-prototypes]
    1092 | int vc_sm_cma_ioctl_alloc(struct vc_sm_privdata_t *private,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c: In function 'cache_op_to_func':
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1243:24: error: 'dmac_inv_range' undeclared (first use in this function)
    1243 |                 return dmac_inv_range;
         |                        ^~~~~~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1243:24: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1245:24: error: 'dmac_clean_range' undeclared (first use in this function)
    1245 |                 return dmac_clean_range;
         |                        ^~~~~~~~~~~~~~~~
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1247:24: error: 'dmac_flush_range' undeclared (first use in this function)
    1247 |                 return dmac_flush_range;
         |                        ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BCM2835_VCHIQ
   Depends on [n]: STAGING [=y] && BCM_VIDEOCORE [=m] && HAS_DMA [=n]
   Selected by [m]:
   - BCM_VC_SM_CMA [=m] && STAGING [=y] && BCM_VIDEOCORE [=m]
   WARNING: unmet direct dependencies detected for SND_SOC_TLV320AIC32X4_I2C
   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && I2C [=m] && COMMON_CLK [=n]
   Selected by [m]:
   - SND_AUDIOSENSE_PI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   WARNING: unmet direct dependencies detected for COMMON_CLK_HIFIBERRY_DACPRO
   Depends on [n]: COMMON_CLK [=n]
   Selected by [m]:
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUS [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADCPRO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   WARNING: unmet direct dependencies detected for COMMON_CLK_HIFIBERRY_DACPLUSHD
   Depends on [n]: COMMON_CLK [=n]
   Selected by [m]:
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSHD [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])


vim +/dmac_inv_range +1243 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c

  1087	
  1088	/*
  1089	 * Allocate a shared memory handle and block.
  1090	 * Allocation is from CMA, and then imported into the VPU mappings.
  1091	 */
> 1092	int vc_sm_cma_ioctl_alloc(struct vc_sm_privdata_t *private,
  1093				  struct vc_sm_cma_ioctl_alloc *ioparam)
  1094	{
  1095		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
  1096		struct vc_sm_buffer *buffer = NULL;
  1097		struct vc_sm_import import = { 0 };
  1098		struct vc_sm_import_result result = { 0 };
  1099		struct dma_buf *dmabuf = NULL;
  1100		struct sg_table *sgt;
  1101		int aligned_size;
  1102		int ret = 0;
  1103		int status;
  1104		int fd = -1;
  1105	
  1106		aligned_size = PAGE_ALIGN(ioparam->size);
  1107	
  1108		if (!aligned_size)
  1109			return -EINVAL;
  1110	
  1111		/* Allocate local buffer to track this allocation. */
  1112		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
  1113		if (!buffer) {
  1114			ret = -ENOMEM;
  1115			goto error;
  1116		}
  1117	
  1118		buffer->cookie = dma_alloc_coherent(&sm_state->pdev->dev,
  1119						    aligned_size,
  1120						    &buffer->dma_addr,
  1121						    GFP_KERNEL);
  1122		if (!buffer->cookie) {
  1123			pr_err("[%s]: dma_alloc_coherent alloc of %d bytes failed\n",
  1124			       __func__, aligned_size);
  1125			ret = -ENOMEM;
  1126			goto error;
  1127		}
  1128	
  1129		import.type = VC_SM_ALLOC_NON_CACHED;
  1130		import.allocator = current->tgid;
  1131	
  1132		if (*ioparam->name)
  1133			memcpy(import.name, ioparam->name, sizeof(import.name) - 1);
  1134		else
  1135			memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
  1136			       sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
  1137	
  1138		mutex_init(&buffer->lock);
  1139		INIT_LIST_HEAD(&buffer->attachments);
  1140		memcpy(buffer->name, import.name,
  1141		       min(sizeof(buffer->name), sizeof(import.name) - 1));
  1142	
  1143		exp_info.ops = &dma_buf_ops;
  1144		exp_info.size = aligned_size;
  1145		exp_info.flags = O_RDWR;
  1146		exp_info.priv = buffer;
  1147	
  1148		dmabuf = dma_buf_export(&exp_info);
  1149		if (IS_ERR(dmabuf)) {
  1150			ret = PTR_ERR(dmabuf);
  1151			goto error;
  1152		}
  1153		buffer->dma_buf = dmabuf;
  1154	
  1155		import.addr = buffer->dma_addr;
  1156		import.size = aligned_size;
  1157		import.kernel_id = get_kernel_id(buffer);
  1158	
  1159		/* Wrap it into a videocore buffer. */
  1160		status = vc_sm_cma_vchi_import(sm_state->sm_handle, &import, &result,
  1161					       &sm_state->int_trans_id);
  1162		if (status == -EINTR) {
  1163			pr_debug("[%s]: requesting import memory action restart (trans_id: %u)\n",
  1164				 __func__, sm_state->int_trans_id);
  1165			ret = -ERESTARTSYS;
  1166			private->restart_sys = -EINTR;
  1167			private->int_action = VC_SM_MSG_TYPE_IMPORT;
  1168			goto error;
  1169		} else if (status || !result.res_handle) {
  1170			pr_err("[%s]: failed to import memory on videocore (status: %u, trans_id: %u)\n",
  1171			       __func__, status, sm_state->int_trans_id);
  1172			ret = -ENOMEM;
  1173			goto error;
  1174		}
  1175	
  1176		/* Keep track of the buffer we created. */
  1177		buffer->private = private;
  1178		buffer->vc_handle = result.res_handle;
  1179		buffer->size = import.size;
  1180		buffer->vpu_state = VPU_MAPPED;
  1181		buffer->kernel_id = import.kernel_id;
  1182	
  1183		sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
  1184		if (!sgt) {
  1185			ret = -ENOMEM;
  1186			goto error;
  1187		}
  1188	
  1189		ret = dma_get_sgtable(&sm_state->pdev->dev, sgt, buffer->cookie,
  1190				      buffer->dma_addr, buffer->size);
  1191		if (ret < 0) {
  1192			/* FIXME: error handling */
  1193			pr_err("failed to get scatterlist from DMA API\n");
  1194			kfree(sgt);
  1195			ret = -ENOMEM;
  1196			goto error;
  1197		}
  1198		buffer->alloc.sg_table = sgt;
  1199	
  1200		fd = dma_buf_fd(dmabuf, O_CLOEXEC);
  1201		if (fd < 0)
  1202			goto error;
  1203	
  1204		vc_sm_add_resource(private, buffer);
  1205	
  1206		pr_debug("[%s]: Added resource as fd %d, buffer %p, private %p, dma_addr %pad\n",
  1207			 __func__, fd, buffer, private, &buffer->dma_addr);
  1208	
  1209		/* We're done */
  1210		ioparam->handle = fd;
  1211		ioparam->vc_handle = buffer->vc_handle;
  1212		ioparam->dma_addr = buffer->dma_addr;
  1213		return 0;
  1214	
  1215	error:
  1216		pr_err("[%s]: something failed - cleanup. ret %d\n", __func__, ret);
  1217	
  1218		if (dmabuf) {
  1219			/* dmabuf has been exported, therefore allow dmabuf cleanup to
  1220			 * deal with this
  1221			 */
  1222			dma_buf_put(dmabuf);
  1223		} else {
  1224			/* No dmabuf, therefore just free the buffer here */
  1225			if (buffer->cookie)
  1226				dma_free_coherent(&sm_state->pdev->dev, buffer->size,
  1227						  buffer->cookie, buffer->dma_addr);
  1228			kfree(buffer);
  1229		}
  1230		return ret;
  1231	}
  1232	
  1233	#ifndef CONFIG_ARM64
  1234	/* Converts VCSM_CACHE_OP_* to an operating function. */
  1235	static void (*cache_op_to_func(const unsigned int cache_op))
  1236							(const void*, const void*)
  1237	{
  1238		switch (cache_op) {
  1239		case VC_SM_CACHE_OP_NOP:
  1240			return NULL;
  1241	
  1242		case VC_SM_CACHE_OP_INV:
> 1243			return dmac_inv_range;
  1244		case VC_SM_CACHE_OP_CLEAN:
> 1245			return dmac_clean_range;
  1246		case VC_SM_CACHE_OP_FLUSH:
> 1247			return dmac_flush_range;
  1248	
  1249		default:
  1250			pr_err("[%s]: Invalid cache_op: 0x%08x\n", __func__, cache_op);
  1251			return NULL;
  1252		}
  1253	}
  1254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
