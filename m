Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD041FB1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680244655; x=1711780655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4HOMgD0dbPPcdNxsHOSKs4wtxvXfdczWQkKJM3HmpXs=;
  b=PbpdG6UrPxbzE/Z8ojV05uTJk0fFRIUj89WBb9qkyK1Jjo2MEJtbUGga
   uBuPvQldiAyWbEKyc+sEMeK78TKVz8C8y8KHlYXOUh62jKEG6DD4KRslz
   IGOX+eg1GjknGtGZ8sGIrUuA3NxV/ewVqcaig4VGNhJ4wVkCP32nte+42
   OTLvo0wRTZ4VUczE/77eUfrbpX3XzjEfYFo1RGbEw4BDwNLRCP6YEcgma
   CGsRzhlZK5OM5nFKhFbqR5wkdJpnsWINxpln8kIDKd3Z0cF4sYbYrUqZB
   yC0/Km1mu/ZvY3ahS1uz7VbzLo41NseQGNuhRmupzPPmjhjAWF9+ENE3P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321026530"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="321026530"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 23:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="749508405"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="749508405"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2023 23:37:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi8O5-000LYe-1p;
	Fri, 31 Mar 2023 06:37:25 +0000
Date: Fri, 31 Mar 2023 14:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 3/3] include/linux/kern_levels.h:5:25:
 error: format '%d' expects argument of type 'int', but argument 2 has type
 'long int'
Message-ID: <202303311432.G2FlFx6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   d3371f889576494ba8a4f286595bdbde8e6d7242
commit: d3371f889576494ba8a4f286595bdbde8e6d7242 [3/3] CHROMIUM: dm-verity: use GPT try counter for integrity retries
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230331/202303311432.G2FlFx6c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.4
        git checkout d3371f889576494ba8a4f286595bdbde8e6d7242
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311432.G2FlFx6c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bio.h:8,
                    from drivers/md/dm-verity-chromeos.c:19:
   drivers/md/dm-verity-chromeos.c: In function 'chromeos_handle_retries':
>> include/linux/kern_levels.h:5:25: error: format '%d' expects argument of type 'int', but argument 2 has type 'long int' [-Werror=format=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:299:16: note: in expansion of macro 'KERN_ERR'
     299 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   include/linux/device-mapper.h:544:25: note: in expansion of macro 'pr_err'
     544 | #define DMERR(fmt, ...) pr_err(DM_FMT(fmt), ##__VA_ARGS__)
         |                         ^~~~~~
   drivers/md/dm-verity-chromeos.c:380:17: note: in expansion of macro 'DMERR'
     380 |                 DMERR("update_tries: could not open device for reading: %d",
         |                 ^~~~~
   cc1: all warnings being treated as errors


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
