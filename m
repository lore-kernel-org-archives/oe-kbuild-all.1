Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11513A267
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726983321; cv=none; b=LiLp+qLJPPazmhCtM77VqLXQOrMjUquwfkGfJG75TOg1tgtJ20B0GudPsVbnzYzsFsGO4J9ZXKe5lITIDVrcolwaMVKLw0BQMLobE92M58wYhvFvHOQZZLS6noYXfDW9Qf8d93xDogtuOttFenCUp761jh1tu6aWmm0L363CPUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726983321; c=relaxed/simple;
	bh=aluTR4IXljmSoVdHK4hmTlPOphK/ap0V9WHmu2e4mMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZ7/VnSJJ6h7ZeWSTZELAHUeZtQhuTTfzcNciyBZ2kD81QLVf1ymVSsuROjuf/xgPwcQQfuBIQntIrE85QM3Kr5b9KBarslDW9ro588prGGrLt9XDX+YX2mpMsrCokmlLZpGWZq4ViPoZvea0Pw7caGguIQnDQmJJu1Aci+yMBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FanDi3VJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FanDi3VJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726983319; x=1758519319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aluTR4IXljmSoVdHK4hmTlPOphK/ap0V9WHmu2e4mMA=;
  b=FanDi3VJhvb+w2I0YZMPhtBhU6SSuv0HXSukfDDObLDp/oEtuqY3qOv8
   KRYknaI9KiWhmV5bdGT3qXLVH/hVC/YCoWVUeFdgKfzwSmwxyU3vqowcH
   3xyBGtRfcnWRIQGHHFMGUkChM5KK4P4Ub7z//FAXvwBEKHmnytenMlonr
   pwYwLMeAHv8cgRo6fAUjobvdW6yUUvfJr7BeT7YxKtrbTL+QkJQQaS/i5
   79n8QVv+tjA+Mz9B0J2Ep6S/sdo1l9AUjtw6jBtCyY4ISCJrLRlno2TQT
   ERlq4DwKueWtIr7HQ2reVCrgmrYudrT1GAlkghEG1k+MDj/Wvn4SrzPwX
   Q==;
X-CSE-ConnectionGUID: zsyDvI1NRN6OSfRYcvDI5w==
X-CSE-MsgGUID: 1IX24XjoR+OXO2oXenN+uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25824588"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="25824588"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 22:35:18 -0700
X-CSE-ConnectionGUID: 0NXoWxQZT+GvCWOqBfSCkQ==
X-CSE-MsgGUID: V/kcg4kvRbiTXFUxyxYC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="70722549"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Sep 2024 22:35:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssFFa-000G3q-1t;
	Sun, 22 Sep 2024 05:35:14 +0000
Date: Sun, 22 Sep 2024 13:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 11353/16782]
 drivers/vhost/xen.c:291:37: error: 'struct vhost_virtqueue' has no member
 named 'desc_maps'
Message-ID: <202409221515.ElaCqD63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   d023c381fa6161a7af966abaad8e7d9a997f07e7
commit: 47126913dee809f495dd6de10dff6a8ba627d817 [11353/16782] LF-11837-1 vhost_xen: Implement Xen grant/foreign mappings module for vhost
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240922/202409221515.ElaCqD63-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409221515.ElaCqD63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409221515.ElaCqD63-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/vhost/xen.c:14:
   drivers/vhost/xen.c: In function 'vhost_xen_find_map':
>> drivers/vhost/xen.c:291:37: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |                                     ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/vhost/xen.c:291:9: note: in expansion of macro 'list_for_each_entry'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
>> drivers/vhost/xen.c:291:37: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |                                     ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/vhost/xen.c:291:9: note: in expansion of macro 'list_for_each_entry'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/vhost/xen.c:291:37: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |                                     ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/vhost/xen.c:291:9: note: in expansion of macro 'list_for_each_entry'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:373:27: error: expression in static assertion is not an integer
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/vhost/xen.c:291:9: note: in expansion of macro 'list_for_each_entry'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/vhost/xen.c:291:37: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |                                     ^~
   include/linux/list.h:761:27: note: in definition of macro 'list_entry_is_head'
     761 |         (&pos->member == (head))
         |                           ^~~~
   drivers/vhost/xen.c:291:9: note: in expansion of macro 'list_for_each_entry'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/vhost/xen.c: At top level:
>> drivers/vhost/xen.c:302:6: error: redefinition of 'vhost_xen_unmap_desc_all'
     302 | void vhost_xen_unmap_desc_all(struct vhost_virtqueue *vq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/vhost/xen.c:23:
   drivers/vhost/vhost.h:268:20: note: previous definition of 'vhost_xen_unmap_desc_all' with type 'void(struct vhost_virtqueue *)'
     268 | static inline void vhost_xen_unmap_desc_all(struct vhost_virtqueue *vq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/xen.c: In function 'vhost_xen_unmap_desc_all':
   drivers/vhost/xen.c:309:31: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     309 |         while (!list_empty(&vq->desc_maps)) {
         |                               ^~
   drivers/vhost/xen.c:310:36: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                                    ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/vhost/xen.c:310:23: note: in expansion of macro 'list_entry'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                       ^~~~~~~~~~
   drivers/vhost/xen.c:310:36: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                                    ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   drivers/vhost/xen.c:310:23: note: in expansion of macro 'list_entry'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                       ^~~~~~~~~~
   drivers/vhost/xen.c:310:36: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                                    ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   drivers/vhost/xen.c:310:23: note: in expansion of macro 'list_entry'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                       ^~~~~~~~~~
>> include/linux/compiler_types.h:373:27: error: expression in static assertion is not an integer
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   drivers/vhost/xen.c:310:23: note: in expansion of macro 'list_entry'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                       ^~~~~~~~~~
   drivers/vhost/xen.c: At top level:
>> drivers/vhost/xen.c:319:7: error: redefinition of 'vhost_xen_map_desc'
     319 | void *vhost_xen_map_desc(struct vhost_virtqueue *vq, u64 addr, u32 size,
         |       ^~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.h:269:21: note: previous definition of 'vhost_xen_map_desc' with type 'void *(struct vhost_virtqueue *, u64,  u32,  int)' {aka 'void *(struct vhost_virtqueue *, long long unsigned int,  unsigned int,  int)'}
     269 | static inline void *vhost_xen_map_desc(struct vhost_virtqueue *vq, u64 addr,
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/vhost/xen.c: In function 'vhost_xen_map_desc':
   drivers/vhost/xen.c:366:38: error: 'struct vhost_virtqueue' has no member named 'desc_maps'
     366 |         list_add_tail(&map->next, &vq->desc_maps);
         |                                      ^~
   drivers/vhost/xen.c: At top level:
>> drivers/vhost/xen.c:375:6: error: redefinition of 'vhost_xen_unmap_desc'
     375 | void vhost_xen_unmap_desc(struct vhost_virtqueue *vq, void *ptr, u32 size)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vhost.h:266:20: note: previous definition of 'vhost_xen_unmap_desc' with type 'void(struct vhost_virtqueue *, void *, u32)' {aka 'void(struct vhost_virtqueue *, void *, unsigned int)'}
     266 | static inline void vhost_xen_unmap_desc(struct vhost_virtqueue *vq, void *ptr,
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +291 drivers/vhost/xen.c

   285	
   286	static struct vhost_xen_map *vhost_xen_find_map(struct vhost_virtqueue *vq,
   287			unsigned long vaddr, int count)
   288	{
   289		struct vhost_xen_map *map;
   290	
 > 291		list_for_each_entry(map, &vq->desc_maps, next) {
   292			if (map->vaddr != vaddr)
   293				continue;
   294			if (count && map->count != count)
   295				continue;
   296			return map;
   297		}
   298	
   299		return NULL;
   300	}
   301	
 > 302	void vhost_xen_unmap_desc_all(struct vhost_virtqueue *vq)
   303	{
   304		struct vhost_xen_map *map;
   305	
   306		if (!xen_domain())
   307			return;
   308	
   309		while (!list_empty(&vq->desc_maps)) {
   310			map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
   311			list_del(&map->next);
   312	
   313			pr_debug("%s: dom%d: vaddr 0x%lx count %u\n",
   314					__func__, map->domid, map->vaddr, map->count);
   315			vhost_xen_put_map(map);
   316		}
   317	}
   318	
 > 319	void *vhost_xen_map_desc(struct vhost_virtqueue *vq, u64 addr, u32 size,
   320			int access)
   321	{
   322		struct vhost_xen_map *map;
   323		unsigned long offset = xen_offset_in_page(addr);
   324		int count = XEN_PFN_UP(offset + size);
   325		int ret;
   326	
   327		if (!xen_domain() || guest_domid == DOMID_INVALID)
   328			return ERR_PTR(-ENODEV);
   329	
   330		if ((nogrant && (addr & XEN_GRANT_DMA_ADDR_OFF)) ||
   331				(!nogrant && !(addr & XEN_GRANT_DMA_ADDR_OFF))) {
   332			pr_err("%s: Descriptor from dom%d cannot be mapped via Xen %s mappings (addr 0x%llx)\n",
   333					__func__, guest_domid, nogrant ? "foreign" : "grant", addr);
   334			return ERR_PTR(-EINVAL);
   335		}
   336	
   337		map = vhost_xen_ops->alloc_map(count);
   338		if (!map)
   339			return ERR_PTR(-ENOMEM);
   340	
   341		map->domid = guest_domid;
   342		ret = vhost_xen_ops->map_pages(map, addr, access == VHOST_ACCESS_RO);
   343		if (ret) {
   344			pr_err("%s: Failed to map pages from dom%d (ret=%d)\n",
   345					__func__, map->domid, ret);
   346			vhost_xen_ops->free_map(map);
   347			return ERR_PTR(ret);
   348		}
   349	
   350		/*
   351		 * Consider allocating xen_alloc_unpopulated_contiguous_pages() instead of
   352		 * xen_alloc_unpopulated_pages() to avoid mapping as with the later
   353		 * map->pages are not guaranteed to be contiguous.
   354		 */
   355		if (map->count > 1) {
   356			map->vaddr = (unsigned long)vmap(map->pages, map->count, VM_MAP,
   357					PAGE_KERNEL);
   358			if (!map->vaddr) {
   359				pr_err("%s: Failed to create virtual mappings\n", __func__);
   360				vhost_xen_put_map(map);
   361				return ERR_PTR(-ENOMEM);
   362			}
   363		} else
   364			map->vaddr = (unsigned long)pfn_to_kaddr(page_to_xen_pfn(map->pages[0]));
   365	
   366		list_add_tail(&map->next, &vq->desc_maps);
   367	
   368		pr_debug("%s: dom%d: addr 0x%llx size 0x%x (access 0x%x) -> vaddr 0x%lx count %u (paddr 0x%llx)\n",
   369				__func__, map->domid, addr, size, access, map->vaddr, map->count,
   370				page_to_phys(map->pages[0]));
   371	
   372		return (void *)(map->vaddr + offset);
   373	}
   374	
 > 375	void vhost_xen_unmap_desc(struct vhost_virtqueue *vq, void *ptr, u32 size)
   376	{
   377		struct vhost_xen_map *map;
   378		unsigned long offset = xen_offset_in_page(ptr);
   379		int count = XEN_PFN_UP(offset + size);
   380	
   381		if (!xen_domain())
   382			return;
   383	
   384		map = vhost_xen_find_map(vq, (unsigned long)ptr & XEN_PAGE_MASK, count);
   385		if (map) {
   386			list_del(&map->next);
   387	
   388			pr_debug("%s: dom%d: vaddr 0x%lx count %u\n",
   389					__func__, map->domid, map->vaddr, map->count);
   390			vhost_xen_put_map(map);
   391		}
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
