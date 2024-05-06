Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327E7181
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 02:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714962852; cv=none; b=Pe71zaQsXH3LDBFB8Q9LzwMVJ5H3JcJolwhm76Fhdv7IAsVzUUmz3axtA6jVNPHqBgbrKh59oPVus9YnQxiydGi8JqzMn8gbKZQHxjZ/kZnJZY8Uz3uBWP+keTSkNKtVTcKnh11H80XcptBz/0IElvfnDFAW8QAYwSN5lByJUfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714962852; c=relaxed/simple;
	bh=xY7E/U6+KE+3wggbHQC0TYHpu6ORo/rwlWR2IVMvPNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o97yrYuQXfSTNAPhikbjU/I1fMMaTlgBvKY0yFHFpTox9bbXeNkynIEM2ODvfzL2w4QnxwrIhQSWSa/HpTJj2A4/hiskuxg0H2Q7K/IGbBqqfErX38/FRlQ7D2pAXYT6hiiMFRB2hsYuCvgzb/uarBK9fRtMklxQaAIk8egcM4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cqxv2ZwI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cqxv2ZwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714962850; x=1746498850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xY7E/U6+KE+3wggbHQC0TYHpu6ORo/rwlWR2IVMvPNg=;
  b=Cqxv2ZwI57dg3ClPUPWLLR4Cw5b4WchWe2PnQ81pk8snZ14SLaBtgvWX
   qcH3q90sJvF7pCdUOuPUve2Sd9xSywVjJ8Y3M+aaTSkwWZNEtvZtA8sOO
   r+Zx0fZtK4aDYboR15u9lKYsWYKWsZBs0rzUGpQawJMiCHmhZYsIn/Fzt
   jUvHx4Z6vWVoScY2u5xXt2tTaKbzxEuhSXHR8NWhdVMO2ORPWRDOnnuxq
   gmRR0RYUph1Jc7/ezgL4Y0yNvn6muUz1KQrs3KyxcbRaFNNvuizVf2GLx
   yluRAEeJZwX1IS7jYBOSvj4cBbAvttJrKIilj2eLVT6YRE9177E36oU4j
   A==;
X-CSE-ConnectionGUID: UcTGvbkHSCS9r/sMx09qhA==
X-CSE-MsgGUID: hfHgFbXDSDKft8QoV6WH+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14478069"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14478069"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 19:34:09 -0700
X-CSE-ConnectionGUID: SElgJsQXRRm6Y5OfqVyfIg==
X-CSE-MsgGUID: 0g9S4CEcSoephzrauQnwdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="65453150"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2024 19:34:08 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3oB3-0000OC-1S;
	Mon, 06 May 2024 02:34:05 +0000
Date: Mon, 6 May 2024 10:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1270/30000]
 drivers/video/fbdev/mxc/mipi_dsi_northwest.c:717:7: warning: variable
 'color_coding' is used uninitialized whenever switch case is taken
Message-ID: <202405061000.ysnpgb75-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: 53b409327c6b9468f2c8c306a2b833e8fa3035be [1270/30000] video: fbdev: mxc: add Northwest Logic DSI driver support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405061000.ysnpgb75-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061000.ysnpgb75-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061000.ysnpgb75-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/mxc/mipi_dsi_northwest.c:33:
   In file included from include/uapi/linux/mxcfb.h:31:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:12:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:337:11: warning: variable 'pkt_control' set but not used [-Wunused-but-set-variable]
     337 |         uint32_t pkt_control;
         |                  ^
>> drivers/video/fbdev/mxc/mipi_dsi_northwest.c:717:7: warning: variable 'color_coding' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     717 |         case 16:
         |              ^~
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:722:9: note: uninitialized use occurs here
     722 |         writel(color_coding, mipi_dsi->mmio_base + DPI_INTERFACE_COLOR_CODING);
         |                ^~~~~~~~~~~~
   arch/arm64/include/asm/io.h:142:52: note: expanded from macro 'writel'
     142 | #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
         |                                                               ^
   arch/arm64/include/asm/io.h:127:74: note: expanded from macro 'writel_relaxed'
     127 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
         |                                                                              ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from macro '__cpu_to_le32'
      33 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:718:7: warning: variable 'color_coding' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     718 |         case 18:
         |              ^~
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:722:9: note: uninitialized use occurs here
     722 |         writel(color_coding, mipi_dsi->mmio_base + DPI_INTERFACE_COLOR_CODING);
         |                ^~~~~~~~~~~~
   arch/arm64/include/asm/io.h:142:52: note: expanded from macro 'writel'
     142 | #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
         |                                                               ^
   arch/arm64/include/asm/io.h:127:74: note: expanded from macro 'writel_relaxed'
     127 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
         |                                                                              ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from macro '__cpu_to_le32'
      33 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
>> drivers/video/fbdev/mxc/mipi_dsi_northwest.c:719:2: warning: variable 'color_coding' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     719 |         default:
         |         ^~~~~~~
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:722:9: note: uninitialized use occurs here
     722 |         writel(color_coding, mipi_dsi->mmio_base + DPI_INTERFACE_COLOR_CODING);
         |                ^~~~~~~~~~~~
   arch/arm64/include/asm/io.h:142:52: note: expanded from macro 'writel'
     142 | #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
         |                                                               ^
   arch/arm64/include/asm/io.h:127:74: note: expanded from macro 'writel_relaxed'
     127 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
         |                                                                              ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from macro '__cpu_to_le32'
      33 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:670:28: note: initialize the variable 'color_coding' to silence this warning
     670 |         uint32_t bpp, color_coding, pixel_fmt;
         |                                   ^
         |                                    = 0
>> drivers/video/fbdev/mxc/mipi_dsi_northwest.c:717:7: warning: variable 'pixel_fmt' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     717 |         case 16:
         |              ^~
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:723:9: note: uninitialized use occurs here
     723 |         writel(pixel_fmt, mipi_dsi->mmio_base + DPI_PIXEL_FORMAT);
         |                ^~~~~~~~~
   arch/arm64/include/asm/io.h:142:52: note: expanded from macro 'writel'
     142 | #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
         |                                                               ^
   arch/arm64/include/asm/io.h:127:74: note: expanded from macro 'writel_relaxed'
     127 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
         |                                                                              ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from macro '__cpu_to_le32'
      33 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:718:7: warning: variable 'pixel_fmt' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     718 |         case 18:
         |              ^~
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:723:9: note: uninitialized use occurs here
     723 |         writel(pixel_fmt, mipi_dsi->mmio_base + DPI_PIXEL_FORMAT);
         |                ^~~~~~~~~
   arch/arm64/include/asm/io.h:142:52: note: expanded from macro 'writel'
     142 | #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
         |                                                               ^
   arch/arm64/include/asm/io.h:127:74: note: expanded from macro 'writel_relaxed'
     127 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
         |                                                                              ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from macro '__cpu_to_le32'
      33 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
>> drivers/video/fbdev/mxc/mipi_dsi_northwest.c:719:2: warning: variable 'pixel_fmt' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     719 |         default:
         |         ^~~~~~~
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:723:9: note: uninitialized use occurs here
     723 |         writel(pixel_fmt, mipi_dsi->mmio_base + DPI_PIXEL_FORMAT);
         |                ^~~~~~~~~
   arch/arm64/include/asm/io.h:142:52: note: expanded from macro 'writel'
     142 | #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
         |                                                               ^
   arch/arm64/include/asm/io.h:127:74: note: expanded from macro 'writel_relaxed'
     127 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
         |                                                                              ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from macro '__cpu_to_le32'
      33 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/video/fbdev/mxc/mipi_dsi_northwest.c:670:39: note: initialize the variable 'pixel_fmt' to silence this warning
     670 |         uint32_t bpp, color_coding, pixel_fmt;
         |                                              ^
         |                                               = 0
   12 warnings generated.


vim +/color_coding +717 drivers/video/fbdev/mxc/mipi_dsi_northwest.c

   667	
   668	static int mipi_dsi_dpi_init(struct mipi_dsi_info *mipi_dsi)
   669	{
 > 670		uint32_t bpp, color_coding, pixel_fmt;
   671		uint32_t pixel_fifo_level, hfp_period, hbp_period, hsa_period;
   672		struct fb_videomode *mode = mipi_dsi->mode;
   673		struct mipi_lcd_config *lcd_config = mipi_dsi->lcd_config;
   674	
   675		bpp = fmt_to_bpp(lcd_config->dpi_fmt);
   676	
   677		writel(mode->xres, mipi_dsi->mmio_base + DPI_PIXEL_PAYLOAD_SIZE);
   678	
   679		switch (mipi_dsi->traffic_mode) {
   680		case DSI_NON_BURST_WITH_SYNC_PULSE:
   681	#ifdef CONFIG_FB_IMX64
   682			pixel_fifo_level = 8;
   683			hfp_period = mode->right_margin - DSI_HFP_PKT_OVERHEAD;
   684			hbp_period = mode->left_margin  - DSI_HBP_PKT_OVERHEAD;
   685			hsa_period = mode->hsync_len - DSI_HSA_PKT_OVERHEAD;
   686	#else
   687			pixel_fifo_level = mode->xres;
   688			hfp_period = 0x10;
   689			hbp_period = 0x60;
   690			hsa_period = 0xf0;
   691	#endif
   692			break;
   693		case DSI_BURST_MODE:
   694			pixel_fifo_level = mode->xres;
   695	#ifdef CONFIG_FB_IMX64
   696			hfp_period = mode->right_margin;
   697			hbp_period = mode->left_margin;
   698			hsa_period = mode->hsync_len;
   699	#else
   700			hfp_period = mode->right_margin * (bpp >> 3);
   701			hbp_period = mode->left_margin * (bpp >> 3);
   702			hsa_period = mode->hsync_len * (bpp >> 3);
   703	#endif
   704			break;
   705		default:
   706			pr_debug("unsupport traffic mode: %d\n",
   707				 mipi_dsi->traffic_mode);
   708			return -EINVAL;
   709		}
   710		writel(pixel_fifo_level, mipi_dsi->mmio_base + DPI_PIXEL_FIFO_SEND_LEVEL);
   711	
   712		switch (bpp) {
   713		case 24:
   714			color_coding = 5;
   715			pixel_fmt = 3;
   716			break;
 > 717		case 16:
   718		case 18:
 > 719		default:
   720			break;
   721		}
   722		writel(color_coding, mipi_dsi->mmio_base + DPI_INTERFACE_COLOR_CODING);
   723		writel(pixel_fmt, mipi_dsi->mmio_base + DPI_PIXEL_FORMAT);
   724	#ifdef CONFIG_FB_IMX64
   725		writel(0x1, mipi_dsi->mmio_base + DPI_VSYNC_POLARITY);
   726		writel(0x1, mipi_dsi->mmio_base + DPI_HSYNC_POLARITY);
   727	#else
   728		writel(0x0, mipi_dsi->mmio_base + DPI_VSYNC_POLARITY);
   729		writel(0x0, mipi_dsi->mmio_base + DPI_HSYNC_POLARITY);
   730	#endif
   731		writel(mipi_dsi->traffic_mode,
   732		       mipi_dsi->mmio_base + DPI_VIDEO_MODE);
   733	
   734		writel(hfp_period, mipi_dsi->mmio_base + DPI_HFP);
   735		writel(hbp_period, mipi_dsi->mmio_base + DPI_HBP);
   736		writel(hsa_period, mipi_dsi->mmio_base + DPI_HSA);
   737	
   738		writel(0x0, mipi_dsi->mmio_base + DPI_ENABLE_MULT_PKTS);
   739	
   740		writel(mode->upper_margin, mipi_dsi->mmio_base + DPI_VBP);
   741		writel(mode->lower_margin, mipi_dsi->mmio_base + DPI_VFP);
   742		writel(0x1, mipi_dsi->mmio_base + DPI_BLLP_MODE);
   743		writel(0x0, mipi_dsi->mmio_base + DPI_USE_NULL_PKT_BLLP);
   744	
   745		writel(mode->yres - 1, mipi_dsi->mmio_base + DPI_VACTIVE);
   746	
   747		writel(0x0, mipi_dsi->mmio_base + DPI_VC);
   748	
   749		return 0;
   750	}
   751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
