Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EE81865
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 03:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686279673; x=1717815673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ZTBrYxLg/qcKhMRAlDwujvNGnPU9VWrHUIKvHA55wY=;
  b=ErWymEX/9C9nlOc8tq9gvuvDRCxa2zLLFp8IjNSJk86choIYIxnQXVi1
   +HYQPf3LINW/YmS30oI8Jf5XLEK+aX3Gg5Z+iJUTnD9uodCbLTr7C2lLp
   RvDcZkh6Eo26yKc5N2gs/EK1CGdI6Zslel7Kr8QYd4la1Ahl9+lKH2d4h
   w6khkpOLoxM5kuyqS5hcD7gG9yLhRhSmK43xmPyO4tfKpXKNLs+sQ/gtf
   8hrZ5yLr38deTpomBAQQOausEmy+VdCMgZAGvz4xW9WxgnizepXkGkp28
   Is8wNP6VL1KhETfBThHGrBs+0W8HpqczH6OCaDUUL9fd6WAt+nuJ3CMCY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357501056"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="357501056"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 20:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713346306"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713346306"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 20:01:09 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7SNA-0008Ym-2z;
	Fri, 09 Jun 2023 03:01:08 +0000
Date: Fri, 9 Jun 2023 11:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [ulfh-mmc:next 14/14] drivers/mmc/host/cqhci.h:27:41: error:
 implicit declaration of function 'FIELD_GET'
Message-ID: <202306091052.diFVTFds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   364dae3e80a48fcd22c9d4e57223d2918bcadd6f
commit: 364dae3e80a48fcd22c9d4e57223d2918bcadd6f [14/14] mmc: mtk-sd: reduce CIT for better performance
config: nios2-buildonly-randconfig-r004-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091052.diFVTFds-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?id=364dae3e80a48fcd22c9d4e57223d2918bcadd6f
        git remote add ulfh-mmc git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
        git fetch --no-tags ulfh-mmc next
        git checkout 364dae3e80a48fcd22c9d4e57223d2918bcadd6f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/mmc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091052.diFVTFds-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/host/mtk-sd.c:38:
   drivers/mmc/host/mtk-sd.c: In function 'msdc_cqe_cit_cal':
>> drivers/mmc/host/cqhci.h:27:41: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      27 | #define CQHCI_ITCFMUL(x)                FIELD_GET(CQHCI_CAP_ITCFMUL, (x))
         |                                         ^~~~~~~~~
   drivers/mmc/host/mtk-sd.c:2468:19: note: in expansion of macro 'CQHCI_ITCFMUL'
    2468 |         itcfmul = CQHCI_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
         |                   ^~~~~~~~~~~~~
   In file included from ./arch/nios2/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/mmc/host/mtk-sd.c:7:
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/mmc/host/mtk-sd.c:2471:17: note: in expansion of macro 'do_div'
    2471 |                 do_div(hclk_freq, 1000);
         |                 ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mmc/host/mtk-sd.c:2471:17: note: in expansion of macro 'do_div'
    2471 |                 do_div(hclk_freq, 1000);
         |                 ^~~~~~
   include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long unsigned int *
   drivers/mmc/host/mtk-sd.c:2471:17: note: in expansion of macro 'do_div'
    2471 |                 do_div(hclk_freq, 1000);
         |                 ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/mmc/host/mtk-sd.c:2474:17: note: in expansion of macro 'do_div'
    2474 |                 do_div(hclk_freq, 100);
         |                 ^~~~~~
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mmc/host/mtk-sd.c:2474:17: note: in expansion of macro 'do_div'
    2474 |                 do_div(hclk_freq, 100);
         |                 ^~~~~~
   include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long unsigned int *
   drivers/mmc/host/mtk-sd.c:2474:17: note: in expansion of macro 'do_div'
    2474 |                 do_div(hclk_freq, 100);
         |                 ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/mmc/host/mtk-sd.c:2477:17: note: in expansion of macro 'do_div'
    2477 |                 do_div(hclk_freq, 10);
         |                 ^~~~~~
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mmc/host/mtk-sd.c:2477:17: note: in expansion of macro 'do_div'
    2477 |                 do_div(hclk_freq, 10);
         |                 ^~~~~~
   include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long unsigned int *
   drivers/mmc/host/mtk-sd.c:2477:17: note: in expansion of macro 'do_div'
    2477 |                 do_div(hclk_freq, 10);
         |                 ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +27 drivers/mmc/host/cqhci.h

    22	
    23	/* capabilities */
    24	#define CQHCI_CAP			0x04
    25	#define CQHCI_CAP_CS			0x10000000 /* Crypto Support */
    26	#define CQHCI_CAP_ITCFMUL		GENMASK(15, 12)
  > 27	#define CQHCI_ITCFMUL(x)		FIELD_GET(CQHCI_CAP_ITCFMUL, (x))
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
