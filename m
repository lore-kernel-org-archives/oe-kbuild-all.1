Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9FB28E7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682953149; x=1714489149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8e4kNZZCISYU2PnaAPU2kFGSp1XFYo8+/TrUM5Ff6ks=;
  b=JnKJo/0ycyDQDQnk4ylIsjNVaiMsFvGaJfD1h5+0XaPmSsGzTb40XpC4
   3zzLlUu199Ysr3ZbBphrgeG4jo9RmWdQfdUzfP1M+kksl7RK2h2Fr4lb0
   rVW5mqlDOtAY1CG8PpiHbqogUFga065GKLIIXSuqcyYHBBXlSd6EjgJat
   rm23qaOsQU2Ub/nT30MAUVoHbG2yVw/aBCCrD1/djW+rHO9Pcgk/vtRCw
   7pdOr4h+Muqr9gUJzHxJdalp2LVnqC0EukSCrtAxMD/7NZsaLvBZuiuy2
   Fi+66GYT16HokEyD62869HtsObYmQzQo8FubqhG0AI7s7yg8O1CwRyEY5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="351119488"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="351119488"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 07:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="689909477"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="689909477"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 May 2023 07:59:07 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptUza-0000VN-2R;
	Mon, 01 May 2023 14:59:06 +0000
Date: Mon, 1 May 2023 22:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 14/15]
 drivers/media/platform/camx/cam_utils/cam_common_util.c:79:27: warning:
 format '%d' expects argument of type 'int', but argument 5 has type 'size_t'
 {aka 'long unsigned int'}
Message-ID: <202305012211.FgN1dPlY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   08d8b7db6ac0eb24f33b6f17baf8c76f8e99552a
commit: f01e359d441be6d9613f4a9dc280f972e7a7d8de [14/15] CHROMIUM: msm: camera: isp: Copy packet and cmd buffer header in kernel
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230501/202305012211.FgN1dPlY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout f01e359d441be6d9613f4a9dc280f972e7a7d8de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/camx/cam_cdm/ drivers/media/platform/camx/cam_utils/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305012211.FgN1dPlY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:20,
                    from drivers/media/platform/camx/cam_cdm/cam_cdm_util.c:15:
   drivers/media/platform/camx/cam_cdm/cam_cdm_util.c: In function 'cam_cdm_util_reg_cont_write':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
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
   drivers/media/platform/camx/cam_cdm/cam_cdm_util.c:319:17: note: in expansion of macro 'CAM_ERR'
     319 |                 CAM_ERR(CAM_CDM, "Offset out of mapped range! size: %lu, offset: %u",
         |                 ^~~~~~~
--
   In file included from drivers/media/platform/camx/cam_utils/cam_common_util.c:23:
   drivers/media/platform/camx/cam_utils/cam_common_util.c: In function 'cam_common_mem_kdup':
>> drivers/media/platform/camx/cam_utils/cam_common_util.c:79:27: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
      79 |         CAM_DBG(CAM_UTIL, "Allocate and copy header with size: %d", len);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
         |                                                                     |
         |                                                                     size_t {aka long unsigned int}
   drivers/media/platform/camx/cam_utils/cam_debug_util.h:155:53: note: in definition of macro 'CAM_DBG'
     155 |         cam_debug_log(__module, __func__, __LINE__, fmt, ##args)
         |                                                     ^~~
   drivers/media/platform/camx/cam_utils/cam_common_util.c:79:65: note: format string is defined here
      79 |         CAM_DBG(CAM_UTIL, "Allocate and copy header with size: %d", len);
         |                                                                ~^
         |                                                                 |
         |                                                                 int
         |                                                                %ld


vim +79 drivers/media/platform/camx/cam_utils/cam_common_util.c

    69	
    70	void *cam_common_mem_kdup(void *from, size_t len)
    71	{
    72		void *to = kvzalloc(len, GFP_KERNEL);
    73	
    74		if (!to) {
    75			CAM_ERR(CAM_UTIL, "Failed to allocate header memory");
    76			return to;
    77		}
    78	
  > 79		CAM_DBG(CAM_UTIL, "Allocate and copy header with size: %d", len);
    80		memcpy(to, from, len);
    81	
    82		return to;
    83	}
    84	EXPORT_SYMBOL(cam_common_mem_kdup);
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
