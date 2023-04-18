Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B413923B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681814200; x=1713350200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=naAxpzabar+0uSK8Br/AnX5TBkcwuRZsWrfSXR9GEcg=;
  b=EUnh4jj63/hn7Copi887pev+4wNI7Qx8b2VchLhJckIe1NC+UHa6VIg6
   t2QoXppGGGrA1Krn6D2nhPXeC0zj5onUVOYqpuptYWTdebluVh8WOgVIr
   NQsTAVqiekgr7L5xC/h/hlr8ErnXBvGz+fzR5ERyWaKok5/28R4XYr9Zc
   /g7AZd3jItm/EUgN4sjy6hcs0/RJUehmc7jvxKR9vJU5vaGtFwjUwCTZ7
   RJXcNTQ+r6TO1DNI5pi3VYqWyJvz5OOtACfPb7cPWDJK/pruHv+VOvWRX
   ihmmtlyhAs6datGpWFkdroa5Ns1KEkjciPPJNFLzbGpJsQRqPI1+EJvrN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="346981392"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="346981392"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 03:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="865339939"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="865339939"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Apr 2023 03:36:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poihN-000dGe-1V;
	Tue, 18 Apr 2023 10:36:33 +0000
Date: Tue, 18 Apr 2023 18:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 12384/29414]
 drivers/staging/android/ion/ion_system_heap.c:292:5: warning: no previous
 prototype for 'ion_system_heap_create'
Message-ID: <202304181855.K0C5CHWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hridya,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   9b68392a2b5860995364db295d0d869b413fdfdf
commit: f64a8b79c0e85440319136ed928f22ed37481742 [12384/29414] ANDROID: staging: android: ion: enable modularizing the ion driver
config: i386-randconfig-a014-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181855.K0C5CHWG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout f64a8b79c0e85440319136ed928f22ed37481742
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/android/ion/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181855.K0C5CHWG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/ion/ion_system_heap.c:292:5: warning: no previous prototype for 'ion_system_heap_create' [-Wmissing-prototypes]
     292 | int ion_system_heap_create(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/android/ion/ion_system_heap.c:385:5: warning: no previous prototype for 'ion_system_contig_heap_create' [-Wmissing-prototypes]
     385 | int ion_system_contig_heap_create(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ion_system_heap_create +292 drivers/staging/android/ion/ion_system_heap.c

   291	
 > 292	int ion_system_heap_create(void)
   293	{
   294		struct ion_heap *heap;
   295	
   296		heap = __ion_system_heap_create();
   297		if (IS_ERR(heap))
   298			return PTR_ERR(heap);
   299		heap->name = "ion_system_heap";
   300	
   301		ion_device_add_heap(heap);
   302		return 0;
   303	}
   304	
   305	static int ion_system_contig_heap_allocate(struct ion_heap *heap,
   306						   struct ion_buffer *buffer,
   307						   unsigned long len,
   308						   unsigned long flags)
   309	{
   310		int order = get_order(len);
   311		struct page *page;
   312		struct sg_table *table;
   313		unsigned long i;
   314		int ret;
   315	
   316		page = alloc_pages(low_order_gfp_flags | __GFP_NOWARN, order);
   317		if (!page)
   318			return -ENOMEM;
   319	
   320		split_page(page, order);
   321	
   322		len = PAGE_ALIGN(len);
   323		for (i = len >> PAGE_SHIFT; i < (1 << order); i++)
   324			__free_page(page + i);
   325	
   326		table = kmalloc(sizeof(*table), GFP_KERNEL);
   327		if (!table) {
   328			ret = -ENOMEM;
   329			goto free_pages;
   330		}
   331	
   332		ret = sg_alloc_table(table, 1, GFP_KERNEL);
   333		if (ret)
   334			goto free_table;
   335	
   336		sg_set_page(table->sgl, page, len, 0);
   337	
   338		buffer->sg_table = table;
   339	
   340		return 0;
   341	
   342	free_table:
   343		kfree(table);
   344	free_pages:
   345		for (i = 0; i < len >> PAGE_SHIFT; i++)
   346			__free_page(page + i);
   347	
   348		return ret;
   349	}
   350	
   351	static void ion_system_contig_heap_free(struct ion_buffer *buffer)
   352	{
   353		struct sg_table *table = buffer->sg_table;
   354		struct page *page = sg_page(table->sgl);
   355		unsigned long pages = PAGE_ALIGN(buffer->size) >> PAGE_SHIFT;
   356		unsigned long i;
   357	
   358		for (i = 0; i < pages; i++)
   359			__free_page(page + i);
   360		sg_free_table(table);
   361		kfree(table);
   362	}
   363	
   364	static struct ion_heap_ops kmalloc_ops = {
   365		.allocate = ion_system_contig_heap_allocate,
   366		.free = ion_system_contig_heap_free,
   367		.map_kernel = ion_heap_map_kernel,
   368		.unmap_kernel = ion_heap_unmap_kernel,
   369		.map_user = ion_heap_map_user,
   370	};
   371	
   372	static struct ion_heap *__ion_system_contig_heap_create(void)
   373	{
   374		struct ion_heap *heap;
   375	
   376		heap = kzalloc(sizeof(*heap), GFP_KERNEL);
   377		if (!heap)
   378			return ERR_PTR(-ENOMEM);
   379		heap->ops = &kmalloc_ops;
   380		heap->type = ION_HEAP_TYPE_SYSTEM_CONTIG;
   381		heap->name = "ion_system_contig_heap";
   382		return heap;
   383	}
   384	
 > 385	int ion_system_contig_heap_create(void)
   386	{
   387		struct ion_heap *heap;
   388	
   389		heap = __ion_system_contig_heap_create();
   390		if (IS_ERR(heap))
   391			return PTR_ERR(heap);
   392	
   393		ion_device_add_heap(heap);
   394		return 0;
   395	}
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
