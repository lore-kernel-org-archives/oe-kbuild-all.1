Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FD323C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681816662; x=1713352662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdFM2HRmM73SqI45QxNlQ+UVh374H+O8tdTlhVIeZnQ=;
  b=ksp7t3OvLUofR0c41tenaHtrG9ojJin7mlUuCkGYa52EVMHmNSdE47ac
   aAfEszrHqHLAScvvOzOjVqQc2RxgzoT/NslHxTgEKP3uw9mmxPerDt9D7
   slZDiVYpbi+hEDkHujGU4iMlN3mL68MPwoX81V5RrTOitSiH7keC7YdCk
   y12x6bsAkC4cEx86YGdG7+g0EjhAN4lQ27EIUu93vfGwOl7lP2K6sfRI4
   kTgFmEduzYyA26cb6CZW/Qk1RLgINdOtD971wqxeD4WqolP/cl6xj4DGw
   z7G7EKDUvGFDS5hE6BO+aUxaGbVc8atD1UZ0JaxjvJJUKV40kVjBnLPxq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347893603"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="347893603"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 04:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834847825"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="834847825"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2023 04:17:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pojL5-000dJT-1V;
	Tue, 18 Apr 2023 11:17:35 +0000
Date: Tue, 18 Apr 2023 19:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:rlist 24/28]
 drivers/infiniband/hw/efa/efa_verbs.c:1301:9: error: implicit declaration of
 function 'rdma_for_each_block'; did you mean 'rdma_for_each_port'?
Message-ID: <202304181904.gJUqVZ5N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux rlist
head:   a7cd9881872ca2566ca744155c307ca414341e04
commit: 887d4845bf1627a914b5cc123f145cbb97f42c04 [24/28] RDMA: Switch ib_umem to rlist
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230418/202304181904.gJUqVZ5N-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/887d4845bf1627a914b5cc123f145cbb97f42c04
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe rlist
        git checkout 887d4845bf1627a914b5cc123f145cbb97f42c04
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/infiniband/hw/efa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181904.gJUqVZ5N-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/infiniband/hw/efa/efa_verbs.c: In function 'pbl_chunk_list_create':
>> drivers/infiniband/hw/efa/efa_verbs.c:1301:9: error: implicit declaration of function 'rdma_for_each_block'; did you mean 'rdma_for_each_port'? [-Werror=implicit-function-declaration]
    1301 |         rdma_for_each_block(pages_sgl, &biter, sg_dma_cnt,
         |         ^~~~~~~~~~~~~~~~~~~
         |         rdma_for_each_port
>> drivers/infiniband/hw/efa/efa_verbs.c:1302:52: error: expected ';' before '{' token
    1302 |                             EFA_CHUNK_PAYLOAD_SIZE) {
         |                                                    ^~
         |                                                    ;
   drivers/infiniband/hw/efa/efa_verbs.c:1345:1: warning: label 'chunk_list_unmap' defined but not used [-Wunused-label]
    1345 | chunk_list_unmap:
         | ^~~~~~~~~~~~~~~~
   drivers/infiniband/hw/efa/efa_verbs.c:1268:20: warning: unused variable 'dma_addr' [-Wunused-variable]
    1268 |         dma_addr_t dma_addr;
         |                    ^~~~~~~~
   drivers/infiniband/hw/efa/efa_verbs.c:1266:30: warning: unused variable 'prev_chunk_buf' [-Wunused-variable]
    1266 |         u64 *cur_chunk_buf, *prev_chunk_buf;
         |                              ^~~~~~~~~~~~~~
>> drivers/infiniband/hw/efa/efa_verbs.c:1266:14: warning: variable 'cur_chunk_buf' set but not used [-Wunused-but-set-variable]
    1266 |         u64 *cur_chunk_buf, *prev_chunk_buf;
         |              ^~~~~~~~~~~~~
   drivers/infiniband/hw/efa/efa_verbs.c:1265:40: warning: unused variable 'ctrl_buf' [-Wunused-variable]
    1265 |         struct efa_com_ctrl_buff_info *ctrl_buf;
         |                                        ^~~~~~~~
>> drivers/infiniband/hw/efa/efa_verbs.c:1263:50: warning: variable 'payload_idx' set but not used [-Wunused-but-set-variable]
    1263 |         unsigned int chunk_list_size, chunk_idx, payload_idx;
         |                                                  ^~~~~~~~~~~
>> drivers/infiniband/hw/efa/efa_verbs.c:1263:39: warning: variable 'chunk_idx' set but not used [-Wunused-but-set-variable]
    1263 |         unsigned int chunk_list_size, chunk_idx, payload_idx;
         |                                       ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +1301 drivers/infiniband/hw/efa/efa_verbs.c

40909f664d2797 Gal Pressman 2019-05-05  1253  
40909f664d2797 Gal Pressman 2019-05-05  1254  /*
40909f664d2797 Gal Pressman 2019-05-05  1255   * create a chunk list of physical pages dma addresses from the supplied
40909f664d2797 Gal Pressman 2019-05-05  1256   * scatter gather list
40909f664d2797 Gal Pressman 2019-05-05  1257   */
40909f664d2797 Gal Pressman 2019-05-05  1258  static int pbl_chunk_list_create(struct efa_dev *dev, struct pbl_context *pbl)
40909f664d2797 Gal Pressman 2019-05-05  1259  {
40909f664d2797 Gal Pressman 2019-05-05  1260  	struct pbl_chunk_list *chunk_list = &pbl->phys.indirect.chunk_list;
40909f664d2797 Gal Pressman 2019-05-05  1261  	int page_cnt = pbl->phys.indirect.pbl_buf_size_in_pages;
40909f664d2797 Gal Pressman 2019-05-05  1262  	struct scatterlist *pages_sgl = pbl->phys.indirect.sgl;
4d50e084c560fa Gal Pressman 2019-05-28 @1263  	unsigned int chunk_list_size, chunk_idx, payload_idx;
40909f664d2797 Gal Pressman 2019-05-05  1264  	int sg_dma_cnt = pbl->phys.indirect.sg_dma_cnt;
40909f664d2797 Gal Pressman 2019-05-05  1265  	struct efa_com_ctrl_buff_info *ctrl_buf;
40909f664d2797 Gal Pressman 2019-05-05 @1266  	u64 *cur_chunk_buf, *prev_chunk_buf;
4d50e084c560fa Gal Pressman 2019-05-28  1267  	struct ib_block_iter biter;
40909f664d2797 Gal Pressman 2019-05-05  1268  	dma_addr_t dma_addr;
40909f664d2797 Gal Pressman 2019-05-05  1269  	int i;
40909f664d2797 Gal Pressman 2019-05-05  1270  
40909f664d2797 Gal Pressman 2019-05-05  1271  	/* allocate a chunk list that consists of 4KB chunks */
40909f664d2797 Gal Pressman 2019-05-05  1272  	chunk_list_size = DIV_ROUND_UP(page_cnt, EFA_PTRS_PER_CHUNK);
40909f664d2797 Gal Pressman 2019-05-05  1273  
40909f664d2797 Gal Pressman 2019-05-05  1274  	chunk_list->size = chunk_list_size;
40909f664d2797 Gal Pressman 2019-05-05  1275  	chunk_list->chunks = kcalloc(chunk_list_size,
40909f664d2797 Gal Pressman 2019-05-05  1276  				     sizeof(*chunk_list->chunks),
40909f664d2797 Gal Pressman 2019-05-05  1277  				     GFP_KERNEL);
40909f664d2797 Gal Pressman 2019-05-05  1278  	if (!chunk_list->chunks)
40909f664d2797 Gal Pressman 2019-05-05  1279  		return -ENOMEM;
40909f664d2797 Gal Pressman 2019-05-05  1280  
40909f664d2797 Gal Pressman 2019-05-05  1281  	ibdev_dbg(&dev->ibdev,
40909f664d2797 Gal Pressman 2019-05-05  1282  		  "chunk_list_size[%u] - pages[%u]\n", chunk_list_size,
40909f664d2797 Gal Pressman 2019-05-05  1283  		  page_cnt);
40909f664d2797 Gal Pressman 2019-05-05  1284  
40909f664d2797 Gal Pressman 2019-05-05  1285  	/* allocate chunk buffers: */
40909f664d2797 Gal Pressman 2019-05-05  1286  	for (i = 0; i < chunk_list_size; i++) {
40909f664d2797 Gal Pressman 2019-05-05  1287  		chunk_list->chunks[i].buf = kzalloc(EFA_CHUNK_SIZE, GFP_KERNEL);
40909f664d2797 Gal Pressman 2019-05-05  1288  		if (!chunk_list->chunks[i].buf)
40909f664d2797 Gal Pressman 2019-05-05  1289  			goto chunk_list_dealloc;
40909f664d2797 Gal Pressman 2019-05-05  1290  
40909f664d2797 Gal Pressman 2019-05-05  1291  		chunk_list->chunks[i].length = EFA_CHUNK_USED_SIZE;
40909f664d2797 Gal Pressman 2019-05-05  1292  	}
40909f664d2797 Gal Pressman 2019-05-05  1293  	chunk_list->chunks[chunk_list_size - 1].length =
40909f664d2797 Gal Pressman 2019-05-05  1294  		((page_cnt % EFA_PTRS_PER_CHUNK) * EFA_CHUNK_PAYLOAD_PTR_SIZE) +
40909f664d2797 Gal Pressman 2019-05-05  1295  			EFA_CHUNK_PTR_SIZE;
40909f664d2797 Gal Pressman 2019-05-05  1296  
40909f664d2797 Gal Pressman 2019-05-05  1297  	/* fill the dma addresses of sg list pages to chunks: */
40909f664d2797 Gal Pressman 2019-05-05  1298  	chunk_idx = 0;
40909f664d2797 Gal Pressman 2019-05-05  1299  	payload_idx = 0;
40909f664d2797 Gal Pressman 2019-05-05  1300  	cur_chunk_buf = chunk_list->chunks[0].buf;
4d50e084c560fa Gal Pressman 2019-05-28 @1301  	rdma_for_each_block(pages_sgl, &biter, sg_dma_cnt,
4d50e084c560fa Gal Pressman 2019-05-28 @1302  			    EFA_CHUNK_PAYLOAD_SIZE) {
40909f664d2797 Gal Pressman 2019-05-05  1303  		cur_chunk_buf[payload_idx++] =
4d50e084c560fa Gal Pressman 2019-05-28  1304  			rdma_block_iter_dma_address(&biter);
40909f664d2797 Gal Pressman 2019-05-05  1305  
40909f664d2797 Gal Pressman 2019-05-05  1306  		if (payload_idx == EFA_PTRS_PER_CHUNK) {
40909f664d2797 Gal Pressman 2019-05-05  1307  			chunk_idx++;
40909f664d2797 Gal Pressman 2019-05-05  1308  			cur_chunk_buf = chunk_list->chunks[chunk_idx].buf;
40909f664d2797 Gal Pressman 2019-05-05  1309  			payload_idx = 0;
40909f664d2797 Gal Pressman 2019-05-05  1310  		}
40909f664d2797 Gal Pressman 2019-05-05  1311  	}
40909f664d2797 Gal Pressman 2019-05-05  1312  
40909f664d2797 Gal Pressman 2019-05-05  1313  	/* map chunks to dma and fill chunks next ptrs */
40909f664d2797 Gal Pressman 2019-05-05  1314  	for (i = chunk_list_size - 1; i >= 0; i--) {
40909f664d2797 Gal Pressman 2019-05-05  1315  		dma_addr = dma_map_single(&dev->pdev->dev,
40909f664d2797 Gal Pressman 2019-05-05  1316  					  chunk_list->chunks[i].buf,
40909f664d2797 Gal Pressman 2019-05-05  1317  					  chunk_list->chunks[i].length,
40909f664d2797 Gal Pressman 2019-05-05  1318  					  DMA_TO_DEVICE);
40909f664d2797 Gal Pressman 2019-05-05  1319  		if (dma_mapping_error(&dev->pdev->dev, dma_addr)) {
40909f664d2797 Gal Pressman 2019-05-05  1320  			ibdev_err(&dev->ibdev,
40909f664d2797 Gal Pressman 2019-05-05  1321  				  "chunk[%u] dma_map_failed\n", i);
40909f664d2797 Gal Pressman 2019-05-05  1322  			goto chunk_list_unmap;
40909f664d2797 Gal Pressman 2019-05-05  1323  		}
40909f664d2797 Gal Pressman 2019-05-05  1324  
40909f664d2797 Gal Pressman 2019-05-05  1325  		chunk_list->chunks[i].dma_addr = dma_addr;
40909f664d2797 Gal Pressman 2019-05-05  1326  		ibdev_dbg(&dev->ibdev,
40909f664d2797 Gal Pressman 2019-05-05  1327  			  "chunk[%u] mapped at [%pad]\n", i, &dma_addr);
40909f664d2797 Gal Pressman 2019-05-05  1328  
40909f664d2797 Gal Pressman 2019-05-05  1329  		if (!i)
40909f664d2797 Gal Pressman 2019-05-05  1330  			break;
40909f664d2797 Gal Pressman 2019-05-05  1331  
40909f664d2797 Gal Pressman 2019-05-05  1332  		prev_chunk_buf = chunk_list->chunks[i - 1].buf;
40909f664d2797 Gal Pressman 2019-05-05  1333  
40909f664d2797 Gal Pressman 2019-05-05  1334  		ctrl_buf = (struct efa_com_ctrl_buff_info *)
40909f664d2797 Gal Pressman 2019-05-05  1335  				&prev_chunk_buf[EFA_PTRS_PER_CHUNK];
40909f664d2797 Gal Pressman 2019-05-05  1336  		ctrl_buf->length = chunk_list->chunks[i].length;
40909f664d2797 Gal Pressman 2019-05-05  1337  
40909f664d2797 Gal Pressman 2019-05-05  1338  		efa_com_set_dma_addr(dma_addr,
40909f664d2797 Gal Pressman 2019-05-05  1339  				     &ctrl_buf->address.mem_addr_high,
40909f664d2797 Gal Pressman 2019-05-05  1340  				     &ctrl_buf->address.mem_addr_low);
40909f664d2797 Gal Pressman 2019-05-05  1341  	}
40909f664d2797 Gal Pressman 2019-05-05  1342  
40909f664d2797 Gal Pressman 2019-05-05  1343  	return 0;
40909f664d2797 Gal Pressman 2019-05-05  1344  
40909f664d2797 Gal Pressman 2019-05-05  1345  chunk_list_unmap:
40909f664d2797 Gal Pressman 2019-05-05  1346  	for (; i < chunk_list_size; i++) {
40909f664d2797 Gal Pressman 2019-05-05  1347  		dma_unmap_single(&dev->pdev->dev, chunk_list->chunks[i].dma_addr,
40909f664d2797 Gal Pressman 2019-05-05  1348  				 chunk_list->chunks[i].length, DMA_TO_DEVICE);
40909f664d2797 Gal Pressman 2019-05-05  1349  	}
40909f664d2797 Gal Pressman 2019-05-05  1350  chunk_list_dealloc:
40909f664d2797 Gal Pressman 2019-05-05  1351  	for (i = 0; i < chunk_list_size; i++)
40909f664d2797 Gal Pressman 2019-05-05  1352  		kfree(chunk_list->chunks[i].buf);
40909f664d2797 Gal Pressman 2019-05-05  1353  
40909f664d2797 Gal Pressman 2019-05-05  1354  	kfree(chunk_list->chunks);
40909f664d2797 Gal Pressman 2019-05-05  1355  	return -ENOMEM;
40909f664d2797 Gal Pressman 2019-05-05  1356  }
40909f664d2797 Gal Pressman 2019-05-05  1357  

:::::: The code at line 1301 was first introduced by commit
:::::: 4d50e084c560fa952e235d092cf53c86d8bf4b7b RDMA/efa: Use rdma block iterator in chunk list creation

:::::: TO: Gal Pressman <galpress@amazon.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
