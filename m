Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39106195
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 02:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677206076; x=1708742076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0LLT2tOg7XUME3QHAj4I3PyaFQXl9F6QDWLKiLPyA34=;
  b=iubz8NGlqHqL0UHmnIsjiXHucw02+kl08w+d6hbCGsi3zmN8IKY9pxkF
   0AZeQQqxKNh/SwH3N95w7W9pP7mlTPV5KIdEesSeQ/++aaQbb+vtAm5NV
   0SSPUW8hmtWOkcPhNIAbRODztt+F+SlK6x/h9mkcULGvXSMoQQdp8OY5I
   p0ImbZbloJ+hxzvHcwn7baEwTX+JBYZW0eGijgYAQn++3uzEJRNM7GqDf
   gswRiqt19988OJhULhb5GLdBF12JWl2tY+lFEGhgGkeGUzjRGWeIDkaIY
   /xm29gcTka3aYc1DNGYYS5gE4yl1bKC2CeyylKcrsqB9sgoj08LN6CYJw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332068253"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="332068253"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 18:34:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="622568023"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="622568023"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2023 18:34:34 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVNur-00023T-1H;
	Fri, 24 Feb 2023 02:34:33 +0000
Date: Fri, 24 Feb 2023 10:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:parallel-6.2-rc8-part1 9/12]
 arch/x86/include/asm/processor.h:654:53: error: 'PTREGS_SIZE' undeclared
 here (not in a function); did you mean 'TLS_SIZE'?
Message-ID: <202302241009.7GXtrZZr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc8-part1
head:   e0efec029d0e793ae4cb53cabbe1392869354a0a
commit: ed1b5345aeb7e1fc3d492521fef15797fe0ae3f7 [9/12] x86/smpboot: Remove initial_stack on 64-bit
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230224/202302241009.7GXtrZZr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc8-part1
        git checkout ed1b5345aeb7e1fc3d492521fef15797fe0ae3f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241009.7GXtrZZr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/init_task.h:5,
                    from init/init_task.c:2:
>> arch/x86/include/asm/processor.h:654:53: error: 'PTREGS_SIZE' undeclared here (not in a function); did you mean 'TLS_SIZE'?
     654 |         .sp     = (unsigned long)&__end_init_task - PTREGS_SIZE,        \
         |                                                     ^~~~~~~~~~~
   init/init_task.c:115:27: note: in expansion of macro 'INIT_THREAD'
     115 |         .thread         = INIT_THREAD,
         |                           ^~~~~~~~~~~


vim +654 arch/x86/include/asm/processor.h

   652	
   653	#define INIT_THREAD {							\
 > 654		.sp	= (unsigned long)&__end_init_task - PTREGS_SIZE,	\
   655	}
   656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
