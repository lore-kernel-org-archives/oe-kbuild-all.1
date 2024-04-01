Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1891119E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711968583; cv=none; b=N7XERaDqQII07KMKb/QQ42wl6+YNZzfpF7CeXcUsssI2aCOzgm9NxeZd0cvfxos0k73AzkuTGwj9TgmBbxcrMoGuTyqygrGkU+MuLKHiUySNhmhauP/9o4jepnTrIxEXYcWiZtCG+9nNrQTopJVqEGlwn0ZQhV2aeiMTP0N7GXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711968583; c=relaxed/simple;
	bh=1YrQei/ogHky5a6P90LId2J0+0IK+FWe2yUcEYuM3vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+4VedQBcCf8e3NMEeI0OWljBpqKNCHmQ/a9nZSMnD4EFB4qVB49Qh5RqwpzKKDbdu9sRq3MyWaOLl9uokwz2xBCtGUc/D4QjXGQu5zRHOZH/PQBs33z3J50YXjGzin/9ZUL3Gq7bn2P7aIEa42FRK7fkpDuKWppnyaZLOau+vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flWtZssx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flWtZssx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711968582; x=1743504582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1YrQei/ogHky5a6P90LId2J0+0IK+FWe2yUcEYuM3vU=;
  b=flWtZssxkyA5JE1Dm/PjvzIJS/x3lM5Z9ed+8baoe4cElNHxtlt5bDtH
   2CeaPUMKbeQAmmH4nH6jgfbF7Zji2W2Zlg8ICXvk0ShhdSMdcmqPmyPNq
   MChH2/FOb1E2S6e040DG+4ibJ7XIFJRlWfpphkcHs7oHNRV6wCYSlMUPr
   uLzZn4ILD+lIYcTb25unu00U+CJ6MK+JQEdhEPZegRks0rFtoDIuZl787
   tDlZYzyEcXTbUOoT9XsMvWHNGwqRLxdr1cwXsxiqFlgSCZF396HOP2e4i
   IWkuOpS/DRBpq/e8zSnMSHjlaw2FWTu88Zm/7HqOAxCmz+mN/CraweDTt
   Q==;
X-CSE-ConnectionGUID: 8pwHrRY+Qiu3bsSv6GRy7w==
X-CSE-MsgGUID: z7Njm+GCS86FGDkMZQPyQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6953816"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="6953816"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 03:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="18138234"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Apr 2024 03:49:40 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrFEP-0000Ft-0b;
	Mon, 01 Apr 2024 10:49:37 +0000
Date: Mon, 1 Apr 2024 18:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vivek-drm-tip:virtgpu_import_rfc 9/9]
 drivers/dma-buf/udmabuf.c:347:65: warning: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202404011818.7ITWXwDw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/Vivek/drm-tip.git virtgpu_import_rfc
head:   2347bf8ba6d850818b830aa54bb75d4b892fb6a8
commit: 2347bf8ba6d850818b830aa54bb75d4b892fb6a8 [9/9] udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240401/202404011818.7ITWXwDw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404011818.7ITWXwDw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404011818.7ITWXwDw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:66,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rbtree.h:24,
                    from include/linux/key.h:15,
                    from include/linux/cred.h:13,
                    from drivers/dma-buf/udmabuf.c:2:
   drivers/dma-buf/udmabuf.c: In function 'handle_pcidev_pages':
>> drivers/dma-buf/udmabuf.c:347:65: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     347 |                         page = virt_to_page((unsigned long)addr + size);
         |                                             ~~~~~~~~~~~~~~~~~~~~^~~~~~
         |                                                                 |
         |                                                                 long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   drivers/dma-buf/udmabuf.c:347:32: note: in expansion of macro 'virt_to_page'
     347 |                         page = virt_to_page((unsigned long)addr + size);
         |                                ^~~~~~~~~~~~
   In file included from arch/m68k/include/asm/page.h:60:
   arch/m68k/include/asm/page_mm.h:123:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     123 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~


vim +/virt_to_pfn +347 drivers/dma-buf/udmabuf.c

   299	
   300	static int handle_pcidev_pages(struct udmabuf *ubuf,
   301				       struct udmabuf_create_list *head,
   302				       struct udmabuf_create_item *list)
   303	{
   304		struct pci_dev *pdev = NULL;
   305		resource_size_t bar_size;
   306		pgoff_t pgbuf = 0;
   307		struct page *page;
   308		int i, ret;
   309		size_t size;
   310		void *addr;
   311	
   312		for (i = 0; i < head->count; i++) {
   313			if (!ubuf->pdev) {
   314				pdev = pci_get_domain_bus_and_slot(0,
   315							PCI_BUS_NUM(list[i].devid),
   316							list[i].devid & 0xff);
   317				if (!pdev) {
   318					ret = -ENODEV;
   319					goto err;
   320				}
   321	
   322				ubuf->pdev = pdev;
   323			}
   324	
   325			bar_size = pci_resource_len(pdev, list[i].bar);
   326			if (list[i].offset > bar_size ||
   327			    list[i].offset + list[i].size > bar_size) {
   328				ret = -EINVAL;
   329				goto err;
   330			}
   331	
   332			ret = pci_p2pdma_add_resource(pdev,
   333						      list[i].bar,
   334						      list[i].size,
   335						      list[i].offset);
   336			if (ret)
   337				goto err;
   338	
   339			addr = pci_alloc_p2pmem(pdev, list[i].size);
   340			if (!addr) {
   341				ret = -EINVAL;
   342				goto err;
   343			}
   344	
   345			size = 0;
   346			while (size < list[i].size) {
 > 347				page = virt_to_page((unsigned long)addr + size);
   348				ubuf->pages[pgbuf++] = page;
   349	
   350				size += PAGE_SIZE;
   351			}
   352		}
   353	
   354	err:
   355		while (pgbuf > 0 && ubuf->pages[--pgbuf])
   356			pci_free_p2pmem(pdev,
   357					page_to_virt(ubuf->pages[pgbuf]),
   358					PAGE_SIZE);
   359		if (pdev)
   360			pci_dev_put(pdev);
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
