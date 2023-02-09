Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B9AA94B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675977550; x=1707513550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LXWaYtgd+xf/PqN8xYGe+fpQHJazKkSS7jL1ZlS/JnA=;
  b=iDz6Q66DmrXW2s1MKdk+dQ1TsAk080ilKIw3qJ2ALT87GitP0mj5zTkA
   vbV/GkewsH5gUgWey8NGqLkFN1mchTm/C9kmTQXijSoieKr64vxXur0kI
   TWZ/jtkk6/+385JPZUjlJeoGRd973LXzJirmC2abBcRJNCGdDdryodfQE
   qp6mOVbYFUAyGHJrYgIN9h1LYNkiUw7L13sityxjV0diE9leZf1ksB0zy
   fmLql0cocqx7qqynuqWCSX9snoXqOr7xV6SRO/JztJ+8urFPOwtGb9vZo
   +/9WM0R+M+EK7OJyoXiqV8PkSp8NYTNm9l2FbOkMQIXXUYA4Oaxrfo1V+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318263707"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="318263707"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 13:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="661170490"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="661170490"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Feb 2023 13:19:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQEJv-0005JQ-2F;
	Thu, 09 Feb 2023 21:19:07 +0000
Date: Fri, 10 Feb 2023 05:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 29/31]
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h:125: warning: "CR_TE"
 redefined
Message-ID: <202302100555.qMnK5TJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   e6fc25ec2770c9db62486fb1f291b99531f86533
commit: 0facdc348172563db9b913d75c9aab1bf68550f8 [29/31] hack passing kernel_init()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230210/202302100555.qMnK5TJ8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=0facdc348172563db9b913d75c9aab1bf68550f8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 0facdc348172563db9b913d75c9aab1bf68550f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100555.qMnK5TJ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/rtl8192e/rtl8192e/rtl_core.h:40,
                    from drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c:10:
>> drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h:125: warning: "CR_TE" redefined
     125 | #define         CR_TE                                   0x04
         | 
   In file included from arch/arm/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/staging/rtl8192e/rtl8192e/rtl_core.h:20:
   arch/arm/include/asm/cp15.h:41: note: this is the location of the previous definition
      41 | #define CR_TE   (1 << 30)       /* Thumb exception enable               */
         | 
--
   In file included from drivers/staging/rtl8192u/r8192U_core.c:48:
>> drivers/staging/rtl8192u/r8192U_hw.h:76: warning: "CR_TE" redefined
      76 | #define CR_TE                   0x04
         | 
   In file included from arch/arm/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from drivers/staging/rtl8192u/r8192U_core.c:47:
   arch/arm/include/asm/cp15.h:41: note: this is the location of the previous definition
      41 | #define CR_TE   (1 << 30)       /* Thumb exception enable               */
         | 
--
   In file included from drivers/iommu/msm_iommu.c:25:
>> drivers/iommu/msm_iommu_hw-8xxx.h:827: warning: "TTBR0" redefined
     827 | #define TTBR0           (0x010)
         | 
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:740,
                    from include/linux/scatterlist.h:8,
                    from include/linux/iommu.h:10,
                    from include/linux/io-pgtable.h:6,
                    from drivers/iommu/msm_iommu.c:13:
   arch/arm/include/asm/uaccess.h:20: note: this is the location of the previous definition
      20 | #define TTBR0   __ACCESS_CP15(c2, 0, c0, 0)
         | 
>> drivers/iommu/msm_iommu_hw-8xxx.h:828: warning: "TTBR1" redefined
     828 | #define TTBR1           (0x014)
         | 
   arch/arm/include/asm/uaccess.h:21: note: this is the location of the previous definition
      21 | #define TTBR1   __ACCESS_CP15(c2, 0, c0, 1)
         | 


vim +/CR_TE +125 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h

ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  117  
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  118  	ANAPAR			= 0x17,
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  119  #define	BB_GLOBAL_RESET_BIT	0x1
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  120  	BB_GLOBAL_RESET		= 0x020,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  121  	BSSIDR			= 0x02E,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  122  	CMDR			= 0x037,
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  123  #define		CR_RST					0x10
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  124  #define		CR_RE					0x08
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04 @125  #define		CR_TE					0x04
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  126  #define		CR_MulRW				0x01
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  127  	SIFS		= 0x03E,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  128  	TCR			= 0x040,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  129  	RCR			= 0x044,
11632a0eed3101 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-25  130  #define RCR_FILTER_MASK (BIT0 | BIT1 | BIT2 | BIT3 | BIT5 | BIT12 |	\
11632a0eed3101 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-25  131  			BIT18 | BIT19 | BIT20 | BIT21 | BIT22 | BIT23)
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  132  #define RCR_ONLYERLPKT		BIT31
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  133  #define RCR_ENCS2		BIT30
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  134  #define RCR_ENCS1		BIT29
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  135  #define RCR_ENMBID		BIT27
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  136  #define RCR_ACKTXBW		(BIT24|BIT25)
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  137  #define RCR_CBSSID		BIT23
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  138  #define RCR_APWRMGT		BIT22
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  139  #define	RCR_ADD3		BIT21
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  140  #define RCR_AMF			BIT20
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  141  #define RCR_ACF			BIT19
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  142  #define RCR_ADF			BIT18
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  143  #define RCR_RXFTH		BIT13
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  144  #define RCR_AICV		BIT12
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  145  #define	RCR_ACRC32		BIT5
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  146  #define	RCR_AB			BIT3
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  147  #define	RCR_AM			BIT2
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  148  #define	RCR_APM			BIT1
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  149  #define	RCR_AAP			BIT0
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  150  #define RCR_MXDMA_OFFSET	8
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  151  #define RCR_FIFO_OFFSET		13
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  152  	SLOT_TIME		= 0x049,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  153  	ACK_TIMEOUT		= 0x04c,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  154  	PIFS_TIME		= 0x04d,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  155  	USTIME			= 0x04e,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  156  	EDCAPARA_BE		= 0x050,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  157  	EDCAPARA_BK		= 0x054,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  158  	EDCAPARA_VO		= 0x058,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  159  	EDCAPARA_VI		= 0x05C,
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  160  #define	AC_PARAM_TXOP_LIMIT_OFFSET		16
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  161  #define	AC_PARAM_ECW_MAX_OFFSET		12
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  162  #define	AC_PARAM_ECW_MIN_OFFSET			8
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  163  #define	AC_PARAM_AIFS_OFFSET				0
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  164  	RFPC			= 0x05F,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  165  	CWRR			= 0x060,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  166  	BCN_TCFG		= 0x062,
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  167  #define BCN_TCFG_CW_SHIFT		8
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  168  #define BCN_TCFG_IFS			0
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  169  	BCN_INTERVAL		= 0x070,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  170  	ATIMWND			= 0x072,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  171  	BCN_DRV_EARLY_INT	= 0x074,
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  172  #define	BCN_DRV_EARLY_INT_SWBCN_SHIFT	8
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  173  #define	BCN_DRV_EARLY_INT_TIME_SHIFT	0
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  174  	BCN_DMATIME		= 0x076,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  175  	BCN_ERR_THRESH		= 0x078,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  176  	RWCAM			= 0x0A0,
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  177  #define   CAM_CM_SecCAMPolling		BIT31
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  178  #define   CAM_CM_SecCAMClr			BIT30
94a799425eee82 drivers/staging/rtl8192e/r8192E_hw.h Larry Finger       2011-08-23  179  #define   CAM_CM_SecCAMWE			BIT16
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  180  #define   CAM_VALID			       BIT15
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  181  #define   CAM_NOTVALID			0x0000
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  182  #define   CAM_USEDK				BIT5
ecdfa44610fa18 drivers/staging/rtl8192e/r8192E_hw.h Greg Kroah-Hartman 2009-08-04  183  

:::::: The code at line 125 was first introduced by commit
:::::: ecdfa44610fa18678c3dd481af75368b9800c6c7 Staging: add Realtek 8192 PCI wireless driver

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
