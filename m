Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD901C26
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 06:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675492357; x=1707028357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CD6b0htZRO2x3louGvIWhiuWHvhKpWU4M+fa3f0CUtE=;
  b=Eky9GemeNw7HMwKbEeQgDDhvgwDTPnDxHGPV58zkEkHthho4e52KYPH8
   BPaGNewpI66IkqxG7rqxyHoyGgxlQlyltlqk+LKf31Am+OZE4DDIs9wBg
   raMG+VvBJ2mCF6VNcBqvd9yhPYsAQt/hoTuqP5NcdEdMkpweiuZ4oB9QB
   eRAQPFWeyQpJf/AmIn3m9SmZAXa8jkJD2VM0scemtI4b2pNTV0N0zNqWk
   ZUpSBimAxSqxhaEKMBn2qA70M2lqXMgYInrHhIrzmbpQ4Wl/06Hdn3P7B
   cz0YcYysQ8ac8IbhzqFPHHwUG1/IpwqtaRWaxaHxzMQ+RTkK8PYHiDx6w
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415136369"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415136369"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 22:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="839835835"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="839835835"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Feb 2023 22:32:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOC6E-00016P-1t;
	Sat, 04 Feb 2023 06:32:34 +0000
Date: Sat, 4 Feb 2023 14:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 125/20209]
 sound/soc/fsl/fsl_asrc_m2m.c:350:5: warning: no previous prototype for
 'fsl_asrc_process_buffer_pre'
Message-ID: <202302041405.8oVMqTcx-lkp@intel.com>
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
commit: 94e5356aea65959c2f670b94b36472658a40000f [125/20209] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041405.8oVMqTcx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/94e5356aea65959c2f670b94b36472658a40000f
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 94e5356aea65959c2f670b94b36472658a40000f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/backlight/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_asrc.c:11:
   sound/soc/fsl/fsl_asrc_m2m.c: In function 'fsl_asrc_dmaconfig':
   sound/soc/fsl/fsl_asrc_m2m.c:244:69: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     244 |         ret = dma_map_sg(&asrc->pdev->dev, sg, sg_nent, slave_config.direction);
         |                                                         ~~~~~~~~~~~~^~~~~~~~~~
   include/linux/dma-mapping.h:408:58: note: in definition of macro 'dma_map_sg'
     408 | #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
         |                                                          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
   sound/soc/fsl/fsl_asrc_m2m.c: At top level:
>> sound/soc/fsl/fsl_asrc_m2m.c:350:5: warning: no previous prototype for 'fsl_asrc_process_buffer_pre' [-Wmissing-prototypes]
     350 | int fsl_asrc_process_buffer_pre(struct completion *complete,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/fsl/fsl_asrc_m2m.c:372:5: warning: no previous prototype for 'fsl_asrc_process_buffer' [-Wmissing-prototypes]
     372 | int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c: In function 'fsl_asrc_process_buffer':
   sound/soc/fsl/fsl_asrc_m2m.c:367:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     367 |                              DMA_MEM_TO_DEV); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:384:17: note: in expansion of macro 'mxc_asrc_dma_umap'
     384 |                 mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     369 |                              DMA_DEV_TO_MEM); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:384:17: note: in expansion of macro 'mxc_asrc_dma_umap'
     384 |                 mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:367:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     367 |                              DMA_MEM_TO_DEV); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:391:17: note: in expansion of macro 'mxc_asrc_dma_umap'
     391 |                 mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     369 |                              DMA_DEV_TO_MEM); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:391:17: note: in expansion of macro 'mxc_asrc_dma_umap'
     391 |                 mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:367:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     367 |                              DMA_MEM_TO_DEV); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:395:9: note: in expansion of macro 'mxc_asrc_dma_umap'
     395 |         mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |         ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     369 |                              DMA_DEV_TO_MEM); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:395:9: note: in expansion of macro 'mxc_asrc_dma_umap'
     395 |         mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |         ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c: In function 'fsl_asrc_calc_last_period_size':
>> sound/soc/fsl/fsl_asrc_m2m.c:670:22: warning: variable 'out_length' set but not used [-Wunused-but-set-variable]
     670 |         unsigned int out_length;
         |                      ^~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c: In function 'fsl_asrc_m2m_resume':
>> sound/soc/fsl/fsl_asrc_m2m.c:1037:30: warning: variable 'm2m' set but not used [-Wunused-but-set-variable]
    1037 |         struct fsl_asrc_m2m *m2m;
         |                              ^~~


vim +/fsl_asrc_process_buffer_pre +350 sound/soc/fsl/fsl_asrc_m2m.c

   349	
 > 350	int fsl_asrc_process_buffer_pre(struct completion *complete,
   351					enum asrc_pair_index index, bool dir)
   352	{
   353		if (!wait_for_completion_interruptible_timeout(complete, 10 * HZ)) {
   354			pr_err("%sput DMA task timeout\n", DIR_STR(dir));
   355			return -ETIME;
   356		} else if (signal_pending(current)) {
   357			pr_err("%sput task forcibly aborted\n", DIR_STR(dir));
   358			return -ERESTARTSYS;
   359		}
   360	
   361		return 0;
   362	}
   363	
   364	#define mxc_asrc_dma_umap(dev, m2m) \
   365		do { \
   366			dma_unmap_sg(dev, m2m->sg[IN], m2m->sg_nodes[IN], \
   367				     DMA_MEM_TO_DEV); \
   368			dma_unmap_sg(dev, m2m->sg[OUT], m2m->sg_nodes[OUT], \
   369				     DMA_DEV_TO_MEM); \
   370		} while (0)
   371	
 > 372	int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
   373				    struct asrc_convert_buffer *pbuf)
   374	{
   375		struct fsl_asrc *asrc = pair->asrc;
   376		struct fsl_asrc_m2m *m2m = pair->private_m2m;
   377		enum asrc_pair_index index = pair->index;
   378		unsigned long lock_flags;
   379		int ret;
   380	
   381		/* Check input task first */
   382		ret = fsl_asrc_process_buffer_pre(&m2m->complete[IN], index, IN);
   383		if (ret) {
   384			mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   385			return ret;
   386		}
   387	
   388		/* ...then output task*/
   389		ret = fsl_asrc_process_buffer_pre(&m2m->complete[OUT], index, OUT);
   390		if (ret) {
   391			mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   392			return ret;
   393		}
   394	
   395		mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   396	
   397		/* Fetch the remaining data */
   398		spin_lock_irqsave(&m2m->lock, lock_flags);
   399		if (!m2m->pair_hold) {
   400			spin_unlock_irqrestore(&m2m->lock, lock_flags);
   401			return -EFAULT;
   402		}
   403		spin_unlock_irqrestore(&m2m->lock, lock_flags);
   404	
   405		fsl_asrc_read_last_FIFO(pair);
   406	
   407		/* Update final lengths after getting last FIFO */
   408		pbuf->input_buffer_length = m2m->dma_block[IN].length;
   409		pbuf->output_buffer_length = m2m->dma_block[OUT].length;
   410	
   411		if (copy_to_user((void __user *)pbuf->output_buffer_vaddr,
   412				 m2m->dma_block[OUT].dma_vaddr,
   413				 m2m->dma_block[OUT].length))
   414			return -EFAULT;
   415	
   416		return 0;
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
