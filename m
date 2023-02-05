Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435B2F21
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 19:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675626691; x=1707162691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I4QrC1qbx7h84ADH8oy+cDS1mgFyZoYu+dRRTmU9/Ig=;
  b=BvqtLZyD6wemsp+Hwi3TrzcEjlf1LBjar7G6eNn5z72SRdEis3OiOmL6
   9KPTqiU5cfbENLnShCYJSl07Ox2czJBVWp4FCtQf08SqWJwLTaPL+eZ5q
   qPwFea7j3Y6pRYMctvDGuF/qkVwQR4BQ9sl8LhfzWiQT1g9QvOT+4Wcqs
   F2DikyWtqUZ7C3DPR3Dtyjxv5RAZbePo3X45+jByj3wMVlZ9rx+zlBFr2
   HyILGQK7Lz/SfNAfqNjwlx7zltOqJkHyWSn5QlfDhOg2CGa67kb+z5OF9
   UyyfQZ9XEHh5n9TnehjOaJLId8mWX5Ix5ZcbZVsiZ/pXhhwHeCldUNA+B
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="329095693"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="329095693"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 11:51:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="729812589"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="729812589"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2023 11:51:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOl2v-0002Be-21;
	Sun, 05 Feb 2023 19:51:29 +0000
Date: Mon, 6 Feb 2023 03:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
Message-ID: <202302060347.qgHwb8oa-lkp@intel.com>
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201084832.1708866-1-boris.brezillon@collabora.com>

Hi Boris,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-pancsf-Add-a-new-driver-for-Mali-CSF-based-GPUs/20230201-172815
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230201084832.1708866-1-boris.brezillon%40collabora.com
patch subject: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230206/202302060347.qgHwb8oa-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/794ce1c0209242bf1496fc4195ca707d45b37e73
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Boris-Brezillon/drm-pancsf-Add-a-new-driver-for-Mali-CSF-based-GPUs/20230201-172815
        git checkout 794ce1c0209242bf1496fc4195ca707d45b37e73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/pancsf/pancsf_mcu.c:248:1: warning: no previous prototype for 'pancsf_fw_mem_alloc' [-Wmissing-prototypes]
     248 | pancsf_fw_mem_alloc(struct pancsf_device *pfdev,
         | ^~~~~~~~~~~~~~~~~~~
   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/pancsf/pancsf_mcu.c:4:
   drivers/gpu/drm/pancsf/pancsf_mcu.c: In function 'pancsf_fw_load_section_entry':
>> arch/arc/include/asm/page.h:82:37: error: expected ')' before '{' token
      82 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                     ^
   arch/arc/include/asm/pgtable-bits-arcv2.h:49:25: note: in expansion of macro '__pgprot'
      49 | #define PAGE_KERNEL     __pgprot(___DEF | _PAGE_GLOBAL \
         |                         ^~~~~~~~
   include/linux/highmem-internal.h:32:19: note: in expansion of macro 'PAGE_KERNEL'
      32 | #define kmap_prot PAGE_KERNEL
         |                   ^~~~~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_mcu.c:443:34: note: in expansion of macro 'kmap_prot'
     443 |                         pgprot_t kmap_prot = PAGE_KERNEL;
         |                                  ^~~~~~~~~
>> arch/arc/include/asm/page.h:82:44: error: expected statement before ')' token
      82 | #define __pgprot(x)     ((pgprot_t) { (x) })
         |                                            ^
   arch/arc/include/asm/pgtable-bits-arcv2.h:49:25: note: in expansion of macro '__pgprot'
      49 | #define PAGE_KERNEL     __pgprot(___DEF | _PAGE_GLOBAL \
         |                         ^~~~~~~~
   drivers/gpu/drm/pancsf/pancsf_mcu.c:443:46: note: in expansion of macro 'PAGE_KERNEL'
     443 |                         pgprot_t kmap_prot = PAGE_KERNEL;
         |                                              ^~~~~~~~~~~


vim +82 arch/arc/include/asm/page.h

5dda4dc570ac41 Vineet Gupta     2013-01-18  80  
5dda4dc570ac41 Vineet Gupta     2013-01-18  81  #define pgprot_val(x)	((x).pgprot)
5dda4dc570ac41 Vineet Gupta     2013-01-18 @82  #define __pgprot(x)	((pgprot_t) { (x) })
4368902bb90f0e Gilad Ben-Yossef 2013-01-22  83  #define pte_pgprot(x)	__pgprot(pte_val(x))
4368902bb90f0e Gilad Ben-Yossef 2013-01-22  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
