Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D827F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675500405; x=1707036405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AfHb+gw2YZukA3R4Mk7bD1c7NynnuDh07IBaOt+n9sQ=;
  b=i7BdzpuinKGVEIJS136tjR4hdUMRvCY61JxpWWtt1h+D+UrAGj0BHR2e
   4FXB7GyHNepbRWZ5qQyJi0y8cR8d6P0ujvHwHw/5eQpeb8Fwy3rMybUwu
   7p4eBk0ZxYfueQ8x96DZeBUNlNub7la3jTUz7ZL/87SX4NLyiv3oEuiZF
   6Mne7ZlXLjiDUPV2c3FWwssJTOP00WXAC9OjJ+PNKotN8zAkJEKuy3uAY
   yszJpt9Xjt1oc4GTwjvjqTO+JW7TCq7Nu4nW2w0kzgiJd+iLImEuo4kvQ
   LctR5wGOWpHFrNcEim/BMZvgYdXbBHpc7Z/mYTLXD0mWOvkjQkl7xSf7r
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309263967"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309263967"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 00:46:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="754731785"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="754731785"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 00:46:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOEBx-0001Ao-1V;
	Sat, 04 Feb 2023 08:46:37 +0000
Date: Sat, 4 Feb 2023 16:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 130/20209]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for
 'fsl_easrc_get_status'
Message-ID: <202302041638.MyumSuH3-lkp@intel.com>
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
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041638.MyumSuH3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/4250bc6d7316721784fdb6e47cdb2c37415f6e74
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 4250bc6d7316721784fdb6e47cdb2c37415f6e74
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/backlight/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_easrc.c:1752:
>> sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for 'fsl_easrc_get_status' [-Wmissing-prototypes]
      19 | void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/fsl/fsl_easrc.c:7:
   sound/soc/fsl/fsl_easrc_m2m.c: In function 'fsl_easrc_dmaconfig':
   sound/soc/fsl/fsl_easrc_m2m.c:150:56: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     150 |         ret = dma_map_sg(dev, sg, sg_nent, slave_config.direction);
         |                                            ~~~~~~~~~~~~^~~~~~~~~~
   include/linux/dma-mapping.h:408:58: note: in definition of macro 'dma_map_sg'
     408 | #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
         |                                                          ^
   sound/soc/fsl/fsl_easrc_m2m.c: At top level:
>> sound/soc/fsl/fsl_easrc_m2m.c:279:5: warning: no previous prototype for 'fsl_easrc_process_buffer_pre' [-Wmissing-prototypes]
     279 | int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c: In function 'fsl_easrc_process_buffer':
   sound/soc/fsl/fsl_easrc_m2m.c:27:41: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
      27 |                                         DMA_MEM_TO_DEV) \
         |                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_easrc_m2m.c:370:17: note: in expansion of macro 'mxc_easrc_dma_umap_in'
     370 |                 mxc_easrc_dma_umap_in(dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:31:41: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
      31 |                                         DMA_DEV_TO_MEM) \
         |                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_easrc_m2m.c:372:25: note: in expansion of macro 'mxc_easrc_dma_umap_out'
     372 |                         mxc_easrc_dma_umap_out(dev, m2m);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:27:41: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
      27 |                                         DMA_MEM_TO_DEV) \
         |                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_easrc_m2m.c:380:25: note: in expansion of macro 'mxc_easrc_dma_umap_in'
     380 |                         mxc_easrc_dma_umap_in(dev, m2m);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:31:41: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
      31 |                                         DMA_DEV_TO_MEM) \
         |                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_easrc_m2m.c:381:25: note: in expansion of macro 'mxc_easrc_dma_umap_out'
     381 |                         mxc_easrc_dma_umap_out(dev, m2m);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:27:41: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
      27 |                                         DMA_MEM_TO_DEV) \
         |                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_easrc_m2m.c:386:9: note: in expansion of macro 'mxc_easrc_dma_umap_in'
     386 |         mxc_easrc_dma_umap_in(dev, m2m);
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c:31:41: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
      31 |                                         DMA_DEV_TO_MEM) \
         |                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_easrc_m2m.c:388:17: note: in expansion of macro 'mxc_easrc_dma_umap_out'
     388 |                 mxc_easrc_dma_umap_out(dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_easrc_m2m.c: At top level:
>> sound/soc/fsl/fsl_easrc_m2m.c:412:6: warning: no previous prototype for 'fsl_easrc_submit_dma' [-Wmissing-prototypes]
     412 | void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
         |      ^~~~~~~~~~~~~~~~~~~~


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
