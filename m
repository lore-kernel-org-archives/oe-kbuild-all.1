Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018D624
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 02:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674440272; x=1705976272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/E+LiiDU/twtlYAskEYNh25Pz28Xur05ABSKXv3qRss=;
  b=Vimq2RMy0Q9xlA1cA6QO634/Jr57cz/lZmRWea9tfFYpL1nKW3GLPkqn
   gI+bh7YSzP//l/CdmHrrr1lRqoUKo02mxRwSj19z0c8j6qgWuG1yeqhey
   HSa3cKyKPkJTc9OKgbzDuMqQuS3jENdFw//svW0l0PCA7zyDetjE32JYV
   DvbFNzugH6cI7rTE1o8ApHFwDfnMlo8xl1DoX79+1/O/TB8IpMztb9P0k
   8FW5yGK/wkdiGOuzBRdtVGQpoJHgFsAy8hzPwkQ08DRbIQS/+H345VKm7
   WborqV2DbMXucrHBsVcFMUjM3i7iW/66tk+wYotEnCsf32ItCCsihrY00
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="309536566"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="309536566"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 18:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="730015253"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="730015253"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jan 2023 18:17:50 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJmP7-0005Mi-2M;
	Mon, 23 Jan 2023 02:17:49 +0000
Date: Mon, 23 Jan 2023 10:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-stable-rc:linux-4.14.y 2224/4044]
 include/linux/nodemask.h:371:13: error: comparison of unsigned expression >=
 0 is always true
Message-ID: <202301231026.yRe8RaLy-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   a6d71d85fd0f5c89a0e3aa52de437d22485dfa61
commit: 339aab239d54368580b9a03ceca009d83a00cfb7 [2224/4044] nodemask.h: fix compilation error with GCC12
config: alpha-randconfig-r006-20230123 (https://download.01.org/0day-ci/archive/20230123/202301231026.yRe8RaLy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=339aab239d54368580b9a03ceca009d83a00cfb7
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-4.14.y
        git checkout 339aab239d54368580b9a03ceca009d83a00cfb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:17:0,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/alpha/mm/numa.c:12:
   arch/alpha/mm/numa.c: In function 'paging_init':
>> include/linux/nodemask.h:371:13: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
          (node >= 0) && (node) < MAX_NUMNODES;      \
                ^
   include/linux/nodemask.h:424:2: note: in expansion of macro 'for_each_node_mask'
     for_each_node_mask((__node), node_states[__state])
     ^~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:504:36: note: in expansion of macro 'for_each_node_state'
    #define for_each_online_node(node) for_each_node_state(node, N_ONLINE)
                                       ^~~~~~~~~~~~~~~~~~~
   arch/alpha/mm/numa.c:305:2: note: in expansion of macro 'for_each_online_node'
     for_each_online_node(nid) {
     ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +371 include/linux/nodemask.h

   367	
   368	#if MAX_NUMNODES > 1
   369	#define for_each_node_mask(node, mask)				    \
   370		for ((node) = first_node(mask);				    \
 > 371		     (node >= 0) && (node) < MAX_NUMNODES;		    \
   372		     (node) = next_node((node), (mask)))
   373	#else /* MAX_NUMNODES == 1 */
   374	#define for_each_node_mask(node, mask)                                  \
   375		for ((node) = 0; (node) < 1 && !nodes_empty(mask); (node)++)
   376	#endif /* MAX_NUMNODES */
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
