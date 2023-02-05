Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE615C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 04:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675569910; x=1707105910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2NqAN73bKaH1JiCiV47VF3BSHz5buEujRjDvxaN8xQ=;
  b=NWPv6MIXTrO3grIeHQPKLLHRfhe2cUIRtarBNDRCCxwV1DjS+1oPA2Jr
   Wac8qlrDnc7Ns6ngrBlpTdXNM7E4uz2lsrluE8GJKHfJV69aKjTOHE2gb
   syrE/UeDWlFzGePOhMP/q/Nm6XMZ+H2QiM3DDWjrUdHLHX4N2qstEMP7X
   BCSacGriPR6LrHRTmdU5GXvKzPHi7orBm/woCn3qc0TeRPlNgn0yOyMz1
   VF6zuhtr+iFbSvG9Nlm9jsrDS308vcl2fSNAJa+mjGDqs3ACCmF7Ls1AF
   L+Ds7+Q36ctvxFz9imb+rgESn/zT3mFeWqbzshaqa9El2N2BhUatB1YMO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309351244"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="309351244"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 20:05:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698501840"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="698501840"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2023 20:05:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOWH5-0001j5-0i;
	Sun, 05 Feb 2023 04:05:07 +0000
Date: Sun, 5 Feb 2023 12:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 125/20208]
 sound/soc/fsl/fsl_asrc_m2m.c:350:5: warning: no previous prototype for
 function 'fsl_asrc_process_buffer_pre'
Message-ID: <202302051127.1ywJRwZl-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 94e5356aea65959c2f670b94b36472658a40000f [125/20208] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230205/202302051127.1ywJRwZl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/94e5356aea65959c2f670b94b36472658a40000f
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 94e5356aea65959c2f670b94b36472658a40000f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/tty/serial/ sound/soc/fsl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_asrc.c:918:
   sound/soc/fsl/fsl_asrc_m2m.c:244:63: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
           ret = dma_map_sg(&asrc->pdev->dev, sg, sg_nent, slave_config.direction);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/dma-mapping.h:408:58: note: expanded from macro 'dma_map_sg'
   #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
                                  ~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
>> sound/soc/fsl/fsl_asrc_m2m.c:350:5: warning: no previous prototype for function 'fsl_asrc_process_buffer_pre' [-Wmissing-prototypes]
   int fsl_asrc_process_buffer_pre(struct completion *complete,
       ^
   sound/soc/fsl/fsl_asrc_m2m.c:350:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fsl_asrc_process_buffer_pre(struct completion *complete,
   ^
   static 
   sound/soc/fsl/fsl_asrc_m2m.c:384:3: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                   mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:367:9: note: expanded from macro 'mxc_asrc_dma_umap'
                                DMA_MEM_TO_DEV); \
                                ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
   sound/soc/fsl/fsl_asrc_m2m.c:384:3: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                   mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:9: note: expanded from macro 'mxc_asrc_dma_umap'
                                DMA_DEV_TO_MEM); \
                                ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
   sound/soc/fsl/fsl_asrc_m2m.c:391:3: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                   mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:367:9: note: expanded from macro 'mxc_asrc_dma_umap'
                                DMA_MEM_TO_DEV); \
                                ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
   sound/soc/fsl/fsl_asrc_m2m.c:391:3: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                   mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:9: note: expanded from macro 'mxc_asrc_dma_umap'
                                DMA_DEV_TO_MEM); \
                                ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
   sound/soc/fsl/fsl_asrc_m2m.c:395:2: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
           mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:367:9: note: expanded from macro 'mxc_asrc_dma_umap'
                                DMA_MEM_TO_DEV); \
                                ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
   sound/soc/fsl/fsl_asrc_m2m.c:395:2: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
           mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:9: note: expanded from macro 'mxc_asrc_dma_umap'
                                DMA_DEV_TO_MEM); \
                                ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
>> sound/soc/fsl/fsl_asrc_m2m.c:372:5: warning: no previous prototype for function 'fsl_asrc_process_buffer' [-Wmissing-prototypes]
   int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
       ^
   sound/soc/fsl/fsl_asrc_m2m.c:372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
   ^
   static 
>> sound/soc/fsl/fsl_asrc_m2m.c:670:15: warning: variable 'out_length' set but not used [-Wunused-but-set-variable]
           unsigned int out_length;
                        ^
>> sound/soc/fsl/fsl_asrc_m2m.c:1037:23: warning: variable 'm2m' set but not used [-Wunused-but-set-variable]
           struct fsl_asrc_m2m *m2m;
                                ^
   11 warnings generated.


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
