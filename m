Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB2849C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690361966; x=1721897966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBVr18+AJzhTQGLJIpUP9ktVh6OF7OlMOLINdPYMCwQ=;
  b=ZzKfech0F9AFB5lvsxEMuwu+Km0VWrnNHTOHCvJMCd8Yji+gGH7uCCSk
   nJU4e8F2eLoLZNVlSc2iXT/hfsYI6pJ5iECP/j4/7pij0M2dlK+MtpYjf
   DEVjw5GfXP9XOzZqFJD7RghkqNPOvhjZGTjtlbHzCcWUqLn9Ujs+JVUoP
   q1q4qEmF/18F0c1sX9jPYAefuMtOh9FByWKN0VEsfTz98+OPWpF57DmMZ
   kFH5XxDCDlh6ONGLIMP9gwj1yfS6vLmogx0iP1FaGabGxeV192/NCYxey
   uyLuenAA5JkqvYFFfcW7MQFgcDzy1G79IK15e51d/Azz3IBtPA4X4jUtn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366844666"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="366844666"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 01:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="703662639"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="703662639"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Jul 2023 01:59:22 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOaMI-0000qF-30;
	Wed, 26 Jul 2023 08:59:12 +0000
Date: Wed, 26 Jul 2023 16:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning:
 'VIRT_DIR_IDX_MASK' defined but not used
Message-ID: <202307261621.Z1iW2I7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6f3ee6fcd1f316038e9cb9505c72a15b019f3c7d
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307261621.Z1iW2I7G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261621.Z1iW2I7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261621.Z1iW2I7G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/img/vxe-vxd/common/img_mem_man.c:24:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/media/platform/img/vxe-vxd/common/imgmmu.c:20:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:782:13: warning: 'hwctrl_dump_state' defined but not used [-Wunused-function]
     782 | static void hwctrl_dump_state(struct vxd_states *prev_state,
         |             ^~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:22:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_buf_prepare':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:36: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
     770 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                    ^~~~~~~~~~~~
         |                                    pfn_to_page
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:34: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     770 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                  ^
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:637:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     637 |         int pages;
         |             ^~~~~
   In file included from include/linux/of_device.h:6,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:21:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_driver_init':
   include/linux/device/driver.h:265:27: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     265 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                           ^~~~~~~~~~~
   include/linux/platform_device.h:234:36: note: in definition of macro 'platform_driver_register'
     234 |         __platform_driver_register(drv, THIS_MODULE)
         |                                    ^~~
   include/linux/platform_device.h:264:9: note: in expansion of macro 'module_driver'
     264 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:2245:1: note: in expansion of macro 'module_platform_driver'
    2245 | module_platform_driver(vxd_dec_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:235:39: note: expected 'struct platform_driver *' but argument is of type 'const struct platform_driver *'
     235 | extern int __platform_driver_register(struct platform_driver *,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:32,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:17:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_driver_exit':
   include/linux/device/driver.h:270:22: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     270 |         __unregister(&(__driver) , ##__VA_ARGS__); \
         |                      ^~~~~~~~~~~
   include/linux/platform_device.h:264:9: note: in expansion of macro 'module_driver'
     264 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:2245:1: note: in expansion of macro 'module_platform_driver'
    2245 | module_platform_driver(vxd_dec_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:237:40: note: expected 'struct platform_driver *' but argument is of type 'const struct platform_driver *'
     237 | extern void platform_driver_unregister(struct platform_driver *);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: At top level:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:379:13: warning: 'vxd_error_recovery' defined but not used [-Wunused-function]
     379 | static void vxd_error_recovery(struct vxd_dec_ctx *ctx)
         |             ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/img/vxe-vxd/decoder/core.h:20,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:53:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/VIRT_DIR_IDX_MASK +65 drivers/media/platform/img/vxe-vxd/common/imgmmu.h

d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25  58  
d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25  59  /* @brief Page offset mask in virtual address - bottom bits */
d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25 @60  static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25  61  /* @brief Page table index mask in virtual address - middle bits */
d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25 @62  static const unsigned long VIRT_PAGE_TBL_MASK =
d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25  63  	(((1 << MMU_DIR_SHIFT) - 1) & ~(((1 << MMU_PAGE_SHIFT) - 1)));
d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25  64  /* @brief Directory index mask in virtual address - high bits */
d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25 @65  static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
d765f3e0f52ddbf drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2023-04-25  66  

:::::: The code at line 65 was first introduced by commit
:::::: d765f3e0f52ddbf80c1e08429b27d361c1b477cf v4l: vxd-dec: Create mmu programming helper library

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
