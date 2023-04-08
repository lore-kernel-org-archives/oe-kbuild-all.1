Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B2110B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 04:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680928231; x=1712464231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rNoORplpCMzhFerjL9Byp9tEyTok+9wAV4ZeizEGw7g=;
  b=fE0O2uYzNd5OFrJwzw0JiSWg7iQ2fIKdmzmF4PPtqIBcDQyHYzv0eObo
   72PlfPrLWFAlS+mWrp3zpdVbkPF8BCIqIzJJYdILbjLRu1sZDbkIWdsD7
   NZoG+A25E8ISeI96dPlITOTb6CALDpZ71vURJBK6lOeXuuhFAjqBxswMd
   hon316xKh32PLpgDvlIsgjz1Hh42EL2k+zUjCSQ2O0brUgQGd3acOs0ai
   cIWcxMNkOLeM/kZpJoCHf+SJ+qvKcJ/+6PBKkIRKLItCwSqwrioAoat+Q
   2h/cAfQSI0LlVEjYeMS1LKg68M74UL/nw16vmElAM5e+OLOl2UhgturCb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="370946278"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="370946278"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 21:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="720269222"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="720269222"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Apr 2023 21:30:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl0Dc-000TJT-0h;
	Sat, 08 Apr 2023 04:30:28 +0000
Date: Sat, 8 Apr 2023 12:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 3/7] include/linux/kern_levels.h:5:25:
 error: format '%d' expects argument of type 'int', but argument 2 has type
 'long int'
Message-ID: <202304081235.rEKJA2tS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniil,

FYI, the error/warning still remains.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   43639a0aeafa81ef369dc9a8105cc0cedc24691e
commit: d3371f889576494ba8a4f286595bdbde8e6d7242 [3/7] CHROMIUM: dm-verity: use GPT try counter for integrity retries
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304081235.rEKJA2tS-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202304081235.rEKJA2tS-lkp@intel.com/

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
