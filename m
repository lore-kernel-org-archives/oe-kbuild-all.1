Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1EF7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677180806; x=1708716806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5zSzZ2kdKDNqCn0BLqUsrogWdW1Twl2BaDfFjQyS88=;
  b=axusFiyydSLLM+v5083IfYlvfU/hmGe6nKdtV6O+x8ydBw6rJMvk28vG
   wsnzj2qqjlkZp2qGl9YP9+aOUne+c9v6llPWYeqgCdFifiRiGBQscKdVj
   IFl6UY8HWh9VKH+cUA1mCkLjsRg8ERzwU01N0IK/7pN6P3NTvp5xR7sO8
   Q6oe5S/+Uv12qstvjRdkD7xWzSZQC7apx82fcAeRi5arZI3m2cqwLipyN
   Av/XnXjkNYIW08kIAruuNZg5rZdpUrYJcQdZ51gwBXqDjIX/f/IoZcmxF
   F/8KIL++rrnPGJaehnQOeyoicm9lC4X/lH0W/C9e6e3WXNOhzQTDQvwN0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331984276"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="331984276"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 11:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="736514439"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="736514439"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2023 11:33:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVHLA-0001fp-02;
	Thu, 23 Feb 2023 19:33:16 +0000
Date: Fri, 24 Feb 2023 03:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:dcp-better-timeline 15/27] drivers/dma/apple-sio.c:8:
 warning: "DEBUG" redefined
Message-ID: <202302240303.Kl36gjUa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux dcp-better-timeline
head:   bbb911a610da93e524e79eeeacbfdc9ca2821bc1
commit: 2539f99162a06f8d3036289e69b9e2cc99f43332 [15/27] WIP: dmaengine: apple-sio: Add Apple SIO driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302240303.Kl36gjUa-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/2539f99162a06f8d3036289e69b9e2cc99f43332
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik dcp-better-timeline
        git checkout 2539f99162a06f8d3036289e69b9e2cc99f43332
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240303.Kl36gjUa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/apple-sio.c:8: warning: "DEBUG" redefined
       8 | #define DEBUG
         | 
   <command-line>: note: this is the location of the previous definition
>> drivers/dma/apple-sio.c:215:18: warning: no previous prototype for 'sio_alloc_desc' [-Wmissing-prototypes]
     215 | struct sio_desc *sio_alloc_desc(struct sio_data *sio)
         |                  ^~~~~~~~~~~~~~
>> drivers/dma/apple-sio.c:226:6: warning: no previous prototype for 'sio_free_desc' [-Wmissing-prototypes]
     226 | void sio_free_desc(struct sio_data *sio, struct sio_desc *desc)
         |      ^~~~~~~~~~~~~
>> drivers/dma/apple-sio.c:231:5: warning: no previous prototype for 'sio_desc_slot' [-Wmissing-prototypes]
     231 | int sio_desc_slot(struct sio_data *sio, struct sio_desc *desc)
         |     ^~~~~~~~~~~~~
   drivers/dma/apple-sio.c: In function 'sio_recv_msg':
>> drivers/dma/apple-sio.c:548:12: warning: variable 'param' set but not used [-Wunused-but-set-variable]
     548 |         u8 param, type, tag, sioep;
         |            ^~~~~
   In file included from include/linux/device.h:15,
                    from drivers/dma/apple-sio.c:13:
   drivers/dma/apple-sio.c: In function 'sio_call':
>> drivers/dma/apple-sio.c:651:36: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     651 |                 dev_warn(sio->dev, "call %8x timed out\n", msg);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/dma/apple-sio.c:651:17: note: in expansion of macro 'dev_warn'
     651 |                 dev_warn(sio->dev, "call %8x timed out\n", msg);
         |                 ^~~~~~~~
   drivers/dma/apple-sio.c:651:44: note: format string is defined here
     651 |                 dev_warn(sio->dev, "call %8x timed out\n", msg);
         |                                          ~~^
         |                                            |
         |                                            unsigned int
         |                                          %8llx


vim +/DEBUG +8 drivers/dma/apple-sio.c

   > 8	#define DEBUG
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
