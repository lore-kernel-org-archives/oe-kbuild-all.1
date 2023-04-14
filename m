Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8F369
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 00:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681432646; x=1712968646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLP+qPKJUGlqc186nuQhuNtRyVAMYtQ0d6ukiAczwoo=;
  b=UuI57dOsvyx5oFEB4wUzrQHDLkOhnrNhOWObZ9aJ4N55YLK8ztU/foYD
   uxWFD/Rd3JNmr6GrzTerLwy7raoeh4yTwWRVqyUMODrAFGqRSo25MupV8
   u9Av4MrEevh9H+nZrgDUS8poCkZCDBW7PzEmsbs/045ymQLxRmhOE69B9
   mzesWIVqRc5dahcnyOTn37rla7m9ypbFIJbtu/pa9okKpNBSXWsp3lj+I
   VSiva0o+LJSxDkr/zm2zyGhKeZ3wDlhC2CLU3Oswk3CC+NKZXFFLyWb23
   jGzBB73QDOiwIeOa09VBH5nlkzr1gqRjQBNk/6MvZXAcKy/Lvvx7MPXlh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324696727"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324696727"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 17:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692175327"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="692175327"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2023 17:37:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn7R5-000Z4L-2E;
	Fri, 14 Apr 2023 00:37:07 +0000
Date: Fri, 14 Apr 2023 08:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 15/32] include/linux/kern_levels.h:5:25:
 warning: format '%zu' expects argument of type 'size_t', but argument 5 has
 type 'uint32_t' {aka 'unsigned int'}
Message-ID: <202304140809.J8VJGDdT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shardul,

FYI, the error/warning still remains.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   212c75dd522f6c26e83be4156d5e0a7e8a933530
commit: 010702724c2a774af44ba9d1a9f531ef9a4bea62 [15/32] CHROMIUM: msm: camera: isp: Fix OOB access due to underflow
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304140809.J8VJGDdT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 010702724c2a774af44ba9d1a9f531ef9a4bea62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/camx/cam_isp/isp_hw_mgr/ drivers/media/platform/camx/cam_jpeg/jpeg_hw/ drivers/media/platform/camx/cam_lrme/lrme_hw_mgr/lrme_hw/ drivers/media/platform/camx/cam_req_mgr/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140809.J8VJGDdT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/media/platform/camx/cam_isp/isp_hw_mgr/cam_ife_hw_mgr.c:14:
   drivers/media/platform/camx/cam_isp/isp_hw_mgr/cam_ife_hw_mgr.c: In function 'cam_ife_mgr_dump':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'uint32_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:422:25: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:493:9: note: in expansion of macro 'printk'
     493 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:493:16: note: in expansion of macro 'KERN_ERR'
     493 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/media/platform/camx/cam_utils/cam_debug_util.h:88:9: note: in expansion of macro 'pr_err'
      88 |         pr_err("CAM_ERR: %s: %s: %d " fmt "\n",                     \
         |         ^~~~~~
   drivers/media/platform/camx/cam_isp/isp_hw_mgr/cam_ife_hw_mgr.c:4678:17: note: in expansion of macro 'CAM_ERR'
    4678 |                 CAM_ERR(CAM_ISP,
         |                 ^~~~~~~
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:19,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from drivers/media/platform/camx/cam_jpeg/jpeg_hw/cam_jpeg_hw_mgr.c:14:
   drivers/media/platform/camx/cam_jpeg/jpeg_hw/cam_jpeg_hw_mgr.c: In function 'cam_jpeg_mgr_hw_dump':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'int32_t' {aka 'int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:422:25: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:503:9: note: in expansion of macro 'printk'
     503 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:503:16: note: in expansion of macro 'KERN_WARNING'
     503 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/media/platform/camx/cam_utils/cam_debug_util.h:99:9: note: in expansion of macro 'pr_warn'
      99 |         pr_warn("CAM_WARN: %s: %s: %d " fmt "\n",                     \
         |         ^~~~~~~
   drivers/media/platform/camx/cam_jpeg/jpeg_hw/cam_jpeg_hw_mgr.c:1117:17: note: in expansion of macro 'CAM_WARN'
    1117 |                 CAM_WARN(CAM_JPEG, "dump offset overshoot len %zu offset %zu",
         |                 ^~~~~~~~
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:19,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from drivers/media/platform/camx/cam_lrme/lrme_hw_mgr/lrme_hw/cam_lrme_hw_core.c:14:
   drivers/media/platform/camx/cam_lrme/lrme_hw_mgr/lrme_hw/cam_lrme_hw_core.c: In function 'cam_lrme_hw_dump':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'uint64_t' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:422:25: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:503:9: note: in expansion of macro 'printk'
     503 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:503:16: note: in expansion of macro 'KERN_WARNING'
     503 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/media/platform/camx/cam_utils/cam_debug_util.h:99:9: note: in expansion of macro 'pr_warn'
      99 |         pr_warn("CAM_WARN: %s: %s: %d " fmt "\n",                     \
         |         ^~~~~~~
   drivers/media/platform/camx/cam_lrme/lrme_hw_mgr/lrme_hw/cam_lrme_hw_core.c:129:17: note: in expansion of macro 'CAM_WARN'
     129 |                 CAM_WARN(CAM_LRME, "dump buffer overshoot len %zu offset %zu",
         |                 ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_VIDEO
   Depends on [n]: ACPI [=y] && X86 && BACKLIGHT_CLASS_DEVICE [=y] && INPUT [=y] && (ACPI_WMI [=n] || !X86)
   Selected by [y]:
   - DRM_RADEON [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (AGP [=n] || !AGP [=n]) && ACPI [=y]
   - DRM_AMDGPU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && ACPI [=y]


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
