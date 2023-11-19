Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB6712B75
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWPwwkoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700405347; x=1731941347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tt6Ov9XLz63hHknLV4CK+pTOCg2GFn+DToJVH6+oo3U=;
  b=jWPwwkoob2JeEkGQQgrJyyWoax7lUx22u50BA8dIzh2pQq1KAzQ1qXTQ
   R58/2iCZol4EA/uJLTh5hNtxFRtkq4pp22GHonJB4BXiKTCjVz7AIId6F
   kKDLL2I7QFH3KMfUmT3tLU/pQINCaAq2aMesRydqkPbxlTUqF8ui21B+I
   Mmqc2hQ6SJLi+kPAn4IUNIPLYQJCGWKg7+++YkBylJKZm10ATdQUb8oQB
   um4PYWnIPP7n0rtD/UjAuCrd2zdIG6SAG2J/iIj+UuUh1GrP0A/MBKmRA
   CHve2blr7ollRObOBr6gyw/OTijI+xemjuD4ylJYgsKEFMQRRnqJ8jb1D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4668372"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="4668372"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 06:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1013376143"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="1013376143"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2023 06:49:00 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4j6Y-0005D7-2h;
	Sun, 19 Nov 2023 14:48:58 +0000
Date: Sun, 19 Nov 2023 22:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/decoder/h264_secure_parser.c:933:13:
 warning: format specifies type 'unsigned long' but the argument has type
 'unsigned int'
Message-ID: <202311192201.RDdf0jp2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darren,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3d320fa61172b4a33d1c11e57374cc6880562ae0
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20231119/202311192201.RDdf0jp2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192201.RDdf0jp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192201.RDdf0jp2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/img/vxe-vxd/decoder/h264_secure_parser.c:15:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/img/vxe-vxd/decoder/h264_secure_parser.c:15:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/img/vxe-vxd/decoder/h264_secure_parser.c:15:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/platform/img/vxe-vxd/decoder/h264_secure_parser.c:933:13: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     933 |                                         pr_err("reallocating SGM info from size %lu bytes to size %lu bytes",
         |                                                                                 ~~~
         |                                                                                 %u
     934 |                                                h264_pps_info->h264_ppssgm_info.slicegroupidnum *
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     935 |                                                sizeof(unsigned char),
         |                                                ~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:500:33: note: expanded from macro 'pr_err'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/h264_secure_parser.c:935:13: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     935 |                                         pr_err("reallocating SGM info from size %lu bytes to size %lu bytes",
         |                                                                                                   ~~~
         |                                                                                                   %u
     936 |                                                h264_pps_info->h264_ppssgm_info.slicegroupidnum *
     937 |                                                sizeof(unsigned char),
     938 |                                                (h264_pps_info->pic_size_in_map_unit + 1) *
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     939 |                                                sizeof(unsigned char));
         |                                                ~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:500:33: note: expanded from macro 'pr_err'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   8 warnings generated.
--
   In file included from drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:15:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:15:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:15:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:230:12: warning: stack frame size (1368) exceeds limit (1024) in 'bspp_hevc_unitparser' [-Wframe-larger-than]
     230 | static int bspp_hevc_unitparser(void *swsr_ctx, struct bspp_unit_data *unitdata)
         |            ^
   7 warnings generated.


vim +933 drivers/media/platform/img/vxe-vxd/decoder/h264_secure_parser.c

34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   816  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   817  /*
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   818   * Parse the PPS NAL unit
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   819   */
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   820  static enum bspp_error_type bspp_h264_pps_parser(void *swsr_context,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   821  						 void *str_res,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   822  						 struct bspp_h264_pps_info *h264_pps_info)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   823  {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   824  	int i, group, chroma_format_idc;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   825  	unsigned int number_bits_per_slicegroup_id;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   826  	unsigned char n_scaling_list;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   827  	unsigned char more_rbsp_data;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   828  	unsigned int result;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   829  	enum bspp_error_type pps_parse_error = BSPP_ERROR_NONE;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   830  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   831  	VDEC_ASSERT(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   832  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   833  	h264_pps_info->pps_id = swsr_read_unsigned_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   834  	if (h264_pps_info->pps_id >= MAX_PPS_COUNT) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   835  		pr_err("Picture Parameter Set(PPS) ID is not within the range");
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   836  		h264_pps_info->pps_id = (int)BSPP_INVALID;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   837  		return BSPP_ERROR_UNSUPPORTED;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   838  	}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   839  	h264_pps_info->seq_parameter_set_id = swsr_read_unsigned_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   840  	if (h264_pps_info->seq_parameter_set_id >= MAX_SPS_COUNT) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   841  		pr_err("Sequence Parameter Set(SPS) ID is not within the range");
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   842  		h264_pps_info->seq_parameter_set_id = (int)BSPP_INVALID;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   843  		return BSPP_ERROR_UNSUPPORTED;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   844  	}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   845  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   846  	{
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   847  		/*
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   848  		 * Get the chroma_format_idc from sps. Because of MVC sharing sps and subset sps ids
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   849  		 * (H.7.4.1.2.1).
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   850  		 * At this point is not clear if this pps refers to an sps or a subset sps.
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   851  		 * It should be finehowever for the case of chroma_format_idc to try and locate
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   852  		 * a subset sps if there isn't a normal one.
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   853  		 */
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   854  		struct bspp_h264_seq_hdr_info *h264_seq_hdr_info;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   855  		struct bspp_sequence_hdr_info *seq_hdr_info;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   856  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   857  		seq_hdr_info = bspp_get_sequ_hdr(str_res, h264_pps_info->seq_parameter_set_id);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   858  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   859  		if (!seq_hdr_info) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   860  			seq_hdr_info = bspp_get_sequ_hdr(str_res,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   861  							 h264_pps_info->seq_parameter_set_id + 32);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   862  			if (!seq_hdr_info)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   863  				return BSPP_ERROR_NO_SEQUENCE_HDR;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   864  		}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   865  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   866  		h264_seq_hdr_info =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   867  			(struct bspp_h264_seq_hdr_info *)seq_hdr_info->secure_sequence_info;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   868  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   869  		chroma_format_idc = h264_seq_hdr_info->sps_info.chroma_format_idc;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   870  	}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   871  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   872  	h264_pps_info->entropy_coding_mode_flag = swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   873  	h264_pps_info->pic_order_present_flag = swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   874  	h264_pps_info->num_slice_groups_minus1 = swsr_read_unsigned_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   875  	if ((h264_pps_info->num_slice_groups_minus1 + 1) >
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   876  		MAX_SLICEGROUP_COUNT) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   877  		h264_pps_info->num_slice_groups_minus1 =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   878  			MAX_SLICEGROUP_COUNT - 1;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   879  		pps_parse_error |= BSPP_ERROR_UNRECOVERABLE;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   880  	}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   881  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   882  	if (h264_pps_info->num_slice_groups_minus1 > 0) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   883  		h264_pps_info->slice_group_map_type = swsr_read_unsigned_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   884  		pr_err("slice_group_map_type is : %d, Parsed by BSPP",
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   885  		       h264_pps_info->slice_group_map_type);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   886  		if (h264_pps_info->slice_group_map_type > 6) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   887  			pr_err("slice_group_map_type [%d] is not within the range [ 0- 6 ]",
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   888  			       h264_pps_info->slice_group_map_type);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   889  			       pps_parse_error |= BSPP_ERROR_UNRECOVERABLE;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   890  		}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   891  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   892  		if (h264_pps_info->slice_group_map_type == 0) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   893  			for (group = 0; group <= h264_pps_info->num_slice_groups_minus1; group++) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   894  				h264_pps_info->run_length_minus1[group] =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   895  					swsr_read_unsigned_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   896  			}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   897  		} else if (h264_pps_info->slice_group_map_type == 2) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   898  			for (group = 0; group < h264_pps_info->num_slice_groups_minus1; group++) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   899  				h264_pps_info->top_left[group] = swsr_read_unsigned_expgoulomb
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   900  										(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   901  				h264_pps_info->bottom_right[group] =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   902  					swsr_read_unsigned_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   903  			}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   904  		} else if (h264_pps_info->slice_group_map_type == 3 ||
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   905  			h264_pps_info->slice_group_map_type == 4 ||
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   906  			h264_pps_info->slice_group_map_type == 5) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   907  			h264_pps_info->slice_group_change_direction_flag = swsr_read_bits
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   908  									(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   909  			h264_pps_info->slice_group_change_rate_minus1 =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   910  				swsr_read_unsigned_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   911  		} else if (h264_pps_info->slice_group_map_type == 6) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   912  			h264_pps_info->pic_size_in_map_unit = swsr_read_unsigned_expgoulomb
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   913  										(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   914  			if (h264_pps_info->pic_size_in_map_unit >= H264_MAX_SGM_SIZE) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   915  				pr_err("pic_size_in_map_units_minus1 [%d] is not within the range",
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   916  				       h264_pps_info->pic_size_in_map_unit);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   917  				pps_parse_error |= BSPP_ERROR_UNRECOVERABLE;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   918  			}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   919  			number_bits_per_slicegroup_id = h264ceillog2
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   920  				(h264_pps_info->num_slice_groups_minus1 + 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   921  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   922  			if ((h264_pps_info->pic_size_in_map_unit + 1) >
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   923  				h264_pps_info->h264_ppssgm_info.slicegroupidnum) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   924  				unsigned char *slice_group_id =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   925  					kmalloc(((h264_pps_info->pic_size_in_map_unit + 1) *
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   926  						sizeof(unsigned char)),
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   927  						GFP_KERNEL);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   928  				if (!slice_group_id) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   929  					pr_err("out of memory");
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   930  					pps_parse_error |= BSPP_ERROR_OUT_OF_MEMORY;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   931  				} else {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   932  					pr_err("reallocating SGM info from size %lu bytes to size %lu bytes",
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  @933  					       h264_pps_info->h264_ppssgm_info.slicegroupidnum *
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   934  					       sizeof(unsigned char),
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   935  					       (h264_pps_info->pic_size_in_map_unit + 1) *
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   936  					       sizeof(unsigned char));
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   937  					if (h264_pps_info->h264_ppssgm_info.slice_group_id) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   938  						memcpy
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   939  						(slice_group_id,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   940  						 h264_pps_info->h264_ppssgm_info.slice_group_id,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   941  						 h264_pps_info->h264_ppssgm_info.slicegroupidnum *
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   942  						 sizeof(unsigned char));
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   943  						kfree
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   944  						(h264_pps_info->h264_ppssgm_info.slice_group_id);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   945  					}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   946  					h264_pps_info->h264_ppssgm_info.slicegroupidnum =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   947  						(h264_pps_info->pic_size_in_map_unit + 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   948  					h264_pps_info->h264_ppssgm_info.slice_group_id =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   949  						slice_group_id;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   950  				}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   951  			}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   952  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   953  			VDEC_ASSERT((h264_pps_info->pic_size_in_map_unit + 1) <=
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   954  				h264_pps_info->h264_ppssgm_info.slicegroupidnum);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   955  			for (i = 0; i <= h264_pps_info->pic_size_in_map_unit; i++)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   956  				h264_pps_info->h264_ppssgm_info.slice_group_id[i] =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   957  					swsr_read_bits(swsr_context, number_bits_per_slicegroup_id);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   958  		}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   959  	}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   960  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   961  	for (i = 0; i < H264FW_MAX_REFPIC_LISTS; i++) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   962  		h264_pps_info->num_ref_idx_lx_active_minus1[i] = swsr_read_unsigned_expgoulomb
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   963  										(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   964  		if (h264_pps_info->num_ref_idx_lx_active_minus1[i] >=
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   965  			SL_MAX_REF_IDX) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   966  			pr_err("num_ref_idx_lx_active_minus1[%d] [%d] is not within the range",
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   967  			       i, h264_pps_info->num_ref_idx_lx_active_minus1[i]);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   968  			pps_parse_error |= BSPP_ERROR_UNRECOVERABLE;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   969  		}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   970  	}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   971  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   972  	h264_pps_info->weighted_pred_flag = swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   973  	h264_pps_info->weighted_bipred_idc = swsr_read_bits(swsr_context, 2);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   974  	h264_pps_info->pic_init_qp_minus26 = swsr_read_signed_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   975  	if (h264_pps_info->pic_init_qp_minus26 > 26)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   976  		pr_err("pic_init_qp_minus26[%d] is not within the range [-25 , 26]",
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   977  		       h264_pps_info->pic_init_qp_minus26);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   978  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   979  	h264_pps_info->pic_init_qs_minus26 = swsr_read_signed_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   980  	if (h264_pps_info->pic_init_qs_minus26 > 26)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   981  		pr_err("pic_init_qs_minus26[%d] is not within the range [-25 , 26]",
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   982  		       h264_pps_info->pic_init_qs_minus26);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   983  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   984  	h264_pps_info->chroma_qp_index_offset = swsr_read_signed_expgoulomb(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   985  	if (h264_pps_info->chroma_qp_index_offset > H264_MAX_CHROMA_QP_INDEX_OFFSET)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   986  		h264_pps_info->chroma_qp_index_offset = H264_MAX_CHROMA_QP_INDEX_OFFSET;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   987  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   988  	else if (h264_pps_info->chroma_qp_index_offset < H264_MIN_CHROMA_QP_INDEX_OFFSET)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   989  		h264_pps_info->chroma_qp_index_offset = H264_MIN_CHROMA_QP_INDEX_OFFSET;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   990  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   991  	h264_pps_info->deblocking_filter_control_present_flag = swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   992  	h264_pps_info->constrained_intra_pred_flag = swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   993  	h264_pps_info->redundant_pic_cnt_present_flag = swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   994  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   995  	/* Check for more rbsp data. */
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   996  	result = swsr_check_more_rbsp_data(swsr_context, &more_rbsp_data);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   997  	if (result == 0 && more_rbsp_data) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   998  #ifdef DEBUG_DECODER_DRIVER
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25   999  		pr_info("More RBSP data is available");
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1000  #endif
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1001  		/* Fidelity Range Extensions Stuff */
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1002  		h264_pps_info->transform_8x8_mode_flag = swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1003  		h264_pps_info->pic_scaling_matrix_present_flag = swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1004  		if (h264_pps_info->pic_scaling_matrix_present_flag) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1005  			if (!h264_pps_info->scllst4x4pic) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1006  				h264_pps_info->scllst4x4pic =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1007  					kmalloc((sizeof(unsigned char[H264FW_NUM_4X4_LISTS]
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1008  								[H264FW_4X4_SIZE])), GFP_KERNEL);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1009  				if (!h264_pps_info->scllst4x4pic) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1010  					pps_parse_error |= BSPP_ERROR_OUT_OF_MEMORY;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1011  				} else {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1012  					VDEC_ASSERT(h264_pps_info->scllst4x4pic);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1013  					memset(h264_pps_info->scllst4x4pic, 0x00,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1014  					       sizeof(unsigned char[H264FW_NUM_4X4_LISTS]
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1015  					       [H264FW_4X4_SIZE]));
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1016  				}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1017  			}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1018  			if (!h264_pps_info->scllst8x8pic) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1019  				h264_pps_info->scllst8x8pic =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1020  					kmalloc((sizeof(unsigned char[H264FW_NUM_8X8_LISTS]
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1021  								[H264FW_8X8_SIZE])), GFP_KERNEL);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1022  				if (!h264_pps_info->scllst8x8pic) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1023  					pps_parse_error |= BSPP_ERROR_OUT_OF_MEMORY;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1024  				} else {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1025  					VDEC_ASSERT(h264_pps_info->scllst8x8pic);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1026  					memset(h264_pps_info->scllst8x8pic, 0x00,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1027  					       sizeof(unsigned char[H264FW_NUM_8X8_LISTS]
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1028  					       [H264FW_8X8_SIZE]));
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1029  				}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1030  			}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1031  		{
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1032  			unsigned char(*scllst4x4pic)[H264FW_NUM_4X4_LISTS][H264FW_4X4_SIZE] =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1033  					(unsigned char (*)[H264FW_NUM_4X4_LISTS][H264FW_4X4_SIZE])
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1034  					h264_pps_info->scllst4x4pic;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1035  			unsigned char(*scllst8x8pic)[H264FW_NUM_8X8_LISTS][H264FW_8X8_SIZE] =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1036  					(unsigned char (*)[H264FW_NUM_8X8_LISTS][H264FW_8X8_SIZE])
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1037  					h264_pps_info->scllst8x8pic;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1038  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1039  			/*
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1040  			 * For chroma_format =3 (YUV444) total list would be 12
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1041  			 * if transform_8x8_mode_flag is enabled else  6.
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1042  			 */
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1043  			n_scaling_list = 6 + (chroma_format_idc != 3 ? 2 : 6) *
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1044  				h264_pps_info->transform_8x8_mode_flag;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1045  			if (n_scaling_list > 12)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1046  				pps_parse_error |= BSPP_ERROR_UNRECOVERABLE;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1047  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1048  			VDEC_ASSERT(h264_pps_info->scllst4x4pic);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1049  			VDEC_ASSERT(h264_pps_info->scllst8x8pic);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1050  			for (i = 0; i < n_scaling_list; i++) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1051  				unsigned char *ptr =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1052  					&h264_pps_info->usedefaultscalingmatrixflag_pic[i];
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1053  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1054  				h264_pps_info->pic_scaling_list_present_flag[i] =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1055  					swsr_read_bits(swsr_context, 1);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1056  				if (h264_pps_info->pic_scaling_list_present_flag[i]) {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1057  					if (i < 6)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1058  						pps_parse_error |=
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1059  							bspp_h264_scl_listparser
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1060  							(swsr_context,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1061  							 (*scllst4x4pic)[i], 16, ptr);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1062  					else
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1063  						pps_parse_error |=
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1064  							bspp_h264_scl_listparser
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1065  							(swsr_context,
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1066  							(*scllst8x8pic)[i - 6], 64, ptr);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1067  				}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1068  			}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1069  		}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1070  		}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1071  		h264_pps_info->second_chroma_qp_index_offset = swsr_read_signed_expgoulomb
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1072  										(swsr_context);
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1073  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1074  		if (h264_pps_info->second_chroma_qp_index_offset > H264_MAX_CHROMA_QP_INDEX_OFFSET)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1075  			h264_pps_info->second_chroma_qp_index_offset =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1076  				H264_MAX_CHROMA_QP_INDEX_OFFSET;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1077  		else if (h264_pps_info->second_chroma_qp_index_offset <
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1078  			H264_MIN_CHROMA_QP_INDEX_OFFSET)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1079  			h264_pps_info->second_chroma_qp_index_offset =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1080  				H264_MIN_CHROMA_QP_INDEX_OFFSET;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1081  	} else {
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1082  		h264_pps_info->second_chroma_qp_index_offset =
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1083  			h264_pps_info->chroma_qp_index_offset;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1084  	}
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1085  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1086  	if (swsr_check_exception(swsr_context) != SWSR_EXCEPT_NO_EXCEPTION)
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1087  		pps_parse_error |= BSPP_ERROR_INSUFFICIENT_DATA;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1088  
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1089  	return pps_parse_error;
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1090  }
34cb933124fa2f drivers/media/platform/vxe-vxd/decoder/h264_secure_parser.c Sidraya 2023-04-25  1091  

:::::: The code at line 933 was first introduced by commit
:::::: 34cb933124fa2f5fc234734bdc2eb03dbf2139b5 v4l: vxd-dec: Add Bistream Preparser (BSPP) module for H264.

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
