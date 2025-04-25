Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1080D224B06
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582177; cv=none; b=uJMR41ps1LfNzb9e0wiJ6N7/GdvXQn7tjStSpro/sO5sDWzMA33eS8VSLqUJi5Zcj9C8USST+1z7LIAjEiD0fx3ZPILqC0BJbXc7Xy7KSb4j7lecnFVdzX8QLdkXvDcxBLsTaPwyxaECPo+dJo4xKCcjDPllL4VXd8UTZslw0BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582177; c=relaxed/simple;
	bh=Km7gYlGzHUUGUz4FLHnRrAQIIGhOmyI2hhpOsCtWCgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mXLArAJPxXK6bkKEco5TUVvA3GRBUiGidb5bP1fecGymNXDpGBPdE5tRPN21owAinnCrOBl21dPE2Mar/XnkMWTgbPDCIwmx7pymNRXssroqxuMeYDnejBC+Tsp/I4db8gPbr5mlRQ9rTxd6XeXuJmfl88U+RN/rYuyj9NhxTPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3eMwTpv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3eMwTpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745582175; x=1777118175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Km7gYlGzHUUGUz4FLHnRrAQIIGhOmyI2hhpOsCtWCgU=;
  b=B3eMwTpve6YIe+fJLPZamM+rGh/ms1YvagW8JMB+EyCvHAz7C/10iZTk
   yknA7HI6PMFh3Q7nY9DMQKJhb6r8wMN4aEgdfathMIB7JXGv3MAtNBjB7
   zV7Kq1k+GIuVxl61mo2ILynuPgtcGLNH9U2dX049WMWwlgOHehjGSlT+B
   SP6jE4px0rJPyeINPKtWlot6TbeaB/EqTA4KO7RZj//LKKIHlEwKa4bMZ
   tiMMxuxYaaDMytsZy5SAYslmVxwYUfCqD4QvniwIcLnEHxyGAmlCDhtSB
   vTk4F64aARLZcw96+t/U/HfFQyAp7js0wZR8fCOfYkzXqXafKR4citfF6
   A==;
X-CSE-ConnectionGUID: D5z4xbfrTeGu0r5v0JoQew==
X-CSE-MsgGUID: mGLYKgvfQl+nrPwullV42g==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51050961"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51050961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:56:11 -0700
X-CSE-ConnectionGUID: cadvoQIWR52jQZWs3rZ/tw==
X-CSE-MsgGUID: 8ayMI8WBSGav5ba+lt7P9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137881060"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Apr 2025 04:56:09 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Hf5-00058X-0c;
	Fri, 25 Apr 2025 11:56:07 +0000
Date: Fri, 25 Apr 2025 19:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.15-rc3+/cb-ptr 2/3] drivers/misc/lkdtm/bugs.c:498:37:
 warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier
 argument and not in the later argument
Message-ID: <202504251907.M830TlQ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.15-rc3+/cb-ptr
head:   342a3b133d248d5a5f71587958eb26bea9901814
commit: b48052c9e47a62f0baa55e728d0f83d90a900a07 [2/3] lkdtm/bugs: Add __counted_by_ptr test PTR_BOUNDS
config: arc-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251907.M830TlQ5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251907.M830TlQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251907.M830TlQ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from drivers/misc/lkdtm/bugs.c:9:
   drivers/misc/lkdtm/bugs.c: In function 'lkdtm_PTR_BOUNDS':
>> drivers/misc/lkdtm/bugs.c:498:37: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                                     ^
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/misc/lkdtm/bugs.c:498:23: note: in expansion of macro 'kcalloc'
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                       ^~~~~~~
   drivers/misc/lkdtm/bugs.c:498:37: note: earlier argument should specify number of elements, later size of each element
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                                     ^
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/misc/lkdtm/bugs.c:498:23: note: in expansion of macro 'kcalloc'
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                       ^~~~~~~
>> drivers/misc/lkdtm/bugs.c:498:37: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                                     ^
   include/linux/alloc_tag.h:231:24: note: in definition of macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/misc/lkdtm/bugs.c:498:23: note: in expansion of macro 'kcalloc'
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                       ^~~~~~~
   drivers/misc/lkdtm/bugs.c:498:37: note: earlier argument should specify number of elements, later size of each element
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                                     ^
   include/linux/alloc_tag.h:231:24: note: in definition of macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/misc/lkdtm/bugs.c:498:23: note: in expansion of macro 'kcalloc'
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                       ^~~~~~~
>> drivers/misc/lkdtm/bugs.c:498:37: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                                     ^
   include/linux/alloc_tag.h:234:24: note: in definition of macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/misc/lkdtm/bugs.c:498:23: note: in expansion of macro 'kcalloc'
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                       ^~~~~~~
   drivers/misc/lkdtm/bugs.c:498:37: note: earlier argument should specify number of elements, later size of each element
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                                     ^
   include/linux/alloc_tag.h:234:24: note: in definition of macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   drivers/misc/lkdtm/bugs.c:498:23: note: in expansion of macro 'kcalloc'
     498 |         inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
         |                       ^~~~~~~


vim +498 drivers/misc/lkdtm/bugs.c

   480	
   481	static void lkdtm_PTR_BOUNDS(void)
   482	{
   483		struct lkdtm_cb_ptr *inst;
   484	
   485		inst = kzalloc(sizeof(*inst), GFP_KERNEL);
   486		if (!inst) {
   487			pr_err("FAIL: could not allocate struct lkdtm_cb_ptr!\n");
   488			return;
   489		}
   490	
   491		inst->buf = kzalloc(fam_count, GFP_KERNEL);
   492		if (!inst->buf) {
   493			pr_err("FAIL: could not allocate inst->buf!\n");
   494			return;
   495		}
   496		inst->len = fam_count;
   497	
 > 498		inst->extra = kcalloc(sizeof(*inst->extra), fam_count * 2, GFP_KERNEL);
   499		inst->nr_extra = fam_count * 2;
   500	
   501		pr_info("Pointer access within bounds ...\n");
   502		inst->buf[0] = 'A';
   503		inst->buf[1] = 'B';
   504		inst->buf[2] = 'C';
   505		inst->buf[3] = 'D';
   506		inst->extra[fam_count].biggest = 0x1000;
   507	
   508		pr_info("Pointer access beyond bounds ...\n");
   509		check_ptr_len(inst, 4);
   510		//ignored = inst->buf[fam_count + 2];
   511		ignored = inst->extra[inst->nr_extra].b;
   512	
   513		kfree(inst->extra);
   514		kfree(inst->buf);
   515		kfree(inst);
   516	
   517		pr_err("FAIL: survived access of invalid pointer member offset!\n");
   518	
   519		if (!IS_ENABLED(CONFIG_CC_HAS_COUNTED_BY_PTR))
   520			pr_warn("This is expected since this %s was built with a compiler that does not support __counted_by_ptr\n",
   521				lkdtm_kernel_info);
   522		else if (IS_ENABLED(CONFIG_UBSAN_BOUNDS))
   523			pr_expected_config(CONFIG_UBSAN_TRAP);
   524		else
   525			pr_expected_config(CONFIG_UBSAN_BOUNDS);
   526	}
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
