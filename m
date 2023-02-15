Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8117C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 03:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676430995; x=1707966995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qN9JNqvO8efDhHVxxvUM6UWhSYbcjd/gf/y/wf4dMOI=;
  b=XQRmzdcOPVnVUWb7Y1xnpktTVlwii3ZeguKJD07s77pEwZKvh09MkV6q
   P+iyjYU+R57VOgPgy9r+4GXWdKtdEBwPAygVMPi6Qlbfzn/cAYwLhsIOp
   hq5yqxG0A2ky2UAu9DAhbiARbWURz6wU93IZqnFRHt837LkWZ91tsM5j0
   y/7V1mmQhG2ovv4W86a271k4FpOxhbRDPsBI+oo2V2K769F5JBs/KYeP3
   SRhkit2dw1biooLDOwjXt5Vmv7MBCN6KaIOXmFmPinaKTOD1dkwBAIfHD
   ms+XtF3NrWdu6SHfwbz7kobWpNY8Ftbx9Cq/kobY4poA5c0pt6A1q0+d4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="358750927"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="358750927"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 19:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="662776464"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="662776464"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Feb 2023 19:16:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS8HV-0008yf-2C;
	Wed, 15 Feb 2023 03:16:29 +0000
Date: Wed, 15 Feb 2023 11:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Shi <shy828301@gmail.com>, mgorman@techsingularity.net,
	agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com,
	akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH 3/5] mm: mempool: introduce page bulk allocator
Message-ID: <202302151051.i9q3I0ia-lkp@intel.com>
References: <20230214190221.1156876-4-shy828301@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214190221.1156876-4-shy828301@gmail.com>

Hi Yang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc8 next-20230214]
[cannot apply to device-mapper-dm/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/mm-page_alloc-add-API-for-bulk-allocator-with-callback/20230215-030305
patch link:    https://lore.kernel.org/r/20230214190221.1156876-4-shy828301%40gmail.com
patch subject: [v2 PATCH 3/5] mm: mempool: introduce page bulk allocator
config: loongarch-randconfig-r006-20230212 (https://download.01.org/0day-ci/archive/20230215/202302151051.i9q3I0ia-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ecf5ea78b27092c35d884fad653f53d599d9ddba
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yang-Shi/mm-page_alloc-add-API-for-bulk-allocator-with-callback/20230215-030305
        git checkout ecf5ea78b27092c35d884fad653f53d599d9ddba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/scsi/snic/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151051.i9q3I0ia-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/snic/snic_scsi.c:4:
>> include/linux/mempool.h:18:48: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      18 |                                         struct page **page_array,
         |                                                ^~~~
   include/linux/mempool.h:71:51: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      71 |                                            struct page **page_array);
         |                                                   ^~~~
   include/linux/mempool.h:74:59: warning: 'struct page' declared inside parameter list will not be visible outside of this definition or declaration
      74 |                                         void (*cb)(struct page *, void *),
         |                                                           ^~~~


vim +18 include/linux/mempool.h

    15	
    16	typedef unsigned int (mempool_alloc_pages_bulk_t)(gfp_t gfp_mask,
    17						unsigned int nr, void *pool_data,
  > 18						struct page **page_array,
    19						void (*cb)(struct page *, void *),
    20						void *data);
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
