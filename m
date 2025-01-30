Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6322D8831
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 04:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212576; cv=none; b=bSwQExCJeqPGLSWDOnEki5Mw0JZRf+7+u9ZMOghy13F2ehRNu1deUaZN6hqhHNLXs5IsvsTEANS5Br8xkNogJLrZa8jIgrR3neOsktl5MeKMJRYeWZxYKfgNptfdY9eaL83QirEaOWswJp74GlDOwTxzI8nxoKYYn4tT+uuhiSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212576; c=relaxed/simple;
	bh=uPtUavT5g49OPxJSq9nEku4rivdvgQrr9cUxTyaaxM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWnye6GqawkBpKv8Z2bcfQ2h4pfq+3XoyoIV9LuZESdBL8BGpbbSskB0NFAWq4oAZiQ5YbTfdwmXw4o4fDPC/gSSBfRkninFQywIvs6ShnqER+RcPymBahwOu9NM/yjM/FZIrc2bNe20pkYI9hRB+xDt+78AmZILqUc9WVC28so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkbhnRT/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkbhnRT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738212574; x=1769748574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uPtUavT5g49OPxJSq9nEku4rivdvgQrr9cUxTyaaxM8=;
  b=PkbhnRT/iZodjuqF9ScmRs8vEfJUFNZmW5JbKrl2e4VZhiGXOpu0tRWv
   RM/HJ9soX0NZ0F9rgwi+HnfFGAp7HLVtfEdkqUZeMTfzP6RvVHabQG/Uy
   FvFbkNGebRwOn9Xr5gTX91NngcMG93vZv0iVVUrJx7Jsr12Y0XmmykFnI
   fgaMs1bhUi64iRByK7+5OAOKmGlJueGetXMg1Vd34BLHbEE4IB7E6hPAt
   9jiNT3qPwdnjUnKYc+jVlngtyoqrL87QXhPVYM/yih2C+/g+Fae3aono1
   iSkw2ANZ23Qx3gxkWjxIdCIjLpYWbvR3PAV7qf5vKD0kVyw+/mVX+rtRc
   w==;
X-CSE-ConnectionGUID: 4lbhgukiSCidDRCgRcS0rA==
X-CSE-MsgGUID: vgEFgbAmQMSZDWWlzTcGAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="39014015"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="39014015"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 20:49:34 -0800
X-CSE-ConnectionGUID: xtIbXk4pQ5Ww+0ro6htPGQ==
X-CSE-MsgGUID: ra2GyXFDRfiypDfY1TQA0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109783360"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jan 2025 20:49:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdMUc-000jfz-1y;
	Thu, 30 Jan 2025 04:49:30 +0000
Date: Thu, 30 Jan 2025 12:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pages 8/20] drivers/iommu/iommu-pages.h:30:54:
 error: invalid use of undefined type 'struct iommu_pages_list'
Message-ID: <202501301259.lIeXit3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pages
head:   b21a333dd68ad1bca44a6a4ff61c91a9d43fba3a
commit: 68f020177fc5b024a95372c15ec6f8f6f192e410 [8/20] iommu/pages: Formalize the freelist API
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20250130/202501301259.lIeXit3b-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301259.lIeXit3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301259.lIeXit3b-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-pages.c:6:
>> drivers/iommu/iommu-pages.h:14:38: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      14 | void iommu_put_pages_list_new(struct iommu_pages_list *list);
         |                                      ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h:27:48: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      27 | static inline void iommu_pages_list_add(struct iommu_pages_list *list,
         |                                                ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h: In function 'iommu_pages_list_add':
>> drivers/iommu/iommu-pages.h:30:54: error: invalid use of undefined type 'struct iommu_pages_list'
      30 |         list_add_tail(&virt_to_page(virt)->lru, &list->pages);
         |                                                      ^~
   drivers/iommu/iommu-pages.h: At top level:
   drivers/iommu/iommu-pages.h:41:51: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      41 | static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
         |                                                   ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h: In function 'iommu_pages_list_splice':
   drivers/iommu/iommu-pages.h:44:26: error: invalid use of undefined type 'struct iommu_pages_list'
      44 |         list_splice(&from->pages, &to->pages);
         |                          ^~
   drivers/iommu/iommu-pages.h:44:38: error: invalid use of undefined type 'struct iommu_pages_list'
      44 |         list_splice(&from->pages, &to->pages);
         |                                      ^~
   drivers/iommu/iommu-pages.h: At top level:
   drivers/iommu/iommu-pages.h:51:50: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      51 | static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h: In function 'iommu_pages_list_empty':
   drivers/iommu/iommu-pages.h:53:32: error: invalid use of undefined type 'struct iommu_pages_list'
      53 |         return list_empty(&list->pages);
         |                                ^~
   drivers/iommu/iommu-pages.c: At top level:
>> drivers/iommu/iommu-pages.c:75:38: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      75 | void iommu_put_pages_list_new(struct iommu_pages_list *list)
         |                                      ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.c:75:6: error: conflicting types for 'iommu_put_pages_list_new'; have 'void(struct iommu_pages_list *)'
      75 | void iommu_put_pages_list_new(struct iommu_pages_list *list)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h:14:6: note: previous declaration of 'iommu_put_pages_list_new' with type 'void(struct iommu_pages_list *)'
      14 | void iommu_put_pages_list_new(struct iommu_pages_list *list);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/scatterlist.h:8,
                    from include/linux/iommu.h:10,
                    from drivers/iommu/iommu-pages.h:10:
   drivers/iommu/iommu-pages.c: In function 'iommu_put_pages_list_new':
>> drivers/iommu/iommu-pages.c:79:47: error: invalid use of undefined type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                               ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:857:20: note: in expansion of macro 'list_first_entry'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.c:79:9: note: in expansion of macro 'list_for_each_entry_safe'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7:
>> drivers/iommu/iommu-pages.c:79:47: error: invalid use of undefined type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                               ^~
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
   include/linux/list.h:857:20: note: in expansion of macro 'list_first_entry'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.c:79:9: note: in expansion of macro 'list_for_each_entry_safe'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iommu-pages.c:79:47: error: invalid use of undefined type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                               ^~
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
   include/linux/list.h:857:20: note: in expansion of macro 'list_first_entry'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.c:79:9: note: in expansion of macro 'list_for_each_entry_safe'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:483:27: error: expression in static assertion is not an integer
     483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:857:20: note: in expansion of macro 'list_first_entry'
     857 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.c:79:9: note: in expansion of macro 'list_for_each_entry_safe'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iommu-pages.c:79:47: error: invalid use of undefined type 'struct iommu_pages_list'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |                                               ^~
   include/linux/list.h:761:37: note: in definition of macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/iommu/iommu-pages.c:79:9: note: in expansion of macro 'list_for_each_entry_safe'
      79 |         list_for_each_entry_safe(p, tmp, &list->pages, lru)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/alpha/include/asm/bug.h:5:
   drivers/iommu/iommu-pages.c: At top level:
   drivers/iommu/iommu-pages.c:82:19: error: conflicting types for 'iommu_put_pages_list_new'; have 'void(struct iommu_pages_list *)'
      82 | EXPORT_SYMBOL_GPL(iommu_put_pages_list_new);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.c:82:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      82 | EXPORT_SYMBOL_GPL(iommu_put_pages_list_new);
         | ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h:14:6: note: previous declaration of 'iommu_put_pages_list_new' with type 'void(struct iommu_pages_list *)'
      14 | void iommu_put_pages_list_new(struct iommu_pages_list *list);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +30 drivers/iommu/iommu-pages.h

    11	
    12	void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
    13	void iommu_free_page(void *virt);
  > 14	void iommu_put_pages_list_new(struct iommu_pages_list *list);
    15	void iommu_put_pages_list_old(struct list_head *head);
    16	
    17	#define iommu_put_pages_list(head)                                   \
    18		_Generic(head,                                               \
    19			struct iommu_pages_list *: iommu_put_pages_list_new, \
    20			struct list_head *: iommu_put_pages_list_old)(head)
    21	
    22	/**
    23	 * iommu_pages_list_add - add the page to a iommu_pages_list
    24	 * @list: List to add the page to
    25	 * @virt: Address returned from iommu_alloc_pages_node()
    26	 */
    27	static inline void iommu_pages_list_add(struct iommu_pages_list *list,
    28						void *virt)
    29	{
  > 30		list_add_tail(&virt_to_page(virt)->lru, &list->pages);
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
