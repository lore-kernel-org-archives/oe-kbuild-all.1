Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3381E28F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740269639; cv=none; b=aDwLunGIsmoiGQKz+4W8Sedb4D4Ujz3dU/wnrKcG9IryayQrR35zAlGtmqekZUytn+kQ0i0tD0YYoKyN4rxGOETHaD3g6Y/YmEYZvl2reUoxRho9fMMJ7JKUHT9XmI/ke49eqsTPLbYb2TgA8dAnYujiZKcryk3U4hjOWf8cIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740269639; c=relaxed/simple;
	bh=zTzXefWbnR8a+CMriiVEK+h3bIsz5Ez2N0EAi208g3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0H4RWNta1NTuNXuK2Oz7bA7o/VDKNfsl8uX80f329bKsRdmsmObCCpwycQxV+r2Wt9jEOw0QYO7jPKdZx/8+OVXBBXWuLkuHzxYkUJlxI7m59rZm3S3UaHrP/ix7fkSMxlia9YXdgB4DhG9FKwp0FZXU7RW15M9jvMVfxWk2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYf06ZsN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYf06ZsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740269637; x=1771805637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTzXefWbnR8a+CMriiVEK+h3bIsz5Ez2N0EAi208g3g=;
  b=WYf06ZsNGSLA9Q2pwaPcFqy4EUkHz40NJEA+jheGqbtXUX7FGEHkauFR
   /CDonXKaDGsMLncEZMvXxRMbyiDYDH1g1CTcHiEL6ZD57qmpv7ZEpBf1C
   H/OeHtX131vh1cmvufT+YEdOPyWmYNwZ3IG48j1k2bujks+bHK5y0JEMm
   7fQMJDkWcVj8Otg1JZRaPC3K+0oLRdMbAgWZT7mc2pVcr+WT8M1B5g1rC
   Wj0rIUtgoauT6vZQQaGlv0d6cZZqM8PcacqeNMcqq3HQeFBW7DG5cW4M8
   PXp//kPtuoEfsLUUnog53xW0FZCwf6yGEFhM1yLIAX2q+J+tafvEEMUWx
   Q==;
X-CSE-ConnectionGUID: JdA/BhNxRgy6DnrQblYtQQ==
X-CSE-MsgGUID: CSV1flaUSZmRV87uSvBvHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="41202652"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="41202652"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 16:13:57 -0800
X-CSE-ConnectionGUID: TzM04wfsRM6E37auXU+CqA==
X-CSE-MsgGUID: 9i+4EGQNR7WtGkOElD8kig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115899106"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Feb 2025 16:13:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlzd3-00070J-1L;
	Sun, 23 Feb 2025 00:13:53 +0000
Date: Sun, 23 Feb 2025 08:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 0/8]
 drivers/dma-buf/heaps/restricted_heap_mtk.c:537:6: error: call to undeclared
 function 'of_get_flat_dt_prop'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202502230804.ZFViXboa-lkp@intel.com>
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
commit: cebde616e78fae2ba1d76a7dd61392c07ed375ec [0/8] CHROMIUM: dma-buf: heaps: mtk_restricted: Add carveout memory support
config: i386-randconfig-051-20250223 (https://download.01.org/0day-ci/archive/20250223/202502230804.ZFViXboa-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230804.ZFViXboa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230804.ZFViXboa-lkp@intel.com/

Note: the chrome-os/chromeos-6.6 HEAD 1fccbaa220247bcecbab7873df408563a5a4344f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/dma-buf/heaps/restricted_heap_mtk.c:234:52: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     233 |                 pr_err("%s: failed used 0x%x total_size 0x%lx needed 0x%lx\n",
         |                                                                        ~~~
         |                                                                        %zx
     234 |                         __func__, data->cma_used_size, heap->resv_size, buf->size);
         |                                                                         ^~~~~~~~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/dma-buf/heaps/restricted_heap_mtk.c:371:34: error: call to undeclared function 'phys_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     371 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:371:34: note: did you mean 'phys_to_virt'?
   arch/x86/include/asm/io.h:147:21: note: 'phys_to_virt' declared here
     147 | static inline void *phys_to_virt(phys_addr_t address)
         |                     ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:371:34: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct page *' [-Wint-conversion]
     371 |                 sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
         |                                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:136:69: note: passing argument to parameter 'page' here
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                                     ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:409:19: error: call to undeclared function 'phys_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     409 |                 sg_set_page(sg, phys_to_page(tee_sg_item->pa),
         |                                 ^
   drivers/dma-buf/heaps/restricted_heap_mtk.c:409:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct page *' [-Wint-conversion]
     409 |                 sg_set_page(sg, phys_to_page(tee_sg_item->pa),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:136:69: note: passing argument to parameter 'page' here
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                                     ^
>> drivers/dma-buf/heaps/restricted_heap_mtk.c:537:6: error: call to undeclared function 'of_get_flat_dt_prop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     537 |         if (of_get_flat_dt_prop(node, "reusable", NULL)) {
         |             ^
   1 warning and 5 errors generated.


vim +/of_get_flat_dt_prop +537 drivers/dma-buf/heaps/restricted_heap_mtk.c

   523	
   524	static int __init mtk_restricted_resv_init(struct reserved_mem *rmem)
   525	{
   526		struct restricted_heap *rheap = mtk_restricted_heaps, *rheap_resv = NULL;
   527		struct mtk_restricted_heap_data *data;
   528		unsigned long node = rmem->fdt_node;
   529		struct cma *cma = NULL;
   530		int ret, i;
   531	
   532		/* If restricted_region in the device tree has the 'reusable' attribute,
   533		 * it uses CMA to dynamically allocate memory. If restricted_region has
   534		 * the 'no-map' attribute, it uses carveout memory. This depends on the
   535		 * platform configuration.
   536		 */
 > 537		if (of_get_flat_dt_prop(node, "reusable", NULL)) {
   538			ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name, &cma);
   539			if (ret || !cma) {
   540				pr_err("%s: %s set up CMA fail. ret %d.\n", __func__, rmem->name, ret);
   541				return ret;
   542			}
   543		}
   544	
   545		for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++) {
   546			data = rheap->priv_data;
   547			if (data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA) {
   548				rheap_resv = rheap;
   549				rheap_resv->cma = cma;
   550				if (!cma)
   551					data->is_carveout = true;
   552				break;
   553			}
   554		}
   555		if (!rheap_resv)
   556			return -EINVAL;
   557	
   558		rheap_resv->resv_paddr = rmem->base;
   559		rheap_resv->resv_size = rmem->size;
   560		return 0;
   561	}
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
