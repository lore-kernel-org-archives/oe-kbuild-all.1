Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E058F5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696075067; x=1727611067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ik6kacsrLQqvkjaxjhqV8nsfx6B3iSI8+TUlfKz+EA=;
  b=l1rc2xAdoE4mjBm4pkAIjqmM5rTmFDjNNSDermZVpCF41n/8075M1NAL
   6fXug/CVGBjuE5OEMRbHm8U9tpNpNPDlKedP6jRT3DuBp/kBiOIv1Cp8r
   1eqhzP/r6aVPdJaKO92eG+KILUjpRABxYJ0bk3baVzWlTO6RF20Nl2dRZ
   NJztMjWKwLR6d2NJHlVkGfvEr6VEZrxrxeeFR2Vvse10pZDYb7UAeS169
   v310GkO6nLpg8KFFZZc6/LObP2eMyedOPrHkGtIPKsunulvc1Cp79EYLa
   ly4+QNj/pJxkgGFwUR2vAwN3Te1a91T2IU4CZBzJ9PBK8rtr110Lwp+nQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="1037358"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="1037358"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 04:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="1117913"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2023 04:57:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmYbN-00046j-2U;
	Sat, 30 Sep 2023 11:57:41 +0000
Date: Sat, 30 Sep 2023 19:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 211/217] include/linux/kern_levels.h:5:25:
 warning: format '%zu' expects argument of type 'size_t', but argument 6 has
 type 'uint32_t' {aka 'unsigned int'}
Message-ID: <202309301908.bFW8y2rp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   0ae6faaa0d86e300a37b529cdb6a10250b93f993
commit: a4438ed6b31a0bfa212c94419dc1c8eb5657a252 [211/217] CHROMIUM: msm: camera: icp: Avoid accessing frame process data in the kernel
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230930/202309301908.bFW8y2rp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301908.bFW8y2rp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301908.bFW8y2rp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/camx/cam_icp/icp_hw/icp_hw_mgr/cam_icp_hw_mgr.c: In function 'cam_icp_mgr_process_direct_ack_msg':
   drivers/media/platform/camx/cam_icp/icp_hw/icp_hw_mgr/cam_icp_hw_mgr.c:1850:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    1850 |                 if (ctx_data->state != CAM_ICP_CTX_STATE_FREE)
         |                 ^~
   In file included from drivers/media/platform/camx/cam_icp/icp_hw/icp_hw_mgr/cam_icp_hw_mgr.c:50:
   drivers/media/platform/camx/cam_utils/cam_debug_util.h:155:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     155 |         cam_debug_log(__module, __func__, __LINE__, fmt, ##args)
         |         ^~~~~~~~~~~~~
   drivers/media/platform/camx/cam_icp/icp_hw/icp_hw_mgr/cam_icp_hw_mgr.c:1852:25: note: in expansion of macro 'CAM_DBG'
    1852 |                         CAM_DBG(CAM_ICP, "received IPE/BPS\n"
         |                         ^~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:20,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from drivers/media/platform/camx/cam_icp/icp_hw/icp_hw_mgr/cam_icp_hw_mgr.c:14:
   drivers/media/platform/camx/cam_icp/icp_hw/icp_hw_mgr/cam_icp_hw_mgr.c: In function 'cam_icp_util_dump_frame_data':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'uint32_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:510:9: note: in expansion of macro 'printk'
     510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:510:16: note: in expansion of macro 'KERN_WARNING'
     510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/media/platform/camx/cam_utils/cam_debug_util.h:99:9: note: in expansion of macro 'pr_warn'
      99 |         pr_warn("CAM_WARN: %s: %s: %d " fmt "\n",                     \
         |         ^~~~~~~
   drivers/media/platform/camx/cam_icp/icp_hw/icp_hw_mgr/cam_icp_hw_mgr.c:5326:33: note: in expansion of macro 'CAM_WARN'
    5326 |                                 CAM_WARN(CAM_ICP, "buf overshoot len %zu offset %zu",
         |                                 ^~~~~~~~


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
https://github.com/intel/lkp-tests/wiki
