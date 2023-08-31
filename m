Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6552F33D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 07:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693468681; x=1725004681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+lrUzLNa14Yxd7Akp48nJUzHlPGsN82iYaXQsowpqc=;
  b=ffYhoAvNp44Gqno8T0uc62VJUzImHeYiI4e4ZntzpNCKlGs7mHHHvrUu
   qq8RnhxU9qaigsPCCz1bSuN5Ri2SUoo1msqGH4UTk9VvP8vTuYl/kAPbW
   4Iondfe+zpcL4gxhAlVVvc7cv5oq72TNCJ0tq3jPd0TLcfS/13idqIVjJ
   o2sDKpHxZDUMQlg5WOxKRagr5xgTeZyD8LtHlgJDbF+qFQFl9cmjQc6Dg
   beBV/ZJ9EdMbYajjXQ9i0JJ0RYMxfvKcoxa3VF3cHOLGe85feGfOf3lgh
   b3B3jt6zMwzg//pNWkwobq+mV8pRR8MXDl31v/IgUtY+kunTaVgnGWDMQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="366050790"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="366050790"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 00:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="986109787"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="986109787"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2023 00:57:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbcYu-000B5X-1A;
	Thu, 31 Aug 2023 07:57:56 +0000
Date: Thu, 31 Aug 2023 15:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 125/24604]
 sound/soc/fsl/fsl_asrc_m2m.c:350:5: warning: no previous prototype for
 function 'fsl_asrc_process_buffer_pre'
Message-ID: <202308311534.VB9LNUAT-lkp@intel.com>
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
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 94e5356aea65959c2f670b94b36472658a40000f [125/24604] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: s390-randconfig-r012-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311534.VB9LNUAT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311534.VB9LNUAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311534.VB9LNUAT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_asrc.c:11:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from sound/soc/fsl/fsl_asrc.c:11:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from sound/soc/fsl/fsl_asrc.c:11:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
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
   sound/soc/fsl/fsl_asrc_m2m.c:670:15: warning: variable 'out_length' set but not used [-Wunused-but-set-variable]
           unsigned int out_length;
                        ^
   22 warnings generated.


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
https://github.com/intel/lkp-tests/wiki
