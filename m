Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65E29A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677501704; x=1709037704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOhe8rxorWodtv89OnEUYO9KYDg2q4nQri/zVgrNwc8=;
  b=aHJ3Hx3dMmV0N87QD7JDvoVZf4BDxOvYqXfczjghvPh5YMtkXgZ1AbQs
   2GJTCyMddeq/lkFm5ejIBL99H9txluJQ9+QQonJ7215lRfya+pNmGidwl
   bJ/jH4TmdQY69qCnxmMZuhv+bWYV1HrjRG5xoeZkdljjd+hm/NWSUDOMF
   Py2E/LS2Vp4jzb3TtIRcRkpIDXbcdgJ1FkBAd3V6AyR+5vVHBhpV0eA1g
   +ZU9o+mDUix2u565oNMXP3fW/Tytuflbc6Ai5vmzfXKkcjeVEZEYyaRHe
   /TDWa1Oe7znFMDIltE2fwKS2fEO7an6RuVA8QH8MtHbTcU1e/dZZTFiUD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="396400641"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="396400641"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 04:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="675872336"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="675872336"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 04:41:41 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWcp2-0004PD-2T;
	Mon, 27 Feb 2023 12:41:40 +0000
Date: Mon, 27 Feb 2023 20:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 317/583]
 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1243:10: error: use of
 undeclared identifier 'dmac_inv_range'; did you mean 'mas_set_range'?
Message-ID: <202302272021.wluI9Kut-lkp@intel.com>
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
config: hexagon-randconfig-r041-20230227 (https://download.01.org/0day-ci/archive/20230227/202302272021.wluI9Kut-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/f1442f2d4928f4c338ee1f404a8047c13ae3756f
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout f1442f2d4928f4c338ee1f404a8047c13ae3756f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/staging/vc04_services/vc-sm-cma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272021.wluI9Kut-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:33:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:33:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:33:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:806:19: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
           buffer->imported = 1;
                            ^ ~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:812:17: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
           buffer->in_use = 1;
                          ^ ~
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:704:1: warning: no previous prototype for function 'vc_sm_cma_import_dmabuf_internal' [-Wmissing-prototypes]
   vc_sm_cma_import_dmabuf_internal(struct vc_sm_privdata_t *private,
   ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:703:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1092:5: warning: no previous prototype for function 'vc_sm_cma_ioctl_alloc' [-Wmissing-prototypes]
   int vc_sm_cma_ioctl_alloc(struct vc_sm_privdata_t *private,
       ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1092:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vc_sm_cma_ioctl_alloc(struct vc_sm_privdata_t *private,
   ^
   static 
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1243:10: error: use of undeclared identifier 'dmac_inv_range'; did you mean 'mas_set_range'?
                   return dmac_inv_range;
                          ^~~~~~~~~~~~~~
                          mas_set_range
   include/linux/maple_tree.h:537:6: note: 'mas_set_range' declared here
   void mas_set_range(struct ma_state *mas, unsigned long start, unsigned long last)
        ^
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1243:10: error: incompatible function pointer types returning 'void (struct ma_state *, unsigned long, unsigned long)' from a function with result type 'void (*)(const void *, const void *)' [-Wincompatible-function-pointer-types]
                   return dmac_inv_range;
                          ^~~~~~~~~~~~~~
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1245:10: error: use of undeclared identifier 'dmac_clean_range'
                   return dmac_clean_range;
                          ^
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1247:10: error: use of undeclared identifier 'dmac_flush_range'
                   return dmac_flush_range;
                          ^
   10 warnings and 4 errors generated.


vim +1243 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c

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
