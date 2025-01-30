Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ACC1922FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 05:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738216308; cv=none; b=Z2iQFDP/rgfnldpH9E53yl+FT1V2KDUx2wntHcxkeWeYJJQ65oujMc1/gCj7vmeNiNs7JqC9LG1NtkUt5mDoIsLGzktwBqA7Ii8VWpt9AWj2YHCSlGLo4eG/tvOP/bRVuXUoG8LqDdIipsbHeWNPOeDIY3jYLRj3TtIiQgxiY0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738216308; c=relaxed/simple;
	bh=UI34CuFME/nCB3EidY8kwcQI9L6GTw8zcaIuQCztvyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8s58NYegbL9TqqU3xHD7W8fTktRCxw0iJrDN+MeDs9yM9VXpUwYHR81AtQ8ygjTGfXXPSZa+jUyoSMfl4EkL30JJMcct4CXMDpxrL75RRZVevf1obqSNri1fKHRJHwdsUZ0nUZ2/uLuP/XojVRZs+fQk48+5WAkjvjON2kbq9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afwbZDR6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afwbZDR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738216307; x=1769752307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UI34CuFME/nCB3EidY8kwcQI9L6GTw8zcaIuQCztvyU=;
  b=afwbZDR6pFRXgwg1vQMeCwoZqtwNEM+cfhDLeoTgTmV2EOwwV4dRULCG
   xjENLJuz5fpoBURg+omkxgcIMu9XHQB4PH7VqIMNSGOE29cPSRqJ3YJcY
   cSY1e230e++/fHdXH5GcyMs6oAT56MgjjmcXyynbkfr7qfju6RKIZq6g+
   LgcB6G2/TdOWHZEzZnthmUZxyhI35SvhO/XMD3hhEuL/m0VlTQIWKim8O
   1nRt4dTyUB2LP9zrJ6HGflgfUa8a4eN5klArG8yLFMamZvpPPsU3YkQbh
   hepcjDqvgjh0q7W/oHF3eIshIaAAuAXaz6+Elyu2Sj/eBuuOfNNCUxYy/
   w==;
X-CSE-ConnectionGUID: vuEXmoLiSSSUp9GjnaDC1g==
X-CSE-MsgGUID: ZXGyB7QXQVaw4PDxTxF4bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50169674"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50169674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 21:51:40 -0800
X-CSE-ConnectionGUID: U10I+M9nSPisfiFwMszffg==
X-CSE-MsgGUID: PhOmsvaUTla7yaFihkY4Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132502976"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jan 2025 21:51:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNSi-000jin-1P;
	Thu, 30 Jan 2025 05:51:36 +0000
Date: Thu, 30 Jan 2025 13:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pages 12/20] drivers/iommu/iommu-pages.c:75:6:
 error: conflicting types for 'iommu_put_pages_list'; have 'void(struct
 iommu_pages_list *)'
Message-ID: <202501301324.cLYxqbIa-lkp@intel.com>
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
commit: 828ed1aedcab6ea687a2a6c81e5fb2b6f01328da [12/20] iommu/pages: Remove iommu_put_pages_list_old and the _Generic
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20250130/202501301324.cLYxqbIa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301324.cLYxqbIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301324.cLYxqbIa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-pages.c:6:
   drivers/iommu/iommu-pages.h:14:34: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      14 | void iommu_put_pages_list(struct iommu_pages_list *list);
         |                                  ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h:21:48: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      21 | static inline void iommu_pages_list_add(struct iommu_pages_list *list,
         |                                                ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h: In function 'iommu_pages_list_add':
   drivers/iommu/iommu-pages.h:24:54: error: invalid use of undefined type 'struct iommu_pages_list'
      24 |         list_add_tail(&virt_to_page(virt)->lru, &list->pages);
         |                                                      ^~
   drivers/iommu/iommu-pages.h: At top level:
   drivers/iommu/iommu-pages.h:35:51: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      35 | static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
         |                                                   ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h: In function 'iommu_pages_list_splice':
   drivers/iommu/iommu-pages.h:38:26: error: invalid use of undefined type 'struct iommu_pages_list'
      38 |         list_splice(&from->pages, &to->pages);
         |                          ^~
   drivers/iommu/iommu-pages.h:38:38: error: invalid use of undefined type 'struct iommu_pages_list'
      38 |         list_splice(&from->pages, &to->pages);
         |                                      ^~
   drivers/iommu/iommu-pages.h: At top level:
   drivers/iommu/iommu-pages.h:45:50: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      45 | static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h: In function 'iommu_pages_list_empty':
   drivers/iommu/iommu-pages.h:47:32: error: invalid use of undefined type 'struct iommu_pages_list'
      47 |         return list_empty(&list->pages);
         |                                ^~
   drivers/iommu/iommu-pages.c: At top level:
   drivers/iommu/iommu-pages.c:75:34: warning: 'struct iommu_pages_list' declared inside parameter list will not be visible outside of this definition or declaration
      75 | void iommu_put_pages_list(struct iommu_pages_list *list)
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/iommu/iommu-pages.c:75:6: error: conflicting types for 'iommu_put_pages_list'; have 'void(struct iommu_pages_list *)'
      75 | void iommu_put_pages_list(struct iommu_pages_list *list)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-pages.h:14:6: note: previous declaration of 'iommu_put_pages_list' with type 'void(struct iommu_pages_list *)'
      14 | void iommu_put_pages_list(struct iommu_pages_list *list);
         |      ^~~~~~~~~~~~~~~~~~~~
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
   drivers/iommu/iommu-pages.c: In function 'iommu_put_pages_list':
   drivers/iommu/iommu-pages.c:79:47: error: invalid use of undefined type 'struct iommu_pages_list'
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
   drivers/iommu/iommu-pages.c:79:47: error: invalid use of undefined type 'struct iommu_pages_list'
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
   drivers/iommu/iommu-pages.c:79:47: error: invalid use of undefined type 'struct iommu_pages_list'
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


vim +75 drivers/iommu/iommu-pages.c

    68	
    69	/**
    70	 * iommu_put_pages_list - free a list of pages.
    71	 * @list: The list of pages to be freed
    72	 *
    73	 * Frees a list of pages allocated by iommu_alloc_pages_node().
    74	 */
  > 75	void iommu_put_pages_list(struct iommu_pages_list *list)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
