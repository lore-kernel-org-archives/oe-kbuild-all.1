Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41BB154A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688131530; x=1719667530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EhK7Z5kaBRav8Bh/7ziArQlq90doEU+iEWv8QOSvRT8=;
  b=UeLHHrxwjlm/dJASHOo45Wmp6VRmLYIm9eA00GDEkC7biHmuVwQa3IW4
   0rPERx7xU0eKXKQhZxtd7U9OK+CFH13T3l5jgSQaoZ1eW4RyzJCA9wzkc
   eRHR9jztXl/AgTXyBoIJNmMslmhQ4NfY6wkcxOZyYiVTWq+avG7eyBo03
   hCqQYzdhOC3/8SkK63S/GsgWjpgoKZDARRBvKZNmF+cEgdfPU9chJkR3Q
   yFninU5n0MqhyhyJpinHnDl2sJlIK38U2Uiitno4VyFMI7rIC0wpEIgJE
   Adm1Kts7oukUkZBsiakVPPCuTiABexqPo9O5GMLhxYnMYM4XYJ2O1UEiR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="362434879"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="362434879"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="841869831"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="841869831"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Jun 2023 06:25:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFE7q-000EzJ-2X;
	Fri, 30 Jun 2023 13:25:26 +0000
Date: Fri, 30 Jun 2023 21:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.4.y 3985/8912] include/linux/nodemask.h:380:20:
 error: comparison of unsigned expression in '>= 0' is always true
Message-ID: <202306302106.Oz56NPoy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   b30db4f7e45f3c17cca2ba5be6f22762837a6e34
commit: 73bdb2359dbc260364141c83dd1e1a5497f29d3d [3985/8912] nodemask.h: fix compilation error with GCC12
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230630/202306302106.Oz56NPoy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302106.Oz56NPoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302106.Oz56NPoy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/alpha/mm/numa.c:12:
   arch/alpha/mm/numa.c: In function 'paging_init':
>> include/linux/nodemask.h:380:20: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
     380 |              (node >= 0) && (node) < MAX_NUMNODES;                  \
         |                    ^~
   include/linux/nodemask.h:433:9: note: in expansion of macro 'for_each_node_mask'
     433 |         for_each_node_mask((__node), node_states[__state])
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:513:36: note: in expansion of macro 'for_each_node_state'
     513 | #define for_each_online_node(node) for_each_node_state(node, N_ONLINE)
         |                                    ^~~~~~~~~~~~~~~~~~~
   arch/alpha/mm/numa.c:218:9: note: in expansion of macro 'for_each_online_node'
     218 |         for_each_online_node(nid) {
         |         ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +380 include/linux/nodemask.h

   376	
   377	#if MAX_NUMNODES > 1
   378	#define for_each_node_mask(node, mask)				    \
   379		for ((node) = first_node(mask);				    \
 > 380		     (node >= 0) && (node) < MAX_NUMNODES;		    \
   381		     (node) = next_node((node), (mask)))
   382	#else /* MAX_NUMNODES == 1 */
   383	#define for_each_node_mask(node, mask)                                  \
   384		for ((node) = 0; (node) < 1 && !nodes_empty(mask); (node)++)
   385	#endif /* MAX_NUMNODES */
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
