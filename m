Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6729414D2B1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727517552; cv=none; b=WxVVTfWT0FuhskGF3IJNsU0bQ0YQ13ZYOHPSoZW3Y/ZXY8ZbM0XeHfNee3u+In6JMS5iuENv0dO2181H5N9Qr0IapXixbfvZcI0dVSJKkbNVuJogpSaC2xL5BbnW/8KgBiiHkEdVZfitZujx8ZJy9uSfjdmQTI2Ksyq1Kj1ukio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727517552; c=relaxed/simple;
	bh=UJCqTd26hbuLiy2OU69ic6xB/fdQ//NEVnBYUcg7mtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Twyn/Ikq3qlTR2bqD8eLmzPAjYaVWHbb1v6EJZaGTwdguLCj7tOEY4LZepAlZVDqXiv4I1KV/lK2ZI5s+7kCrazMlYgpx+aLLjK2L6ywk8Mf+ftrK3xBnoAGIX21IZSiyt5MR5qmeF92f4S4x4PmWMZs8OP/kmSPLKwGhOJJctc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cont4x3P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cont4x3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727517550; x=1759053550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJCqTd26hbuLiy2OU69ic6xB/fdQ//NEVnBYUcg7mtU=;
  b=cont4x3PYpnF6Lx8+KzowuYIkzlrlRHgM71yzKP5UdXEClLLv8YBDCKY
   IR4ovMKh0No3Rwv92bcqswb7t94mlne4LZHoQFMt5UtxC3JbT0qbFCvCj
   8S5AKPW4NZ6GS+AnYlrsjI1xtJBxHJJajSZDHZJLicqfe6+Am7Rz2KOlM
   VhivYSNVWTLn9KFQ5fmQs0rEmWjSYVn6lArP0PaqVJq9EOLjsH+ueAJb7
   eh5ujsiiUmHYrgbDbgbGjtCA3nhgaoweLa54sz7KoulY7YooS7Y6bIfU1
   ylGdF4TcVhhpvYRrv3mx9hjNMxTqXUCzv/BcrbMv/tv/mhx0MR8UrzCAS
   w==;
X-CSE-ConnectionGUID: kicXxsSQTmiMhN+Vt3vONA==
X-CSE-MsgGUID: ErlVOBe6R3OPfIKzByJncw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37335739"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37335739"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 02:59:09 -0700
X-CSE-ConnectionGUID: l7hP0As5QrOKfkfJucBsPw==
X-CSE-MsgGUID: Vhb5+t82ToWVzynz9pswMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77601959"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2024 02:59:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUED-000N7L-2m;
	Sat, 28 Sep 2024 09:59:05 +0000
Date: Sat, 28 Sep 2024 17:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 11353/16788]
 drivers/vhost/xen.c:291:32: error: no member named 'desc_maps' in 'struct
 vhost_virtqueue'
Message-ID: <202409281754.GgH1Ilzr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 47126913dee809f495dd6de10dff6a8ba627d817 [11353/16788] LF-11837-1 vhost_xen: Implement Xen grant/foreign mappings module for vhost
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240928/202409281754.GgH1Ilzr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281754.GgH1Ilzr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281754.GgH1Ilzr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vhost/xen.c:291:32: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |                                   ~~  ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
>> drivers/vhost/xen.c:291:32: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |                                   ~~  ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/vhost/xen.c:291:32: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |                                   ~~  ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/vhost/xen.c:291:32: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     291 |         list_for_each_entry(map, &vq->desc_maps, next) {
         |                                   ~~  ^
   include/linux/list.h:771:32: note: expanded from macro 'list_for_each_entry'
     771 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:761:20: note: expanded from macro 'list_entry_is_head'
     761 |         (&pos->member == (head))
         |                           ^~~~
   drivers/vhost/xen.c:302:6: error: redefinition of 'vhost_xen_unmap_desc_all'
     302 | void vhost_xen_unmap_desc_all(struct vhost_virtqueue *vq)
         |      ^
   drivers/vhost/vhost.h:268:20: note: previous definition is here
     268 | static inline void vhost_xen_unmap_desc_all(struct vhost_virtqueue *vq) {}
         |                    ^
   drivers/vhost/xen.c:309:26: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     309 |         while (!list_empty(&vq->desc_maps)) {
         |                             ~~  ^
   drivers/vhost/xen.c:310:24: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                                  ~~  ^
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/vhost/xen.c:310:24: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                                  ~~  ^
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:20:30: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                     ^~~
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/vhost/xen.c:310:24: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     310 |                 map = list_entry(vq->desc_maps.next, struct vhost_xen_map, next);
         |                                  ~~  ^
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:21:23: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/vhost/xen.c:319:7: error: redefinition of 'vhost_xen_map_desc'
     319 | void *vhost_xen_map_desc(struct vhost_virtqueue *vq, u64 addr, u32 size,
         |       ^
   drivers/vhost/vhost.h:269:21: note: previous definition is here
     269 | static inline void *vhost_xen_map_desc(struct vhost_virtqueue *vq, u64 addr,
         |                     ^
   drivers/vhost/xen.c:366:33: error: no member named 'desc_maps' in 'struct vhost_virtqueue'
     366 |         list_add_tail(&map->next, &vq->desc_maps);
         |                                    ~~  ^
   drivers/vhost/xen.c:375:6: error: redefinition of 'vhost_xen_unmap_desc'
     375 | void vhost_xen_unmap_desc(struct vhost_virtqueue *vq, void *ptr, u32 size)
         |      ^
   drivers/vhost/vhost.h:266:20: note: previous definition is here
     266 | static inline void vhost_xen_unmap_desc(struct vhost_virtqueue *vq, void *ptr,
         |                    ^
   12 errors generated.


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
