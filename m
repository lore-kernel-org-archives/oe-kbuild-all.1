Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F66FBC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693474556; x=1725010556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5th1XXs4NtAAKEXygHf5FtBF+OPnlpGTjOy9lUV3Ek=;
  b=DrgxYMxdtnyillJ6XrIu0i1zDGujmTaPKHXNCXtCOvm2D3tHQUTudmdc
   K1bjmhOh7ADYbIW5Yrg81hwQTXm8/3GkGHdhDRVUwh4Qi6sbQkCMWTwam
   tOcgTLFcdHfuvhwR8M72QTtkD6iYDOBfBtU4DM+PAoXX4UDbFFmLdj2HY
   68EEJ+pu7HUBH4szKgpB30w+rKFnv0vYAo5d4Te3uyZymjIWvS2FF0dKS
   he6Km6/q0yrpBYuvyNstA36TLZ05eMSZujsdYs9kY3KLv3ytX6JAubZGM
   VmLDUGYJtXlFx2hemyn+eq6o4EQ/BnscN1P8y6v+Sl8HXMi7wRgLjC6yD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360871334"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="360871334"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 02:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="986145636"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="986145636"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2023 02:35:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbe5g-000BBp-0u;
	Thu, 31 Aug 2023 09:35:52 +0000
Date: Thu, 31 Aug 2023 17:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 130/24604]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for
 function 'fsl_easrc_get_status'
Message-ID: <202308311744.ZEfamv81-lkp@intel.com>
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
commit: 4250bc6d7316721784fdb6e47cdb2c37415f6e74 [130/24604] MLK-21940-4: ASoC: fsl_easrc: Support the m2m function
config: s390-randconfig-r012-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311744.ZEfamv81-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311744.ZEfamv81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311744.ZEfamv81-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_easrc.c:7:
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
   In file included from sound/soc/fsl/fsl_easrc.c:7:
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
   In file included from sound/soc/fsl/fsl_easrc.c:7:
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
   22 warnings generated.


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
https://github.com/intel/lkp-tests/wiki
