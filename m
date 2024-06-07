Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B0B18732D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717765619; cv=none; b=Bc82V+SfPJ2pX7ypLHtX6q16L/AcbRutid9yOLS4o6rTj39QIu8RD/ijRD9fVUHa8cH23Yachsp84HeC0MJxR7vByxgOPPOPiW1JqlRHLO4PZtUFwSiIeVH5HKqleftjMv/x7bv7DHjXeoeej8Az9XK7lkm0GiMxzYmiMnSHxQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717765619; c=relaxed/simple;
	bh=eOb89YBIezrEmTHWeEKGkVkKvA7dxBHEwJZgIJEr44E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FX+ZDz8Bk9C2mmfLoCozHCaIlqwVc4z2CmlUu6xzcIdB1er7ilEOYxzQm48FkBp00fxIyM/Rb3TGQP4uMg/8N4wYzmc08XdlXB4Og/ydNsDaER9m8t+mrmunxw48/k3DCTTqsu15d+Qy09ZEYw9YCIEs1TyNMzXbFPCEZlpre0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5CDFqXd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5CDFqXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717765618; x=1749301618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOb89YBIezrEmTHWeEKGkVkKvA7dxBHEwJZgIJEr44E=;
  b=Q5CDFqXdMMp/xFcwpwxG7fRdlHoFkJtoKkd7qqP99dGzG+YLyiLk3n6a
   kokNfG3SGggdCerFQrFl7s5VoFxkWvgs44aSTSmjRuq7wYjlO8KBm8zRW
   vQJ0qkrg5WSt2w3w0oJuEw6sQ+nMscscOZjbYEGjbPnUjR0lJttdFvDK/
   /M1Sy9pvhcGSXZrzUX3KayIccJAagkcW9rch5iHso7DwLxpapiHpjgP7R
   dt67F8Sq6moRz6K4mXeY2M1z9ju6cKz0igNOIpBIas9Vt/O5Y20bDt7h2
   CLSe1HnnhZxRLzi5IQXE1kJbrw1sSI2L2PPeYkSbfpt3wBnjfr7Jhoq/8
   w==;
X-CSE-ConnectionGUID: g8otiGS2R9mHlXbajUlXNg==
X-CSE-MsgGUID: 7LkpLdkjRr6d01D3fCeKGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25587507"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25587507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:06:57 -0700
X-CSE-ConnectionGUID: HIIdvTlHTbq0jG56L62oTw==
X-CSE-MsgGUID: CLtiwyLvRfKgFgrRc/uPBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="61522732"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2024 06:06:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFZJ0-0004oI-04;
	Fri, 07 Jun 2024 13:06:54 +0000
Date: Fri, 7 Jun 2024 21:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 122/126]
 drivers/dma-buf/heaps/restricted_heap_mtk.c:187:48: error: implicit
 declaration of function 'phys_to_page'; did you mean 'pfn_to_page'?
Message-ID: <202406072028.gY34jrqI-lkp@intel.com>
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
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240607/202406072028.gY34jrqI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072028.gY34jrqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072028.gY34jrqI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/heaps/restricted_heap_mtk.c: In function 'mtk_tee_restrict_memory':
>> drivers/dma-buf/heaps/restricted_heap_mtk.c:187:48: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
     187 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^~~~~~~~~~~~
         |                                                pfn_to_page
   drivers/dma-buf/heaps/restricted_heap_mtk.c:187:48: warning: passing argument 2 of 'sg_set_page' makes pointer from integer without a cast [-Wint-conversion]
     187 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   In file included from include/linux/dma-buf.h:19,
                    from drivers/dma-buf/heaps/restricted_heap_mtk.c:9:
   include/linux/scatterlist.h:136:69: note: expected 'struct page *' but argument is of type 'int'
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                        ~~~~~~~~~~~~~^~~~
   drivers/dma-buf/heaps/restricted_heap_mtk.c:223:33: warning: passing argument 2 of 'sg_set_page' makes pointer from integer without a cast [-Wint-conversion]
     223 |                 sg_set_page(sg, phys_to_page(tee_sg_item->pa),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/scatterlist.h:136:69: note: expected 'struct page *' but argument is of type 'int'
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                        ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +187 drivers/dma-buf/heaps/restricted_heap_mtk.c

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
