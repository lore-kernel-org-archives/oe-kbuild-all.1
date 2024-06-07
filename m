Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9A1991AF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717773918; cv=none; b=QSOt1znD+31PTlY9mSniU4uUJ7v+nuNDGN4ib0RbeD7sO76RTV54XFLyAzQ6FjRVq6xbaYrJCkdMglmfjbRjKgaYM5X5mRoMBiDEGiit2/WAFTFnWaLZomeByR/pnJBZxtl28tEEBGfPJ7HIXmTKPQ4NSej+t28gMC0R5HGqrx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717773918; c=relaxed/simple;
	bh=fOTjVkiDUvLMbsJdlVvuDTEqho86m55K/IAq5Mq1naU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SHYMzMBBkjjAYADzXZRkqbs8ubzhfPAGz5p/lpglrKNCWRdZVoYLcB8viSCbDFLi3QP5w1FRe50X0+3iEuTwea1u7mJy0nGtiBmu8YNKvvdCjcF31ATs/xpU7wAWoJrbYx2776qc0tPAOl2P3iZIdcpa7x/wtD2d850FKA5Xq+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZfLTmxE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZfLTmxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717773918; x=1749309918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fOTjVkiDUvLMbsJdlVvuDTEqho86m55K/IAq5Mq1naU=;
  b=CZfLTmxEOpuDcU/SAIn276XoYIQS0sbWR/32Ss512IH9LZLc3PHxow47
   ojfhttZBDv1SnFM/1odnsLUcDHzodTQcSe4xoVyq0eC5kLCTzhjSFVKDY
   ql/YNciyc4zIrCzscqBTw5Kedw8+F4R63z2dYPzbi9NO1VWb00Aix2gny
   4YfI31dBcnyRxGKngr1kdeYL51EG+U1I2p3uKU/MWx59HPXai+lekJuWE
   m30UdFAgs86opehM+DaXob5h7d1MxngU+ocXKNxvMyyln4pdw3kqR/4pb
   eCLF2mtWEraofqeUrLArAuXhtXI+c+V84Z8hE58uWLt0/AR/sR5bvRCYJ
   g==;
X-CSE-ConnectionGUID: OvjU4PkzRtWRKxa4JZKGlA==
X-CSE-MsgGUID: AMm6uPZwThKH4aTCR22SBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="37029993"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="37029993"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 08:25:17 -0700
X-CSE-ConnectionGUID: cppaoMyhSBWfKwyY9MzowA==
X-CSE-MsgGUID: NeQOIdU4TNW40iOXcajRdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="75840291"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Jun 2024 08:25:15 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFbSr-000022-0a;
	Fri, 07 Jun 2024 15:25:13 +0000
Date: Fri, 7 Jun 2024 23:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 122/126]
 drivers/dma-buf/heaps/restricted_heap_mtk.c:187:34: error: call to
 undeclared function 'phys_to_page'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202406072326.BN3kVtJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   bb84077a7f2f0e6433f0c71d35738db6fcfca976
commit: 64a3b3ce74a66cbab1a9f310c99028b746bfa43f [122/126] CHROMIUM: dma-buf: heaps: restricted_mtk: Retrieve the sg from TEE
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240607/202406072326.BN3kVtJ2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072326.BN3kVtJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072326.BN3kVtJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/heaps/restricted_heap_mtk.c:187:34: error: call to undeclared function 'phys_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     187 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:187:34: note: did you mean 'pmd_to_page'?
   include/linux/mm.h:2460:21: note: 'pmd_to_page' declared here
    2460 | static struct page *pmd_to_page(pmd_t *pmd)
         |                     ^
>> drivers/dma-buf/heaps/restricted_heap_mtk.c:187:34: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct page *' [-Wint-conversion]
     187 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:136:69: note: passing argument to parameter 'page' here
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                                     ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:223:19: error: call to undeclared function 'phys_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     223 |                 sg_set_page(sg, phys_to_page(tee_sg_item->pa),
         |                                 ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:223:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct page *' [-Wint-conversion]
     223 |                 sg_set_page(sg, phys_to_page(tee_sg_item->pa),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:136:69: note: passing argument to parameter 'page' here
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                                     ^
   4 errors generated.


vim +/phys_to_page +187 drivers/dma-buf/heaps/restricted_heap_mtk.c

   147	
   148	static int mtk_tee_restrict_memory(struct restricted_heap *heap, struct restricted_buffer *buf)
   149	{
   150		struct mtk_restricted_heap_data *data = heap->priv_data;
   151		struct tee_param params[TEE_PARAM_NUM] = {0};
   152		struct mtk_tee_scatterlist *tee_sg_item;
   153		struct mtk_tee_scatterlist *tee_sg_buf;
   154		unsigned int sg_num, size, i;
   155		struct tee_shm *sg_shm;
   156		struct scatterlist *sg;
   157		phys_addr_t pa_tee;
   158		u64 r_addr;
   159		int ret;
   160	
   161		/* Alloc the secure buffer and get the sg-list number from TEE */
   162		params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
   163		params[0].u.value.a = buf->size;
   164		params[0].u.value.b = PAGE_SIZE;
   165		params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
   166		params[1].u.value.a = data->mem_type;
   167		params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
   168		if (heap->cma && data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA) {
   169			params[2].u.value.a = heap->cma_paddr;
   170			params[2].u.value.b = heap->cma_size;
   171		}
   172		params[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
   173		ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
   174					   MTK_TZCMD_SECMEM_ZALLOC, params);
   175		if (ret)
   176			return -ENOMEM;
   177	
   178		r_addr = params[3].u.value.a;
   179	
   180		sg_num = params[2].u.value.a;
   181	
   182		/* If there is only one time, It means the buffer is continous,Get the PA directly. */
   183		if (sg_num == 1) {
   184			pa_tee = params[2].u.value.b;
   185			if (sg_alloc_table(&buf->sg_table, 1, GFP_KERNEL))
   186				goto tee_secmem_free;
 > 187			sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
   188			buf->restricted_addr = r_addr;
   189			return 0;
   190		}
   191	
   192		/*
   193		 * If the buffer inside TEE are discontinuous, Use sharemem to retrieve
   194		 * the detail sg list from TEE.
   195		 */
   196		tee_sg_buf = kmalloc_array(sg_num, sizeof(*tee_sg_item), GFP_KERNEL);
   197		if (!tee_sg_buf) {
   198			ret = -ENOMEM;
   199			goto tee_secmem_free;
   200		}
   201	
   202		size = sg_num * sizeof(*tee_sg_item);
   203	        sg_shm = tee_shm_register_kernel_buf(data->tee_ctx, tee_sg_buf, size);
   204	        if (!sg_shm)
   205			goto free_sg_buf;
   206	
   207		memset(params, 0, sizeof(params));
   208		params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
   209		params[0].u.value.a = r_addr;
   210		params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
   211		params[1].u.memref.shm = sg_shm;
   212	        params[1].u.memref.size = size;
   213		ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
   214					   MTK_TZCMD_SECMEM_RETRIEVE_SG, params);
   215		if (ret)
   216			goto put_shm;
   217	
   218		if (sg_alloc_table(&buf->sg_table, sg_num, GFP_KERNEL))
   219			goto put_shm;
   220	
   221		for_each_sgtable_sg(&buf->sg_table, sg, i) {
   222			tee_sg_item = tee_sg_buf + i;
   223			sg_set_page(sg, phys_to_page(tee_sg_item->pa),
   224				    tee_sg_item->length, 0);
   225		}
   226	
   227		tee_shm_put(sg_shm);
   228		kfree(tee_sg_buf);
   229		buf->restricted_addr = r_addr;
   230		return 0;
   231	
   232	put_shm:
   233		tee_shm_put(sg_shm);
   234	free_sg_buf:
   235		kfree(tee_sg_buf);
   236	tee_secmem_free:
   237		params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
   238		params[0].u.value.a = r_addr;
   239		params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
   240		mtk_tee_service_call(data->tee_ctx, data->tee_session,
   241				     MTK_TZCMD_SECMEM_FREE, params);
   242		return ret;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
