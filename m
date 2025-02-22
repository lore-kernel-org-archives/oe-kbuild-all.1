Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E531EA7EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740262260; cv=none; b=bna70Uhxqf4iWRJ/wtTZGd1B6Q0V6e1rPIteLrZYcuZlkUeJpz5fdIBLEIbd4DHVqtG0knFmohKzamscfmXRGPkbtDw8zxSpU3KOWJ0HRT2TPnT9D/YCnFnPAmynDooJL796TW2IkCTEsSURk6cpDUci8M1/x85M4HdlEpdQldY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740262260; c=relaxed/simple;
	bh=EcUrjcaIUd0wmfWUpOi0aP7Np0Zk/Ud7BwqYQp73pZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ev3459wFxqViDOkB9a1CXi5s4f1VgzBzmFEjuPEYibMsPNwv+wD/LvalL51Pwh1J+t1NWAwd5bP7ENmyYU/+kh92OA385Du4mZOD5NFU72i3/rIzqNn0w/XuIB1B6S0NOxEf1E74Qi7y+t+PhQpp4+hBw0IIClL5/hRIYgaAUZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/fEyHB1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/fEyHB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740262258; x=1771798258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EcUrjcaIUd0wmfWUpOi0aP7Np0Zk/Ud7BwqYQp73pZo=;
  b=l/fEyHB1w0oD4OwzehlNXtT2D190nDWZjAn0dX1XfnE4LiJnLQn089AR
   0qUV7h/RPVcnWWbobrgPEnr5I4GEOm3XXrI4FEXFZe818x0sYeF8teBrC
   KDK67I5f9WCbKjN/MnE3aiXPRP4F32eQl5JN9SkjDUOGjinccs4IO7Wvg
   0FgVYQWr5WCEij37y+VXz7KAPMYmSer49pEcpHlIsbHsuU5WJ97FGDYuj
   6OyoYoC+fo84uf06UncvdsSwBdW6skoqvrGP9q6vlismjV62RPQ6lgoBe
   ErolpDGmbBAbXiGBBh+0iSHnjCn88jX3ARfU/2Xju/V2bM33966hKEMl/
   w==;
X-CSE-ConnectionGUID: JviOArRDS2i9M1GIa4j6tQ==
X-CSE-MsgGUID: finVb54oQTqkM+Zodp45XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="52458072"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="52458072"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 14:10:57 -0800
X-CSE-ConnectionGUID: J77rvnxNTPCYvrl6Ggu1og==
X-CSE-MsgGUID: nDoPeWkdTk2bsokCCOFoIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152885579"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Feb 2025 14:10:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlxi2-0006wl-0H;
	Sat, 22 Feb 2025 22:10:54 +0000
Date: Sun, 23 Feb 2025 06:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 0/8]
 drivers/dma-buf/heaps/restricted_heap_mtk.c:226:51: warning: format
 specifies type 'unsigned long' but the argument has type 'size_t' (aka
 'unsigned int')
Message-ID: <202502230644.MwHFmwWe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fccbaa220247bcecbab7873df408563a5a4344f
commit: 2d808e7e1cc13b4c3a7ea5eb6cb81d25442e11be [0/8] CHROMIUM: dma-buf: heaps: mtk_restricted: Add dynamic CMA support
config: i386-randconfig-051-20250223 (https://download.01.org/0day-ci/archive/20250223/202502230644.MwHFmwWe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230644.MwHFmwWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230644.MwHFmwWe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/heaps/restricted_heap_mtk.c:226:51: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     225 |                 pr_err("%s: failed used 0x%x total_size 0x%lx needed 0x%lx\n",
         |                                                                        ~~~
         |                                                                        %zx
     226 |                         __func__, data->cma_used_size, heap->cma_size, buf->size);
         |                                                                        ^~~~~~~~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/dma-buf/heaps/restricted_heap_mtk.c:352:34: error: call to undeclared function 'phys_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     352 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:352:34: note: did you mean 'phys_to_virt'?
   arch/x86/include/asm/io.h:147:21: note: 'phys_to_virt' declared here
     147 | static inline void *phys_to_virt(phys_addr_t address)
         |                     ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:352:34: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct page *' [-Wint-conversion]
     352 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:136:69: note: passing argument to parameter 'page' here
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                                     ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:390:19: error: call to undeclared function 'phys_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     390 |                 sg_set_page(sg, phys_to_page(tee_sg_item->pa),
         |                                 ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:390:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct page *' [-Wint-conversion]
     390 |                 sg_set_page(sg, phys_to_page(tee_sg_item->pa),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:136:69: note: passing argument to parameter 'page' here
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                                     ^
   1 warning and 4 errors generated.


vim +226 drivers/dma-buf/heaps/restricted_heap_mtk.c

   199	
   200	static int mtk_restricted_memory_cma_allocate(struct restricted_heap *heap,
   201						      struct restricted_buffer *buf)
   202	{
   203		struct mtk_restricted_heap_data *data = heap->priv_data;
   204		unsigned long block_start, block_size, cm_mem_end;
   205		int ret = 0, i;
   206	
   207		if (!data->cma_block_count) {
   208			ret = mtk_tee_get_cma_region_num(heap);
   209			if (ret) {
   210				pr_err("%s: failed to get cma region num %d\n",
   211				       __func__, ret);
   212				return ret;
   213			}
   214		}
   215	
   216		/*
   217		 * The reserved memory will be divided into several blocks in TEE.
   218		 * Allocate a block from CMA when allocating buffer return OOM in TEE.
   219		 * The variable "cma_hold_size" and "cma_used_size" will be
   220		 * increased. Actually the memory allocating is within the TEE.
   221		 */
   222		cm_mem_end = heap->cma_paddr + heap->cma_size;
   223		mutex_lock(&data->lock);
   224		if ((buf->size + data->cma_used_size) > heap->cma_size) {
   225			pr_err("%s: failed used 0x%x total_size 0x%lx needed 0x%lx\n",
 > 226				__func__, data->cma_used_size, heap->cma_size, buf->size);
   227			ret = -ENOMEM;
   228			goto out_unlock;
   229		}
   230		if (((buf->size + data->cma_used_size) > data->cma_hold_size) || data->oom_retry) {
   231			for (i = 0; i < data->cma_block_count; ++i) {
   232				if (data->cma_hold_block_mask & BIT(i))
   233					continue;
   234	
   235				block_start = heap->cma_paddr + data->cma_block_size * i;
   236				block_size = min(data->cma_block_size, cm_mem_end - block_start);
   237				ret = alloc_contig_range(PFN_DOWN(block_start),
   238							 PFN_DOWN(block_start + block_size),
   239							 MIGRATE_CMA, GFP_KERNEL);
   240				if (ret) {
   241					pr_err("%s: failed to alloc block %d mask 0x%x, ret %d\n",
   242						__func__, i, data->cma_hold_block_mask, ret);
   243					continue;
   244				}
   245				data->cma_hold_block_mask |= BIT(i);
   246				data->cma_hold_size += block_size;
   247				data->cma_page_index = i;
   248				break;
   249			}
   250		}
   251		if (data->oom_retry) {
   252			data->oom_retry = false;
   253			goto out_unlock;
   254		}
   255		data->cma_used_size += buf->size;
   256	
   257	out_unlock:
   258		/* TODO: Free the previous successful case. */
   259		mutex_unlock(&data->lock);
   260		return ret;
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
