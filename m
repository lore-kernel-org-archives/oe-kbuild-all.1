Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBAC1854
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 05:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691817847; x=1723353847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igfF6C0z7oy/zFOgGLYjAuYrVt0+21a/8DUd9qfmu6k=;
  b=Y9HWQKERHJzFRI4/B+eU80R3X1JgDeiqqdn8bWJNas6DgysBV10ny23i
   RMi5K9mAZ+WkSLC//9LfpPUqmKO5KQURCiXrvOTtTMplUnMmQgHovK6w7
   ccSibgI3o8uGlC1UBg0Mhscgu/bLNKJ0wKgTpppWqAj+T5vMXaEy70Bmx
   /yLO9Js80ZXYdfn0L/WFBBRh/Fzl2ReBmHpFCyoWkCaVLl476otBc7WSG
   8CTuvWhTruFKSrxxFrK251fgsbgHjQtikKNmM2MuyqDc20xe/i2poX/yP
   JnsFnu+SjPtPpgJJrC903URVSKaV6xPG68lKglsYe6PcgpHLVcVgvdvi3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369275334"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="369275334"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 22:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846994411"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="846994411"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 22:24:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUh6Y-0008HY-1m;
	Sat, 12 Aug 2023 05:24:02 +0000
Date: Sat, 12 Aug 2023 13:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.4.y 3985/9416] include/linux/nodemask.h:380:20:
 error: comparison of unsigned expression in '>= 0' is always true
Message-ID: <202308121349.5b4LeHk3-lkp@intel.com>
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
head:   4b4223f7d26d90087de52c8649e42ad8fff2e90a
commit: 73bdb2359dbc260364141c83dd1e1a5497f29d3d [3985/9416] nodemask.h: fix compilation error with GCC12
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230812/202308121349.5b4LeHk3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121349.5b4LeHk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121349.5b4LeHk3-lkp@intel.com/

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
