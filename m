Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A8DBD0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 19:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676575238; x=1708111238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jL3uLMV/4PT70xUbRaVDHRz4MtpguV2kB5CpYrLt/Uc=;
  b=IXsGHq8al5oZKuLdMpioZ2/vYRqwmXhjAwq+RE6fPVjs4HEpgmFe+cwy
   d6y+lePfQCkzDacdkbA7xEdgXA7bCgnmXaEIrjsynd5HbESRR8CJmEmnr
   IllnvDmVEBoNkkoLJm8F0P1V0fZmvKMFqBMk92t59Wrw8ErC/cIRglitU
   MOCGJFezc2OHumVKFHRFMyQuSVW5yAR0hjSqwZ1eGbun/i46BnHEvyCke
   bNo8ZeahSIECwq1q/B/XVFFRoW0fYIxWdA1xASvBysVvmX5dmRxDPfIlk
   RlKHC2Qh4xO+U6jUVGPqB38nrNlGl9IxUczx4Cg0TBnpNjIIDhWatfnt8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="319911052"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="319911052"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 11:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="794165314"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="794165314"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2023 11:20:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSjo3-000ASf-0M;
	Thu, 16 Feb 2023 19:20:35 +0000
Date: Fri, 17 Feb 2023 03:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] mm: add zero_user_folio_segments()
Message-ID: <202302170306.e1RoAdR7-lkp@intel.com>
References: <20230216160528.2146188-3-fengwei.yin@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216160528.2146188-3-fengwei.yin@intel.com>

Hi Yin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc8 next-20230216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yin-Fengwei/mm-remove-duplicated-flush_dcache_folio/20230217-004045
patch link:    https://lore.kernel.org/r/20230216160528.2146188-3-fengwei.yin%40intel.com
patch subject: [RFC PATCH 2/2] mm: add zero_user_folio_segments()
config: arc-randconfig-r024-20230215 (https://download.01.org/0day-ci/archive/20230217/202302170306.e1RoAdR7-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/24ce10c4a39cf847063c9d8ea4157882f13d7143
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yin-Fengwei/mm-remove-duplicated-flush_dcache_folio/20230217-004045
        git checkout 24ce10c4a39cf847063c9d8ea4157882f13d7143
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170306.e1RoAdR7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arceb-elf-ld: mm/shmem.o: in function `shmem_writepage':
>> shmem.c:(.text+0x24d8): undefined reference to `zero_user_folio_segments'
>> arceb-elf-ld: shmem.c:(.text+0x24d8): undefined reference to `zero_user_folio_segments'
   arceb-elf-ld: mm/shmem.o: in function `shmem_get_folio_gfp.constprop.0':
   shmem.c:(.text+0x2f4e): undefined reference to `zero_user_folio_segments'
   arceb-elf-ld: shmem.c:(.text+0x2f4e): undefined reference to `zero_user_folio_segments'
   arceb-elf-ld: fs/buffer.o: in function `block_read_full_folio':
>> buffer.c:(.text+0x3bee): undefined reference to `zero_user_folio_segments'
   arceb-elf-ld: fs/buffer.o:buffer.c:(.text+0x3bee): more undefined references to `zero_user_folio_segments' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
