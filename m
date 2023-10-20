Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DFC1D529
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXMN1Zsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697823690; x=1729359690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WefERlRalgMI23OQ1czMDkLo5refy/ZX8UQ9ypMfqOk=;
  b=mXMN1ZspfcfmdjrVlSBtpNeJXs6mRmhhUH6j5ZYwtZ9XqbDawDpckxUB
   16XDtdxvZRAwTBQMr5oqmINUGLgUnUfCCWQXAtcvxXQgYRnLyUzG0VWNR
   RgbTLRpZhRkOBG3JUFnkwlk66YcTh5ROTeQG1YthH5MnqcUEBcD6nnjth
   I67hy98G2DD9hOMi8fkhnIIvrxi6B0dQNKx5hQmRSQnC0ZGO+dFHKiDaK
   0dM5/2fwa/issBZdH6TQWfbLYmkHjTtvxVJPy2u2yg01xi31kkCVqYMNE
   92FcXUJ+H7OZEN50dz2Fos+jxxh+0IFDsk5fKf59IiXDKDG8f+spttEfk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="390428909"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="390428909"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 10:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="761125314"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="761125314"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Oct 2023 10:41:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qttUu-0003qI-1m;
	Fri, 20 Oct 2023 17:41:20 +0000
Date: Sat, 21 Oct 2023 01:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rongwei Wang <rongwei.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/5] mm/numa: migrate leftover numa emulation into
 mm/numa.c
Message-ID: <202310210126.OO9j7zDI-lkp@intel.com>
References: <20231012024842.99703-6-rongwei.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012024842.99703-6-rongwei.wang@linux.alibaba.com>

Hi Rongwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6-rc6]
[cannot apply to akpm-mm/mm-everything tip/x86/mm next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rongwei-Wang/mm-numa-move-numa-emulation-APIs-into-generic-files/20231017-143037
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231012024842.99703-6-rongwei.wang%40linux.alibaba.com
patch subject: [PATCH RFC 5/5] mm/numa: migrate leftover numa emulation into mm/numa.c
config: x86_64-buildonly-randconfig-005-20231020 (https://download.01.org/0day-ci/archive/20231021/202310210126.OO9j7zDI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210126.OO9j7zDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210126.OO9j7zDI-lkp@intel.com/

All errors (new ones prefixed by >>):

     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                          ^~~
   include/linux/minmax.h:37:9: error: first argument to '__builtin_choose_expr' not a constant
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/numa.c:554:20: note: in expansion of macro 'ALIGN'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                    ^~~~~
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:554:26: note: in expansion of macro 'max'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                          ^~~
   mm/numa.c:580:35: error: invalid use of undefined type 'struct numa_meminfo'
     580 |                         start = pi->blk[phys_blk].start;
         |                                   ^~
   mm/numa.c:581:35: error: invalid use of undefined type 'struct numa_meminfo'
     581 |                         limit = pi->blk[phys_blk].end;
         |                                   ^~
   mm/numa.c: At top level:
   mm/numa.c:669:13: warning: no previous prototype for 'numa_emulation' [-Wmissing-prototypes]
     669 | void __init numa_emulation(struct numa_meminfo *numa_meminfo, int numa_dist_cnt)
         |             ^~~~~~~~~~~~~~
   mm/numa.c: In function 'numa_emulation':
   mm/numa.c:671:36: error: storage size of 'ei' isn't known
     671 |         static struct numa_meminfo ei __initdata;
         |                                    ^~
   mm/numa.c:672:36: error: storage size of 'pi' isn't known
     672 |         static struct numa_meminfo pi __initdata;
         |                                    ^~
   include/linux/fortify-string.h:515:65: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     515 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                                 ^
   include/linux/fortify-string.h:524:25: note: in expansion of macro '__fortify_memset_chk'
     524 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   mm/numa.c:682:9: note: in expansion of macro 'memset'
     682 |         memset(&ei, 0, sizeof(ei));
         |         ^~~~~~
   mm/numa.c:683:14: error: invalid use of undefined type 'struct numa_meminfo'
     683 |         pi = *numa_meminfo;
         |              ^
   mm/numa.c:694:44: error: 'numa_nodes_parsed' undeclared (first use in this function); did you mean 'numa_node_id'?
     694 |                 nodemask_t physnode_mask = numa_nodes_parsed;
         |                                            ^~~~~~~~~~~~~~~~~
         |                                            numa_node_id
   mm/numa.c:769:23: error: invalid use of undefined type 'struct numa_meminfo'
     769 |         *numa_meminfo = ei;
         |                       ^
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:773:25: note: in expansion of macro 'ARRAY_SIZE'
     773 |         for (i = 0; i < ARRAY_SIZE(ei.blk); i++)
         |                         ^~~~~~~~~~
   mm/numa.c:784:36: error: '__apicid_to_node' undeclared (first use in this function); did you mean '__cpu_to_node'?
     784 |         for (i = 0; i < ARRAY_SIZE(__apicid_to_node); i++) {
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:33: note: in definition of macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:784:25: note: in expansion of macro 'ARRAY_SIZE'
     784 |         for (i = 0; i < ARRAY_SIZE(__apicid_to_node); i++) {
         |                         ^~~~~~~~~~
   mm/numa.c:800:9: error: implicit declaration of function 'numa_free_distance' [-Werror=implicit-function-declaration]
     800 |         numa_free_distance();
         |         ^~~~~~~~~~~~~~~~~~
   mm/numa.c:815:25: error: implicit declaration of function 'numa_set_distance'; did you mean 'node_distance'? [-Werror=implicit-function-declaration]
     815 |                         numa_set_distance(i, j, dist);
         |                         ^~~~~~~~~~~~~~~~~
         |                         node_distance
   mm/numa.c:672:36: warning: unused variable 'pi' [-Wunused-variable]
     672 |         static struct numa_meminfo pi __initdata;
         |                                    ^~
   mm/numa.c:671:36: warning: unused variable 'ei' [-Wunused-variable]
     671 |         static struct numa_meminfo ei __initdata;
         |                                    ^~
   mm/numa.c: In function 'numa_set_cpumask':
>> mm/numa.c:874:17: error: implicit declaration of function 'debug_cpumask_set_cpu'; did you mean 'cpumask_set_cpu'? [-Werror=implicit-function-declaration]
     874 |                 debug_cpumask_set_cpu(cpu, nid, enable);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 cpumask_set_cpu
   mm/numa.c: At top level:
   mm/numa.c:878:6: warning: no previous prototype for 'numa_add_cpu' [-Wmissing-prototypes]
     878 | void numa_add_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~
   mm/numa.c:883:6: warning: no previous prototype for 'numa_remove_cpu' [-Wmissing-prototypes]
     883 | void numa_remove_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~
   mm/numa.c:17:21: error: storage size of 'numa_meminfo' isn't known
      17 | struct numa_meminfo numa_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~
   mm/numa.c:18:21: error: storage size of 'numa_reserved_meminfo' isn't known
      18 | struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~~~~~~~~~~
   mm/numa.c:672:36: warning: 'pi' defined but not used [-Wunused-variable]
     672 |         static struct numa_meminfo pi __initdata;
         |                                    ^~
   mm/numa.c:671:36: warning: 'ei' defined but not used [-Wunused-variable]
     671 |         static struct numa_meminfo ei __initdata;
         |                                    ^~
   cc1: some warnings being treated as errors


vim +874 mm/numa.c

   849	
   850	void numa_remove_cpu(unsigned int cpu)
   851	{
   852		int i;
   853	
   854		for_each_online_node(i)
   855			cpumask_clear_cpu(cpu, node_to_cpumask_map[i]);
   856	}
   857	#else	/* !CONFIG_DEBUG_PER_CPU_MAPS */
   858	static void numa_set_cpumask(int cpu, bool enable)
   859	{
   860		int nid, physnid;
   861	
   862		nid = early_cpu_to_node(cpu);
   863		if (nid == NUMA_NO_NODE) {
   864			/* early_cpu_to_node() already emits a warning and trace */
   865			return;
   866		}
   867	
   868		physnid = emu_nid_to_phys[nid];
   869	
   870		for_each_online_node(nid) {
   871			if (emu_nid_to_phys[nid] != physnid)
   872				continue;
   873	
 > 874			debug_cpumask_set_cpu(cpu, nid, enable);
   875		}
   876	}
   877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
