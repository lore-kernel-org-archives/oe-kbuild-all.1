Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E6B46522
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ij8/uW99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703698190; x=1735234190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ToKkSrsMuMKq2b6q5OGCvBDj9FgTV5VEfB82kPjvRfE=;
  b=ij8/uW99DF2S2WnlvqSjrH4X+gmmTECwAZuYjGz0RokrmbrY+v1PsMly
   DZcQZ5MIQWDrZT6HFWAV/n823zaS5BgbHH6T+xujXS4Q9yjuA0zf/AdVg
   ffAA2KQcMwvIkTJkR6S+GAVmnq35BVxPeYHl78BQnxKWxdWIKAK/f4J5v
   vm1SoW62UNSRXCd6aaganILlbpUJhf+KhqUqzh8GSaAtu7bqJlL217ssV
   zZTz5R+avLdWd/Dwcn88sP+VjLkQQx/8Lk0TKLxIGN3Ec16PJe7xIZ87V
   6wNyy4PERKnD0wtd+KhqZesDVBltI0M7vRP/h4Imxf4DEV3SEjfUNKbQV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="427639018"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="427639018"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 09:29:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="807203635"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="807203635"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Dec 2023 09:29:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIXiz-000Fbn-15;
	Wed, 27 Dec 2023 17:29:45 +0000
Date: Thu, 28 Dec 2023 01:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	kaixuxiakx <60962168+kaixuxiakx@users.noreply.github.com>,
	Ethan Zhao <Haifeng.Zhao@intel.com>
Subject: include/linux/instrumentation.h:8: warning: "instrumentation_begin"
 redefined
Message-ID: <202312280126.aPZxuRsG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 6d928aeddfbb696e0e6ba46c43e48b3007bde5c6 compiler.h: Move instrumentation_begin()/end() to new <linux/instrumentation.h> header
date:   2 years, 4 months ago
config: x86_64-buildonly-randconfig-003-20231228 (https://download.01.org/0day-ci/archive/20231228/202312280126.aPZxuRsG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312280126.aPZxuRsG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312280126.aPZxuRsG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:250,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:20,
                    from include/linux/uuid.h:12,
                    from include/linux/mod_devicetable.h:13,
                    from scripts/mod/devicetable-offsets.c:3:
>> include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/string.h:6:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:84,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/linux/compiler.h:139: warning: "instrumentation_begin" redefined
     139 | #define instrumentation_begin() ({                                      \
         | 
   In file included from arch/x86/include/asm/bug.h:6:
   include/linux/instrumentation.h:8: note: this is the location of the previous definition
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/crypto.h:18,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from arch/x86/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/linux/crypto.h:15:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/rbtree.h:22,
                    from include/linux/mm_types.h:10,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:19:
   include/linux/rbtree.h: In function 'rb_link_node_rcu':
   include/linux/rcupdate.h:379:9: error: implicit declaration of function 'rcu_dereference_sparse'; did you mean 'rcu_dereference_raw'? [-Werror=implicit-function-declaration]
     379 |         rcu_dereference_sparse(p, __rcu); \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/rbtree.h:84:9: note: in expansion of macro 'rcu_assign_pointer'
      84 |         rcu_assign_pointer(*rb_link, node);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rbtree.h:84:9: note: in expansion of macro 'rcu_assign_pointer'
      84 |         rcu_assign_pointer(*rb_link, node);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rbtree.h:84:9: note: in expansion of macro 'rcu_assign_pointer'
      84 |         rcu_assign_pointer(*rb_link, node);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function '__list_add_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:75:9: note: in expansion of macro 'rcu_assign_pointer'
      75 |         rcu_assign_pointer(list_next_rcu(prev), new);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:75:9: note: in expansion of macro 'rcu_assign_pointer'
      75 |         rcu_assign_pointer(list_next_rcu(prev), new);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function 'list_replace_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:193:9: note: in expansion of macro 'rcu_assign_pointer'
     193 |         rcu_assign_pointer(list_next_rcu(new->prev), new);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:193:9: note: in expansion of macro 'rcu_assign_pointer'
     193 |         rcu_assign_pointer(list_next_rcu(new->prev), new);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function '__list_splice_init_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:251:9: note: in expansion of macro 'rcu_assign_pointer'
     251 |         rcu_assign_pointer(list_next_rcu(prev), first);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:251:9: note: in expansion of macro 'rcu_assign_pointer'
     251 |         rcu_assign_pointer(list_next_rcu(prev), first);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function 'hlist_replace_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:493:9: note: in expansion of macro 'rcu_assign_pointer'
     493 |         rcu_assign_pointer(*(struct hlist_node __rcu **)new->pprev, new);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:493:9: note: in expansion of macro 'rcu_assign_pointer'
     493 |         rcu_assign_pointer(*(struct hlist_node __rcu **)new->pprev, new);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function 'hlist_add_head_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token
     379 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:532:9: note: in expansion of macro 'rcu_assign_pointer'
     532 |         rcu_assign_pointer(hlist_first_rcu(h), n);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:380:40: error: expected expression before ')' token
     380 |         rcu_dereference_sparse(p, __rcu); \
         |                                        ^
   include/linux/rculist.h:532:9: note: in expansion of macro 'rcu_assign_pointer'
     532 |         rcu_assign_pointer(hlist_first_rcu(h), n);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/rculist.h: In function 'hlist_add_tail_rcu':
   include/linux/rcupdate.h:379:40: error: expected expression before ')' token


vim +/instrumentation_begin +8 include/linux/instrumentation.h

     6	
     7	/* Begin/end of an instrumentation safe region */
   > 8	#define instrumentation_begin() ({					\
     9		asm volatile("%c0: nop\n\t"						\
    10			     ".pushsection .discard.instr_begin\n\t"		\
    11			     ".long %c0b - .\n\t"				\
    12			     ".popsection\n\t" : : "i" (__COUNTER__));		\
    13	})
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
