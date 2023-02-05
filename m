Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7F7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 06:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675579813; x=1707115813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZpybghtsUq//0QeIwkzpBuuJfgESsCOA7VbriUJ/Ne4=;
  b=fZyjg1Om0t2srv5izLegK1hDvs6DJG01YPILmytPQKNNZsBdAp7vCyB4
   kl1ope2x2JrhlhRiPsDtHThoIXFopdw77kH8MyvtrEJhxrspz0AHEOloY
   fF3y4a+9WylkWjP2JgTvgsDjMq8oxKGnk4CEpAq/TYWVyb317w7t9VsZ3
   3ggYOyV4rGkSBLiVWthHbn/twL90pXF1O+OuL8VsrYrsDbbc2n2QH9wiI
   x1uLH7tlKrP7qYAN+F1rqeEZablKW0Yiu+WSYJPlB6R8ldG1pAOtZwDxR
   Iqsyk8KOLSuhITzPgfvj4igMZKXe42XxWyDuJOS9g18K82kIWKrfL/Q6N
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309357497"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="309357497"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 22:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698519374"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="698519374"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2023 22:50:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOYqp-0001o1-0D;
	Sun, 05 Feb 2023 06:50:11 +0000
Date: Sun, 5 Feb 2023 14:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 130/20209]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for
 function 'fsl_easrc_get_status'
Message-ID: <202302051421.d6WoKegJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 4250bc6d7316721784fdb6e47cdb2c37415f6e74 [130/20209] MLK-21940-4: ASoC: fsl_easrc: Support the m2m function
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230205/202302051421.d6WoKegJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/4250bc6d7316721784fdb6e47cdb2c37415f6e74
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 4250bc6d7316721784fdb6e47cdb2c37415f6e74
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_easrc.c:1752:
>> sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for function 'fsl_easrc_get_status' [-Wmissing-prototypes]
   void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
        ^
   sound/soc/fsl/fsl_easrc_m2m.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
   ^
   static 
   sound/soc/fsl/fsl_easrc_m2m.c:150:50: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
           ret = dma_map_sg(dev, sg, sg_nent, slave_config.direction);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/dma-mapping.h:408:58: note: expanded from macro 'dma_map_sg'
   #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
                                  ~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_easrc.c:1752:
>> sound/soc/fsl/fsl_easrc_m2m.c:279:5: warning: no previous prototype for function 'fsl_easrc_process_buffer_pre' [-Wmissing-prototypes]
   int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
       ^
   sound/soc/fsl/fsl_easrc_m2m.c:279:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
   ^
   static 
   sound/soc/fsl/fsl_easrc_m2m.c:370:3: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                   mxc_easrc_dma_umap_in(dev, m2m);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:27:6: note: expanded from macro 'mxc_easrc_dma_umap_in'
                                           DMA_MEM_TO_DEV) \
                                           ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_easrc.c:1752:
   sound/soc/fsl/fsl_easrc_m2m.c:372:4: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                           mxc_easrc_dma_umap_out(dev, m2m);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:31:6: note: expanded from macro 'mxc_easrc_dma_umap_out'
                                           DMA_DEV_TO_MEM) \
                                           ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_easrc.c:1752:
   sound/soc/fsl/fsl_easrc_m2m.c:380:4: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                           mxc_easrc_dma_umap_in(dev, m2m);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:27:6: note: expanded from macro 'mxc_easrc_dma_umap_in'
                                           DMA_MEM_TO_DEV) \
                                           ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_easrc.c:1752:
   sound/soc/fsl/fsl_easrc_m2m.c:381:4: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                           mxc_easrc_dma_umap_out(dev, m2m);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:31:6: note: expanded from macro 'mxc_easrc_dma_umap_out'
                                           DMA_DEV_TO_MEM) \
                                           ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_easrc.c:1752:
   sound/soc/fsl/fsl_easrc_m2m.c:386:2: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
           mxc_easrc_dma_umap_in(dev, m2m);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:27:6: note: expanded from macro 'mxc_easrc_dma_umap_in'
                                           DMA_MEM_TO_DEV) \
                                           ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_easrc.c:1752:
   sound/soc/fsl/fsl_easrc_m2m.c:388:3: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                   mxc_easrc_dma_umap_out(dev, m2m);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:31:6: note: expanded from macro 'mxc_easrc_dma_umap_out'
                                           DMA_DEV_TO_MEM) \
                                           ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_easrc.c:1752:
>> sound/soc/fsl/fsl_easrc_m2m.c:412:6: warning: no previous prototype for function 'fsl_easrc_submit_dma' [-Wmissing-prototypes]
   void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
        ^
   sound/soc/fsl/fsl_easrc_m2m.c:412:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
   ^
   static 
   10 warnings generated.


vim +/fsl_easrc_get_status +19 sound/soc/fsl/fsl_easrc_m2m.c

    18	
  > 19	void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
    20				  struct asrc_status_flags *flags)
    21	{
    22		flags->overload_error = 0;
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
